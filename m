Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.3818.1590265634853591638
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 May 2020 13:27:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AyzhZfJC;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: gzatko@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id h17so13614655wrc.8
        for <openembedded-core@lists.openembedded.org>; Sat, 23 May 2020 13:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2JRDyE8rBTWOIsOEydEFetsilT7p24VmXPzI7cxm9g0=;
        b=AyzhZfJCopmo1MNa3uggC4L54iOngFiS8FET3z4hru4qWBZJpsYu1V6WF8SrQQQgTV
         /tbcgTlqGc6FVYL7kikOwjHtnGeAZt47ca0KWGlMoKBqa0kWuUjXfxya7MR3nW+9f7Kw
         hpWbuVmONSvCHd9/Y2doGt4cPsq5Dl70JEyYiWM1v3vDaIGy8EmCNeqN+cHoShInZRKG
         L3hZOH8uPjTw+ftMWoe5Ib8MuV/vSYhNoOrnOMagTDot/uFsm9TkBafJSH/zCU1N71Bn
         RhzVuct875y/FVkG98tXVcND1houthBPINmCgfauFxw9b7orhhhidOz6I+ODpjYEATOp
         gl0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2JRDyE8rBTWOIsOEydEFetsilT7p24VmXPzI7cxm9g0=;
        b=ckYqJL9RqwtUsuXZa1f+odOOIW3AkaTRzYAKOs2qxjZ04SCYkIhbrYx58ZXbpV+z1G
         xmEHi5VVHbmDXwNUVyX5dTyyIjeXEfkXkcVzFARr20BtaGYkaPEYPgUWPwhbpAJu2V38
         nw6Xw/vvMyj3nUZ60f8WyJUL44hDxqXSvQuNZias5xxDsouDSG/MzOK+nkkXxjZDaDtw
         1dffJsizvktZh25BaAL334dKbNsdcpSiVzIllM88qV4PXVEXDfgDJzXYQiA6MfY2DaP+
         jtsB/a6vlzDNkbfehY/OzFbtXfUskuA1xs0OeDduR/va2d1yRQMzos2KYXF588Bh4HaZ
         hp1Q==
X-Gm-Message-State: AOAM531wmKxO3QjSHwxKwK4CxSHPLeZQaSW1RyCCKOcS2KLUBxysLvKX
	4UQSBk/IKfi7KtBtE82g4Ay9AE4ox9w=
X-Google-Smtp-Source: ABdhPJyPgUCUSH+EiubaINIuWvSTEl37978WxkFg8oP/1O3Qw4swn3p1eD2Z+pZpda31y8HMpOaXEg==
X-Received: by 2002:a5d:4948:: with SMTP id r8mr8169688wrs.290.1590265632944;
        Sat, 23 May 2020 13:27:12 -0700 (PDT)
Return-Path: <gzatko@gmail.com>
Received: from blizzard-1040g6.lan (93.184.67.240.host.vnet.sk. [93.184.67.240])
        by smtp.gmail.com with ESMTPSA id r2sm13307661wrg.84.2020.05.23.13.27.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2020 13:27:12 -0700 (PDT)
From: "Gregor Zatko" <gzatko@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sanity.bbclass: Detect and fail if 'inherit' is used in conf file
Date: Sat, 23 May 2020 22:27:10 +0200
Message-Id: <20200523202710.1302479-1-gzatko@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'inherit' directive may not be used in conf files as it's supposed
to be used for the inheritance of classes.
Correct form in conf file is INHERIT.

This commit adds:
- a sanity check to find whether the wrong case exists
- fail the build if so
- tell user about the difference in directives

https://bugzilla.yoctoproject.org/show_bug.cgi?id=5426

Signed-off-by: Gregor Zatko <gzatko@gmail.com>
---
 meta/classes/sanity.bbclass | 48 +++++++++++++++++++++----------------
 1 file changed, 27 insertions(+), 21 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 292c5591dd..b6b3d0c71d 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -25,7 +25,7 @@ def sanity_conf_update(fn, lines, version_var_name, new_version):
     with open(fn, "w") as f:
         f.write(''.join(lines))
 
-# Functions added to this variable MUST throw a NotImplementedError exception unless 
+# Functions added to this variable MUST throw a NotImplementedError exception unless
 # they successfully changed the config version in the config file. Exceptions
 # are used since exec_func doesn't handle return values.
 BBLAYERS_CONF_UPDATE_FUNCS += " \
@@ -42,13 +42,13 @@ python oecore_update_localconf() {
     current_conf  = d.getVar('CONF_VERSION')
     conf_version =  d.getVar('LOCALCONF_VERSION')
 
-    failmsg = """Your version of local.conf was generated from an older/newer version of 
-local.conf.sample and there have been updates made to this file. Please compare the two 
+    failmsg = """Your version of local.conf was generated from an older/newer version of
+local.conf.sample and there have been updates made to this file. Please compare the two
 files and merge any changes before continuing.
 
 Matching the version numbers will remove this message.
 
-\"${SANITY_DIFF_TOOL} conf/local.conf ${SANITY_LOCALCONF_SAMPLE}\" 
+\"${SANITY_DIFF_TOOL} conf/local.conf ${SANITY_LOCALCONF_SAMPLE}\"
 
 is a good way to visualise the changes."""
     failmsg = d.expand(failmsg)
@@ -62,13 +62,13 @@ python oecore_update_siteconf() {
     current_sconf = d.getVar('SCONF_VERSION')
     sconf_version = d.getVar('SITE_CONF_VERSION')
 
-    failmsg = """Your version of site.conf was generated from an older version of 
-site.conf.sample and there have been updates made to this file. Please compare the two 
+    failmsg = """Your version of site.conf was generated from an older version of
+site.conf.sample and there have been updates made to this file. Please compare the two
 files and merge any changes before continuing.
 
 Matching the version numbers will remove this message.
 
-\"${SANITY_DIFF_TOOL} conf/site.conf ${SANITY_SITECONF_SAMPLE}\" 
+\"${SANITY_DIFF_TOOL} conf/site.conf ${SANITY_SITECONF_SAMPLE}\"
 
 is a good way to visualise the changes."""
     failmsg = d.expand(failmsg)
@@ -85,7 +85,7 @@ python oecore_update_bblayers() {
 
     failmsg = """Your version of bblayers.conf has the wrong LCONF_VERSION (has ${LCONF_VERSION}, expecting ${LAYER_CONF_VERSION}).
 Please compare your file against bblayers.conf.sample and merge any changes before continuing.
-"${SANITY_DIFF_TOOL} conf/bblayers.conf ${SANITY_BBLAYERCONF_SAMPLE}" 
+"${SANITY_DIFF_TOOL} conf/bblayers.conf ${SANITY_BBLAYERCONF_SAMPLE}"
 
 is a good way to visualise the changes."""
     failmsg = d.expand(failmsg)
@@ -182,7 +182,7 @@ def raise_sanity_error(msg, d, network_error=False):
     bb.fatal(""" OE-core's config sanity checker detected a potential misconfiguration.
     Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
     Following is the list of potential problems / advisories:
-    
+
     %s""" % msg)
 
 # Check flags associated with a tuning.
@@ -538,7 +538,7 @@ def check_wsl(d):
 def check_gcc_version(sanity_data):
     from distutils.version import LooseVersion
     import subprocess
-    
+
     build_cc, version = oe.utils.get_host_compiler_version(sanity_data)
     if build_cc.strip() == "gcc":
         if LooseVersion(version) < LooseVersion("6.0"):
@@ -561,7 +561,7 @@ def check_tar_version(sanity_data):
     return None
 
 # We use git parameters and functionality only found in 1.7.8 or later
-# The kernel tools assume git >= 1.8.3.1 (verified needed > 1.7.9.5) see #6162 
+# The kernel tools assume git >= 1.8.3.1 (verified needed > 1.7.9.5) see #6162
 # The git fetcher also had workarounds for git < 1.7.9.2 which we've dropped
 def check_git_version(sanity_data):
     from distutils.version import LooseVersion
@@ -644,7 +644,7 @@ def check_sanity_sstate_dir_change(sstate_dir, data):
 
 def check_sanity_version_change(status, d):
     # Sanity checks to be done when SANITY_VERSION or NATIVELSBSTRING changes
-    # In other words, these tests run once in a given build directory and then 
+    # In other words, these tests run once in a given build directory and then
     # never again until the sanity version or host distrubution id/version changes.
 
     # Check the python install is complete. Examples that are often removed in
@@ -784,6 +784,12 @@ def check_sanity_everybuild(status, d):
     if "." in paths or "./" in paths or "" in paths:
         status.addresult("PATH contains '.', './' or '' (empty element), which will break the build, please remove this.\nParsed PATH is " + str(paths) + "\n")
 
+    # Check whether 'inherit' directive is found (used for a class to inherit)
+    # in conf file it's supposed to be uppercase INHERIT
+    inherit = d.getVar('inherit')
+    if inherit:
+        status.addresult("Please don't use inherit directive in your local.conf. The directive is supposed to be used in classes and recipes only to inherit of bbclasses. Here INHERIT should be used.\n")
+
     # Check that the DISTRO is valid, if set
     # need to take into account DISTRO renaming DISTRO
     distro = d.getVar('DISTRO')
@@ -796,7 +802,7 @@ def check_sanity_everybuild(status, d):
         if d.getVar(v).startswith("~"):
             status.addresult("%s uses ~ but Bitbake will not expand this, use an absolute path or variables." % v)
 
-    # Check that DL_DIR is set, exists and is writable. In theory, we should never even hit the check if DL_DIR isn't 
+    # Check that DL_DIR is set, exists and is writable. In theory, we should never even hit the check if DL_DIR isn't
     # set, since so much relies on it being set.
     dldir = d.getVar('DL_DIR')
     if not dldir:
@@ -966,32 +972,32 @@ def check_sanity(sanity_data):
                     last_nativelsbstr = line.split()[1]
 
     check_sanity_everybuild(status, sanity_data)
-    
+
     sanity_version = int(sanity_data.getVar('SANITY_VERSION') or 1)
     network_error = False
     # NATIVELSBSTRING var may have been overridden with "universal", so
     # get actual host distribution id and version
     nativelsbstr = lsb_distro_identifier(sanity_data)
-    if last_sanity_version < sanity_version or last_nativelsbstr != nativelsbstr: 
+    if last_sanity_version < sanity_version or last_nativelsbstr != nativelsbstr:
         check_sanity_version_change(status, sanity_data)
         status.addresult(check_sanity_sstate_dir_change(sstate_dir, sanity_data))
-    else: 
+    else:
         if last_sstate_dir != sstate_dir:
             status.addresult(check_sanity_sstate_dir_change(sstate_dir, sanity_data))
 
     if os.path.exists(os.path.dirname(sanityverfile)) and not status.messages:
         with open(sanityverfile, 'w') as f:
-            f.write("SANITY_VERSION %s\n" % sanity_version) 
-            f.write("TMPDIR %s\n" % tmpdir) 
-            f.write("SSTATE_DIR %s\n" % sstate_dir) 
-            f.write("NATIVELSBSTRING %s\n" % nativelsbstr) 
+            f.write("SANITY_VERSION %s\n" % sanity_version)
+            f.write("TMPDIR %s\n" % tmpdir)
+            f.write("SSTATE_DIR %s\n" % sstate_dir)
+            f.write("NATIVELSBSTRING %s\n" % nativelsbstr)
 
     sanity_handle_abichanges(status, sanity_data)
 
     if status.messages != "":
         raise_sanity_error(sanity_data.expand(status.messages), sanity_data, status.network_error)
 
-# Create a copy of the datastore and finalise it to ensure appends and 
+# Create a copy of the datastore and finalise it to ensure appends and
 # overrides are set - the datastore has yet to be finalised at ConfigParsed
 def copy_data(e):
     sanity_data = bb.data.createCopy(e.data)
-- 
2.26.2

