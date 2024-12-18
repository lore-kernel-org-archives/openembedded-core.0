Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F677E7718B
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 22:02:48 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.117203.1734559364206170895
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Dec 2024 14:02:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BDw05KmY;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-216395e151bso1197305ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 14:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1734559363; x=1735164163; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xk4bYH8v7U7gVyN+k1ARdXo4HZyMrgyz7YfUXSmgF8U=;
        b=BDw05KmYMukUmkdQFmAa+AYmZZJhwJEHYM1Uhx4V3INnuNYbRPNxEPRMaf4dHsFzyK
         h0t0GsEOg0rUEDYrsh/EVxDLyiVrxC418v6q63c/dkW/t27wD091Z2LlgS1B0ofKi4Rh
         7D4b0Vn0xKet+mngHsaO4tuxYXuxhoJWfKjSWg3B3iCzF73I8TGvG52Lyxo9ymRRQU4F
         YnpELCdf7afgjLxdEpLLlWvRoqkDTmJ5oLiJbgR2pu536MI/pdKl429gjNOH76myJSAy
         0AvJ6NWW33hgaHdU+c09U25gPyh6boW1Ajb31ZfA4ZkWNzjtCbPZ6ugUTIJi5cs/956X
         BDpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734559363; x=1735164163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xk4bYH8v7U7gVyN+k1ARdXo4HZyMrgyz7YfUXSmgF8U=;
        b=I6rfY+FfKKjor4kxIQGMIQIuiRSn7s9A1e7QmFMce2BGXPa28I4ETpV37pi8vhG+wW
         bO2tp9je8d1JccIIXlUH9IH+PgP2bNRaDxx9/MuRrcjYk4rSplrGLxj09QMptnMJafLr
         DG5aFiaZ547h9XpgJDMNqqqnl8j2o70RCnIXtodBPNVzsuf6o/zoaDqa8YIjH3Y40+y1
         lETUusXsvggYYJhyPQ7lpRCoX0e6nPIiCRCjNa377cC+9w58K4SlPmQrwAMgSf50zK2W
         E/auDpFCMekJBAeWdOHoQ7zwMgppztW6r6K49uN7ioM3vpcmMOLIFC7wlEu7PieYh3RK
         VHDg==
X-Gm-Message-State: AOJu0YxTku6WjjnvxIdB/agpS7ioQt25T+aSpYUpWrH/El1aZa8pknMe
	9WAtlDXpD3H8n9VKDrpTQdxoF0oAMRwyINerQRC441wQRmp5dv6oeHySVh/I+o2q6XqJ/cvFH/V
	/
X-Gm-Gg: ASbGncueWlmr1QLvMvO+hgfYcPGgkRk2wGbadJElwlO7JcW7YBPMYNPVU288fA1XVtn
	10V+7VJKS4NB/uZadEmkKj82Zfi3SbLsnxSey1guCcmE2hcAPc3zWtf/8qoXecggqkZ8Hjq77YJ
	bnzaN7Upxe44SB1N7b+zsg6MGqMwhyCav7oebbTh/n4hPiSelmE/7vYISW32iym7Xg93Vy4zXoS
	5OJlrMCdFFUdF1aykR863xvA+/PTQXQ00TVb+sjAVOvVw==
X-Google-Smtp-Source: AGHT+IFVYzDSjwfzeq5SQiuKiNLA09jdUdOo/iBPVXtx/84K8G3dRQwiIs7cBSZ4m6oBcRLk9Zg9nA==
X-Received: by 2002:a17:903:903:b0:216:6284:8a00 with SMTP id d9443c01a7336-219da5b9cb9mr13815135ad.2.1734559363305;
        Wed, 18 Dec 2024 14:02:43 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-801d5aa4b92sm7965116a12.13.2024.12.18.14.02.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 14:02:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/10] python3: Drop empty patch
Date: Wed, 18 Dec 2024 14:02:11 -0800
Message-Id: <555623d2378138fdcfae95c04e06ba384cebab5b.1734553652.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734553652.git.steve@sakoman.com>
References: <cover.1734553652.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 22:02:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208887

From: Khem Raj <raj.khem@gmail.com>

The fix brought by this patch is already part of python 3.12.3
therefore drop it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


