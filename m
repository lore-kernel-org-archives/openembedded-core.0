Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C79FC021BE
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 02:54:57 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.2691.1740538488390451672
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 18:54:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Klwv0UF9;
 spf=pass (domain: baylibre.com, ip: 209.85.219.47, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6dd15d03eacso4764606d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 18:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740538487; x=1741143287; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qTbLEVMPodDMPWzpbzNIU6znYTLW3eJ0HAIrBNdIQoo=;
        b=Klwv0UF9AbFcL9qfKEI39RGGQmDJBGE7B8h3Qkpysk0ipIsv4x02yltNOAmDB5p/Zq
         dyw1DFedfDXHbOSE9PZhZUYIAtWucdqM9GYpQsFfpGjkb0j9h73Q9CJ4M633MDDLyg/w
         sAex71bWuWIfwUFCngC+XqKX2r3ccWm6kJJIUCMaY96lrIyZUNqfi5x/g13R1M/SRQZ2
         /+4SWI41iLYNvWiEurvzZPMM3IhOtAPsTW0HHfH1ClgHwaLI0CCFLnNn7Lhd8zMPfEJf
         NRPo85FzbfxN2Wp+PudkDjhjI+PJYQe0wqS/7If3lc76s74pT59UwGTdYrdzr//VurrB
         pDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740538487; x=1741143287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTbLEVMPodDMPWzpbzNIU6znYTLW3eJ0HAIrBNdIQoo=;
        b=cClJo3tT5NF+E05OMW402PP0cYcknmRU/lInwcKhZ1l9Gq3/pKgZzx6GbAnSVFMmCf
         rR+y7DNWo9g6P7GFCShU4nfMX/EDOFBMNMoDvqF+uWV+zj93V2fJ3kgkwfDhe95L9mbK
         NiGpCuL4A3pwRy/8fBUB/1asKijhBaubM9pCZxK2NzhbZsROWodEQcOeFm2s3QPRp7wm
         iCG+dLQjBC++muESKKX29On44vtAarw6sLvKPj93C8OyUGIAl73j03MLLkensv9Gn3Cw
         Fx5hYMU9MNLXYeHyh+mkyOp8GTvDMojXfJ0u4q8SVTrsSMc1js1yF3/ciprCY/JarxS9
         LpBQ==
X-Gm-Message-State: AOJu0YybyGLTS+XzjmQvCIluZ0lpY7uuMcdrXM/f6w9OL4y1m/2OT3wx
	0T+BIf2xoQIQ6kwEV7So2wlcKZqd81fXAqvEKGW9AKPT3FYP8Xr2Pdllkhrn5jdJQr6v1j6Z45e
	R
X-Gm-Gg: ASbGncsNEL7ka80847rFoKNsDH8Q8wP3pXubHYUREL/nRRpATx2/WcLPpzLGREaeCyT
	nwRx9bkNfhEZN1Eq/T60NOmr5L1HKM+4XnfT/LazR4dOvfW3T+zpof5QHEzRq1hLtjVUmQBT266
	wFzNGw92TgKtFAortWpYGsSRe8+Q6KKI/dbVCBPUISKPVVzj4b790FSMBsSO+preXJoRURsuZ7H
	BOSrgiw+sPMabqViQ1Z5sQHx+dGgRUpvJyUFF23dFVWBosvW8XW5N2L1ktLPdY/pdXwpYW2qslx
	tkEbrKo04LGjbuCze8hxzQozcf2kt8CEv76AJMIFBpDmvuCFXZn5Q12TNt8New==
X-Google-Smtp-Source: AGHT+IGishgfuoQYYed3HXzQ+UB7UH3FXeKH0qCdn11FZg7pnQ9SMgBL1U2aY1NM798UE3HrNsTqEw==
X-Received: by 2002:a05:6214:2401:b0:6e6:9b86:85d0 with SMTP id 6a1803df08f44-6e6a259c330mr323574386d6.8.1740538486896;
        Tue, 25 Feb 2025 18:54:46 -0800 (PST)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e87b06dc57sm16998036d6.15.2025.02.25.18.54.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 18:54:45 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 3/3] python3-setuptools-scm: upgrade 8.1.0 -> 8.2.0
Date: Tue, 25 Feb 2025 21:54:37 -0500
Message-Id: <20250226025437.2042320-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250226025437.2042320-1-tgamblin@baylibre.com>
References: <20250226025437.2042320-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 02:54:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211941

Patch '0001-respect-GIT_CEILING_DIRECTORIES.patch' is no longer required
as it's upstream in 979d79301da6.

Changelog (https://github.com/pypa/setuptools-scm/blob/main/CHANGELOG.md):

Added
    - fix #960: add a --force-write-version-files flag for the cli

Changed
    - fix #950: ensure to pass encodings to io usage
    - fix #957: add subprocess timeout control env var
    - add sp-repo-review pre-commit hook

Fixed
    - fix #1018: allow non-normalized versions for semver
    - fix #1103: respect GIT_CEILING_DIRECTORIES when trying to find git toplevels
    - fix #1081: add name normalized pipx entrypoint
    - fix #1080: clean pdm from PYTHONPATH to protect mercurial

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...0001-respect-GIT_CEILING_DIRECTORIES.patch | 36 -------------------
 ...1.0.bb => python3-setuptools-scm_8.2.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 38 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-setuptools-scm/0001-respect-GIT_CEILING_DIRECTORIES.patch
 rename meta/recipes-devtools/python/{python3-setuptools-scm_8.1.0.bb => python3-setuptools-scm_8.2.0.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm/0001-respect-GIT_CEILING_DIRECTORIES.patch b/meta/recipes-devtools/python/python3-setuptools-scm/0001-respect-GIT_CEILING_DIRECTORIES.patch
deleted file mode 100644
index 7d2808cc0ce..00000000000
--- a/meta/recipes-devtools/python/python3-setuptools-scm/0001-respect-GIT_CEILING_DIRECTORIES.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From a1cc419a118560d63e1ab8838c256a3622185750 Mon Sep 17 00:00:00 2001
-From: Etienne Cordonnier <ecordonnier@snap.com>
-Date: Thu, 13 Feb 2025 15:44:40 +0100
-Subject: [PATCH] respect GIT_CEILING_DIRECTORIES
-
-Fix for https://github.com/pypa/setuptools-scm/issues/1103
-
-When searching for the root-directory of the git repository e.g. with git rev-parse --show-toplevel,
-git stops the search when reaching $GIT_CEILING_DIRECTORIES. By ignoring this variable, the function
-_git_toplevel can go above the real git repository (e.g. when packaging a tarball without .git repository),
-and then runs "git archive" on an unrelated git repository.
-
-Upstream-Status: Pending
-
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
----
- src/setuptools_scm/_run_cmd.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/setuptools_scm/_run_cmd.py b/src/setuptools_scm/_run_cmd.py
-index f2a8285..7e13d9f 100644
---- a/src/setuptools_scm/_run_cmd.py
-+++ b/src/setuptools_scm/_run_cmd.py
-@@ -98,7 +98,7 @@ def no_git_env(env: Mapping[str, str]) -> dict[str, str]:
-         k: v
-         for k, v in env.items()
-         if not k.startswith("GIT_")
--        or k in ("GIT_EXEC_PATH", "GIT_SSH", "GIT_SSH_COMMAND")
-+        or k in ("GIT_CEILING_DIRECTORIES", "GIT_EXEC_PATH", "GIT_SSH", "GIT_SSH_COMMAND")
-     }
- 
- 
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_8.1.0.bb b/meta/recipes-devtools/python/python3-setuptools-scm_8.2.0.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-setuptools-scm_8.1.0.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_8.2.0.bb
index 14913ff958e..ecb79afe47b 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_8.1.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_8.2.0.bb
@@ -6,8 +6,7 @@ argument or in a SCM managed file."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
 
-SRC_URI += "file://0001-respect-GIT_CEILING_DIRECTORIES.patch"
-SRC_URI[sha256sum] = "42dea1b65771cba93b7a515d65a65d8246e560768a66b9106a592c8e7f26c8a7"
+SRC_URI[sha256sum] = "a18396a1bc0219c974d1a74612b11f9dce0d5bd8b1dc55c65f6ac7fd609e8c28"
 
 PYPI_PACKAGE = "setuptools_scm"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.39.5


