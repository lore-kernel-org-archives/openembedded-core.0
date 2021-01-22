Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.web11.7655.1611316373857157440
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jan 2021 03:52:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@cisco.com header.s=iport header.b=DCcs27kE;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2873; q=dns/txt; s=iport;
  t=1611316373; x=1612525973;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ulglx2tNpzSSTMkF6HZtrJx16hpJjhRE6KfJnGgxQIs=;
  b=DCcs27kE2+GjY8OuFfk4oD30FOm0EED2Hl+obWxe3Y7Mg9etMfTBoPIc
   uhtC3PW1QL7ZuIIXCSFvaE/F9nS4DUsIIJSMtNUCemRGnxGIqirzUjJZj
   VPtj4k+Kdf12AKtpEMl2Xi7TwwZQjkLrUbUrySUwG8tppU0c3xaV6Elt6
   o=;
X-IronPort-AV: E=Sophos;i="5.79,366,1602547200"; 
   d="scan'208";a="649519521"
Received: from rcdn-core-9.cisco.com ([173.37.93.145])
  by alln-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 22 Jan 2021 11:52:53 +0000
Received: from sjc-ads-8148.cisco.com (sjc-ads-8148.cisco.com [171.68.208.186])
	by rcdn-core-9.cisco.com (8.15.2/8.15.2) with ESMTPS id 10MBqqMO025143
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 22 Jan 2021 11:52:52 GMT
Received: by sjc-ads-8148.cisco.com (Postfix, from userid 500841)
	id 40472CC1251; Fri, 22 Jan 2021 03:52:52 -0800 (PST)
From: "Oleksiy Obitotskyy" <oobitots@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksiy Obitotskyy <oobitots@cisco.com>
Subject: [PATCH][V3] dtc: improve reproducibility
Date: Fri, 22 Jan 2021 03:52:50 -0800
Message-Id: <20210122115250.107877-1-oobitots@cisco.com>
X-Mailer: git-send-email 2.26.2.Cisco
MIME-Version: 1.0
X-Outbound-SMTP-Client: 171.68.208.186, sjc-ads-8148.cisco.com
X-Outbound-Node: rcdn-core-9.cisco.com
Content-Transfer-Encoding: 8bit

Makefile override CFLAGS, so -fmacro/debug-prefix-map
optiions was omitted and binaries contains absolute
patch to sources.

Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
---
 V3 - update patch against master
 V2 - apply patch unconditionally
 V1 - apply patch only if reproducibility is turned on

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
index 0000000000..c2a3664b43
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
2.25.1

