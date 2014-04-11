Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0CE1565D79
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Apr 2014 18:56:26 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Apr 2014 20:56:13 +0200
Message-Id: <1397242573-12730-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] recipe_sanity.bbclass: avoid error when running 'bitbake -e'
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Apr 2014 18:56:27 -0000

Running 'bitbake -e' without further arguments causes a stack trace on stderr:

| ERROR: Command execution failed: Traceback (most recent call last):
|   File "[...]/bitbake/lib/bb/command.py", line 99, in runAsyncCommand
|     commandmethod(self.cmds_async, self, options)
|   File "[...]/bitbake/lib/bb/command.py", line 405, in showEnvironment
|     command.cooker.showEnvironment(bfile)
|   File "[...]/bitbake/lib/bb/cooker.py", line 453, in showEnvironment
|     logger.plain("\npython %s () {\n%s}\n", e, data.getVar(e, envdata, 1))
|   File "[...]/bitbake/lib/bb/data.py", line 89, in getVar
|     return d.getVar(var, exp)
|   File "[...]/bitbake/lib/bb/data_smart.py", line 522, in getVar
|     return self.getVarFlag(var, "_content", expand, noweakdefault)
|   File "[...]/bitbake/lib/bb/data_smart.py", line 612, in getVarFlag
|     value = self.expand(value, cachename)
|   File "[...]/bitbake/lib/bb/data_smart.py", line 350, in expand
|     return self.expandWithRefs(s, varname).value
|   File "[...]/bitbake/lib/bb/data_smart.py", line 340, in expandWithRefs
|     raise ExpansionError(varname, s, exc)
| ExpansionError: Failure expanding variable can_delete_FILESPATH, expression was def can_delete_FILESPATH(cfgdata, d):
|     expected = cfgdata.get("FILESPATH")
|     #expected = "${@':'.join([os.path.normpath(os.path.join(fp, p, o)) for fp in d.getVar('FILESPATHBASE', True).split(':') for p in d.getVar('FILESPATHPKG', True).split(':') for o in (d.getVar('OVERRIDES', True) + ':').split(':') if os.path.exists(os.path.join(fp, p, o))])}:${FILESDIR}"
|     expectedpaths = d.expand(expected)
|     unexpanded = d.getVar("FILESPATH", 0)
|     filespath = d.getVar("FILESPATH", True).split(":")
|     filespath = [os.path.normpath(f) for f in filespath if os.path.exists(f)]
|     for fp in filespath:
|         if not fp in expectedpaths:
|             # __note("Path %s in FILESPATH not in the expected paths %s" %
|             # (fp, expectedpaths), d)
|             return False
|     return expected != unexpanded
|  which triggered exception AttributeError: 'NoneType' object has no attribute 'split'

Removing the commented second line in can_delete_FILESPATH() hides the error.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/classes/recipe_sanity.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/recipe_sanity.bbclass b/meta/classes/recipe_sanity.bbclass
index 5dd4624..ee04e33 100644
--- a/meta/classes/recipe_sanity.bbclass
+++ b/meta/classes/recipe_sanity.bbclass
@@ -59,7 +59,6 @@ def can_use_autotools_base(cfgdata, d):
 
 def can_delete_FILESPATH(cfgdata, d):
     expected = cfgdata.get("FILESPATH")
-    #expected = "${@':'.join([os.path.normpath(os.path.join(fp, p, o)) for fp in d.getVar('FILESPATHBASE', True).split(':') for p in d.getVar('FILESPATHPKG', True).split(':') for o in (d.getVar('OVERRIDES', True) + ':').split(':') if os.path.exists(os.path.join(fp, p, o))])}:${FILESDIR}"
     expectedpaths = d.expand(expected)
     unexpanded = d.getVar("FILESPATH", 0)
     filespath = d.getVar("FILESPATH", True).split(":")
-- 
1.8.3.2


