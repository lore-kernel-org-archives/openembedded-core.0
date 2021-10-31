Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FCFEC433F5
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 17:29:49 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.33216.1635701388518673674
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 10:29:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PDqtz9Gy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id d3so24854716wrh.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 10:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vbj7MVxqCtJqPBkI2XMGH61ZIq2Kb0nIbCgrD+eQHwk=;
        b=PDqtz9GydvXBXJK4c4RnhVbtUxtFivoosFlLt/tUFEsO64RkGOUXNKGqKmmLzRJ/xl
         PsDrjs6WEu82xKfOZUXHTBccChFDz0zf+GpkjzK4Qfb3VBHsm6+Hgt4Yh/Ql0b3Vh/9l
         YQ/pVa5g2GxA6QyFwmFzP7HaX/ZbaCF8lp8yQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vbj7MVxqCtJqPBkI2XMGH61ZIq2Kb0nIbCgrD+eQHwk=;
        b=RuPYIQIhQl9kt3/w9uYVPE6rjpyAnVr0pUZ2LYjERHAu9TCMotrleS9owHmnLY2OAU
         H3PrAICHhgKuP4McbuOXaM3aSFZ0/l02Y9cKXB+GO1Njw6/Ibhzkf1/YJH4Je2Uxrg88
         QLj1MouyUdIt2nAbZLcmo6G+k9AZ40d1yjlV4UXmutaMjzsmBDRayDXi+KAByHbd1KNM
         oogIGABjwRjVdPpjZmNWCLPb1lcdyBgKj9rfNJ5bzniT2ZWNKBFG3GAVRSNvOR9PTiLL
         /xVvH2dhXhJMpYJbqYvxr/2tGPwIZJkzdPy7D2u8XN3pcw73Jo2vtLCAoXEHQxz8OA8V
         WfNA==
X-Gm-Message-State: AOAM53360PxX2AUnPrejWB/NEtaRxBTjcWurdPaOrqbeS62jWPD67R1z
	LEX9+oqyjSp8k3qjG9ESupG5CxLYZd6Zfw==
X-Google-Smtp-Source: 
 ABdhPJzwq14PYzbau0RyEwoDI8U1wP/jlrrDnOf6IxlAdzCJJ1yGZxH6UagNtiGJDRcuihxUSdjlxA==
X-Received: by 2002:a05:6000:144c:: with SMTP id
 v12mr31381183wrx.142.1635701386811;
        Sun, 31 Oct 2021 10:29:46 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:b85c:77c5:c945:ad1c])
        by smtp.gmail.com with ESMTPSA id
 m20sm15268751wmq.5.2021.10.31.10.29.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 10:29:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libgfortran: Set GFORTRAN
Date: Sun, 31 Oct 2021 17:29:46 +0000
Message-Id: <20211031172946.3481648-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Oct 2021 17:29:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157688

The libgfortran configure sets FC to be $GFORTRAN. We did used to patch
that out but rather than carry a patch to gcc, just set GFORTRAN as
needed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/libgfortran.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/gcc/libgfortran.inc b/meta/recipes-devtools/gcc/libgfortran.inc
index 344ec5e21ef..e810146d4d1 100644
--- a/meta/recipes-devtools/gcc/libgfortran.inc
+++ b/meta/recipes-devtools/gcc/libgfortran.inc
@@ -5,6 +5,11 @@ EXTRA_OECONF_PATHS = "\
     --with-build-sysroot=${STAGING_DIR_TARGET} \
 "
 
+# An arm hard float target like raspberrypi4 won't build
+# as CFLAGS don't make it to the fortran compiler otherwise
+# (the configure script sets FC to $GFORTRAN unconditionally)
+export GFORTRAN = "${FC}"
+
 do_configure () {
 	for target in libbacktrace libgfortran
 	do
-- 
2.32.0


