Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.6673.1632226540706431534
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Sep 2021 05:15:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OAeQLvN/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id q11so38537182wrr.9
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Sep 2021 05:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mAUnBOujn5YKIFdP6HvA2Xnw08qknfAOcCoOYomF3bE=;
        b=OAeQLvN/ruuVLpC3+o8yzAhWMc7p7YhoaCG7coi5cGlxNy7Hv37XAuSbNrhbZdbm6V
         /dAGuIlpVEqMZDUf0qiiAd99xl3oCHeRikd8SlBbeq+EAAeiE1w2x5+RVIXTC5WW2/B5
         KJHhvJmAoeTsdZz396+5FO1zIE7q8FiJhKkwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mAUnBOujn5YKIFdP6HvA2Xnw08qknfAOcCoOYomF3bE=;
        b=L6b2Z3ABoWGhDGi17h2QQjbHgHc59WaoKBW7LaaH9MIwg8Um7pXVORKsud+AF6axvo
         on5a0Ant0m9XjG5hiAQgeKSFJpuPjlO4ozGMH/jY3Dg8zV+I+kKmjpkVFbmEvBO39TRW
         ZkYJ51WP+ENlYHCLyiSD5bZTssN0cdHdSv+E2xZttWKn352PPrxaSf2HecZzgmpQMMqO
         xBcWZO7qjfoO6L+K2LnIEDOgAmXev9zRLe75mnWaj08yvI8/rxhD4syKhgmd7A1UG/c7
         B41JAQRQvkNJHghYLyuS+RCpD+SgjR5+dpWLaZjw7uTf305GTVs2N1imwRTZmYWs3Xyz
         P6lw==
X-Gm-Message-State: AOAM5335TogpWNto2S6FZ2nE9/v+vHSDqa0EVyWcdaGUoZvC0d3j/2gF
	DWm04ZYzqsRd3Poe+UZMgOXoYPYVj132xyd8
X-Google-Smtp-Source: ABdhPJx7hFopI2htIts4FGnTe1ICrZDiDT6fJTzGAfKZwRdlcWzAq9pokJfxHeR6u+dvFOlPrlGSng==
X-Received: by 2002:adf:eb4c:: with SMTP id u12mr35026942wrn.111.1632226538748;
        Tue, 21 Sep 2021 05:15:38 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:97b0:b8a0:39a5:2c93])
        by smtp.gmail.com with ESMTPSA id t6sm2648720wmj.12.2021.09.21.05.15.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 05:15:38 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] siteinfo/autotools: Ensure task checksums reflect site files
Date: Tue, 21 Sep 2021 13:15:37 +0100
Message-Id: <20210921121537.1611646-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, if you change the site files, nothing rebuilds since they are
not accounted for in task checksums. They could/should be through the
file-checksums task flag. We need to cache all the files looked for,
whether the exist or not so that if they do exist and didn't,
the checksum also changes.

This gets complicated by the need to clean out hardcoded build
paths from the variable and that other layers can have site files.

This patch adds this functionality. A new variable, SITEINFO_PATHVARS
is added which controls which substitutions to make on the file-checksum
values to remove the hardcoded paths. Layers adding site files will need
to set this to a variable that has the layer path in it and is excluded
from task hashes (COREBASE is the one the core layer uses).

This patch will cause yocto-check-layer to fail for some layers
where site files are added yet the layer isn't a machine specific layer.
This is arguable correct since these additional site files apply to
all recipes and things from a layer like core could be changed by such
changes so it is right they should rebuild. There is a determinism issue
potentially there if not. meta-openembedded does have some such references
but looking at them they should move to core or likely just be removed as
most look obsolete anyway.

[YOCTO #13729]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/autotools.bbclass             |  8 ++++++-
 meta/classes/siteinfo.bbclass              | 28 +++++++++++++++++-----
 meta/classes/toolchain-scripts.bbclass     |  5 ++--
 meta/recipes-core/meta/meta-environment.bb |  5 ++++
 meta/recipes-core/meta/meta-ide-support.bb |  6 +++++
 5 files changed, 43 insertions(+), 9 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 2c7968e6597..bc0c2ea83e5 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -145,7 +145,13 @@ ACLOCALEXTRAPATH:class-target = " -I ${STAGING_DATADIR_NATIVE}/aclocal/"
 ACLOCALEXTRAPATH:class-nativesdk = " -I ${STAGING_DATADIR_NATIVE}/aclocal/"
 
 python autotools_aclocals () {
-    d.setVar("CONFIG_SITE", siteinfo_get_files(d, sysrootcache=True))
+    sitefiles, searched = siteinfo_get_files(d, sysrootcache=True)
+    d.setVar("CONFIG_SITE", " ".join(sitefiles))
+}
+
+python () {
+    sitefiles, searched = siteinfo_get_files(d, sysrootcache=False)
+    d.appendVarFlag("do_configure", "file-checksums", " " + " ".join(searched))
 }
 
 CONFIGURE_FILES = "${S}/configure.in ${S}/configure.ac ${S}/config.h.in ${S}/acinclude.m4 Makefile.am"
diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index 0bd1f36805d..596a40a431d 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -176,17 +176,33 @@ python () {
         bb.fatal("Please add your architecture to siteinfo.bbclass")
 }
 
-def siteinfo_get_files(d, sysrootcache = False):
+# Layers with siteconfig need to add a replacement path to this variable so the
+# sstate isn't path specific
+SITEINFO_PATHVARS = "COREBASE"
+
+def siteinfo_get_files(d, sysrootcache=False):
     sitedata = siteinfo_data(d)
-    sitefiles = ""
+    sitefiles = []
+    searched = []
     for path in d.getVar("BBPATH").split(":"):
         for element in sitedata:
             filename = os.path.join(path, "site", element)
             if os.path.exists(filename):
-                sitefiles += filename + " "
+                searched.append(filename + ":True")
+                sitefiles.append(filename)
+            else:
+                searched.append(filename + ":False")
+
+    # Have to parameterise out hardcoded paths such as COREBASE for the main site files
+    for var in d.getVar("SITEINFO_PATHVARS").split():
+        searched2 = []
+        replace = os.path.normpath(d.getVar(var))
+        for s in searched:
+            searched2.append(s.replace(replace, "${" + var + "}"))
+        searched = searched2
 
     if not sysrootcache:
-        return sitefiles
+        return sitefiles, searched
 
     # Now check for siteconfig cache files in sysroots
     path_siteconfig = d.getVar('SITECONFIG_SYSROOTCACHE')
@@ -195,8 +211,8 @@ def siteinfo_get_files(d, sysrootcache = False):
             if not i.endswith("_config"):
                 continue
             filename = os.path.join(path_siteconfig, i)
-            sitefiles += filename + " "
-    return sitefiles
+            sitefiles.append(filename)
+    return sitefiles, searched
 
 #
 # Make some information available via variables
diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 479f3b706ea..fb6261c91d0 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -65,6 +65,7 @@ toolchain_create_sdk_env_script () {
 
 # This function creates an environment-setup-script in the TMPDIR which enables
 # a OE-core IDE to integrate with the build tree
+# Caller must ensure CONFIG_SITE is setup
 toolchain_create_tree_env_script () {
 	script=${TMPDIR}/environment-setup-${REAL_MULTIMACH_TARGET_SYS}
 	rm -f $script
@@ -73,7 +74,7 @@ toolchain_create_tree_env_script () {
 	echo 'export PATH=${STAGING_DIR_NATIVE}/usr/bin:${STAGING_BINDIR_TOOLCHAIN}:$PATH' >> $script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR}' >> $script
 	echo 'export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}' >> $script
-	echo 'export CONFIG_SITE="${@siteinfo_get_files(d)}"' >> $script
+	echo 'export CONFIG_SITE="${CONFIG_SITE}"' >> $script
 	echo 'export SDKTARGETSYSROOT=${STAGING_DIR_TARGET}' >> $script
 	echo 'export OECORE_NATIVE_SYSROOT="${STAGING_DIR_NATIVE}"' >> $script
 	echo 'export OECORE_TARGET_SYSROOT="${STAGING_DIR_TARGET}"' >> $script
@@ -161,7 +162,7 @@ EOF
 }
 
 #we get the cached site config in the runtime
-TOOLCHAIN_CONFIGSITE_NOCACHE = "${@siteinfo_get_files(d)}"
+TOOLCHAIN_CONFIGSITE_NOCACHE = "${@' '.join(siteinfo_get_files(d)[0])}"
 TOOLCHAIN_CONFIGSITE_SYSROOTCACHE = "${STAGING_DIR}/${MLPREFIX}${MACHINE}/${target_datadir}/${TARGET_SYS}_config_site.d"
 TOOLCHAIN_NEED_CONFIGSITE_CACHE ??= "virtual/${MLPREFIX}libc ncurses"
 DEPENDS += "${TOOLCHAIN_NEED_CONFIGSITE_CACHE}"
diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core/meta/meta-environment.bb
index 27f01036657..7118fb2aefc 100644
--- a/meta/recipes-core/meta/meta-environment.bb
+++ b/meta/recipes-core/meta/meta-environment.bb
@@ -47,6 +47,11 @@ python do_generate_content() {
 }
 addtask generate_content before do_install after do_compile
 
+python () {
+    sitefiles, searched = siteinfo_get_files(d, sysrootcache=False)
+    d.appendVarFlag("do_generate_content", "file-checksums", " " + " ".join(searched))
+}
+
 create_sdk_files() {
 	# Setup site file for external use
 	toolchain_create_sdk_siteconfig ${SDK_OUTPUT}/${SDKPATH}/site-config-${REAL_MULTIMACH_TARGET_SYS}
diff --git a/meta/recipes-core/meta/meta-ide-support.bb b/meta/recipes-core/meta/meta-ide-support.bb
index 37e65a49cac..39317d50e0c 100644
--- a/meta/recipes-core/meta/meta-ide-support.bb
+++ b/meta/recipes-core/meta/meta-ide-support.bb
@@ -12,4 +12,10 @@ do_populate_ide_support () {
   toolchain_create_tree_env_script
 }
 
+python () {
+    sitefiles, searched = siteinfo_get_files(d, sysrootcache=False)
+    d.setVar("CONFIG_SITE", " ".join(sitefiles))
+    d.appendVarFlag("do_populate_ide_support", "file-checksums", " " + " ".join(searched))
+}
+
 addtask populate_ide_support before do_build after do_install
-- 
2.32.0

