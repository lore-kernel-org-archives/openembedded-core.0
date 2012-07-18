Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SrvQW-0005Qn-Te
	for Openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 20:26:17 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 19 Jul 2012 11:14:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="168595178"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by orsmga001.jf.intel.com with ESMTP; 19 Jul 2012 11:14:32 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Wed, 18 Jul 2012 11:14:04 -0700
Message-Id: <26a85a65e78c3cdcd366b9314847ad866faf44ff.1342635153.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1342635153.git.nitin.a.kamble@intel.com>
References: <cover.1342635153.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/1] bitbake wget fetcher: add parameter: downloadfilename
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
X-List-Received-Date: Thu, 19 Jul 2012 18:26:17 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

this allows wget fetcher to store the downloaded file in a specified custom filename in ${DL_DIR}

Exmaple:
SRC_URI = "https://edc.intel.com/Download.aspx?id=6190;downloadfilename=LIN_IEMGD_1_14_GOLD_2443.tgz"

This fixes bug:
[YOCTO #2570]

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 bitbake/lib/bb/fetch2/__init__.py |    4 ++++
 bitbake/lib/bb/fetch2/wget.py     |    9 ++++++++-
 2 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/bitbake/lib/bb/fetch2/__init__.py b/bitbake/lib/bb/fetch2/__init__.py
index fa963be..4cb1546 100644
--- a/bitbake/lib/bb/fetch2/__init__.py
+++ b/bitbake/lib/bb/fetch2/__init__.py
@@ -762,6 +762,10 @@ class FetchData(object):
         if hasattr(self.method, "urldata_init"):
             self.method.urldata_init(self, d)
 
+        if "downloadfilename" in self.parm:
+            # if user sets downloadfilename, use it instead.
+            self.basename = self.parm["downloadfilename"]
+
         if "localpath" in self.parm:
             # if user sets localpath for file, use it instead.
             self.localpath = self.parm["localpath"]
diff --git a/bitbake/lib/bb/fetch2/wget.py b/bitbake/lib/bb/fetch2/wget.py
index b784afb..9affa0d 100644
--- a/bitbake/lib/bb/fetch2/wget.py
+++ b/bitbake/lib/bb/fetch2/wget.py
@@ -50,7 +50,11 @@ class Wget(FetchMethod):
 
     def urldata_init(self, ud, d):
 
-        ud.basename = os.path.basename(ud.path)
+        if 'downloadfilename' in ud.parm:
+            ud.basename = ud.parm['downloadfilename']
+        else:
+            ud.basename = os.path.basename(ud.path)
+
         ud.localfile = data.expand(urllib.unquote(ud.basename), d)
 
     def download(self, uri, ud, d, checkonly = False):
@@ -58,6 +62,9 @@ class Wget(FetchMethod):
 
         basecmd = d.getVar("FETCHCMD_wget", True) or "/usr/bin/env wget -t 2 -T 30 -nv --passive-ftp --no-check-certificate"
 
+        if 'downloadfilename' in ud.parm:
+            basecmd += " -O ${DL_DIR}/" + ud.localfile
+
         if checkonly:
             fetchcmd = d.getVar("CHECKCOMMAND_wget", True) or d.expand(basecmd + " -c -P ${DL_DIR} '${URI}'")
         elif os.path.exists(ud.localpath):
-- 
1.7.3.4



