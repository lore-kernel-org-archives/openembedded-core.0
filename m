Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.6924.1593768727200070900
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 02:32:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: 6cXPlz/6+mnSUxBw1o1c3Ybmj7d4hBqtv5ptYTpwytI4vWk1QUVhN338TPU57/Jh3+G05Dvaal
 SLpBmuxUyegA==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="146210844"
X-IronPort-AV: E=Sophos;i="5.75,307,1589266800"; 
   d="scan'208";a="146210844"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2020 02:32:07 -0700
IronPort-SDR: 53bvk0aIZEit/FwqJnm7n0mRDhlv1n8JcP1YFJNP7dxuiean44aK/YksfczKE/WpZQv5V/U5cq
 KEtgpuz9VE1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,307,1589266800"; 
   d="scan'208";a="426243699"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by orsmga004.jf.intel.com with ESMTP; 03 Jul 2020 02:32:06 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell 2/2] python3: fix CVE-2020-14422
Date: Fri,  3 Jul 2020 17:32:04 +0800
Message-Id: <1593768724-36791-2-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593768724-36791-1-git-send-email-chee.yang.lee@intel.com>
References: <1593768724-36791-1-git-send-email-chee.yang.lee@intel.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../python/python3/CVE-2020-14422.patch            | 77 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.8.2.bb      |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2020-14422.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2020-14422.patch b/meta/recipes-devtools/python/python3/CVE-2020-14422.patch
new file mode 100644
index 0000000..6889e46
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2020-14422.patch
@@ -0,0 +1,77 @@
+From dc8ce8ead182de46584cc1ed8a8c51d48240cbd5 Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Mon, 29 Jun 2020 11:12:50 -0700
+Subject: [PATCH] bpo-41004: Resolve hash collisions for IPv4Interface and
+ IPv6Interface (GH-21033)
+
+The __hash__() methods of classes IPv4Interface and IPv6Interface had issue
+of generating constant hash values of 32 and 128 respectively causing hash collisions.
+The fix uses the hash() function to generate hash values for the objects
+instead of XOR operation
+(cherry picked from commit b30ee26e366bf509b7538d79bfec6c6d38d53f28)
+
+Co-authored-by: Ravi Teja P <rvteja92@gmail.com>
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/dc8ce8ead182de46584cc1ed8a8c51d48240cbd5]
+CVE: CVE-2020-14422
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ Lib/ipaddress.py                                     |  4 ++--
+ Lib/test/test_ipaddress.py                           | 12 ++++++++++++
+ .../2020-06-29-16-02-29.bpo-41004.ovF0KZ.rst         |  1 +
+ 3 files changed, 15 insertions(+), 2 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2020-06-29-16-02-29.bpo-41004.ovF0KZ.rst
+
+diff --git a/Lib/ipaddress.py b/Lib/ipaddress.py
+index 873c7644081af..a3a04f7f4b309 100644
+--- a/Lib/ipaddress.py
++++ b/Lib/ipaddress.py
+@@ -1370,7 +1370,7 @@ def __lt__(self, other):
+             return False
+ 
+     def __hash__(self):
+-        return self._ip ^ self._prefixlen ^ int(self.network.network_address)
++        return hash((self._ip, self._prefixlen, int(self.network.network_address)))
+ 
+     __reduce__ = _IPAddressBase.__reduce__
+ 
+@@ -2017,7 +2017,7 @@ def __lt__(self, other):
+             return False
+ 
+     def __hash__(self):
+-        return self._ip ^ self._prefixlen ^ int(self.network.network_address)
++        return hash((self._ip, self._prefixlen, int(self.network.network_address)))
+ 
+     __reduce__ = _IPAddressBase.__reduce__
+ 
+diff --git a/Lib/test/test_ipaddress.py b/Lib/test/test_ipaddress.py
+index de77111705b69..2eba740e5e7a4 100644
+--- a/Lib/test/test_ipaddress.py
++++ b/Lib/test/test_ipaddress.py
+@@ -2053,6 +2053,18 @@ def testsixtofour(self):
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
++
+ 
+ if __name__ == '__main__':
+     unittest.main()
+diff --git a/Misc/NEWS.d/next/Security/2020-06-29-16-02-29.bpo-41004.ovF0KZ.rst b/Misc/NEWS.d/next/Security/2020-06-29-16-02-29.bpo-41004.ovF0KZ.rst
+new file mode 100644
+index 0000000000000..1380b31fbe9f4
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2020-06-29-16-02-29.bpo-41004.ovF0KZ.rst
+@@ -0,0 +1 @@
++The __hash__() methods of  ipaddress.IPv4Interface and ipaddress.IPv6Interface incorrectly generated constant hash values of 32 and 128 respectively. This resulted in always causing hash collisions. The fix uses hash() to generate hash values for the tuple of (address, mask length, network address).
diff --git a/meta/recipes-devtools/python/python3_3.8.2.bb b/meta/recipes-devtools/python/python3_3.8.2.bb
index a4a16fd..99d9f67 100644
--- a/meta/recipes-devtools/python/python3_3.8.2.bb
+++ b/meta/recipes-devtools/python/python3_3.8.2.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-python3-Do-not-hardcode-lib-for-distutils.patch \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
            file://0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch \
+           file://CVE-2020-14422.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.7.4

