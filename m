Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RSaUp-0008DE-Br
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Nov 2011 21:29:44 +0100
Received: by iahk25 with SMTP id k25so7734730iah.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2011 12:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Nj4qG2oiQqillSACWg9IaAyzRuZhTbRDIahwVnHS1s4=;
	b=q3HUs4+p+AKzSzNH4TSxBvx4DG4uY/pvUblllBZTX6mEChEnWE1VwEBeB/E9G7d3+j
	xCpROQZ29rg8ZTLlxn9xZiARBzzgCslRbP4yy33vwszy8Q2E2i01kkQSMH6Vkf3cHaDU
	1/+C6/c94+iJBCqLp2jGaMgLRv1XoEsF1NIBo=
Received: by 10.231.70.7 with SMTP id b7mr3740855ibj.49.1321906985941;
	Mon, 21 Nov 2011 12:23:05 -0800 (PST)
Received: from localhost.localdomain (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id eb23sm50246133ibb.2.2011.11.21.12.23.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Nov 2011 12:23:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Nov 2011 12:23:00 -0800
Message-Id: <1321906980-16016-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] alsa-lib: Unbreak native build when using TCLIBC=uclibc
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
X-List-Received-Date: Mon, 21 Nov 2011 20:29:44 -0000

A recent change introduced EXTRA_OECONF_append_libc-uclibc = "
--with-versioned=no " this change has a side effect when
building alsa-lib-native using TCLIBC=uclibc the override
kicks in uninvited and hence build the native package without symbol
version information. This mean libasound.so which is needed by other
packages from build host e.g. libSDL.so does not have required symbols
and linking with libSDL fails, one such case ends in SDL support
in qemu-native being silently disabled.

We make sure that override is only enabled for target recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb
index 83e663d..fa96998 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb
@@ -14,7 +14,7 @@ BBCLASSEXTEND = "native nativesdk"
 #FIXME: remove the following
 ARM_INSTRUCTION_SET = "arm"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/alsa-lib-${PV}.tar.bz2 \
            file://fix-tstamp-declaration.patch"
@@ -27,10 +27,12 @@ inherit autotools pkgconfig
 require alsa-fpu.inc
 EXTRA_OECONF += "${@get_alsa_fpu_setting(bb, d)} "
 
-EXTRA_OECONF = "--with-cards=pdaudiocf --with-oss=yes --disable-python"
-
-EXTRA_OECONF_append_libc-uclibc = " --with-versioned=no "
+EXTRA_OECONF = "--with-cards=pdaudiocf --with-oss=yes --disable-python ${VERSIONEDSYMS}"
 
+VERSIONEDSYMS = ""
+VERSIONEDSYMS_libc-uclibc = "--with-versioned=no"
+VERSIONEDSYMS_virtclass-native = ""
+VERSIONEDSYMS_virtclass-nativesdk = ""
 PKGSUFFIX = ""
 PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
 
-- 
1.7.5.4



