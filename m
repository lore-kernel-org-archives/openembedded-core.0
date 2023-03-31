Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27E69C77B62
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 05:26:56 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.47961.1680240406363229898
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 22:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RCXebBso;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id m2so21189205wrh.6
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 22:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680240404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ye9qoJCP8SiuEm3IVQh6WW1Jf4BNW8TXtDuJF1zpidA=;
        b=RCXebBsociJE61BmHs6ASNTUdy2PvPNrxljDQUPS/qz2tnK1MF+MxopOxGhxSCSvab
         CEMwuBFuB+5ws288PXzO/PuJvgRzt+0NOSOla4k/GPNfcaSWYHcl7tVZbOlbHo/IPLVs
         npIGElwHK+J2aLfRQIQiqG/S2BOn0KvWomHYC6OF7WS0elcg1jaR+woVYTKeusQ5z1gg
         G2URThRnlvTUsW55gF+3Xh/0xbmVdEsnhQZKrKUjnOtpvQCSIqDYZ5LHH17xO/8PXg65
         gwCksPLXoUw4rt3rXluR7crdUJcyyAH/JGS9S0psUk3TvHv+uj+oN7DfZOGL11wZ7ihz
         T4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680240404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ye9qoJCP8SiuEm3IVQh6WW1Jf4BNW8TXtDuJF1zpidA=;
        b=KR09cTw0x724s9VVmUETspepAcJzUu4t7v4cmbpdA59pFTKJGYh+/KN4L0ea5Riu5m
         HoY5p6jfZFeQXypxwh7BsK3Wzqvbkq+Xjj6fz34EE/1k+4QWZLKPio4wP54bzz9QwKDj
         QccrYeFC9ZRu+y+TrRKJGAfP30QXOEl7L2NoDInk3tiqHKazAN9F/pMPIG56nc89XRBP
         1EZ4PQNx7JzFKkNGtyBCmdSWcpd+/+R4dHuXqprChooBtHD7JO3PHlh2AqKAxtYVlCS7
         +TTCQCPIA6PMUIzDBSFKN8ouL9YKJkoNxRSPWQnj+5i5q423LSVt1XFfGoTkt03IG1RT
         lgFQ==
X-Gm-Message-State: AAQBX9fsPfcKFsWugVZeUEyeOAiRsT+43qFKRWC8xVjVo1qrxJsIAq7W
	+Od0s2IInNukjYmsozbnWuohtD0Mb4s=
X-Google-Smtp-Source: AKy350YH0yMJuicEeMZ2p+jjLeqK7522XrjVXEH+XfVeeOIRU/izWKu8tvHovSJ3Bk7HrOZ0FPsJRA==
X-Received: by 2002:a05:6000:1a47:b0:2d8:4f02:66b6 with SMTP id t7-20020a0560001a4700b002d84f0266b6mr20736859wry.9.1680240404333;
        Thu, 30 Mar 2023 22:26:44 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l5-20020a5d5265000000b002e55cc69169sm1146902wrc.38.2023.03.30.22.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 22:26:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 5/7] meta/recipes: ensure all recipes have a SUMMARY
Date: Fri, 31 Mar 2023 07:26:34 +0200
Message-Id: <20230331052636.978578-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230331052636.978578-1-alex@linutronix.de>
References: <20230331052636.978578-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 05:26:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179389

DESCRIPTION is optional for now; writing good component descriptions
is not easy (but appreciated).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-connectivity/inetutils/inetutils_2.4.bb            | 1 +
 meta/recipes-core/images/core-image-ptest-all.bb                | 2 +-
 meta/recipes-core/images/core-image-ptest-fast.bb               | 2 +-
 meta/recipes-core/musl/musl-utils.bb                            | 2 +-
 meta/recipes-devtools/createrepo-c/createrepo-c_0.20.1.bb       | 2 +-
 meta/recipes-devtools/llvm/llvm_git.bb                          | 2 +-
 meta/recipes-devtools/lua/lua_5.4.4.bb                          | 2 +-
 meta/recipes-devtools/python/python3-alabaster_0.7.13.bb        | 2 +-
 meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb        | 2 +-
 meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb      | 2 +-
 meta/recipes-devtools/python/python3-attrs_22.2.0.bb            | 2 +-
 meta/recipes-devtools/python/python3-babel_2.12.1.bb            | 2 +-
 meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb            | 2 +-
 meta/recipes-devtools/python/python3-dtschema_2023.1.bb         | 2 +-
 meta/recipes-devtools/python/python3-imagesize_1.4.1.bb         | 2 +-
 .../recipes-devtools/python/python3-importlib-metadata_6.0.0.bb | 2 +-
 meta/recipes-devtools/python/python3-jinja2_3.1.2.bb            | 2 +-
 meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb        | 2 +-
 meta/recipes-devtools/python/python3-more-itertools_9.1.0.bb    | 2 +-
 meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb   | 2 +-
 meta/recipes-devtools/python/python3-packaging_23.0.bb          | 2 +-
 meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb          | 2 +-
 meta/recipes-devtools/python/python3-pyelftools_0.29.bb         | 2 +-
 meta/recipes-devtools/python/python3-pysocks_1.7.1.bb           | 2 +-
 meta/recipes-devtools/python/python3-requests_2.28.2.bb         | 2 +-
 meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.0.bb  | 2 +-
 meta/recipes-devtools/python/python3-sphinx_6.1.3.bb            | 2 +-
 .../python/python3-sphinxcontrib-applehelp_1.0.4.bb             | 2 +-
 .../python/python3-sphinxcontrib-devhelp_1.0.2.bb               | 2 +-
 .../python/python3-sphinxcontrib-htmlhelp_2.0.1.bb              | 2 +-
 .../python/python3-sphinxcontrib-jsmath_1.0.1.bb                | 2 +-
 .../python/python3-sphinxcontrib-qthelp_1.0.3.bb                | 2 +-
 .../python/python3-sphinxcontrib-serializinghtml_1.1.5.bb       | 2 +-
 meta/recipes-devtools/python/python3-zipp_3.15.0.bb             | 2 +-
 meta/recipes-devtools/rust/cargo_1.68.1.bb                      | 2 +-
 meta/recipes-devtools/rust/rust-cross-canadian.inc              | 1 +
 meta/recipes-extended/go-examples/go-helloworld_0.1.bb          | 2 +-
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb              | 2 +-
 meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021.10.bb     | 2 +-
 .../gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb                | 2 +-
 .../gstreamer/gstreamer1.0-plugins-base_1.22.0.bb               | 2 +-
 .../gstreamer/gstreamer1.0-plugins-good_1.22.0.bb               | 2 +-
 .../gstreamer/gstreamer1.0-plugins-ugly_1.22.0.bb               | 2 +-
 meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb      | 2 +-
 44 files changed, 44 insertions(+), 42 deletions(-)

diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.4.bb b/meta/recipes-connectivity/inetutils/inetutils_2.4.bb
index 6519331141a..bcc3a0258e6 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.4.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.4.bb
@@ -1,3 +1,4 @@
+SUMMARY = "The GNU inetutils are a collection of common networking utilities and servers."
 DESCRIPTION = "The GNU inetutils are a collection of common \
 networking utilities and servers including ftp, ftpd, rcp, \
 rexec, rlogin, rlogind, rsh, rshd, syslog, syslogd, talk, \
diff --git a/meta/recipes-core/images/core-image-ptest-all.bb b/meta/recipes-core/images/core-image-ptest-all.bb
index c84e653d6eb..d4edb0fd058 100644
--- a/meta/recipes-core/images/core-image-ptest-all.bb
+++ b/meta/recipes-core/images/core-image-ptest-all.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Recipe to trigger execution of all ptest images."
+SUMMARY = "Recipe to trigger execution of all ptest images."
 HOMEPAGE = "https://www.yoctoproject.org/"
 
 LICENSE = "MIT"
diff --git a/meta/recipes-core/images/core-image-ptest-fast.bb b/meta/recipes-core/images/core-image-ptest-fast.bb
index e768afb302b..a5364e6cbf2 100644
--- a/meta/recipes-core/images/core-image-ptest-fast.bb
+++ b/meta/recipes-core/images/core-image-ptest-fast.bb
@@ -1,6 +1,6 @@
 require core-image-ptest-all.bb
 
-DESCRIPTION = "Recipe to trigger execution of all fast ptest images."
+SUMMARY = "Recipe to trigger execution of all fast ptest images."
 
 PTESTS = "${PTESTS_FAST}"
 
diff --git a/meta/recipes-core/musl/musl-utils.bb b/meta/recipes-core/musl/musl-utils.bb
index c42dff3a537..8280333daf4 100644
--- a/meta/recipes-core/musl/musl-utils.bb
+++ b/meta/recipes-core/musl/musl-utils.bb
@@ -1,7 +1,7 @@
 # Copyright (C) 2018 Khem Raj <raj.khem@gmail.com>
 # Released under the MIT license (see COPYING.MIT for the terms)
 
-DESCRIPTION = "getconf, getent and iconv implementations for musl"
+SUMMARY = "getconf, getent and iconv implementations for musl"
 HOMEPAGE = "https://git.alpinelinux.org/cgit/aports/tree/main/musl"
 LICENSE = "BSD-2-Clause & GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9d08215e611db87b357e8674b4b42564"
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.1.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.1.bb
index 053198ca5ec..1c4cdd5e3c0 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.1.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "C implementation of createrepo."
+SUMMARY = "C implementation of createrepo."
 HOMEPAGE = "https://github.com/rpm-software-management/createrepo_c/wiki"
 
 LICENSE = "GPL-2.0-only"
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index f133653903e..630aca758cc 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -1,7 +1,7 @@
 # Copyright (C) 2017 Khem Raj <raj.khem@gmail.com>
 # Released under the MIT license (see COPYING.MIT for the terms)
 
-DESCRIPTION = "The LLVM Compiler Infrastructure"
+SUMMARY = "The LLVM Compiler Infrastructure"
 HOMEPAGE = "http://llvm.org"
 LICENSE = "Apache-2.0-with-LLVM-exception"
 SECTION = "devel"
diff --git a/meta/recipes-devtools/lua/lua_5.4.4.bb b/meta/recipes-devtools/lua/lua_5.4.4.bb
index a39d888ec24..4fa5c593cf2 100644
--- a/meta/recipes-devtools/lua/lua_5.4.4.bb
+++ b/meta/recipes-devtools/lua/lua_5.4.4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Lua is a powerful light-weight programming language designed \
+SUMMARY = "Lua is a powerful light-weight programming language designed \
 for extending applications."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=307;endline=330;md5=79c3f6b19ad05efe24c1681f025026bb"
diff --git a/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb b/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb
index 9571137fb61..05d59febf0d 100644
--- a/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb
+++ b/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Alabaster is a visually (c)lean, responsive, configurable theme for the Sphinx documentation system. It is Python 2+3 compatible."
+SUMMARY = "Alabaster is a visually (c)lean, responsive, configurable theme for the Sphinx documentation system."
 HOMEPAGE = "https://alabaster.readthedocs.io/en/latest/"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
diff --git a/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb b/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb
index 5fa2ed987cc..3b8c5f9fc57 100644
--- a/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb
+++ b/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A fast, pure Python library for parsing and serializing ASN.1 structures"
+SUMMARY = "A fast, pure Python library for parsing and serializing ASN.1 structures"
 HOMEPAGE = "https://github.com/wbond/asn1crypto"
 SECTION = "devel/python"
 LICENSE = "MIT"
diff --git a/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb b/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb
index f706f5d7be9..f29be378e19 100644
--- a/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb
+++ b/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Powerful Python library for atomic file writes"
+SUMMARY = "Powerful Python library for atomic file writes"
 HOMEPAGE = "https://github.com/untitaker/python-atomicwrites"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=91cc36cfafeefb7863673bcfcb1d4da4"
diff --git a/meta/recipes-devtools/python/python3-attrs_22.2.0.bb b/meta/recipes-devtools/python/python3-attrs_22.2.0.bb
index 20dccc66399..8c1ff330e7b 100644
--- a/meta/recipes-devtools/python/python3-attrs_22.2.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_22.2.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Classes Without Boilerplate"
+SUMMARY = "Classes Without Boilerplate"
 HOMEPAGE = "http://www.attrs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5e55731824cf9205cfabeab9a0600887"
diff --git a/meta/recipes-devtools/python/python3-babel_2.12.1.bb b/meta/recipes-devtools/python/python3-babel_2.12.1.bb
index dfa45fbdf6e..794e1652cd6 100644
--- a/meta/recipes-devtools/python/python3-babel_2.12.1.bb
+++ b/meta/recipes-devtools/python/python3-babel_2.12.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A collection of tools for internationalizing Python applications"
+SUMMARY = "A collection of tools for internationalizing Python applications"
 HOMEPAGE = "http://babel.edgewall.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0f97d9a63e91407b4c0d01efde91cfc0"
diff --git a/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb b/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb
index 9f5b81330bb..21f2eb6ba46 100644
--- a/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb
+++ b/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Modern password hashing for your software and your servers."
+SUMMARY = "Modern password hashing for your software and your servers."
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8f7bb094c7232b058c7e9f2e431f389c"
 HOMEPAGE = "https://pypi.org/project/bcrypt/"
diff --git a/meta/recipes-devtools/python/python3-dtschema_2023.1.bb b/meta/recipes-devtools/python/python3-dtschema_2023.1.bb
index 9767c95d304..74ca55cf04c 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2023.1.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2023.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Tooling for devicetree validation using YAML and jsonschema"
+SUMMARY = "Tooling for devicetree validation using YAML and jsonschema"
 HOMEPAGE = "https://github.com/devicetree-org/dt-schema"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=457495c8fa03540db4a576bf7869e811"
diff --git a/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb b/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb
index 34c5a43028f..4edac0a533e 100644
--- a/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb
+++ b/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Parses image files’ header and return image size."
+SUMMARY = "Parses image files’ header and return image size."
 HOMEPAGE = "https://github.com/shibukawa/imagesize_py"
 SECTION = "devel/python"
 LICENSE = "MIT"
diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb b/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb
index b33a1b58589..9e72b8fc57b 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Read metadata from Python packages"
+SUMMARY = "Read metadata from Python packages"
 HOMEPAGE = "https://pypi.org/project/importlib-metadata/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
diff --git a/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb b/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb
index cd248cc0b4f..fa6d930a9c2 100644
--- a/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Python Jinja2: A small but fast and easy to use stand-alone template engine written in pure python."
+SUMMARY = "Python Jinja2: A small but fast and easy to use stand-alone template engine written in pure python."
 HOMEPAGE = "https://pypi.org/project/Jinja2/"
 
 LICENSE = "BSD-3-Clause"
diff --git a/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb b/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb
index 32420529635..d150403f8c3 100644
--- a/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb
+++ b/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Implements a XML/HTML/XHTML Markup safe string for Python"
+SUMMARY = "Implements a XML/HTML/XHTML Markup safe string for Python"
 HOMEPAGE = "http://github.com/mitsuhiko/markupsafe"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
diff --git a/meta/recipes-devtools/python/python3-more-itertools_9.1.0.bb b/meta/recipes-devtools/python/python3-more-itertools_9.1.0.bb
index f5d107c78db..8c33b7161bc 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_9.1.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_9.1.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "More routines for operating on iterables, beyond itertools"
+SUMMARY = "More routines for operating on iterables, beyond itertools"
 HOMEPAGE = "https://github.com/erikrose/more-itertools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
diff --git a/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb b/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb
index 6f3c096cf0e..6a3d6d30ae9 100644
--- a/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb
+++ b/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Provides enhanced HTTPS support for httplib and urllib2 using PyOpenSSL"
+SUMMARY = "Provides enhanced HTTPS support for httplib and urllib2 using PyOpenSSL"
 HOMEPAGE = "https://github.com/cedadev/ndg_httpsclient/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://MANIFEST.in;md5=ce22c0cd986d2de3f7073cd6b5523ae0"
diff --git a/meta/recipes-devtools/python/python3-packaging_23.0.bb b/meta/recipes-devtools/python/python3-packaging_23.0.bb
index 7b69c880c14..612174f45e0 100644
--- a/meta/recipes-devtools/python/python3-packaging_23.0.bb
+++ b/meta/recipes-devtools/python/python3-packaging_23.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Core utilities for Python packages"
+SUMMARY = "Core utilities for Python packages"
 HOMEPAGE = "https://github.com/pypa/packaging"
 LICENSE = "Apache-2.0 | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
diff --git a/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb b/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb
index 673b5c7ef09..92285d1d72f 100644
--- a/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb
+++ b/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Object-oriented filesystem paths"
+SUMMARY = "Object-oriented filesystem paths"
 HOMEPAGE = "https://github.com/mcmtroffaes/pathlib2"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2dc08586cce3ab91bfa091b655c0e440"
diff --git a/meta/recipes-devtools/python/python3-pyelftools_0.29.bb b/meta/recipes-devtools/python/python3-pyelftools_0.29.bb
index 2199e9ff8ef..c55682e2eaf 100644
--- a/meta/recipes-devtools/python/python3-pyelftools_0.29.bb
+++ b/meta/recipes-devtools/python/python3-pyelftools_0.29.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "pyelftools is a pure-Python library for parsing and analyzing ELF files and DWARF debugging information"
+SUMMARY = "pyelftools is a pure-Python library for parsing and analyzing ELF files and DWARF debugging information"
 HOMEPAGE = "https://github.com/eliben/pyelftools"
 SECTION = "devel/python"
 LICENSE = "PD"
diff --git a/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb b/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb
index 91444017031..b77bf0fb8d8 100644
--- a/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb
+++ b/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A Python SOCKS client module"
+SUMMARY = "A Python SOCKS client module"
 HOMEPAGE = "http://python-requests.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1d457bcffb9661b45f799d4efee72f16"
diff --git a/meta/recipes-devtools/python/python3-requests_2.28.2.bb b/meta/recipes-devtools/python/python3-requests_2.28.2.bb
index 2f397ddaadf..8ab1ec01212 100644
--- a/meta/recipes-devtools/python/python3-requests_2.28.2.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.28.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Python HTTP for Humans."
+SUMMARY = "Python HTTP for Humans."
 HOMEPAGE = "http://python-requests.org"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
diff --git a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.0.bb b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.0.bb
index 0845646978b..e8a422b2e79 100644
--- a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Sphinx Theme reader"
+SUMMARY = "Sphinx Theme reader"
 HOMEPAGE = "https://github.com/readthedocs/sphinx_rtd_theme"
 SECTION = "devel/python"
 LICENSE = "MIT & OFL-1.1"
diff --git a/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb b/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb
index f75988a6a0d..0de19af8d9a 100644
--- a/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Python documentation generator"
+SUMMARY = "Python documentation generator"
 HOMEPAGE = "http://sphinx-doc.org/"
 SECTION = "devel/python"
 LICENSE = "BSD-2-Clause & MIT & BSD-3-Clause"
diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb
index 4d14216c524..e352601466d 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "sphinxcontrib-applehelp is a sphinx extension which outputs Apple help books"
+SUMMARY = "sphinxcontrib-applehelp is a sphinx extension which outputs Apple help books"
 HOMEPAGE = "https://www.sphinx-doc.org"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c7715857042d4c8c0105999ca0c072c5"
diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb
index 7b7bda78071..0d034366e7a 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "sphinxcontrib-devhelp is a sphinx extension which outputs Devhelp document."
+SUMMARY = "sphinxcontrib-devhelp is a sphinx extension which outputs Devhelp document."
 HOMEPAGE = "https://www.sphinx-doc.org"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fd30d9972a142c857a80c9f312e92b93"
diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb
index 39589881daa..bf034fb6849 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "sphinxcontrib-htmlhelp is a sphinx extension which renders HTML help files"
+SUMMARY = "sphinxcontrib-htmlhelp is a sphinx extension which renders HTML help files"
 HOMEPAGE = "https://www.sphinx-doc.org"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24dce5ef6a13563241c24bc366f48886"
diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb
index 863458a1dc5..7c11cfeec53 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A sphinx extension which renders display math in HTML via JavaScript"
+SUMMARY = "A sphinx extension which renders display math in HTML via JavaScript"
 HOMEPAGE = "https://www.sphinx-doc.org"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0064c10bd544bcffccbc67a41c108d3"
diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb
index 8ebfbba7410..41d2b6187b7 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Is a sphinx extension which outputs QtHelp document."
+SUMMARY = "Is a sphinx extension which outputs QtHelp document."
 HOMEPAGE = "http://babel.edgewall.org/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f7a83b72ea86d04827575ec0b63430eb"
diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb
index 71dde37593f..7fa6d8aeb7a 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = 'sphinxcontrib-serializinghtml is a sphinx extension which outputs "serialized" HTML files (json and pickle).'
+SUMMARY = 'sphinxcontrib-serializinghtml is a sphinx extension which outputs "serialized" HTML files (json and pickle).'
 HOMEPAGE = "https://www.sphinx-doc.org"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=32a84ac5cd3bbd10c4d479233ad588b6"
diff --git a/meta/recipes-devtools/python/python3-zipp_3.15.0.bb b/meta/recipes-devtools/python/python3-zipp_3.15.0.bb
index 5b42dd8139b..45654ff6f1c 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.15.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.15.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Backport of pathlib-compatible object wrapper for zip files"
+SUMMARY = "Backport of pathlib-compatible object wrapper for zip files"
 HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
diff --git a/meta/recipes-devtools/rust/cargo_1.68.1.bb b/meta/recipes-devtools/rust/cargo_1.68.1.bb
index 2b2394e898b..a5c10641066 100644
--- a/meta/recipes-devtools/rust/cargo_1.68.1.bb
+++ b/meta/recipes-devtools/rust/cargo_1.68.1.bb
@@ -1,4 +1,4 @@
-SUMMARY ?= "Cargo, a package manager for Rust."
+SUMMARY = "Cargo, a package manager for Rust."
 HOMEPAGE = "https://crates.io"
 LICENSE = "MIT | Apache-2.0"
 SECTION = "devel"
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index 17f933959f5..8d0dc6a4e26 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -1,3 +1,4 @@
+SUMMARY = "Rust compiler and runtime libaries (cross-canadian for ${TARGET_ARCH} target)"
 PN = "rust-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
 inherit rust-target-config
diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
index d0de035921f..5483ecc307b 100644
--- a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
+++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "This is a simple example recipe that cross-compiles a Go program."
+SUMMARY = "This is a simple example recipe that cross-compiles a Go program."
 SECTION = "examples"
 HOMEPAGE = "https://golang.org/"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 05babf4c91e..7e70cf1f040 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "The Vulkan Samples is collection of resources to help develop optimized Vulkan applications."
+SUMMARY = "The Vulkan Samples is collection of resources to help develop optimized Vulkan applications."
 HOMEPAGE = "https://www.khronos.org/vulkan/"
 BUGTRACKER = "https://github.com/KhronosGroup/Vulkan-Samples/issues"
 LICENSE = "Apache-2.0"
diff --git a/meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021.10.bb b/meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021.10.bb
index c869274d09f..974fcba876a 100644
--- a/meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021.10.bb
+++ b/meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021.10.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Wrapper for tooling for devicetree validation using YAML and jsonschema"
+SUMMARY = "Wrapper for tooling for devicetree validation using YAML and jsonschema"
 HOMEPAGE = "https://yoctoproject.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb
index b9fc17f3e95..bb6bcb45b05 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb
@@ -1,7 +1,7 @@
 require gstreamer1.0-plugins-common.inc
 require gstreamer1.0-plugins-license.inc
 
-DESCRIPTION = "'Bad' GStreamer plugins and helper libraries "
+SUMMARY = "'Bad' GStreamer plugins and helper libraries "
 HOMEPAGE = "https://gstreamer.freedesktop.org/"
 BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/issues"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb
index 01ef63c104f..91c072accd8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb
@@ -1,6 +1,6 @@
 require gstreamer1.0-plugins-common.inc
 
-DESCRIPTION = "'Base' GStreamer plugins and helper libraries"
+SUMMARY = "'Base' GStreamer plugins and helper libraries"
 HOMEPAGE = "https://gstreamer.freedesktop.org/"
 BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/issues"
 LICENSE = "LGPL-2.1-or-later"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.0.bb
index ef4d82c598f..67a6a224048 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.0.bb
@@ -1,6 +1,6 @@
 require gstreamer1.0-plugins-common.inc
 
-DESCRIPTION = "'Good' GStreamer plugins"
+SUMMARY = "'Good' GStreamer plugins"
 HOMEPAGE = "https://gstreamer.freedesktop.org/"
 BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.0.bb
index 9c384fea5c5..35baaea3043 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.0.bb
@@ -1,7 +1,7 @@
 require gstreamer1.0-plugins-common.inc
 require gstreamer1.0-plugins-license.inc
 
-DESCRIPTION = "'Ugly GStreamer plugins"
+SUMMARY = "'Ugly GStreamer plugins"
 HOMEPAGE = "https://gstreamer.freedesktop.org/"
 BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-ugly/-/issues"
 
diff --git a/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb b/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb
index 7bd66f63cf2..9dff9706630 100644
--- a/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb
+++ b/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A small C library that is supposed to make it easy to run an HTTP server as part of another application"
+SUMMARY = "A small C library that is supposed to make it easy to run an HTTP server as part of another application"
 HOMEPAGE = "http://www.gnu.org/software/libmicrohttpd/"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=57d09285feac8a64efa878e692b14f36"
-- 
2.30.2


