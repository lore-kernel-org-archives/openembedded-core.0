Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01954C8303D
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 03:12:51 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.15056.1751425965309753347
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 20:12:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UYQ4nsUx;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-748d982e92cso4840843b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 20:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751425964; x=1752030764; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OwEHE32GgPrYqcSW4K54ajIq9AVtEB9Y6OhPbyCrVXw=;
        b=UYQ4nsUx/fT4DoN9Nq7VR4YSZ7y+2Dd917ZjgFmG81wI/n3LhRG2s/7C2ys+Xazuom
         tX1XQ51aO5eVllEAXKKM6jjAFhseYMO2x7NIk4fErzrkpIvGrYlCCN6Fhintu5HDyr4k
         T01U6UDpd6Cq2C+fkGUF+SytwgOmuYlnTxfelNT3poqpXk87BUk1TM568A8Tn+vBLn+r
         GbeXWAPNgtgv8NyfSF4dHCPN3sqxI3x7wbmKvBQFCYXVod5E2TFGIgQysyl439Xlu6Qv
         qoc80vSz0pGeuYN8cCmUgv+MaetP3s6AhhHZJQsDR4HORScuEnz8tBVbbka3qrsctqNx
         ytPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751425964; x=1752030764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OwEHE32GgPrYqcSW4K54ajIq9AVtEB9Y6OhPbyCrVXw=;
        b=WV48ynQTxzgvK9AArEZZABUTdUnoipqMfhudKAoRU5InSX7lPysytytVcB0Hn11Myl
         jR8igXNjlL02mk6I0ib0nviieozXyUwGdnDCZdpY4AeZkiXPaGVUYqqAZH0NoAto+33O
         Lr60iHTfITTNmjwTsNhr/KiQC7Xy2A5cYcmZ42tSLoaWNUC+7/mEjaXUWrunIcJgx2tE
         MIB2YUyw47qlLWaCJMJPDuUIgKBBevZ25kLxX4Qj8EPDkNql8lLReZk0BnZ89m2ewcf/
         K66IHV0nyk/guLlU4p0OGouxbpty/XpVlivyC7PEDh3qqOb+OeHt+oRJOJmGHLgcdJhd
         zHGw==
X-Gm-Message-State: AOJu0YwFIMio6G3sHLgpsoax76UVVDXuYhTPb8B1leqUii1cyh6XAlKr
	l0R/pRal6RAL+itlqPJUpoE6myzKY138iuLsLYpQUvNylidxY9qQ620uPxwWml88XsTNh2Ti70S
	mxKQP
X-Gm-Gg: ASbGnctlZMbMBXZu9euo/pk/3Qml9eb6QNpImUUI3EjMp+g5qrXbC5XqVblSbM52Z5U
	/NlT9dSX5XXcuGBdnfC4tffceVHrO6CTOPUpVK0l6X6GDsk2jADMVmIn3g1ikJbNGiVjrZgAbPo
	XuH/gGWNqFlXkTG9xkFdBNKUlxePPaWeO5oZVAHoWdjs0ukCepXEbdUDOZfrrfreHpbLtLb7yT3
	NoJvKSX63X5smINQzqvk1tIPyOkXZoYTMhp51TOgtPcguBMAkPqgD0eL/MOAe/2f6T7/F1o37bO
	JhxyFKWHnBfXND+qg7pGc4zzyEt3ExQJ/LUtdZZ7KLuZQ9UP87+FGA==
X-Google-Smtp-Source: AGHT+IHxHe6Tv6zZf7FDxx3/ApAWFeP8BimIRObKPbO+L1bb8TuoRL5HYX5JH5xjTL9vgvSD21VzcA==
X-Received: by 2002:a05:6a00:ccd:b0:748:2e7b:3308 with SMTP id d2e1a72fcca58-74b50e8d9famr1693714b3a.6.1751425964286;
        Tue, 01 Jul 2025 20:12:44 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34f8:320a:2e39:118e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af58069a9sm13633241b3a.174.2025.07.01.20.12.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 20:12:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 13/19] linux: cve-exclusions: Amend terminology
Date: Tue,  1 Jul 2025 20:11:58 -0700
Message-ID: <f0d7546d7d67ed0244f1428a18850e700c678235.1751425749.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751425749.git.steve@sakoman.com>
References: <cover.1751425749.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 03:12:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219767

From: Niko Mauno <niko.mauno@vaisala.com>

Replace the term 'needs backporting' with 'may need backporting' in
generate-cve-exclusions.py when the checked kernel version may or may
not be in the vulnerable version range, thus making backporting
necessary only in the former case.

In tandem we regenerate the content of cve-exclusion_6.12.inc using
https://github.com/CVEProject/cvelistV5.git repository main branch at
git hash b20d0043711588b6409ae3118bc0510ab888c316 to keep the content
in sync with the script.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit feb80e6be16f27611a018d0ef7841cbb466c47d1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/cve-exclusion_6.12.inc              | 142 +++++++++---------
 .../linux/generate-cve-exclusions.py          |   2 +-
 2 files changed, 72 insertions(+), 72 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index c03ad19a3d..120b1b5ef7 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,6 +1,6 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-05-24 12:02:58.590640+00:00 for version 6.12.27
+# Generated at 2025-05-24 12:18:11.126849+00:00 for version 6.12.27
 
 python check_kernel_cve_status_version() {
     this_version = "6.12.27"
@@ -12356,7 +12356,7 @@ CVE_STATUS[CVE-2025-22100] = "fixed-version: only affects 6.13 onwards"
 
 # CVE-2025-22101 needs backporting (fixed from 6.15rc1)
 
-# CVE-2025-22102 needs backporting (fixed from 6.12.30)
+# CVE-2025-22102 may need backporting (fixed from 6.12.30)
 
 # CVE-2025-22103 needs backporting (fixed from 6.15rc1)
 
@@ -12640,7 +12640,7 @@ CVE_STATUS[CVE-2025-37819] = "cpe-stable-backport: Backported in 6.12.26"
 
 CVE_STATUS[CVE-2025-37820] = "cpe-stable-backport: Backported in 6.12.26"
 
-# CVE-2025-37821 needs backporting (fixed from 6.12.29)
+# CVE-2025-37821 may need backporting (fixed from 6.12.29)
 
 CVE_STATUS[CVE-2025-37822] = "cpe-stable-backport: Backported in 6.12.26"
 
@@ -12776,99 +12776,99 @@ CVE_STATUS[CVE-2025-37888] = "cpe-stable-backport: Backported in 6.12.26"
 
 CVE_STATUS[CVE-2025-37889] = "cpe-stable-backport: Backported in 6.12.20"
 
-# CVE-2025-37890 needs backporting (fixed from 6.12.28)
+# CVE-2025-37890 may need backporting (fixed from 6.12.28)
 
-# CVE-2025-37891 needs backporting (fixed from 6.12.28)
+# CVE-2025-37891 may need backporting (fixed from 6.12.28)
 
 CVE_STATUS[CVE-2025-37892] = "cpe-stable-backport: Backported in 6.12.24"
 
 CVE_STATUS[CVE-2025-37893] = "cpe-stable-backport: Backported in 6.12.23"
 
-# CVE-2025-37894 needs backporting (fixed from 6.12.28)
+# CVE-2025-37894 may need backporting (fixed from 6.12.28)
 
-# CVE-2025-37895 needs backporting (fixed from 6.12.28)
+# CVE-2025-37895 may need backporting (fixed from 6.12.28)
 
 CVE_STATUS[CVE-2025-37896] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2025-37897 needs backporting (fixed from 6.12.28)
+# CVE-2025-37897 may need backporting (fixed from 6.12.28)
 
 CVE_STATUS[CVE-2025-37898] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2025-37899 needs backporting (fixed from 6.12.28)
+# CVE-2025-37899 may need backporting (fixed from 6.12.28)
 
-# CVE-2025-37900 needs backporting (fixed from 6.12.28)
+# CVE-2025-37900 may need backporting (fixed from 6.12.28)
 
-# CVE-2025-37901 needs backporting (fixed from 6.12.28)
+# CVE-2025-37901 may need backporting (fixed from 6.12.28)
 
 CVE_STATUS[CVE-2025-37902] = "fixed-version: only affects 6.15rc5 onwards"
 
-# CVE-2025-37903 needs backporting (fixed from 6.12.28)
+# CVE-2025-37903 may need backporting (fixed from 6.12.28)
 
 CVE_STATUS[CVE-2025-37904] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2025-37905 needs backporting (fixed from 6.12.28)
+# CVE-2025-37905 may need backporting (fixed from 6.12.28)
 
 # CVE-2025-37906 needs backporting (fixed from 6.15rc4)
 
-# CVE-2025-37907 needs backporting (fixed from 6.12.28)
+# CVE-2025-37907 may need backporting (fixed from 6.12.28)
 
-# CVE-2025-37908 needs backporting (fixed from 6.12.28)
+# CVE-2025-37908 may need backporting (fixed from 6.12.28)
 
-# CVE-2025-37909 needs backporting (fixed from 6.12.28)
+# CVE-2025-37909 may need backporting (fixed from 6.12.28)
 
-# CVE-2025-37910 needs backporting (fixed from 6.12.28)
+# CVE-2025-37910 may need backporting (fixed from 6.12.28)
 
-# CVE-2025-37911 needs backporting (fixed from 6.12.28)
+# CVE-2025-37911 may need backporting (fixed from 6.12.28)
 
-# CVE-2025-37912 needs backporting (fixed from 6.12.28)
+# CVE-2025-37912 may need backporting (fixed from 6.12.28)
 
-# CVE-2025-37913 needs backporting (fixed from 6.12.28)
+# CVE-2025-37913 may need backporting (fixed from 6.12.28)
 
-# CVE-2025-37914 needs backporting (fixed from 6.12.28)
+# CVE-2025-37914 may need backporting (fixed from 6.12.28)
 
-# CVE-2025-37915 needs backporting (fixed from 6.12.28)
+# CVE-2025-37915 may need backporting (fixed from 6.12.28)
 
-# CVE-2025-37916 needs backporting (fixed from 6.12.28)
+# CVE-2025-37916 may need backporting (fixed from 6.12.28)
 
-# CVE-2025-37917 needs backporting (fixed from 6.12.28)
+# CVE-2025-37917 may need backporting (fixed from 6.12.28)
 
-# CVE-2025-37918 needs backporting (fixed from 6.12.28)
+# CVE-2025-37918 may need backporting (fixed from 6.12.28)
 
-# CVE-2025-37919 needs backporting (fixed from 6.12.28)
+# CVE-2025-37919 may need backporting (fixed from 6.12.28)
 
-# CVE-2025-37920 needs backporting (fixed from 6.12.28)
+# CVE-2025-37920 may need backporting (fixed from 6.12.28)
 
-# CVE-2025-37921 needs backporting (fixed from 6.12.28)
+# CVE-2025-37921 may need backporting (fixed from 6.12.28)
 
-# CVE-2025-37922 needs backporting (fixed from 6.12.28)
+# CVE-2025-37922 may need backporting (fixed from 6.12.28)
 
-# CVE-2025-37923 needs backporting (fixed from 6.12.28)
+# CVE-2025-37923 may need backporting (fixed from 6.12.28)
 
-# CVE-2025-37924 needs backporting (fixed from 6.12.28)
+# CVE-2025-37924 may need backporting (fixed from 6.12.28)
 
 # CVE-2025-37925 needs backporting (fixed from 6.15rc1)
 
-# CVE-2025-37926 needs backporting (fixed from 6.12.28)
+# CVE-2025-37926 may need backporting (fixed from 6.12.28)
 
-# CVE-2025-37927 needs backporting (fixed from 6.12.28)
+# CVE-2025-37927 may need backporting (fixed from 6.12.28)
 
-# CVE-2025-37928 needs backporting (fixed from 6.12.28)
+# CVE-2025-37928 may need backporting (fixed from 6.12.28)
 
-# CVE-2025-37929 needs backporting (fixed from 6.12.28)
+# CVE-2025-37929 may need backporting (fixed from 6.12.28)
 
-# CVE-2025-37930 needs backporting (fixed from 6.12.28)
+# CVE-2025-37930 may need backporting (fixed from 6.12.28)
 
-# CVE-2025-37931 needs backporting (fixed from 6.12.28)
+# CVE-2025-37931 may need backporting (fixed from 6.12.28)
 
-# CVE-2025-37932 needs backporting (fixed from 6.12.28)
+# CVE-2025-37932 may need backporting (fixed from 6.12.28)
 
-# CVE-2025-37933 needs backporting (fixed from 6.12.28)
+# CVE-2025-37933 may need backporting (fixed from 6.12.28)
 
-# CVE-2025-37934 needs backporting (fixed from 6.12.28)
+# CVE-2025-37934 may need backporting (fixed from 6.12.28)
 
-# CVE-2025-37935 needs backporting (fixed from 6.12.28)
+# CVE-2025-37935 may need backporting (fixed from 6.12.28)
 
-# CVE-2025-37936 needs backporting (fixed from 6.12.28)
+# CVE-2025-37936 may need backporting (fixed from 6.12.28)
 
 CVE_STATUS[CVE-2025-37937] = "cpe-stable-backport: Backported in 6.12.23"
 
@@ -12888,63 +12888,63 @@ CVE_STATUS[CVE-2025-37944] = "cpe-stable-backport: Backported in 6.12.25"
 
 CVE_STATUS[CVE-2025-37945] = "cpe-stable-backport: Backported in 6.12.24"
 
-# CVE-2025-37946 needs backporting (fixed from 6.12.29)
+# CVE-2025-37946 may need backporting (fixed from 6.12.29)
 
-# CVE-2025-37947 needs backporting (fixed from 6.12.29)
+# CVE-2025-37947 may need backporting (fixed from 6.12.29)
 
-# CVE-2025-37948 needs backporting (fixed from 6.12.29)
+# CVE-2025-37948 may need backporting (fixed from 6.12.29)
 
-# CVE-2025-37949 needs backporting (fixed from 6.12.29)
+# CVE-2025-37949 may need backporting (fixed from 6.12.29)
 
 CVE_STATUS[CVE-2025-37950] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2025-37951 needs backporting (fixed from 6.12.29)
+# CVE-2025-37951 may need backporting (fixed from 6.12.29)
 
-# CVE-2025-37952 needs backporting (fixed from 6.12.29)
+# CVE-2025-37952 may need backporting (fixed from 6.12.29)
 
-# CVE-2025-37953 needs backporting (fixed from 6.12.29)
+# CVE-2025-37953 may need backporting (fixed from 6.12.29)
 
-# CVE-2025-37954 needs backporting (fixed from 6.12.29)
+# CVE-2025-37954 may need backporting (fixed from 6.12.29)
 
-# CVE-2025-37955 needs backporting (fixed from 6.12.29)
+# CVE-2025-37955 may need backporting (fixed from 6.12.29)
 
-# CVE-2025-37956 needs backporting (fixed from 6.12.29)
+# CVE-2025-37956 may need backporting (fixed from 6.12.29)
 
-# CVE-2025-37957 needs backporting (fixed from 6.12.29)
+# CVE-2025-37957 may need backporting (fixed from 6.12.29)
 
-# CVE-2025-37958 needs backporting (fixed from 6.12.29)
+# CVE-2025-37958 may need backporting (fixed from 6.12.29)
 
-# CVE-2025-37959 needs backporting (fixed from 6.12.29)
+# CVE-2025-37959 may need backporting (fixed from 6.12.29)
 
-# CVE-2025-37960 needs backporting (fixed from 6.12.29)
+# CVE-2025-37960 may need backporting (fixed from 6.12.29)
 
-# CVE-2025-37961 needs backporting (fixed from 6.12.29)
+# CVE-2025-37961 may need backporting (fixed from 6.12.29)
 
-# CVE-2025-37962 needs backporting (fixed from 6.12.29)
+# CVE-2025-37962 may need backporting (fixed from 6.12.29)
 
-# CVE-2025-37963 needs backporting (fixed from 6.12.29)
+# CVE-2025-37963 may need backporting (fixed from 6.12.29)
 
-# CVE-2025-37964 needs backporting (fixed from 6.12.29)
+# CVE-2025-37964 may need backporting (fixed from 6.12.29)
 
-# CVE-2025-37965 needs backporting (fixed from 6.12.29)
+# CVE-2025-37965 may need backporting (fixed from 6.12.29)
 
 CVE_STATUS[CVE-2025-37966] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2025-37967 needs backporting (fixed from 6.12.30)
+# CVE-2025-37967 may need backporting (fixed from 6.12.30)
 
-# CVE-2025-37968 needs backporting (fixed from 6.12.30)
+# CVE-2025-37968 may need backporting (fixed from 6.12.30)
 
-# CVE-2025-37969 needs backporting (fixed from 6.12.29)
+# CVE-2025-37969 may need backporting (fixed from 6.12.29)
 
-# CVE-2025-37970 needs backporting (fixed from 6.12.29)
+# CVE-2025-37970 may need backporting (fixed from 6.12.29)
 
-# CVE-2025-37971 needs backporting (fixed from 6.12.29)
+# CVE-2025-37971 may need backporting (fixed from 6.12.29)
 
-# CVE-2025-37972 needs backporting (fixed from 6.12.29)
+# CVE-2025-37972 may need backporting (fixed from 6.12.29)
 
-# CVE-2025-37973 needs backporting (fixed from 6.12.29)
+# CVE-2025-37973 may need backporting (fixed from 6.12.29)
 
-# CVE-2025-37974 needs backporting (fixed from 6.12.29)
+# CVE-2025-37974 may need backporting (fixed from 6.12.29)
 
 CVE_STATUS[CVE-2025-37975] = "cpe-stable-backport: Backported in 6.12.25"
 
@@ -12976,9 +12976,9 @@ CVE_STATUS[CVE-2025-37988] = "cpe-stable-backport: Backported in 6.12.26"
 
 CVE_STATUS[CVE-2025-37989] = "cpe-stable-backport: Backported in 6.12.26"
 
-# CVE-2025-37990 needs backporting (fixed from 6.12.28)
+# CVE-2025-37990 may need backporting (fixed from 6.12.28)
 
-# CVE-2025-37991 needs backporting (fixed from 6.12.28)
+# CVE-2025-37991 may need backporting (fixed from 6.12.28)
 
 CVE_STATUS[CVE-2025-38049] = "cpe-stable-backport: Backported in 6.12.23"
 
diff --git a/meta/recipes-kernel/linux/generate-cve-exclusions.py b/meta/recipes-kernel/linux/generate-cve-exclusions.py
index ea59c15a01..b45c2d5702 100755
--- a/meta/recipes-kernel/linux/generate-cve-exclusions.py
+++ b/meta/recipes-kernel/linux/generate-cve-exclusions.py
@@ -141,7 +141,7 @@ do_cve_check[prefuncs] += "check_kernel_cve_status_version"
                         f'CVE_STATUS[{cve}] = "cpe-stable-backport: Backported in {backport_ver}"'
                     )
                 else:
-                    print(f"# {cve} needs backporting (fixed from {backport_ver})")
+                    print(f"# {cve} may need backporting (fixed from {backport_ver})")
             else:
                 print(f"# {cve} needs backporting (fixed from {fixed})")
 
-- 
2.43.0


