Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.web11.31787.1611166807542364160
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jan 2021 10:20:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=ENWwBOrk;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2860; q=dns/txt; s=iport;
  t=1611166807; x=1612376407;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ztESBNGnWMD6yBkI1LxCBApqZDI43kL3JbGDSf0PtP0=;
  b=ENWwBOrkxLC0gAFyxd9AU/EbjOkfrFpxDLcUOvtlwtajgXd60CNdip4d
   8f0NSOmyxb3lZoL470i+dKQxBGAMpfEMNkKhbom+4MrOzj/dKrVM4X15f
   m/CN4iwau7KIydygWZu4velKf47KeEgMfcHPiu1V1oZPnRl6RX8ULvFWn
   0=;
X-IronPort-AV: E=Sophos;i="5.79,361,1602547200"; 
   d="scan'208";a="839385950"
Received: from rcdn-core-11.cisco.com ([173.37.93.147])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 20 Jan 2021 18:20:06 +0000
Received: from sjc-ads-8148.cisco.com (sjc-ads-8148.cisco.com [171.68.208.186])
	by rcdn-core-11.cisco.com (8.15.2/8.15.2) with ESMTPS id 10KIK45c021189
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 20 Jan 2021 18:20:05 GMT
Received: by sjc-ads-8148.cisco.com (Postfix, from userid 500841)
	id C56CFCC1251; Wed, 20 Jan 2021 10:20:03 -0800 (PST)
From: "Oleksiy Obitotskyy" <oobitots@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksiy Obitotskyy <oobitots@cisco.com>
Subject: [PATCH] dtc: improve reproducibility
Date: Wed, 20 Jan 2021 10:20:01 -0800
Message-Id: <20210120182001.20523-1-oobitots@cisco.com>
X-Mailer: git-send-email 2.26.2.Cisco
MIME-Version: 1.0
X-Outbound-SMTP-Client: 171.68.208.186, sjc-ads-8148.cisco.com
X-Outbound-Node: rcdn-core-11.cisco.com
Content-Transfer-Encoding: 8bit

Makefile override CFLAGS, so -fmacro/debug-prefix-map
optiions was omitted and binaries contains absolute
patch to sources.

Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
---
 meta/recipes-kernel/dtc/dtc.inc               | 10 +++++-
 ...-Makefile-to-add-CFLAGS-not-override.patch | 36 +++++++++++++++++++
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/dtc/dtc/0001-dtc-Fix-Makefile-to-add-CFLAGS-not-override.patch

diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc/dtc.inc
index 0650e3c82e..59badd4951 100644
--- a/meta/recipes-kernel/dtc/dtc.inc
+++ b/meta/recipes-kernel/dtc/dtc.inc
@@ -8,6 +8,14 @@ DEPENDS = "flex-native bison-native"
 SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git \
            file://make_install.patch \
            "
+
+def get_reproducibility_patches(d):
+     if bb.data.inherits_class("reproducible_build", d):
+        return "file://0001-dtc-Fix-Makefile-to-add-CFLAGS-not-override.patch"
+     return ""
+
+SRC_URI += "${@get_reproducibility_patches(d)}"
+
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 EXTRA_OEMAKE='NO_PYTHON=1 PREFIX="${prefix}" LIBDIR="${libdir}" DESTDIR="${D}"'
diff --git a/meta/recipes-kernel/dtc/dtc/0001-dtc-Fix-Makefile-to-add-CFLAGS-not-override.patch b/meta/recipes-kernel/dtc/dtc/0001-dtc-Fix-Makefile-to-add-CFLAGS-not-override.patch
new file mode 100644
index 0000000000..6ac83929b9
--- /dev/null
+++ b/meta/recipes-kernel/dtc/dtc/0001-dtc-Fix-Makefile-to-add-CFLAGS-not-override.patch
@@ -0,0 +1,36 @@
+From d684b031967ee7055d5719476ef578fe2c37401c Mon Sep 17 00:00:00 2001
+From: Oleksiy Obitotskyy <oobitots@cisco.com>
+Date: Thu, 24 Sep 2020 05:12:42 -0700
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
+index f729bf6..bb51a92 100644
+--- a/Makefile
++++ b/Makefile
+@@ -16,10 +16,10 @@ EXTRAVERSION =
+ LOCAL_VERSION =
+ CONFIG_LOCALVERSION =
+ 
+-CPPFLAGS = -I libfdt -I .
++CPPFLAGS += -I libfdt -I .
+ WARNINGS = -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
+ 	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls -Wshadow
+-CFLAGS = -g -Os $(SHAREDLIB_CFLAGS) -Werror $(WARNINGS) $(EXTRA_CFLAGS)
++CFLAGS += -g -Os $(SHAREDLIB_CFLAGS) -Werror $(WARNINGS) $(EXTRA_CFLAGS)
+ 
+ BISON = bison
+ LEX = flex
+-- 
+2.19.0.dirty
+
-- 
2.26.2.Cisco

