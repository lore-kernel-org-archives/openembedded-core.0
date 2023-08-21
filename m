Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9281C3DA66
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 17:38:45 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web10.1003.1692639524529298324
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 10:38:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=KGtDzx9g;
 spf=pass (domain: baylibre.com, ip: 209.85.160.177, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4108da3a9efso14486931cf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 10:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1692639523; x=1693244323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lg1xO1UVOjUdP9xQe3bxZ9Bk0Mp99THJU3uTLzCs9/0=;
        b=KGtDzx9gaXnWuW+60qhNra+fTM+fM1KHuHxWrGcuTHqvsPvwCLS6pg8GBnmLHRwwqt
         o+tErRHtIjbRkfvmqLb3favj2SYjSb2YPd3DI/gaWu6p1Zqmvvz923SqyOhxL+mi+Yl5
         eKtH6eqkXW3nC1T9abNQ6e2DyuT1liN1dc/4eBFSt3rxCQtKE7VnFKPF1L6phIStfwnq
         eZj/SVVR+kH6IbZx9G+Fc/AzzoiJnGFbEt2of8SL6oW0+GraERdsvsSvuGeYmrMdlnrx
         OM1ryXROGyuXrFCbD2csNdxGU9of1V06v3uOf4sn8AdsOgcYRnTKwr6H7H8w2d/3NA+w
         byGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692639523; x=1693244323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lg1xO1UVOjUdP9xQe3bxZ9Bk0Mp99THJU3uTLzCs9/0=;
        b=hdPNLXNU/t6p4jTUmVja3LXk5hCrB33d2ysXVeyFmO0Ae+FF5qA52M0leapWIysGQG
         mCKBwyy7srWM4G4ltQTMdOecuFk2u3uBBB+PxLIq5Au3XizNphD5yfNo0tEFl0IlSdRu
         ctDUMoQxrAf+JJH7UzHDnoCz+lhHKIG86zapXZMvuJ1DN1zzfdCPsWpr/arN+BCjMr9l
         gfX/Lrwg6mh10B2/RKWFJEFSxsDutBsKVCKAcwCZKp81Vv2Tlz6XPjMB/py+tE+WE73e
         ssm59LpfSCG/PEkcvEoqibnH+SWd4/neH0mXMj8u93SqaR5GT1mGv6hFE7ZA4ATKKBrp
         dB9g==
X-Gm-Message-State: AOJu0Yzo3PvGuIGIdVjpQT8njIVVJWQoTZbsl57MFKz19Zha3dGwjW46
	rBhZ/QSMNHGY4UsiKSp4a6hLhUP86IpqrtrXlxo=
X-Google-Smtp-Source: AGHT+IEfckoolZgja1DMXmEvkiwH4nJl1sjvQZt+Ry5XF+IKw8MADYfFfKjhhTzXbFn5M+CgtB7afQ==
X-Received: by 2002:a05:622a:1c1:b0:403:971a:44ab with SMTP id t1-20020a05622a01c100b00403971a44abmr9369469qtw.58.1692639523515;
        Mon, 21 Aug 2023 10:38:43 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id a5-20020ac84345000000b003f7fd3ce69fsm2513347qtn.59.2023.08.21.10.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 10:38:43 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: tim.orling@konsulko.com,
	raj.khem@gmail.com
Subject: [OE-core][PATCH 2/2] python3-pyyaml: Make compatible with Cython 3.0.0
Date: Mon, 21 Aug 2023 13:38:40 -0400
Message-ID: <20230821173840.1337747-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230821173840.1337747-1-tgamblin@baylibre.com>
References: <20230821173840.1337747-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 17:38:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186481

Backport a fix to avoid failures with get_source_files and build_ext
during do_compile when compiling with Cython > 3.0.0.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../0001-Fix-builds-with-Cython-3.patch       | 47 +++++++++++++++++++
 ...roject.toml-don-t-pin-Cython-version.patch | 26 ++++++++++
 .../python/python3-pyyaml_6.0.1.bb            |  4 ++
 3 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyyaml/0001-Fix-builds-with-Cython-3.patch
 create mode 100644 meta/recipes-devtools/python/python3-pyyaml/0001-pyproject.toml-don-t-pin-Cython-version.patch

diff --git a/meta/recipes-devtools/python/python3-pyyaml/0001-Fix-builds-with-Cython-3.patch b/meta/recipes-devtools/python/python3-pyyaml/0001-Fix-builds-with-Cython-3.patch
new file mode 100644
index 0000000000..66de7dacb0
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyyaml/0001-Fix-builds-with-Cython-3.patch
@@ -0,0 +1,47 @@
+From 90c32c1f301a5d43177c516bf76b58ee1d07a2fe Mon Sep 17 00:00:00 2001
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
+
+Upstream-Status: Backport
+(https://github.com/yaml/pyyaml/pull/731/commits/17dc5b6cd96dcfe64fd71789c771ca9b96d260e5)
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ setup.py | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 944e7fa..462b1e9 100644
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
+2.41.0
+
diff --git a/meta/recipes-devtools/python/python3-pyyaml/0001-pyproject.toml-don-t-pin-Cython-version.patch b/meta/recipes-devtools/python/python3-pyyaml/0001-pyproject.toml-don-t-pin-Cython-version.patch
new file mode 100644
index 0000000000..3e62d9de39
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyyaml/0001-pyproject.toml-don-t-pin-Cython-version.patch
@@ -0,0 +1,26 @@
+From 322651ce2b9b209d3328a6f7590853c2008e9c10 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Mon, 21 Aug 2023 11:26:35 -0400
+Subject: [PATCH] pyproject.toml: don't pin Cython version
+
+Remove the pinned version for Cython so that pyyaml can build.
+
+Upstream-Status: Inappropriate (embedded-specific)
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
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
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb b/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb
index 4ab8f038f4..4c71993e5c 100644
--- a/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb
@@ -7,6 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6d8242660a8371add5fe547adf083079"
 
 PYPI_PACKAGE = "PyYAML"
 
+SRC_URI += "file://0001-pyproject.toml-don-t-pin-Cython-version.patch \
+            file://0001-Fix-builds-with-Cython-3.patch \
+"
+
 inherit pypi python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "bfdf460b1736c775f2ba9f6a92bca30bc2095067b8a9d77876d1fad6cc3b4a43"
-- 
2.41.0


