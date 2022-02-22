Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 573A3C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 19:17:43 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web12.1872.1645557462352919935
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m9RBLebi;
 spf=pass (domain: gmail.com, ip: 209.85.210.179,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id l19so13076375pfu.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xNLWwM9nQTo2EyOg5vy/NihA9OtxCmsk83GuvHI3/Os=;
        b=m9RBLebiOmDv1rJfBqFrxFZJCYpslpPjgHFPm+dBWACik+kQ+hzNSXUZN2r6xo/wTK
         sAUaQf8pfi3gH9X6VjfbHOZ2qmUx5hv//I1rkfiz7WTXRAQl/5aGKv/e5W7UeA+eV68A
         0fGXP8dCd+x4r/T3C176cnZtnlKkl/R74D6okg4OG1mT8hiYzJK1tGFMXWNVxpAte+nw
         Og3JtiHFwu8dtTfsmYOPR1dab8w2zcSZwfELJnfdRnL4uR/lttvfBVvFcm8SE2UXfaPf
         CzrmqQ7WZABBLHFWtO2Dp//lmcb2z43I03D6KQvcc6TFEqHFM+t7+nGNa3Fqh4ZLuE9U
         0qoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xNLWwM9nQTo2EyOg5vy/NihA9OtxCmsk83GuvHI3/Os=;
        b=myNJLzOkUOAZf2zgxPeg04+2Qgqj2Xg9gGTrR+5kiw/w26bCGxSIwtfoSE7z6ZrqFr
         i7FrWiUakS+tJdSVTx7QKSPwprKwEfUkivWRGhWvgnaE7ZBLvI96jBMNacAa16td4b+c
         YbG/4ARyrEEQQmwh9hoFEe3OrpUqm8JB7GXgKaT3hsDxDewwn723//pfEXT5TjATA+k2
         Zisk1ggQnNK9FPZxcHhoho1f9vWqJ89KmhrWFehTf29NIR5o+YhdX+nat3pkwyertOw8
         u1ntUOdyljgYh1CvQRj2FWVwiJFhcoehCXvEGq6+Zu3qXH3o92Au0WLK/nmwt34nO8ik
         vJIw==
X-Gm-Message-State: AOAM532taOFz550Q+gD32wOs86+gdDDqAN1Bqg0V3EIEULnaUy4vuSEe
	T/D+Y88bTJFEF7ErGC9gZ+fdX930973LnA==
X-Google-Smtp-Source: 
 ABdhPJwcF6y0g696Y0sjzTKEAqrE2ntxeD9BCFN458IOQBRA65i9cE+QU9YK96GKRC1MzTMU5+p2qA==
X-Received: by 2002:a63:b20:0:b0:373:9e9e:86c3 with SMTP id
 32-20020a630b20000000b003739e9e86c3mr20347516pgl.55.1645557461308;
        Tue, 22 Feb 2022 11:17:41 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d208:bddf:2b06:2b5a])
        by smtp.gmail.com with ESMTPSA id
 z13sm18402700pfe.20.2022.02.22.11.17.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 11:17:40 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 23/32] python3-subunit: merge inc; set PIP_INSTALL_PACKAGE
Date: Tue, 22 Feb 2022 11:16:49 -0800
Message-Id: 
 <de53b5ecf796820b2417879934a519196004a3b2.1645557032.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645557032.git.tim.orling@konsulko.com>
References: <cover.1645557032.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 19:17:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162214

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


