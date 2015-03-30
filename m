Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 71533736B6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 23:50:10 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 30 Mar 2015 16:50:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,497,1422950400"; d="scan'208";a="548640139"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 30 Mar 2015 16:50:11 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id B2CD66A408D;
	Mon, 30 Mar 2015 16:49:50 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Mar 2015 02:49:56 +0300
Message-Id: <1427759396-24932-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <20150330224732.GA27217@linux.intel.com>
References: <20150330224732.GA27217@linux.intel.com>
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
X-List-Received-Date: Mon, 30 Mar 2015 23:50:12 -0000

--dbpath option allows to specify path to the directory
with rpm database. By default createrepo uses or creates
rpm database in /var/lib/rpm/.

Upstream-Status: Pending

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 .../createrepo/createrepo/createrepo-dbpath.patch  | 51 ++++++++++++++++++++++
 .../createrepo/createrepo_0.4.11.bb                |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-support/createrepo/createrepo/createrepo-dbpath.patch

diff --git a/meta/recipes-support/createrepo/createrepo/createrepo-dbpath.patch b/meta/recipes-support/createrepo/createrepo/createrepo-dbpath.patch
new file mode 100644
index 0000000..2b113bf
--- /dev/null
+++ b/meta/recipes-support/createrepo/createrepo/createrepo-dbpath.patch
@@ -0,0 +1,51 @@
+--- createrepo-0.4.11.orig/genpkgmetadata.py	2015-03-30 22:18:19.904000000 +0300
++++ createrepo-0.4.11.orig/genpkgmetadata.py	2015-03-30 22:28:49.208000000 +0300
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


