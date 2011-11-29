Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVJ8F-0005pV-BD
	for openembedded-core@openembedded.org; Tue, 29 Nov 2011 09:33:39 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Nov 2011 00:26:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,590,1315206000"; d="scan'208";a="96419444"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 00:26:56 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 00:26:35 -0800
Message-Id: <2278f891a9bd204d82abbd6998cf0921908f1d14.1322554983.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322554983.git.sgw@linux.intel.com>
References: <cover.1322554983.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322554983.git.sgw@linux.intel.com>
References: <cover.1322554983.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 04/23] toolchain-scripts.bbclass: Make it work when TCLIBC=uclibc
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
X-List-Received-Date: Tue, 29 Nov 2011 08:33:39 -0000

From: Khem Raj <raj.khem@gmail.com>

This class currently only works with eglibc. Since
it adds dependencies explicitly on eglibc when using
uclibc this creates problems. So we make sure that
it checks for TCLIBC to determine system C library
in use

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/toolchain-scripts.bbclass |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index c936a27..5fb6cd3 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -104,7 +104,7 @@ toolchain_create_sdk_env_script_for_installer () {
 #we get the cached site config in the runtime
 TOOLCHAIN_CONFIGSITE_NOCACHE := "${@siteinfo_get_files(d, True)}"
 TOOLCHAIN_CONFIGSITE_SYSROOTCACHE := "${STAGING_DATADIR}/${TARGET_SYS}_config_site.d"
-TOOLCHAIN_NEED_CONFIGSITE_CACHE = "eglibc ncurses"
+TOOLCHAIN_NEED_CONFIGSITE_CACHE = "ncurses"
 
 #This function create a site config file
 toolchain_create_sdk_siteconfig () {
@@ -112,7 +112,9 @@ toolchain_create_sdk_siteconfig () {
 
 	rm -f $siteconfig
 	touch $siteconfig
-
+	if [ "${LIBC}" = "eglibc" ]; then
+		TOOLCHAIN_NEED_CONFIGSITE_CACHE = "${TOOLCHAIN_NEED_CONFIGSITE_CACHE} eglibc"
+	fi
 	for sitefile in ${TOOLCHAIN_CONFIGSITE_NOCACHE} ; do
 		cat $sitefile >> $siteconfig
 	done
@@ -140,5 +142,7 @@ python __anonymous () {
     deps = d.getVarFlag('do_configure', 'depends') or ""
     for dep in (d.getVar('TOOLCHAIN_NEED_CONFIGSITE_CACHE', True) or "").split():
         deps += " %s:do_populate_sysroot" % dep
+    if d.getVar('TCLIBC', True) is "uclibc":
+	deps += "uclibc:do_populate_sysroot"
     d.setVarFlag('do_configure', 'depends', deps)
 }
-- 
1.7.6.4



