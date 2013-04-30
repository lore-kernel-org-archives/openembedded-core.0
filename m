Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UXE5F-00037M-4D
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Apr 2013 19:11:23 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 30 Apr 2013 09:53:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,582,1363158000"; d="scan'208";a="295525208"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.12.98])
	by azsmga001.ch.intel.com with ESMTP; 30 Apr 2013 09:53:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Apr 2013 17:52:59 +0100
Message-Id: <de05b99e9cb77ce2a7cbf5762fc3fbc7929a05f6.1367340369.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1367340369.git.paul.eggleton@linux.intel.com>
References: <cover.1367340369.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1367340369.git.paul.eggleton@linux.intel.com>
References: <cover.1367340369.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/5] sysvinit-inittab: remove specific handling of SERIAL_CONSOLE
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
X-List-Received-Date: Tue, 30 Apr 2013 17:12:44 -0000

We already handle SERIAL_CONSOLES here and this is now set from
SERIAL_CONSOLE if not already set.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index fbac893..23c284d 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -17,9 +17,6 @@ do_compile() {
 do_install() {
 	install -d ${D}${sysconfdir}
     install -m 0644 ${WORKDIR}/inittab ${D}${sysconfdir}/inittab
-    if [ ! -z "${SERIAL_CONSOLE}" ]; then
-        echo "S:2345:respawn:${base_sbindir}/getty ${SERIAL_CONSOLE}" >> ${D}${sysconfdir}/inittab
-    fi
 
     tmp="${SERIAL_CONSOLES}"
     for i in $tmp
@@ -71,7 +68,7 @@ else
 fi
 }
 
-# USE_VT and SERIAL_CONSOLE are generally defined by the MACHINE .conf.
+# USE_VT and SERIAL_CONSOLES are generally defined by the MACHINE .conf.
 # Set PACKAGE_ARCH appropriately.
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-- 
1.8.1.2



