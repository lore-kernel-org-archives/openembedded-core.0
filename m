Return-Path: <fawzi.khaber@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4599C6FD1F
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 16:42:44 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.48713.1679503356503466285
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 09:42:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=7NS8AauD;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: fawzi.khaber@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id v4-20020a05600c470400b003ee4f06428fso2367285wmo.4
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 09:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1679503354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bqpntdc5SdaLi2+SacNND2wLu1LjVy3KwgJSshY223k=;
        b=7NS8AauDznbgpfrisxWwwBZSZ8S3m1K+u0Oacsf6f8LqjhIaqAjBTLF8UoxBSdoIHH
         NNdrnHydxwQ9ARuhLsDPdCVUPb5+/LUAr8lzBQ9PdReT64r5n2ouq0A9DRdP3LZYlu4f
         h/kTPwua/+o/eNQHwXGBBLhW5Ig59BE78kE/Yn1aDbznyBxemm/GWz3HR6VLaeNsINtk
         aAXXwWyQpbSHIv0ypZEYtPJ5R6nx7/nE6Srv5uJAw614b1r9t4/r/koeoVKn9Ti841IM
         eIJBOVJkeSefTQATaua4ApirxGLLtBYR/EvsFzkOn202m+Dor0tvaHxpzjxUxkXvaQkk
         OYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679503354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bqpntdc5SdaLi2+SacNND2wLu1LjVy3KwgJSshY223k=;
        b=gP0GEdYgUvyX9pOjxbX/dyYVWzR6fcZUIOQEzACjK4ABvBhGgPK//AHmbgazbW/CL6
         NdBnb6bsOCviery+pnlXWfwP93H7Ac+8woDisWe+kcTWt0FCeyzZeZJnd4qI7z1rMdgP
         SgooOUslzILbF8M7f1+zrYkwNUEMXp6fAS6MQupwHdaAl5/u5C2GDyaXhXWiFDdK366i
         6Sgr0t9lsvH+lf2hsJwMq47jCo/PCVNyQtcAx10AufbWx7RGbRlGtFuJSY9mPh9pupuB
         lbpI6BY4SpaiJ4tyxf2wsMCSNDCNXBeBKJ8CBm9tFZLy7WOwvh2T0/6nCJHzNqZK671p
         n5CA==
X-Gm-Message-State: AO0yUKWqy3PwcJOW3YnROc0fvYnvtVsR3sLqxA7Q4LFj4czCYt3ActND
	4M+C8m8IKMwdAM1GTdzhvavwNUUjg5v+++tawuc=
X-Google-Smtp-Source: AK7set+W4LjR5+tcpoxYDj9xgaA/W+S4LDa7YlNHsrsr8I7mT4i1v9dAsFbtBvCsvhxwJb44wM+vBA==
X-Received: by 2002:a1c:f418:0:b0:3ed:ea48:cd92 with SMTP id z24-20020a1cf418000000b003edea48cd92mr153527wma.15.1679503354302;
        Wed, 22 Mar 2023 09:42:34 -0700 (PDT)
Received: from P-ASN-SCRUM.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id p7-20020a1c7407000000b003ee6c54b0bcsm1579537wmc.48.2023.03.22.09.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 09:42:34 -0700 (PDT)
From: Fawzi KHABER <fawzi.khaber@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Fawzi KHABER <fawzi.khaber@smile.fr>,
	Yoann CONGAL <yoann.congal@smile.fr>
Subject: [PATCH 1/2] package.bbclass: check packages name conflict in do_package
Date: Wed, 22 Mar 2023 17:42:23 +0100
Message-Id: <20230322164224.100884-1-fawzi.khaber@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 16:42:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178951

It is possible to rename packages with the macro PKG:${PN} and result in
a package name conflict if the target name exists already.

Add a fatal check to prevent this issue to go unnoticed.

Fix [Yocto #12060]

Reviewed-by: Yoann CONGAL <yoann.congal@smile.fr>
Signed-off-by: Fawzi KHABER <fawzi.khaber@smile.fr>
---
 meta/classes-global/package.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index 7e96601cd9..30dfd63d4f 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -496,6 +496,16 @@ python do_package () {
 
     bb.build.exec_func("package_convert_pr_autoinc", d)
 
+    # Check for conflict between renamed packages and existing ones
+    # for each package in PACKAGES, check if it will be renamed to an existing one
+
+    for p in packages:
+        localdata = bb.data.createCopy(d)
+        localdata.setVar('OVERRIDES', p)
+        rename = localdata.getVar('PKG')
+        if (rename != None) and rename in packages:         
+            bb.fatal('package %s is renamed %s using PKG:%s, but package name already exists'%(p,rename,p))
+
     ###########################################################################
     # Optimisations
     ###########################################################################
-- 
2.39.2


