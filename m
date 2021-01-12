Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.2742.1610413395090463369
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jan 2021 17:03:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,339,1602518400"; 
   d="scan'208";a="103379075"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 12 Jan 2021 09:03:02 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id B366F4CE602C
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Jan 2021 09:02:56 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 12 Jan 2021 09:02:57 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] socat: upgrade 1.7.3.4 ->1.7.4.0
Date: Tue, 12 Jan 2021 09:02:52 +0800
Message-ID: <1610413372-17701-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: B366F4CE602C.A21C7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Add 0001-Fix-bug-for-length-of-int64-and-uint64-in-arch32.patch
to fix bug for length of int64 and uint64 in arch32.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...length-of-int64-and-uint64-in-arch32.patch | 40 +++++++++++++++++++
 .../{socat_1.7.3.4.bb => socat_1.7.4.0.bb}    |  7 ++--
 2 files changed, 44 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-connectivity/socat/socat/0001-Fix-bug-for-length-of-int64-and-uint64-in-arch32.patch
 rename meta/recipes-connectivity/socat/{socat_1.7.3.4.bb => socat_1.7.4.0.bb} (86%)

diff --git a/meta/recipes-connectivity/socat/socat/0001-Fix-bug-for-length-of-int64-and-uint64-in-arch32.patch b/meta/recipes-connectivity/socat/socat/0001-Fix-bug-for-length-of-int64-and-uint64-in-arch32.patch
new file mode 100644
index 0000000000..5b7d3692d7
--- /dev/null
+++ b/meta/recipes-connectivity/socat/socat/0001-Fix-bug-for-length-of-int64-and-uint64-in-arch32.patch
@@ -0,0 +1,40 @@
+From 5796ae42979a9fcee83d94bd79c7d9f78e95d90e Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@cn.fujitsu.com>
+Date: Fri, 8 Jan 2021 19:44:03 +0900
+Subject: [PATCH] Fix bug for length of int64 and uint64 in arch32.
+
+The length of int64 and uint64 is set incorrectly,
+error message "out of range" will be reported
+
+Upsteam-Status: Pending
+
+Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
+---
+ compat.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/compat.h b/compat.h
+index 3bc010d..5a3ed08 100644
+--- a/compat.h
++++ b/compat.h
+@@ -134,6 +134,8 @@ typedef int sig_atomic_t;
+ #    define F_uint64_t "%u"
+ #  elif HAVE_BASIC_UINT64_T==6
+ #    define F_uint64_t "%lu"
++#  elif HAVE_BASIC_UINT64_T==8
++#    define F_uint64_t "%llu"
+ #  else
+ #    error "HAVE_BASIC_UINT64_T is out of range:" HAVE_BASIC_UINT64_T
+ #  endif
+@@ -176,6 +178,8 @@ typedef int sig_atomic_t;
+ #    define F_int64_t "%d"
+ #  elif HAVE_BASIC_INT64_T==5
+ #    define F_int64_t "%l"
++#  elif HAVE_BASIC_INT64_T==7
++#    define F_int64_t "%lld"
+ #  else
+ #    error "HAVE_BASIC_INT64_T is out of range:" HAVE_BASIC_INT64_T
+ #  endif
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/socat/socat_1.7.3.4.bb b/meta/recipes-connectivity/socat/socat_1.7.4.0.bb
similarity index 86%
rename from meta/recipes-connectivity/socat/socat_1.7.3.4.bb
rename to meta/recipes-connectivity/socat/socat_1.7.4.0.bb
index f3f569d262..7ba900ad9d 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.3.4.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.4.0.bb
@@ -7,13 +7,14 @@ SECTION = "console/network"
 
 LICENSE = "GPL-2.0-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://README;beginline=257;endline=287;md5=338c05eadd013872abb1d6e198e10a3f"
+                    file://README;beginline=257;endline=287;md5=82520b052f322ac2b5b3dfdc7c7eea86"
 
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
+           file://0001-Fix-bug-for-length-of-int64-and-uint64-in-arch32.patch \
 "
 
-SRC_URI[md5sum] = "3cca4f8cd9d2d1caabd9cc099451bac9"
-SRC_URI[sha256sum] = "972374ca86f65498e23e3259c2ee1b8f9dbeb04d12c2a78c0c9b5d1cb97dfdfc"
+SRC_URI[md5sum] = "334c7f3ab56a254226055ccd0ada58ff"
+SRC_URI[sha256sum] = "c8273b30e933be0ad8d509ae75e19ecedf1a60081bb942ed36f2dd8950de3d58"
 
 inherit autotools
 
-- 
2.25.1



