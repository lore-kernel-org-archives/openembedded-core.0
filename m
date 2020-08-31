Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.49777.1598864926321267196
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2020 02:08:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: yi.zhao@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 07V98EhB008133
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2020 02:08:35 -0700
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 31 Aug
 2020 02:08:04 -0700
From: "Yi Zhao" <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] glib-networking: add ptest
Date: Mon, 31 Aug 2020 17:08:01 +0800
Message-ID: <20200831090801.17033-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Content-Type: text/plain

Results:
$ ./run-ptest
Running test: glib-networking/connection-gnutls.test
[snip]
PASS: glib-networking/connection-gnutls.test
Running test: glib-networking/file-database-gnutls.test
[snip]
PASS: glib-networking/file-database-gnutls.test
Running test: glib-networking/certificate-gnutls.test
[snip]
PASS: glib-networking/certificate-gnutls.test
SUMMARY: total=3; passed=3; skipped=0; failed=0; user=0.2s; system=0.0s; maxrss=12896

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-core/glib-networking/glib-networking/run-ptest | 3 +++
 .../recipes-core/glib-networking/glib-networking_2.64.3.bb | 7 +++++--
 2 files changed, 8 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/glib-networking/glib-networking/run-ptest

diff --git a/meta/recipes-core/glib-networking/glib-networking/run-ptest b/meta/recipes-core/glib-networking/glib-networking/run-ptest
new file mode 100644
index 0000000000..6d520f94f6
--- /dev/null
+++ b/meta/recipes-core/glib-networking/glib-networking/run-ptest
@@ -0,0 +1,3 @@
+#! /bin/sh
+
+gnome-desktop-testing-runner glib-networking
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.64.3.bb b/meta/recipes-core/glib-networking/glib-networking_2.64.3.bb
index c34ae508f6..074389f552 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.64.3.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.64.3.bb
@@ -12,16 +12,19 @@ DEPENDS = "glib-2.0"
 SRC_URI[archive.md5sum] = "eb382907ec941fe2fb1a9676b75acf7a"
 SRC_URI[archive.sha256sum] = "937a06b124052813bfc0b0b86bff42016ff01067582e1aca65bb6dbe0845a168"
 
-PACKAGECONFIG ??= "gnutls"
+PACKAGECONFIG ??= "gnutls ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 
 PACKAGECONFIG[gnutls] = "-Dgnutls=enabled,-Dgnutls=disabled,gnutls"
 PACKAGECONFIG[openssl] = "-Dopenssl=enabled,-Dopenssl=disabled,openssl"
 PACKAGECONFIG[libproxy] = "-Dlibproxy=enabled,-Dlibproxy=disabled,libproxy"
+PACKAGECONFIG[tests] = "-Dinstalled_tests=true,-Dinstalled_tests=false"
 
 EXTRA_OEMESON = "-Dgnome_proxy=disabled"
 
 GNOMEBASEBUILDCLASS = "meson"
-inherit gnomebase gettext upstream-version-is-even gio-module-cache
+inherit gnomebase gettext upstream-version-is-even gio-module-cache ptest-gnome
+
+SRC_URI += "file://run-ptest"
 
 FILES_${PN} += "\
                 ${libdir}/gio/modules/libgio*.so \
-- 
2.17.1

