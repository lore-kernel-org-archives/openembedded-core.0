Received: from mail-da0-f52.google.com ([209.85.210.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TzMNj-0001Wk-Dn
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Jan 2013 08:10:23 +0100
Received: by mail-da0-f52.google.com with SMTP id f10so771103dak.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2013 22:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=X6+/RMrQbmbHUwiRoPa1kVA71qZfuF2XBZQzZ9v7aAY=;
	b=a5p0NBYxgb4jO70P9THw68gKvsEH/jOT1hRswZelBKI254SOYFUouF/iR7abM35Y2p
	o1TIXQmFppWgJs99IB8Rb+KScXONzYCe86rP9qLrCruFgwxswPV47iEQXnMlBoedF70c
	y6U309dU+CuOflI25eTT3JGhtK6+BcP/pEg8BDqDdSxU8V1Vv0tlG27LaYH984vzD+if
	MNBkzNeF1zgNzSn3NckWmiGN8ygziJCxuEan4qz5AZdgdeZRrW2hSMSf+PEIM9+eVBU/
	OltxX7cv0MHUlTojjXL3FkvEvQK1ggV5JohekvsGKoEtwgacpMpED59U3x34v3o9PuZy
	Vh8A==
X-Received: by 10.68.241.103 with SMTP id wh7mr27690242pbc.153.1359269685823; 
	Sat, 26 Jan 2013 22:54:45 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id s5sm4225998pay.31.2013.01.26.22.54.44
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 26 Jan 2013 22:54:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org,
	dvhart@linux.intel.com
Date: Sat, 26 Jan 2013 22:54:25 -0800
Message-Id: <1359269665-1843-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] module-base.bbclass: Call make instead of oe_runmake in do_make_scripts
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
X-List-Received-Date: Sun, 27 Jan 2013 07:10:23 -0000

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



