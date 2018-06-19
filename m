Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8E730754A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 11:45:13 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id o13-v6so19325637wmf.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 04:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=7YWtEs+WDSgdSIDvh3UO04nIUzjKwsksJR+KXoy8NWg=;
	b=hDaAFnMgFsH8UuRXaUJ0HqIrTrBTbL/KcU1UaVrew3yyKky/bF7P8akCqKFXrztR7M
	tkSEhSuf3UyazsQXBo4f9KOnyrMfOIoqaU9DCPAaeMMpFEp9a4j9NaMLpxQUHEo2Ng8f
	WrDLhgqyFRli/DnhRRMZX1iJGYtgAuIKb2C/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=7YWtEs+WDSgdSIDvh3UO04nIUzjKwsksJR+KXoy8NWg=;
	b=H/dhdn/h1QOMngdheYfKa87y3WPedtnzfsid9sn65zocxMLNGXf2Xg6L+gfxiBAtRK
	ZzkbYijmkmNxBKmv7BteUtGPvtao4zSqXVjCss4dM6yfRUQK9nkNnaTy7MJq9y2WVjt3
	MrmO+G5uJaE9iNOphD0r0gzN8L5Xxr1VdL4qJPoUv4C9FJuS9jr9w+sq2lLwOjbFXXQ1
	I/t+7SZMyYF+xnY8WCgmubCBTt3zM2ii4VJTz8QOOdWQ5ZlMrZkGv8FtH4+9Au6F1OUE
	Lbdn3T8oQ0lpN3l17wjGaEAUFbDTMuzSaxU3MN3Os9q6LRd4Ep4VDkf5CqNpln3nVqga
	BuHg==
X-Gm-Message-State: APt69E3l9FxSjNT6oKzy7NaVFKTpq0WgBs5OEMWH5sifkahnwZpbq6GO
	dH6VxTgU+6KlCScHmAF+0xiKe3KpwNk=
X-Google-Smtp-Source: ADUXVKIztfc2ua195e80OovUXAT+Dh5C6OU9z4GEYrTaLCvirzjkdtDK1elb0xD8fKoujvH01iOZww==
X-Received: by 2002:a1c:978f:: with SMTP id
	z137-v6mr12384831wmd.40.1529408713889; 
	Tue, 19 Jun 2018 04:45:13 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n18-v6sm22065902wrj.58.2018.06.19.04.45.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Jun 2018 04:45:12 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2018 12:45:10 +0100
Message-Id: <20180619114512.11699-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/3] image: Combine all the class handling code into a single section
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
X-List-Received-Date: Tue, 19 Jun 2018 11:45:14 -0000

Right now the code handling class inherits is spread all over and
its hard to get an idea of what is happening overall. Combine all
the code together to make it clearer. There shoould be no functionality
changes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image.bbclass | 45 ++++++++++++++------------------------
 1 file changed, 17 insertions(+), 28 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 16c6b1256e2..cc889cf5dfe 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -1,9 +1,23 @@
-inherit rootfs_${IMAGE_PKGTYPE}
+def build_live(d):
+    if bb.utils.contains("IMAGE_FSTYPES", "live", "live", "0", d) == "0": # live is not set but hob might set iso or hddimg
+        d.setVar('NOISO', bb.utils.contains('IMAGE_FSTYPES', "iso", "0", "1", d))
+        d.setVar('NOHDD', bb.utils.contains('IMAGE_FSTYPES', "hddimg", "0", "1", d))
+        if d.getVar('NOISO') == "0" or d.getVar('NOHDD') == "0":
+            return "image-live"
+        return ""
+    return "image-live"
 
+# Handle inherits of any of the image classes we need
+IMGCLASSES = "rootfs_${IMAGE_PKGTYPE} image_types ${IMAGE_CLASSES}"
 # Only Linux SDKs support populate_sdk_ext, fall back to populate_sdk_base
 # in the non-Linux SDK_OS case, such as mingw32
-SDKEXTCLASS ?= "${@['populate_sdk_base', 'populate_sdk_ext']['linux' in d.getVar("SDK_OS")]}"
-inherit ${SDKEXTCLASS}
+IMGCLASSES += "${@['populate_sdk_base', 'populate_sdk_ext']['linux' in d.getVar("SDK_OS")]}"
+IMGCLASSES += "${@build_live(d)}"
+IMGCLASSES += "${@bb.utils.contains('IMAGE_FSTYPES', 'container', 'image-container', '', d)}"
+IMGCLASSES += "image_types_wic"
+IMGCLASSES += "${@oe.utils.conditional('TEST_IMAGE', '1', 'testimage-auto', '', d)}"
+IMGCLASSES += "rootfs-postcommands"
+inherit ${IMGCLASSES}
 
 TOOLCHAIN_TARGET_TASK += "${PACKAGE_INSTALL}"
 TOOLCHAIN_TARGET_TASK_ATTEMPTONLY += "${PACKAGE_INSTALL_ATTEMPTONLY}"
@@ -18,9 +32,6 @@ PATH_prepend = "${@":".join(all_multilib_tune_values(d, 'STAGING_BINDIR_CROSS').
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-TESTIMAGECLASS = "${@oe.utils.conditional('TEST_IMAGE', '1', 'testimage-auto', '', d)}"
-inherit ${TESTIMAGECLASS}
-
 # IMAGE_FEATURES may contain any available package group
 IMAGE_FEATURES ?= ""
 IMAGE_FEATURES[type] = "list"
@@ -127,23 +138,6 @@ do_rootfs[vardeps] += "${@rootfs_variables(d)}"
 
 do_build[depends] += "virtual/kernel:do_deploy"
 
-def build_live(d):
-    if bb.utils.contains("IMAGE_FSTYPES", "live", "live", "0", d) == "0": # live is not set but hob might set iso or hddimg
-        d.setVar('NOISO', bb.utils.contains('IMAGE_FSTYPES', "iso", "0", "1", d))
-        d.setVar('NOHDD', bb.utils.contains('IMAGE_FSTYPES', "hddimg", "0", "1", d))
-        if d.getVar('NOISO') == "0" or d.getVar('NOHDD') == "0":
-            return "image-live"
-        return ""
-    return "image-live"
-
-IMAGE_TYPE_live = "${@build_live(d)}"
-inherit ${IMAGE_TYPE_live}
-
-IMAGE_TYPE_container = '${@bb.utils.contains("IMAGE_FSTYPES", "container", "image-container", "", d)}'
-inherit ${IMAGE_TYPE_container}
-
-IMAGE_TYPE_wic = "image_types_wic"
-inherit ${IMAGE_TYPE_wic}
 
 python () {
     def extraimage_getdepends(task):
@@ -178,9 +172,6 @@ python () {
     check_image_features(d)
 }
 
-IMAGE_CLASSES += "image_types"
-inherit ${IMAGE_CLASSES}
-
 IMAGE_POSTPROCESS_COMMAND ?= ""
 
 # some default locales
@@ -192,8 +183,6 @@ LINGUAS_INSTALL ?= "${@" ".join(map(lambda s: "locale-base-%s" % s, d.getVar('IM
 # aren't yet available.
 PSEUDO_PASSWD = "${IMAGE_ROOTFS}:${STAGING_DIR_NATIVE}"
 
-inherit rootfs-postcommands
-
 PACKAGE_EXCLUDE ??= ""
 PACKAGE_EXCLUDE[type] = "list"
 
-- 
2.17.1


