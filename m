Received: from mga01.intel.com (mga01.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.23762.1605705753366163822
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2020 05:22:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: CmYnooAwh0z36VU9dZqNJmkJ2cdKONVanXFNUtLl+WNuhQsVjn5yRh1pxjZE9yErOxPVMi7c3h
 RlI+CxwqKmqg==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="189188983"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; 
   d="scan'208";a="189188983"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 05:22:30 -0800
IronPort-SDR: BSTdTdqv/bVjfVPZ5yL6BlzG5/wbkqdexAwiDAPuADULe/ervPqFeZJIqmfDAOTrJh5R1HxGoX
 v6HeNyYz5BYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; 
   d="scan'208";a="534283541"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by fmsmga005.fm.intel.com with ESMTP; 18 Nov 2020 05:22:29 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] python3: fix CVE-2020-27619
Date: Wed, 18 Nov 2020 21:22:25 +0800
Message-Id: <20201118132227.48678-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201118132227.48678-1-chee.yang.lee@intel.com>
References: <20201118132227.48678-1-chee.yang.lee@intel.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../python/python3/CVE-2020-27619.patch       | 69 +++++++++++++++++++
 meta/recipes-devtools/python/python3_3.9.0.bb |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2020-27619.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2020-27619.patch b/meta/recipes-devtools/python/python3/CVE-2020-27619.patch
new file mode 100644
index 0000000000..b2053e7a47
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2020-27619.patch
@@ -0,0 +1,69 @@
+From b664a1df4ee71d3760ab937653b10997081b1794 Mon Sep 17 00:00:00 2001
+From: "Miss Skeleton (bot)" <31488909+miss-islington@users.noreply.github.com>
+Date: Tue, 6 Oct 2020 05:37:36 -0700
+Subject: [PATCH] bpo-41944: No longer call eval() on content received via HTTP
+ in the CJK codec tests (GH-22566)
+
+(cherry picked from commit 2ef5caa58febc8968e670e39e3d37cf8eef3cab8)
+
+Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/b664a1df4ee71d3760ab937653b10997081b1794]
+CVE: CVE-2020-27619
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ Lib/test/multibytecodec_support.py            | 22 +++++++------------
+ .../2020-10-05-17-43-46.bpo-41944.rf1dYb.rst  |  1 +
+ 2 files changed, 9 insertions(+), 14 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Tests/2020-10-05-17-43-46.bpo-41944.rf1dYb.rst
+
+diff --git a/Lib/test/multibytecodec_support.py b/Lib/test/multibytecodec_support.py
+index cca8af67d6d1d..f76c0153f5ecf 100644
+--- a/Lib/test/multibytecodec_support.py
++++ b/Lib/test/multibytecodec_support.py
+@@ -305,29 +305,23 @@ def test_mapping_file(self):
+             self._test_mapping_file_plain()
+ 
+     def _test_mapping_file_plain(self):
+-        unichrs = lambda s: ''.join(map(chr, map(eval, s.split('+'))))
++        def unichrs(s):
++            return ''.join(chr(int(x, 16)) for x in s.split('+'))
++
+         urt_wa = {}
+ 
+         with self.open_mapping_file() as f:
+             for line in f:
+                 if not line:
+                     break
+-                data = line.split('#')[0].strip().split()
++                data = line.split('#')[0].split()
+                 if len(data) != 2:
+                     continue
+ 
+-                csetval = eval(data[0])
+-                if csetval <= 0x7F:
+-                    csetch = bytes([csetval & 0xff])
+-                elif csetval >= 0x1000000:
+-                    csetch = bytes([(csetval >> 24), ((csetval >> 16) & 0xff),
+-                                    ((csetval >> 8) & 0xff), (csetval & 0xff)])
+-                elif csetval >= 0x10000:
+-                    csetch = bytes([(csetval >> 16), ((csetval >> 8) & 0xff),
+-                                    (csetval & 0xff)])
+-                elif csetval >= 0x100:
+-                    csetch = bytes([(csetval >> 8), (csetval & 0xff)])
+-                else:
++                if data[0][:2] != '0x':
++                    self.fail(f"Invalid line: {line!r}")
++                csetch = bytes.fromhex(data[0][2:])
++                if len(csetch) == 1 and 0x80 <= csetch[0]:
+                     continue
+ 
+                 unich = unichrs(data[1])
+diff --git a/Misc/NEWS.d/next/Tests/2020-10-05-17-43-46.bpo-41944.rf1dYb.rst b/Misc/NEWS.d/next/Tests/2020-10-05-17-43-46.bpo-41944.rf1dYb.rst
+new file mode 100644
+index 0000000000000..4f9782f1c85af
+--- /dev/null
++++ b/Misc/NEWS.d/next/Tests/2020-10-05-17-43-46.bpo-41944.rf1dYb.rst
+@@ -0,0 +1 @@
++Tests for CJK codecs no longer call ``eval()`` on content received via HTTP.
diff --git a/meta/recipes-devtools/python/python3_3.9.0.bb b/meta/recipes-devtools/python/python3_3.9.0.bb
index 8fe60ea016..ae9a974f04 100644
--- a/meta/recipes-devtools/python/python3_3.9.0.bb
+++ b/meta/recipes-devtools/python/python3_3.9.0.bb
@@ -29,6 +29,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Makefile-do-not-compile-.pyc-in-parallel.patch \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
            file://0001-Lib-sysconfig.py-use-libdir-values-from-configuratio.patch \
+           file://CVE-2020-27619.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.17.1

