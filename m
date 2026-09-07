Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21695C79FB9
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 13:36:06 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34937.1788788165189434682
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 06:36:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=23/wrBE8;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so4042371f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788788163; x=1789392963; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0lZQ55LlAcjideiuuCoHKNsjNUJqE7a6d11RPmcQT4Q=;
        b=23/wrBE8ILFZbMi/RR0bwXLzrzKqeFYJkJARIYpXHufLMd8g4J293hOKMw/MnQJ9O4
         TZBaAQiJyiXRbvb3HMKXCL/DUlT6CzFCKDyTeF/sEgxvvNMcQX6Z2+Y9YSxMyYZ1MSbH
         LI+9cEfaNNo1zcGeqhJuAUJSYH3QNA/ovPKN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788163; x=1789392963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0lZQ55LlAcjideiuuCoHKNsjNUJqE7a6d11RPmcQT4Q=;
        b=qnAd9qaGi43pjU8ijxMFaKGbOllo5ymOVQWOUV/rwJaDtd48id9TZsn1wf5csULDtT
         F1SEzrbhSXzw4jOHursZBeQOBtLqIE7RyJNvuf7TsVBaAIEz6ETyqbdGAaJAY6nv3wCo
         HSSTnpIQYPpyyPIHjwvuG2uTm00+I0hPiQPapWGPH/oV9H4Ntd3hInzGGWAa2be4yitV
         k6BfzonmFfAHQz/lkViX4vI+1vS8FKDJVX0OdTMN/jOcjtvX/Pj/UNP/qI3kahVQBwfc
         Tt9xaya5LvzwVLhOaAm2zgaZc2ep35K7wmmlvq7jfsQy9usNmB7zh4GYZaTnew2SDmCw
         3fOw==
X-Gm-Message-State: AFuF++lOFDljZP1GHM11bN9R3yYEK85nLTR6RcRRSYs6u6UwgiTZVpyx
	60ie+7kaZCzTK3b5w1lJQGjcCSxAx04cRf3PcxnLYDJTkYLjSI26E7B7wm6dfs5XhOsicUqJw0m
	OUPBDBm0=
X-Gm-Gg: AYBFou2buIMKusnY/Tk9zjXXqaH4ajUPmW88jDu3C81+CRFEWwOPAx6mOcL5gOgQNnJ
	reFO1nXOHaC46KtPyRKRfSoxzZTTOz7duTWxWB8/agfVlWZB7mYAhiHXKWVwr89GjpVzKL1YsAo
	rMDr0NBwj+jKDnU5i/IO3vZLkulTA8t4OSLSfPajL52oFG0Tp69rmMFAcTg9DbRbpuLbXzw/9u/
	89tOAMaLsJsEP5zEYTM6BB3IFKZI7UKOtt0DZowfkuxuQFuWe/2R+nHZp05+WLz7qFRpFHTSRJB
	lcrxxL6cX4sXQtHkxMswbQ6AgqddNfqPDpw9N8hdkV/TTTqQSb7RJKBgWLIbpSsVqgjwli8qY6r
	Mkk3nwYRgtAL4bOMFtFVBxn5K2xA4M+8ij6TB5tUSyHjm4KmnFdRG1OM4Ck1vALF3ddK8ExeVnL
	4E18G0IPHNxBp/ag3Ww7Iz3ha29s9pUewsf8jbwJyDfkKLpDS0ahOPIxu8R/4FOmHL1MPX0eIlN
	AX0W+fRWALxZpgiJzXCBN6H9nGagggLWnVkMuDhQ3RxgYb0JoBkc72/3md8We7a
X-Received: by 2002:a05:6000:644:b0:485:847f:fd89 with SMTP id ffacd0b85a97d-485870506d0mr26219195f8f.9.1788788163428;
        Mon, 07 Sep 2026 06:36:03 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm27523836f8f.8.2026.09.07.06.36.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:36:03 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 23/35] python3-git: fix CVE-2026-42284
Date: Mon,  7 Sep 2026 15:35:19 +0200
Message-ID: <1582c80d83558b9f1e9c3137bd79ec3f0a5c643c.1788787321.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788787321.git.yoann.congal@smile.fr>
References: <cover.1788787321.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 13:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245281

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream 3.1.47 backport for
CVE-2026-42284. The upstream fix merge is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/gitpython-developers/GitPython/commit/da545232d0401fb9fb7660f9ff67991996674dda
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-42284

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC:
See https://github.com/gitpython-developers/GitPython/pull/2130#issue-4299717224:
The author links the fix to this advisory/CVE.
]
---
 .../python/python3-git/CVE-2026-42284.patch   | 37 +++++++++++++++++++
 .../python/python3-git_3.1.42.bb              |  2 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-42284.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-42284.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-42284.patch
new file mode 100644
index 00000000000..456a455e53d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-42284.patch
@@ -0,0 +1,37 @@
+From dc3885fd7b4cee9ce4bf04d120e63ea00d905431 Mon Sep 17 00:00:00 2001
+From: "GPT 5.4" <codex@openai.com>
+Date: Tue, 21 Apr 2026 09:30:29 +0800
+Subject: [PATCH] Make sure that multi-options are checked after splitting them
+ with `shlex`
+
+CVE: CVE-2026-42284
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/c9a26789d88b18f8b4620f37307df2976292d2a0]
+
+Backport Changes:
+- Omit regression tests because the Scarthgap PyPI source
+  archive does not include the upstream test suite.
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit c9a26789d88b18f8b4620f37307df2976292d2a0)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ git/repo/base.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/git/repo/base.py b/git/repo/base.py
+index f5069dbf..92ace3a0 100644
+--- a/git/repo/base.py
++++ b/git/repo/base.py
+@@ -1271,8 +1271,8 @@ class Repo:
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
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.42.bb
index 19885a58c74..c294b23112e 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.42.bb
@@ -12,6 +12,8 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi python_setuptools_build_meta
 
+SRC_URI += "file://CVE-2026-42284.patch \
+           "
 SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
 
 DEPENDS += " python3-gitdb"

