Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA39C4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 07:31:21 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.67265.1701329472213249267
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Nov 2023 23:31:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=gj3zhHfx;
 spf=pass (domain: mvista.com, ip: 209.85.214.177, mailfrom: vkumbhar@mvista.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1cfd78f8a12so6429515ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 23:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1701329471; x=1701934271; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nfVX9qTD84J7Qk8IC9NMa67D3FRy+ttg5xgIfZ6CK5c=;
        b=gj3zhHfx8wq6FWfE4WVvFGkLccjbg62N5aQpegVO5kNI7AOV2+Ad++K0NRPQXtc8Kt
         9nuz1v33g/4oRtUx0GTj0NXF9RHd/fuhKp/XaLN8mlxdtJzwrtQnzYZOfw1BbA8k7sZI
         NtlZWc74GaeJ14xwMDwV6435g6p43kMsYer3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701329471; x=1701934271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nfVX9qTD84J7Qk8IC9NMa67D3FRy+ttg5xgIfZ6CK5c=;
        b=OTEEJiJxuRbURiT/TQHJTL1RC1ihqLJ6M9jILwllyre5zbsV0TpAHd6XkVHC4nhsJ+
         lQqRCE2qPzIkMXBFVI/qFv1Cx/QpCrsG3mcFmPve9kqCxuZ8zboqN5F8b3B6U21BWhwI
         O51HdpJb33MeDGlaXbWpjqlIpAPrcRY/BHrRBksaNhvm19ijBZsdSI++K7NoMxa+dkQF
         54FsMLY/zJA/5QyomFnZwpa2hk6wmxuTqMSd+vpoOJ4x4Rl6G16Xi5KXwdDr0TGgmC0h
         5B2s+/vIL7as547k8zVXVp2KiyPHXiH+xDAgl4UDKsed/yp1gaT+jOTkDrZ+myOBahP2
         HqEA==
X-Gm-Message-State: AOJu0YxcX/WI+5G4Z0/BPb5WqIpJ/tpWnBnlw7UB90CUHbaJ4U4WPyaZ
	BryHsUKEJy2Ek/IiCDdvWW4d/jxY7uA3y0wzpR8=
X-Google-Smtp-Source: AGHT+IFQasFuWja7kRCTMFe4+O/gdX+2OUJBGR8mDvHeP5zWWg9qBHLHpQ93MXtQ+FeAp64mowndYQ==
X-Received: by 2002:a17:902:f60a:b0:1ce:6669:3260 with SMTP id n10-20020a170902f60a00b001ce66693260mr30228521plg.67.1701329471288;
        Wed, 29 Nov 2023 23:31:11 -0800 (PST)
Received: from vkumbhar-Latitude-3400.. ([116.74.153.36])
        by smtp.googlemail.com with ESMTPSA id 12-20020a170902e9cc00b001cc20dd8825sm604453plk.213.2023.11.29.23.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 23:31:10 -0800 (PST)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][dunfell][PATCH] libsndfile: fix CVE-2022-33065 Signed integer overflow in src/mat4.c
Date: Thu, 30 Nov 2023 13:01:01 +0530
Message-Id: <20231130073101.280790-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 07:31:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191477

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../libsndfile1/CVE-2022-33065.patch          | 46 +++++++++++++++++++
 .../libsndfile/libsndfile1_1.0.28.bb          |  3 +-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065.patch
new file mode 100644
index 0000000000..e22b4e9389
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065.patch
@@ -0,0 +1,46 @@
+From 0754562e13d2e63a248a1c82f90b30bc0ffe307c Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Tue, 10 Oct 2023 16:10:34 -0400
+Subject: [PATCH] mat4/mat5: fix int overflow in dataend calculation
+
+The clang sanitizer warns of a possible signed integer overflow when
+calculating the `dataend` value in `mat4_read_header()`.
+
+```
+src/mat4.c:323:41: runtime error: signed integer overflow: 205 * -100663296 cannot be represented in type 'int'
+SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior src/mat4.c:323:41 in
+src/mat4.c:323:48: runtime error: signed integer overflow: 838860800 * 4 cannot be represented in type 'int'
+SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior src/mat4.c:323:48 in
+```
+
+Cast the offending `rows` and `cols` ints to `sf_count_t` (the type of
+`dataend` before performing the calculation, to avoid the issue.
+
+CVE: CVE-2022-33065
+Fixes: https://github.com/libsndfile/libsndfile/issues/789
+Fixes: https://github.com/libsndfile/libsndfile/issues/833
+
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+
+Upstream-Status: Backport [https://github.com/libsndfile/libsndfile/commit/0754562e13d2e63a248a1c82f90b30bc0ffe307c]
+CVE: CVE-2022-33065
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ src/mat4.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/mat4.c b/src/mat4.c
+index 3c73680..e2f98b7 100644
+--- a/src/mat4.c
++++ b/src/mat4.c
+@@ -320,7 +320,7 @@ mat4_read_header (SF_PRIVATE *psf)
+				psf->filelength - psf->dataoffset, psf->sf.channels * psf->sf.frames * psf->bytewidth) ;
+		}
+	else if ((psf->filelength - psf->dataoffset) > psf->sf.channels * psf->sf.frames * psf->bytewidth)
+-		psf->dataend = psf->dataoffset + rows * cols * psf->bytewidth ;
++		psf->dataend = psf->dataoffset + (sf_count_t) rows * (sf_count_t) cols * psf->bytewidth ;
+
+	psf->datalength = psf->filelength - psf->dataoffset - psf->dataend ;
+
+--
+2.40.1
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
index 2525af8fe0..32b678ce90 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
@@ -22,7 +22,8 @@ SRC_URI = "http://www.mega-nerd.com/libsndfile/files/libsndfile-${PV}.tar.gz \
            file://CVE-2019-3832.patch \
            file://CVE-2021-3246_1.patch \
            file://CVE-2021-3246_2.patch \
-          "
+           file://CVE-2022-33065.patch \
+           "
 
 SRC_URI[md5sum] = "646b5f98ce89ac60cdb060fcd398247c"
 SRC_URI[sha256sum] = "1ff33929f042fa333aed1e8923aa628c3ee9e1eb85512686c55092d1e5a9dfa9"
-- 
2.40.1


