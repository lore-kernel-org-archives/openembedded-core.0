Return-Path: <sanakazisk19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A7BC433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 11:59:50 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web12.4694.1646827189271992942
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 03:59:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ncooRMfk;
 spf=pass (domain: gmail.com, ip: 209.85.210.179,
 mailfrom: sanakazisk19@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id p8so2060065pfh.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 03:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=cwo7yZ9cs7PklQfH0Vf5O5vosWU2koM/PGngmBE6Ecg=;
        b=ncooRMfk9raXRAAlzKKHuSHpUGqLTjZdSzqIuplUvtE8lJLM8TYkBnfP/LZKlbMHXS
         Yvay50MoXEAp9F4eHcxz1wH3ELY9G28ROu0iK4jW5biBM+pSyyzHcYQ7BXdX3HiF2O55
         DIDMv2Y1nalio4wPqzVcNR5Y5u0vFYgDtNOJJ0S3WVf2AzylfI1x3v2GEj/wtDYM9yMm
         FVtvVfiqydlg9vNN+cB2XQZIHZMu3X/OYhlSfqGNumYiFmc6fpy89bkV+q68yy+T/eHE
         gXm3bUJucrj6zcpu3tibRqN9csnKTAjfL3oUlXY2qUavhSc9bHhlLYT/XpxhLb0tPjHE
         I1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=cwo7yZ9cs7PklQfH0Vf5O5vosWU2koM/PGngmBE6Ecg=;
        b=2VRfEpXBFicM7NVAakAzuokfJE1ixxZJLJoFqFoMYbSavQor6XBxwWb6qAEk3mgA2e
         vsoeRdM4SAbcxMZoaKzY2DmOcVMtmtdl9e6UjofhakWA+159LwvbAgVj6N1XRPtrNG7V
         qHm78VhTK+AwJ9XqAeEsEzWihZvR0HTLT1YLr6XEUNWOW4K9NvXXqHyaNG/8ebtwYB2+
         N0cSuY9b3KRkwYX4MxyNzQLTazjJAqB09o8cvz0LabfgGokb784T1vu+FJ8/ExqjPRLn
         qJFpMl63i5kaZSGYyNfFgdEswD4NeuH9AXSYiEnfIezSJNZO2sTkM/LAChXuuVWTn+bv
         et9Q==
X-Gm-Message-State: AOAM530D7X7lr2j0glMB48TAzIdFTUTTDbXWAeKzywAwqvmpFgCXEeIy
	ZPQIqMy1hG3l7DlwuxsL9DXUWDWXT/M=
X-Google-Smtp-Source: 
 ABdhPJwoQ/0PsNr+VAEwUMIJudbZo0Hqh2PXyYTR/cTRBz+kED0ZAMkJgihnNqX0/B3S6AIz0SIqMw==
X-Received: by 2002:aa7:980a:0:b0:4f7:7ed:eae4 with SMTP id
 e10-20020aa7980a000000b004f707edeae4mr14191111pfl.22.1646827188360;
        Wed, 09 Mar 2022 03:59:48 -0800 (PST)
Received: from localhost.localdomain ([103.115.128.22])
        by smtp.gmail.com with ESMTPSA id
 66-20020a620445000000b004f6c30d84cfsm2591599pfe.155.2022.03.09.03.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 03:59:47 -0800 (PST)
From: Sana Kazi <sanakazisk19@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ranjitsinh.rathod@kpit.com,
	Sana Kazi <sanakazisk19@gmail.com>
Subject: [poky][dunfell][PATCH] tiff: Add backports for two CVEs from upstream
Date: Wed,  9 Mar 2022 17:29:32 +0530
Message-Id: <20220309115932.29784-1-sanakazisk19@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 11:59:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162958

(From OE-Core rev: 6ae14b4ff7a655b48c6d99ac565d12bf8825414f)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e600227b136aa21b54f16e218858d640c8942f73)
Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
---
 ...99c99f987dc32ae110370cfdd7df7975586b.patch | 28 +++++++++++++++++
 ...0712f4c3a5b449f70c57988260a667ddbdef.patch | 30 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |  2 ++
 3 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/561599c99f987dc32ae110370cfdd7df7975586b.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/eecb0712f4c3a5b449f70c57988260a667ddbdef.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/561599c99f987dc32ae110370cfdd7df7975586b.patch b/meta/recipes-multimedia/libtiff/tiff/561599c99f987dc32ae110370cfdd7df7975586b.patch
new file mode 100644
index 0000000000..01ed5dcd24
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/561599c99f987dc32ae110370cfdd7df7975586b.patch
@@ -0,0 +1,28 @@
+From 561599c99f987dc32ae110370cfdd7df7975586b Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Sat, 5 Feb 2022 20:36:41 +0100
+Subject: [PATCH] TIFFReadDirectory(): avoid calling memcpy() with a null
+ source pointer and size of zero (fixes #362)
+
+Upstream-Status: Backport
+CVE: CVE-2022-0562
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+Comment: Refreshed patch
+---
+ libtiff/tif_dirread.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
+index 2bbc4585..23194ced 100644
+--- a/libtiff/tif_dirread.c
++++ b/libtiff/tif_dirread.c
+@@ -4126,7 +4126,8 @@
+                     goto bad;
+                 }
+ 
+-                memcpy(new_sampleinfo, tif->tif_dir.td_sampleinfo, old_extrasamples * sizeof(uint16));
++                if (old_extrasamples > 0)
++                    memcpy(new_sampleinfo, tif->tif_dir.td_sampleinfo, old_extrasamples * sizeof(uint16));
+                 _TIFFsetShortArray(&tif->tif_dir.td_sampleinfo, new_sampleinfo, tif->tif_dir.td_extrasamples);
+                 _TIFFfree(new_sampleinfo);
+         }
diff --git a/meta/recipes-multimedia/libtiff/tiff/eecb0712f4c3a5b449f70c57988260a667ddbdef.patch b/meta/recipes-multimedia/libtiff/tiff/eecb0712f4c3a5b449f70c57988260a667ddbdef.patch
new file mode 100644
index 0000000000..fc5d0ab5f4
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/eecb0712f4c3a5b449f70c57988260a667ddbdef.patch
@@ -0,0 +1,30 @@
+From eecb0712f4c3a5b449f70c57988260a667ddbdef Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Sun, 6 Feb 2022 13:08:38 +0100
+Subject: [PATCH] TIFFFetchStripThing(): avoid calling memcpy() with a null
+ source pointer and size of zero (fixes #362)
+
+Upstream-Status: Backport
+CVE: CVE-2022-0561
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+Comment: Refreshed patch
+---
+ libtiff/tif_dirread.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
+index 23194ced..50ebf8ac 100644
+--- a/libtiff/tif_dirread.c
++++ b/libtiff/tif_dirread.c
+@@ -5683,8 +5682,9 @@
+ 			_TIFFfree(data);
+ 			return(0);
+ 		}
+-                _TIFFmemcpy(resizeddata,data,(uint32)dir->tdir_count*sizeof(uint64));
+-                _TIFFmemset(resizeddata+(uint32)dir->tdir_count,0,(nstrips-(uint32)dir->tdir_count)*sizeof(uint64));
++               if( dir->tdir_count )
++                       _TIFFmemcpy(resizeddata,data, (uint32)dir->tdir_count * sizeof(uint64));
++               _TIFFmemset(resizeddata+(uint32)dir->tdir_count, 0, (nstrips - (uint32)dir->tdir_count) * sizeof(uint64));
+ 		_TIFFfree(data);
+ 		data=resizeddata;
+ 	}
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
index 0948bb4e2f..9db247ecc7 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
@@ -16,6 +16,8 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://002_support_patch_for_CVE-2020-35521_and_CVE-2020-35522.patch \
            file://CVE-2020-35521_and_CVE-2020-35522.patch \
            file://0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch \
+           file://561599c99f987dc32ae110370cfdd7df7975586b.patch \
+           file://eecb0712f4c3a5b449f70c57988260a667ddbdef.patch \
           "
 SRC_URI[md5sum] = "2165e7aba557463acc0664e71a3ed424"
 SRC_URI[sha256sum] = "5d29f32517dadb6dbcd1255ea5bbc93a2b54b94fbf83653b4d65c7d6775b8634"
-- 
2.17.1


