Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B4B0F606E8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 09:21:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4M9LHsN012000
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 02:21:18 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Fri, 22 May 2015 02:21:17 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 22 May 2015 17:16:02 +0800
Message-ID: <1432286162-1948-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] openssl: drop the padlock_conf.patch
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
X-List-Received-Date: Fri, 22 May 2015 09:21:18 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

padlock_conf.patch will enable the padlock engine by default,
but this engine does not work on some 32bit machine, and lead
to openssl unable to work

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../openssl/openssl/debian1.0.2/padlock_conf.patch | 31 ----------------------
 .../recipes-connectivity/openssl/openssl_1.0.2a.bb |  1 -
 2 files changed, 32 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/debian1.0.2/padlock_conf.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/debian1.0.2/padlock_conf.patch b/meta/recipes-connectivity/openssl/openssl/debian1.0.2/padlock_conf.patch
deleted file mode 100644
index 61dcf45..0000000
--- a/meta/recipes-connectivity/openssl/openssl/debian1.0.2/padlock_conf.patch
+++ /dev/null
@@ -1,31 +0,0 @@
- 
-Upstream-Status: Backport [debian]
-
---- openssl/apps/openssl.cnf.orig	2012-06-06 00:45:56.000000000 +0200
-+++ openssl/apps/openssl.cnf	2012-06-06 00:46:46.000000000 +0200
-@@ -19,6 +19,8 @@
- # (Alternatively, use a configuration file that has only
- # X.509v3 extensions in its main [= default] section.)
- 
-+openssl_conf = openssl_def
-+
- [ new_oids ]
- 
- # We can add new OIDs in here for use by 'ca', 'req' and 'ts'.
-@@ -348,3 +350,16 @@
- 				# (optional, default: no)
- ess_cert_id_chain	= no	# Must the ESS cert id chain be included?
- 				# (optional, default: no)
-+
-+[openssl_def]
-+engines = engine_section
-+
-+[engine_section]
-+padlock = padlock_section
-+
-+[padlock_section]
-+soft_load=1
-+init=1
-+default_algorithms = ALL
-+dynamic_path=padlock
-+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2a.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2a.bb
index 6cf8049..dd97ea8 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2a.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2a.bb
@@ -18,7 +18,6 @@ SRC_URI += "file://configure-targets.patch \
             file://openssl-fix-link.patch \
             file://debian1.0.2/block_diginotar.patch \
             file://debian1.0.2/block_digicert_malaysia.patch \
-            file://debian1.0.2/padlock_conf.patch \
             file://debian/ca.patch \
             file://debian/c_rehash-compat.patch \
             file://debian/debian-targets.patch \
-- 
1.9.1


