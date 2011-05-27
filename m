Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QPpyD-0002mV-4P
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 07:52:25 +0200
Received: by pzk36 with SMTP id 36so663225pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2011 22:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=GIHB1JvYeN6gzLKpoo5THMu5AlFGrwBreaKtJLXNEN8=;
	b=caIaRSpSPe2jIIE1aqmPX3DnaA3GnnhO+7MirUxKHF5Ik80rYzGpcibEzN6vtzhfcl
	JVGz21A8rZP814s1CdrV7gMwycFuCj6yy2uehUwFSYtoKi6/JLEvDjh+ZcAPXUGabsMJ
	M12FMGd+K5CWDjqfaUvFiylrVbomng7KNz5Bo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=GM6UEDnQeG9HDVqfp5m6XMue2i83H6j2GvQPtLQCAGGjA9YDPi5psFA1+NfKmYWASS
	J5lKqcAcQF9DkahyocosaZ1X/NiCASCGtdcuwTcBpVnd+aGkmdHhCh+aoP4MUQgxsS5B
	mwnoyYzLrZjolcIX9f5LJYAUF0AnvRwgblZUk=
Received: by 10.68.58.35 with SMTP id n3mr740420pbq.150.1306475360022;
	Thu, 26 May 2011 22:49:20 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x1sm237666pbb.34.2011.05.26.22.49.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 May 2011 22:49:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 26 May 2011 22:49:11 -0700
Message-Id: <eb67bc85d9f10a564ee206a9c2d5b6f25edf157a.1306475241.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <6148af9a1476623e4df7e5965de787c8b73792c0.1306475241.git.raj.khem@gmail.com>
References: <6148af9a1476623e4df7e5965de787c8b73792c0.1306475241.git.raj.khem@gmail.com>
In-Reply-To: <cover.1306475241.git.raj.khem@gmail.com>
References: <cover.1306475241.git.raj.khem@gmail.com>
Subject: [PATCH 2/3] uclibc.inc: Set COMPILE_IN_THUMB_MODE in .config if ARM_INSTRUCTION_SET != arm
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 May 2011 05:52:25 -0000

This will configure uclibc to be compiled in thumb/thumb2 mode

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index e7d8846..c1bc422 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -135,6 +135,7 @@ configmangle = '/^KERNEL_HEADERS/d; \
                 /^SHARED_LIB_LOADER_PREFIX/d; \
                 /^UCLIBC_EXTRA_CFLAGS/d; \
                 s,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g; \
+                ${@["","s,.*COMPILE_IN_THUMB_MODE.*,COMPILE_IN_THUMB_MODE=y,;"][bb.data.getVar("ARM_INSTRUCTION_SET", d, 1) != "arm"]} \
                 ${@["","s,.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y,;"][bb.data.getVar("USE_NLS", d, 1) == "yes"]} \
                 ${@["","s,.*LDSO_GNU_HASH_SUPPORT.*,# LDSO_GNU_HASH_SUPPORT is not set,;"][bb.data.getVar("TARGET_ARCH", d, 1) in ['mips', 'mipsel', 'mips64', 'mips64el', 'avr32']]} \
                 /^CROSS/d; \
-- 
1.7.4.1



