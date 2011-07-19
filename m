Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QjKEs-0004QX-7D
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 02:02:10 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jul 2011 16:58:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,231,1309762800"; d="scan'208";a="29979618"
Received: from unknown (HELO scimitar.amr.corp.intel.com) ([10.255.14.85])
	by fmsmga002.fm.intel.com with ESMTP; 19 Jul 2011 16:58:02 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jul 2011 16:57:55 -0700
Message-Id: <2c1b7876622089db0c47848a456d9d6b0b1d6234.1311119488.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1311119488.git.josh@linux.intel.com>
References: <cover.1311119488.git.josh@linux.intel.com>
In-Reply-To: <cover.1311119488.git.josh@linux.intel.com>
References: <cover.1311119488.git.josh@linux.intel.com>
Subject: [PATCH 1/1] pseudo: fix uninitialised variable in realpath_fix.patch
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
X-List-Received-Date: Wed, 20 Jul 2011 00:02:10 -0000

Several users reported issues with pseudo on CentOS 5.x hosts, Matthew
McClintock tracked the issue to the realpath_fix.patch and Mark Hatle
supplied the included fix.

CC: Matthew McClintock <msm@freescale.com>
CC: Mark Hatle <mark.hatle@windriver.com>

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../pseudo/pseudo/realpath_fix.patch               |    2 +-
 meta/recipes-devtools/pseudo/pseudo_1.1.1.bb       |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo/realpath_fix.patch b/meta/recipes-devtools/pseudo/pseudo/realpath_fix.patch
index 7beea51..4a107e0 100644
--- a/meta/recipes-devtools/pseudo/pseudo/realpath_fix.patch
+++ b/meta/recipes-devtools/pseudo/pseudo/realpath_fix.patch
@@ -65,7 +65,7 @@ index 600a918..07a4429 100644
  
 +static void
 +pseudo_init_one_wrapper(pseudo_function *func) {
-+	int (*f)(void);
++	int (*f)(void) = (int (*)(void)) NULL;
 +	char *e;
 +	if (*func->real != NULL) {
 +		/* already initialized */
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.1.1.bb b/meta/recipes-devtools/pseudo/pseudo_1.1.1.bb
index f1c8e63..0a61aec 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.1.1.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.1.1.bb
@@ -1,6 +1,6 @@
 require pseudo.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://oe-config.patch \
-- 
1.7.6



