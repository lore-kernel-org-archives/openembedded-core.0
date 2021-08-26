Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web08.34910.1630002699767915265
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 11:31:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dVRO5AgP;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id g14so3522402pfm.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Aug 2021 11:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iV+EbpiFbwpJj8xW+FrXDNyeku6NzU+Op7x9/B2QbFo=;
        b=dVRO5AgPv2OshBqmQD8+rMZE9NW9yuLm1Rv95yiLaM2a5EU5F7PHXDp/fqHJ5M32yC
         wAugj/i+ua+dCirXNzPQb4MJSGNw+WvDsj4ojXhPbOHhpR678608YcuN1jS3swYeQ2Hk
         0Mwn4ygBuGxCkwoMpEwjZSDagu0c0TpE+JBYOVJj5G8kQNtQp0c0y+zA05CdmFE2omwV
         2/5xR/lesr5E7vDiIVxsZKc6mltoBfBhb7tDGcYv5hac10hptBm2Jfr9XLNokCEht/mn
         6WkJoHIwZ/5hIqFPpxAPKJNXlDpt75vtH3T8VQULDQVkexXOYf7GN8h3OWH9jD1UsppA
         DsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iV+EbpiFbwpJj8xW+FrXDNyeku6NzU+Op7x9/B2QbFo=;
        b=XzrbbhQ1MrGL8PNMrDEGY0w3VaUgpeOGx/ldPfOSqYOK8D6O4gaHllTNQ3FQBXt4kn
         7lf4aVi+D467Oh0MfbbfDmUFtqcVBKa/FpN3VusWrQsBE4/ZdJjmnMBocKuLVDFHa5c7
         f5Iqt63i+JXnZCrX7Q/0dVBPuS+7VPhN6fxaKe4W/6FqcDsM1o+XhdDAEz5vhbFdzmzd
         aEREvpPFQ7u5iwe8Ua4c8ZXIFaXWSntAX3KdN7v9rjO25/J8YcBvXRpjRBvOcSXV/nnC
         OxS7c1cC7a3CGYg5hF+WRI4TcgrNVpi4qc0IRNWJVSwblcL+9uVoiihQgdKvrQDoOi1P
         KMTw==
X-Gm-Message-State: AOAM532kZl0s2XETS1trd9v/DGRj0U2hgUC377u2/fyVBlIUKwFM7JUq
	BV4ZMr+wZ/wEn0eX1TSJyjGvH8+Iplg=
X-Google-Smtp-Source: ABdhPJweQeBoR91lKSrx4C0OO/64M1e+6kjjXsFnT/etp3qH5/o+lxS0Hpj0ko59H6aYGM3tfqWjtg==
X-Received: by 2002:a62:38c9:0:b0:3f2:6ab2:1828 with SMTP id f192-20020a6238c9000000b003f26ab21828mr2990895pfa.37.1630002698630;
        Thu, 26 Aug 2021 11:31:38 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:1830::47f3])
        by smtp.gmail.com with ESMTPSA id d19sm9789874pjs.18.2021.08.26.11.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 11:31:38 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH] python3-pytest: allow python3-pluggy >=1.0.0
Date: Thu, 26 Aug 2021 18:31:28 +0000
Message-Id: <20210826183128.2629669-1-timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes ptest failures in python3-jinja2.

Backport patch from upstream, for now.

Modify upstream patch to use toml and not tomli.
We will add the new recipe for python3-tomli when
we have an upgrade to python3-pytest.

Remove this when we upgrade pytest to a version containing
the commit: fbba504cd5e1a74d528a41a11a7b82297cd7da74

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 .../0001-Allow-pluggy-1.0.patch               | 65 +++++++++++++++++++
 .../python/python3-pytest_6.2.4.bb            |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pytest/0001-Allow-pluggy-1.0.patch

diff --git a/meta/recipes-devtools/python/python3-pytest/0001-Allow-pluggy-1.0.patch b/meta/recipes-devtools/python/python3-pytest/0001-Allow-pluggy-1.0.patch
new file mode 100644
index 0000000000..175ef987ad
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pytest/0001-Allow-pluggy-1.0.patch
@@ -0,0 +1,65 @@
+From 637d4400d2bab0457688f950ea18cc4a04147c11 Mon Sep 17 00:00:00 2001
+From: Bruno Oliveira <nicoddemus@gmail.com>
+Date: Thu, 26 Aug 2021 09:26:51 -0300
+Subject: [PATCH] Allow pluggy >=1.0
+
+Now that pluggy 1.0 has been released, we can allow pluggy 1.0 with new pytest versions.
+
+Upstream-Status: Backport [commit: fbba504]
+
+Modify to use toml and not tomli. We will create a
+python3-tomli recipe when we do an python3-pytest
+upgrade.
+
+Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
+---
+ setup.cfg | 36 ++++++++++++++++++------------------
+ 1 file changed, 18 insertions(+), 18 deletions(-)
+
+diff --git a/setup.cfg b/setup.cfg
+index f919a9491..a8aeab813 100644
+--- a/setup.cfg
++++ b/setup.cfg
+@@ -32,24 +32,24 @@ project_urls =
+ 	Tracker=https://github.com/pytest-dev/pytest/issues
+ 
+ [options]
+-packages = 
+-	_pytest
+-	_pytest._code
+-	_pytest._io
+-	_pytest.assertion
+-	_pytest.config
+-	_pytest.mark
+-	pytest
+-install_requires = 
+-	attrs>=19.2.0
+-	iniconfig
+-	packaging
+-	pluggy>=0.12,<1.0.0a1
+-	py>=1.8.2
+-	toml
+-	atomicwrites>=1.0;sys_platform=="win32"
+-	colorama;sys_platform=="win32"
+-	importlib-metadata>=0.12;python_version<"3.8"
++packages =
++    _pytest
++    _pytest._code
++    _pytest._io
++    _pytest.assertion
++    _pytest.config
++    _pytest.mark
++    pytest
++install_requires =
++    attrs>=19.2.0
++    iniconfig
++    packaging
++    pluggy>=0.12,<2.0
++    py>=1.8.2
++    toml
++    atomicwrites>=1.0;sys_platform=="win32"
++    colorama;sys_platform=="win32"
++    importlib-metadata>=0.12;python_version<"3.8"
+ python_requires = >=3.6
+ package_dir = 
+ 	=src
diff --git a/meta/recipes-devtools/python/python3-pytest_6.2.4.bb b/meta/recipes-devtools/python/python3-pytest_6.2.4.bb
index f0fd30aeda..2e90acaf36 100644
--- a/meta/recipes-devtools/python/python3-pytest_6.2.4.bb
+++ b/meta/recipes-devtools/python/python3-pytest_6.2.4.bb
@@ -5,6 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b"
 
+SRC_URI += "file://0001-Allow-pluggy-1.0.patch"
 SRC_URI[sha256sum] = "50bcad0a0b9c5a72c8e4e7c9855a3ad496ca6a881a3641b4260605450772c54b"
 
 DEPENDS = "python3-setuptools-scm-native"
-- 
2.30.2

