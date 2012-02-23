Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S0bC6-0004t7-Nz
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 17:06:59 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Feb 2012 07:58:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128652368"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.72])
	by fmsmga002.fm.intel.com with ESMTP; 23 Feb 2012 07:58:33 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 07:58:20 -0800
Message-Id: <9c58c35fa0bb2c587543ba4c629fd186388007d2.1330012543.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1330012543.git.sgw@linux.intel.com>
References: <cover.1330012543.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330012543.git.sgw@linux.intel.com>
References: <cover.1330012543.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 16/25] syslinux: Use SYSLINUX_TIMEOUT and SYSLINUX_PROMPT to configure syslinux
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
X-List-Received-Date: Thu, 23 Feb 2012 16:06:59 -0000

syslinux allows you to set TIMEOUT and PROMPT variables, when PROMPT is 0,
the "boot:" is not displayed uless one presses CTRL or SHIFT during startup.
TIMEOUT is in 1/10th of seconds, and a value of 0 for TIMEOUT will disable
the timeout mechanism.

In bitbake, recipes had set TIMEOUT (not SYSLINUX_TIMEOUT) incorrectly, other
patches fix this issues.  We are adding SYSLINUX_PROMPT to enable/disable the
"boot:" prompt in syslinux.

See http://www.syslinux.org/wiki/index.php/SYSLINUX for more details

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/classes/syslinux.bbclass |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index 1569074..33a509d 100644
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
@@ -158,7 +154,11 @@ python build_syslinux_cfg () {
 	else:
 		cfgfile.write('TIMEOUT 50\n')
 
-	cfgfile.write('PROMPT 1\n')
+	prompt = d.getVar('SYSLINUX_PROMPT', 1)
+	if prompt:
+		cfgfile.write('PROMPT %s\n' % prompt)
+	else:
+		cfgfile.write('PROMPT 1\n')
 
 	menu = d.getVar('AUTO_SYSLINUXMENU', 1)
 
-- 
1.7.6.5



