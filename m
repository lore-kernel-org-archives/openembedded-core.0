Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E2B676FBB9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Oct 2014 23:37:01 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 Oct 2014 16:30:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,695,1406617200"; d="scan'208";a="587032568"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.58])
	by orsmga001.jf.intel.com with ESMTP; 10 Oct 2014 16:36:54 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Oct 2014 18:36:42 -0500
Message-Id: <1412984202-14399-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] package_deb: skip pre/postrm scripts on upgrade, write only one shebang
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
X-List-Received-Date: Fri, 10 Oct 2014 23:37:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Oberritter <obi@opendreambox.org>

Trying to upgrade busybox removing symlinks but update-alternatives
need these links (sed, cut, tail, etc) in order to work.

Adding test to avoid this scripts on upgrade fix the problem, same
solution are found in package_rpm class.

[YOCTO #6768]

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/package_deb.bbclass | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 7bc29df..5b5f7e2 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -239,13 +239,26 @@ python do_package_deb () {
             scriptvar = localdata.getVar('pkg_%s' % script, True)
             if not scriptvar:
                 continue
+            scriptvar = scriptvar.strip()
             try:
                 scriptfile = open(os.path.join(controldir, script), 'w')
             except OSError:
                 bb.utils.unlockfile(lf)
                 raise bb.build.FuncFailed("unable to open %s script file for writing." % script)
-            scriptfile.write("#!/bin/sh\n")
-            scriptfile.write(scriptvar)
+
+            if scriptvar.startswith("#!"):
+                pos = scriptvar.find("\n") + 1
+                scriptfile.write(scriptvar[:pos])
+            else:
+                pos = 0
+                scriptfile.write("#!/bin/sh\n")
+
+            # Prevent the prerm/postrm scripts from being run during an upgrade
+            if script in ('prerm', 'postrm'):
+                scriptfile.write('[ "$1" != "upgrade" ] || exit 0\n')
+
+            scriptfile.write(scriptvar[pos:])
+            scriptfile.write('\n')
             scriptfile.close()
             os.chmod(os.path.join(controldir, script), 0755)
 
-- 
1.9.1


