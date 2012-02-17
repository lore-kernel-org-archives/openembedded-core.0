Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RyLpL-000849-Vc
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Feb 2012 12:18:13 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 17 Feb 2012 03:09:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="118595410"
Received: from dcui-desktop.sh.intel.com ([10.239.36.38])
	by fmsmga001.fm.intel.com with ESMTP; 17 Feb 2012 03:09:57 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org, sgw@linux.intel.com,
	dvhart@linux.intel.com
Date: Fri, 17 Feb 2012 19:10:15 +0800
Message-Id: <006648391fcab720548143a8b843fcf553bc8a7f.1329470047.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1329470047.git.dexuan.cui@intel.com>
References: <cover.1329470047.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1329470047.git.dexuan.cui@intel.com>
References: <cover.1329470047.git.dexuan.cui@intel.com>
Subject: [PATCH 1/2] syslinux.bbclass: make PROMPT settable
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
X-List-Received-Date: Fri, 17 Feb 2012 11:18:13 -0000

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/classes/syslinux.bbclass |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index 1569074..8225c80 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -136,10 +136,6 @@ python build_syslinux_cfg () {
 	except OSError:
 		raise bb.build.funcFailed('Unable to open %s' % (cfile))
 
-	# FIXME - the timeout should be settable
-	# And maybe the default too
-	# Definately the prompt
-
 	cfgfile.write('# Automatically created by OE\n')
 
 	opts = d.getVar('SYSLINUX_OPTS', 1)
@@ -158,7 +154,12 @@ python build_syslinux_cfg () {
 	else:
 		cfgfile.write('TIMEOUT 50\n')
 
-	cfgfile.write('PROMPT 1\n')
+	prompt = d.getVar('SYSLINUX_PROMPT', 1)
+
+	if prompt:
+		cfgfile.write('PROMPT %s\n' % prompt)
+	else:
+		cfgfile.write('PROMPT 1\n')
 
 	menu = d.getVar('AUTO_SYSLINUXMENU', 1)
 
-- 
1.7.6



