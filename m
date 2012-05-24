Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SXaRk-0001pH-E5
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 17:59:28 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4OFnFNx010756
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2012 08:49:15 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 24 May 2012 08:49:15 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 May 2012 23:49:21 +0800
Message-ID: <9fb3726e1860e09abaee8c48beb48df239f47a86.1337874530.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1337874530.git.liezhi.yang@windriver.com>
References: <cover.1337874530.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] utils.bbclass: remove the unused oe_system
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
X-List-Received-Date: Thu, 24 May 2012 15:59:28 -0000
Content-Type: text/plain

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
1.7.1



