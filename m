Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60FF5E776C0
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 15:08:42 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.122215.1766588917078602382
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Dec 2025 07:08:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=GKusWuIL;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-1329275-202512241508344df93cf541000207a5-qyiagr@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202512241508344df93cf541000207a5
        for <openembedded-core@lists.openembedded.org>;
        Wed, 24 Dec 2025 16:08:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Qx3zpWlIYXMtydybpiGJrOQdb1H6KNnc30aO91WTDwI=;
 b=GKusWuILyLUB2iyofV5Q2rFlBfgARlcfFKUjX1OkNSeUIssThoPmECZZcpurhIXhzK4o+w
 UlwP/0jpzJJpxv2h094lq5BxNeuMviDMYQsAGBO50CuOL5hCkbsAB1xUkitgmpSmMPJ4AkGr
 r1GZ/pW1NY+LvB2JII73eTKEfGXPZPeNTJk3n2fNoebD86ZGWFXH790X0P+m/rpZ/UPqPPKE
 ddV0x2Nt9sWGEj/5vlMOwYk9TO97AnLM6F+oh54AdScPlrPIDI5CeecDDwWcPuwaT90t07HQ
 WxWhpJ6xVV0M5wiuuuPSGNfDGcRbcCWpsDtQnzOacqIHV2/VljhuGxhQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 1/2] oe-setup-vscode: improve bitbake-setup compatibility
Date: Wed, 24 Dec 2025 16:07:41 +0100
Message-ID: <20251224150805.3312684-2-adrian.freihofer@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228543

From: Adrian Freihofer <adrian.freihofer@siemens.com>

VSCode searches for the .vscode/settings.json file in the workspace
folder and its parent folders. Or the other way round, VSCode needs to
be started in a folder which contains the .vscode/settings.json file.
With bitbake-setup the .vscode/settings.json file created by
oe-setup-vscode is located for example in
bitbake-builds/poky-master/layers/oe-init-build-env-dir/.vscode/settings.json.

Layers looks like this:
  bitbake
  logs
  meta-yocto
  oe-init-build-env-dir -> openembedded-core
  .oe-layers.json
  oe-scripts -> openembedded-core/scripts
  openembedded-core
  setup-build -> openembedded-core/scripts/oe-setup-build
  yocto-docs

Since oe-init-build-env-dir is a sym-link to openembedded-core the
.vscode folder is effectively located in openembedded-core/.vscode.

Starting VSCode in oe-init-build-env-dir picks up the settings.json
file correctly but the VSCode Bitake plugin cannot find bitbake. Bitbake
is located in a folder at the same level as openembedded-core. So the
path to bitbake is not anymore workspaceFolder/bitbake but ../bitbake
relative to the workspace folder.
To fix this, we now dynamically determine the actual location of
bitbake by using `which bitbake` and adjusting the
bitbake.pathToBitbakeFolder setting accordingly.

This minimal fix makes VSCode usable without running into issues with
OOM exceptions due to indexing the build folder or bitbake not found
errors.

But the user experience is still much worse than with the simple poky
layout. Only the openembedded-core layer is visible in the workspace
folder. The other layers are not visible which means this setup is not
really usable yet. The .vscode/settings.json file is created at the
wrong path. This should be improved in future iterations.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/oe-setup-vscode | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-setup-vscode b/scripts/oe-setup-vscode
index b8642780d5..6818641d42 100755
--- a/scripts/oe-setup-vscode
+++ b/scripts/oe-setup-vscode
@@ -22,13 +22,14 @@ fi
 
 VSCODE_SETTINGS=$VSCODEDIR/settings.json
 ws_builddir="$(echo "$BUILDDIR" | sed -e "s|$OEINIT|\${workspaceFolder}|g")"
+bb_dir="$(dirname "$(which bitbake)" | sed 's|/bin$||')"
 
 # If BUILDDIR is in scope of VSCode ensure VSCode does not try to index the build folder.
 # This would lead to a busy CPU and finally to an OOM exception.
 mkdir -p "$VSCODEDIR"
 cat <<EOMsettings > "$VSCODE_SETTINGS"
 {
-    "bitbake.pathToBitbakeFolder": "\${workspaceFolder}/bitbake",
+    "bitbake.pathToBitbakeFolder": "$bb_dir",
     "bitbake.pathToEnvScript": "\${workspaceFolder}/oe-init-build-env",
     "bitbake.pathToBuildFolder": "$ws_builddir",
     "bitbake.commandWrapper": "",
-- 
2.52.0


