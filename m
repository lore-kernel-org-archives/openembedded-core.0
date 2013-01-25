Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Tyhi0-0001Pj-2L
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 12:44:36 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 25 Jan 2013 03:29:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,537,1355126400"; d="scan'208";a="252319709"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.155])
	by orsmga001.jf.intel.com with ESMTP; 25 Jan 2013 03:29:00 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Jan 2013 11:28:57 +0000
Message-Id: <1359113337-7124-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] rpm: properly disable perl file dependency checking for rpmdeps
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
X-List-Received-Date: Fri, 25 Jan 2013 11:44:36 -0000

We don't want the perl module dependencies being added to each package
by rpmdeps because it causes too many problems when the modules aren't
available at install time (since they get added in do_package which is
too late for the build system to ensure they are available), and it
appears that the perl dependency gathering isn't working reliably in any
case judging by how they are detected on some build hosts and not
others.

This was being disabled previously but it seems like the macros moved
to a different file at some point and nobody noticed; thus make sure we
disable the macros in all RPM macro files.

Should fix [YOCTO #3699].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.9.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index c916a42..6977131 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -373,8 +373,8 @@ do_configure() {
 do_install_append() {
 	sed -i -e 's,%__check_files,#%%__check_files,' ${D}/${libdir}/rpm/macros
 	sed -i -e 's,%__scriptlet_requires,#%%__scriptlet_requires,' ${D}/${libdir}/rpm/macros
-	sed -i -e 's,%__perl_provides,#%%__perl_provides,' ${D}/${libdir}/rpm/macros
-	sed -i -e 's,%__perl_requires,#%%__perl_requires,' ${D}/${libdir}/rpm/macros
+	sed -i -e 's,%__perl_provides,#%%__perl_provides,' ${D}/${libdir}/rpm/macros ${D}/${libdir}/rpm/macros.d/*
+	sed -i -e 's,%__perl_requires,#%%__perl_requires,' ${D}/${libdir}/rpm/macros ${D}/${libdir}/rpm/macros.d/*
 	sed -i -e 's,%_repackage_all_erasures[^_].*,%_repackage_all_erasures 0,' ${D}/${libdir}/rpm/macros
 	sed -i -e 's,^#%_openall_before_chroot.*,%_openall_before_chroot\t1,' ${D}/${libdir}/rpm/macros
 
-- 
1.7.10.4



