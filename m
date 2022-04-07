Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F81BC38A02
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 15:41:15 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web09.7139.1649340897212174172
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 07:14:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h7pL9Pi9;
 spf=pass (domain: gmail.com, ip: 209.85.208.47,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id x20so6539633edi.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 07:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/CYKTV1ab/1U8P/yUOtr80YDqDgDMADim1boAe1ijMc=;
        b=h7pL9Pi9Zeph2MfQ3MzlVTs8bFp3WMzE5l5Ii/p24gtXgxkVBzSxY2nCAn+GyDzs0E
         M1GdLDkvhgvHLxs+rPswQzmNKMd9C9lm5hNpAEd3WXM25Wuo4LtfLM2XNaAHOLGGw3vI
         HFOUUWHr5sO11ggxzz/034K+pD+LJen7zzFi97awSt5W8FhVHllFBt7H+/xw0pm6le2V
         rIjjlMEyoD6UqNh3qfDHzqSOL0uPREmqvGLCSn+ZLUscbrulpJLXYHIM8e9vvDI3T9dV
         rfn6/Tzcl3rm39eUuKUel8iTp/SUD82gFhrUusmmfRfBgfUjaIzc0c/DFxCroR21yAc0
         pCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/CYKTV1ab/1U8P/yUOtr80YDqDgDMADim1boAe1ijMc=;
        b=b04yGjQJF97/RacG9SFUphU1kN6NNs0WaW79xJA3pC5NSxnO8AbND0A3KKbSJdXJT+
         EdDXXLwY6s+iEWnK5rBDuENCs2Ryyii1wImldULADw6NXvQMaxyXXX22cKhxIQkFmYOF
         zS/BXF8d/hNraFNZw/tQxLqg0rJmZk0mjYpEKOyzFd6JYQPWLVS23q11kN+1pWye1nyq
         S4vQA6ALem5+s0AgjF2J+Rd08inpywdqBSxJZRcCqkalirQXTJEAkcifPMPafDxteLPw
         Nw7G01VlVKgY/5c3b102MRDx+ztiD18PUnQ70sqgXmIOSBIq2ytSmFyqPZNeuqkf9/V/
         8/PA==
X-Gm-Message-State: AOAM533W5haPhA7l+woOqK+SnZBrcEqheo6rrNqr8fH9OMAw3gL3AwuJ
	mWwlJUMBW8oInQEy2sni5IVTRIgT5phTEg==
X-Google-Smtp-Source: 
 ABdhPJy8+JLJ+e7U1uhAlqzLq+R3PHFZhZugcsdrbJVoJp4u5/p6FpyEJ16odn+dVgauO2LwHdM/2g==
X-Received: by 2002:a50:ce03:0:b0:41c:c36b:c75 with SMTP id
 y3-20020a50ce03000000b0041cc36b0c75mr14209134edi.195.1649340895677;
        Thu, 07 Apr 2022 07:14:55 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 jg15-20020a170907970f00b006e0466dcc42sm7665891ejc.134.2022.04.07.07.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 07:14:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] license_image.bbclass: close package.manifest file
Date: Thu,  7 Apr 2022 16:14:49 +0200
Message-Id: <20220407141449.2395474-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 15:41:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164109

* fixes:
  NOTE: Executing write_package_manifest ...
  DEBUG: Executing python function write_package_manifest
  /OE/build/oe-core/openembedded-core/meta/classes/license_image.bbclass:23: ResourceWarning: unclosed file <_io.TextIOWrapper name='/OE/build/oe-core/tmp-glibc/deploy/licenses/core-image-minimal-qemux86-64/package.manifest' mode='w+' encoding='UTF-8'>
    'w+').write(output)
  ResourceWarning: Enable tracemalloc to get the object allocation traceback
  DEBUG: Python function write_package_manifest finished

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/license_image.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index 0a5ea0a2fb..7e1d0e08a9 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -19,8 +19,8 @@ python write_package_manifest() {
 
     pkgs = image_list_installed_packages(d)
     output = format_pkg_list(pkgs)
-    open(os.path.join(license_image_dir, 'package.manifest'),
-        'w+').write(output)
+    with open(os.path.join(license_image_dir, 'package.manifest'), "w+") as package_manifest:
+        package_manifest.write(output)
 }
 
 python license_create_manifest() {
-- 
2.35.1


