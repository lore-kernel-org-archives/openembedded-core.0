Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E1FCC49EA1
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 13:13:27 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.55660.1722258800800574523
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 06:13:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2KjMG12n;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2cd2f89825fso1976845a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 06:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722258800; x=1722863600; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=83dROXBrUVHqQtlAVa5WTQg2NFGnEdT3+q8XinPWK2M=;
        b=2KjMG12nUkP1nRUZCLx1ar05TUX4jQfAGI2QifAmNUBwLVSpCNeqvGc6KJPRdjVts7
         FZqWQ0qHKXuf+SXPaLQ1Ok+4hR+SBqEslJUoc4MeXjISEpa+FgoTL9PV77JG0pSGt7al
         GmsDn14BBR+H9l8c8C52fwFqCHM9Es62CvLAoqGqq5gtTvwiBMOfM5MYfRpoknW9eMEA
         xdKhj0JU9AK3+9XRSMPAf3C/M2u9S8LPIjxkHEvS/0KpUDkCzfO5xKgDk3uyyQi3u76U
         6fIqC8uOGfWrIqSbmxjJOhlZzwwGDahLY4rW/Phe52HEXSkpWTtotLGHaZmvOjGgOqr5
         npxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722258800; x=1722863600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=83dROXBrUVHqQtlAVa5WTQg2NFGnEdT3+q8XinPWK2M=;
        b=azRY02xqMMfnuMowsuO2nZ86dId2LMDpA93u7ywpSnCiAFAn4oVrxjVfh+lLqQM28u
         A8exKM9+eZWzada9ED8muvtJYX4UM9bM4q6t4x1b+c6dH9LQyokv77BQLstqWY9FbCem
         7iioYSu6cxIpl85OXQaUrdVDV7+ClP7m7aKaIHluN6oEYxlm/QNI9InlQRxnbbL0qOO2
         xsiO6QKk6UEPzh2i8lkYZBdIQSKbsLGlD2ktWzvlAduZr16I2K1e3TzpDZVOdnJgbQfx
         toq+yxdhFy5m+E7Mx9fPfRBtpzAXS4NaDcVX1xJrBMfOshVXiA0QZnIWh/rlq/n/9kTK
         HSVA==
X-Gm-Message-State: AOJu0YypbXhfr1hgzm1png1RSGoW1+zJN+fB729fTlm9tMOz+EWehe3K
	Vg/nb+WbJ+8teL+4vIGO5J86aHEX+6ZNOflMg+nS5jM3a4xICpnseAcw9BK/ok8tklm+FvOL9U0
	mHUo/oA==
X-Google-Smtp-Source: AGHT+IG0QWr6xoQEZEpR/wzpU5k6X+2InQl0pbtYgeX6M4H5QtG22i8qdmaobO0VlPB62GiaQGZYOw==
X-Received: by 2002:a17:90a:558d:b0:2c7:1370:f12f with SMTP id 98e67ed59e1d1-2cf7e86eabcmr4574597a91.40.1722258800023;
        Mon, 29 Jul 2024 06:13:20 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73b32cbsm10493788a91.17.2024.07.29.06.13.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:13:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/37] python3: Treat UID/GID overflow as failure
Date: Mon, 29 Jul 2024 06:12:27 -0700
Message-Id: <371124fa4bf1a255a4fc646b028398db8c9f3681.1722258106.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722258106.git.steve@sakoman.com>
References: <cover.1722258106.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 13:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202631

From: Khem Raj <raj.khem@gmail.com>

This fixes ptest failures on 32bit architectures

AssertionError:
Failed ptests:
{'python3': ['test_extractall_none_gid',
             'test_extractall_none_gname',
             'test_extractall_none_mode',
             'test_extractall_none_mtime',
             'test_extractall_none_uid',
             'test_extractall_none_uname',
             'setUpClass',
             'python3']}

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 43104b547cb79693c83df0882773ae8dd74b1d35)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...e-treat-overflow-in-UID-GID-as-failu.patch | 40 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.12.4.bb |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch

diff --git a/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch b/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
new file mode 100644
index 0000000000..88b84c6024
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
@@ -0,0 +1,40 @@
+From 999d4e74d34afa233ad8ad0c70b989d77a21957f Mon Sep 17 00:00:00 2001
+From: Petr Viktorin <encukou@gmail.com>
+Date: Wed, 23 Aug 2023 20:00:07 +0200
+Subject: [PATCH] gh-107811: tarfile: treat overflow in UID/GID as failure to
+ set it (#108369)
+
+Upstream-Status: Backport [https://github.com/python/cpython/pull/108369]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Lib/tarfile.py                                                 | 3 ++-
+ .../Library/2023-08-23-17-34-39.gh-issue-107811.3Fng72.rst     | 3 +++
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+ create mode 100644 Misc/NEWS.d/next/Library/2023-08-23-17-34-39.gh-issue-107811.3Fng72.rst
+
+diff --git a/Lib/tarfile.py b/Lib/tarfile.py
+index 3bbbcaa..473167d 100755
+--- a/Lib/tarfile.py
++++ b/Lib/tarfile.py
+@@ -2557,7 +2557,8 @@ class TarFile(object):
+                     os.lchown(targetpath, u, g)
+                 else:
+                     os.chown(targetpath, u, g)
+-            except OSError as e:
++            except (OSError, OverflowError) as e:
++                # OverflowError can be raised if an ID doesn't fit in `id_t`
+                 raise ExtractError("could not change owner") from e
+ 
+     def chmod(self, tarinfo, targetpath):
+diff --git a/Misc/NEWS.d/next/Library/2023-08-23-17-34-39.gh-issue-107811.3Fng72.rst b/Misc/NEWS.d/next/Library/2023-08-23-17-34-39.gh-issue-107811.3Fng72.rst
+new file mode 100644
+index 0000000..ffca413
+--- /dev/null
++++ b/Misc/NEWS.d/next/Library/2023-08-23-17-34-39.gh-issue-107811.3Fng72.rst
+@@ -0,0 +1,3 @@
++:mod:`tarfile`: extraction of members with overly large UID or GID (e.g. on
++an OS with 32-bit :c:type:`!id_t`) now fails in the same way as failing to
++set the ID.
+-- 
+2.45.0
+
diff --git a/meta/recipes-devtools/python/python3_3.12.4.bb b/meta/recipes-devtools/python/python3_3.12.4.bb
index 0cb84b91b4..c5ba009e7f 100644
--- a/meta/recipes-devtools/python/python3_3.12.4.bb
+++ b/meta/recipes-devtools/python/python3_3.12.4.bb
@@ -31,6 +31,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-test_storlines-skip-due-to-load-variability.patch \
            file://0001-gh-114492-Initialize-struct-termios-before-calling-t.patch \
            file://0001-test_shutdown-skip-problematic-test.patch \
+           file://0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.34.1


