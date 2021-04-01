Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web12.1122.1617290976729717934
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Apr 2021 08:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=xXtv6jc+;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.178, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f178.google.com with SMTP id i3so2134526oik.7
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Apr 2021 08:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Ici5irlVLV4rzkW2pSoxwmEyaYUUDIGGkObWAEcPFSA=;
        b=xXtv6jc+DaerDUyYStXWH5tQkI03A4WOTPQu+leu7T5Xk0lZ6qO2VqGSY68fbNa4W4
         jQ94zZhfNUUCVpYpSF54YEzklwsunnyWxNbv+4l1/vTZDcOjGLk73+zryeRUfJuhhV1O
         9K+rgk7NhLxlvAZElFMY0ITgSDMHsvVy64z8fbuRzfWaukBnnWzAM3omlsZgt6e9Vyia
         gqchQZWHGyyuboF+3o/lYH5uBT6Znw9tn9usTuU7lUfsZdUTUd7F+RCXCyOKnSns8bWK
         jW7t5JPG+5HqHOAn5ZQWi4hAzwEdPifx9hWffhkphfIXzqt56OxtD5pBcjKgtAiW64Dt
         DkBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ici5irlVLV4rzkW2pSoxwmEyaYUUDIGGkObWAEcPFSA=;
        b=sTKGBCmDPtPATT88uFbmYDqY3Rz+engG8pZK8s7HGrnGPkQSy5Rwt7+MvTkUTl7xNu
         trw1oHFhs8KZ/p6dX2loZMs5E8KdWjGs6ogp0ZxQ0Rgzq4YDTBpNmyGVl6Rdy02667Cw
         0hwqC6VETU4xDwqW+nnSuptD8WCd7La7wthd5Rk3zecOnlYzaKjiFSSttX76eDWIOfJP
         4zmDgmRy2vIqPg+HEUlSIQqAeoU9AJ0xRxjF1Im1Oehe+0+ibMo6WpXkQY31iSxssYCj
         Z/6rpxRvrKQcED2eKICdK4vINcvMl/p+GBNqFS9V2pW0Ps9sdy9Qqo+ePk2IZVIxvru0
         BxGg==
X-Gm-Message-State: AOAM533Q6kITnN65KopXL66MgbviEdFQiXYNY2tJP45UnkC9mtkaOI1E
	nnytY2YkU2h49w6+ehMzEs7VBeCdydqU+NSd3N4=
X-Google-Smtp-Source: ABdhPJx53iyBM8S/LGLzexQ8VTa8qsYDRaT3NTntiK8Rtfs12X/eFXM1xuCDMprai03fVkEiWaFLJQ==
X-Received: by 2002:aca:eb82:: with SMTP id j124mr6380898oih.57.1617290975548;
        Thu, 01 Apr 2021 08:29:35 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id u7sm1159610ooq.13.2021.04.01.08.29.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 08:29:35 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/15] image,populate_sdk_base: move 'func' flag setting for sdk command vars
Date: Thu,  1 Apr 2021 05:27:44 -1000
Message-Id: <6c405fa0e3c5ba82aace5ba62fdc2de541fa97a6.1617290310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617290309.git.steve@sakoman.com>
References: <cover.1617290309.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Christopher Larson <kergoth@gmail.com>

Setting the 'func' flag on the commands variables ensures that they are parsed
as shell, and therefore that the referenced commands contents are included in
checksums. Doing this only in image.bbclass means that this is missing in
recipes that are not images, but which inherit populate_sdk or populate_sdk_base
directly, so move it to the latter.

[YOCTO #13998]

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit edc28907ce19a7298059dd388933c58a9c6c28b9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/image.bbclass             | 2 +-
 meta/classes/populate_sdk_base.bbclass | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 42d2886505..79c487ea18 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -115,7 +115,7 @@ def rootfs_command_variables(d):
             'IMAGE_PREPROCESS_COMMAND','RPM_PREPROCESS_COMMANDS','RPM_POSTPROCESS_COMMANDS','DEB_PREPROCESS_COMMANDS','DEB_POSTPROCESS_COMMANDS']
 
 python () {
-    variables = rootfs_command_variables(d) + sdk_command_variables(d)
+    variables = rootfs_command_variables(d)
     for var in variables:
         if d.getVar(var, False):
             d.setVarFlag(var, 'func', '1')
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 6954237596..ca56d803cb 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -324,6 +324,13 @@ def sdk_variables(d):
 
 do_populate_sdk[vardeps] += "${@sdk_variables(d)}"
 
+python () {
+    variables = sdk_command_variables(d)
+    for var in variables:
+        if d.getVar(var, False):
+            d.setVarFlag(var, 'func', '1')
+}
+
 do_populate_sdk[file-checksums] += "${TOOLCHAIN_SHAR_REL_TMPL}:True \
                                     ${TOOLCHAIN_SHAR_EXT_TMPL}:True"
 
-- 
2.25.1

