Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B587FC3600B
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 15:04:40 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.2135.1742569472015334584
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 08:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=L1UWozyh;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2260c91576aso37745615ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 08:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1742569471; x=1743174271; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GgUUdWVOXVECcjb99rFS8YWWBbCUYmB7JwFPV14nrLE=;
        b=L1UWozyhUkr1AwzZQSao9tdZ/2UY6raMCygK7J9kDJzr9bOc/ob0AxrJaaO0PP29MG
         Fm3YhsUVkLSREZNL74H4T4E891mYtH7kfBn+N9LiB/MiGQGa5Gf3tfINrVIg1hEcj9Rl
         P0Pxx7WGAp5cWFiMylCPVTt8uxGXyrXjDlQz2wf6rBhaOWZD4nDYRNW4dvqsFVfqRQum
         gmec7qpCrAkA6wMvQBuBLOgIFoglq1mSEeLhtJkcBVXnU/XFn7XBk8+U1sMyUfJP73KR
         8l4zkvBNAgh3D7Gzb06PWkGAvF/Myu6rP2nGRzvTMY5MOvNKO+Y5ZVjKoHUO5pw94Xuf
         GxgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742569471; x=1743174271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GgUUdWVOXVECcjb99rFS8YWWBbCUYmB7JwFPV14nrLE=;
        b=mZUyZlcBv4lwCPcx7zH7aie+enwe7kNFPvKlHh5iOBZEt6OOnNoMWg36zIVDBHYWMo
         upxBUOpAC11LKa5TqCBqAD7UftNtCtikVA2+IZf/kFNHpbXSWSRRoakGVba2FzIqW/pe
         LRLnMWBwADwSfV9+lEM9M5CWgPK4HUWkQcdpTENk1McNWhhcr01oac1TJrJ8zCSbNteE
         EHDzSuDiMYepiWNVlwL8DHDEuyFZolFGt3rMAuBkWGbs/T+sgfQR4rFLtxbFSW+up12j
         WA6laPBeRdTR1lmsio3OyTixu8vsomwwNxWx/p6dgACXOCuYsKp1koVPFIspW4U/E5ma
         tpfg==
X-Gm-Message-State: AOJu0Yx75es4k0XB/MNBgX/UaMMae6QTk8QCcuZe0XvC9yXpwshX/tK0
	tJlp8sBf4kavAc7Q7iGlHHj2haB2XW1YAwt4KL6pvMI8tPxjl3zGAhKWzTxCbiRRdW7cAOsVTG6
	e
X-Gm-Gg: ASbGncu/YeahyGtmjsdbOWyGXz7u+YQcHQlBdi4JONp0Em/SL+FG5umF3fYJuhbQzVi
	Yr29pAN5BZXkpY1gwJWx7/eG4ncsiZQmKCMgy1dmUBdA30CA1beFx03pI2s7LsbysAtp/uRoi88
	4DNwVy5x8uBDKI+beFohLVVf+RIaVpj742Ua8W8AMahgCzuPkUIEt/TMRTKvut+kw9FrToGY1nH
	8HCuN2uxoO4Ds414nu4sY37nB8U5F9c8rJNcyyYeACJL+akFuMJcggagIRwn3/UVMZLQh7gx+91
	RelVHPzQIRa8jRSKbxDzqNOaQesMXtMRg1NmYqNHfSEqN0E=
X-Google-Smtp-Source: AGHT+IGb2o90WdBrClETBYqQeRLcSGVFG/mfFhHbHMJr/e6ZkX+jQR99yTXTIsqzZ/ecEIbYHYiFtg==
X-Received: by 2002:a05:6a21:910c:b0:1f3:37c4:5005 with SMTP id adf61e73a8af0-1fe4300d705mr6075595637.33.1742569471097;
        Fri, 21 Mar 2025 08:04:31 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2534:4cdb:e422:e636])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905fd5788sm2076620b3a.50.2025.03.21.08.04.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:04:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 1/5] xserver-xorg: mark CVEs fixed in 21.1.16 as fixed
Date: Fri, 21 Mar 2025 08:04:20 -0700
Message-ID: <84b1631bcbead1409ff44a1ed430244784c382be.1742569342.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1742569342.git.steve@sakoman.com>
References: <cover.1742569342.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 15:04:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213474

From: Peter Marko <peter.marko@siemens.com>

These are tracked as versionless redhat CVEs in NVD DB.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index e2754426cf..815be6a498 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -177,3 +177,7 @@ python populate_packages:prepend() {
 }
 
 CVE_STATUS[CVE-2023-5574] = "${@bb.utils.contains('PACKAGECONFIG', 'xvfb', 'unpatched', 'not-applicable-config: specific to Xvfb', d)}"
+
+CVE_STATUS_GROUPS = "CVE_STATUS_REDHAT"
+CVE_STATUS_REDHAT = "CVE-2025-26594 CVE-2025-26595 CVE-2025-26596 CVE-2025-26597 CVE-2025-26598 CVE-2025-26599 CVE-2025-26600 CVE-2025-26601"
+CVE_STATUS_REDHAT[status] = "fixed-version: these are tracked as versionless redhat CVEs in NVD DB, fixed in 21.1.16"
-- 
2.43.0


