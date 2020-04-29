Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.1722.1588142208208004535
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2020 23:36:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 03T6akgX011740
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2020 23:36:47 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Tue, 28 Apr 2020 23:36:45 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] iputils: Initialize libgcrypt
Date: Wed, 29 Apr 2020 14:36:44 +0800
Message-ID: <20200429063644.46588-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Initialize libgcrypt on first use otherwise
there comes below warning when check the status
of the ninfod.service.
 # systemctl status ninfod.service
 * ninfod.service - Respond to IPv6 Node Information Queries
 Loaded: loaded (/lib/systemd/system/ninfod.service; enabled; vendor preset: enabled)
 Active: active (running) since Wed 2020-04-29 05:18:21 UTC; 36s ago
 Docs: man:ninfod(8)
 Main PID: 347 (ninfod)
 Tasks: 1 (limit: 9382)
 Memory: 1.2M
 CGroup: /system.slice/ninfod.service
 `-347 /sbin/ninfod -d

 Apr 29 05:18:21 intel-x86-64 systemd[1]: Started Respond to IPv6 Node Information Queries.
 Apr 29 05:18:24 intel-x86-64 ninfod[347]: Libgcrypt warning: missing initialization - please fix the application

Reference: https://salsa.debian.org/apt-team/apt/-/commit/4f489a8c7954cbbc9613e6b671c8efe87b9ced8c

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../0001-iputils-Initialize-libgcrypt.patch   | 55 +++++++++++++++++++
 .../iputils/iputils_s20190709.bb              |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-extended/iputils/iputils/0001-iputils-Initialize-libgcrypt.patch

diff --git a/meta/recipes-extended/iputils/iputils/0001-iputils-Initialize-libgcrypt.patch b/meta/recipes-extended/iputils/iputils/0001-iputils-Initialize-libgcrypt.patch
new file mode 100644
index 0000000000..b56804cebe
--- /dev/null
+++ b/meta/recipes-extended/iputils/iputils/0001-iputils-Initialize-libgcrypt.patch
@@ -0,0 +1,55 @@
+From 8576e0c218634e6f7ed1b6ff02fa164fb0c75f86 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 29 Apr 2020 03:50:32 +0000
+Subject: [PATCH] iputils_md5dig.h: Initialize libgcrypt
+
+Initialize libgcrypt on first use otherwise
+there comes below warning when check the status
+of the ninfod.service.
+ # systemctl status ninfod.service
+ * ninfod.service - Respond to IPv6 Node Information Queries
+ Loaded: loaded (/lib/systemd/system/ninfod.service; enabled; vendor preset: enabled)
+ Active: active (running) since Wed 2020-04-29 05:18:21 UTC; 36s ago
+ Docs: man:ninfod(8)
+ Main PID: 347 (ninfod)
+ Tasks: 1 (limit: 9382)
+ Memory: 1.2M
+ CGroup: /system.slice/ninfod.service
+ `-347 /sbin/ninfod -d
+
+ Apr 29 05:18:21 intel-x86-64 systemd[1]: Started Respond to IPv6 Node Information Queries.
+ Apr 29 05:18:24 intel-x86-64 ninfod[347]: Libgcrypt warning: missing initialization - please fix the application
+
+Upstream-Status: Inappropriate [the upstream avoids linking to crypto libraries in
+                   commit 214ed83 common: copy md5 implementation to iputils project]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ iputils_md5dig.h | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/iputils_md5dig.h b/iputils_md5dig.h
+index bfa7f02..3cc3fbf 100644
+--- a/iputils_md5dig.h
++++ b/iputils_md5dig.h
+@@ -24,8 +24,17 @@ typedef struct {
+ 	gcry_md_hd_t dig;
+ } iputils_md5dig_ctx;
+ 
++void maybeInit()
++{
++	if (!gcry_control(GCRYCTL_INITIALIZATION_FINISHED_P))
++	{
++		gcry_control(GCRYCTL_INITIALIZATION_FINISHED, 0);
++	}
++}
++
+ static void iputils_md5dig_init(iputils_md5dig_ctx *ctx)
+ {
++	maybeInit();
+ 	if (gcry_md_open(&ctx->dig, GCRY_MD_MD5, 0) != GPG_ERR_NO_ERROR)
+ 		abort();
+ 	return;
+-- 
+2.24.1
+
diff --git a/meta/recipes-extended/iputils/iputils_s20190709.bb b/meta/recipes-extended/iputils/iputils_s20190709.bb
index 2aed6b56ca..545f3d5e87 100644
--- a/meta/recipes-extended/iputils/iputils_s20190709.bb
+++ b/meta/recipes-extended/iputils/iputils_s20190709.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/iputils/iputils \
            file://0001-ninfod-change-variable-name-to-avoid-colliding-with-.patch \
            file://0001-ninfod-fix-systemd-Documentation-url-error.patch \
            file://0001-rarpd-rdisc-Drop-PrivateUsers.patch \
+           file://0001-iputils-Initialize-libgcrypt.patch \
            "
 SRCREV = "13e00847176aa23683d68fce1d17ffb523510946"
 
-- 
2.24.1

