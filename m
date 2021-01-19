Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.web08.10736.1611060582389932432
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 04:49:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=ii4s33uB;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2684; q=dns/txt; s=iport;
  t=1611060582; x=1612270182;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6tTBZfZwSJCIV0ZgGzIJmFN0bqtlof3bAWb8+/nkT4o=;
  b=ii4s33uBaWgKO5w7FrtSGOmcYJbZoT65FJ5S0x0oU+fonEMTcmsGkKv9
   3aU8S4xq5myGyM+Erw+5nMoA5eZNaWy9AEJXpnkvSygdbve3ACLNIgl41
   ICRxBy3czV0EYh3YXYIzqLZyepyzqcGCP79omkNhT7Ujx75i4HQiN0nyY
   g=;
X-IronPort-AV: E=Sophos;i="5.79,358,1602547200"; 
   d="scan'208";a="647398514"
Received: from rcdn-core-12.cisco.com ([173.37.93.148])
  by alln-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 19 Jan 2021 12:49:41 +0000
Received: from sjc-ads-8148.cisco.com (sjc-ads-8148.cisco.com [171.68.208.186])
	by rcdn-core-12.cisco.com (8.15.2/8.15.2) with ESMTPS id 10JCnf4f028639
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 19 Jan 2021 12:49:41 GMT
Received: by sjc-ads-8148.cisco.com (Postfix, from userid 500841)
	id C5065CC1251; Tue, 19 Jan 2021 04:49:40 -0800 (PST)
From: "Oleksiy Obitotskyy" <oobitots@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksiy Obitotskyy <oobitots@cisco.com>
Subject: [PATCH] flex: Fix --noline option behavior
Date: Tue, 19 Jan 2021 04:49:38 -0800
Message-Id: <20210119124938.99101-1-oobitots@cisco.com>
X-Mailer: git-send-email 2.26.2.Cisco
MIME-Version: 1.0
X-Outbound-SMTP-Client: 171.68.208.186, sjc-ads-8148.cisco.com
X-Outbound-Node: rcdn-core-12.cisco.com
Content-Transfer-Encoding: 8bit

Option --noline or -L does not handled properly.
So generated code contains #line directives with
file absolute path and prevents to create
reproducible builds.

Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
---
 ...directives-if-gen_line_dirs-is-false.patch | 32 +++++++++++++++++++
 meta/recipes-devtools/flex/flex_2.6.4.bb      |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/flex/flex/0001-Emit-no-line-directives-if-gen_line_dirs-is-false.patch

diff --git a/meta/recipes-devtools/flex/flex/0001-Emit-no-line-directives-if-gen_line_dirs-is-false.patch b/meta/recipes-devtools/flex/flex/0001-Emit-no-line-directives-if-gen_line_dirs-is-false.patch
new file mode 100644
index 0000000000..230953cbde
--- /dev/null
+++ b/meta/recipes-devtools/flex/flex/0001-Emit-no-line-directives-if-gen_line_dirs-is-false.patch
@@ -0,0 +1,32 @@
+From 440f3f55739468cd26e22f31871eca8cbbd53294 Mon Sep 17 00:00:00 2001
+From: Oleksiy Obitotskyy <oobitots@cisco.com>
+Date: Wed, 6 Jan 2021 06:12:14 -0800
+Subject: [PATCH] Emit no #line directives if gen_line_dirs is false
+
+If we set --noline we should not print line directives.
+But setting --noline means gen_line_dirs is false.
+
+Upstream-Status: Submitted
+Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
+---
+ src/buf.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/buf.c b/src/buf.c
+index 185083c..4439e28 100644
+--- a/src/buf.c
++++ b/src/buf.c
+@@ -95,8 +95,8 @@ struct Buf *buf_linedir (struct Buf *buf, const char* filename, int lineno)
+     const char *src;
+     size_t tsz;
+ 
+-    if (gen_line_dirs)
+-	return buf;
++    if (!gen_line_dirs)
++        return buf;
+ 
+     tsz = strlen("#line \"\"\n")                +   /* constant parts */
+                2 * strlen (filename)            +   /* filename with possibly all backslashes escaped */
+-- 
+2.26.2.Cisco
+
diff --git a/meta/recipes-devtools/flex/flex_2.6.4.bb b/meta/recipes-devtools/flex/flex_2.6.4.bb
index 3d57572865..1d43d2228a 100644
--- a/meta/recipes-devtools/flex/flex_2.6.4.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://github.com/westes/flex/releases/download/v${PV}/flex-${PV}.ta
            ${@bb.utils.contains('PTEST_ENABLED', '1', '', 'file://disable-tests.patch', d)} \
            file://0001-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch \
            file://check-funcs.patch \
+           file://0001-Emit-no-line-directives-if-gen_line_dirs-is-false.patch \
            "
 
 SRC_URI[md5sum] = "2882e3179748cc9f9c23ec593d6adc8d"
-- 
2.26.2.Cisco

