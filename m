Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A103378EEC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 15:31:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7RFVXb3006563
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 27 Aug 2018 08:31:33 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 27 Aug 2018 08:31:32 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 27 Aug 2018 23:31:27 +0800
Message-ID: <1535383888-28979-2-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1535383888-28979-1-git-send-email-hongxu.jia@windriver.com>
References: <1535383888-28979-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] bind: improve reproducibility
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Aug 2018 15:31:32 -0000
Content-Type: text/plain

- Tweak var-DST_OPENSSL_LIBS assignment in configure.in, it is
  helpful to fix build path issue in isc-config.sh

- `named/lwresd -V' and start log hide build options which expose
  build path directories.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...igure.in-remove-useless-L-use_openssl-lib.patch | 32 ++++++++++++++++++++
 ...lwresd-V-and-start-log-hide-build-options.patch | 34 ++++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.11.4.bb      |  2 ++
 3 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/0001-configure.in-remove-useless-L-use_openssl-lib.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch

diff --git a/meta/recipes-connectivity/bind/bind/0001-configure.in-remove-useless-L-use_openssl-lib.patch b/meta/recipes-connectivity/bind/bind/0001-configure.in-remove-useless-L-use_openssl-lib.patch
new file mode 100644
index 0000000..871bb2a
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/0001-configure.in-remove-useless-L-use_openssl-lib.patch
@@ -0,0 +1,32 @@
+From 950867d9fd3f690e271c8c807b6eed144b2935b2 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 27 Aug 2018 15:00:51 +0800
+Subject: [PATCH] configure.in: remove useless `-L$use_openssl/lib'
+
+Since `--with-openssl=${STAGING_DIR_HOST}${prefix}' is used in bind recipe,
+the `-L$use_openssl/lib' has a hardcoded suffix, removing it is harmless
+and helpful for clean up host build path in isc-config.sh
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.in b/configure.in
+index 54efc55..76ac0eb 100644
+--- a/configure.in
++++ b/configure.in
+@@ -1691,7 +1691,7 @@ If you don't want OpenSSL, use --without-openssl])
+ 				fi
+ 				;;
+ 			*)
+-				DST_OPENSSL_LIBS="-L$use_openssl/lib -lcrypto"
++				DST_OPENSSL_LIBS="-lcrypto"
+ 				;;
+ 			esac
+ 		fi
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
new file mode 100644
index 0000000..75908aa
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -0,0 +1,34 @@
+From a3af4a405baf5ff582e82aaba392dd9667d94bdc Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 27 Aug 2018 21:24:20 +0800
+Subject: [PATCH] `named/lwresd -V' and start log hide build options
+
+The build options expose build path directories, so hide them.
+[snip]
+$ named -V
+|built by make with *** (options are hidden)
+[snip]
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ bin/named/include/named/globals.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bin/named/include/named/globals.h b/bin/named/include/named/globals.h
+index ba3457e..7741da7 100644
+--- a/bin/named/include/named/globals.h
++++ b/bin/named/include/named/globals.h
+@@ -68,7 +68,7 @@ EXTERN const char *		ns_g_version		INIT(VERSION);
+ EXTERN const char *		ns_g_product		INIT(PRODUCT);
+ EXTERN const char *		ns_g_description	INIT(DESCRIPTION);
+ EXTERN const char *		ns_g_srcid		INIT(SRCID);
+-EXTERN const char *		ns_g_configargs		INIT(CONFIGARGS);
++EXTERN const char *		ns_g_configargs		INIT("*** (options are hidden)");
+ EXTERN const char *		ns_g_builder		INIT(BUILDER);
+ EXTERN in_port_t		ns_g_port		INIT(0);
+ EXTERN isc_dscp_t		ns_g_dscp		INIT(-1);
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/bind/bind_9.11.4.bb b/meta/recipes-connectivity/bind/bind_9.11.4.bb
index 7522fdb..d27068c 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.4.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.4.bb
@@ -17,6 +17,8 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
            file://0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch \
            file://0001-lib-dns-gen.c-fix-too-long-error.patch \
+           file://0001-configure.in-remove-useless-L-use_openssl-lib.patch \
+           file://0001-named-lwresd-V-and-start-log-hide-build-options.patch \
 "
 
 SRC_URI[md5sum] = "9b4834d78f30cdb796ce437262272a36"
-- 
2.7.4


