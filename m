Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 37C3F736B6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Apr 2015 12:10:36 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 01 Apr 2015 05:09:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,503,1422950400"; d="scan'208";a="673736251"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 01 Apr 2015 05:09:24 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 633256A408D;
	Wed,  1 Apr 2015 05:09:01 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Apr 2015 15:09:18 +0300
Message-Id: <1427890158-11104-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] createrepo: Implement --dbpath command line option
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
X-List-Received-Date: Wed, 01 Apr 2015 12:10:41 -0000

--dbpath option can be used in cases where users don't want
createrepo to use system rpm db to avoid possible collisiouns
with other programs.

For bitbake builds it would be possible to specify different
databases even for every createrepo run. Considering that rootfs
builds can run multiple createrepo in parallel, it can help to avoid
race conditions caused by accessing or creating the same rpm database
by multiple createrepo instances at the same time.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 .../createrepo/createrepo/createrepo-dbpath.patch  | 61 ++++++++++++++++++++++
 .../createrepo/createrepo_0.4.11.bb                |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-support/createrepo/createrepo/createrepo-dbpath.patch

diff --git a/meta/recipes-support/createrepo/createrepo/createrepo-dbpath.patch b/meta/recipes-support/createrepo/createrepo/createrepo-dbpath.patch
new file mode 100644
index 0000000..7275598
--- /dev/null
+++ b/meta/recipes-support/createrepo/createrepo/createrepo-dbpath.patch
@@ -0,0 +1,61 @@
+createrepo: Implement --dbpath command line option
+
+--dbpath option allows to specify path to the directory
+with rpm database. By default createrepo uses or creates
+rpm database in /var/lib/rpm/
+
+Upstream-Status: Pending
+
+Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
+
+--- createrepo-0.4.11.orig/genpkgmetadata.py 2015-03-30 22:18:19.904000000 +0300
++++ createrepo-0.4.11/genpkgmetadata.py 2015-03-30 22:28:49.208000000 +0300
+@@ -65,6 +65,7 @@
+      -p, --pretty = output xml files in pretty format.
+      --update = update existing metadata (if present)
+      -d, --database = generate the sqlite databases.
++     --dbpath <dir> = specify path to rpm db directory.
+     """)
+ 
+     sys.exit(retval)
+@@ -72,10 +73,13 @@
+ class MetaDataGenerator:
+     def __init__(self, cmds):
+         self.cmds = cmds
+-        self.ts = rpm.TransactionSet()
+         self.pkgcount = 0
+         self.files = []
+ 
++        if self.cmds['dbpath']:
++            rpm.addMacro("_dbpath", self.cmds['dbpath'])
++        self.ts = rpm.TransactionSet()
++
+     def _os_path_walk(self, top, func, arg):
+         """Directory tree walk with callback function.
+          copy of os.path.walk, fixes the link/stating problem
+@@ -435,6 +439,7 @@
+     cmds['dir-pattern-match'] = ['.*bin\/.*', '^\/etc\/.*']
+     cmds['skip-symlinks'] = False
+     cmds['pkglist'] = []
++    cmds['dbpath'] = None
+ 
+     try:
+         gopts, argsleft = getopt.getopt(args, 'phqVvndg:s:x:u:c:o:CSi:', ['help', 'exclude=',
+@@ -442,7 +447,7 @@
+                                                                   'baseurl=', 'groupfile=', 'checksum=',
+                                                                   'version', 'pretty', 'split', 'outputdir=',
+                                                                   'noepoch', 'checkts', 'database', 'update',
+-                                                                  'skip-symlinks', 'pkglist='])
++                                                                  'skip-symlinks', 'pkglist=', 'dbpath='])
+     except getopt.error, e:
+         errorprint(_('Options Error: %s.') % e)
+         usage()
+@@ -516,6 +521,8 @@
+                 cmds['skip-symlinks'] = True
+             elif arg in ['-i', '--pkglist']:
+                 cmds['pkglist'] = a
++            elif arg == '--dbpath':
++                cmds['dbpath'] = os.path.realpath(a)
+                                 
+     except ValueError, e:
+         errorprint(_('Options Error: %s') % e)
diff --git a/meta/recipes-support/createrepo/createrepo_0.4.11.bb b/meta/recipes-support/createrepo/createrepo_0.4.11.bb
index 49b45fc..adc193e 100644
--- a/meta/recipes-support/createrepo/createrepo_0.4.11.bb
+++ b/meta/recipes-support/createrepo/createrepo_0.4.11.bb
@@ -14,6 +14,7 @@ SRC_URI= "http://createrepo.baseurl.org/download/${BP}.tar.gz \
           file://python-scripts-should-use-interpreter-from-env.patch \
 	  file://createrepo-rpm549.patch \
 	  file://recommends.patch \
+	  file://createrepo-dbpath.patch \
 	  file://rpm-createsolvedb.py \
          "
 
-- 
2.1.4


