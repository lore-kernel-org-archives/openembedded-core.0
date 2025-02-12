Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA88DC021A8
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 14:21:57 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.16902.1739370117039101433
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 06:21:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=3OjetbdB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-220ca204d04so3561175ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 06:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739370116; x=1739974916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hw6w8yD1qx6KmwdzgeytreMyeIcMY5UVfgMZBmstFNM=;
        b=3OjetbdB+x7oxOzvcUdklhKfTc3lSSHqHFJSmEeuhJ3LlkgljGx/7T66LH73dKJ51W
         IPrK55sM6oUG2Qzc5LTt7pZpYKPZJ9VSfitz4GD5HXgQGNCBQBw1nzCI/R06xOq7znfF
         J0SJMU6SPnjYWbzunJ7caWLGG+vmiRKd/rofLXtImwQlAVThFoL5i7LNuVodbhw3qj3X
         xSfb3Hg6k2DJ+UcZUbj49aYDlNrO3J9n9bMC3idr3kMUCNScDUe0rrXszayvOQ4OQ2gJ
         25+6ho/6jjsPYOImNrEicYpJA490IcZ8CJWbkDJvN+++9ngHAEhHdQLs+frsjGc/TC13
         pcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739370116; x=1739974916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hw6w8yD1qx6KmwdzgeytreMyeIcMY5UVfgMZBmstFNM=;
        b=wSkockxzxZl3Xwdi/T7DQkd1afmEVXRtd+0uh0BJMSv2zO+L/I30B1Qstwzd0DvsQ+
         zHCvygCr5nuQUmhwwfJtT5cWN/OscPqseBOdJyFFVEJai0WbLmrn0vi7XzDqFJmbMjyN
         QlS0bWb+2E9TwQ4ecbUrFBNLT0NEGCneKyRxgJMZLO+tx45Q14bmMjex9PFVjGJXdxKA
         Aqu0pb/eUllhLje/w5LP+te1AZHhTgOyYj1RzmIXxurXPE5Jcnp9KXXf11gTvzT+ge4z
         LkdINj2WPYP1Rd5KsSlxSL+L8bppnCDkmjbDdyngt6NKbGOdigNfHgiHJ5VSF6SiVgRH
         1rIA==
X-Gm-Message-State: AOJu0YyAW5XiSTmfzmkJtVfxMcf7STlzL1HDptjdf+A9ymyE96Cz18Rl
	sGdsCZmtL7NLU9JV154ODSfALAR/7YkuF7RjWtL7/bIU63M8ZUxkjH17xFXsVUOKRIylyKZQTrh
	o
X-Gm-Gg: ASbGnctNVyhUwQ15NNOgaLkRqgZtm1fYQ2M13lfd7+0ARKSgTPFdHjpZd5I7iYOub3I
	FDU420akLP1PRkFI71fjJb3jnYgg7K3fisqPGUjjUJ4itCLhvOAY3mdpvygEv/4CwORbxlMn9Ut
	lEPKw+FJAgUCv7uNPiyTAqHVG3T+z5xu6Y+p/jn44JUc8G7qlm7OYYzdx9R3ktvI3livDccQm6X
	pYEsR1UdL0QZsTdQOVGaZu2AZNXiTpSS5wwgoNX+hUyL8AAF6p8f8VXg7J/BrPiLG1AP7qien4h
	iyXv
X-Google-Smtp-Source: AGHT+IEY3nNTvdjYwzd1MxnIeekiA6VsX1t5w/fyoyHzbBK/sUa5+3UIzISFnDcReMtLSN9hDoSdAQ==
X-Received: by 2002:a05:6a00:1494:b0:732:2170:b69a with SMTP id d2e1a72fcca58-7322c4118afmr4586395b3a.18.1739370116174;
        Wed, 12 Feb 2025 06:21:56 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73079facc59sm7445260b3a.123.2025.02.12.06.21.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 06:21:55 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/7] python3: Treat UID/GID overflow as failure
Date: Wed, 12 Feb 2025 06:21:36 -0800
Message-ID: <838f3cff2a123fb7d5833b6760772ded6efb60bd.1739369945.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739369945.git.steve@sakoman.com>
References: <cover.1739369945.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 14:21:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211240

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
Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...e-treat-overflow-in-UID-GID-as-failu.patch | 40 +++++++++++++++++++
 .../python/python3_3.10.16.bb                 |  1 +
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
diff --git a/meta/recipes-devtools/python/python3_3.10.16.bb b/meta/recipes-devtools/python/python3_3.10.16.bb
index 19a85a8770..48f845b089 100644
--- a/meta/recipes-devtools/python/python3_3.10.16.bb
+++ b/meta/recipes-devtools/python/python3_3.10.16.bb
@@ -36,6 +36,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://deterministic_imports.patch \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
            file://0001-test_storlines-skip-due-to-load-variability.patch \
+           file://0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.43.0


