Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8778B7FF98
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 14:38:24 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id c14so2549400wrn.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 06:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CpFdtsQf/u01hvU1s2QrS0AtTP5QP/aDZcjpqJK9RTo=;
	b=idY9rBsy9lcXMf++3YUQlTFQ2ws7ms7aDY6i0GMxJ35M/5D1yOouzOw1/DzWarJjOj
	+rDl/QoK9BIsMOfEdWInbfkEF60HhRKzP17WJJGvKAlx21mesj4WuMJNIvxlb5+lKYT/
	JduLJ+5VfDnlVBpPEolqd6MJpF0kbX2oz/0LIfDJMA3Jx61E57I31HSfJT8fNMwk60gi
	C44fbF0nH1fFeGKw9e7BEGEVqlR0o+FTt+jQzX2JbbChfMYS4yQyLDSgF12GB8t1aeA2
	HuMl4rXfJI5lLHZcE/IwmwRbW1ifVblD42T2OG+yqsg59P9HTzwcW2sThzWZKoeNmhTw
	pxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CpFdtsQf/u01hvU1s2QrS0AtTP5QP/aDZcjpqJK9RTo=;
	b=dZ/VrVQ61Q839A2ES+IY30yE71WMRN/7sw+ahhCqIdsWAUXzH+ADQWp+1sMYY2nhQg
	OVHUMUADKSvZ2lxm85VWqlOjTSFK02YTI5MH0CgSbfDwKVSxrNL1nTndtYPgx++iRuME
	ZeirK83WBblmALJGtQmJNGf9soNIB0CdDif3zh+n0+cgUo058OKT93JHslDFkNLATU+y
	RN5KEUENd7ZIFpuM+R6FIWRYdOrYPRKIu0IZiV3QO7M9SlUS1kPGjj8N51amF4WRf/Hg
	nk6tmRnBaj8Yo9Rp/+nFE5w4DxkoU5JovT/4beVFDUyaNiIVbaCzdqriNJ97teNUDUZg
	PBTw==
X-Gm-Message-State: APjAAAUYZX3HnRK3dJhpJlASPWngM9h1q4jnvRKzishL7RDrazvTamLG
	2Fd2jtIe53+DQwl6U6JGg3YeG4Ct1r8=
X-Google-Smtp-Source: APXvYqyUkh9ZZE07jvKJMaQFJh6tV0t+c7vW+sH1UzaR8MVmQ/hP/oQ2q2NX4m8tXl97JAZPGpkKCw==
X-Received: by 2002:adf:f88c:: with SMTP id u12mr3404164wrp.323.1576679904851; 
	Wed, 18 Dec 2019 06:38:24 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	d10sm2747313wrw.64.2019.12.18.06.38.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Dec 2019 06:38:24 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2019 15:37:58 +0100
Message-Id: <20191218143758.129308-25-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218143758.129308-1-alex.kanavin@gmail.com>
References: <20191218143758.129308-1-alex.kanavin@gmail.com>
Subject: [PATCH 25/25] sysprof: move recipe to meta-oe
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
X-List-Received-Date: Wed, 18 Dec 2019 14:38:25 -0000

Latest version (3.34) of sysprof have a hard dependency on polkit,
which in turn requires mozjs, which pulls in a number of other
meta-oe packages including python2. This makes it difficult
to keep sysprof in oe-core, so for the time being it is moved to
meta-oe.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 .../packagegroup-core-tools-profile.bb        |  2 +-
 ...thing-in-help-as-it-requires-itstool.patch | 27 ----------------
 .../files/define-NT_GNU_BUILD_ID.patch        | 22 -------------
 meta/recipes-kernel/sysprof/sysprof_3.32.0.bb | 32 -------------------
 5 files changed, 1 insertion(+), 83 deletions(-)
 delete mode 100644 meta/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
 delete mode 100644 meta/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
 delete mode 100644 meta/recipes-kernel/sysprof/sysprof_3.32.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 79404dfbdb7..c9c7a8be555 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -656,7 +656,6 @@ RECIPE_MAINTAINER_pn-swig = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-sysfsutils = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-sysklogd = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-syslinux = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-sysprof = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-sysstat = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-systemd = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-systemd-boot = "Chen Qi <Qi.Chen@windriver.com>"
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 3fd423c592e..984c2fac92c 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -10,7 +10,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
-PROFILE_TOOLS_X = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'sysprof', '', d)}"
+PROFILE_TOOLS_X = ""
 # sysprof doesn't support aarch64 and nios2
 PROFILE_TOOLS_X_aarch64 = ""
 PROFILE_TOOLS_X_nios2 = ""
diff --git a/meta/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch b/meta/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
deleted file mode 100644
index ade51cf864f..00000000000
--- a/meta/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From d332b480257aa98b63d39c3c94896a111536f937 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 23 Aug 2017 18:38:26 +0300
-Subject: [PATCH 2/2] Do not build anything in help/ as it requires itstool.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- meson.build | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 3986273..ae2f65e 100644
---- a/meson.build
-+++ b/meson.build
-@@ -164,7 +164,6 @@ subdir('tools')
- subdir('tests')
- 
- subdir('data')
--subdir('help')
- subdir('po')
- 
- meson.add_install_script('build-aux/meson/post_install.sh')
--- 
-2.7.4
-
diff --git a/meta/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch b/meta/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
deleted file mode 100644
index f75ddad43a1..00000000000
--- a/meta/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-On uclibc elf.h does not have GNU extentions but we need this define
-so we define it locally if its not getting it from elf.h
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-
-Index: git/elfparser.h
-===================================================================
---- git.orig/lib/util/elfparser.h	2011-07-16 18:57:41.000000000 -0700
-+++ git/lib/util/elfparser.h	2011-07-16 20:28:54.733829895 -0700
-@@ -17,6 +17,10 @@
-  */
- #include <glib.h>
- 
-+#ifndef NT_GNU_BUILD_ID
-+#define NT_GNU_BUILD_ID 3
-+#endif
-+
- typedef struct ElfSym ElfSym;
- typedef struct ElfParser ElfParser;
- 
diff --git a/meta/recipes-kernel/sysprof/sysprof_3.32.0.bb b/meta/recipes-kernel/sysprof/sysprof_3.32.0.bb
deleted file mode 100644
index b92933806cf..00000000000
--- a/meta/recipes-kernel/sysprof/sysprof_3.32.0.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "System-wide Performance Profiler for Linux"
-HOMEPAGE = "http://www.sysprof.com"
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://src/sp-application.c;endline=17;md5=40e55577ef122c88fe20052acda64875"
-
-GNOMEBASEBUILDCLASS = "meson"
-inherit gnomebase gettext systemd upstream-version-is-even gsettings
-
-DEPENDS = "glib-2.0 libxml2-native glib-2.0-native"
-
-SRC_URI[archive.md5sum] = "d1fa9ad216419d722770ca36713ad3af"
-SRC_URI[archive.sha256sum] = "fc22a69e468701c5ec9036e960c6273afa1ed6a89df1f889fed49417add5554d"
-SRC_URI += " \
-           file://define-NT_GNU_BUILD_ID.patch \
-           file://0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch \
-           "
-
-PACKAGECONFIG ?= "${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)}"
-PACKAGECONFIG[gtk] = "-Denable_gtk=true,-Denable_gtk=false,gtk+3"
-PACKAGECONFIG[sysprofd] = "-Dwith_sysprofd=bundled,-Dwith_sysprofd=none,polkit"
-
-SOLIBS = ".so"
-FILES_SOLIBSDEV = ""
-
-SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'sysprofd', 'sysprof2.service', '', d)}"
-
-FILES_${PN} += " \
-               ${datadir}/dbus-1/system-services \
-               ${datadir}/dbus-1/system.d \
-               ${datadir}/metainfo \
-               "
-- 
2.17.1


