Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.713.1616629923407514924
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 16:52:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=howzIV89;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1616629923;
  x=1648165923;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pe0nLEejBRogN7w8rWUF3yGjYddcy+SIuzY4NrYqZYA=;
  b=howzIV897RrDMbz0Mq194jxupQnxoNM+jIYDuh5oZZI2unl1+rprzZMe
   8YPUStiaIByKEBK4KVav1OnCz8jtgdAkG5ozw39tyawMUmsBnJ+WHb/i8
   pegyDfb+jv17ZyuX0oZVL+KT+7V4EveTxAT0ynefRrtZpF10i2GfpSWwg
   7xxQJ2GkalswIWCF3pEpM0adUJY7RM0CEjMFizYVnlAtPh9RUzvY9s3mB
   I9u90bB3DyUMDqdomA8nMpI+BMWcH5f69ePbUutFW/3AoBqxi35sl0QU4
   17X1R+5qAgvXwdfzEd5ZA9lcedaejNYKAaocfTORDSlPea7H54yTnm5IG
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] util-linux, util-linux-uuid: Move license information to the recipes
Date: Thu, 25 Mar 2021 00:49:42 +0100
Message-ID: <20210324234942.1218-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The license information for util-linux and util-linux-uuid are quite
different. Move the relevant parts from util-linux.inc to the respective
recipe.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../util-linux/util-linux-uuid_2.36.2.bb      |  4 ++++
 meta/recipes-core/util-linux/util-linux.inc   | 20 -------------------
 .../util-linux/util-linux_2.36.2.bb           | 17 ++++++++++++++++
 3 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb b/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb
index 65e4d23b7e..577e55df86 100644
--- a/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb
+++ b/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb
@@ -3,6 +3,10 @@
 
 require util-linux.inc
 
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://libuuid/COPYING;md5=6d2cafc999feb2c2de84d4d24b23290c \
+                    file://Documentation/licenses/COPYING.BSD-3-Clause;md5=58dcd8452651fc8b07d1f65ce07ca8af"
+
 inherit autotools gettext pkgconfig
 
 S = "${WORKDIR}/util-linux-${PV}"
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 4031c586c9..0f50c7f66f 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -6,26 +6,6 @@ disk partitioning, kernel message management, filesystem creation, and system lo
 
 SECTION = "base"
 
-LICENSE = "GPLv2+ & LGPLv2.1+ & BSD-3-Clause & BSD-4-Clause"
-LICENSE_${PN}-libblkid = "LGPLv2.1+"
-LICENSE_${PN}-libfdisk = "LGPLv2.1+"
-LICENSE_${PN}-libmount = "LGPLv2.1+"
-LICENSE_${PN}-libsmartcols = "LGPLv2.1+"
-LICENSE_${PN}-libuuid = "BSD-3-Clause"
-
-LIC_FILES_CHKSUM = "file://README.licensing;md5=0fd5c050c6187d2bf0a4492b7f4e33da \
-                    file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://Documentation/licenses/COPYING.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://Documentation/licenses/COPYING.LGPL-2.1-or-later;md5=4fbd65380cdd255951079008b364516c \
-                    file://Documentation/licenses/COPYING.BSD-3-Clause;md5=58dcd8452651fc8b07d1f65ce07ca8af \
-                    file://Documentation/licenses/COPYING.BSD-4-Clause-UC;md5=263860f8968d8bafa5392cab74285262 \
-                    file://libuuid/COPYING;md5=6d2cafc999feb2c2de84d4d24b23290c \
-                    file://libmount/COPYING;md5=7c7e39fb7d70ffe5d693a643e29987c2 \
-                    file://libblkid/COPYING;md5=693bcbbe16d3a4a4b37bc906bc01cc04 \
-                    file://libfdisk/COPYING;md5=693bcbbe16d3a4a4b37bc906bc01cc04 \
-                    file://libsmartcols/COPYING;md5=693bcbbe16d3a4a4b37bc906bc01cc04 \
-"
-
 FILESEXTRAPATHS_prepend := "${THISDIR}/util-linux:"
 MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 BPN = "util-linux"
diff --git a/meta/recipes-core/util-linux/util-linux_2.36.2.bb b/meta/recipes-core/util-linux/util-linux_2.36.2.bb
index 50a70cd452..767d35ccb1 100644
--- a/meta/recipes-core/util-linux/util-linux_2.36.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.36.2.bb
@@ -1,5 +1,22 @@
 require util-linux.inc
 
+LICENSE = "GPLv2+ & LGPLv2.1+ & BSD-3-Clause & BSD-4-Clause"
+LICENSE_${PN}-libblkid = "LGPLv2.1+"
+LICENSE_${PN}-libfdisk = "LGPLv2.1+"
+LICENSE_${PN}-libmount = "LGPLv2.1+"
+LICENSE_${PN}-libsmartcols = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://README.licensing;md5=0fd5c050c6187d2bf0a4492b7f4e33da \
+                    file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://Documentation/licenses/COPYING.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://Documentation/licenses/COPYING.LGPL-2.1-or-later;md5=4fbd65380cdd255951079008b364516c \
+                    file://Documentation/licenses/COPYING.BSD-3-Clause;md5=58dcd8452651fc8b07d1f65ce07ca8af \
+                    file://Documentation/licenses/COPYING.BSD-4-Clause-UC;md5=263860f8968d8bafa5392cab74285262 \
+                    file://libmount/COPYING;md5=7c7e39fb7d70ffe5d693a643e29987c2 \
+                    file://libblkid/COPYING;md5=693bcbbe16d3a4a4b37bc906bc01cc04 \
+                    file://libfdisk/COPYING;md5=693bcbbe16d3a4a4b37bc906bc01cc04 \
+                    file://libsmartcols/COPYING;md5=693bcbbe16d3a4a4b37bc906bc01cc04 \
+"
+
 #gtk-doc is not enabled as it requires xmlto which requires util-linux
 inherit autotools gettext manpages pkgconfig systemd update-alternatives python3-dir bash-completion ptest
 DEPENDS = "libcap-ng ncurses virtual/crypt zlib util-linux-uuid"
