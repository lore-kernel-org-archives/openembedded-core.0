Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54783C76196
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 14:29:02 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.15425.1681223338684669390
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Apr 2023 07:28:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gs1Ivksu;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: badganchipv@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id ik20so7882743plb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 07:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681223338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xcm2h0IilGJhIIm+PxnI6kCrt63vE+0eQhA9Dwx9hJM=;
        b=gs1IvksuW+uZdeU4YEj2v0cd8ad+GdK+d00eBLo0NMM/p/wszxdUptnQ9Xz2CytZTX
         b9ySvqBkWSsLKSV3uGmSs6odxhJe3s0IdqQW/Iwx1FWcnad9tQtbMCivroDunYFDK82J
         HsD5ZjO+zTnoEacQwNkNTbJ9pwrg9mZN2BHhXJ+QGvEGp9h8vaT3Tguq/XYJv/0Dts5o
         sfhXXc6nLFYx52BSgpZGH5dM0R80wQu88d4IMNYhpYROKpPQNoyJGJQLnZyPZFfpTUJk
         0Ovia9GduLGtxTnhVXpb63aXbu9Jo4dNRoloW3t3d7rvIA6uSG8UDOK1b7KGnfKIVZTe
         ds6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681223338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xcm2h0IilGJhIIm+PxnI6kCrt63vE+0eQhA9Dwx9hJM=;
        b=iS3Yi1x7G4VuVNAHgpM08XX7Jvt0S33qvfkOa4ksfC+m4bjWN1iYZGqexdIoRcbIkX
         ZW1lpX8YmSPr+UTV1A28t3kKTv3bUaO7pMBGWPvLweAZcqW8uqCDc0hKW/SaiiBCqNfw
         gawEwrW5AyeyO3+XgnWAU344IieMYfIK+XqAWSy3sn5xvxp9/+M/ZRm+t9wkGp515Flv
         q3otiuHdr6m0YWVAPpMnQy72ebLo6cP/x37semf4rQzIaRnzQhrD1HClfgS6XUakOEwb
         rQJA7FBVFqJ8CBTbv3K4e9RMo/AG2VFDD/I79cIdZ12EBtxKCrAKYtdz/ONDdx6McmQR
         9yGg==
X-Gm-Message-State: AAQBX9fZzamoEVWNWwcN/PuQPOvzfChRw+oUR60gxFyxCmmMWcF45VXe
	9VrPPivonpWaFotk54+tQXpunqECHlI=
X-Google-Smtp-Source: AKy350ZcHqbrHiPdPPl08DAYgiqolUVMyRaENWK/ysGDBDp0aDRgqevwirz6OHYdhX6D0zvFVLq+uQ==
X-Received: by 2002:a17:903:11c8:b0:19c:fc41:2dfd with SMTP id q8-20020a17090311c800b0019cfc412dfdmr14076689plh.29.1681223337789;
        Tue, 11 Apr 2023 07:28:57 -0700 (PDT)
Received: from L-10146.. ([2401:4900:1c2d:6062:b98a:f845:9088:4739])
        by smtp.gmail.com with ESMTPSA id o11-20020a170902bccb00b001898ee9f723sm9816393pls.2.2023.04.11.07.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 07:28:57 -0700 (PDT)
From: pawan <badganchipv@gmail.com>
To: openembedded-core@lists.openembedded.org,
	badganchipv@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Pawan Badganchi <Pawan.Badganchi@kpit.com>
Subject: [OE-core][kirkstone][PATCH] tiff: Add fix for CVE-2022-4645
Date: Tue, 11 Apr 2023 19:58:36 +0530
Message-Id: <20230411142836.70388-1-badganchipv@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 14:29:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179923

From: Pawan Badganchi <Pawan.Badganchi@kpit.com>

Below patch fixes the CVE-2022-4645 as well.

0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch

Link: https://nvd.nist.gov/vuln/detail/CVE-2022-4645

Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
---
 ...evised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/libtiff/tiff/0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch b/meta/recipes-multimedia/libtiff/tiff/0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch
index 37859c9192..17b37be041 100644
--- a/meta/recipes-multimedia/libtiff/tiff/0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch
+++ b/meta/recipes-multimedia/libtiff/tiff/0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch
@@ -23,9 +23,10 @@ This MR will close the following issues:  #149, #150, #152, #168 (to be checked)
 
 It also fixes the old bug at http://bugzilla.maptools.org/show_bug.cgi?id=2599, for which the limitation of `NumberOfInks = SPP` was introduced, which is in my opinion not necessary and does not solve the general issue.
 
-CVE: CVE-2022-3599
-Upstream-Status: Backport
+CVE: CVE-2022-3599 CVE-2022-4645
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/e813112545942107551433d61afd16ac094ff246.patch]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
 ---
  libtiff/tif_dir.c      | 119 ++++++++++++++++++++++++-----------------
  libtiff/tif_dir.h      |   2 +
-- 
2.38.1


