Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id DD2C060EEB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 01:49:50 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id hz10so1872007pad.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 18:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=63iwqazZsYtrk/No9gIvOaLTPGrIKSkYZBfX0U8Si6o=;
	b=PwAoJaMUYLkYNEhJ3e6ClGtJcdUE/FOV4K9Smx5XIE9mTY5Uca3STAPVNnfhMVaD7o
	SqfEggudjb3Q9RpvYtqrXp95+mGP8rAzMURbsc5uQM/a49XQUi5QNF3mF6G3rWQMtI6r
	jQCf9dBGDM2tEfAALb1gulCDCaHetMuKNSrAoEygjEP+kw1x/qj8xX97+jw5oIjRtycF
	Y5Nue3Bdzj5+XvFPB9o3KE0zYqyYTjNmiK1T6EMsbLHoUBXtVjdM+53AGeKY4R3VV9pb
	poki19hRAjRHbAfp5JJSHcHURTs9m14auZoUOEfj20nXeSOIz0Fz2lve2zsgDLvz3NM1
	ZGZQ==
X-Received: by 10.67.30.164 with SMTP id kf4mr12565217pad.13.1379036992680;
	Thu, 12 Sep 2013 18:49:52 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id xv2sm1936161pbb.39.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 12 Sep 2013 18:49:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Sep 2013 18:48:33 -0700
Message-Id: <1379036913-5917-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.4
Subject: [PATCH] eglibc_2.18.bb: Fix IFUNC support for ARM REL relocations
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Sep 2013 01:49:51 -0000

This should fix the case where neon code is emitted for machines
which dont have neon unit in the chip

[YOCTO# 5161]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-ARM-Pass-dl_hwcap-to-IFUNC-resolver.patch | 43 ++++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc_2.18.bb            |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.18/0001-ARM-Pass-dl_hwcap-to-IFUNC-resolver.patch

diff --git a/meta/recipes-core/eglibc/eglibc-2.18/0001-ARM-Pass-dl_hwcap-to-IFUNC-resolver.patch b/meta/recipes-core/eglibc/eglibc-2.18/0001-ARM-Pass-dl_hwcap-to-IFUNC-resolver.patch
new file mode 100644
index 0000000..24d4772
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.18/0001-ARM-Pass-dl_hwcap-to-IFUNC-resolver.patch
@@ -0,0 +1,43 @@
+Upstream-Status: Backport
+
+From d0721e703d222c01a9e8c329311c4fb01dac6972 Mon Sep 17 00:00:00 2001
+From: Carlos O'Donell <carlos@redhat.com>
+Date: Thu, 29 Aug 2013 00:17:33 -0400
+Subject: [PATCH] ARM: Pass dl_hwcap to IFUNC resolver.
+
+For REL relocs pass dl_hwcap to the IFUNC resolver
+as is required by the IFUNC API (bug 15905).
+---
+ NEWS                           | 2 +-
+ ports/ChangeLog.arm            | 7 +++++++
+ ports/sysdeps/arm/dl-machine.h | 2 +-
+ 3 files changed, 9 insertions(+), 2 deletions(-)
+
+Index: libc/ports/ChangeLog.arm
+===================================================================
+--- libc.orig/ports/ChangeLog.arm	2013-07-14 16:08:52.000000000 -0700
++++ libc/ports/ChangeLog.arm	2013-09-12 17:17:24.174387150 -0700
+@@ -1,3 +1,10 @@
++2013-08-28  Kyle McMartin  <kyle@redhat.com>
++	    Carlos O'Donell  <carlos@redhat.com>
++
++	[BZ #15905]
++	* sysdeps/arm/dl-machine [!RTLD_BOOTSTRAP] (elf_machine_rel):
++	Pass GLRO(dl_hwcap) to the IFUNC resolver.
++
+ 2013-07-03  Joseph Myers  <joseph@codesourcery.com>
+ 
+ 	* sysdeps/arm/include/bits/setjmp.h [_ISOMAC] (JMP_BUF_REGLIST):
+Index: libc/ports/sysdeps/arm/dl-machine.h
+===================================================================
+--- libc.orig/ports/sysdeps/arm/dl-machine.h	2013-09-12 08:56:03.641743520 -0700
++++ libc/ports/sysdeps/arm/dl-machine.h	2013-09-12 17:17:24.174387150 -0700
+@@ -503,7 +503,7 @@
+ 	  break;
+ 	case R_ARM_IRELATIVE:
+ 	  value = map->l_addr + *reloc_addr;
+-	  value = ((Elf32_Addr (*) (void)) value) ();
++	  value = ((Elf32_Addr (*) (int)) value) (GLRO(dl_hwcap));
+ 	  *reloc_addr = value;
+ 	  break;
+ #endif
diff --git a/meta/recipes-core/eglibc/eglibc_2.18.bb b/meta/recipes-core/eglibc/eglibc_2.18.bb
index 17b651f..710b498 100644
--- a/meta/recipes-core/eglibc/eglibc_2.18.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.18.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr23
            file://tzselect-awk.patch \
            file://0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch \
            file://fix-tibetian-locales.patch \
+           file://0001-ARM-Pass-dl_hwcap-to-IFUNC-resolver.patch \
           "
 SRC_URI[md5sum] = "b395b021422a027d89884992e91734fc"
 SRC_URI[sha256sum] = "15f564b45dc5dd65faf0875579e3447961ae61e876933384ae05d19328539ad4"
-- 
1.8.4


