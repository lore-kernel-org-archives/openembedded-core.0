Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.3682.1590264991159323677
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 May 2020 13:16:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NCL2uisP;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: gzatko@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id f5so5037505wmh.2
        for <openembedded-core@lists.openembedded.org>; Sat, 23 May 2020 13:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hrkob+Ujv7LXX2Fc7eGfyXf/IWdPSta12M7wifj65I8=;
        b=NCL2uisP0v0+K/9DIFsKHKhELaDI5O1XuZqZCiicDaXS9YiWQ/etJKKyrYpfX6/FXh
         AfbWyvKk7mPG18/UVq5pTbSnhUcDg6AXq9/cSF8R2PKugOh5sg7rpNBVM79QJc2VBG3o
         tRiIjs+enrnVZM5tkFOTix3avzRqSj8xPaZCxxQYpOuPnaSu/HHPYkVOWLvWdhZc6NOu
         12aBWY1brLJZg7MvYdm6CnvcZWZKlxTbVoZgtgF8BHpzMCBj6UMhZtTIjnt+LfYP7INf
         bF5SEsiLvGfFgc1kysYfAARbUpDi5sC8zV2urE9Tk4UtpM1OhFXBEQGdfot5BzOt1Fet
         S29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hrkob+Ujv7LXX2Fc7eGfyXf/IWdPSta12M7wifj65I8=;
        b=Sesg6yBuLjj9GDATpZOi4iL2QShg1Yg/fzY8Qi9Z9j5bJL9mqIfwsFF2hGbWCViwwf
         R6akcKtc29oRE4xlH4C1YxyJ5jFDWJZOjZjl1Fx4g0iQjqy52Y8X6l/OA/HZMY38OLty
         bhBrOHKcksEAd7vBYtcp3juriQ74on01SlAJdwow10W+u85FfOt8XJmvRSlusZKO78bg
         oD/t4rbbYAdxhr/rbnQTY2ZUIbw4JutuOccWJshq7/2Hshdt0PQ1X+d0XlKBi+yIS/T2
         1kv8qHG880Y2GlQPudJtk/JT5a0rT+HEswQkU7E4bBQBRhlIAhqtnLAdufyBI/ddbiYv
         9XSA==
X-Gm-Message-State: AOAM531831IGa31cgH++BcTwb0gCefXznJqRaBBzNUDojTepr/uXhQiE
	19CKiN1fbj0njeGxA5zDtltyX3upR+U=
X-Google-Smtp-Source: ABdhPJyDh/7gu2wxyLzuqYg55umeCdrZHs0MiI0QRPNJawoFfgGqi2/+ijIKemVp+KEGGBY8QMziyg==
X-Received: by 2002:a7b:cd94:: with SMTP id y20mr2685788wmj.87.1590264989148;
        Sat, 23 May 2020 13:16:29 -0700 (PDT)
Return-Path: <gzatko@gmail.com>
Received: from blizzard-1040g6.lan (93.184.67.240.host.vnet.sk. [93.184.67.240])
        by smtp.gmail.com with ESMTPSA id v205sm13086039wmg.11.2020.05.23.13.16.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2020 13:16:28 -0700 (PDT)
From: "Gregor Zatko" <gzatko@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sanity.bbclass: Detect and fail if 'inherit' is used in conf file
Date: Sat, 23 May 2020 22:16:26 +0200
Message-Id: <20200523201626.1295537-1-gzatko@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'inherit' directive may not be used in conf files as it's supposed
to be used for the inheritance of recipes.
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
index 292c5591dd..8367842af0 100644
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
 
+    # Check whether 'inherit' directive is found (used for a recipe to inherit)
+    # in conf file it's supposed to be uppercase INHERIT
+    inherit = d.getVar('inherit')
+    if inherit:
+        status.addresult("Please don't use inherit directive in your local.conf. The directive is supposed to be used in recipes to inherit of others. Here INHERIT should be used.\n")
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

