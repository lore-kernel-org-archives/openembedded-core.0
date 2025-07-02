Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0642AC83F05
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 03:12:51 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.15031.1751425967085259478
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 20:12:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2ntDZgQk;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-748fe69a7baso6126956b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 20:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751425966; x=1752030766; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cx8qY2VpegGA4rAAECFVuNCqseH43iXQrACSjRYxtaM=;
        b=2ntDZgQk1p1b5ZahllaRQ5FDVuWzc5hJYUhvHjKVdmv/V5gBnjgtbs4RF73fmlL5lI
         5B3UWhhPp2SSuHv/uQXwZ/4VRcaOGHTKVgG2jmZ50lracFMZHdnQL3NxepBLhVdKGwkL
         Tap7kj1Y+bR21Gpd/qdZOZleD++HZImPBfe1a/Ew2/w58mzjFlvHw46WGtyS4BkGpKPr
         MPZYOHpNGi1clQhJo9DDYUUMvUZVDI/0lD5u0Gkln0SsE2n9OP/oehFbCF60feDpIt89
         vw4TIFfGcQ83ULNgNf/7kOEyvWFV7fEXeXj6xUL4M4xf3c/WMMtoClJwfi8Biu2++Jcf
         xb4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751425966; x=1752030766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cx8qY2VpegGA4rAAECFVuNCqseH43iXQrACSjRYxtaM=;
        b=H+K5ell36QbTBv8D1j4w8s5P+68GdUMzZii6Fu4qz1ELzj2rs9Nx9u/7IEYVjTk3z/
         4gNHQWD0L9tSIy6MJ3xc61Qgs5QkRZFS/MUes4n160ZuYngVSPOvuvPRAaemuChyESg5
         wMQCYIkHfAngSLS9OdNw/F5ZZk6L5vG4L8RydaD/g21XhyM3vrkJkDc1LpzyXfz1Cxk9
         bDubUhPjF2FAl5FjF7/dTAZa5b449i+hB1O+gOVL7qW6AkgqnDxZMcNTGfdLLyHtZ8yD
         9/q9TA4Kq8fXBSIb2VSoV3lkHqNn0Tb6OdoFZdyZMHohTHssQDrlgfLiaCWo8J8uA0Ra
         kDCA==
X-Gm-Message-State: AOJu0YxP07KO6+jfoJ7bufA9fABNIbXBLCRw0fbVdZ8kJk8kKM3466C3
	kbGp1X10QmaKESlTyD7+kTS/VNd0dllOlvhVRxfK0QNmuQzwOnsBGn7ewHRubLG08wxC3xrb89M
	EvYnK
X-Gm-Gg: ASbGnct9Q08RqXErlL//8NR4pLEw0Uqs3TW4TC9rFkPbtW59pa6QvGKRjxO6ubXINsR
	YniBKeig2+uNsupMnMMoZH/sNHeOhQtBKotDIPY8JPc5pmpWhNiuH93yISLsdAtDDL6gB4z4kSA
	HEZM/3VzVQTaH+pFe/Q2JDFSwTCXAfpZlPOcy4An2sTqoQSBNfnCbNRpUuyk4G2hyurjZ5+HFDO
	ASgLVFBoYoQ7ofAEERJ2FMvdfjbJW2BHfmM7gin0B1N17+7YKeKmSgCYcu6wqYrieCSflX3CO4V
	5M84LguZGvoBq0tzCY5DCAEgxZkg0lC+GfPqCTUz69J+RjsFulap7g==
X-Google-Smtp-Source: AGHT+IG1D3T1VuRLIwulQIHvY2fZGWaYed/oZvnE1hK676+YZ/jyyG1kdCoBEdsPjdY7PXMZg+OVAA==
X-Received: by 2002:a05:6a00:218f:b0:746:26fe:8cdf with SMTP id d2e1a72fcca58-74b50e8eb48mr1787072b3a.7.1751425966354;
        Tue, 01 Jul 2025 20:12:46 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34f8:320a:2e39:118e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af58069a9sm13633241b3a.174.2025.07.01.20.12.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 20:12:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 14/19] linux/generate-cve-exclusions: show the name and version of the data source
Date: Tue,  1 Jul 2025 20:11:59 -0700
Message-ID: <a06234b35977b9a2af2679d6c601a79acbde5f7c.1751425749.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751425749.git.steve@sakoman.com>
References: <cover.1751425749.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 03:12:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219768

From: Ross Burton <ross.burton@arm.com>

Add another comment to state what the data source for the CVE data was,
specifically the basename of the repository and the "git describe" output
of HEAD.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5e66e2b79faec2285d249b16457ecc63c4042444)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/generate-cve-exclusions.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/generate-cve-exclusions.py b/meta/recipes-kernel/linux/generate-cve-exclusions.py
index b45c2d5702..dfc16663a5 100755
--- a/meta/recipes-kernel/linux/generate-cve-exclusions.py
+++ b/meta/recipes-kernel/linux/generate-cve-exclusions.py
@@ -11,6 +11,7 @@ import json
 import pathlib
 import os
 import glob
+import subprocess
 
 from packaging.version import Version
 
@@ -92,13 +93,16 @@ def main(argp=None):
     parser.add_argument("version", type=Version, help="Kernel version number to generate data for, such as 6.1.38")
 
     args = parser.parse_args(argp)
-    datadir = args.datadir
+    datadir = args.datadir.resolve()
     version = args.version
     base_version = Version(f"{version.major}.{version.minor}")
 
+    data_version = subprocess.check_output(("git", "describe", "--tags", "HEAD"), cwd=datadir, text=True)
+
     print(f"""
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at {datetime.datetime.now(datetime.timezone.utc)} for version {version}
+# Generated at {datetime.datetime.now(datetime.timezone.utc)} for kernel version {version}
+# From {datadir.name} {data_version}
 
 python check_kernel_cve_status_version() {{
     this_version = "{version}"
-- 
2.43.0


