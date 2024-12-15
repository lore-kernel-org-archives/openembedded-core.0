Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F43E77184
	for <webhook@archiver.kernel.org>; Sun, 15 Dec 2024 14:34:12 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.36329.1734273247410913279
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Dec 2024 06:34:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KSnDKYmH;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso22397495e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Dec 2024 06:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734273245; x=1734878045; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SMUEtS/pvsAkqy8NCfpo06CQyciOrGcZNFEMizW3vSM=;
        b=KSnDKYmHOkTii0fzrQ/V0Nl0Dl0tFjiuYa1iL9N/FSNdyjx+WCDd+UUjStseuFw4UE
         0tEI06XxOvsfeksuHiJN5XkcRhuOlybwzXhSGFNPIxGs+75+1e36kZB7NaPJpfSUsQAk
         +Ffn3D7rgjc2tXfqclkS+XkVG+drNwmWCuHHl0Uo3ayvAmuE4lkYHgHo1UmtnYwGOgUe
         ZYTWEdmHDR0KnIVwpqg3ktRdN48m1Dt1FQ2O2Tfc+X5SplTm1w7xTz0Q5p9cdQjyddWv
         cSFt9bFw46feVLPNzc2xxGnGvJiCZOF175gw7WaQK5DLz6FPFg8tDED5WAHrF77LIS4n
         zJ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734273245; x=1734878045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SMUEtS/pvsAkqy8NCfpo06CQyciOrGcZNFEMizW3vSM=;
        b=Jjt0PKQO8zvVvFBC47UAo5eLzXm3dYEIpIFTX1jiWHt30v5tN7eQOc2t748LRJfgiq
         oT0fSL1xxQIv8+Z3JOS9Ion8MXtYfvDKjBuyPTRRZOvNeymQdqArU8qZY/+D1q4Iqu9L
         pla0yGi7tPY1/xsOticm/KYW5gEybOA2hFxrlexEPObg93zWkxmEWNUiZSwT6LxxGmJ/
         i0oRSF//NjLZztOqzmep0Vr+t+YOOOmV5LCYUnl93AamuBTmu1uQAevAetLH9sC6jTgv
         Jmca+IIJU5ZSmud3AzndAmpct/Wq9lqF9nrDXKJRHv36W41AK5/Sf/QvCARsxsqgo2Fd
         o9kA==
X-Gm-Message-State: AOJu0YyyfXyDoa6yrv2gY9bbLgXyE6tdAcOMlREnmSaIWJqVjNdnC2ZB
	4G8dpI2Q2X/wE8gTSsMwrXTUvjnLbhRd5jI3LxXPsfbBwlbM1B28MR98AvxB
X-Gm-Gg: ASbGncurS+6O0THdUV60/HPVFuF/BNjaNzClBrvQ0C8Kazq4Cu0Fy+aPZaZ700x/gFn
	whJYwU1gPpnEWb/d93SauOk2Sy/NjWKhaDnE6ZVjZ27W71e0ZlXNGfvNJLOMlfbruGUJAwpTKOH
	Xr1VwVw0zCI+W23xjj8YGlKYYCB7t0Vx1snmgBrJfBj8y7CL2HyPA86dX9p17650oijzXcqgIM9
	LM9DaD9H7ZgdZkISOPyh9Eucqiq+roVsDsxDcbGNImgqrMWbn6iOR4CQBHLaD1K4MBWtXNFP1vM
	nM/KDA==
X-Google-Smtp-Source: AGHT+IHs1cup2ASLu6RIKdhALB6xtQbFBUgvkyPOaq9EUCsAlWZUHBxD4akm0cwvFVIf4JYRNoR5+g==
X-Received: by 2002:a5d:5889:0:b0:386:3684:c97e with SMTP id ffacd0b85a97d-3888e0ae544mr6466059f8f.23.1734273245169;
        Sun, 15 Dec 2024 06:34:05 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8016427sm5310569f8f.30.2024.12.15.06.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 06:34:04 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 1/2] python3: Drop empty patch
Date: Sun, 15 Dec 2024 14:32:46 +0000
Message-ID: <20241215143247.1224203-2-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241215143247.1224203-1-gudni.m.g@gmail.com>
References: <20241215143247.1224203-1-gudni.m.g@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Dec 2024 14:34:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208752

From: Khem Raj <raj.khem@gmail.com>

The fix brought by this patch is already part of python 3.12.3
therefore drop it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...lize-struct-termios-before-calling-t.patch | 26 -------------------
 .../recipes-devtools/python/python3_3.12.6.bb |  1 -
 2 files changed, 27 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-gh-114492-Initialize-struct-termios-before-calling-t.patch

diff --git a/meta/recipes-devtools/python/python3/0001-gh-114492-Initialize-struct-termios-before-calling-t.patch b/meta/recipes-devtools/python/python3/0001-gh-114492-Initialize-struct-termios-before-calling-t.patch
deleted file mode 100644
index 8406ef30a2..0000000000
--- a/meta/recipes-devtools/python/python3/0001-gh-114492-Initialize-struct-termios-before-calling-t.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 439aa02f42d6e6715c172076261757fcb89a936a Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Tue, 23 Jan 2024 23:02:02 +0100
-Subject: [PATCH] gh-114492: Initialize struct termios before calling
- tcgetattr() (GH-114495) (GH-114502)
-
-On Alpine Linux it could leave some field non-initialized.
-(cherry picked from commit d22c066b802592932f9eb18434782299e80ca42e)
-
-Upstream-Status: Backport [https://github.com/python/cpython/commit/386c72d9928c51aa2c855ce592bd8022da3b407f]
-Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- .../next/Library/2024-01-23-21-20-40.gh-issue-114492.vKxl5o.rst | 2 ++
- 1 file changed, 2 insertions(+)
- create mode 100644 Misc/NEWS.d/next/Library/2024-01-23-21-20-40.gh-issue-114492.vKxl5o.rst
-
-diff --git a/Misc/NEWS.d/next/Library/2024-01-23-21-20-40.gh-issue-114492.vKxl5o.rst b/Misc/NEWS.d/next/Library/2024-01-23-21-20-40.gh-issue-114492.vKxl5o.rst
-new file mode 100644
-index 0000000..8df8299
---- /dev/null
-+++ b/Misc/NEWS.d/next/Library/2024-01-23-21-20-40.gh-issue-114492.vKxl5o.rst
-@@ -0,0 +1,2 @@
-+Make the result of :func:`termios.tcgetattr` reproducible on Alpine Linux.
-+Previously it could leave a random garbage in some fields.
diff --git a/meta/recipes-devtools/python/python3_3.12.6.bb b/meta/recipes-devtools/python/python3_3.12.6.bb
index ae69f0e781..63a3134b36 100644
--- a/meta/recipes-devtools/python/python3_3.12.6.bb
+++ b/meta/recipes-devtools/python/python3_3.12.6.bb
@@ -29,7 +29,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Update-test_sysconfig-for-posix_user-purelib.patch \
            file://0001-skip-no_stdout_fileno-test-due-to-load-variability.patch \
            file://0001-test_storlines-skip-due-to-load-variability.patch \
-           file://0001-gh-114492-Initialize-struct-termios-before-calling-t.patch \
            file://0001-test_shutdown-skip-problematic-test.patch \
            file://0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch \
 	   file://0001-test_deadlock-skip-problematic-test.patch \
-- 
2.43.0


