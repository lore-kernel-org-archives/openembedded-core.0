Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E59EC83013
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 07:25:52 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.17946.1751441144841727924
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 00:25:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Q6kMZbEi;
 spf=pass (domain: linaro.org, ip: 209.85.208.172, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-32ce1b2188dso47550661fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 00:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751441143; x=1752045943; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qXfpXT9vFjV4Ijv0D8UWy+lop4TnY9hd5VtpLJWVxXo=;
        b=Q6kMZbEidVLhksYPrjWhyCvRwg4i2zBZmVjQUO3A3krQ+n3Pcdy16VCFZ4aIqIa/Pp
         xvPqCcp7eK/v86y02FEZ59kcxVnKWa5hwHcAIm+M/efbqd90+97ljq0Xem54dr7ZaXel
         Quj5GWUj0vpa406JnFEK8aEWOPvcRB2uOOdAwZs+7K02pdhKV2O8PVB5wtU/A6jg0VkH
         0kk31YMRO05cYjM7AFxwuCGdGORRTKzrH9/wMK1tCw3sSbxiJjVR+TMlYHDwmLtMtEEf
         AvhBBhJsS/2cuncoheU4cDXV9rqzjUsVmdZQsFEgtUxBaU3nhEA1Hp9+zS2nqI/iyn5+
         qf2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751441143; x=1752045943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qXfpXT9vFjV4Ijv0D8UWy+lop4TnY9hd5VtpLJWVxXo=;
        b=jAWTXQjTZKTXe5i1T/pAKavYUaQsJ4QTA7ZiH9g8qX6BN0yGtVfBg/4XX4F5M4lsXB
         yMaFea0oiy9jvxEmWc5p6pS6vgF/2Scmpg6Sbu5E20dSvViTfRu/P63IbfdQcbnoo2In
         Cscla0SuEu30jrintJlx0gM/UJ4Pi3iO+XTuKYbmISU7V3JdoV6LFGO01SB/CM3T6pGd
         asaT7YiWr8zu1KwH+ldBk0hSVq8NScEOoGjHixwP5CvZbsmhaFw2Dsq5mlKIlhIdk77A
         SK0Q2bQW2IIbm/vjlJ8PCs0daqqrZprOJmk0pJCrR5qi3aF1uhKbDAsyItccsp4iNybV
         syKw==
X-Gm-Message-State: AOJu0YwEdjcQB8c00A6lD0FIxY025V/0RkfeOWmhhQRsKeRYGcLZZFsK
	CZqmrlZTEjk+s7k7fqxW7jwrcwCNexm1zEKwd8N8xL7f27ukynYFo3JwY+EdEbb58hd6ZhEl5Bd
	N+dXz
X-Gm-Gg: ASbGncsQ0Ydja6wjJlMSyXq5ifOty+8f7CnYfEJ4ZxZAS6hg1aFp7lk7UtgugjAz2YW
	LTe8zDDrYzEpO3XCS6Ito4OM9ebN8OaUjE1Nqp7VJsZvdLfwVnEyf5E/kQLWpxyQBZOZCHmOjTn
	WGxp1Q3Kz87PhYHUoMnIa8OOaYMYsc9EN/H8wE5IvAbP6WaBDd0W9K7cMCxIQJZ4x7veM8jUGI5
	XWP93eL7S6YSQnfxXMEyQGFsX3LmiSxHSCheWJ6z947RBVD2GVlvgzKNNYfbbN++kYNuuFMwRBX
	+vlzsGXjomTibz3wAx0Za87NP/DYbBGxBTAWNSRVeNZXw3y1DItgvS1DMW2Ttc0k0VMXZYSjFzq
	CkeVqcaFhRxl62yvQMB7QGGWIH3LfssfrI7kqvOw=
X-Google-Smtp-Source: AGHT+IFLLkpyANlnYA29cxBaX3wfCI+AyVGhJ82hDDN4uIn6qK4irN1W7XIjyMbw1M9+CqGMBhTCWw==
X-Received: by 2002:a2e:9e8b:0:b0:32a:6aa0:217b with SMTP id 38308e7fff4ca-32e0002e1famr5441071fa.25.1751441142949;
        Wed, 02 Jul 2025 00:25:42 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2f0c7d7sm18781181fa.102.2025.07.02.00.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 00:25:42 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3 4/5] testexport.bbclass: use image suffix in testexport tar ball name
Date: Wed,  2 Jul 2025 10:25:15 +0300
Message-ID: <20250702072516.1075450-4-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702072516.1075450-1-mikko.rapeli@linaro.org>
References: <20250702072516.1075450-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 07:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219792

testexport.tar.gz is image specific. Thus add same image name
suffix to the tar ball name. For example genericarm64 machine
core-image-minimal image tar ball changes name from
testexport.tar.gz to testexport-core-image-minimal-genericarm64.tar.gz

This way testexport from multiple images can exists in the same
directory.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/testexport.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/testexport.bbclass b/meta/classes-recipe/testexport.bbclass
index 843d777e3bb9..3005fc0dfa52 100644
--- a/meta/classes-recipe/testexport.bbclass
+++ b/meta/classes-recipe/testexport.bbclass
@@ -136,8 +136,12 @@ def copy_needed_files(d, tc):
             if dir == '__pycache__':
                 shutil.rmtree(os.path.join(subdir, dir))
 
+    image_basename = d.getVar('IMAGE_BASENAME')
+    image_machine_suffix = d.getVar('IMAGE_MACHINE_SUFFIX')
+
     # Create tar file for common parts of testexport
-    testexport_create_tarball(d, "testexport.tar.gz", d.getVar("TEST_EXPORT_DIR"))
+    testexport_create_tarball(d, "testexport-%s%s.tar.gz" %
+        (image_basename, image_machine_suffix), d.getVar("TEST_EXPORT_DIR"))
 
     # Copy packages needed for runtime testing
     test_paths = get_runtime_paths(d)
@@ -149,7 +153,7 @@ def copy_needed_files(d, tc):
         export_pkg_dir = os.path.join(d.getVar("TEST_EXPORT_DIR"), "packages")
         oe.path.copytree(test_pkg_dir, export_pkg_dir)
         # Create tar file for packages needed by the DUT
-        testexport_create_tarball(d, "testexport_packages_%s.tar.gz" % d.getVar("MACHINE"), export_pkg_dir)
+        testexport_create_tarball(d, "testexport_packages%s.tar.gz" % image_machine_suffix, export_pkg_dir)
 
     # Copy SDK
     if d.getVar("TEST_EXPORT_SDK_ENABLED") == "1":
-- 
2.43.0


