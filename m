Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6507ECCA47B
	for <webhook@archiver.kernel.org>; Sun,  5 Jun 2022 12:26:07 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.20000.1654431963215749030
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jun 2022 05:26:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BI1w7OJu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id q7so16275271wrg.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jun 2022 05:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Voi57evU1dJe6udgLWUwSjE5TOEKwl46LhlxauCIIH8=;
        b=BI1w7OJuCLe3LbOQPlOllBR/g/VTe8pLFXLO5YarkdDjeVyXi3i3GEd2sa4S78AgHR
         n6atNWPtxebuosYcUgvW0a7ISHxN/8R9iEwXYzIOo2apEYL4nvHLrr7a40Q6LG+JUDhB
         FQ6boYwQ2+F3EzSgkqns6iuU2EHa6D35mVb4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Voi57evU1dJe6udgLWUwSjE5TOEKwl46LhlxauCIIH8=;
        b=Ggd5DFLTL7S3fMY6H9Ry7/UTIWq+rGgPqZPgKI0O0QP2E8GnjYEUCoq0qZNxQiGNda
         di7lcOYJ66MNfsizCq7zqaJpYhIV2kfBHaOhTuX9TqfPptp4cShSE6H5cGzOeRBfG2Nz
         rA2WDkDq+8Sow6sOwsPwo4CT6nvWPyBIBUKt/A/Ohm4E4kOQr+FGC/dTlR5fxWE42KFR
         Dk6j3eWWAgtdW1y7Josy4t21eDTIEa1BxlYyDu4Sdox6YY+Ybp+ICEvvXf/RVnSWkdY2
         xn/DEpUZDf8VcFXYwh8d6UtptIBKVH0C8jcHwVl//y5KlZr0oTJcIU6VZrilODpY67p9
         9Nbg==
X-Gm-Message-State: AOAM5310qHPuAs3EOXv+1uQcVgEFZE9K4wHb6vL7XjHoYM+5MI6bVqCj
	1nCYe0b8LRxfiXYn8tbR21yFaBQnxWT9Jw==
X-Google-Smtp-Source: 
 ABdhPJyxcq38803DdhNQ4dfbyLVRa6M2uvSTK0rG/9EXkF7g1U/aOp1Im3M3nu/tKqeMHGdH1E4cDw==
X-Received: by 2002:a5d:648a:0:b0:217:3552:eb2d with SMTP id
 o10-20020a5d648a000000b002173552eb2dmr3930220wri.78.1654431961562;
        Sun, 05 Jun 2022 05:26:01 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1a6f:63e8:c3d9:1249])
        by smtp.gmail.com with ESMTPSA id
 n9-20020a05600c3b8900b003942a244ecbsm12455927wms.16.2022.06.05.05.26.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 05:26:01 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] populate_sdk_ext: Fix second bb_unihashes reference
Date: Sun,  5 Jun 2022 13:25:58 +0100
Message-Id: <20220605122558.270399-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220605122558.270399-1-richard.purdie@linuxfoundation.org>
References: <20220605122558.270399-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jun 2022 12:26:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166578

A previous fix for zero length bb_unihashes.dat files wasn't complete
as there is a second copy of the unihashes file made. Change this second
call site to match the first to fully fix the zero length file issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/populate_sdk_ext.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 3ddbb46eda4..d58b2ba5d0d 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -491,10 +491,10 @@ python copy_buildsystem () {
     else:
         tasklistfn = None
 
-    if os.path.exists(builddir + '/cache/bb_unihashes.dat'):
-        bb.parse.siggen.save_unitaskhashes()
-        bb.utils.mkdirhier(os.path.join(baseoutpath, 'cache'))
-        shutil.copyfile(builddir + '/cache/bb_unihashes.dat', baseoutpath + '/cache/bb_unihashes.dat')
+
+    cachedir = os.path.join(baseoutpath, 'cache')
+    bb.utils.mkdirhier(cachedir)
+    bb.parse.siggen.copy_unitaskhashes(cachedir)
 
     # Add packagedata if enabled
     if d.getVar('SDK_INCLUDE_PKGDATA') == '1':
-- 
2.34.1


