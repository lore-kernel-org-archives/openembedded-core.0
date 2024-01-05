Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52435C47079
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 13:36:06 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.23434.1704461764790535792
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jan 2024 05:36:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YH6C6Zx5;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-337520892f7so313675f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 05:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704461763; x=1705066563; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1V1iRjsuu+JkapR444XptzLMVmy5dbIXU+whxn+2D50=;
        b=YH6C6Zx52t7igfA4Sk90iV5vixlLQnc4LR7fZwXWaVPQiiY4RXtdENJV0iSOTm4EoY
         Ya4fofrlwd+s1Au+YILyWpPefjZb4AQ+bCXWgWVEF4sYKqxNu44S9NNI3MSLofyn+lg1
         op2Vhs3u/3qqdHnphCGSWI4rQbZX1LEpZATw+IZNArHDyzmdEqiUopPyQz23TYRt07kb
         7U7KeHUBaYEI8RxyC/H0SE1KsOAxIHVlBeGyQXTRoV+ZXYgzoLWZm1vHVYMZwpCV0U5a
         HxYhvKpX/hJZ9muk2MxPji+ZJ2XdIwbgc7c6mcJKllbjbPSV6rwXZxe6Y1KhNkJlwezR
         eA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704461763; x=1705066563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1V1iRjsuu+JkapR444XptzLMVmy5dbIXU+whxn+2D50=;
        b=cxBoPKqP5RVc2PRAI09eByMNrxIjZg1s9JgVXrWBOPybozgJpEN04Syv/c0OqxCJsG
         qyUrGCykg35tjz/Y5mYzRwcGZaqxlvaCpefxKI6IjAlZAfd7HIttlD/0DVvCdQuhdmdd
         6DXZJVRdjgN0S/lmdYHZMnsdpiXM9TGlLCtkiWGI4vlUnQOhEM91eUDXDBjN+hH0JheK
         34kZclyRiOgIiO6HwnTtAPCp1u6jqFZmUE/sZuYFnQAxEjtYk6U7VWwmg0q6KZ/G1Liq
         FxQaudyVZTyk8DpS5DRHsw1wlDLiFyGq8YFAdrsA12EDIQvLORpMbaFaTCgwaCmxwJmn
         76Ew==
X-Gm-Message-State: AOJu0YwPuEsapxdlPj+QAvPw2Xw+6fLj60ElHn19+WIm03XuKZpcY/Bj
	08bbJkXdAdL1BJqNzVZr0IdA52LICWM=
X-Google-Smtp-Source: AGHT+IGaWTIdpQ11IhZL3z3GrDm+2TLfUo6zTeQgpesl9K3FCl5qMp4GIhreFpeWsrnvl+UKnNCicg==
X-Received: by 2002:a05:600c:4f81:b0:40d:87a0:676 with SMTP id n1-20020a05600c4f8100b0040d87a00676mr1193864wmq.78.1704461762569;
        Fri, 05 Jan 2024 05:36:02 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id w13-20020a5d608d000000b003372c080acasm1425187wrt.2.2024.01.05.05.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 05:36:02 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/3] python3-pyaaml: make compatible with cython 3.x
Date: Fri,  5 Jan 2024 14:35:42 +0100
Message-Id: <20240105133543.3017997-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240105133543.3017997-1-alex@linutronix.de>
References: <20240105133543.3017997-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 13:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193356

This has been rejected by upstream in favour of requiring obsolete cython
until there's 'proper' 3.x support. Months later, there's still no progress
so let's just take the rejected fix, as it does work (as reported by others as well),
and allows moving forward with cython.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-Fix-builds-with-Cython-3.patch       | 54 +++++++++++++++++++
 .../python/python3-pyyaml_6.0.1.bb            |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyyaml/0001-Fix-builds-with-Cython-3.patch

diff --git a/meta/recipes-devtools/python/python3-pyyaml/0001-Fix-builds-with-Cython-3.patch b/meta/recipes-devtools/python/python3-pyyaml/0001-Fix-builds-with-Cython-3.patch
new file mode 100644
index 00000000000..a87d588b6a1
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyyaml/0001-Fix-builds-with-Cython-3.patch
@@ -0,0 +1,54 @@
+From 9cc23db56add79357b8f8257fe6fc0d6879d4579 Mon Sep 17 00:00:00 2001
+From: "Andrew J. Hesford" <ajh@sideband.org>
+Date: Fri, 21 Jul 2023 09:50:00 -0400
+Subject: [PATCH] Fix builds with Cython 3
+
+This is a *de minimis* fix for building with Cython 3. Recent Cython<3
+releases provided `Cython.Distutils.build_ext` as an alias to
+`Cython.Distutils.old_build_ext.old_build_ext`; Cython 3 drops this
+alias and instead uses a wholly new `Cython.Distutils.build_ext` that
+does not provide the `cython_sources` function used in `setup.py`.
+
+Explicitly importing `old_build_ext` preserves the existing behavior for
+recent Cython<3 and uses the correct behavior for Cython 3. Should the
+import fail (*e.g.*, because the version of Cython available predates
+the availability of `old_build_ext`), the import falls back to just
+`Cython.Distutils.build_ext`.
+
+Signed-off-by: Andrew J. Hesford <ajh@sideband.org>
+Upstream-Status: Denied [https://github.com/yaml/pyyaml/pull/731]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ pyproject.toml | 2 +-
+ setup.py       | 6 +++++-
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 4bc04c0..2bf5ec8 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,3 +1,3 @@
+ [build-system]
+-requires = ["setuptools", "wheel", "Cython<3.0"]
++requires = ["setuptools", "wheel", "Cython"]
+ build-backend = "setuptools.build_meta"
+diff --git a/setup.py b/setup.py
+index 65b0ea0..4461580 100644
+--- a/setup.py
++++ b/setup.py
+@@ -82,7 +82,11 @@ if 'sdist' in sys.argv or os.environ.get('PYYAML_FORCE_CYTHON') == '1':
+     with_cython = True
+ try:
+     from Cython.Distutils.extension import Extension as _Extension
+-    from Cython.Distutils import build_ext as _build_ext
++    try:
++        from Cython.Distutils.old_build_ext import old_build_ext as _build_ext
++    except ImportError:
++        from Cython.Distutils import build_ext as _build_ext
++
+     with_cython = True
+ except ImportError:
+     if with_cython:
+-- 
+2.39.2
+
diff --git a/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb b/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb
index 4ab8f038f42..61f7cbc6b36 100644
--- a/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb
@@ -9,6 +9,7 @@ PYPI_PACKAGE = "PyYAML"
 
 inherit pypi python_setuptools_build_meta
 
+SRC_URI += "file://0001-Fix-builds-with-Cython-3.patch"
 SRC_URI[sha256sum] = "bfdf460b1736c775f2ba9f6a92bca30bc2095067b8a9d77876d1fad6cc3b4a43"
 
 RDEPENDS:${PN} += "\
-- 
2.39.2


