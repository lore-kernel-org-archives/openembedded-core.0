Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A1FC433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 14:04:25 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.9719.1646921064826473161
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 06:04:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=1gIwL+61;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id b8so5319471pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 06:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=nOMb5IheuUKbMkIMnVuql95bXU9pO+HONCe+ajNMd/s=;
        b=1gIwL+61CjbqQhzcpqOxKP77p51CBpC9N6kvvAjDc56KKs1xZID1V2oF3TGWARPDmA
         9JiwB0qqXYvYqvW/qcOIfmHaTBRIgZkW5FnytGTEL3SasTymgv+97tBVrRzgQoV1AX47
         Gt5ZraUO6GfoGl1lb8YiRhIT2H6NVdebbWZtEzFWRDlldaAi07m4zX4WNyukuDJlXSrX
         GgG9zLktxfevazJ7PUlvt7aPcEzcsK1NZvpnMEunK61Yp+JNsChR48iTh1/8K56Hu3qv
         sVP83sdhilYWrmVGJDWVbkCTEjSCKjvNZH6r43b3vOJgeWNG9QkvDQ52hLb8uHyPMl1K
         Sg0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nOMb5IheuUKbMkIMnVuql95bXU9pO+HONCe+ajNMd/s=;
        b=BDX3zsV9fkG0f7EIWYMA0ghSR0ar35p6aZOtrLmYvaDBwFU0lYfPoAncCEZgHMPwDi
         37UEQzH40t1Wrf/y+nyxJ8YVKR82wy4xUWAvJVqNqcoZHdtGp/5p0DJ9tG/UcZQEVDWR
         BgT4LHbODwTzSkZLUNppPa3PgP67AcquyhB6e78tHiHEFz9H+9Fo5/hheNT3LHueaTMg
         FGLn2q1c2obdNzI9Z/6i+RaawF+a8AoE1T/4yEGjYqNtFnBY8WHKv1dbe3FTFUVMcZi5
         vVirGpsVfHzVooHR5IesuNBGsGBvy/5pUyuUIn7k1VVQUhrzpYYSEh8TDi54IGL6oYoi
         vz/w==
X-Gm-Message-State: AOAM531EdJGsdXjOJJ2SKktbUThauPtUBVYrTra8kmn3QZqS8Bgdjv81
	nZnPM5eMXNPVjLuQqJ8KJ9zKy63Z0jFbhiyesWM=
X-Google-Smtp-Source: 
 ABdhPJzVRBc1tESmuFPsOcUaTkY5MF9U2XHsi6MR0mIYriFejRf+GikPCFm2SXPEYcoODR+TF/vS1Q==
X-Received: by 2002:a17:902:bb10:b0:153:1b4b:d143 with SMTP id
 im16-20020a170902bb1000b001531b4bd143mr4040452plb.142.1646921063800;
        Thu, 10 Mar 2022 06:04:23 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 d11-20020a056a00198b00b004dfc6b023b2sm7291927pfl.41.2022.03.10.06.04.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 06:04:22 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/3] tiff: Add backports for two CVEs from upstream
Date: Thu, 10 Mar 2022 04:04:03 -1000
Message-Id: 
 <a5bb7cc568d5da3633f3854295b0ebe46a2dd863.1646881254.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1646881254.git.steve@sakoman.com>
References: <cover.1646881254.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 14:04:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163026

From: sana kazi <sanakazisk19@gmail.com>

Based on commit from master

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6ae14b4ff7a655b48c6d99ac565d12bf8825414f)
Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


