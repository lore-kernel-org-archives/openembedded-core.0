Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qx2Kh-0006Xw-C9
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 21:44:51 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 Aug 2011 12:39:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,286,1312182000"; d="scan'208";a="45450556"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.251])
	by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2011 12:39:57 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2011 12:39:49 -0700
Message-Id: <f55c96b6d53ecff865145fa22f286c89c7336515.1314387279.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1314387279.git.sgw@linux.intel.com>
References: <cover.1314387279.git.sgw@linux.intel.com>
In-Reply-To: <cover.1314387279.git.sgw@linux.intel.com>
References: <cover.1314387279.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 19/21] opkg-utils: ignore packages disapperaring filelist generation
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
X-List-Received-Date: Fri, 26 Aug 2011 19:44:52 -0000

From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>

Package files disappearing during index generation don't cause a fatal
error. Make package file disappearing during filelist generation also
a non-fatal error.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 .../opkg-utils/index-ignore-filenotfound.patch     |   17 +++++++++++++++++
 meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb |    2 +-
 2 files changed, 18 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/index-ignore-filenotfound.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/index-ignore-filenotfound.patch
index 3664df6..f0f0fcf 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils/index-ignore-filenotfound.patch
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/index-ignore-filenotfound.patch
@@ -54,3 +54,20 @@ Index: opkg-utils/opkg-make-index
  if packages_filename:
       sys.stdout.close()
       sys.stdout = old_stdout
+@@ -197,7 +197,15 @@
+ names = packages.packages.keys()
+ names.sort()
+ for name in names:
+-     for fn in packages[name].get_file_list():
++     try:
++          fnlist = packages[name].get_file_list()
++     except OSError, e:
++          sys.stderr.write("Package %s disappeared on us!\n" % (name))
++          continue
++     except IOError, e:
++          sys.stderr.write("Package %s disappeared on us!\n" % (name))
++          continue
++     for fn in fnlist:
+           (h,t) = os.path.split(fn)
+           if not t: continue
+           if not files.has_key(t): files[t] = name+':'+fn
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
index fd2b5e6..e04b74a 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
@@ -8,7 +8,7 @@ RDEPENDS_${PN} = "python"
 RDEPENDS_${PN}_virtclass-native = ""
 SRCREV = "4747"
 PV = "0.1.8+svnr${SRCPV}"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "svn://svn.openmoko.org/trunk/src/host/;module=opkg-utils;proto=http \
            file://index-ignore-filenotfound.patch \
-- 
1.7.6



