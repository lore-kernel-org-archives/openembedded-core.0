Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Stw3d-0004Xn-Mf
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 09:30:57 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Jul 2012 00:19:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="172897552"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.97])
	by azsmga001.ch.intel.com with ESMTP; 25 Jul 2012 00:19:25 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jul 2012 00:18:59 -0700
Message-Id: <c7606f88a07938d9e9311a859cb4b962bb03a8e1.1343200454.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1343200454.git.sgw@linux.intel.com>
References: <cover.1343200454.git.sgw@linux.intel.com>
In-Reply-To: <cover.1343200454.git.sgw@linux.intel.com>
References: <cover.1343200454.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 05/28] bash: fix warning about bashbug reference /usr/bin when installed in /bin
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
X-List-Received-Date: Wed, 25 Jul 2012 07:30:57 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

Change the installation process so we have bashbug in ${bindir} and
bash at ${base_bindir}.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/bash/bash.inc    |   11 ++++++++---
 meta/recipes-extended/bash/bash_4.2.bb |    2 +-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index 6d7e930..a7f5f8f 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -9,9 +9,6 @@ DEPENDS = "ncurses bison-native"
 
 inherit autotools gettext update-alternatives
 
-bindir = "/bin"
-sbindir = "/sbin"
-
 EXTRA_OECONF = "--enable-job-control"
 export CC_FOR_BUILD = "${BUILD_CC}"
 
@@ -28,6 +25,14 @@ do_configure_prepend () {
 	fi
 }
 
+do_install_append () {
+	# Move /usr/bin/bash to /bin/bash, if need
+	if [ "${base_bindir}" != "${bindir}" ]; then
+		mkdir -p ${D}${base_bindir}
+		mv ${D}${bindir}/bash ${D}${base_bindir}
+	fi
+}
+
 pkg_postinst_${PN} () {
 	touch $D${sysconfdir}/shells
 	grep -q "bin/bash" $D${sysconfdir}/shells || echo /bin/bash >> $D${sysconfdir}/shells
diff --git a/meta/recipes-extended/bash/bash_4.2.bb b/meta/recipes-extended/bash/bash_4.2.bb
index a28279e..50f2ff6 100644
--- a/meta/recipes-extended/bash/bash_4.2.bb
+++ b/meta/recipes-extended/bash/bash_4.2.bb
@@ -1,6 +1,6 @@
 require bash.inc
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
            ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-001;apply=yes;striplevel=0;name=patch001 \
-- 
1.7.7.6



