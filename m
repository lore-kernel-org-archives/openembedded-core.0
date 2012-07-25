Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SuAn7-0004lE-EM
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 01:14:53 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 25 Jul 2012 16:03:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="171468460"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.21])
	by orsmga001.jf.intel.com with ESMTP; 25 Jul 2012 16:03:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jul 2012 00:03:13 +0100
Message-Id: <de0f1c0fc3729917e883ba17e46fa0b16c3d5164.1343256969.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1343256969.git.paul.eggleton@linux.intel.com>
References: <cover.1343256969.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1343256969.git.paul.eggleton@linux.intel.com>
References: <cover.1343256969.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/6] package.bbclass: Create symlinks for packages with different packaged name
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
X-List-Received-Date: Wed, 25 Jul 2012 23:14:53 -0000

From: Andrei Gherzan <andrei@gherzan.ro>

While generating license.manifest package information is searched in:
filename=`ls ${TMPDIR}/pkgdata/*/runtime/${pkg}| head -1`
This is ok as long as package name is the same as the package name
after packaging.
For example dbus is packaged as dbus-1. So, searching
ls ${TMPDIR}/pkgdata/*/runtime/dbus-1 will fail because there is no file
with this package name.

Create a symlink to the pkgdata file in a runtime-reverse directory so
that these reverse lookups are possible.

Fixes [YOCTO #2638].

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/license.bbclass |    2 +-
 meta/classes/package.bbclass |    6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index a2721ab..231b4a3 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -86,7 +86,7 @@ license_create_manifest() {
 	# list of installed packages is broken for deb
 	for pkg in ${INSTALLED_PKGS}; do
 		# not the best way to do this but licenses are not arch dependant iirc
-		filename=`ls ${TMPDIR}/pkgdata/*/runtime/${pkg}| head -1`
+		filename=`ls ${TMPDIR}/pkgdata/*/runtime-reverse/${pkg}| head -1`
 		pkged_pn="$(sed -n 's/^PN: //p' ${filename})"
 		pkged_lic="$(sed -n '/^LICENSE: /{ s/^LICENSE: //; s/[+|&()*]/ /g; s/  */ /g; p }' ${filename})"
 		pkged_pv="$(sed -n 's/^PV: //p' ${filename})"
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index fc83424..ea199d3 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1124,6 +1124,10 @@ python emit_pkgdata() {
         sf.write('%s_%s: %s\n' % ('PKGSIZE', pkg, get_directory_size(pkgdest + "/%s" % pkg)))
         sf.close()
 
+        # Symlinks needed for reverse lookups (from the final package name)
+        pkgval = d.getVar('PKG_%s' % (pkg), True)
+        subdata_sym = pkgdatadir + "/runtime-reverse/%s" % pkgval
+        oe.path.symlink("../runtime/%s" % pkg, subdata_sym, True)
 
         allow_empty = d.getVar('ALLOW_EMPTY_%s' % pkg, True)
         if not allow_empty:
@@ -1137,7 +1141,7 @@ python emit_pkgdata() {
 
     bb.utils.unlockfile(lf)
 }
-emit_pkgdata[dirs] = "${PKGDESTWORK}/runtime"
+emit_pkgdata[dirs] = "${PKGDESTWORK}/runtime ${PKGDESTWORK}/runtime-reverse"
 
 ldconfig_postinst_fragment() {
 if [ x"$D" = "x" ]; then
-- 
1.7.9.5



