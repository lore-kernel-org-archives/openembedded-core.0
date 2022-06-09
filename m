Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F46ACCA483
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 11:37:42 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web09.12052.1654774659067645396
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 04:37:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q8B1d2NE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id k19so31996550wrd.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 04:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5pnx8T9xRCuVOvbS1YTNAXaiv5KmCXR3B3MsugFnrHI=;
        b=Q8B1d2NEfIz+yjLgBOmfEPmxG30WmbK0zQJ7cJudAMIoXcnlLPcRTPZwKgcbWiYDTI
         W8LeQiS4zGCyT3lxTldh2Ln05aJ4Zlj1/3VJgEpe8ZFzQo9n17i1Va7Bb8mlttUSKqMH
         WB5hJ653Dw7GUuUYLAOVmVMcJRiLmIWvLL6Bs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5pnx8T9xRCuVOvbS1YTNAXaiv5KmCXR3B3MsugFnrHI=;
        b=crve5wGXVT0Yi3unSU05AY17SzULH80KpOrWrNpzUwPVHsCeQHT0vNtFG7KFIrHsLv
         nb2+IvBSxl8MjgqLgzicJ1zYHK/lM66D+9lTAg4rd0snAWwYC79v//NkWhtVsMlKvxQR
         I7zrNJ3noqs6j3IdRxYsRkZMVCK+QPQ6GKGTgudzxsPvlNUcsg1gRpNGBRIud8I4xjvN
         PBnK8lEqzhAatar4L/DS/IB2Pya+VT8J6ykDA2RSfoESY/jAVwD6yjSCTLbURca7I1yo
         6zHGjiJGgXIJpjDVuht+7u+qgHOJ0SOM6Kk/Qie+loKztbX5zPMK+c40P3BchWJGXGGp
         NeZw==
X-Gm-Message-State: AOAM532w4PX2SAqqaLcET49KIeL70NyJbtoRK8xKVIDgJHKRvmVJXluD
	GUt2bFleqJNS2yI939WUQoGJ9oAy5VBHcw==
X-Google-Smtp-Source: 
 ABdhPJytI0aQwvMsRltNCNWvKCIHWVQ048WLsyZDIk0NbECehyw3LX1BG3rSm0Oe+ouUlphh3QGJlg==
X-Received: by 2002:a05:6000:1acd:b0:218:54c8:1690 with SMTP id
 i13-20020a0560001acd00b0021854c81690mr12238108wry.114.1654774657334;
        Thu, 09 Jun 2022 04:37:37 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2888:8172:672a:5175])
        by smtp.gmail.com with ESMTPSA id
 o5-20020a05600c4fc500b0039c5a765388sm9843899wmq.28.2022.06.09.04.37.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:37:36 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] image-buildinfo: Improve and extend to SDK coverage too
Date: Thu,  9 Jun 2022 12:37:32 +0100
Message-Id: <20220609113732.43566-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113732.43566-1-richard.purdie@linuxfoundation.org>
References: <20220609113732.43566-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jun 2022 11:37:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166774

Rename the default file from "build" to "buildinfo" since this is more
obvious to anyone looking in an image.

Add SDK_BUILDINFO_FILE and allow the same information to be written into
SDK images. This will be useful for buildtools-tarball and uninative-tarball.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image-buildinfo.bbclass | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/meta/classes/image-buildinfo.bbclass b/meta/classes/image-buildinfo.bbclass
index d4a12b5e102..ef790bb73b4 100644
--- a/meta/classes/image-buildinfo.bbclass
+++ b/meta/classes/image-buildinfo.bbclass
@@ -1,5 +1,5 @@
 #
-# Writes build information to target filesystem on /etc/build
+# Writes build information to target filesystem on /etc/buildinfo
 #
 # Copyright (C) 2014 Intel Corporation
 # Author: Alejandro Enedino Hernandez Samaniego <alejandro.hernandez@intel.com>
@@ -13,7 +13,8 @@
 IMAGE_BUILDINFO_VARS ?= "DISTRO DISTRO_VERSION"
 
 # Desired location of the output file in the image.
-IMAGE_BUILDINFO_FILE ??= "${sysconfdir}/build"
+IMAGE_BUILDINFO_FILE ??= "${sysconfdir}/buildinfo"
+SDK_BUILDINFO_FILE ??= "/buildinfo"
 
 # From buildhistory.bbclass
 def image_buildinfo_outputvars(vars, d):
@@ -40,11 +41,12 @@ def buildinfo_target(d):
         vars = (d.getVar("IMAGE_BUILDINFO_VARS") or "")
         return image_buildinfo_outputvars(vars, d)
 
-# Write build information to target filesystem
-python buildinfo () {
+python buildinfo() {
     if not d.getVar('IMAGE_BUILDINFO_FILE'):
         return
-    with open(d.expand('${IMAGE_ROOTFS}${IMAGE_BUILDINFO_FILE}'), 'w') as build:
+    destfile = d.expand('${BUILDINFODEST}${IMAGE_BUILDINFO_FILE}')
+    bb.utils.mkdirhier(os.path.dirname(destfile))
+    with open(destfile, 'w') as build:
         build.writelines((
             '''-----------------------
 Build Configuration:  |
@@ -62,4 +64,18 @@ Layer Revisions:      |
        ))
 }
 
-IMAGE_PREPROCESS_COMMAND += "buildinfo;"
+# Write build information to target filesystem
+python buildinfo_image () {
+    d.setVar("BUILDINFODEST", "${IMAGE_ROOTFS}")
+    bb.build.exec_func("buildinfo", d)
+}
+
+python buildinfo_sdk () {
+    d.setVar("BUILDINFODEST", "${SDK_OUTPUT}/${SDKPATH}")
+    d.setVar("IMAGE_BUILDINFO_FILE", d.getVar("SDK_BUILDINFO_FILE"))
+    bb.build.exec_func("buildinfo", d)
+}
+
+IMAGE_PREPROCESS_COMMAND += "buildinfo_image;"
+POPULATE_SDK_PRE_TARGET_COMMAND += "buildinfo_sdk;"
+
-- 
2.34.1


