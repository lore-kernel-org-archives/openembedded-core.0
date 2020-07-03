Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web12.964.1593789641925537179
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 08:20:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: lQoEacbhtet1M3mMUyljswlmmw3WpVRM4Rv4HBF15V2mVmNyZSSlxvTT5a9xuMa1y7cKTJWilg
 pBfZzgd2ZY9A==
X-IronPort-AV: E=McAfee;i="6000,8403,9671"; a="148680735"
X-IronPort-AV: E=Sophos;i="5.75,308,1589266800"; 
   d="scan'208";a="148680735"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2020 08:20:40 -0700
IronPort-SDR: gR6FsW5NnTbmlCm2MFiUPkDAzEacA3JDa43k6RZy77BSXn6rPYt7uMBro9q7Ouy/8JlHQXSTbT
 jX1UyB+oZefg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,308,1589266800"; 
   d="scan'208";a="426318411"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by orsmga004.jf.intel.com with ESMTP; 03 Jul 2020 08:20:39 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][zeus 1/2] python3: fix CVE-2020-14422
Date: Fri,  3 Jul 2020 23:20:37 +0800
Message-Id: <1593789638-86069-1-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../python/python3/CVE-2020-14422.patch            | 79 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.7.7.bb      |  3 +-
 2 files changed, 81 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2020-14422.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2020-14422.patch b/meta/recipes-devtools/python/python3/CVE-2020-14422.patch
new file mode 100644
index 0000000..31ad82d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2020-14422.patch
@@ -0,0 +1,79 @@
+From b98e7790c77a4378ec4b1c71b84138cb930b69b7 Mon Sep 17 00:00:00 2001
+From: Tapas Kundu <39723251+tapakund@users.noreply.github.com>
+Date: Wed, 1 Jul 2020 00:50:21 +0530
+Subject: [PATCH] [3.7] bpo-41004: Resolve hash collisions for IPv4Interface
+ and IPv6Interface (GH-21033) (GH-21231)
+
+CVE-2020-14422
+The __hash__() methods of classes IPv4Interface and IPv6Interface had issue
+of generating constant hash values of 32 and 128 respectively causing hash collisions.
+The fix uses the hash() function to generate hash values for the objects
+instead of XOR operation
+(cherry picked from commit b30ee26e366bf509b7538d79bfec6c6d38d53f28)
+
+Co-authored-by: Ravi Teja P <rvteja92@gmail.com>
+
+Signed-off-by: Tapas Kundu <tkundu@vmware.com>
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/b98e7790c77a4378ec4b1c71b84138cb930b69b7]
+CVE: CVE-2020-14422
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ Lib/ipaddress.py                                      |  4 ++--
+ Lib/test/test_ipaddress.py                            | 11 +++++++++++
+ .../Security/2020-06-29-16-02-29.bpo-41004.ovF0KZ.rst |  1 +
+ 3 files changed, 14 insertions(+), 2 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2020-06-29-16-02-29.bpo-41004.ovF0KZ.rst
+
+diff --git a/Lib/ipaddress.py b/Lib/ipaddress.py
+index 80249288d73ab..54882934c3dc1 100644
+--- a/Lib/ipaddress.py
++++ b/Lib/ipaddress.py
+@@ -1442,7 +1442,7 @@ def __lt__(self, other):
+             return False
+ 
+     def __hash__(self):
+-        return self._ip ^ self._prefixlen ^ int(self.network.network_address)
++        return hash((self._ip, self._prefixlen, int(self.network.network_address)))
+ 
+     __reduce__ = _IPAddressBase.__reduce__
+ 
+@@ -2088,7 +2088,7 @@ def __lt__(self, other):
+             return False
+ 
+     def __hash__(self):
+-        return self._ip ^ self._prefixlen ^ int(self.network.network_address)
++        return hash((self._ip, self._prefixlen, int(self.network.network_address)))
+ 
+     __reduce__ = _IPAddressBase.__reduce__
+ 
+diff --git a/Lib/test/test_ipaddress.py b/Lib/test/test_ipaddress.py
+index 455b893fb126f..1fb6a929dc2d9 100644
+--- a/Lib/test/test_ipaddress.py
++++ b/Lib/test/test_ipaddress.py
+@@ -2091,6 +2091,17 @@ def testsixtofour(self):
+                          sixtofouraddr.sixtofour)
+         self.assertFalse(bad_addr.sixtofour)
+ 
++    # issue41004 Hash collisions in IPv4Interface and IPv6Interface
++    def testV4HashIsNotConstant(self):
++        ipv4_address1 = ipaddress.IPv4Interface("1.2.3.4")
++        ipv4_address2 = ipaddress.IPv4Interface("2.3.4.5")
++        self.assertNotEqual(ipv4_address1.__hash__(), ipv4_address2.__hash__())
++
++    # issue41004 Hash collisions in IPv4Interface and IPv6Interface
++    def testV6HashIsNotConstant(self):
++        ipv6_address1 = ipaddress.IPv6Interface("2001:658:22a:cafe:200:0:0:1")
++        ipv6_address2 = ipaddress.IPv6Interface("2001:658:22a:cafe:200:0:0:2")
++        self.assertNotEqual(ipv6_address1.__hash__(), ipv6_address2.__hash__())
+ 
+ if __name__ == '__main__':
+     unittest.main()
+diff --git a/Misc/NEWS.d/next/Security/2020-06-29-16-02-29.bpo-41004.ovF0KZ.rst b/Misc/NEWS.d/next/Security/2020-06-29-16-02-29.bpo-41004.ovF0KZ.rst
+new file mode 100644
+index 0000000000000..f5a9db52fff52
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2020-06-29-16-02-29.bpo-41004.ovF0KZ.rst
+@@ -0,0 +1 @@
++CVE-2020-14422: The __hash__() methods of  ipaddress.IPv4Interface and ipaddress.IPv6Interface incorrectly generated constant hash values of 32 and 128 respectively. This resulted in always causing hash collisions. The fix uses hash() to generate hash values for the tuple of (address, mask length, network address).
diff --git a/meta/recipes-devtools/python/python3_3.7.7.bb b/meta/recipes-devtools/python/python3_3.7.7.bb
index bff84f6..946a604 100644
--- a/meta/recipes-devtools/python/python3_3.7.7.bb
+++ b/meta/recipes-devtools/python/python3_3.7.7.bb
@@ -23,12 +23,13 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch \
            file://0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch \
            file://0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch \
-	   file://0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch \
+    	   file://0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch \
 	   file://crosspythonpath.patch \
            file://reformat_sysconfig.py \
            file://0001-Use-FLAG_REF-always-for-interned-strings.patch \
            file://0001-test_locale.py-correct-the-test-output-format.patch \
            file://0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch \
+           file://CVE-2020-14422.patch \ 
            "
 
 SRC_URI_append_class-native = " \
-- 
2.7.4

