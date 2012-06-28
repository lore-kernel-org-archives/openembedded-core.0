Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SkJeD-0003sm-Jo
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 20:40:57 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Jun 2012 11:30:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="164125086"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.222])
	by orsmga002.jf.intel.com with ESMTP; 28 Jun 2012 11:29:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jun 2012 19:29:47 +0100
Message-Id: <b89507663fd994bc551d07ad0f80e27b62416b94.1340908084.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1340908084.git.paul.eggleton@linux.intel.com>
References: <cover.1340908084.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1340908084.git.paul.eggleton@linux.intel.com>
References: <cover.1340908084.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/3] apr: Install apr-local libtool in build dir
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
X-List-Received-Date: Thu, 28 Jun 2012 18:40:57 -0000

From: Joe MacDonald <joe.macdonald@windriver.com>

Building apache with this version of apr would blow up on the results
from:

   apr_config --apr-libtool

Errors of the form:

   /bin/sh: /media/large/tmp/sysroots/x86_64-linux/usr/share/build-1/libtool: No such file or directory

Fix that by ensuring libtool from apr's build lands in
.../usr/share/build-1/.

Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>
---
 meta/recipes-support/apr/apr_1.4.6.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/apr/apr_1.4.6.bb b/meta/recipes-support/apr/apr_1.4.6.bb
index c0ab4f1..6cd37f1 100644
--- a/meta/recipes-support/apr/apr_1.4.6.bb
+++ b/meta/recipes-support/apr/apr_1.4.6.bb
@@ -39,6 +39,8 @@ do_configure_append() {
 
 do_install_append() {
 	oe_multilib_header apr.h
+	install -d ${D}${datadir}/apr
+	cp ${S}/${HOST_SYS}-libtool ${D}${datadir}/build-1/libtool
 }
 
 SSTATE_SCAN_FILES += "apr_rules.mk"
-- 
1.7.9.5



