Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03C92C02198
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 15:34:02 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.22203.1739892840214769961
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 07:34:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=Af44aUpr;
 spf=pass (domain: snapchat.com, ip: 209.85.216.46, mailfrom: ecordonnier@snapchat.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2fc4418c0e1so4591843a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 07:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1739892839; x=1740497639; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J60XmprhU/Uw+Cz2N2qXA/tlemTZv9ex86zC5qzaUD0=;
        b=Af44aUprIbUyK+ewg92eaHryGbVQzD4cLJT13DCM4Bv6XIchRh6PxWdxB23G5G67ge
         yMeeHGB/YrGwv6xw93t+8Z26lMlvaMpCZTYawqe8CzhjKxX0XH/ZULNbDjPlobn4Y4iK
         Q+q5n6YzY3v3fnElQ9cbRkYgTFdGdYSL7+L7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739892839; x=1740497639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J60XmprhU/Uw+Cz2N2qXA/tlemTZv9ex86zC5qzaUD0=;
        b=ruxq+6ckw0O7xzNlzBIsF2HDaW+rQep+KeL0BAwNCzrmsmIrkghjh3EAcNSHA9ZbtK
         4uAHkAGQNf8FjROaYyHXag1CqBdy6O7m44rT09JgQCtBlMmmKxUwzSaTnbNvUtRd8nyU
         NcNsQ/WPYo6tnFIGULBjrTiQ9MkQenpPURpMZ83urdhTLFQdVBysmB8P3SC9O9G7V9kZ
         BgrVF5JZTLhNfplddFiG5ordZM2+yDJgzjqoLV8xvQBhUzBVqdgvTZrcU81Md4tChpLm
         G3UVQ//r3SUe43zu213QWqPgbBsgMzWjY9D1jy8yBXeoDWK/MTH8zyokLDF802atgbIU
         1aUQ==
X-Gm-Message-State: AOJu0Ywi4Dyrdef1MCIRYga2SZ6wOpPYedIm2RVW4tuWYq8WN/zaNyIo
	yU+c9Ir5LjQqiYzkZFrJzLdbYFZ5FbYU0Ys80fbmsTdM6Spg5FrwCZ7PP6eoN9L6Jzn+gawcYuu
	LB7c=
X-Gm-Gg: ASbGncv0iYWNgGQji2TWzsOzxfgquaKpFaDku2jJoYQFIN4YpacgdarA6UucVdCb6Yv
	g+NmSb/RvEuWczcNQgUgl8L1pALR0z+Ry643vAH8b4YeQXAF8bKZnHhl6x0fnwRJordWpkTMTun
	C4kjTbNkHM61JAe0Eo2HhjCiQshofESRQJ6a6cYoJAVZdqgzphynRzS0nRf3n/VvDVPUquD8aqK
	Tl1Pvf9j07JgNfbrrPj8eue5w51tPbXUs3SMu9M5dEu4n4EnzVW7AwtMNnIWOyUfucl3bjwDUOk
	Xv+inFsiY4ilsFrjCPsBeBrl84YP
X-Google-Smtp-Source: AGHT+IFU1ae2Dk9oU6fSbDd/gpPL5gPle1Z5xwQbzEd4K3gMHjUAbO71eaveS14zrReokxpya1OEjg==
X-Received: by 2002:a17:90b:2ec7:b0:2ef:ad48:7175 with SMTP id 98e67ed59e1d1-2fcb4d6debdmr201155a91.15.1739892839103;
        Tue, 18 Feb 2025 07:33:59 -0800 (PST)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98d0765sm12236208a91.20.2025.02.18.07.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 07:33:58 -0800 (PST)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>,
	Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][scarthgap] python3-setuptools-scm: respect GIT_CEILING_DIRECTORIES
Date: Tue, 18 Feb 2025 16:33:15 +0100
Message-ID: <20250218153315.340005-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 15:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211631

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
---
 ...0001-respect-GIT_CEILING_DIRECTORIES.patch | 36 +++++++++++++++++++
 .../python/python3-setuptools-scm_8.0.4.bb    |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools-scm/0001-respect-GIT_CEILING_DIRECTORIES.patch

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm/0001-respect-GIT_CEILING_DIRECTORIES.patch b/meta/recipes-devtools/python/python3-setuptools-scm/0001-respect-GIT_CEILING_DIRECTORIES.patch
new file mode 100644
index 00000000000..7d2808cc0ce
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
index 64b5050c3b3..d5f8358a614 100644
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


