Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.6105.1627818099481499324
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Aug 2021 04:41:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 171BfaWJ032402
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Sun, 1 Aug 2021 04:41:36 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 171BfZGC018430
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 1 Aug 2021 04:41:35 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 1 Aug 2021 04:41:35 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 1 Aug 2021 04:41:34 -0700
From: "kai" <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] python3-pytest: display correct version info
Date: Sun, 1 Aug 2021 19:41:30 +0800
Message-ID: <20210801114130.1135-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It does not show correct version info of python3-pytest:

$ pip3 list | grep pytest
pytest             0.0.0

pytest requires setuptools-scm in setup.cfg. It could be met by adding
python3-setuptools-scm-native to dependency and then it will not
download egg file of setuptools-scm during do_compile any more. So
remove 0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
and depend on python3-setuptools-scm-native to make it show the correct
version info.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...he-setup_requires-for-setuptools-scm.patch | 36 -------------------
 .../python/python3-pytest_6.2.4.bb            |  4 +--
 2 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch

diff --git a/meta/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch b/meta/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
deleted file mode 100644
index 1abd531c62..0000000000
--- a/meta/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From ead04f2da75efeca3369feff6161ea4a8baecbc9 Mon Sep 17 00:00:00 2001
-From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
-Date: Wed, 28 Aug 2019 16:12:27 +0900
-Subject: [PATCH] setup.py: remove the setup_requires for setuptools-scm
-
-The setup_requires argument forces the download of the egg file for setuptools-scm
-during the do_compile phase.  This download is incompatible with the typical fetch
-and mirror structure.  The only usage of scm is the generation of the _version.py
-file and in the release tarball it is already correctly created
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Derek Straka <derek@asterius.io>
-
-Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
-
-Rebase for pytest 6.1.0.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
----
- setup.cfg | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/setup.cfg b/setup.cfg
-index 6ed0792..0137090 100644
---- a/setup.cfg
-+++ b/setup.cfg
-@@ -53,7 +53,6 @@ package_dir =
- 	=src
- setup_requires = 
- 	setuptools>=>=42.0
--	setuptools-scm>=3.4
- zip_safe = no
- 
- [options.entry_points]
diff --git a/meta/recipes-devtools/python/python3-pytest_6.2.4.bb b/meta/recipes-devtools/python/python3-pytest_6.2.4.bb
index fa43e6ebf0..6d514d17a2 100644
--- a/meta/recipes-devtools/python/python3-pytest_6.2.4.bb
+++ b/meta/recipes-devtools/python/python3-pytest_6.2.4.bb
@@ -5,10 +5,10 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b"
 
-SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch "
-
 SRC_URI[sha256sum] = "50bcad0a0b9c5a72c8e4e7c9855a3ad496ca6a881a3641b4260605450772c54b"
 
+DEPENDS = "python3-setuptools-scm-native"
+
 inherit update-alternatives pypi setuptools3
 
 RDEPENDS_${PN}_class-target += " \
-- 
2.17.1

