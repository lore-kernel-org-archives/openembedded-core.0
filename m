Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.2463.1589494607441026104
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 15:16:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kynetics-com.20150623.gappssmtp.com header.s=20150623 header.b=vr//bXSH;
 spf=neutral (domain: kynetics.com, ip: 209.85.221.66, mailfrom: diego.rondini@kynetics.com)
Received: by mail-wr1-f66.google.com with SMTP id s8so843827wrt.9
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 15:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynetics-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P8ZlpahFBhedXM2POilNd0oTRyoWIlZ532jT06C3eyE=;
        b=vr//bXSHyAvrVxV0famssvq/vx/6RBJuzUDMxfN5/UddkupdQGxuYLgNuGaS4Vx/go
         utO8lNaBcE1NqHUYpPUtN9UcbPmfHUPXy1ZqY9jj78vSBVIEInQ1pEjoVTwT60E9VllT
         iqN/QgZuQTFO9F+qh85bI2KZ75HVKECHoz2FdtXQiLxkqaFRDo5mHsWO6eaCwNoIGBXE
         iICgmlonYDreNN+ztXNqDScsUb3GzXh7xa3yypVC2pnU3g3n+CEnm6+T6Ufbvxfn//XR
         fNIQCT9p5QX+JCCujpgSFk6DCkVdMGBitmJQaMqPgJAunffiEa73VDO7WfCBLJ6lIq9q
         EFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P8ZlpahFBhedXM2POilNd0oTRyoWIlZ532jT06C3eyE=;
        b=itAPaq6xlQmJ6uV2ss0OSEdSPXnE0NmzBzHfRKzrYD9eZRHX6o4KhRjV06naVqXWrS
         V8KxyszMp3d3SvZ+Z6ad5J6AaYxEEsPbmmp9eNv4LDkfxq2rsMTNDbijjel3eW9zqHfS
         IAKOPMSV+kdKxKxZpp11wXOVZodwVI/P6YElK1opW8Y2SW8pr/+EiVXN+TKt35NO8HI6
         R4WLpqzkO1RyPscDFhWoazVkwgwgT1ocP02OXoTgG8jvFv813uPQn5JGM6tSxe70oB99
         FDUfYJoRu5WlKE+jel1ZmS77mFoREUo8P+jA0kqdn5Z5tagFaUl8cALVUByWze+YPGkC
         oSlQ==
X-Gm-Message-State: AOAM533mkCl5L1BAlf7OaZBRTB1BvPy1Z0McwsbqKsS+elXADELeEP0f
	Zx0Z16ky09Xy5m4AtzMPX6oaveLore0=
X-Google-Smtp-Source: ABdhPJxGnxOFl0Ts/S9r0dLLg9eknmfrcG/VaQyigegVUzaE/x+O+zf/DEfVFM4VUtXXfI8BiU4n/g==
X-Received: by 2002:adf:f7c6:: with SMTP id a6mr673377wrq.296.1589494605775;
        Thu, 14 May 2020 15:16:45 -0700 (PDT)
Return-Path: <diego.rondini@kynetics.com>
Received: from localhost.lan (mob-2-41-210-190.net.vodafone.it. [2.41.210.190])
        by smtp.gmail.com with ESMTPSA id t129sm773149wmg.27.2020.05.14.15.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 15:16:45 -0700 (PDT)
From: "Diego" <diego.rondini@kynetics.com>
To: openembedded-core@lists.openembedded.org
Cc: Diego Rondini <diego.rondini@kynetics.com>
Subject: [PATCH v2] image_types: declare support for wic.zst
Date: Fri, 15 May 2020 00:16:02 +0200
Message-Id: <20200514221602.30828-1-diego.rondini@kynetics.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Declare images in wic.zst format as supported, as bmaptool now supports
zstd:
https://github.com/intel/bmap-tools/commit/1b8437d58447d3796dc11fd0f2c62bec5746e5d6
Given the very fast decompression speed of zstd over, for example, gzip,
writing images with bmaptool can provide big write speed improvements
when decompression speed is the limiting factor (especially with very
sparse images).

Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
---
Changes in v2:
- disable related test, as zstd is not in oe-core (see: http://git.openembedded.org/openembedded-core/commit?id=3646499cb34e91c1d012d057eedfdeff08a4f06c )
---
 meta/classes/image_types.bbclass              | 2 +-
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index f82f1d8862..ab05cc90ff 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -273,7 +273,7 @@ IMAGE_TYPES = " \
     ubi ubifs multiubi \
     tar tar.gz tar.bz2 tar.xz tar.lz4 tar.zst \
     cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 \
-    wic wic.gz wic.bz2 wic.lzma \
+    wic wic.gz wic.bz2 wic.lzma wic.zst \
     container \
     f2fs \
 "
diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index 2b9c4998f7..dea519e6df 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -209,7 +209,7 @@ class ImageFeatures(OESelftestTestCase):
         image_name = 'core-image-minimal'
 
         all_image_types = set(get_bb_var("IMAGE_TYPES", image_name).split())
-        blacklist = set(('container', 'elf', 'f2fs', 'multiubi', 'tar.zst'))
+        blacklist = set(('container', 'elf', 'f2fs', 'multiubi', 'tar.zst', 'wic.zst'))
         img_types = all_image_types - blacklist
 
         config = 'IMAGE_FSTYPES += "%s"\n'\
-- 
2.21.3

