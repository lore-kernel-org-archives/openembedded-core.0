Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0513EEEF31C
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 08:55:51 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40179.1772700948147683185
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 00:55:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=V72pmVOZ;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4806bf39419so64136195e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 00:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772700946; x=1773305746; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1bLPa5jY4pi+3Y6AVIFMHps4m5gKi3qzllo2uEN40RU=;
        b=V72pmVOZmapO4Ui6ZQAArap//iB36kby3fd63Lrwf+CdVjnEhVrXdXWRhsuoF83AmN
         ivYpLrfWPuwz2zbnA25lPlijiFpzuija6l+sULrm5hm4uhDNUBg/0Dw6lMmWmbxYKFN8
         8tdHWP855jidkxJb/jzZ/rv9XXG+imjnaeCSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772700946; x=1773305746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1bLPa5jY4pi+3Y6AVIFMHps4m5gKi3qzllo2uEN40RU=;
        b=NyYs/ycznEuN3sIui6npPtnGkh/paQi4jgx0Xb1PRWB594zN0VhvlolxRBSZj6sHND
         Up0i9gP/mJZ6FzoXtz3mGwOOelSRJEZrWuoHkNBUFw9or19toeP7fbVLr2rXSBpOK0dZ
         xgrTpaEXot7JtPBHk9Xi3MvKGziKXLqFhLLITbuWWjxroJh+P7tKST/gcEPmNg9/tiHB
         JRnqZ04mfMMRumcplLssfuOr/qyoKzpeS/6DcYcUzsv39RUKMn4wAU6E8Kpsa91/Uy5s
         JDtR64JLds/bsYDLVvWM0cYzMC5YfdloTDM0OSUjJDRqlFqndWP/zgW916DZNlMJwAKQ
         zwMw==
X-Gm-Message-State: AOJu0YzGJyltaaBxxhFd/UVw/RUfTuTxja6ze74VnezMamcJEomtdWhi
	5v2cnSguOLpeaGbQ3wkxhXzHmp+Du+vtH7hj9NysrjaDXtjK1EaUCvVITec5uljd8jXUflBSW/w
	k5nFw
X-Gm-Gg: ATEYQzwgY0VwPRGtoSGwq1RonKmG5skyKn1IA3bkterLyUuo4mOyPbfaYOaKhC8kUiQ
	/roasnf+P6g+5aHtZMfuJkVYsV82NVrqd5CSXFNZ8fjctSNyQRZM2KxMz11VqSODJ5ydO7Y6gFf
	PPBjEHLzoaALJb7r4PkzwqKkQ5luaCbnAhjMYSEc9ia603fZMztm3Hy1BPxp0E4KE5rrYYG1YlQ
	TKV5ExS6jHhiQPV0QoJmunLIVZu7I9H0553842K5367ElknnJTuqEViD+PIzu0b6AD6qn0IATU9
	XdrjS7mAlENpNYOOGT8Ogok2qBq1NtSvmmLNmRhFz/vc4ts7ARiO3b+muvrfmJ3G5OjJYXcY8te
	Wy0BX6gLQ/K3v0l9Mjagvy26C9HygS4H1eIJCc1Phi2BL3ivct7dc2nRfzJW6TRHUeT4pUsXavP
	YV775CDluNqc9MHnSCV1+AuVSk6Lf269oersCd8FJyorIjpASDPGieQf0V8frCywXD5OcSPJNLq
	MFoG+glpKn8A+PhLP+2qZ/wNxkk
X-Received: by 2002:a05:600c:b95:b0:479:1348:c63e with SMTP id 5b1f17b1804b1-4851ee8ca49mr23905325e9.9.1772700946158;
        Thu, 05 Mar 2026 00:55:46 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00675b4cbd8c1678f5.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:675b:4cbd:8c16:78f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fb27a20sm59405175e9.9.2026.03.05.00.55.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 00:55:45 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 01/12] python3-pip: Backport fix CVE-2026-1703
Date: Thu,  5 Mar 2026 09:54:50 +0100
Message-ID: <6fed4496c22058b0cce06e18eab67457a7873b10.1772700454.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772700454.git.yoann.congal@smile.fr>
References: <cover.1772700454.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 08:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232453

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Include the patch linked in the NVD report: https://github.com/pypa/pip/commit/8e227a9be4faa9594e05d02ca05a413a2a4e7735

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python/python3-pip/CVE-2026-1703.patch    | 41 +++++++++++++++++++
 .../python/python3-pip_25.2.bb                |  4 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch

diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
new file mode 100644
index 00000000000..826f483ea21
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
@@ -0,0 +1,41 @@
+From abce61e230c47598ce836157d075608595216a4c Mon Sep 17 00:00:00 2001
+From: Damian Shaw <damian.peter.shaw@gmail.com>
+Date: Fri, 30 Jan 2026 16:27:57 -0500
+Subject: [PATCH v4] Merge pull request #13777 from sethmlarson/commonpath
+
+Use os.path.commonpath() instead of commonprefix()
+
+CVE: CVE-2026-1703
+
+Upstream-Status: Backport [https://github.com/pypa/pip/commit/8e227a9be4faa9594e05d02ca05a413a2a4e7735]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ news/+1ee322a1.bugfix.rst            | 1 +
+ src/pip/_internal/utils/unpacking.py | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+ create mode 100644 news/+1ee322a1.bugfix.rst
+
+diff --git a/news/+1ee322a1.bugfix.rst b/news/+1ee322a1.bugfix.rst
+new file mode 100644
+index 000000000..edb1b320c
+--- /dev/null
++++ b/news/+1ee322a1.bugfix.rst
+@@ -0,0 +1 @@
++Use a path-segment prefix comparison, not char-by-char.
+diff --git a/src/pip/_internal/utils/unpacking.py b/src/pip/_internal/utils/unpacking.py
+index 0ad3129ac..7cb3de3c4 100644
+--- a/src/pip/_internal/utils/unpacking.py
++++ b/src/pip/_internal/utils/unpacking.py
+@@ -83,7 +83,7 @@ def is_within_directory(directory: str, target: str) -> bool:
+     abs_directory = os.path.abspath(directory)
+     abs_target = os.path.abspath(target)
+ 
+-    prefix = os.path.commonprefix([abs_directory, abs_target])
++    prefix = os.path.commonpath([abs_directory, abs_target])
+     return prefix == abs_directory
+ 
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-pip_25.2.bb b/meta/recipes-devtools/python/python3-pip_25.2.bb
index 350092d9ad0..496eff1f15d 100644
--- a/meta/recipes-devtools/python/python3-pip_25.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_25.2.bb
@@ -24,7 +24,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=63ec52baf95163b597008bb46db68030 \
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI += "file://no_shebang_mangling.patch"
+SRC_URI += "file://no_shebang_mangling.patch \
+            file://CVE-2026-1703.patch \
+            "
 
 SRC_URI[sha256sum] = "578283f006390f85bb6282dffb876454593d637f5d1be494b5202ce4877e71f2"
 

