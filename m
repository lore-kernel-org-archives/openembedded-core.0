Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web08.1841.1616689046112095763
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 09:17:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ow5CDKLO;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: kergoth@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id q5so2548914pfh.10
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Mar 2021 09:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wxqUT1SI+F1rzKu+Q75UQClDKXeFib55ceaSwTVK7jk=;
        b=ow5CDKLOynSOqql+CpwK2KNCbfTsodlwjD7VEjC6uYrqzakC2WGmIEU6+uUTF8eKHc
         O7lIpjKPVcUKO2/GcocK/XZN2TIsBCVq6AZzqXm9TSpwntykTFgy0EPmKPBCeIgqTKD5
         aLIEa2rZarSJP7C7u4R6kEoJ8W9mHwI4MyYqnwhpCyfLgPJq37W3VrhfJO7OFAiOJAjl
         duvcJluM9PqPiuBtk50UTu6IiSn0bA2LUy9JE+ktRctTsONyfZi/322OSqYVKt8X1Ndv
         +/0O5HFXp5Hu8yv55pCoKQ+XuQV6YgSuohEbMjuP5UQ+eyLOWwm8v3Lq2cJFyWzl3Zg6
         Os9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=wxqUT1SI+F1rzKu+Q75UQClDKXeFib55ceaSwTVK7jk=;
        b=VOktElqol65/hsUQ5KfNyfSbOzxIkzVBf3XAp4mH9yQjio3hf9CUzq94TfZeczQgUH
         tl329bF95/4X0+KXgWiBIpSGD6qztep18NejRCFYGWMHZ4X9q+5PrF7x3RJLW411reTG
         bC2rjfWFiTX5Av/2/jttTY2FoGEIQpXqYq3YTlTFhFhv/+N14WR2ZDbaUbmoNVgBdX7I
         Nb+G5eLFAVxBon/ZrAIAGfSd3vdYd37ZS8B6Ev37OSjbvXQLTFRBhHPzMb1KwIixgB9B
         ol5iMYox+S4tDHG1ulO+aRHpZGCj/dNBfumiVouQt6F4WOn54+dnPMmiMZ/0idC5UjqX
         KS+g==
X-Gm-Message-State: AOAM533i65tqUNUHeD+OwlZXBvBbXz6vnsVZCYPMkmj0u+zu+TCEDDPh
	lkbtKTnkci8tUT6Y7OA2U83+MDcvO8M=
X-Google-Smtp-Source: ABdhPJz/FtdtIFvix4zwxRGRaQywM7uhKcyXanqSkzkftRQUaahScRnxrX6FrVZs/e/oACq2eh1aWg==
X-Received: by 2002:aa7:9a95:0:b029:1f3:4169:ccf2 with SMTP id w21-20020aa79a950000b02901f34169ccf2mr8589344pfi.14.1616689045250;
        Thu, 25 Mar 2021 09:17:25 -0700 (PDT)
Return-Path: <kergoth@gmail.com>
Received: from svr-pkl-eng-07.mentorg.com ([110.93.212.98])
        by smtp.gmail.com with ESMTPSA id w188sm6409701pfb.4.2021.03.25.09.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 09:17:24 -0700 (PDT)
Sender: Christopher Larson <kergoth@gmail.com>
From: "Christopher Larson" <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] image,populate_sdk_base: move 'func' flag setting for sdk command vars
Date: Thu, 25 Mar 2021 21:16:59 +0500
Message-Id: <20210325161659.9881-1-chris_larson@mentor.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Setting the 'func' flag on the commands variables ensures that they are parsed
as shell, and therefore that the referenced commands contents are included in
checksums. Doing this only in image.bbclass means that this is missing in
recipes that are not images, but which inherit populate_sdk or populate_sdk_base
directly, so move it to the latter.

[YOCTO #13998]

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/image.bbclass             | 2 +-
 meta/classes/populate_sdk_base.bbclass | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index b558653635..c36c7a9695 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -112,7 +112,7 @@ def rootfs_command_variables(d):
             'IMAGE_PREPROCESS_COMMAND','RPM_PREPROCESS_COMMANDS','RPM_POSTPROCESS_COMMANDS','DEB_PREPROCESS_COMMANDS','DEB_POSTPROCESS_COMMANDS']
 
 python () {
-    variables = rootfs_command_variables(d) + sdk_command_variables(d)
+    variables = rootfs_command_variables(d)
     for var in variables:
         if d.getVar(var, False):
             d.setVarFlag(var, 'func', '1')
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index c8a7084d33..33ba3fc3c1 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -329,6 +329,13 @@ def sdk_variables(d):
 
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
2.28.0

