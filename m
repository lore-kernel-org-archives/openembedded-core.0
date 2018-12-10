Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 90E7A6C0E1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2018 05:28:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.56,337,1539619200"; d="scan'208";a="49399773"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Dec 2018 13:28:02 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 1CEBE4B734BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2018 13:28:02 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Mon, 10 Dec 2018 13:28:05 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Dec 2018 22:26:20 +0800
Message-ID: <1544451980-56888-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: 1CEBE4B734BF.A9FF1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [thud][PATCH] createrepo-c: Fix setup of logging (log domains)
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
X-List-Received-Date: Mon, 10 Dec 2018 05:28:04 -0000
Content-Type: text/plain

New debug messages were added into GLib library. These messages come
from the "GLib" log domain and were not hidden in the standard and
quiet mode of the application.
This fix hides log messages regardless on source log domain.

Backport from 80810f04f2de6bae6e394f52ad9cdd2189862f74.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...etup-of-logging-log-domains-RhBug-1645897.patch | 72 ++++++++++++++++++++++
 .../createrepo-c/createrepo-c_git.bb               |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0001-Fix-setup-of-logging-log-domains-RhBug-1645897.patch

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Fix-setup-of-logging-log-domains-RhBug-1645897.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Fix-setup-of-logging-log-domains-RhBug-1645897.patch
new file mode 100644
index 0000000..38bcdf8
--- /dev/null
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Fix-setup-of-logging-log-domains-RhBug-1645897.patch
@@ -0,0 +1,72 @@
+From 80810f04f2de6bae6e394f52ad9cdd2189862f74 Mon Sep 17 00:00:00 2001
+From: Jaroslav Rohel <jrohel@redhat.com>
+Date: Fri, 9 Nov 2018 07:35:13 +0100
+Subject: [PATCH] Fix setup of logging (log domains) (RhBug:1645897)
+
+New debug messages were added into GLib library. These messages come
+from the "GLib" log domain and were not hidden in the standard and
+quiet mode of the application.
+This fix hides log messages regardless on source log domain.
+
+Upstream Status: Backport
+
+---
+ src/createrepo_shared.c | 19 ++++++-------------
+ src/misc.c              |  5 ++++-
+ 2 files changed, 10 insertions(+), 14 deletions(-)
+
+diff --git a/src/createrepo_shared.c b/src/createrepo_shared.c
+index 8a26787..7cb8ba8 100644
+--- a/src/createrepo_shared.c
++++ b/src/createrepo_shared.c
+@@ -270,24 +270,17 @@ cr_lock_repo(const gchar *repo_dir,
+ void
+ cr_setup_logging(gboolean quiet, gboolean verbose)
+ {
+-    g_log_set_default_handler (cr_log_fn, NULL);
+-
+     if (quiet) {
+         // Quiet mode
+-        GLogLevelFlags levels = G_LOG_LEVEL_MESSAGE | G_LOG_LEVEL_INFO |
+-                                G_LOG_LEVEL_DEBUG | G_LOG_LEVEL_WARNING;
+-        g_log_set_handler(NULL, levels, cr_null_log_fn, NULL);
+-        g_log_set_handler("C_CREATEREPOLIB", levels, cr_null_log_fn, NULL);
++        GLogLevelFlags hidden_levels = G_LOG_LEVEL_MESSAGE | G_LOG_LEVEL_INFO |
++                                       G_LOG_LEVEL_DEBUG | G_LOG_LEVEL_WARNING;
++        g_log_set_default_handler (cr_log_fn, GINT_TO_POINTER(hidden_levels));
+     } else if (verbose) {
+         // Verbose mode
+-        GLogLevelFlags levels = G_LOG_LEVEL_MESSAGE | G_LOG_LEVEL_INFO |
+-                                G_LOG_LEVEL_DEBUG | G_LOG_LEVEL_WARNING;
+-        g_log_set_handler(NULL, levels, cr_log_fn, NULL);
+-        g_log_set_handler("C_CREATEREPOLIB", levels, cr_log_fn, NULL);
++        g_log_set_default_handler (cr_log_fn, GINT_TO_POINTER(0));
+     } else {
+         // Standard mode
+-        GLogLevelFlags levels = G_LOG_LEVEL_DEBUG;
+-        g_log_set_handler(NULL, levels, cr_null_log_fn, NULL);
+-        g_log_set_handler("C_CREATEREPOLIB", levels, cr_null_log_fn, NULL);
++        GLogLevelFlags hidden_levels = G_LOG_LEVEL_DEBUG;
++        g_log_set_default_handler (cr_log_fn, GINT_TO_POINTER(hidden_levels));
+     }
+ }
+diff --git a/src/misc.c b/src/misc.c
+index 9937480..9549a44 100644
+--- a/src/misc.c
++++ b/src/misc.c
+@@ -912,8 +912,11 @@ void
+ cr_log_fn(const gchar *log_domain,
+           GLogLevelFlags log_level,
+           const gchar *message,
+-          G_GNUC_UNUSED gpointer user_data)
++          gpointer user_data)
+ {
++    gint hidden_log_levels = GPOINTER_TO_INT(user_data);
++    if (log_level & hidden_log_levels)
++        return;
+     switch(log_level) {
+         case G_LOG_LEVEL_ERROR:
+             if (log_domain) g_printerr("%s: ", log_domain);
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_git.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_git.bb
index 2960811..08766b3 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_git.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_git.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "git://github.com/rpm-software-management/createrepo_c \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            file://0001-Correctly-install-the-shared-library.patch \
+           file://0001-Fix-setup-of-logging-log-domains-RhBug-1645897.patch \
            "
 
 PV = "0.11.1+git${SRCPV}"
-- 
2.7.4




