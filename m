Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.61462.1594051927038447905
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 09:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=n6czNm1d;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id x9so1852361plr.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2020 09:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=+o8caS+57LGMuESBZVrbLLUM0viXxJMx8dAK1vdjFFw=;
        b=n6czNm1dor+WV+vPjGz9St1x8/Uzn+oq58zQ1vPH/MHBkOzSkG9kb479lFsOjWa2bk
         NHi7Jo2n0pnvk91IoloKwBfHp+pwZsDvDftmjDdfMknsczD9PDhuE2JqoSfVhx0+RemT
         x/ubUEhsQuCTWXh5XOiHwQzJ7PevvjLZ+oohk07lZXEOkfwBiGKZjL4qOoJmGz6QxM7D
         xEgSBl3JBCPhYhbCXPoiwueFpieuMRYWKcHykTHeDh7yrLfZ3xSVegsNix4LMGEfy99v
         0WJ5tqIBPpWwiIc28bBaEgyxX3ZFq8TiNVhEUxzJXBn8HSJcO0l644AqoFr3GED1VL0G
         3tHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=+o8caS+57LGMuESBZVrbLLUM0viXxJMx8dAK1vdjFFw=;
        b=JE0jG5oTC6fjnRq/rvITPvr2hzMK/LRUm/A7DHWDf9rSfni8RwZ0EUbgUhu97X4vq6
         7pR07O+Z52yYXc9cNVbAbHYUTRAu/LhIO+sBy3v1TY9Ug6ePlN4O13cTzL5AJrUliZCr
         8eOEB2VbMxInYFGDhHP4uZkQSGDRUVw0Gie4jWmhgzc8ieHghXpdRKFl/G5nAZgvpW80
         kmy4MjdM/iR6o2+qFk8dwWhe0cxrJfYe+QCESamm0+wT9YEDyLq1UlzNj8eFUKl1ylPg
         MsOcUmCXpc5qP90T2XUTVPGDY0/ZCoT/gAC5uWr9dHekrm4v2gotBkBxSKyjyEdzXQN3
         Sa0w==
X-Gm-Message-State: AOAM532d64eGDW+1V8udH2Gx4m3mxaeNm9mNrfha09WWPgkfVJ1TL0NG
	I9//NwoBwsQnKZ64c3GDa++T365jcUxQjg==
X-Google-Smtp-Source: ABdhPJySESywCgPItZ+exRg78RWIaPmxeGLgglQbP6KNaSPwbOFhwdbpIhZkkYElRHNCZBXV5g6x1Q==
X-Received: by 2002:a17:902:eb54:: with SMTP id i20mr2123531pli.183.1594051926023;
        Mon, 06 Jul 2020 09:12:06 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i67sm18225811pfg.13.2020.07.06.09.12.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 09:12:05 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 25/25] python3: fix CVE-2020-14422
Date: Mon,  6 Jul 2020 06:10:27 -1000
Message-Id: <b1a18757d28891074e22e4be75287436cda0867a.1594050175.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594050175.git.steve@sakoman.com>
References: <cover.1594050175.git.steve@sakoman.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/python3/CVE-2020-14422.patch       | 77 +++++++++++++++++++
 meta/recipes-devtools/python/python3_3.8.2.bb |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2020-14422.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2020-14422.patch b/meta/recipes-devtools/python/python3/CVE-2020-14422.patch
new file mode 100644
index 0000000000..6889e46da9
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
index a4a16fd495..99d9f6748f 100644
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
2.17.1

