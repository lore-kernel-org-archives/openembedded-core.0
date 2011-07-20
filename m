Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjSDI-0001b6-Cb
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 10:33:05 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Jul 2011 01:28:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,233,1309762800"; d="scan'208";a="29753359"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 20 Jul 2011 01:28:57 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 01:28:37 -0700
Message-Id: <3eccfdcd973a97a8bc4a30421ab2638b35503e16.1311150183.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
Subject: [PATCH 50/50] pseudo: fix uninitialised variable in realpath_fix.patch
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
X-List-Received-Date: Wed, 20 Jul 2011 08:33:06 -0000

From: Joshua Lock <josh@linux.intel.com>

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
1.7.3.4



