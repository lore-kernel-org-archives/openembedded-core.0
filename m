Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FF67E77379
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 15:08:42 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.122216.1766588917078681423
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Dec 2025 07:08:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=nV3NrXv5;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-1329275-20251224150834282098c5f200020762-rmmoba@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20251224150834282098c5f200020762
        for <openembedded-core@lists.openembedded.org>;
        Wed, 24 Dec 2025 16:08:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=cSOH4Cbtmy2JybnDwf6Z3raCrldb6liB8BmCqbh6sSY=;
 b=nV3NrXv5QxZW4HpHmE1zGlKoQWokRUQExZRs+xk9I9eGJl3NgJ/Fcp377FIqLLzk+84S39
 4YkbDo57TDlnwBhUl60uAxNvVlXMmxzi2yAHrOKtZhXtIsJ9A+ywEWOSsfOVhIXRIcVL5CuS
 6b0K2jpldUZgW8kkQ0Xsun2ooRxb1+j+fadBlgBPRfDPr4+bd5sBNk+GV5OH8O1lIZV8T0RP
 +Z8BZ50hD0IQWPFk6nL2/25nppZJXRreT/SIZXATMOG9brVPSW3EEcjYAiw97ZWftlXln4Z0
 YfqLYcIzIvKn/prHmWsT9iUFWJ1EoNx7QL6iMXFafibmcBZ2HkZ49ClQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 2/2] oe-setup-vscode: improve VSCode bitbake-setup compatibility
Date: Wed, 24 Dec 2025 16:07:42 +0100
Message-ID: <20251224150805.3312684-3-adrian.freihofer@siemens.com>
In-Reply-To: <20251224150805.3312684-1-adrian.freihofer@siemens.com>
References: <20251224150805.3312684-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 15:08:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228542

From: Adrian Freihofer <adrian.freihofer@siemens.com>

VSCode is started in the workspace folder where the .vscode directory
is located. With the new bitbake-setup based build layout, this starts
VSCode in the openembedded-core directory, which means only files in
that layer are visible. This is not usable for most projects which
span multiple layers.

Enhance the VSCode setup to work with the new bitbake-setup layout by
moving the .vscode directory location from
     poky-master/layers/oe-init-build-env-dir/.vscode
to
     poky-master/.vscode
bringing all layers back into the scope of VSCode.

The oe-init-build-env script now detects the build layout by checking
for the presence of a layers directory, and adjusts the .vscode
location accordingly.

Additionally, the file exclusion patterns have been refined to improve
VSCode performance:
- Separated files.exclude from search.exclude patterns for better control
- Added exclusions for oe-init-build-env-dir and oe-scripts directories
- Prevented indexing of build artifacts and temporary files

The configuration now also detects whether to use oe-init-build-env or
init-build-env based on the detected build mode.

Usage example:
1. bitbake-setup creates a directory structure like:
     poky-master/
       layers/
         openembedded-core/
         meta-yourlayer/
       build/
         init-build-env

2. Create the .vscode directory in poky-master by running:
   . build/init-build-env

   The settings.json contains:
    "bitbake.pathToBitbakeFolder": ".../poky-master/layers/bitbake",
    "bitbake.pathToBuildFolder": "${workspaceFolder}/build",
    "bitbake.pathToEnvScript": "${workspaceFolder}/build/init-build-env",
    "bitbake.workingDirectory": "${workspaceFolder}",

3. Start VSCode in poky-master

Note: Starting VSCode before the .vscode directory exists may cause
VSCode to index the entire workspace, leading to high CPU and memory
usage. Future improvements could include creating a minimal .vscode
directory during bitbake-setup initialization.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 oe-init-build-env       | 16 ++++++++--
 scripts/oe-setup-vscode | 68 +++++++++++++++++++++++------------------
 2 files changed, 52 insertions(+), 32 deletions(-)

diff --git a/oe-init-build-env b/oe-init-build-env
index 82382f2707..6547cdd297 100755
--- a/oe-init-build-env
+++ b/oe-init-build-env
@@ -49,8 +49,20 @@ export OEROOT
 }
 
 # Generate an initial configuration for VSCode and the yocto-bitbake plugin.
-if command -v code > /dev/null && [ ! -d "$OEROOT/.vscode" ]; then
-    oe-setup-vscode "$OEROOT" "$BUILDDIR"
+if command -v code > /dev/null ; then
+    # bitbake-setup mode
+    if [ -d "$BUILDDIR/../layers" ]; then
+        echo "bitbake-setup mode detected for VSCode setup."
+        if [ ! -d "$BUILDDIR/../.vscode" ]; then
+            oe-setup-vscode "$BUILDDIR/../" "$BUILDDIR"
+        fi
+    # poky mode
+    else
+        echo "poky mode detected for VSCode setup."
+        if [ ! -d "$OEROOT/.vscode" ]; then
+            oe-setup-vscode "$OEROOT" "$BUILDDIR"
+        fi
+    fi
 fi
 
 unset OEROOT
diff --git a/scripts/oe-setup-vscode b/scripts/oe-setup-vscode
index 6818641d42..0fea1c4808 100755
--- a/scripts/oe-setup-vscode
+++ b/scripts/oe-setup-vscode
@@ -20,47 +20,52 @@ if [ ! -d "$OEINIT" ] || [ ! -d "$BUILDDIR" ]; then
     exit 1
 fi
 
-VSCODE_SETTINGS=$VSCODEDIR/settings.json
+mkdir -p "$VSCODEDIR"
+VSCODE_SETTINGS_TMP=$(mktemp -p "$VSCODEDIR")
 ws_builddir="$(echo "$BUILDDIR" | sed -e "s|$OEINIT|\${workspaceFolder}|g")"
+
+# poky mode or bitbake-setup mode
+ws_build_env="\${workspaceFolder}/oe-init-build-env"
+if [ -f "$BUILDDIR/init-build-env" ]; then
+    ws_build_env="${ws_builddir}/init-build-env"
+fi
+
 bb_dir="$(dirname "$(which bitbake)" | sed 's|/bin$||')"
 
+files_exclude="\"**/_build/**\": true,
+        \"**/.git/**\": true,
+        \"**/cache/**\": true,
+        \"**/downloads/**\": true,
+        \"**/node_modules/**\": true,
+        \"**/oe-init-build-env-dir/**\": true,
+        \"**/oe-scripts/**\": true,
+        \"**/sstate-cache/**\": true,
+        \"**/workspace/attic/**\": true"
+
+search_exclude="\"**/buildhistory/**\": true,
+        \"**/oe-logs/**\": true,
+        \"**/oe-workdir/**\": true,
+        \"**/tmp*/**\": true,
+        \"**/workspace/sources/**\": true"
+
 # If BUILDDIR is in scope of VSCode ensure VSCode does not try to index the build folder.
 # This would lead to a busy CPU and finally to an OOM exception.
-mkdir -p "$VSCODEDIR"
-cat <<EOMsettings > "$VSCODE_SETTINGS"
+cat <<EOMsettings > "$VSCODE_SETTINGS_TMP"
 {
     "bitbake.pathToBitbakeFolder": "$bb_dir",
-    "bitbake.pathToEnvScript": "\${workspaceFolder}/oe-init-build-env",
     "bitbake.pathToBuildFolder": "$ws_builddir",
-    "bitbake.commandWrapper": "",
+    "bitbake.pathToEnvScript": "$ws_build_env",
     "bitbake.workingDirectory": "\${workspaceFolder}",
     "files.exclude": {
-        "**/.git/**": true,
-        "**/_build/**": true,
-        "**/buildhistory/**": true,
-        "**/cache/**": true,
-        "**/downloads/**": true,
-        "**/node_modules/**": true,
-        "**/oe-logs/**": true,
-        "**/oe-workdir/**": true,
-        "**/sstate-cache/**": true,
-        "**/tmp*/**": true,
-        "**/workspace/attic/**": true,
-        "**/workspace/sources/**": true
+        $files_exclude
+    },
+    "search.exclude": {
+        $files_exclude,
+        $search_exclude
     },
     "files.watcherExclude": {
-        "**/.git/**": true,
-        "**/_build/**": true,
-        "**/buildhistory/**": true,
-        "**/cache/**": true,
-        "**/downloads/**": true,
-        "**/node_modules/**": true,
-        "**/oe-logs/**": true,
-        "**/oe-workdir/**": true,
-        "**/sstate-cache/**": true,
-        "**/tmp*/**": true,
-        "**/workspace/attic/**": true,
-        "**/workspace/sources/**": true
+        $files_exclude,
+        $search_exclude
     },
     "python.analysis.exclude": [
         "**/_build/**",
@@ -74,11 +79,14 @@ cat <<EOMsettings > "$VSCODE_SETTINGS"
         "**/sstate-cache/**",
         "**/tmp*/**",
         "**/workspace/attic/**",
-        "**/workspace/sources/**"
+        "**/workspace/sources/**",
+        "**/oe-init-build-env-dir/**",
+        "**/oe-scripts/**"
     ]
 }
 EOMsettings
 
+mv -f "$VSCODE_SETTINGS_TMP" "$VSCODEDIR/settings.json"
 
 # Ask the user if the yocto-bitbake extension should be installed
 VSCODE_EXTENSIONS=$VSCODEDIR/extensions.json
-- 
2.52.0


