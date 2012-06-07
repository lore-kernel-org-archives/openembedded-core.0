Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eflanagan@envy.jf.intel.com>) id 1ScmQR-00047k-MB
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 01:47:35 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Jun 2012 16:37:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="149733197"
Received: from envy.jf.intel.com ([10.7.201.175])
	by orsmga001.jf.intel.com with ESMTP; 07 Jun 2012 16:37:03 -0700
Received: from envy.jf.intel.com (localhost [127.0.0.1])
	by envy.jf.intel.com (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id
	q57NbHDa006551 for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jun 2012 16:37:17 -0700
Received: (from eflanagan@localhost)
	by envy.jf.intel.com (8.14.4/8.14.4/Submit) id q57NbHGg006550
	for openembedded-core@lists.openembedded.org;
	Thu, 7 Jun 2012 16:37:17 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jun 2012 16:37:00 -0700
Message-Id: <01f4a8d6e6659277dbc2a0f06d4d550f71948e07.1339111944.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <480358f458a7874b5705fc48547489d19a9df72c.1339111944.git.elizabeth.flanagan@intel.com>
References: <480358f458a7874b5705fc48547489d19a9df72c.1339111944.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1339111944.git.elizabeth.flanagan@intel.com>
References: <cover.1339111944.git.elizabeth.flanagan@intel.com>
Subject: [Consolidated Pull 12/22] shared-mime-info: fix build race condition
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
X-List-Received-Date: Thu, 07 Jun 2012 23:47:36 -0000

From: Joe Slater <jslater@windriver.com>

The definition of install-data-hook in Makefile.am leads
to multiple, overlapping, executions of the install-binPROGRAMS
target.  We modify the definition to avoid that.

Signed-off-by: Joe Slater <jslater@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 .../shared-mime-info/install-data-hook.patch       |   21 ++++++++++++++++++++
 .../shared-mime-info/shared-mime-info_0.91.bb      |    5 ++-
 2 files changed, 24 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info/install-data-hook.patch

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info/install-data-hook.patch b/meta/recipes-support/shared-mime-info/shared-mime-info/install-data-hook.patch
new file mode 100644
index 0000000..4c075f2
--- /dev/null
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info/install-data-hook.patch
@@ -0,0 +1,21 @@
+fix shared-mime-info build race condition
+
+The definition of install-data-hook in Makefile.am leads
+to multiple, overlapping, executions of install-binPROGRAMS
+target.  We modify the definition to avoid that.
+
+Signed-off-by: Joe Slater <jslater@windriver.com>
+
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -44,7 +44,9 @@ $(pkgconfig_DATA): config.status
+ @INTLTOOL_XML_RULE@
+ @INTLTOOL_DESKTOP_RULE@
+ 
+-install-data-hook: install-binPROGRAMS
++# do NOT make this dependent on anything!
++#
++install-data-hook:
+ if ENABLE_UPDATE_MIMEDB
+ 	$(DESTDIR)"$(bindir)/update-mime-database" -V "$(DESTDIR)$(datadir)/mime"
+ endif
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb
index 7ae6e10..910cb7f 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb
@@ -1,7 +1,8 @@
 require shared-mime-info.inc
-PR = "r3"
+PR = "r4"
 
 SRC_URI[md5sum] = "982a211560ba4c47dc791ccff34e8fbc"
 SRC_URI[sha256sum] = "98cfebe1d809afb24934e634373821e2a1dfa86fc6462cab230589a1c80988bd"
 
-SRC_URI =+ "file://parallelmake.patch"
+SRC_URI =+ "file://parallelmake.patch \
+	    file://install-data-hook.patch"
-- 
1.7.5.4



