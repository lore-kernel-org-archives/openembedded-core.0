Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 581BEC79FA9
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:45:25 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2475.1788641114045279931
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ydhyF6GD;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-484362f5c4aso2712044f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788641112; x=1789245912; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/2Drm4PxIUmfGH73o6ApHVm7gx7ctk51h+EpN6bO1R0=;
        b=ydhyF6GD4cbAh4ay77a+6Cgtrnn1EoWyswo+93GRmHYA+4Go/1WDEAQ1QHWTMfwO5M
         SmJ6T5Eh6RaWjS2lufujiq3GDxAyeTWGbJag8bn0cjaVWhaOk7uo9DTVL2VGKMbLZ0Wl
         7s9s+ztfW1Nj1LCRn4wDNtY2cVcv0PW2oImf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641112; x=1789245912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/2Drm4PxIUmfGH73o6ApHVm7gx7ctk51h+EpN6bO1R0=;
        b=YVwI28kTJX5AcVuLXtaRYWMdncGhxB/zizEouGWXBgfoJBTXPbwVXEXObkQPLCeqn4
         +JJynuage7vjwO/5LGzTwhX7H3VPtsStYJgOX7kkKMQTH2yK8QEms1hvQt/tfYFQJyJf
         KeF/Mt7h5I8+MDOiSEhFxwyWp61/VqlvbK7Iv70ZB9JoOr9XGOcZoV8q3DyR1p6iYtKu
         Pnx9tfZ17+9KPg/rrWkBqWkyr7yUVcEMdiWTYqUBvdPpYXDxYbyEAxJZlITZwF+GN3AX
         HkblCMpxf2q088SeOLh/4NrP4zF3UzZo7q7rjBz5OTOtnm8Kr6vvz38opWY/OR+5Kx0J
         NEBA==
X-Gm-Message-State: AFuF++mdMevoyrofbBfy6k1NlfylIipzcTRAcALHnRBLflMVWmbr/Zfv
	tiCH6o104dlgw1pwCfGKChXhVEF1ZYDloCcJ0jFUcXdKUIvxxrjQQJ3oNfiAWbqnU6Z1S/QcOa3
	Zg3KJD7I=
X-Gm-Gg: AYBFou1nETwYm7nniECZpNgLJb2pS6x72OYI0OwHKf6yzNEwhXBjVjiLsfbmlbuUxyL
	tjDNJ1najikiE2nez8DgsTR3NZmC0WShzKwVd47LUBKlZXsOL93vczMIUJJqqZsTjWVJbHFCtWx
	9HuvWwCFBBAvaEdbruTRUuJWOVudf9l/xC1GqOpALPhlvo/+5fCHkUo2kS84ZUgWziBeMoey3xW
	ijM6O76Y9spQoutPmGC5skLaBrpfh3HGE+s3xOymZrwv9/zk0Y2MacMQ9NO2DkLjOW+WoIREvpB
	wX1GT6ifCgEfgViLzialdyMGPwSJ1GgtBxIbylnPYsv/juKHnclU1jRV9iYQaA1pUfaSiz391/O
	ouSsxI8xymtvLMT9l4udiRA3/ZogTKJfk00BCF/EX+54KswQ5FI3knL9D4E3hHWCJtW+1hLdMz7
	+N5P4sEKRnCG540ghRTrtZH7qHaPo0CHdJ5jr4itdjpVGw/q4VRvMw6dEtQXc9jM6/Wyk6Eke3q
	X72Jzjpk+7eJ+Uv1Dzi4FRDhYhB0rnEzQWEQ/pUuxPboqlkMI3e2uPJBO7cOx4ltA==
X-Received: by 2002:a5d:5f53:0:b0:484:49a9:10e3 with SMTP id ffacd0b85a97d-48586e494e6mr28382209f8f.1.1788641112287;
        Sat, 05 Sep 2026 13:45:12 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17069098f8f.34.2026.09.05.13.45.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:45:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 03/40] python3-git: fix CVE-2026-42284
Date: Sat,  5 Sep 2026 22:44:04 +0200
Message-ID: <0b31060413238a55e49caa932341903cceaf8022.1788629392.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788629392.git.yoann.congal@smile.fr>
References: <cover.1788629392.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:45:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245155

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/c9a26789d88b18f8b4620f37307df2976292d2a0
[2] https://github.com/gitpython-developers/GitPython/security/advisories/GHSA-x2qx-6953-8485

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC:
See https://github.com/gitpython-developers/GitPython/pull/2130#issue-4299717224:
The author links the fix to this advisory/CVE.
]
---
 .../python/python3-git/CVE-2026-42284.patch   | 36 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  2 ++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-42284.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-42284.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-42284.patch
new file mode 100644
index 00000000000..3e5b9908a78
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-42284.patch
@@ -0,0 +1,36 @@
+From 01d579e1b0a3e78cf82695b84967d0c343cfdd0f Mon Sep 17 00:00:00 2001
+From: "GPT 5.4" <codex@openai.com>
+Date: Tue, 21 Apr 2026 09:30:29 +0800
+Subject: [PATCH] Make sure that multi-options are checked after splitting them
+ with `shlex`
+
+CVE: CVE-2026-42284
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/c9a26789d88b18f8b4620f37307df2976292d2a0]
+
+Backport Changes:
+- Omitted test/test_clone.py and test/test_submodule.py because the
+  PyPI 3.1.43 source used by the recipe does not ship the upstream
+  test tree.
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit c9a26789d88b18f8b4620f37307df2976292d2a0)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ git/repo/base.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/git/repo/base.py b/git/repo/base.py
+index 51ea7690..8059fceb 100644
+--- a/git/repo/base.py
++++ b/git/repo/base.py
+@@ -1365,8 +1365,8 @@ class Repo:
+             Git.check_unsafe_protocols(str(url))
+         if not allow_unsafe_options:
+             Git.check_unsafe_options(options=list(kwargs.keys()), unsafe_options=cls.unsafe_git_clone_options)
+-        if not allow_unsafe_options and multi_options:
+-            Git.check_unsafe_options(options=multi_options, unsafe_options=cls.unsafe_git_clone_options)
++        if not allow_unsafe_options and multi:
++            Git.check_unsafe_options(options=multi, unsafe_options=cls.unsafe_git_clone_options)
+ 
+         proc = git.clone(
+             multi,
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 45c988117bd..bfbdd802893 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -12,6 +12,8 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi python_setuptools_build_meta
 
+SRC_URI += "file://CVE-2026-42284.patch \
+           "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
 DEPENDS += " python3-gitdb"

