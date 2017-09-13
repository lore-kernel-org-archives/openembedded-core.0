Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D1F9577D6B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 22:46:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8DMk9Jq009392
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 15:46:09 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 13 Sep 2017 15:46:08 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Sep 2017 17:40:15 -0500
Message-ID: <1505342415-93152-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH v2] bitbake.conf: Add default FILESYSTEM_PERMS_TABLES
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
X-List-Received-Date: Wed, 13 Sep 2017 22:46:09 -0000
Content-Type: text/plain

If FILESYSTEM_PERMS_TABLES was not defined, the default was selected by the
packages.bbclass.  This made it difficult for a recipe or layer to 'append'
to the default.

Copy the default into the bitbake.conf, allowing future _append and += style
actions.

Default was remove from package.bbclass.  If a value is not set, only the
built-in per fixes will be used.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package.bbclass | 4 +---
 meta/conf/bitbake.conf       | 8 ++++++++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 7a62181..2053d46 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -737,9 +737,7 @@ python fixup_perms () {
     def get_fs_perms_list(d):
         str = ""
         bbpath = d.getVar('BBPATH')
-        fs_perms_tables = d.getVar('FILESYSTEM_PERMS_TABLES')
-        if not fs_perms_tables:
-            fs_perms_tables = 'files/fs-perms.txt' if oe.types.boolean(d.getVar('VOLATILE_LOG_DIR', True)) else 'files/fs-perms-persistent-log.txt'
+        fs_perms_tables = d.getVar('FILESYSTEM_PERMS_TABLES') or ""
         for conf_file in fs_perms_tables.split():
             str += " %s" % bb.utils.which(bbpath, conf_file)
         return str
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 444c53f..8fb596e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -330,6 +330,14 @@ FILE_DIRNAME = "${@os.path.dirname(d.getVar('FILE', False))}"
 # This default was only used for checking
 FILESEXTRAPATHS ?= "__default:"
 
+# The default list of fs-perms files to process.  If the list is empty only
+# the builtin definitions will be used.  Builtin definitions included:
+#  base_prefix, prefix, exec_prefix, base_bindir, base_sbindir, base_libdir,
+#  datadir, sysconfdir, servicedir, sharedstatedir, localstatedir, infodir,
+#  mandir, docdir, bindir, sbindir, libexecdir, libdir, includedir and
+#  oldincludedir
+FILESYSTEM_PERMS_TABLES ?= "${@'files/fs-perms.txt' if oe.types.boolean(d.getVar('VOLATILE_LOG_DIR', True)) else 'files/fs-perms-persistent-log.txt'}"
+
 ##################################################################
 # General work and output directories for the build system.
 ##################################################################
-- 
1.8.3.1


