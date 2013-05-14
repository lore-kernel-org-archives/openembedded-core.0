Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefanx.stanacar@intel.com>) id 1UcIGL-0005Oa-K8
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 18:39:49 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 14 May 2013 09:21:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,671,1363158000"; d="scan'208";a="241429065"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by AZSMGA002.ch.intel.com with ESMTP; 14 May 2013 09:21:28 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.149])
	by linux.intel.com (Postfix) with ESMTP id 51A586A4083;
	Tue, 14 May 2013 09:21:18 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 May 2013 19:21:35 +0300
Message-Id: <1368548495-30122-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH v2] connman: replace hardcoded path in init script and systemd service
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 May 2013 16:39:50 -0000

The connman init script sources a setup file from /usr/lib/connman,
so we end up with no network in qemu multilib enabled images.

The init script it's installed by connman and because wired-setup
it's installed by another package (connman-conf) we can't use
libexecdir here and now (in the init script and systemd service file).

Once libexecdir changes from ${libdir}/${bpn} to something else like
/usr/libexec we could use that instead of ${libdir}/connman.

Changed in v2: - better commit message

[YOCTO #4493]

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc     | 3 ++-
 meta/recipes-connectivity/connman/connman/connman | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index afc361c..3d3ec93 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -47,7 +47,7 @@ INITSCRIPT_NAME = "connman"
 INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
 
 SYSTEMD_SERVICE_${PN} = "connman.service"
-SYSTEMD_WIRED_SETUP = "ExecStartPre=-/usr/lib/connman/wired-setup"
+SYSTEMD_WIRED_SETUP = "ExecStartPre=-${libdir}/connman/wired-setup"
 
 # IMPORTANT: because xuser is shared with rootless X, please make sure the
 # USERADD_PARAM is in sync with the one in xserver-nodm-init.bb
@@ -73,6 +73,7 @@ do_install_append() {
 	if ${@base_contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
 		install -d ${D}${sysconfdir}/init.d
 		install -m 0755 ${WORKDIR}/connman ${D}${sysconfdir}/init.d/connman
+		sed -i s%@LIBDIR@%${libdir}% ${D}${sysconfdir}/init.d/connman
 	fi
 
 	install -d ${D}${bindir}
diff --git a/meta/recipes-connectivity/connman/connman/connman b/meta/recipes-connectivity/connman/connman/connman
index a111f60..67ba7c8 100644
--- a/meta/recipes-connectivity/connman/connman/connman
+++ b/meta/recipes-connectivity/connman/connman/connman
@@ -32,8 +32,8 @@ do_start() {
 		ethn=`ifconfig | grep eth | sed -e "s/\(eth[0-9]\)\(.*\)/\1/"`
 		EXTRA_PARAM="-I $ethn"
 	fi
-	if [ -f /usr/lib/connman/wired-setup ] ; then
-		. /usr/lib/connman/wired-setup
+	if [ -f @LIBDIR@/connman/wired-setup ] ; then
+		. @LIBDIR@/connman/wired-setup
 	fi
 	$DAEMON $EXTRA_PARAM
 }
-- 
1.8.1.4



