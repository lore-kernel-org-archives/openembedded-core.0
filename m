Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SjSte-0006CG-AX
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jun 2012 12:21:22 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 26 Jun 2012 03:10:28 -0700
Received: by weyt11 with SMTP id t11so3165434wey.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2012 03:10:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=649QG/I7qOsIuQ9mZFuWL2IkfeWbwAnW2sOG+f/o6sI=;
	b=juTl0htb9VKVFORfwR5qSVcgL0PAPmKMDP8bLoQM3zvF7ouIpl707sG4X2LQKM0vcW
	fDtsFcd87WK7nt9culrUNp0GIAsmLXc6MTTx3PsaUbxp3SNN8+bE8Mugmvk0qnwku8v9
	3aA4vZYthb/QpvPZKAObBGErRvTyGCKBoB1UmWk46nxFyDTqCGYe5XmT/CHG63ZQ04cJ
	vD4BiWYkeFWoBlhzoRwIr+fHLEEDrIiB8nceZlortkyQMu2z7QMBcrpeb0gvxJ1/76NI
	Ps1N4BwnkMvsKKX2n6igAn0RAPSTxOI5KlaPO92ANBkbLFCYHVvZ80nOwQLpKLOQdkDs
	6H1A==
Received: by 10.216.144.199 with SMTP id n49mr7654343wej.25.1340705426846;
	Tue, 26 Jun 2012 03:10:26 -0700 (PDT)
Received: from localhost.localdomain (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id k8sm6418385wia.6.2012.06.26.03.10.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Jun 2012 03:10:26 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jun 2012 11:10:23 +0100
Message-Id: <1340705423-18430-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.7.6
X-Gm-Message-State: ALoCoQkxGXQEMz2yx8hOPHcapdTYVKc1sBy4bkc9LWB+hDUgHB+n76DgF4PLb6CNEiRySBctDvK9
Subject: [PATCH] gconf.bbclass: don't register schemas in the install stage
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
X-List-Received-Date: Tue, 26 Jun 2012 10:21:22 -0000

Previously this was installing schemas in the sysroot, which is wrong for native
packages as nothing should touch the sysroot directly, and even more wrong for
non-native packages as the sysroot is irrelevant.

So, export the environment variable that stops the registration happening at
install time. The postinst script will handle the non-native case, and for the
sysroot I've opened #2648.  This isn't a massive problem as nothing to my
knowledge actually installs schemas to the sysroot.

[YOCTO #2245]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/gconf.bbclass |   12 ++++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/classes/gconf.bbclass b/meta/classes/gconf.bbclass
index a966c26..fb9f701 100644
--- a/meta/classes/gconf.bbclass
+++ b/meta/classes/gconf.bbclass
@@ -1,10 +1,18 @@
 DEPENDS += "gconf gconf-native"
 
-# This is referenced by the gconf m4 macros and would default to the value hardcoded
-# into gconf at compile time otherwise
+# These are for when gconftool is used natively and the prefix isn't necessarily
+# the sysroot.  TODO: replicate the postinst logic for -native packages going
+# into sysroot as they won't be running their own install-time schema
+# registration (disabled below) nor the postinst script (as they don't happen).
 export GCONF_SCHEMA_INSTALL_SOURCE = "xml:merged:${STAGING_DIR_NATIVE}${sysconfdir}/gconf/gconf.xml.defaults"
 export GCONF_BACKEND_DIR = "${STAGING_LIBDIR_NATIVE}/GConf/2"
 
+# Disable install-time schema registration as we're a packaging system so this
+# happens in the postinst script, not at install time.  Set both the configure
+# script option and the traditional envionment variable just to make sure.
+EXTRA_OECONF += "--disable-schemas-install"
+export GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL = "1"
+
 gconf_postinst() {
 if [ "x$D" != "x" ]; then
 	exit 1
-- 
1.7.7.6



