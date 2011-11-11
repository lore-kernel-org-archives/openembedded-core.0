Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ROmhQ-0000NG-Jq
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2011 09:43:00 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Nov 2011 00:36:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,494,1315206000"; d="scan'208";a="89010350"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.157])
	by fmsmga002.fm.intel.com with ESMTP; 11 Nov 2011 00:36:37 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Nov 2011 00:36:32 -0800
Message-Id: <463e44ae159da2e03369f9ac14843b479de2e43d.1321000451.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1321000451.git.sgw@linux.intel.com>
References: <cover.1321000451.git.sgw@linux.intel.com>
In-Reply-To: <cover.1321000451.git.sgw@linux.intel.com>
References: <cover.1321000451.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 6/9] sudo: Avoid post install scripts
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
X-List-Received-Date: Fri, 11 Nov 2011 08:43:01 -0000

From: Mark Hatle <mark.hatle@windriver.com>

The post install script was removed, and the install_append updated
to ensure the permissions are set correctly.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-extended/sudo/sudo.inc      |    8 --------
 meta/recipes-extended/sudo/sudo_1.8.3.bb |    5 ++++-
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 72a7c16..83dd209 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -29,11 +29,3 @@ do_install_prepend (){
 	mkdir -p ${D}/${localstatedir}/lib
 }
 
-pkg_postinst_${PN} () {
-	if [ "x$D" != "x" ]; then
-		exit 1
-	fi
-
-	chmod 4111 /usr/bin/sudo
-	chmod 0440 /etc/sudoers
-}
diff --git a/meta/recipes-extended/sudo/sudo_1.8.3.bb b/meta/recipes-extended/sudo/sudo_1.8.3.bb
index 0ac0851..99fe5b9 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.3.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.3.bb
@@ -1,6 +1,6 @@
 require sudo.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
            file://libtool.patch \
@@ -23,4 +23,7 @@ do_install_append () {
 			break
 		fi
 	done
+
+	chmod 4111 $D/usr/bin/sudo
+	chmod 0440 $D/etc/sudoers
 }
-- 
1.7.6.4



