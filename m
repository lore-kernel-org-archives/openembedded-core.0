Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.8713.1586926075147492047
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2020 21:47:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: yi.zhao@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 03F4lXXn032623
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2020 21:47:43 -0700
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 14 Apr
 2020 21:47:22 -0700
From: "Yi Zhao" <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] cups: add volatiles files to create /var/log/cups
Date: Wed, 15 Apr 2020 12:47:20 +0800
Message-ID: <20200415044720.27993-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Content-Type: text/plain

Add volatiles files to create /var/log/cups directory rather than create
it directly when do_install.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-extended/cups/cups.inc                 | 12 +++++++++++-
 meta/recipes-extended/cups/cups/cups-volatiles.conf |  1 +
 meta/recipes-extended/cups/cups/volatiles.99_cups   |  2 ++
 3 files changed, 14 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/cups/cups/cups-volatiles.conf
 create mode 100644 meta/recipes-extended/cups/cups/volatiles.99_cups

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index c5a60bde12..e389d8a2da 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -12,7 +12,9 @@ SRC_URI = "https://github.com/apple/cups/releases/download/v${PV}/${BP}-source.t
            file://0001-use-echo-only-in-init.patch \
            file://0002-don-t-try-to-run-generated-binaries.patch \
            file://0003-cups_1.4.6.bb-Fix-build-on-ppc64.patch \
-           file://0004-cups-fix-multilib-install-file-conflicts.patch\
+           file://0004-cups-fix-multilib-install-file-conflicts.patch \
+           file://volatiles.99_cups \
+           file://cups-volatiles.conf \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/apple/cups/releases"
@@ -67,6 +69,7 @@ do_install () {
 
 	# Remove /var/run from package as cupsd will populate it on startup
 	rm -fr ${D}/${localstatedir}/run
+	rm -fr ${D}/${localstatedir}/log
 	rmdir ${D}/${libexecdir}/${BPN}/driver
 
 	# Fix the pam configuration file permissions
@@ -78,6 +81,13 @@ do_install () {
 	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','false','true',d)}; then
 	    rm -rf ${D}${sysconfdir}/init.d/
 	    rm -rf ${D}${sysconfdir}/rc*
+	    install -d ${D}${sysconfdir}/tmpfiles.d
+	    install -m 0644 ${WORKDIR}/cups-volatiles.conf \
+		    ${D}${sysconfdir}/tmpfiles.d/cups.conf
+	else
+	    install -d ${D}${sysconfdir}/default/volatiles
+	    install -m 0644 ${WORKDIR}/volatiles.99_cups \
+		    ${D}${sysconfdir}/default/volatiles/99_cups
 	fi
 }
 
diff --git a/meta/recipes-extended/cups/cups/cups-volatiles.conf b/meta/recipes-extended/cups/cups/cups-volatiles.conf
new file mode 100644
index 0000000000..0ede78e1c8
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/cups-volatiles.conf
@@ -0,0 +1 @@
+d  /var/log/cups 0755 root root -
diff --git a/meta/recipes-extended/cups/cups/volatiles.99_cups b/meta/recipes-extended/cups/cups/volatiles.99_cups
new file mode 100644
index 0000000000..cc0e19e4c8
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/volatiles.99_cups
@@ -0,0 +1,2 @@
+# <type> <owner> <group> <mode> <path> <linksource>
+d root root 0755 /var/log/cups none
-- 
2.17.1

