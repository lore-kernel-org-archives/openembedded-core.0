Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.web10.6275.1611232045632086611
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 04:27:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=eVDUuh31;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2762; q=dns/txt; s=iport;
  t=1611232045; x=1612441645;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0trhqh+KfZATZQFlx+4AHci+2wcjANw18yKWV8d9rx0=;
  b=eVDUuh3157BM876EaqkEvWuStYlTkAo7hU0ue/JRkmh13dH6Vdiw4fVQ
   AlNP0lu+D6tfvhVQ77zrT/00rElB0MqgFEbZphaAOwTKC53/WYxabqqFg
   1DMmfQf53VViQeTIdYCgKSb/2V2Bp2JgqNHgYz51kAjSvog/ka9EfLouI
   c=;
X-IronPort-AV: E=Sophos;i="5.79,363,1602547200"; 
   d="scan'208";a="630151057"
Received: from rcdn-core-11.cisco.com ([173.37.93.147])
  by alln-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 21 Jan 2021 12:27:24 +0000
Received: from sjc-ads-8148.cisco.com (sjc-ads-8148.cisco.com [171.68.208.186])
	by rcdn-core-11.cisco.com (8.15.2/8.15.2) with ESMTPS id 10LCRNUC028630
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 21 Jan 2021 12:27:23 GMT
Received: by sjc-ads-8148.cisco.com (Postfix, from userid 500841)
	id 2214CCC1251; Thu, 21 Jan 2021 04:27:23 -0800 (PST)
From: "Oleksiy Obitotskyy" <oobitots@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksiy Obitotskyy <oobitots@cisco.com>
Subject: [PATCH][V2] dtc: improve reproducibility
Date: Thu, 21 Jan 2021 04:27:21 -0800
Message-Id: <20210121122721.98421-1-oobitots@cisco.com>
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

