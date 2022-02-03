Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF78EC433FE
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 16:52:11 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.285.1643907130985895200
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 08:52:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OmGiQgcn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id e8so6307418wrc.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 08:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/Z9kKwgYCspnSrJNGuUqn6nWSCgDCOpQ99SAc70SC2k=;
        b=OmGiQgcnGTbXVXL3jKzhYZP/eLW1Mut5NpApxqOUXMXqhvFeHVtG/NDYeKAsNkAa2Y
         agcbwvUV5KpRawAX7lqbVZMb5pm+fn8LBPPIZPUV+cHcANNN3RnHM9EdNOGFPPVsL4JM
         IFpHfR7Rzi1FWodL6tAZV6F+M14KG+yWi4uuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/Z9kKwgYCspnSrJNGuUqn6nWSCgDCOpQ99SAc70SC2k=;
        b=eYSLEXb8wuiKyYkkb0Wb1xtuslkmy8l3/bJMevS2bIEJn0ENH+gXmATMkBmDO5d2NM
         N85pZfeQMg0dmYaYLXQrGVS6J6H37kYqfa7itz2ck/tx+OYdALitHMxT+bAbaxLgyoY2
         2NJOxizBiy1c6mZS85aOpWKBRP4gCNRGtI5piCgv1qLEk7OYlI+Tgp63ws73/s1OFBh2
         2aWPPUbnu+xeV0Q9wbXt7xGzZKxXKgBVmsLdXJHjrC1qV5kB5PZ8XQE1pnvf0Lggl5ow
         HzMFEMhghD87FqoT9ItVW0qh36LXHqi0syOZ3S3EKRbrV/a8EksbASUWdSfqf93qqM1T
         Z3GQ==
X-Gm-Message-State: AOAM530adswLkEySB8eND/5K0lB6Fb+7sCTGpe8TQIkUsv+RZ342Mib7
	cCeEyvQr7g0YEegaf0+S3QQwvPTPZGxweg==
X-Google-Smtp-Source: 
 ABdhPJzE3NHv+sUYSHxySlwxkm4wKP+h/96oIzinnnCboYON7gO6fCG0diEipAkW/JRgJ7PoLdE/YA==
X-Received: by 2002:a5d:67cd:: with SMTP id
 n13mr30559558wrw.351.1643907128568;
        Thu, 03 Feb 2022 08:52:08 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e772:7635:2207:1103])
        by smtp.gmail.com with ESMTPSA id
 i13sm21089185wrf.3.2022.02.03.08.52.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 08:52:08 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] prelink: Drop support for it
Date: Thu,  3 Feb 2022 16:52:06 +0000
Message-Id: <20220203165207.2401847-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 16:52:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161290

Prelink is being dropped by glibc in 2.36. It already causes issues with
binary corruption, has a number of open bugs and is of questionable benefit
without disabling load address randomization and PIE executables.

We disabled it by default a while back but left people able to use it.
We would be unable to maintain it alone without glibc support so remove
the remaining pieces.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/maintainers.inc      |   1 -
 meta/lib/oe/package_manager/ipk/rootfs.py     |  37 ----
 meta/lib/oe/utils.py                          |  11 --
 .../0001-Add-MIPS-gnu-hash-support.patch      | 110 -----------
 .../prelink/prelink/macros.prelink            |   5 -
 .../prelink/prelink/prelink.conf              |  18 --
 .../prelink/prelink/prelink.cron.daily        |  40 ----
 .../prelink/prelink/prelink.default           |  22 ---
 meta/recipes-devtools/prelink/prelink_git.bb  | 185 ------------------
 scripts/sstate-sysroot-cruft.sh               |  12 --
 10 files changed, 441 deletions(-)
 delete mode 100644 meta/recipes-devtools/prelink/prelink/0001-Add-MIPS-gnu-hash-support.patch
 delete mode 100644 meta/recipes-devtools/prelink/prelink/macros.prelink
 delete mode 100644 meta/recipes-devtools/prelink/prelink/prelink.conf
 delete mode 100644 meta/recipes-devtools/prelink/prelink/prelink.cron.daily
 delete mode 100644 meta/recipes-devtools/prelink/prelink/prelink.default
 delete mode 100644 meta/recipes-devtools/prelink/prelink_git.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index cb289a0eee9..32ec391eb9e 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -577,7 +577,6 @@ RECIPE_MAINTAINER:pn-popt = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-powertop = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-ppp = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-ppp-dialin = "Hongxu Jia <hongxu.jia@windriver.com>"
-RECIPE_MAINTAINER:pn-prelink = "Mark Hatle <mark.hatle@kernel.crashing.org>"
 RECIPE_MAINTAINER:pn-procps = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-pseudo = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-psmisc = "Alexander Kanavin <alex.kanavin@gmail.com>"
diff --git a/meta/lib/oe/package_manager/ipk/rootfs.py b/meta/lib/oe/package_manager/ipk/rootfs.py
index 26dbee6f6ac..10a831994ee 100644
--- a/meta/lib/oe/package_manager/ipk/rootfs.py
+++ b/meta/lib/oe/package_manager/ipk/rootfs.py
@@ -145,51 +145,14 @@ class PkgRootfs(DpkgOpkgRootfs):
             self.pm.recover_packaging_data()
 
         bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS'), True)
-
-    def _prelink_file(self, root_dir, filename):
-        bb.note('prelink %s in %s' % (filename, root_dir))
-        prelink_cfg = oe.path.join(root_dir,
-                                   self.d.expand('${sysconfdir}/prelink.conf'))
-        if not os.path.exists(prelink_cfg):
-            shutil.copy(self.d.expand('${STAGING_DIR_NATIVE}${sysconfdir_native}/prelink.conf'),
-                        prelink_cfg)
-
-        cmd_prelink = self.d.expand('${STAGING_DIR_NATIVE}${sbindir_native}/prelink')
-        self._exec_shell_cmd([cmd_prelink,
-                              '--root',
-                              root_dir,
-                              '-amR',
-                              '-N',
-                              '-c',
-                              self.d.expand('${sysconfdir}/prelink.conf')])
-
     '''
     Compare two files with the same key twice to see if they are equal.
     If they are not equal, it means they are duplicated and come from
     different packages.
-    1st: Comapre them directly;
-    2nd: While incremental image creation is enabled, one of the
-         files could be probaly prelinked in the previous image
-         creation and the file has been changed, so we need to
-         prelink the other one and compare them.
     '''
     def _file_equal(self, key, f1, f2):
-
-        # Both of them are not prelinked
         if filecmp.cmp(f1, f2):
             return True
-
-        if bb.data.inherits_class('image-prelink', self.d):
-            if self.image_rootfs not in f1:
-                self._prelink_file(f1.replace(key, ''), f1)
-
-            if self.image_rootfs not in f2:
-                self._prelink_file(f2.replace(key, ''), f2)
-
-            # Both of them are prelinked
-            if filecmp.cmp(f1, f2):
-                return True
-
         # Not equal
         return False
 
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 136650e6f74..84790b7dffa 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -537,17 +537,6 @@ class ThreadedPool:
         for worker in self.workers:
             worker.join()
 
-def write_ld_so_conf(d):
-    # Some utils like prelink may not have the correct target library paths
-    # so write an ld.so.conf to help them
-    ldsoconf = d.expand("${STAGING_DIR_TARGET}${sysconfdir}/ld.so.conf")
-    if os.path.exists(ldsoconf):
-        bb.utils.remove(ldsoconf)
-    bb.utils.mkdirhier(os.path.dirname(ldsoconf))
-    with open(ldsoconf, "w") as f:
-        f.write(d.getVar("base_libdir") + '\n')
-        f.write(d.getVar("libdir") + '\n')
-
 class ImageQAFailed(Exception):
     def __init__(self, description, name=None, logfile=None):
         self.description = description
diff --git a/meta/recipes-devtools/prelink/prelink/0001-Add-MIPS-gnu-hash-support.patch b/meta/recipes-devtools/prelink/prelink/0001-Add-MIPS-gnu-hash-support.patch
deleted file mode 100644
index da0275bfcdf..00000000000
--- a/meta/recipes-devtools/prelink/prelink/0001-Add-MIPS-gnu-hash-support.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From 05240e13668422c4f9118f2cde953ec875d0d68f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 14 Jan 2020 01:37:22 -0800
-Subject: [PATCH] Add MIPS gnu hash support
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/arch-mips.c | 1 +
- src/prelink.c   | 1 +
- src/prelink.h   | 5 +++++
- 3 files changed, 7 insertions(+)
-
---- a/src/arch-mips.c
-+++ b/src/arch-mips.c
-@@ -324,6 +324,7 @@ mips_adjust_dyn (DSO *dso, int n, GElf_D
-     case DT_MIPS_BASE_ADDRESS:
-     case DT_MIPS_RLD_MAP:
-     case DT_MIPS_OPTIONS:
-+    case DT_MIPS_XHASH:
-       if (dyn->d_un.d_ptr >= start)
- 	dyn->d_un.d_ptr += adjust;
-       return 1;
---- a/src/prelink.c
-+++ b/src/prelink.c
-@@ -425,6 +425,7 @@ prelink_prepare (DSO *dso)
- 	  {
- 	  case SHT_HASH:
- 	  case SHT_GNU_HASH:
-+	  case SHT_MIPS_XHASH:
- 	  case SHT_DYNSYM:
- 	  case SHT_REL:
- 	  case SHT_RELA:
---- a/src/prelink.h
-+++ b/src/prelink.h
-@@ -114,6 +114,11 @@ typedef uint8_t Elf64_Byte;
- #define SHT_MIPS_ABIFLAGS       0x7000002a
- #endif
- 
-+#ifndef SHT_MIPS_XHASH
-+#define DT_MIPS_XHASH	    0x70000036
-+#define SHT_MIPS_XHASH       0x7000002b
-+#endif
-+
- #ifndef RSS_UNDEF
- #define RSS_UNDEF              0
- #endif
---- a/src/dso.c
-+++ b/src/dso.c
-@@ -109,6 +109,11 @@ read_dynamic (DSO *dso)
- 		    dso->info_DT_GNU_HASH = dyn.d_un.d_val;
- 		    dso->info_set_mask |= (1ULL << DT_GNU_HASH_BIT);
- 		  }
-+		else if (dyn.d_tag == DT_MIPS_XHASH)
-+		  {
-+		    dso->info_DT_GNU_HASH = dyn.d_un.d_val;
-+		    dso->info_set_mask |= (1ULL << DT_GNU_HASH_BIT);
-+		  }
- 		else if (dyn.d_tag == DT_TLSDESC_PLT)
- 		  {
- 		    dso->info_DT_TLSDESC_PLT = dyn.d_un.d_val;
-@@ -1463,6 +1468,7 @@ adjust_dso (DSO *dso, GElf_Addr start, G
- 	  break;
- 	case SHT_HASH:
- 	case SHT_GNU_HASH:
-+	case SHT_MIPS_XHASH:
- 	case SHT_NOBITS:
- 	case SHT_STRTAB:
- 	  break;
---- a/src/space.c
-+++ b/src/space.c
-@@ -61,6 +61,7 @@ print_sections (DSO *dso, GElf_Ehdr *ehd
-       { SHT_GNU_versym, "VERSYM" },
-       { SHT_GNU_LIBLIST, "LIBLIST" },
-       { SHT_GNU_HASH, "GNU_HASH" },
-+      { SHT_MIPS_XHASH, "MIPS_XHASH" },
-       { 0, NULL }
-     };
- 
-@@ -183,6 +184,7 @@ readonly_is_movable (DSO *dso, GElf_Ehdr
-     {
-     case SHT_HASH:
-     case SHT_GNU_HASH:
-+    case SHT_MIPS_XHASH:
-     case SHT_DYNSYM:
-     case SHT_REL:
-     case SHT_RELA:
-@@ -558,6 +560,7 @@ find_readonly_space (DSO *dso, GElf_Shdr
- 		    {
- 		    case SHT_HASH:
- 		    case SHT_GNU_HASH:
-+		    case SHT_MIPS_XHASH:
- 		    case SHT_DYNSYM:
- 		    case SHT_STRTAB:
- 		    case SHT_GNU_verdef:
---- a/src/exec.c
-+++ b/src/exec.c
-@@ -65,7 +65,11 @@ update_dynamic_tags (DSO *dso, GElf_Shdr
- 	  || (dynamic_info_is_set (dso, DT_GNU_HASH_BIT)
- 	      && dso->info_DT_GNU_HASH == old_shdr[j].sh_addr
- 	      && old_shdr[j].sh_type == SHT_GNU_HASH
--	      && set_dynamic (dso, DT_GNU_HASH, shdr[i].sh_addr, 1)))
-+	      && set_dynamic (dso, DT_GNU_HASH, shdr[i].sh_addr, 1))
-+	  || (dynamic_info_is_set (dso, DT_GNU_HASH_BIT)
-+	      && dso->info_DT_GNU_HASH == old_shdr[j].sh_addr
-+	      && old_shdr[j].sh_type == SHT_MIPS_XHASH
-+	      && set_dynamic (dso, DT_MIPS_XHASH, shdr[i].sh_addr, 1)))
- 	return 1;
-     }
- 
diff --git a/meta/recipes-devtools/prelink/prelink/macros.prelink b/meta/recipes-devtools/prelink/prelink/macros.prelink
deleted file mode 100644
index cb166958850..00000000000
--- a/meta/recipes-devtools/prelink/prelink/macros.prelink
+++ /dev/null
@@ -1,5 +0,0 @@
-# rpm-4.1 verifies prelinked libraries using a prelink undo helper.
-#       Note: The 2nd token is used as argv[0] and "library" is a
-#       placeholder that will be deleted and replaced with the appropriate
-#       library file path.
-%__prelink_undo_cmd     /usr/sbin/prelink prelink -y library
diff --git a/meta/recipes-devtools/prelink/prelink/prelink.conf b/meta/recipes-devtools/prelink/prelink/prelink.conf
deleted file mode 100644
index 562f23c59d2..00000000000
--- a/meta/recipes-devtools/prelink/prelink/prelink.conf
+++ /dev/null
@@ -1,18 +0,0 @@
-# This config file contains a list of directories both with binaries
-# and libraries prelink should consider by default.
-# If a directory name is prefixed with `-l ', the directory hierarchy
-# will be walked as long as filesystem boundaries are not crossed.
-# If a directory name is prefixed with `-h ', symbolic links in a
-# directory hierarchy are followed.
--l /usr/local/sbin
--l /sbin
--l /usr/sbin
--l /usr/local/bin
--l /bin
--l /usr/bin
--l /usr/X11R6/bin
--l /usr/games
--l /usr/local/lib{,32,64,x32}
--l /lib{,32,64,x32}
--l /usr/lib{,32,64,x32}
--l /usr/X11R6/lib{,32,64,x32}
diff --git a/meta/recipes-devtools/prelink/prelink/prelink.cron.daily b/meta/recipes-devtools/prelink/prelink/prelink.cron.daily
deleted file mode 100644
index 0b3c07322c7..00000000000
--- a/meta/recipes-devtools/prelink/prelink/prelink.cron.daily
+++ /dev/null
@@ -1,40 +0,0 @@
-#!/bin/sh
-
-. /etc/default/prelink
-
-renice +19 -p $$ >/dev/null 2>&1
-
-if [ "$PRELINKING" != yes ]; then
-  if [ -f /etc/prelink.cache ]; then
-    echo /usr/sbin/prelink -uav > /var/log/prelink.log
-    /usr/sbin/prelink -uav >> /var/log/prelink.log 2>&1
-    rm -f /etc/prelink.cache
-    # Restart init if needed
-    [ -n "$(find `ldd /sbin/init | awk '{ print $3 }'` /sbin/init -ctime -1 2>/dev/null )" ] && /sbin/telinit u
-  fi
-  exit 0
-fi
-
-if [ ! -f /etc/prelink.cache -o -f /var/lib/misc/prelink.force ] \
-   || grep -q '^prelink-ELF0.[0-2]' /etc/prelink.cache; then
-  # If cache does not exist or is from older prelink versions or
-  # if we were asked to explicitely, force full prelinking
-  rm -f /etc/prelink.cache /var/lib/misc/prelink.force
-  PRELINK_OPTS="$PRELINK_OPTS -f"
-  date > /var/lib/misc/prelink.full
-elif [ -n "$PRELINK_FULL_TIME_INTERVAL" \
-       -a "`find /var/lib/misc/prelink.full -mtime -${PRELINK_FULL_TIME_INTERVAL} 2>/dev/null`" \
-	  = /var/lib/misc/prelink.full ]; then
-  # If prelink without -q has been run in the last
-  # PRELINK_FULL_TIME_INTERVAL days, just use quick mode
-  PRELINK_OPTS="$PRELINK_OPTS -q"
-else
-  date > /var/lib/misc/prelink.full
-fi
-
-echo /usr/sbin/prelink -av $PRELINK_OPTS > /var/log/prelink.log
-/usr/sbin/prelink -av $PRELINK_OPTS >> /var/log/prelink.log 2>&1
-# Restart init if needed
-[ -n "$(find `ldd /sbin/init | awk '{ print $3 }'` /sbin/init -ctime -1 2>/dev/null )" ] && /sbin/telinit u
-
-exit 0
diff --git a/meta/recipes-devtools/prelink/prelink/prelink.default b/meta/recipes-devtools/prelink/prelink/prelink.default
deleted file mode 100644
index d8802f820ae..00000000000
--- a/meta/recipes-devtools/prelink/prelink/prelink.default
+++ /dev/null
@@ -1,22 +0,0 @@
-# Set this to no to disable prelinking altogether
-# or to yes to enable it.
-# (if you change this from yes to no prelink -ua
-# will be run next night to undo prelinking)
-PRELINKING=yes
-
-# Options to pass to prelink
-# -m	Try to conserve virtual memory by allowing overlapping
-#	assigned virtual memory slots for libraries which
-#	never appear together in one binary
-# -R	Randomize virtual memory slot assignments for libraries.
-#	This makes it slightly harder for various buffer overflow
-#	attacks, since library addresses will be different on each
-#	host using -R.
-PRELINK_OPTS=-mR
-
-# How often should full prelink be run (in days)
-# Normally, prelink will be run in quick mode, every
-# $PRELINK_FULL_TIME_INTERVAL days it will be run
-# in normal mode.  Comment this line out if prelink 
-# should be run in normal mode always.
-PRELINK_FULL_TIME_INTERVAL=14
diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
deleted file mode 100644
index 24713b61f84..00000000000
--- a/meta/recipes-devtools/prelink/prelink_git.bb
+++ /dev/null
@@ -1,185 +0,0 @@
-SECTION = "devel"
-# Need binutils for libiberty.a
-# Would need transfig-native for documentation if it wasn't disabled
-DEPENDS = "elfutils binutils"
-SUMMARY = "An ELF prelinking utility"
-HOMEPAGE = "http://git.yoctoproject.org/cgit.cgi/prelink-cross/about/"
-DESCRIPTION = "The prelink package contains a utility which modifies ELF shared libraries \
-and executables, so that far fewer relocations need to be resolved at \
-runtime and thus programs come up faster."
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
-SRCREV = "f9975537dbfd9ade0fc813bd5cf5fcbe41753a37"
-PV = "1.0+git${SRCPV}"
-
-#
-# The cron script attempts to re-prelink the system daily -- on
-# systems where users are adding applications, this might be reasonable
-# but for embedded, we should be re-running prelink -a after an update.
-#
-# Default is prelinking is enabled.
-#
-SUMMARY:${PN}-cron = "Cron scripts to control automatic prelinking"
-DESCRIPTION:${PN}-cron = "Cron scripts to control automatic prelinking.  \
-See: ${sysconfdir}/cron.daily/prelink for configuration information."
-
-FILES:${PN}-cron = "${sysconfdir}/cron.daily ${sysconfdir}/default"
-
-PACKAGES =+ "${PN}-cron"
-
-SRC_URI = "git://git.yoctoproject.org/prelink-cross.git;branch=cross_prelink_staging \
-           file://0001-Add-MIPS-gnu-hash-support.patch \
-           file://prelink.conf \
-           file://prelink.cron.daily \
-           file://prelink.default \
-           file://macros.prelink \
-           "
-UPSTREAM_CHECK_COMMITS = "1"
-
-# error: error.h: No such file or directory
-COMPATIBLE_HOST:libc-musl = 'null'
-
-TARGET_OS_ORIG := "${TARGET_OS}"
-OVERRIDES:append = ":${TARGET_OS_ORIG}"
-
-S = "${WORKDIR}/git"
-
-inherit autotools 
-
-BBCLASSEXTEND = "native"
-
-EXTRA_OECONF = "--with-pkgversion=${PV}-${PR} \
-	--with-bugurl=http://bugzilla.yoctoproject.org/"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
-
-#
-# For target prelink we need to ensure paths match the lib path layout
-# including for any configured multilibs
-#
-python do_linkerpaths () {
-    values = all_multilib_tune_list(["TUNE_ARCH", "baselib", "ABIEXTENSION"], d)
-
-    arches = values["TUNE_ARCH"]
-    baselibs = values["baselib"]
-    abis = values["ABIEXTENSION"]
-
-    def replace_lines(f, search, replacement, d, firstonly = False, secondonly = False):
-        f = d.expand(f)
-        if search == replacement:
-            return
-        bb.debug(2, "Replacing %s with %s in %s" % (search, replacement, f))
-        with open(f, "r") as data:
-            lines = data.readlines()
-        with open(f, "w") as data:
-            for line in lines:
-                if not secondonly and not firstonly:
-                    line = line.replace(search, replacement)
-                elif secondonly and search in line:
-                    secondonly = False
-                elif firstonly and search and search in line:
-                    line = line.replace(search, replacement)
-                    search = None
-                data.write(line)
-
-    def replace_lines_rtld(f, search, replacement, section, d):
-        f = d.expand(f)
-        bb.debug(2, "Replacing %s with %s in %s" % (search, replacement, f))
-        with open(f, "r") as data:
-            lines = data.readlines()
-        found = False
-        found2 = False
-        with open(f, "w") as data:
-            for line in lines:
-                if section in line:
-                    if section == "else" and "if" in line:
-                        found = False
-                    else:
-                        found = True
-                if found and "dst_LIB =" in line:
-                    found2 = True
-                elif "}" in line:
-                    found = False
-                    found2 = False
-                if found2:
-                    line = line.replace(search, replacement)
-                data.write(line)
-
-    for i, arch in enumerate(arches):
-        tune_baselib = baselibs[i]
-        abi = abis[i]
-
-        bits = 32
-        if arch == "powerpc":
-            replace_lines("${S}/src/arch-ppc.c", "/lib/ld.so.1", "/" + tune_baselib + "/ld.so.1", d)
-        elif arch == "powerpc64":
-            replace_lines("${S}/src/arch-ppc64.c", "/lib64/ld64.so.1", "/" + tune_baselib + "/ld64.so.1", d)
-            bits = 64
-        elif arch == "x86_64":
-            if abi == "x32":
-                replace_lines("${S}/src/arch-x86_64.c", "/libx32/ld-linux-x32.so.2", "/" + tune_baselib + "/ld-linux-x32.so.2", d)
-            else:
-                replace_lines("${S}/src/arch-x86_64.c", "/lib64/ld-linux-x86-64.so.2", "/" + tune_baselib + "/ld-linux-x86-64.so.2", d)
-            bits = 64
-        elif arch == "arm":
-            replace_lines("${S}/src/arch-arm.c", "/lib/ld-linux.so.3", "/" + tune_baselib + "/ld-linux.so.3", d)
-            replace_lines("${S}/src/arch-arm.c", "/lib/ld-linux-armhf.so.3", "/" + tune_baselib + "/ld-linux-armhf.so.3", d)
-        elif arch == "mips" or arch == "mipsel":
-            replace_lines("${S}/src/arch-mips.c", "/lib/ld.so.1", "/" + tune_baselib + "/ld.so.1", d, firstonly=True)
-            replace_lines("${S}/src/arch-mips.c", "/lib32/ld.so.1", "/" + tune_baselib + "/ld.so.1", d)
-        elif arch == "mips64" or arch == "mips64el":
-            replace_lines("${S}/src/arch-mips.c", "/lib/ld.so.1", "/" + tune_baselib + "/ld.so.1", d, secondonly=True)
-            replace_lines("${S}/src/arch-mips.c", "/lib64/ld.so.1", "/" + tune_baselib + "/ld.so.1", d)
-            bits = 64
-        elif arch.endswith("86"):
-            replace_lines("${S}/src/arch-i386.c", "/lib/ld-linux.so.2", "/" + tune_baselib + "/ld-linux.so.2", d)
-        if bits == 32 and tune_baselib != "lib":
-            replace_lines_rtld("${S}/src/rtld/rtld.c", "lib", tune_baselib, "else", d)
-        if bits == 64 and tune_baselib != "lib64":
-            replace_lines_rtld("${S}/src/rtld/rtld.c", "lib64", tune_baselib, "use_64bit", d)
-}
-
-python () {
-    overrides = d.getVar("OVERRIDES").split(":")
-    if "class-target" in overrides:
-        bb.build.addtask('do_linkerpaths', 'do_configure', 'do_patch', d)
-}
-
-do_configure:prepend () {
-        # Disable documentation!
-        echo "all:" > ${S}/doc/Makefile.am
-}
-
-do_install:append () {
-	install -d ${D}${sysconfdir}/cron.daily ${D}${sysconfdir}/default ${D}${sysconfdir}/rpm
-	install -m 0644 ${WORKDIR}/prelink.conf ${D}${sysconfdir}/prelink.conf
-	install -m 0644 ${WORKDIR}/prelink.cron.daily ${D}${sysconfdir}/cron.daily/prelink
-	install -m 0644 ${WORKDIR}/prelink.default ${D}${sysconfdir}/default/prelink
-	install -m 0644 ${WORKDIR}/macros.prelink ${D}${sysconfdir}/rpm/macros.prelink
-}
-
-# If we ae doing a cross install, we want to avoid prelinking.
-# Prelinking during a cross install should be handled by the image-prelink
-# bbclass.  If the user desires this to run on the target at first boot
-# they will need to create a custom boot script.
-pkg_postinst:prelink() {
-#!/bin/sh
-
-if [ "x$D" != "x" ]; then
-  exit 0
-fi
-
-prelink -a
-}
-
-pkg_prerm:prelink() {
-#!/bin/sh
-
-if [ "x$D" != "x" ]; then
-  exit 1
-fi
-
-prelink -au
-}
-
diff --git a/scripts/sstate-sysroot-cruft.sh b/scripts/sstate-sysroot-cruft.sh
index fbf1ca3c431..9c948e932de 100755
--- a/scripts/sstate-sysroot-cruft.sh
+++ b/scripts/sstate-sysroot-cruft.sh
@@ -145,18 +145,6 @@ WHITELIST="${WHITELIST} \
   .*/var/cache/fontconfig/ \
 "
 
-# created by oe.utils.write_ld_so_conf which is used from few bbclasses and recipes:
-# meta/classes/image-prelink.bbclass:    oe.utils.write_ld_so_conf(d)
-# meta/classes/insane.bbclass:                oe.utils.write_ld_so_conf(d)
-# meta/classes/insane.bbclass:                oe.utils.write_ld_so_conf(d)
-# meta/recipes-gnome/gobject-introspection/gobject-introspection_1.48.0.bb:    oe.utils.write_ld_so_conf(d)
-# meta/recipes-gnome/gobject-introspection/gobject-introspection_1.48.0.bb:        oe.utils.write_ld_so_conf(d)
-# introduced in oe-core commit 7fd1d7e639c2ed7e0699937a5cb245c187b7c811
-# and more visible since added to gobject-introspection in 10e0c1a3a452baa05d160a92a54b2e33cf0fd061
-WHITELIST="${WHITELIST} \
-  [^/]*/etc/ld.so.conf \
-"
-
 SYSROOTS="`readlink -f ${tmpdir}`/sysroots/"
 
 mkdir ${OUTPUT}
-- 
2.32.0


