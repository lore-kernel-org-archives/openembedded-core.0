Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D14BC02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 17:52:19 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.19077.1738777929007027425
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 09:52:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=fr4NinBf;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20250205175205f4b2b45fed6d016dbc-rkyzvg@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250205175205f4b2b45fed6d016dbc
        for <openembedded-core@lists.openembedded.org>;
        Wed, 05 Feb 2025 18:52:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=mVoStZ36d1TyKUM9IvTAovOhr6678lsAI707Ps6qt/k=;
 b=fr4NinBfN6SyUUUfU/ya25bm1/V7NENlJQSxo4vlNyKiehSahLItPy7vUSAwW1z9ZUa2sg
 2bHXcI4qUPdaRT+k9nbBW6zO9/5yXqn7bgbImtlhW9LmiO26mceUwzp6A0jqjHcNk8T2bUF7
 j/D3HhlVF8D3WTnmU//6WhJY3oVbuj/XuOQAgEqxJtI9R3eRHPzv+iYJ1dAFErqbEzS/zarX
 WFwMlqUi3o/LrBl2rNYUBMmdhCYR94oO0O+zL02tKkfGBmZAC13G/18hppHwXWXNa5XVTaBV
 AbXYXZtX1pL80a7f8MlrhQZOYf9Wrk4WsgF6xqBXTE6YK1vEME24VLvg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] classes: switch p7zip to 7zip
Date: Wed,  5 Feb 2025 18:51:18 +0100
Message-Id: <20250205175118.1334967-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 17:52:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210871

From: Peter Marko <peter.marko@siemens.com>

meta-oe has switched from p7zip to 7zip.
p7zip recipe does not exist anymore and p7zip is provided and rprovided
by 7zip recipe.
Use real provider instead of replaced one.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes-global/base.bbclass              | 4 ++--
 meta/classes-recipe/image_types.bbclass       | 2 +-
 meta/classes-recipe/populate_sdk_base.bbclass | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 988bdbcf0f..924f319999 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -645,9 +645,9 @@ python () {
         elif path.endswith('.deb'):
             d.appendVarFlag('do_unpack', 'depends', ' xz-native:do_populate_sysroot')
 
-        # *.7z should DEPEND on p7zip-native for unpacking
+        # *.7z should DEPEND on 7zip-native for unpacking
         elif path.endswith('.7z'):
-            d.appendVarFlag('do_unpack', 'depends', ' p7zip-native:do_populate_sysroot')
+            d.appendVarFlag('do_unpack', 'depends', ' 7zip-native:do_populate_sysroot')
 
     set_packagetriplet(d)
 
diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index 87d6effc6c..e6ef0ce11e 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -367,7 +367,7 @@ CONVERSION_DEPENDS_xz = "xz-native"
 CONVERSION_DEPENDS_lz4 = "lz4-native"
 CONVERSION_DEPENDS_lzo = "lzop-native"
 CONVERSION_DEPENDS_zip = "zip-native"
-CONVERSION_DEPENDS_7zip = "p7zip-native"
+CONVERSION_DEPENDS_7zip = "7zip-native"
 CONVERSION_DEPENDS_zst = "zstd-native"
 CONVERSION_DEPENDS_sum = "mtd-utils-native"
 CONVERSION_DEPENDS_bmap = "bmaptool-native"
diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index 98ac723552..f111466b4c 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -94,7 +94,7 @@ python () {
        # recommand to cd into input dir first to avoid archive with buildpath
        d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; zip -r ${SDK_ZIP_OPTIONS} ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} .')
     elif d.getVar('SDK_ARCHIVE_TYPE') == '7zip':
-       d.setVar('SDK_ARCHIVE_DEPENDS', 'p7zip-native')
+       d.setVar('SDK_ARCHIVE_DEPENDS', '7zip-native')
        d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; 7za a -r ${SDK_7ZIP_OPTIONS} ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_7ZIP_TYPE} .')
     elif d.getVar('SDK_ARCHIVE_TYPE') == 'tar.zst':
        d.setVar('SDK_ARCHIVE_DEPENDS', 'zstd-native')

