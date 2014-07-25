Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 45173706D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 13:15:23 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id l18so4074871wgh.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 06:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/TiV6svdlErk+ZM8CXMVTKv5qzdbvWGHNzm9ghy2sj4=;
	b=nY8QjtCQMKkAEk/unXzBTtKqRTJwabeNUbuYKpyCunftlHuwbl/EeXbP7hLOoitDnW
	Hgsduia29U0RrbISGBsrtjgytFTeEn70qPJYB5Rb9gqQ1BKrCuXpWGX/acn+hDrop8F6
	+F3HrmfBUFKS7iWc7D3BZGN0diw02Kh2on/O73FvobIotg8jmjU2XYbghxCkJxk0Ghs/
	wEW3sp127LMQ++wqKGnkTe3SWoya4qdvRvL6hC9ti15PxEoaDOeduvhHF0oqdX8zopiA
	DATGsFjSxAw4wdXxWDhqHdVaOLDCc0cenlnxQHqvJ5exuhiVj2HWQiD4ZgyWdFFwyksz
	pqHw==
X-Received: by 10.194.221.6 with SMTP id qa6mr21338056wjc.39.1406294122461;
	Fri, 25 Jul 2014 06:15:22 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o2sm5812651wij.24.2014.07.25.06.15.21 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jul 2014 06:15:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Jul 2014 15:15:38 +0200
Message-Id: <1406294138-31362-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.2
Subject: [PATCH] buildhistory: rename build-id to build-id.txt and add more info
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
X-List-Received-Date: Fri, 25 Jul 2014 13:15:24 -0000

* use .txt extension like other reports (e.g. image-info.txt) it's
  also useful when looking at the file from web server which doesn't
  have text/plain as default content-type
* include whole BUILDCFG_HEADER/BUILDCFG_FUNCS instead of just layer
  info
* this makes it easier for distro to include more fields without the
  need to modify buildhistory.bbclass
* currently it adds following fields:
  Build Configuration:
  BB_VERSION        = "1.23.1"
  BUILD_SYS         = "x86_64-linux"
  NATIVELSBSTRING   = "Gentoo-2.2"
  TARGET_SYS        = "x86_64-oe-linux"
  MACHINE           = "qemux86-64"
  DISTRO            = "shr"
  DISTRO_VERSION    = "2013.07-next-20140725"
  TUNE_FEATURES     = "m64 core2"
  TARGET_FPU        = ""

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/buildhistory.bbclass | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 20382ce..479e460 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -461,10 +461,10 @@ END
 	echo "IMAGESIZE = $imagesize" >> ${BUILDHISTORY_DIR_IMAGE}/image-info.txt
 
 	# Add some configuration information
-	echo "${MACHINE}: ${IMAGE_BASENAME} configured for ${DISTRO} ${DISTRO_VERSION}" > ${BUILDHISTORY_DIR_IMAGE}/build-id
+	echo "${MACHINE}: ${IMAGE_BASENAME} configured for ${DISTRO} ${DISTRO_VERSION}" > ${BUILDHISTORY_DIR_IMAGE}/build-id.txt
 
-	cat >> ${BUILDHISTORY_DIR_IMAGE}/build-id <<END
-${@buildhistory_get_layers(d)}
+	cat >> ${BUILDHISTORY_DIR_IMAGE}/build-id.txt <<END
+${@buildhistory_get_build_id(d)}
 END
 }
 
@@ -498,11 +498,21 @@ POPULATE_SDK_POST_HOST_COMMAND_append = " buildhistory_list_installed_sdk_host ;
 
 SDK_POSTPROCESS_COMMAND += "buildhistory_get_sdkinfo ; "
 
-def buildhistory_get_layers(d):
-    if d.getVar('BB_WORKERCONTEXT', True) != '1':
-        return ""
-    layertext = "Configured metadata layers:\n%s\n" % '\n'.join(get_layers_branch_rev(d))
-    return layertext
+def buildhistory_get_build_id(d):
+    localdata = bb.data.createCopy(d)
+    bb.data.update_data(localdata)
+    statuslines = []
+    for func in oe.data.typed_value('BUILDCFG_FUNCS', localdata):
+        g = globals()
+        if func not in g:
+            bb.warn("Build configuration function '%s' does not exist" % func)
+        else:
+            flines = g[func](localdata)
+            if flines:
+                statuslines.extend(flines)
+
+    statusheader = d.getVar('BUILDCFG_HEADER', True)
+    return('\n%s\n%s\n' % (statusheader, '\n'.join(statuslines)))
 
 def buildhistory_get_metadata_revs(d):
     # We want an easily machine-readable format here, so get_layers_branch_rev isn't quite what we want
-- 
2.0.2


