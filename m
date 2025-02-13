Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C052C021A0
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 16:32:26 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.500.1739464342497845421
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 08:32:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=aG2wQR2g;
 spf=pass (domain: snapchat.com, ip: 209.85.221.51, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38dd91c313bso629366f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 08:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1739464341; x=1740069141; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g56hKV21oApe5vYBP4VhJT+IFqZruut4PNLY1m6eYHc=;
        b=aG2wQR2giU5oiMxRA6JO43Q8jQ9JhXenCXWgQLoHcDAiK+1ucIY7wpSsTfWGHdzdn5
         vbW5TqdgdYD95Y3lqoSwA7VHoMvOECvbdGoVzBVnCYb8bwegN0U4YnpGRSbR7CWQT6kW
         8BQjW5TaOqzmsAPbcOi1cSZUxw8Gd10pbvt8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739464341; x=1740069141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g56hKV21oApe5vYBP4VhJT+IFqZruut4PNLY1m6eYHc=;
        b=qc71B1NpFNQ/Rar38NruzSN1iAAF6lV97NH/U0kAh+fFf2jhCK4FvD0Zvfv7K3HUXr
         c5L7IRC1CbEw8F9cM/cdage8+GciwIGgIDDERz8wYd0KvLe+ljuw7o+LFIU7AVyVPzfh
         d7/Q9BQyRyvUF0b9/6rnJs6KI4wgzKC2lbnQoUvSg2MbLrn8PYcaIkMlhV7woyojf4/u
         BLj7fhwaLEhaEPcCl3FMuPw8H19iR4S64etGCpalr8kQXsyghLNJPKTzDDWjRH8mWuCs
         w27LzOrLiWEH5wxo1PoVLtW9cVaEUL1lY+Y8lkywKb1DfnPXuXv3ENx5k4+yfR81OMlK
         T+1w==
X-Gm-Message-State: AOJu0YxHELoKAXOqt80nXnLwEgTjKK7zfN2wgJRKA8t5shvS+WHpPo9Z
	1lciDHpNOz3Hox5+ejkFb2EAv0tEbKgFSJM4CmXOaJxobhwIYOp/Y9fmQwXvfAvFYlX1XRkPOe9
	S
X-Gm-Gg: ASbGncuCpUlJd24oGsvjrEyzGKU9y/6v4T9eOBJuHWUIlvO5BGlV6nyDN90+xl9dOWA
	iqojX0YexcJY5t6qbpTpABqofgN0lAtkd+NGVkqtz9qsmnthLfos9jYO8ez9kxHB3lbcAxfbIB5
	t61w5nLsR3yGaYB3h610NK+gh9KeYCXggXg7jzCPxyRFnSvprq5HRpf0sxUOk3FF9mRdUvNwo17
	Rgp6If7GkUdNJPP4ckpaC8FHzrweRNmcUHVptnbpMiJcx5XeyGSlWVNfjRt5K3On4kZGLKs/O3g
	6hO2rkPmmR4xTsYdm1j947Sbk7I=
X-Google-Smtp-Source: AGHT+IHpyfoPjVCo97612YixZ5gy0RBkyq1kxj6fNw4EiKGxBg5TNzFLP8ZSrBl5GFTKa7Y7d+Du+A==
X-Received: by 2002:a05:6000:18ae:b0:38f:23bc:c19e with SMTP id ffacd0b85a97d-38f23bcc233mr5582739f8f.29.1739464340479;
        Thu, 13 Feb 2025 08:32:20 -0800 (PST)
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f25913eb6sm2333639f8f.51.2025.02.13.08.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 08:32:20 -0800 (PST)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH] python3-setuptools-scm: respect GIT_CEILING_DIRECTORIES
Date: Thu, 13 Feb 2025 17:32:10 +0100
Message-ID: <20250213163210.2827959-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 16:32:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211357

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

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...0001-respect-GIT_CEILING_DIRECTORIES.patch | 36 +++++++++++++++++++
 .../python/python3-setuptools-scm_8.1.0.bb    |  1 +
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
diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_8.1.0.bb b/meta/recipes-devtools/python/python3-setuptools-scm_8.1.0.bb
index 4bcc8e438ad..14913ff958e 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_8.1.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_8.1.0.bb
@@ -6,6 +6,7 @@ argument or in a SCM managed file."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
 
+SRC_URI += "file://0001-respect-GIT_CEILING_DIRECTORIES.patch"
 SRC_URI[sha256sum] = "42dea1b65771cba93b7a515d65a65d8246e560768a66b9106a592c8e7f26c8a7"
 
 PYPI_PACKAGE = "setuptools_scm"
-- 
2.43.0


