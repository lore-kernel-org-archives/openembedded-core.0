Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC8D1C04FFE
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 01:30:56 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.11.1715218252358999387
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 May 2024 18:30:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CBgqGvPo;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-53fa455cd94so301050a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 May 2024 18:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715218251; x=1715823051; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TBOp6RWOEOt2ptt6RZbOi15dpuHcI0yKw4Cb7SNiNI4=;
        b=CBgqGvPoDs7+pTKDljmUH4In01cdeMOG3oHXc184vOrlHR5v4YZ3O4VwYdRtMwHAaP
         cG/ROffW/ia9NsjvCLHkD+VFkH0/B8X3ztGEPnjU0hECVcFO3WbMmGMUUXCPMEsp77K3
         KutpgPJ/dJikv06qzih9Kn9aiLBTnHH1wM5EXLKP9LLBSaUJyL0CMfUZnRd4EEh/bi5U
         ssYTFwZDnAI1kNoHliaWGTzJc3+NZnJHY6V8GxDmEhuAMls7ujIL6+bxVJWKeyMQQ/J7
         3AarnTA6ECoRijMRO0Kj8/jDgSjniOwa26VIU0HBv95HOuh+g8yaulmjT6eA4cF95R1c
         jXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715218251; x=1715823051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TBOp6RWOEOt2ptt6RZbOi15dpuHcI0yKw4Cb7SNiNI4=;
        b=cJaHMsu70cPdL7BvZqoKQ8PpikgN7ELx9LRHlBr5mGsZG3t9kY9xDhwj1S1OeZ5AzL
         fydpX1q1uxMyAZirC5p8uqnkjbRYvHfSKPZNiSJ4a8Am2/k2vzXf5SYqPW5JsUIA8ubJ
         ervVWCfgBUe8/VjjT9HnOSFN6Ljw0BLlV9FaX1i0JOVdAhhrkpoLUX4R1H04h/DgChxR
         zQ7sTmIRaAWVyby8QoCq70WaPUIrtv5onbtEXP9Qc+TpYcw3v5zw37A/+9qIc760sUxV
         ApsdouX6fYAu8N76Irv0HVTwsABFBjRiuuZuLwcgmqpRHV9heF/u1o7fng0BsSv0Fxhb
         1Gkw==
X-Gm-Message-State: AOJu0Yw/WJpvoa0UCd2XX8YSrONaABjIeg4qnV76hRDd252P/RGrH8Z/
	EseOY/pXPiaBU6E5HOVQmwlTmyrm6zAQRhjbIr6jvCDwX4Mz+cq2VpwR+/yk
X-Google-Smtp-Source: AGHT+IHylgz2ceFczXehh2NNDYf71jCPKLhOdJKirMJ3BkKMW7Pjoe8Zivwrc614xojMXXcUeFTsqw==
X-Received: by 2002:a17:90b:4d89:b0:2b5:af18:4222 with SMTP id 98e67ed59e1d1-2b616c00d4bmr4077625a91.44.1715218251490;
        Wed, 08 May 2024 18:30:51 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::af2d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b67158de4dsm244558a91.42.2024.05.08.18.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 18:30:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH V2 1/4] python3: Treat UID/GID overflow as failure
Date: Wed,  8 May 2024 18:30:46 -0700
Message-ID: <20240509013049.523093-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 01:30:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199132

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
---
v2: Fix typo in subject

 ...e-treat-overflow-in-UID-GID-as-failu.patch | 40 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.12.3.bb |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch

diff --git a/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch b/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
new file mode 100644
index 00000000000..88b84c60243
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
diff --git a/meta/recipes-devtools/python/python3_3.12.3.bb b/meta/recipes-devtools/python/python3_3.12.3.bb
index 93709b207ce..37afa442fa3 100644
--- a/meta/recipes-devtools/python/python3_3.12.3.bb
+++ b/meta/recipes-devtools/python/python3_3.12.3.bb
@@ -31,6 +31,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-test_storlines-skip-due-to-load-variability.patch \
            file://0001-gh-114492-Initialize-struct-termios-before-calling-t.patch \
            file://0001-test_shutdown-skip-problematic-test.patch \
+           file://0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.45.0


