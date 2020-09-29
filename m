Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.12633.1601349774555733482
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 20:22:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: qi.chen@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 08T3Mqix014847
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 20:22:53 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Mon, 28 Sep 2020 20:22:52 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 3/3] nfs-utils: fix configure error on some hosts
Date: Tue, 29 Sep 2020 11:22:16 +0800
Message-ID: <20200929032216.32161-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929032216.32161-1-Qi.Chen@windriver.com>
References: <20200929032216.32161-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

nfs-utils' configure.ac hardcodes the rpcgen's searching path. However,
on some hosts, rpcgen is missing but SDK provides one. We should avoid
the hardcoding so that nfs-utils could be built correctly under SDK.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...gure.ac-avoid-hardcoding-rpcgen-path.patch | 31 +++++++++++++++++++
 .../nfs-utils/nfs-utils_2.5.1.bb              |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-avoid-hardcoding-rpcgen-path.patch

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-avoid-hardcoding-rpcgen-path.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-avoid-hardcoding-rpcgen-path.patch
new file mode 100644
index 0000000000..5602e5be57
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-avoid-hardcoding-rpcgen-path.patch
@@ -0,0 +1,31 @@
+From b9049fbf051e559941298afd57ec43d6f6a5490d Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 29 Apr 2020 08:56:05 +0000
+Subject: [PATCH] configure.ac: avoid hardcoding rpcgen path
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ configure.ac | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index f9efdb7..8e8aeaa 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -152,8 +152,9 @@ AC_ARG_WITH(rpcgen,
+ 	rpcgen_cflags=-Werror=strict-prototypes
+ 	RPCGEN_PATH=
+ 	if test "$rpcgen_path" = "yes"; then
+-	    for p in /usr/local/bin/rpcgen /usr/bin/rpcgen /bin/rpcgen
+-	    do if test -f $p ; then RPCGEN_PATH=$p ; break; fi ; done
++	    #for p in /usr/local/bin/rpcgen /usr/bin/rpcgen /bin/rpcgen
++	    #do if test -f $p ; then RPCGEN_PATH=$p ; break; fi ; done
++	    RPCGEN_PATH=`which rpcgen`
+ 		if test -z "$RPCGEN_PATH"; then
+ 			AC_MSG_ERROR([Please install rpcgen or use --with-rpcgen])
+ 		fi
+-- 
+2.24.1
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.1.bb
index b8ad23a0d8..b06ce2d0af 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.1.bb
@@ -30,6 +30,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://bugfix-adjust-statd-service-name.patch \
            file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
            file://clang-warnings.patch \
+           file://0001-configure.ac-avoid-hardcoding-rpcgen-path.patch \
            "
 SRC_URI[sha256sum] = "0f1c8170e16a07d9836bbf0836d48d0c842b6f0e0e8b18748f099751851d30c4"
 
-- 
2.17.1

