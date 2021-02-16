Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.8993.1613487701828545338
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 07:01:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: gLWaQALRMTW+lY8dkKy6ZObQ7TGnTb+B1AWqH6U7l26p+E+FqKlNFyPP7rYuoGgyzvcDYp9YbE
 HJZqZI+Tp0gg==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="244382481"
X-IronPort-AV: E=Sophos;i="5.81,183,1610438400"; 
   d="scan'208";a="244382481"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 07:01:40 -0800
IronPort-SDR: pHr9CZFxqWf4V5njzLn/PIwY1259HP6/rvL4wvs0myyxx1PrMAf3mRyg/l7wkfxeNpkbh+T0jM
 gLWZLuEn07RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,183,1610438400"; 
   d="scan'208";a="580524870"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by orsmga005.jf.intel.com with ESMTP; 16 Feb 2021 07:01:39 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell v2] sudo: 1.8.31 -> 1.8.32
Date: Tue, 16 Feb 2021 23:01:39 +0800
Message-Id: <20210216150139.421-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Lee Chee Yang <chee.yang.lee@intel.com>

release notes:
https://www.sudo.ws/legacy.html#1.8.32

updates include fixes for
CVE-2021-23239
CVE-2021-23240

Also backport patch to fix build error with musl

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-extended/sudo/sudo.inc           |  2 +-
 ...Fix-includes-when-building-with-musl.patch | 29 +++++++++++++++++++
 .../sudo/{sudo_1.8.31.bb => sudo_1.8.32.bb}   |  5 ++--
 3 files changed, 33 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/sudo/sudo/0001-Fix-includes-when-building-with-musl.patch
 rename meta/recipes-extended/sudo/{sudo_1.8.31.bb => sudo_1.8.32.bb} (89%)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 5d27d46928..aeedfc1a23 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD & Zlib"
-LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=4d1b44b1576eea036d78b8cc961aa93d \
+LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=07966675feaddba70cc812895b248230 \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=46;md5=03e35317699ba00b496251e0dfe9f109 \
                     file://lib/util/reallocarray.c;beginline=3;endline=15;md5=397dd45c7683e90b9f8bf24638cf03bf \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=004d7d2866ba1f5b41174906849d2e0f \
diff --git a/meta/recipes-extended/sudo/sudo/0001-Fix-includes-when-building-with-musl.patch b/meta/recipes-extended/sudo/sudo/0001-Fix-includes-when-building-with-musl.patch
new file mode 100644
index 0000000000..6ee2d5c11e
--- /dev/null
+++ b/meta/recipes-extended/sudo/sudo/0001-Fix-includes-when-building-with-musl.patch
@@ -0,0 +1,29 @@
+From f4e9e4337f8844d199515ff2b762c914dd254cbd Mon Sep 17 00:00:00 2001
+From: Dan Robertson <dan@dlrobertson.com>
+Date: Sat, 16 May 2020 00:12:44 +0000
+Subject: [PATCH] Fix includes when building with musl
+
+Include sys/types.h for mode_t and id_t in sudo_debug.h
+
+Upstream-Status: Backport [https://github.com/sudo-project/sudo/commit/f4e9e4337f8844d199515ff2b762c914dd254cbd]
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ include/sudo_debug.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/sudo_debug.h b/include/sudo_debug.h
+index 180f2096f..0124b0b19 100644
+--- a/include/sudo_debug.h
++++ b/include/sudo_debug.h
+@@ -25,6 +25,7 @@
+ #else
+ # include "compat/stdbool.h"
+ #endif
++#include <sys/types.h>
+ #include "sudo_queue.h"
+ 
+ /*
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/sudo/sudo_1.8.31.bb b/meta/recipes-extended/sudo/sudo_1.8.32.bb
similarity index 89%
rename from meta/recipes-extended/sudo/sudo_1.8.31.bb
rename to meta/recipes-extended/sudo/sudo_1.8.32.bb
index 39d8817c32..8d16ec2538 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.31.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.32.bb
@@ -3,12 +3,13 @@ require sudo.inc
 SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-Include-sys-types.h-for-id_t-definition.patch \
+           file://0001-Fix-includes-when-building-with-musl.patch \
            "
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[md5sum] = "ce17ff6e72a70f8d5dabba8abf3cd2de"
-SRC_URI[sha256sum] = "7ea8d97a3cee4c844e0887ea7a1bd80eb54cc98fd77966776cb1a80653ad454f"
+SRC_URI[md5sum] = "a7318202ba391079a0e32933f0fb8bd6"
+SRC_URI[sha256sum] = "5ce3c18c5efbecd5437a0945f314f1822423eaf9a2d7eb7ecf80857bc32246c5"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.17.1

