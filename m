Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ROPOJ-0005aX-69
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 08:49:44 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2011 23:43:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,488,1315206000"; d="scan'208";a="83351212"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2011 23:43:20 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 23:42:57 -0800
Message-Id: <6af03af634040678070d5b419f5a6ac9529672be.1320910946.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL (v2) 15/33] classes/package_rpm: disable uninstall scripts for upgrades
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
X-List-Received-Date: Thu, 10 Nov 2011 07:49:44 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

Our current assumption (based on the behaviour of opkg) when writing
recipes is that prerm and postrm do not get called during an upgrade.
When using rpm however, these are mapped to the rpm "preun" and "postun"
events which occur after postinst for upgrades, and when these contain
removal type operations (such as update-alternatives --remove) this
causes problems.

This patch wraps each preun and postun script for rpm in a check that
determines whether or not the script is being called during an upgrade,
and skips the entire script if it is, which mimics the behaviour of opkg
under the same conditions.

Fixes [YOCTO #1760]

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/package_rpm.bbclass |   18 ++++++++++++++++--
 1 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index df5a2db..2679e9f 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -471,6 +471,16 @@ python write_specfile () {
 				else:
 					target.append(path + "/" + file)
 
+	# Prevent the prerm/postrm scripts from being run during an upgrade
+	def wrap_uninstall(scriptvar):
+		scr = scriptvar.strip()
+		if scr.startswith("#!"):
+			pos = scr.find("\n") + 1
+		else:
+			pos = 0
+		scr = scr[:pos] + 'if [ "$1" = "0" ] ; then\n' + scr[pos:] + '\nfi'
+		return scr
+
 	packages = bb.data.getVar('PACKAGES', d, True)
 	if not packages or packages == '':
 		bb.debug(1, "No packages; nothing to do")
@@ -671,8 +681,10 @@ python write_specfile () {
 				spec_scriptlets_bottom.append('%%post -n %s' % splitname)
 			elif script == 'prerm':
 				spec_scriptlets_bottom.append('%%preun -n %s' % splitname)
+				scriptvar = wrap_uninstall(scriptvar)
 			elif script == 'postrm':
 				spec_scriptlets_bottom.append('%%postun -n %s' % splitname)
+				scriptvar = wrap_uninstall(scriptvar)
 			spec_scriptlets_bottom.append(scriptvar)
 			spec_scriptlets_bottom.append('')
 
@@ -758,11 +770,13 @@ python write_specfile () {
 		spec_scriptlets_top.append('')
 	if srcprerm:
 		spec_scriptlets_top.append('%preun')
-		spec_scriptlets_top.append(srcprerm)
+		scriptvar = wrap_uninstall(srcprerm)
+		spec_scriptlets_top.append(scriptvar)
 		spec_scriptlets_top.append('')
 	if srcpostrm:
 		spec_scriptlets_top.append('%postun')
-		spec_scriptlets_top.append(srcpostrm)
+		scriptvar = wrap_uninstall(srcpostrm)
+		spec_scriptlets_top.append(scriptvar)
 		spec_scriptlets_top.append('')
 
 	# Write the SPEC file
-- 
1.7.6.4



