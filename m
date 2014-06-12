Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 8ADE565D70
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 15:49:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.01,465,1400018400"; d="scan'208";a="52769641"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 12 Jun 2014 17:49:31 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC22.usr.ingenico.loc (10.31.4.222) with Microsoft SMTP Server
	(TLS) id 14.2.318.1; Thu, 12 Jun 2014 17:49:30 +0200
Received: from u56.usr.ingenico.loc (10.23.7.56) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Thu, 12 Jun 2014 17:49:30 +0200
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Jun 2014 17:49:32 +0200
Message-ID: <1402588172-13738-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.9.2
MIME-Version: 1.0
Subject: [PATCH] native.bbclass: Properly define directories
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
X-List-Received-Date: Thu, 12 Jun 2014 15:49:39 -0000
Content-Type: text/plain

For most users this commit will have no effect. But if you come across the idea of giving
different names for paths, you'll get some troubles.

When a recipe inherit native, properly define bindir, sbindir, includedir, sysconfdir, datadir
(using xxxdir_native definitions from meta/conf/bitbake.conf).

For example, edit "${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}/quilt-native/temp/log.do_configure"
and see what are the arguments given by oe_runconf.

Notice that ${docdir}, ${mandir}, ${infodir}, ${localstatedir} have no associated _native definition.

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta/classes/native.bbclass | 7 ++++++-
 meta/conf/bitbake.conf      | 3 ++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 31f1c41..9dec318 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -77,7 +77,12 @@ base_prefix = "${STAGING_DIR_NATIVE}"
 prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
 exec_prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
 
-libdir = "${STAGING_DIR_NATIVE}${libdir_native}"
+bindir = "${STAGING_BINDIR_NATIVE}"
+sbindir = "${STAGING_SBINDIR_NATIVE}"
+libdir = "${STAGING_LIBDIR_NATIVE}"
+includedir = "${STAGING_INCDIR_NATIVE}"
+sysconfdir = "${STAGING_ETCDIR_NATIVE}"
+datadir = "${STAGING_DATADIR_NATIVE}"
 
 baselib = "lib"
 
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1d70d3c..50f5028 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -24,11 +24,11 @@ export base_libdir = "${base_prefix}/${baselib}"
 export nonarch_base_libdir = "${base_prefix}/lib"
 
 # Architecture independent paths
-export datadir = "${prefix}/share"
 export sysconfdir = "${base_prefix}/etc"
 export servicedir = "${base_prefix}/srv"
 export sharedstatedir = "${base_prefix}/com"
 export localstatedir = "${base_prefix}/var"
+export datadir = "${prefix}/share"
 export infodir = "${datadir}/info"
 export mandir = "${datadir}/man"
 export docdir = "${datadir}/doc"
@@ -358,6 +358,7 @@ STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${TARGET_ARCH}
 STAGING_LIBDIR_NATIVE = "${STAGING_DIR_NATIVE}${libdir_native}"
 STAGING_LIBEXECDIR_NATIVE = "${STAGING_DIR_NATIVE}${libexecdir_native}"
 STAGING_BASE_LIBDIR_NATIVE = "${STAGING_DIR_NATIVE}${base_libdir_native}"
+STAGING_SBINDIR_NATIVE = "${STAGING_DIR_NATIVE}${sbindir_native}"
 STAGING_INCDIR_NATIVE = "${STAGING_DIR_NATIVE}${includedir_native}"
 STAGING_ETCDIR_NATIVE = "${STAGING_DIR_NATIVE}${sysconfdir_native}"
 STAGING_DATADIR_NATIVE = "${STAGING_DIR_NATIVE}${datadir_native}"
-- 
2.0.0


