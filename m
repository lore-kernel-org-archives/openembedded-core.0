Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 337BFC25B10
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 02:47:02 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web11.2685.1715050017871584303
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 19:46:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mMWGe9C5;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5b203c9933dso1410965eaf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 19:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715050017; x=1715654817; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AHwfW8a9Q0K6Uwboh5FsGGyiAELxzd3MEuxpEUVDUsQ=;
        b=mMWGe9C5kJULQjtvu3W7vTN/r6Vi0ce+bbFoMi2FCC7k7m4DiN/D+jceXwTB9BJV9K
         QXUGg32xR43NwlOfysQijzRoQck53ETKSQI2/NRV3z2FNVbi8L2BKz6HfPQ6z2XvOqTa
         ezCAI2vSsjnuNyUG2U2nnz5CEPSEKChVZ7sZqkMVE2tWUCQHKY2oXqkPb9DTmiLz7RZu
         BLEPpy2lNi37LsAntmvzu+3FjoCitfjT89QtPtuLJhQSpQomGLhndiN1PUzo91bojYxW
         7F5qNuL9BQ2Zv7qeDlRh/9mwyGSbnbUsDCnb+syvUu4sV9PfKyInHN8WoFMOTcd9sw4i
         JH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715050017; x=1715654817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AHwfW8a9Q0K6Uwboh5FsGGyiAELxzd3MEuxpEUVDUsQ=;
        b=ehn34t2CZb7wbWlt5kTZiEsAAG3nhyg/DO4W0jVnRSlgsUsSNMggyPkfboDxLJuV+a
         OG/3jqDCc6WNzbRC/7aoktxJb1xYcKG9uCFRZDKDDyVxk2zmp02uBpeCzGSwx4yKukEt
         ptNVjSd/yKPgLPROH7kJKHJ4Q3ReLoul2JQp0Jc/JVe8hCgR6axUyUKx4LhRaz8SX8eB
         6PGyAaFWCG/nXoAZ9klxbchH7x0qHl1PJklFnGKmQ286ev+Kjexxg0knXpQMqV1T88qM
         RH4qLITubSKPbeZ82h7lgTQZ1IEe2K8VbGL7/B1ADZqR1YseXZYdrUNxkxpuk6hSfVov
         O8aQ==
X-Gm-Message-State: AOJu0YzycjeSK3CqsFWJj1eO67ZYPUvTDQO+m4WlcpJwGjxJCRPyub8R
	KQr1Jq/YPyarlUdSEuK00OOt5TJxi2+8SsBrmWEx5eLAFbOHiJ2qmu8dO6Y6
X-Google-Smtp-Source: AGHT+IGr3KZa1iGupZAmwy3GA32YCebERBYywoEA56t8l3hgJUr3Yr3dON91LxdlEjMzPR4U/2UFVA==
X-Received: by 2002:a05:6870:7188:b0:23c:550:ca37 with SMTP id d8-20020a056870718800b0023c0550ca37mr14599458oah.42.1715050016776;
        Mon, 06 May 2024 19:46:56 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::cf93])
        by smtp.gmail.com with ESMTPSA id f2-20020aa79d82000000b006f44cb3dc33sm6590176pfq.65.2024.05.06.19.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 19:46:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] python3: Treat UID/GID overflow at failure
Date: Mon,  6 May 2024 19:46:53 -0700
Message-ID: <20240507024653.2782423-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 02:47:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199064

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
index 04558a64634..1a056d29f78 100644
--- a/meta/recipes-devtools/python/python3_3.12.3.bb
+++ b/meta/recipes-devtools/python/python3_3.12.3.bb
@@ -30,6 +30,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-skip-no_stdout_fileno-test-due-to-load-variability.patch \
            file://0001-test_storlines-skip-due-to-load-variability.patch \
            file://0001-gh-114492-Initialize-struct-termios-before-calling-t.patch \
+           file://0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.45.0


