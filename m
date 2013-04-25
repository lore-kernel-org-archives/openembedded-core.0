Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UVLVa-0002d3-Ma
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 14:42:50 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Apr 2013 05:24:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,550,1363158000"; d="scan'208";a="292207815"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by azsmga001.ch.intel.com with ESMTP; 25 Apr 2013 05:24:06 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Apr 2013 15:23:58 +0300
Message-Id: <42ef66d4ddff147513bcc9bdf49814be94551650.1366892003.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1366892003.git.laurentiu.palcu@intel.com>
References: <cover.1366892003.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1366892003.git.laurentiu.palcu@intel.com>
References: <cover.1366892003.git.laurentiu.palcu@intel.com>
Subject: [PATCH 2/4] pango: fix postinstall when using multilib
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
X-List-Received-Date: Thu, 25 Apr 2013 12:43:16 -0000
X-List-Received-Date: Thu, 25 Apr 2013 12:43:16 -0000

The pango-query-modules binary gets a multilib prefix and the
postinstall has to call the appropriate binary.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-graphics/pango/pango.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index f622903..52dd064 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -49,7 +49,7 @@ if ! [ -e $D${sysconfdir}/pango ] ; then
 fi
 
 if [ "x$D" != "x" ]; then
-	${@qemu_run_binary(d, '$D','/usr/bin/pango-querymodules')} \
+	${@qemu_run_binary(d, '$D','${bindir}/${MLPREFIX}pango-querymodules')} \
 		$D${libdir}/pango/${LIBV}/modules/*.so \
 		> $D${sysconfdir}/pango/${MLPREFIX}pango.modules 2>/dev/null
 
-- 
1.7.9.5



