Received: from david.siemens.de (david.siemens.de [192.35.17.14])
 by mx.groups.io with SMTP id smtpd.web12.9929.1607440588141259125
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 07:16:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.14, mailfrom: andrej.valek@siemens.com)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 0B8FGPZi013222
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Dec 2020 16:16:25 +0100
Received: from dev.vm6.ccp.siemens.com ([167.87.255.88])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id 0B8FGPwl022566;
	Tue, 8 Dec 2020 16:16:25 +0100
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id C38589508F2;
	Tue,  8 Dec 2020 16:16:24 +0100 (CET)
From: "Andrej Valek" <andrej.valek@siemens.com>
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org,
        Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][dunfell][PATCH v2] python3: fix CVE-2019-20907
Date: Tue,  8 Dec 2020 16:16:03 +0100
Message-Id: <20201208151603.5928-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201208083102.3259-1-andrej.valek@siemens.com>
References: <20201208083102.3259-1-andrej.valek@siemens.com>

- move fixing patch for CVE-2020-8492 to the right location

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 ...VE-2020-8492-Fix-AbstractBasicAuthHandler.patch |  0
 .../python/python3/CVE-2019-20907.patch            | 73 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.8.2.bb      |  1 +
 3 files changed, 74 insertions(+)
 rename meta/recipes-devtools/python/{files => python3}/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch (100%)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2019-20907.patch

diff --git a/meta/recipes-devtools/python/files/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch b/meta/recipes-devtools/python/python3/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch
similarity index 100%
rename from meta/recipes-devtools/python/files/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch
rename to meta/recipes-devtools/python/python3/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch
diff --git a/meta/recipes-devtools/python/python3/CVE-2019-20907.patch b/meta/recipes-devtools/python/python3/CVE-2019-20907.patch
new file mode 100644
index 0000000000..135196f964
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2019-20907.patch
@@ -0,0 +1,73 @@
+From a06a6bf4e67a50561f6d6fb33534df1d3035ea34 Mon Sep 17 00:00:00 2001
+From: Rishi <rishi_devan@mail.com>
+Date: Wed, 15 Jul 2020 13:51:00 +0200
+Subject: [PATCH] bpo-39017: Avoid infinite loop in the tarfile module
+ (GH-21454)
+
+Avoid infinite loop when reading specially crafted TAR files using the tarfile module
+(CVE-2019-20907).
+(cherry picked from commit 5a8d121a1f3ef5ad7c105ee378cc79a3eac0c7d4)
+
+Co-authored-by: Rishi <rishi_devan@mail.com>
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/c55479556db015f48fc8bbca17f64d3e65598559]
+CVE: CVE-2019-20907
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+---
+ Lib/tarfile.py                                    |   2 ++
+ Lib/test/recursion.tar                            | Bin 0 -> 516 bytes
+ Lib/test/test_tarfile.py                          |   7 +++++++
+ .../2020-07-12-22-16-58.bpo-39017.x3Cg-9.rst      |   1 +
+ 4 files changed, 10 insertions(+)
+ create mode 100644 Lib/test/recursion.tar
+ create mode 100644 Misc/NEWS.d/next/Library/2020-07-12-22-16-58.bpo-39017.x3Cg-9.rst
+
+diff --git a/Lib/tarfile.py b/Lib/tarfile.py
+index d31b9cbb51d65..7a69e1b1aa544 100755
+--- a/Lib/tarfile.py
++++ b/Lib/tarfile.py
+@@ -1241,6 +1241,8 @@ def _proc_pax(self, tarfile):
+ 
+             length, keyword = match.groups()
+             length = int(length)
++            if length == 0:
++                raise InvalidHeaderError("invalid header")
+             value = buf[match.end(2) + 1:match.start(1) + length - 1]
+ 
+             # Normally, we could just use "utf-8" as the encoding and "strict"
+diff --git a/Lib/test/recursion.tar b/Lib/test/recursion.tar
+new file mode 100644
+index 0000000000000000000000000000000000000000..b8237251964983f54ed1966297e887636cd0c5f4
+GIT binary patch
+literal 516
+zcmYdFPRz+kEn=W0Fn}74P8%Xw3X=l~85kIuo0>8xq$A1Gm}!7)KUsFc41m#O8A5+e
+I1_}|j06>QaCIA2c
+
+literal 0
+HcmV?d00001
+
+diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
+index 15324a4e48819..b512168d6ea87 100644
+--- a/Lib/test/test_tarfile.py
++++ b/Lib/test/test_tarfile.py
+@@ -397,6 +397,13 @@ def test_premature_end_of_archive(self):
+                 with self.assertRaisesRegex(tarfile.ReadError, "unexpected end of data"):
+                     tar.extractfile(t).read()
+ 
++    def test_length_zero_header(self):
++        # bpo-39017 (CVE-2019-20907): reading a zero-length header should fail
++        # with an exception
++        with self.assertRaisesRegex(tarfile.ReadError, "file could not be opened successfully"):
++            with tarfile.open(support.findfile('recursion.tar')) as tar:
++                pass
++
+ class MiscReadTestBase(CommonReadTest):
+     def requires_name_attribute(self):
+         pass
+diff --git a/Misc/NEWS.d/next/Library/2020-07-12-22-16-58.bpo-39017.x3Cg-9.rst b/Misc/NEWS.d/next/Library/2020-07-12-22-16-58.bpo-39017.x3Cg-9.rst
+new file mode 100644
+index 0000000000000..ad26676f8b856
+--- /dev/null
++++ b/Misc/NEWS.d/next/Library/2020-07-12-22-16-58.bpo-39017.x3Cg-9.rst
+@@ -0,0 +1 @@
++Avoid infinite loop when reading specially crafted TAR files using the tarfile module (CVE-2019-20907).
diff --git a/meta/recipes-devtools/python/python3_3.8.2.bb b/meta/recipes-devtools/python/python3_3.8.2.bb
index b4cce88e87..9eddad4ad4 100644
--- a/meta/recipes-devtools/python/python3_3.8.2.bb
+++ b/meta/recipes-devtools/python/python3_3.8.2.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-python3-Do-not-hardcode-lib-for-distutils.patch \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
            file://0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch \
+           file://CVE-2019-20907.patch \
            file://CVE-2020-14422.patch \
            file://CVE-2020-26116.patch \
            file://CVE-2020-27619.patch \
-- 
2.11.0

