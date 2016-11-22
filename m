Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D7D46719DC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 10:09:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uAMA9oLA009782
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 02:09:50 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.209) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 22 Nov 2016 02:09:49 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Nov 2016 18:10:33 +0800
Message-ID: <87627ca7e420aa246453d691b387db654be9ce69.1479809328.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1479809328.git.Qi.Chen@windriver.com>
References: <cover.1479809328.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] package.bbclass: support persistent /var/log
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
X-List-Received-Date: Tue, 22 Nov 2016 10:09:49 -0000
Content-Type: text/plain

Add a new file, fs-perms-persistent-log.txt, which treats /var/log
as a directory instead of a link.

Modify package.bbclass to use this file if VOLATILE_LOG_DIR is not set to "yes".

[YOCTO #6132]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/package.bbclass           |  2 +-
 meta/files/fs-perms-persistent-log.txt | 69 ++++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+), 1 deletion(-)
 create mode 100644 meta/files/fs-perms-persistent-log.txt

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index a6f0a7a..9a423f8 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -733,7 +733,7 @@ python fixup_perms () {
         bbpath = d.getVar('BBPATH', True)
         fs_perms_tables = d.getVar('FILESYSTEM_PERMS_TABLES', True)
         if not fs_perms_tables:
-            fs_perms_tables = 'files/fs-perms.txt'
+            fs_perms_tables = ['files/fs-perms-persistent-log.txt', 'files/fs-perms.txt'][d.getVar('VOLATILE_LOG_DIR', True) == 'yes']
         for conf_file in fs_perms_tables.split():
             str += " %s" % bb.utils.which(bbpath, conf_file)
         return str
diff --git a/meta/files/fs-perms-persistent-log.txt b/meta/files/fs-perms-persistent-log.txt
new file mode 100644
index 0000000..2487a68
--- /dev/null
+++ b/meta/files/fs-perms-persistent-log.txt
@@ -0,0 +1,69 @@
+# This file contains a list of files and directories with known permissions.
+# It is used by the packaging class to ensure that the permissions, owners and
+# group of listed files and directories are in sync across the system.
+#
+# The format of this file 
+#
+#<path>	<mode>	<uid>	<gid>	<walk>	<fmode>	<fuid>	<fgid>
+#
+# or
+#
+#<path> link <target>
+#
+# <path>: directory path
+# <mode>: mode for directory
+# <uid>:  uid for directory
+# <gid>:  gid for directory
+# <walk>: recursively walk the directory?  true or false
+# <fmode>: if walking, new mode for files
+# <fuid>:  if walking, new uid for files
+# <fgid>:  if walking, new gid for files
+# <target>: turn the directory into a symlink point to target
+#
+# in mode, uid or gid, a "-" means don't change any existing values
+#
+# /usr/src		0755	root	root	false	-	-	-
+# /usr/share/man	0755	root	root	true	0644	root	root
+
+# Note: all standard config directories are automatically assigned "0755 root root false - - -"
+
+# Documentation should always be corrected
+${mandir}		0755	root	root	true	0644	root	root
+${infodir}		0755	root	root	true	0644	root	root
+${docdir}		0755	root	root	true	0644	root	root
+${datadir}/gtk-doc	0755	root	root	true	0644	root	root
+
+# Fixup locales
+${datadir}/locale	0755	root	root	true	0644	root	root
+
+# Cleanup headers
+${includedir}		0755	root	root	true	0644	root	root
+${oldincludedir}	0755	root	root	true	0644	root	root
+
+# Cleanup debug src
+/usr/src/debug		0755	root	root	true	-	root	root
+
+# Items from base-files
+# Links
+${localstatedir}/run	link	/run
+${localstatedir}/lock	link	/run/lock
+${localstatedir}/tmp	link	volatile/tmp
+
+/home				0755	root	root	false - - -
+/srv				0755	root	root	false - - -
+${prefix}/src			0755	root	root	false - - -
+${localstatedir}/local		0755	root	root	false - - -
+
+# Special permissions from base-files
+# Set 1777
+/tmp				01777	root	root	false - - -
+${localstatedir}/volatile/tmp	01777	root	root	false - - -
+
+# Set 0700
+${ROOT_HOME}			0700	root	root	false - - -
+
+# Set 755-lsb
+/srv				0755	root	root	false - - -
+
+# Set 2775-lsb
+/var/mail			02775	root	mail	false - - -
-- 
1.9.1


