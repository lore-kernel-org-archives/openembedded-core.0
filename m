Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHPJ8-0001ec-Lg
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 01:47:10 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 May 2011 16:44:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,312,1301900400"; d="scan'208";a="741892562"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by orsmga001.jf.intel.com with ESMTP; 03 May 2011 16:44:30 -0700
Message-Id: <c4437cafc4871d481e28df054d927e4fe3e50095.1304465724.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304465724.git.sgw@linux.intel.com>
References: <cover.1304465724.git.sgw@linux.intel.com>
Old-Date: Thu, 28 Apr 2011 22:14:17 +0800
Date: Tue, 03 May 2011 16:44:30 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Xiaofeng Yan <xiaofeng.yan@windriver.com>, Ilya Yanok <yanok@emcraft.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>, Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 07/33] distro_check.py: Fix some bugs in distro_check.py
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 May 2011 23:47:10 -0000

From: Mei Lei <lei.mei@intel.com>

The recipe meta-ide-support's alias is Poky, but not defined in distro_exceptions, this will lead an error.
The compare_in_distro_packages_list function omit a split process, this will lead to a form issue.
Change the log file generate way, use symbolic links link to the latest log file, instead of appending every log file in old log.

Signed-off-by: Mei Lei <lei.mei@intel.com>
---
 meta/lib/oe/distro_check.py |   17 +++++++++++------
 1 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index d6abd9b..c85d4fb 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -302,7 +302,7 @@ def compare_in_distro_packages_list(distro_check_dir, d):
     bb.note("Recipe: %s" % recipe_name)
     tmp = bb.data.getVar('DISTRO_PN_ALIAS', localdata, True)
 
-    distro_exceptions = dict({"OE-Core":'OE-Core', "OpenedHand":'OpenedHand', "Intel":'Intel', "Upstream":'Upstream', "WindRiver":'Windriver', "OSPDT":'OSPDT Approved'})
+    distro_exceptions = dict({"OE-Core":'OE-Core', "OpenedHand":'OpenedHand', "Intel":'Intel', "Upstream":'Upstream', "WindRiver":'Windriver', "OSPDT":'OSPDT Approved', "Poky":'poky'})
 
     if tmp:
         list = tmp.split(' ')
@@ -335,8 +335,9 @@ def compare_in_distro_packages_list(distro_check_dir, d):
 
     
     if tmp != None:
-         matching_distros.append(tmp)
-
+	list = tmp.split(' ')
+	for item in list:
+            matching_distros.append(item)
     bb.note("Matching: %s" % matching_distros)
     return matching_distros
 
@@ -348,13 +349,17 @@ def save_distro_check_result(result, datetime, d):
         return
     if not os.path.isdir(logdir):
         os.makedirs(logdir)
-    result_file = os.path.join(logdir, "distrocheck.csv")
+    result_file = os.path.join(logdir, "distrocheck.%s.csv" % datetime)
     line = pn
     for i in result:
         line = line + "," + i
     if not os.path.exists(result_file):
-        open(result_file, 'w+b').close() # touch the file so that the next open won't fail
-    f = open(result_file, "a+b")
+        sresult_file = os.path.join(logdir, "distrocheck.csv")
+	if os.path.exists(sresult_file):
+	    os.remove(sresult_file)
+	os.system("touch %s" % result_file)
+	os.symlink(result_file, sresult_file)
+    f = open(result_file, "a")
     import fcntl
     fcntl.lockf(f, fcntl.LOCK_EX)
     f.seek(0, os.SEEK_END) # seek to the end of file
-- 
1.7.4.1



