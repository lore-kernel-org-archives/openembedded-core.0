Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7FD1C61DA4
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 01:03:33 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.2190.1678928601491835043
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 18:03:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YofVQj0l;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id h12-20020a17090aea8c00b0023d1311fab3so32356pjz.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 18:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678928605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mRUrxLv3E2NXppqc/UBZBTh6eVgOe83PJA5P0GGdcKc=;
        b=YofVQj0lA+yCjswnC6FX2E/JgMUhkEVxVmf8uodqsUVQAiTAblHtdYdmtiEMgc6+Ce
         rL/rHvOFjhMnVp3A3AJKgH4boTuihCvRuQYWymzDGZwF4WBhDXxbmw/vr4Le/oSheQia
         INXnmVG2vjWhY+4NWCUEQ3dZJD7U6cAnl1cle85Mz+qJuyhYXdiT9dEgxlw+X8pe3RVa
         y8wVAglTod0wEoPYsau+dHsnhVuR9W8/sadx7X758qJAuO3je1+oJvTQlumltHsr5Lwr
         uqhtVbL7d6J1z5jUD4Zbn+Xsq7bq1WfLEVbQjsXuKy5vEXWtVLOAMQjnOy1GIXL6HhYu
         qKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678928605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mRUrxLv3E2NXppqc/UBZBTh6eVgOe83PJA5P0GGdcKc=;
        b=lcnfq4YbDPrmWvgtByRRRWURnpgnjdlVHuyD+GPaxv2Pf8+YILtwwb7AMYzKb0UQVi
         f0YHn/RDJg5zogywlchhvYcpqnLIMyg8CBwZAgSNQLxkOTEolaURkB7WjOK/aulpbwLi
         W2u8SYkJ1y2SG3d9x/K6maL5rqIEz6lWC7moewdLpn+0evyWiXFhsSRt7T9tStRb1ag7
         amITU8rI92Eee1fVd26SZmeMwHCI9IEoosCdYKamGTgPbXb+DiEa2Hd+XmksNBw7uNy0
         EBoWarbxLXhxPiWeyZh4fcHxRUpTUqSS/yR6qPFWJ/sb5V5Rp8oCBop0y3dTmVDuOLzD
         d6Fw==
X-Gm-Message-State: AO0yUKW9ySE5Jcm2OfnMdPSmvcJt1lpsjb6b4KJVHHoU9vgV0cNUl9Rm
	45wUSND6REylF4BErmVYN8Fb8n4VpdY=
X-Google-Smtp-Source: AK7set9+2yIBlaUOwAEjviHBr4iASiokhxUGhLrzcuBI86n4PoBENkImxMveXkuyWev+6HS8rHpdkA==
X-Received: by 2002:a17:903:64b:b0:1a0:7425:4b73 with SMTP id kh11-20020a170903064b00b001a074254b73mr1442263plb.4.1678928604762;
        Wed, 15 Mar 2023 18:03:24 -0700 (PDT)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:66f1:cb87:4495:5f63])
        by smtp.gmail.com with ESMTPSA id kf16-20020a17090305d000b0019309be03e7sm4240035plb.66.2023.03.15.18.03.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 18:03:24 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] python3-wheel: upgrade 0.38.4 -> 0.40.0
Date: Wed, 15 Mar 2023 18:03:01 -0700
Message-Id: <de64dd5a8194c9c7e4a99cdc93ddab3841a6d33e.1678928363.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1678928363.git.tim.orling@konsulko.com>
References: <cover.1678928363.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 01:03:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178670

* Drop pyproject.toml patch, merged upstream

https://wheel.readthedocs.io/en/stable/news.html#release-notes

0.40.0 (2023-03-14)
* Added a wheel tags command to modify tags on an existing wheel (PR by
  Henry Schreiner)
* Updated vendored packaging to 23.0
* wheel unpack now preserves the executable attribute of extracted files
* Fixed spaces in platform names not being converted to underscores (PR
  by David Tucker)
* Fixed RECORD files in generated wheels missing the regular file attribute
* Fixed DeprecationWarning about the use of the deprecated pkg_resources
  API (PR by Thomas Grainger)
* Wheel now uses flit-core as a build backend (PR by Henry Schreiner)

License-Update: use LICENSE.txt for LIC_FILES_CHKSUM instead of PKG-INFO

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...roject.toml-from-flit-backend-branch.patch | 100 ------------------
 ...heel_0.38.4.bb => python3-wheel_0.40.0.bb} |   6 +-
 2 files changed, 2 insertions(+), 104 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-wheel/0001-Backport-pyproject.toml-from-flit-backend-branch.patch
 rename meta/recipes-devtools/python/{python3-wheel_0.38.4.bb => python3-wheel_0.40.0.bb} (62%)

diff --git a/meta/recipes-devtools/python/python3-wheel/0001-Backport-pyproject.toml-from-flit-backend-branch.patch b/meta/recipes-devtools/python/python3-wheel/0001-Backport-pyproject.toml-from-flit-backend-branch.patch
deleted file mode 100644
index 023de0e6a88..00000000000
--- a/meta/recipes-devtools/python/python3-wheel/0001-Backport-pyproject.toml-from-flit-backend-branch.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From f00dd220346773bc088d403847ee7f06f2b4c30a Mon Sep 17 00:00:00 2001
-From: Tim Orling <tim.orling@konsulko.com>
-Date: Fri, 18 Feb 2022 11:09:16 -0800
-Subject: [PATCH] Backport pyproject.toml from flit-backend branch
-
-This allows us to bootstrap wheels and PEP-517 packaging.
-
-Upstream-Status: Backport from flit-backend branch
-https://raw.githubusercontent.com/pypa/wheel/4f6ba78fede38a8d9e35a14e38377a121033afb3/pyproject.toml
-
-Signed-off-by: Tim Orling <tim.orling@konsulko.com>
----
- pyproject.toml | 78 ++++++++++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 78 insertions(+)
- create mode 100644 pyproject.toml
-
-diff --git a/pyproject.toml b/pyproject.toml
-new file mode 100644
-index 0000000..749b8de
---- /dev/null
-+++ b/pyproject.toml
-@@ -0,0 +1,78 @@
-+[build-system]
-+requires = ["flit_core >=3.2,<4"]
-+build-backend = "flit_core.buildapi"
-+
-+[project]
-+name = "wheel"
-+description = "A built-package format for Python"
-+readme = "README.rst"
-+classifiers = [
-+    "Development Status :: 5 - Production/Stable",
-+    "Intended Audience :: Developers",
-+    "Topic :: System :: Archiving :: Packaging",
-+    "License :: OSI Approved :: MIT License",
-+    "Programming Language :: Python",
-+    "Programming Language :: Python :: 3 :: Only",
-+    "Programming Language :: Python :: 3.7",
-+    "Programming Language :: Python :: 3.8",
-+    "Programming Language :: Python :: 3.9",
-+    "Programming Language :: Python :: 3.10"
-+]
-+authors = [{name = "Daniel Holth", email = "dholth@fastmail.fm"}]
-+maintainers = [{name = "Alex Grönholm", email = "alex.gronholm@nextday.fi"}]
-+keywords = ["wheel", "packaging"]
-+license = {file = "LICENSE.txt"}
-+requires-python = ">=3.7"
-+dependencies = [
-+    "setuptools >= 45.2.0"
-+]
-+dynamic = ["version"]
-+
-+[project.urls]
-+Documentation = "https://wheel.readthedocs.io/"
-+Changelog = "https://wheel.readthedocs.io/en/stable/news.html"
-+"Issue Tracker" = "https://github.com/pypa/wheel/issues"
-+
-+[project.scripts]
-+wheel = "wheel.cli:main"
-+
-+[project.entry-points."distutils.commands"]
-+bdist_wheel = "wheel.bdist_wheel:bdist_wheel"
-+
-+[project.optional-dependencies]
-+test = [
-+    "pytest >= 3.0.0"
-+]
-+
-+[tool.flit.sdist]
-+exclude = [
-+    ".cirrus.yml",
-+    ".github/*",
-+    ".gitignore",
-+    ".pre-commit-config.yaml",
-+    ".readthedocs.yml"
-+]
-+
-+[tool.black]
-+target-version = ['py37']
-+extend-exclude = '''
-+^/src/wheel/vendored/
-+'''
-+
-+[tool.isort]
-+src_paths = ["src"]
-+profile = "black"
-+skip_gitignore = true
-+
-+[tool.flake8]
-+max-line-length = 88
-+
-+[tool.pytest.ini_options]
-+testpaths = "tests"
-+
-+[tool.coverage.run]
-+source = ["wheel"]
-+omit = ["*/vendored/*"]
-+
-+[tool.coverage.report]
-+show_missing = true
diff --git a/meta/recipes-devtools/python/python3-wheel_0.38.4.bb b/meta/recipes-devtools/python/python3-wheel_0.40.0.bb
similarity index 62%
rename from meta/recipes-devtools/python/python3-wheel_0.38.4.bb
rename to meta/recipes-devtools/python/python3-wheel_0.40.0.bb
index 6263cbc45c7..2b8111d544b 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.38.4.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.40.0.bb
@@ -2,14 +2,12 @@ SUMMARY = "The official binary distribution format for Python "
 HOMEPAGE = "https://github.com/pypa/wheel"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=10;endline=10;md5=8227180126797a0148f94f483f3e1489"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7ffb0db04527cfe380e4f2726bd05ebf"
 
-SRC_URI[sha256sum] = "965f5259b566725405b05e7cf774052044b1ed30119b5d586b2703aafe8719ac"
+SRC_URI[sha256sum] = "cd1196f3faee2b31968d626e1731c94f99cbdb67cf5a46e4f5656cbee7738873"
 
 inherit python_flit_core pypi
 
-SRC_URI += " file://0001-Backport-pyproject.toml-from-flit-backend-branch.patch"
-
 BBCLASSEXTEND = "native nativesdk"
 
 # This used to use the bootstrap install which didn't compile. Until we bump the
-- 
2.30.2


