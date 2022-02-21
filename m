Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD0CC433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 21:24:41 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web08.4754.1645478680724068321
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W0T5tNuY;
 spf=pass (domain: gmail.com, ip: 209.85.215.175,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id d16so15303766pgd.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xNLWwM9nQTo2EyOg5vy/NihA9OtxCmsk83GuvHI3/Os=;
        b=W0T5tNuYhwJRW1NSUlmLWRmqN8skVoNkcHhIILF+g5x+WhaDT7PhTwC4qe10SA4f8l
         DVd/dON95ZGIzytE4oR1hufmcHx/VoSvfrAnA1lsJcvUwyb+UywTHLfKPq3FZFbi/3y0
         OKgP5cAgWWkHJKKCpx3ZOLfSKa8pRCx4bS1lwL+w/75udsXSnWmF+vqhFIV2t6sxF7Yz
         8TMkkpWyXzrEuZkZ4MXVb94ZO1TM53CDp3MxM0lveAleTc2/CXfoEfzq313EMBoHqaty
         WkDZSKrV8jXqYvbw5q6nDYix9V4glTeQ4+gQY7K5btjBYoTwyCFBXmF3RsiJDjiXaaOz
         4k+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xNLWwM9nQTo2EyOg5vy/NihA9OtxCmsk83GuvHI3/Os=;
        b=tOgJtPqtPwsNhR1kOTXvhjgbncInq7q+V6MKXMf3WkL4XqnBWDGLY7hZldlmcpqZgk
         mgKilrhy1fAfqLWFWHmhwDHjlXig00M8wL18fNJ3QRBx/KoVM7KN+LEqZqfZmykpj2R+
         vLZlhuyOc62NcVGPSTz23y+qMzddUI8cl1VblAFFpcbug1jI5DElVDOqwLe4k0R4ScVm
         +Lui5FAtjod1XC4bj+PG6RFuc/h1AuLaj8Fu30zCFL+lrjKzW+SNfbPU0T8CurFydoH2
         IheMx5MA5nKipwDZRS9touxcu6NiDqsg89rT9iJyDyPWsm4iud1O104zAG/2f/paZM6l
         /doA==
X-Gm-Message-State: AOAM532999QP1odgkvfQ7k8XMnDeltIPwD+qTtCejTmpDOZS/Xxxtl2Y
	uoSuq0MOHVAC4LD/cuWNsH5oaZgWjkoqgQ==
X-Google-Smtp-Source: 
 ABdhPJwcTqPFeOqgv5+JHBu+Nnfxyq6/i9r6Mvhqbm7giALZQhArYyUirb7GIHgzIZwJ6KTtemY7fw==
X-Received: by 2002:a62:868e:0:b0:4cd:df75:b021 with SMTP id
 x136-20020a62868e000000b004cddf75b021mr21787143pfd.81.1645478679501;
        Mon, 21 Feb 2022 13:24:39 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d01c:96b7:6393:8c56])
        by smtp.gmail.com with ESMTPSA id
 n85sm14081529pfd.142.2022.02.21.13.24.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 13:24:39 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 23/32] python3-subunit: merge inc; set PIP_INSTALL_PACKAGE
Date: Mon, 21 Feb 2022 13:23:38 -0800
Message-Id: 
 <6e2208f0706316f6645635af24d4ec84fdb8f57a.1645478020.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645478020.git.tim.orling@konsulko.com>
References: <cover.1645478020.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 21:24:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162099

We have not supported python2 for some time now, so there is no reason
to maintain a separate python-subunit.inc file.

The wheel built by bdist_wheel is named 'python_subunit-*.whl', so set
PIP_INSALL_PACKAGE appropriately.

Add patch to use vendored _distutils from setuptools.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python-subunit.inc                 | 14 ----------
 ...001-setup.py-use-vendored-_distutils.patch | 27 +++++++++++++++++++
 .../python/python3-strict-rfc3339_0.7.bb      |  4 ++-
 .../python/python3-subunit_1.4.0.bb           | 17 ++++++++++--
 4 files changed, 45 insertions(+), 17 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-subunit.inc
 create mode 100644 meta/recipes-devtools/python/python3-strict-rfc3339/0001-setup.py-use-vendored-_distutils.patch

diff --git a/meta/recipes-devtools/python/python-subunit.inc b/meta/recipes-devtools/python/python-subunit.inc
deleted file mode 100644
index a2f9c5c3ffe..00000000000
--- a/meta/recipes-devtools/python/python-subunit.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "Python implementation of subunit test streaming protocol"
-HOMEPAGE = "https://pypi.org/project/python-subunit/"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README.rst;beginline=1;endline=20;md5=909c08e291647fd985fbe5d9836d51b6"
-
-PYPI_PACKAGE = "python-subunit"
-
-SRC_URI[md5sum] = "30f1ab20651d94442dd9a7f8c9e8d633"
-SRC_URI[sha256sum] = "042039928120fbf392e8c983d60f3d8ae1b88f90a9f8fd7188ddd9c26cad1e48"
-
-inherit pypi
-
-BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/python/python3-strict-rfc3339/0001-setup.py-use-vendored-_distutils.patch b/meta/recipes-devtools/python/python3-strict-rfc3339/0001-setup.py-use-vendored-_distutils.patch
new file mode 100644
index 00000000000..ba1c3d33637
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-strict-rfc3339/0001-setup.py-use-vendored-_distutils.patch
@@ -0,0 +1,27 @@
+From 857719e82daea0d85b734cac34cf569050724068 Mon Sep 17 00:00:00 2001
+From: Tim Orling <tim.orling@konsulko.com>
+Date: Sun, 20 Feb 2022 20:26:51 -0800
+Subject: [PATCH] setup.py: use vendored _distutils
+
+Deprecation warning of distutils is interferring with bdist_wheel build.
+
+For now, use the vendored setuptools._distutils.core.
+
+Upstream-Status: Pending [upstream appears unmaintained]
+
+Signed-off-by: Tim Orling <tim.orling@konsulko.com>
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 1bf87cf..a49fb8e 100644
+--- a/setup.py
++++ b/setup.py
+@@ -1,5 +1,5 @@
+ import os.path
+-from distutils.core import setup
++from setuptools._distutils.core import setup
+ 
+ readme_file = os.path.join(os.path.dirname(__file__), 'README.md')
+ readme = open(readme_file).read()
diff --git a/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb b/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb
index b8e929ef886..b592cb95d4a 100644
--- a/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb
+++ b/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb
@@ -3,9 +3,11 @@ HOMEPAGE = "https://pypi.org/project/strict-rfc3339/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8f0e2cd40e05189ec81232da84bd6e1a"
 
-SRC_URI[md5sum] = "4d9b635b4df885bc37bc1189d66c9abc"
+SRC_URI += "file://0001-setup.py-use-vendored-_distutils.patch"
 SRC_URI[sha256sum] = "5cad17bedfc3af57b399db0fed32771f18fc54bbd917e85546088607ac5e1277"
 
 inherit pypi setuptools3
 
+PIP_INSTALL_PACKAGE = "strict_rfc3339"
+
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-subunit_1.4.0.bb b/meta/recipes-devtools/python/python3-subunit_1.4.0.bb
index a06ded868f5..bc49a2b69ed 100644
--- a/meta/recipes-devtools/python/python3-subunit_1.4.0.bb
+++ b/meta/recipes-devtools/python/python3-subunit_1.4.0.bb
@@ -1,4 +1,17 @@
-inherit setuptools3
-require python-subunit.inc
+SUMMARY = "Python implementation of subunit test streaming protocol"
+HOMEPAGE = "https://pypi.org/project/python-subunit/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://README.rst;beginline=1;endline=20;md5=909c08e291647fd985fbe5d9836d51b6"
+
+PYPI_PACKAGE = "python-subunit"
+
+SRC_URI[sha256sum] = "042039928120fbf392e8c983d60f3d8ae1b88f90a9f8fd7188ddd9c26cad1e48"
+
+inherit pypi setuptools3
+
+PIP_INSTALL_PACKAGE = "python_subunit"
 
 RDEPENDS:${PN} = " python3-testtools"
+
+BBCLASSEXTEND = "nativesdk"
-- 
2.30.2


