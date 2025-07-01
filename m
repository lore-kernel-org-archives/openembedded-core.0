Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BDA3C7EE30
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 19:39:38 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.6195.1751398774681761267
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 12:39:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GdXUKAeg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso40570405e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 12:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751398772; x=1752003572; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RSa3WfOKYkHA+VHeEAnPcbAp3MHutZR8SkCi1ShVXcE=;
        b=GdXUKAegFgRRsJbOLu+HoUVl2GNFY8S0Pi21dZ8+dy+V5EW+oAcaLYXV3tPDGNuiBy
         P9dpyR0oMuzt7YmK2Bpda7cRuLF9WJjTJFny2rlEvQtq58XGJr+ZYVxzd2GzYvFLkO9P
         umG/oEhf1ucNc/dh/jws5WLKs69z/dA/fOaEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751398772; x=1752003572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RSa3WfOKYkHA+VHeEAnPcbAp3MHutZR8SkCi1ShVXcE=;
        b=S8jkPbQWa2tWPTUC0KHVVc9xqdi8fQYuHGF4tEzm94/VpP/JF9C5Gis0Jm6xtezQ5x
         B0O7n1ImNfoR8I/4aBRc6IU3LrsX7z2xZ4NS5sJ6dcGAD+zpIS0tjZlvm4YX6E8JUunu
         k5MXVbz7Ksna2Nb9IpGsJGq3t9bwCiu4sMpfKFSGydvD15oU11Hh0QTwviYGbwgrUujt
         fkaIHnxcErRQSAEv+hY/nrQx3jVPvVKcUlZcJ+PawIPyIup89z4OlIPdDI/6DBagCeHv
         0RO3gPwNBmKa0fKUERGHKcLVwM87uj02zzE9+1HysK9NjEx06qYkoOqQbKMeZfYw2Tb9
         iJsg==
X-Gm-Message-State: AOJu0YyGOjWYV6hmwk10H/o3eQQsNngSJP697/TINs722aazoUtKHAkq
	TNPW0QGyIfX/tgjEXxPGYIgGKGcSdm58e8XGxsJsA351OGDfDBckrEqxo3FJEmZD4m0IXbDWpzI
	wmPNn
X-Gm-Gg: ASbGncsL22lXSMiAPijH7fGr8EyRl37SF16N3a2aNlyLDq6xuvhfkketeHw6ibwniqx
	VHrMqe6t4uJEQSih1WG1VF4txkO6FudZ0elELunNJuMz+dnsWRJr1lg+6AsAIqHlOFOGA4W1rPS
	s+/F5npPfIHw6KHX6F52OMp40cyRz0f0zqV7bS9YfMPsLHbWIzeFssdgEcBadJFkSFTCYActSYJ
	Oi+9M0VtJj9waEteyNvob6clRaQttIcNJjUttxwnmyXlw8fPqkSO+T7o8gVcG+lU297KvVVe7a2
	uasN4fZNFbwJUmaVCLv3lBVQG0FsSGjNzMG76FMJJgJNUaNsDbASdsmMsou1zIHkO2bf9ZJH1pe
	oTkKsU+ToM3F+bTKr2Il0pC8fjA==
X-Google-Smtp-Source: AGHT+IFUk42OmjZhwO+VX7YRih9cL149w/9y0l8svMM+2TQwEJFCELBX9dr6ULFyq5cmTmzQBZMzcQ==
X-Received: by 2002:a05:600c:4ed2:b0:440:6a37:be0d with SMTP id 5b1f17b1804b1-454a36ec535mr4454995e9.15.1751398772042;
        Tue, 01 Jul 2025 12:39:32 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:62fa:d15d:397d:870e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fa5easm13803190f8f.26.2025.07.01.12.39.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 12:39:31 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] uninative/utils: Drop workarounds for gcc 4.8/4.9
Date: Tue,  1 Jul 2025 20:39:30 +0100
Message-ID: <20250701193930.3544114-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 19:39:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219718

We require at least gcc 8.0 in sanity.bbclass so drop the 4.8/4.9
special case handling in uninative.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/uninative.bbclass         |  2 +-
 meta/classes-recipe/populate_sdk_base.bbclass |  1 -
 meta/classes-recipe/populate_sdk_ext.bbclass  |  8 ++----
 meta/files/toolchain-shar-extract.sh          |  5 ----
 meta/lib/oe/utils.py                          | 26 -------------------
 5 files changed, 3 insertions(+), 39 deletions(-)

diff --git a/meta/classes-global/uninative.bbclass b/meta/classes-global/uninative.bbclass
index 75e0c19704d..c246a1ecd6c 100644
--- a/meta/classes-global/uninative.bbclass
+++ b/meta/classes-global/uninative.bbclass
@@ -142,7 +142,7 @@ def enable_uninative(d):
     loader = d.getVar("UNINATIVE_LOADER")
     if os.path.exists(loader):
         bb.debug(2, "Enabling uninative")
-        d.setVar("NATIVELSBSTRING", "universal%s" % oe.utils.host_gcc_version(d))
+        d.setVar("NATIVELSBSTRING", "universal")
         d.appendVar("SSTATEPOSTUNPACKFUNCS", " uninative_changeinterp")
         d.appendVarFlag("SSTATEPOSTUNPACKFUNCS", "vardepvalueexclude", "| uninative_changeinterp")
         d.appendVar("BUILD_LDFLAGS", " -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=${UNINATIVE_LOADER} -pthread")
diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index 8ef4b2be777..e6685cde97b 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -373,7 +373,6 @@ EOF
 		-e 's#@SDK_VERSION@#${SDK_VERSION}#g' \
 		-e '/@SDK_PRE_INSTALL_COMMAND@/d' \
 		-e '/@SDK_POST_INSTALL_COMMAND@/d' \
-		-e 's#@SDK_GCC_VER@#${@oe.utils.host_gcc_version(d, taskcontextonly=True)}#g' \
 		-e 's#@SDK_ARCHIVE_TYPE@#${SDK_ARCHIVE_TYPE}#g' \
 		${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.sh
 
diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index 2d7d661d259..20dfdf02d42 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -150,7 +150,6 @@ def create_filtered_tasklist(d, sdkbasepath, tasklistfile, conf_initpath):
         with open(sdkbasepath + '/conf/local.conf', 'a') as f:
             # Force the use of sstate from the build system
             f.write('\nSSTATE_DIR:forcevariable = "%s"\n' % d.getVar('SSTATE_DIR'))
-            f.write('SSTATE_MIRRORS:forcevariable = "file://universal/(.*) file://universal-4.9/\\1 file://universal-4.9/(.*) file://universal-4.8/\\1"\n')
             # Ensure TMPDIR is the default so that clean_esdk_builddir() can delete it
             f.write('TMPDIR:forcevariable = "${TOPDIR}/tmp"\n')
             # Drop uninative if the build isn't using it (or else NATIVELSBSTRING will
@@ -380,9 +379,6 @@ def write_local_conf(d, baseoutpath, derivative, core_meta_subdir, uninative_che
             f.write('# Provide a flag to indicate we are in the EXT_SDK Context\n')
             f.write('WITHIN_EXT_SDK = "1"\n\n')
 
-            # Map gcc-dependent uninative sstate cache for installer usage
-            f.write('SSTATE_MIRRORS += " file://universal/(.*) file://universal-4.9/\\1 file://universal-4.9/(.*) file://universal-4.8/\\1"\n\n')
-
             if d.getVar("PRSERV_HOST"):
                 # Override this, we now include PR data, so it should only point ot the local database
                 f.write('PRSERV_HOST = "localhost:0"\n\n')
@@ -491,8 +487,8 @@ def prepare_locked_cache(d, baseoutpath, derivative, conf_initpath):
     sstate_out = baseoutpath + '/sstate-cache'
     bb.utils.remove(sstate_out, True)
 
-    # uninative.bbclass sets NATIVELSBSTRING to 'universal%s' % oe.utils.host_gcc_version(d)
-    fixedlsbstring = "universal%s" % oe.utils.host_gcc_version(d) if bb.data.inherits_class('uninative', d) else ""
+    # uninative.bbclass sets NATIVELSBSTRING to 'universal'
+    fixedlsbstring = "universal" if bb.data.inherits_class('uninative', d) else ""
 
     sdk_include_toolchain = (d.getVar('SDK_INCLUDE_TOOLCHAIN') == '1')
     sdk_ext_type = d.getVar('SDK_EXT_TYPE')
diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 06934e5a9ab..ff74ca25245 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -145,11 +145,6 @@ fi
 # SDK_EXTENSIBLE is exposed from the SDK_PRE_INSTALL_COMMAND above
 if [ "$SDK_EXTENSIBLE" = "1" ]; then
 	DEFAULT_INSTALL_DIR="@SDKEXTPATH@"
-	if [ "$INST_GCC_VER" = '4.8' -a "$SDK_GCC_VER" = '4.9' ] || [ "$INST_GCC_VER" = '4.8' -a "$SDK_GCC_VER" = '' ] || \
-		[ "$INST_GCC_VER" = '4.9' -a "$SDK_GCC_VER" = '' ]; then
-		echo "Error: Incompatible SDK installer! Your host gcc version is $INST_GCC_VER and this SDK was built by gcc higher version."
-		exit 1
-	fi
 fi
 
 if [ "$target_sdk_dir" = "" ]; then
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index a11db5f3cd9..0378071b5ca 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -444,32 +444,6 @@ def get_host_compiler_version(d, taskcontextonly=False):
     version = match.group(1)
     return compiler, version
 
-
-def host_gcc_version(d, taskcontextonly=False):
-    import re, subprocess
-
-    if taskcontextonly and d.getVar('BB_WORKERCONTEXT') != '1':
-        return
-
-    compiler = d.getVar("BUILD_CC")
-    # Get rid of ccache since it is not present when parsing.
-    if compiler.startswith('ccache '):
-        compiler = compiler[7:]
-    try:
-        env = os.environ.copy()
-        env["PATH"] = d.getVar("PATH")
-        output = subprocess.check_output("%s --version" % compiler, \
-                    shell=True, env=env, stderr=subprocess.STDOUT).decode("utf-8")
-    except subprocess.CalledProcessError as e:
-        bb.fatal("Error running %s --version: %s" % (compiler, e.output.decode("utf-8")))
-
-    match = re.match(r".* (\d+\.\d+)\.\d+.*", output.split('\n')[0])
-    if not match:
-        bb.fatal("Can't get compiler version from %s --version output" % compiler)
-
-    version = match.group(1)
-    return "-%s" % version if version in ("4.8", "4.9") else ""
-
 @bb.parse.vardepsexclude("DEFAULTTUNE_MULTILIB_ORIGINAL", "OVERRIDES")
 def get_multilib_datastore(variant, d):
     localdata = bb.data.createCopy(d)

