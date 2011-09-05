Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R0bTT-0006Mw-Ni
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Sep 2011 17:52:39 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 05 Sep 2011 08:47:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,333,1312182000"; d="scan'208";a="14180660"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.53])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Sep 2011 08:47:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Sep 2011 16:47:35 +0100
Message-Id: <cae9b6aa44f57843cf9a9575b85ef33350b0a41e.1315237572.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1315237572.git.paul.eggleton@linux.intel.com>
References: <cover.1315237572.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1315237572.git.paul.eggleton@linux.intel.com>
References: <cover.1315237572.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] git: fix sstate relocation for git-native
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
X-List-Received-Date: Mon, 05 Sep 2011 15:52:40 -0000

Create a wrapper for git to set GIT_EXEC_PATH and GIT_TEMPLATE_DIR so
that git-native is relocatable.

Fixes specific example given in [YOCTO #1137]

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/git/git.inc        |    6 ++++++
 meta/recipes-devtools/git/git_1.7.5.1.bb |    2 +-
 2 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 56655f9..ca13ffd 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -18,6 +18,12 @@ do_install () {
 		GIT_PYTHON_DIR=${D}${datadir}/git-core/python
 }
 
+do_install_append_virtclass-native() {
+	create_wrapper ${D}/${bindir}/git \
+		GIT_EXEC_PATH=${libexecdir}/git-core \
+		GIT_TEMPLATE_DIR=${STAGING_DATADIR_NATIVE}/git-core/templates
+}
+
 FILES_${PN} += "${datadir}/git-core ${libxecdir}/git-core/"
 FILES_${PN}-dbg += "${libexecdir}/git-core/.debug"
 
diff --git a/meta/recipes-devtools/git/git_1.7.5.1.bb b/meta/recipes-devtools/git/git_1.7.5.1.bb
index 04d1d56..b5eb015 100644
--- a/meta/recipes-devtools/git/git_1.7.5.1.bb
+++ b/meta/recipes-devtools/git/git_1.7.5.1.bb
@@ -1,6 +1,6 @@
 require git.inc
 
-PR = "r2"
+PR = "r3"
 
 EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no ac_cv_c_c99_format=yes \
                  ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-- 
1.7.4.1



