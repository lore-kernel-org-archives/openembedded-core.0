Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R8oJ5-000423-6L
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 09:11:51 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Sep 2011 00:06:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,453,1312182000"; d="scan'208";a="21360966"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.219])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Sep 2011 00:06:13 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 00:05:54 -0700
Message-Id: <0a843b90bc52ab00989d9a5719e7d2b56429865a.1317193251.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1317193250.git.sgw@linux.intel.com>
References: <cover.1317193250.git.sgw@linux.intel.com>
In-Reply-To: <cover.1317193250.git.sgw@linux.intel.com>
References: <cover.1317193250.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 18/29] ghostscript: disable check for time.h
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
X-List-Received-Date: Wed, 28 Sep 2011 07:11:54 -0000

From: Joshua Lock <joshual@takoba.(none)>

ghostscript has it's own hacky check for time.h which hard-codes paths, this
means in the native case it fails on systems such as Ubuntu 11.10 where the
location of time.h has changed. Further it means the target build has had a
host-intrusion issue.

This patch disables the check for time.h, future releases of ghostscript
use standard autotools checks for time.h's location.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../ghostscript/ghostscript_9.02.bb                |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.02.bb b/meta/recipes-extended/ghostscript/ghostscript_9.02.bb
index 2e46734..9b21c66 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.02.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.02.bb
@@ -36,6 +36,11 @@ SRC_URI[sha256sum] = "03ea2cad13a36f8f9160912012b79619a826e7148fada6d3531feb2540
 
 EXTRA_OECONF = "--without-x --with-system-libtiff --without-jbig2dec --without-jasper --with-fontpath=${datadir}/fonts"
 
+# This has been fixed upstream but for now we need to subvert the check for time.h
+# http://bugs.ghostscript.com/show_bug.cgi?id=692443
+# http://bugs.ghostscript.com/show_bug.cgi?id=692426
+CFLAGS += "-DHAVE_SYS_TIME_H=1"
+
 inherit autotools
 
 do_configure () {
-- 
1.7.6



