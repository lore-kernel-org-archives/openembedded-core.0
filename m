Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1TaSJT-0003GW-RL
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Nov 2012 15:27:07 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Nov 2012 06:10:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,279,1352102400"; d="scan'208";a="244323700"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.157])
	by orsmga002.jf.intel.com with ESMTP; 19 Nov 2012 06:11:32 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2012 16:11:44 +0200
Message-Id: <1353334304-7898-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] bitbake: Network test timeouts reduced
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
X-List-Received-Date: Mon, 19 Nov 2012 14:27:07 -0000

Network timeouts affecting wget
connectivity test are reduced,
so that Hob network test will fail faster.

Fixes [YOCTO #3248]

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 bitbake/lib/bb/fetch2/wget.py |    2 +-
 meta/conf/bitbake.conf        |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/bitbake/lib/bb/fetch2/wget.py b/bitbake/lib/bb/fetch2/wget.py
index ea99198..1b5bce0 100644
--- a/bitbake/lib/bb/fetch2/wget.py
+++ b/bitbake/lib/bb/fetch2/wget.py
@@ -63,7 +63,7 @@ class Wget(FetchMethod):
     def download(self, uri, ud, d, checkonly = False):
         """Fetch urls"""
 
-        basecmd = d.getVar("FETCHCMD_wget", True) or "/usr/bin/env wget -t 2 -T 30 -nv --passive-ftp --no-check-certificate"
+        basecmd = d.getVar("FETCHCMD_wget", True) or "/usr/bin/env wget -t 2 -T 5 -nv --passive-ftp --no-check-certificate"
 
         if 'downloadfilename' in ud.parm:
             basecmd += " -O ${DL_DIR}/" + ud.localfile
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index cf779a4..b5dd2d8 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -588,7 +588,7 @@ XORG_MIRROR = "http://xorg.freedesktop.org/releases"
 
 FETCHCMD_svn = "/usr/bin/env svn --non-interactive --trust-server-cert"
 FETCHCMD_cvs = "/usr/bin/env cvs"
-FETCHCMD_wget = "/usr/bin/env wget -t 2 -T 30 -nv --passive-ftp --no-check-certificate"
+FETCHCMD_wget = "/usr/bin/env wget -t 2 -T 5 -nv --passive-ftp --no-check-certificate"
 FETCHCMD_bzr = "/usr/bin/env bzr"
 FETCHCMD_hg = "/usr/bin/env hg"
 
-- 
1.7.10.4



