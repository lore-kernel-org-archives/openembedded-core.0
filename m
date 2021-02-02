Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.48154.1612244094073717358
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 21:34:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: c9ShAULQ+v+bJhXilXyNbJglX5Qey8G3+9wioD7xquMrEI7pU2vglbjzSpaqjlx8jMroyWfvZe
 iREq796IkEOQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="180876964"
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="180876964"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 21:34:39 -0800
IronPort-SDR: TISeAO5RAZmpeA+ZGrU7/Me7HeOluVqn4PdmIP586ujP4fycuszLOPqW3ut+PMUXMcHWh7P+Gb
 UOZEdAR7VHWA==
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="370361041"
Received: from ajayap1x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.184.137])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 21:34:38 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 22/25] dtc: improve reproducibility
Date: Tue,  2 Feb 2021 13:34:05 +0800
Message-Id: <eff9b64843f6e257a93200c030c24c0cfac64d5d.1612243805.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612243805.git.anuj.mittal@intel.com>
References: <cover.1612243805.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksiy Obitotskyy <oobitots@cisco.com>

Makefile override CFLAGS, so -fmacro/debug-prefix-map
optiions was omitted and binaries contains absolute
patch to sources.

(From OE-Core rev: b58e808a087bbc0a5abd78fd34bb6f1c0c93ba25)

Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 21e70c8a7213fae25a38ff7e4a8316a42130d24f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/dtc/dtc.inc               |  2 ++
 ...-Makefile-to-add-CFLAGS-not-override.patch | 36 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-kernel/dtc/dtc/0001-dtc-Fix-Makefile-to-add-CFLAGS-not-override.patch

diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc/dtc.inc
index 0650e3c82e..5da6c24fbf 100644
--- a/meta/recipes-kernel/dtc/dtc.inc
+++ b/meta/recipes-kernel/dtc/dtc.inc
@@ -7,7 +7,9 @@ DEPENDS = "flex-native bison-native"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git \
            file://make_install.patch \
+           file://0001-dtc-Fix-Makefile-to-add-CFLAGS-not-override.patch \
            "
+
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 EXTRA_OEMAKE='NO_PYTHON=1 PREFIX="${prefix}" LIBDIR="${libdir}" DESTDIR="${D}"'
diff --git a/meta/recipes-kernel/dtc/dtc/0001-dtc-Fix-Makefile-to-add-CFLAGS-not-override.patch b/meta/recipes-kernel/dtc/dtc/0001-dtc-Fix-Makefile-to-add-CFLAGS-not-override.patch
new file mode 100644
index 0000000000..a2deb12d4b
--- /dev/null
+++ b/meta/recipes-kernel/dtc/dtc/0001-dtc-Fix-Makefile-to-add-CFLAGS-not-override.patch
@@ -0,0 +1,36 @@
+From f0119060ef1b9bd80e2cae487df1e4aedffb0e9b Mon Sep 17 00:00:00 2001
+From: Oleksiy Obitotskyy <oobitots@cisco.com>
+Date: Fri, 22 Jan 2021 09:12:48 +0200
+Subject: [PATCH] dtc: Fix Makefile to add CFLAGS not override
+
+Makefile override CFLAGS not extend them, so some of them
+missing. Sources builds out of kernel tree and probably not all
+options could be used (?). We need at least -fmacro-prefix-map/
+debug-prefix-map to eliminate absolute path in binaries.
+
+Upstream-Status: Pending
+Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 35d936f..b5b13cf 100644
+--- a/Makefile
++++ b/Makefile
+@@ -20,10 +20,10 @@ CONFIG_LOCALVERSION =
+ # See libfdt_internal.h for details
+ ASSUME_MASK ?= 0
+ 
+-CPPFLAGS = -I libfdt -I . -DFDT_ASSUME_MASK=$(ASSUME_MASK)
++CPPFLAGS += -I libfdt -I . -DFDT_ASSUME_MASK=$(ASSUME_MASK)
+ WARNINGS = -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
+ 	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls -Wshadow
+-CFLAGS = -g -Os $(SHAREDLIB_CFLAGS) -Werror $(WARNINGS) $(EXTRA_CFLAGS)
++CFLAGS += -g -Os $(SHAREDLIB_CFLAGS) -Werror $(WARNINGS) $(EXTRA_CFLAGS)
+ 
+ BISON = bison
+ LEX = flex
+-- 
+2.25.1
+
-- 
2.29.2

