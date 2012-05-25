Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXoOC-00085R-5g
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 08:52:44 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2012 23:42:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="157115405"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by fmsmga001.fm.intel.com with ESMTP; 24 May 2012 23:42:26 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 23:41:42 -0700
Message-Id: <07375e616d99f1b3a2000412bc4241bb06134f16.1337927956.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 03/45] utils.bbclass: remove the unused oe_system
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
X-List-Received-Date: Fri, 25 May 2012 06:52:44 -0000

From: Robert Yang <liezhi.yang@windriver.com>

The following functions in meta/classes/utils.bbclass were not
used by anyone, and they didn't work when I tried to use them:

def oe_popen_env(d):
def oe_run(d, cmd, **kwargs):
def oe_popen(d, cmd, **kwargs):
def oe_system(d, cmd, **kwargs):

There error was:
AttributeError: type object 'str' has no attribute 'getVar'

We have bitbake/lib/bb/process.py to instead, so remove them.

[YOCTO #2489]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/utils.bbclass |   26 --------------------------
 1 files changed, 0 insertions(+), 26 deletions(-)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index fde8f44..f8b09b4 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -58,32 +58,6 @@ def is_machine_specific(d):
             if any(fetcher.localpath(url).startswith(mp + "/") for mp in machinepaths):
                 return True
 
-def oe_popen_env(d):
-    env = d.getVar("__oe_popen_env", False)
-    if env is None:
-        env = {}
-        for v in d.keys():
-            if d.getVarFlag(v, "export"):
-                env[v] = d.getVar(v, True) or ""
-        d.setVar("__oe_popen_env", env)
-    return env
-
-def oe_run(d, cmd, **kwargs):
-    import oe.process
-    kwargs["env"] = oe_popen_env(d)
-    return oe.process.run(cmd, **kwargs)
-
-def oe_popen(d, cmd, **kwargs):
-    import oe.process
-    kwargs["env"] = oe_popen_env(d)
-    return oe.process.Popen(cmd, **kwargs)
-
-def oe_system(d, cmd, **kwargs):
-    """ Popen based version of os.system. """
-    if not "shell" in kwargs:
-        kwargs["shell"] = True
-    return oe_popen(d, cmd, **kwargs).wait()
-
 oe_soinstall() {
 	# Purpose: Install shared library file and
 	#          create the necessary links
-- 
1.7.7.6



