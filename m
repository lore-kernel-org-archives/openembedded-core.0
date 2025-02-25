Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E881C021BB
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 20:57:00 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.19955.1740517014510856102
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 12:56:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=T+VvEGmg;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2fc0d44a876so9803721a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 12:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740517014; x=1741121814; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wvbSCe2L5kUPTC0lizulI7BdQzfxN2N1R6ruUolD1uk=;
        b=T+VvEGmgz2yVydjFtUzRQF2uz+GSqDoxIQ4Gu650WEOFot+31tpT/EReS2uP1+HiZU
         cso2E8ev6GEX5uEJtD0dCbqdZKtkSC1pSrZSdUk7CDvZ/gSTqVjf5qEC5uqGgA4BXpZB
         4A70JhT7hKbNGGenQkPZiEASdPOrmhDPfetjx8V5VJdfYw+lIdslLhdYSO3O2YeNITQV
         XlI2MHscOc8f5D1KZd5ayT1enCL4Imz1DKwNK00NugV+ckwbSTIHHGtq0SL3U6mB178v
         wIELMnAEDgDDUqC/i3PXB95+NHtMlT4aVKVSEZ/mZprehRGqLCcuAI6Pvlc7RpC5ZXy4
         1C1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740517014; x=1741121814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wvbSCe2L5kUPTC0lizulI7BdQzfxN2N1R6ruUolD1uk=;
        b=HiB/EAHPLj3oXIAGmj6HErDLLtTXQ+2gRCn6HWi93zNPtN2GTzGaorkAIqvfcK2m5g
         TxneuibNpULlwUJu0+FP7fnjrY3Lr03OZIWouIxURWx3l4rh3ss56YqT2fW9oa0gnYEg
         060Ob/L6ht+7zVgpavCkOzDrSukjLbIL3tykM7aBO6NhhLBfhpJMoNEFtWuOCCnZJ0Do
         pufk3vQK7PMyxmuN6f0ggaHgB1wEtblcWwPA4Id1EdYCYo7YlybnhZQaUIf4+nwlp3yz
         3EEr/VinAS4sJlNt/cF4/UK7KK1RaMEI3HVwlKGENRmD3c2om1uNt/TVNpea1cfLydde
         l8/Q==
X-Gm-Message-State: AOJu0YyAT9p2wFiWbAc5J7wcjEKuCZS0wevhas7xsXjb65mi5ZDPhhTC
	JeabkjFO+q/GAzEwytDwzrgTQysotnuaV1yCftTT89F6fORls5JQEd3Z8XmCSlp0UaJQkNsGHDX
	e
X-Gm-Gg: ASbGncvJz3jJRmohsCfvTAIQldlZcdkYEz7824qRLQjLgy+vfB4NZgaKSTDWEvRsoe0
	2XwJE0i6KZLSJGfI2BNJUrS3NPJmJRv4AAMTef/9dSKHLErNBXAaDZtK8wfcBDAyYJHTFUArSGE
	c+6R4qv4cdV691t0n8+XQVy1rhUp2Jho8USjjaC9MUYPWOqGvS10AG3IK305FfUeI3uobxrwPjf
	odhAPEyFDRbuPDewV1+YmBAGbJD+pSNqKUh+rUb/ELTYF5CapKhSiciqw4iw1GEi/k8Feyr/jzS
	9IeON2UfkHavhrOkfA==
X-Google-Smtp-Source: AGHT+IG9sxv0WMOnCUfxeeUvCp4YMd18LJqoLOYqVX/t/B+dQPf7XmT14Tz6Bp4WCJYkb4kzdgKGrA==
X-Received: by 2002:a17:90b:2e10:b0:2fa:1f1b:3db2 with SMTP id 98e67ed59e1d1-2fe68bff7c6mr7488200a91.25.1740517013554;
        Tue, 25 Feb 2025 12:56:53 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:c473:2777:3793:104c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb02d9b4sm10083810a91.6.2025.02.25.12.56.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:56:53 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/10] python3-setuptools-scm: respect GIT_CEILING_DIRECTORIES
Date: Tue, 25 Feb 2025 12:56:33 -0800
Message-ID: <369eebad4f38c3641be73dbc0490c87636e0912d.1740516861.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740516861.git.steve@sakoman.com>
References: <cover.1740516861.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 20:57:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211934

From: Etienne Cordonnier <ecordonnier@snap.com>

Fixes https://bugzilla.yoctoproject.org/show_bug.cgi?id=15740

python3-setuptools-scm was ignoring GIT_CEILING_DIRECTORIES which is set by poky,
and it was thus finding a wrong value of "toplevel" in ./src/setuptools_scm/_file_finders/git.py
The code is supposed to generate the list of files contained in python3-setuptools-scm, but it was
instead running "git archive" on whatever git repository was above the build directory, because the
tarball containing the sources of python3-setuptools-scm does not contain a .git directory.

This is barely noticeable when building as a subdirectory of poky which is only 48MB, but this was
causing serious slowdowns of python3-setuptools-scm:do_compile when building
inside a big git repository with files tracked using git-lfs (50 minutes in my use-case).

Reported upstream as https://github.com/pypa/setuptools-scm/issues/1103

(From OE-Core rev: 4ebe72477484cf68165b6f736ce10373e97d0e6d)

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...0001-respect-GIT_CEILING_DIRECTORIES.patch | 36 +++++++++++++++++++
 .../python/python3-setuptools-scm_8.0.4.bb    |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools-scm/0001-respect-GIT_CEILING_DIRECTORIES.patch

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm/0001-respect-GIT_CEILING_DIRECTORIES.patch b/meta/recipes-devtools/python/python3-setuptools-scm/0001-respect-GIT_CEILING_DIRECTORIES.patch
new file mode 100644
index 0000000000..7d2808cc0c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools-scm/0001-respect-GIT_CEILING_DIRECTORIES.patch
@@ -0,0 +1,36 @@
+From a1cc419a118560d63e1ab8838c256a3622185750 Mon Sep 17 00:00:00 2001
+From: Etienne Cordonnier <ecordonnier@snap.com>
+Date: Thu, 13 Feb 2025 15:44:40 +0100
+Subject: [PATCH] respect GIT_CEILING_DIRECTORIES
+
+Fix for https://github.com/pypa/setuptools-scm/issues/1103
+
+When searching for the root-directory of the git repository e.g. with git rev-parse --show-toplevel,
+git stops the search when reaching $GIT_CEILING_DIRECTORIES. By ignoring this variable, the function
+_git_toplevel can go above the real git repository (e.g. when packaging a tarball without .git repository),
+and then runs "git archive" on an unrelated git repository.
+
+Upstream-Status: Pending
+
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
+---
+ src/setuptools_scm/_run_cmd.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/setuptools_scm/_run_cmd.py b/src/setuptools_scm/_run_cmd.py
+index f2a8285..7e13d9f 100644
+--- a/src/setuptools_scm/_run_cmd.py
++++ b/src/setuptools_scm/_run_cmd.py
+@@ -98,7 +98,7 @@ def no_git_env(env: Mapping[str, str]) -> dict[str, str]:
+         k: v
+         for k, v in env.items()
+         if not k.startswith("GIT_")
+-        or k in ("GIT_EXEC_PATH", "GIT_SSH", "GIT_SSH_COMMAND")
++        or k in ("GIT_CEILING_DIRECTORIES", "GIT_EXEC_PATH", "GIT_SSH", "GIT_SSH_COMMAND")
+     }
+ 
+ 
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_8.0.4.bb b/meta/recipes-devtools/python/python3-setuptools-scm_8.0.4.bb
index 64b5050c3b..d5f8358a61 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_8.0.4.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_8.0.4.bb
@@ -6,6 +6,7 @@ argument or in a SCM managed file."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
 
+SRC_URI += "file://0001-respect-GIT_CEILING_DIRECTORIES.patch"
 SRC_URI[sha256sum] = "b5f43ff6800669595193fd09891564ee9d1d7dcb196cab4b2506d53a2e1c95c7"
 
 inherit pypi python_setuptools_build_meta
-- 
2.43.0


