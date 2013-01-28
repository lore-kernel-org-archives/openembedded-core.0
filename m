Received: from mail-pb0-f44.google.com ([209.85.160.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Tzv5x-0005rE-7h
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 21:14:24 +0100
Received: by mail-pb0-f44.google.com with SMTP id wz12so602362pbc.31
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2013 11:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=X6+/RMrQbmbHUwiRoPa1kVA71qZfuF2XBZQzZ9v7aAY=;
	b=jSaACp1HiYWydYir4hY3MmZf89vGokklwbfah/DHvMpGKtl6upioG5ZUNS+qJyHQPn
	95UsG7g1MajSiABjkmWaYtdP+Jo5XzTwAST7SMcKpSz0EkMuovcqy312Q9kOf2FkRFBc
	pmwy2b9JJNHaz2s1NZhQMUQgjgmnLMC7EjqrPAQb1eSsC9LFQDOHKp9eBhbhqVdywPLb
	Jg4ZgVLCzGkkurz+aJTw8aKAy1H6uijcapv/G/3VBnF5yyCw7a08LrV2disjQhACzIHT
	YDsnUnpGU5WGym2NI52kt2LOuKnKgcunQg7j4jpcjOVAv3pca7LRd14J7V6/3axfo4gP
	Mg2w==
X-Received: by 10.68.193.199 with SMTP id hq7mr39993562pbc.3.1359403121847;
	Mon, 28 Jan 2013 11:58:41 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id bg6sm7306579pab.33.2013.01.28.11.58.40
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 11:58:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2013 11:58:28 -0800
Message-Id: <b7d095069a03ebacf3fcb210885e7e7bc14a2e33.1359402980.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <9496d315c6d89dd6e4147cbdfd7b974fa4ed1d43.1359402980.git.raj.khem@gmail.com>
References: <9496d315c6d89dd6e4147cbdfd7b974fa4ed1d43.1359402980.git.raj.khem@gmail.com>
In-Reply-To: <cover.1359402980.git.raj.khem@gmail.com>
References: <cover.1359402980.git.raj.khem@gmail.com>
Subject: [PATCH 3/3] module-base.bbclass: Call make instead of oe_runmake in do_make_scripts
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jan 2013 20:14:33 -0000

This makes the external module compilation a bit more robust for
cases where external module recipes may be passing extra params
to make via EXTRA_OEMAKE, and more that often one needs to pass
M=$(PWD) when building external modules and if we use EXTRA_OEMAKE
that would mean that it would appear in do_make_scripts as well
and since we are only changing the reference kernel src tree here
it will not run the make scripts in desired directory.

It is also well explained in top makefile in kernel tree around
line# 1335 in 3.4

|else # KBUILD_EXTMOD
|
|###
|# External module support.
|# When building external modules the kernel used as basis is considered
|# read-only, and no consistency checks are made and the make
|# system is not used on the basis kernel. If updates are required
|# in the basis kernel ordinary make commands (without M=...) must
|# be used.

Therefore passing  M=... will not do the updates in the basis
kernel as expected with 'make scripts' so we have to bypass EXTRA_OEMAKE

[Yocto #3787]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/module-base.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
index cfee50a..9dbb4b4 100644
--- a/meta/classes/module-base.bbclass
+++ b/meta/classes/module-base.bbclass
@@ -18,6 +18,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 #
 do_make_scripts() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS 
-	oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
+	make CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
 	           -C ${STAGING_KERNEL_DIR} scripts
 }
-- 
1.7.9.5



