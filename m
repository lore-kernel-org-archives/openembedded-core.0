Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sh11L-00027s-PH
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 18:11:12 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jun 2012 09:00:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="155520237"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.123])
	by orsmga001.jf.intel.com with ESMTP; 19 Jun 2012 08:59:59 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2012 08:59:22 -0700
Message-Id: <9f8410f7af603e7c992bc86df5fa3dd76b9f00ee.1340121099.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
Subject: [PATCH 04/39] bitbake.conf: add PN-bin and cleanup lib_package.bbclass
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
X-List-Received-Date: Tue, 19 Jun 2012 16:11:12 -0000

Since we now have PN as the end of the package list, we can almost get rid of
lib_package, each recipe can just add PACKAGES =+ PN-bin instead of the inherit

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/lib_package.bbclass |   14 +++++++-------
 meta/conf/bitbake.conf           |    2 ++
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/classes/lib_package.bbclass b/meta/classes/lib_package.bbclass
index 9843ed9..1f0542a 100644
--- a/meta/classes/lib_package.bbclass
+++ b/meta/classes/lib_package.bbclass
@@ -1,8 +1,8 @@
-PACKAGES =+ "${PN}-bin"
+#
+# ${PN}-bin is defined in bitbake.conf
+#
+# We need to allow the other packages to be greedy with what they
+# want out of /bin and /usr/bin before ${PN}-bin gets greedy.
+# 
+PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PN}-bin ${PN}"
 
-FILES_${PN} = "${libexecdir} ${libdir}/lib*${SOLIBS} \
-	    ${sysconfdir} ${sharedstatedir} ${localstatedir} \
-	    ${base_libdir}/*${SOLIBS} \
-	    ${datadir}/${BPN} ${libdir}/${BPN}"
-
-FILES_${PN}-bin = "${bindir}/* ${sbindir}/* /bin/* /sbin/*"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e072757..face25e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -266,6 +266,8 @@ FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS}
             ${datadir}/idl ${datadir}/omf ${datadir}/sounds \
             ${libdir}/bonobo/servers"
 
+FILES_${PN}-bin = "${bindir}/* ${sbindir}/*"
+
 FILES_${PN}-doc = "${docdir} ${mandir} ${infodir} ${datadir}/gtk-doc \
             ${datadir}/gnome/help"
 SECTION_${PN}-doc = "doc"
-- 
1.7.7.6



