Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5482E65D5E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 21:10:26 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6OLAMOc025387 for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 22:10:22 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8m6c7qECRuby
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 22:10:21 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6OLAIC5025384
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 22:10:20 +0100
Message-ID: <1406236213.27697.18.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Jul 2014 22:10:13 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] lib/oe/classextend: Avoid early expansion of PR values
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
X-List-Received-Date: Thu, 24 Jul 2014 21:10:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Variables like RDEPENDS can contain EXTENDPKGV which in turn uses AUTOPR
based values. This gets set during do_package execution so we want to
defer expansion until then. The only way we can do this in the RDEPENDS
(and friends) mapping code is to subsitute a dummy value, then change it
back again. Horrible but I can't see any other way.

This resolves multilib build failures with inconsistent PR values.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oe/classextend.py b/meta/lib/oe/classextend.py
index 71c7759..68efca3 100644
--- a/meta/lib/oe/classextend.py
+++ b/meta/lib/oe/classextend.py
@@ -60,17 +60,22 @@ class ClassExtender(object):
             return self.extend_name(dep)
 
     def map_depends_variable(self, varname, suffix = ""):
+        # We need to preserve EXTENDPKGV so it can be expanded correctly later
         if suffix:
             varname = varname + "_" + suffix
+        orig = self.d.getVar("EXTENDPKGV", False)
+        self.d.setVar("EXTENDPKGV", "EXTENDPKGV")
         deps = self.d.getVar(varname, True)
         if not deps:
+            self.d.setVar("EXTENDPKGV", orig)
             return
         deps = bb.utils.explode_dep_versions2(deps)
         newdeps = {}
         for dep in deps:
             newdeps[self.map_depends(dep)] = deps[dep]
 
-        self.d.setVar(varname, bb.utils.join_deps(newdeps, False))
+        self.d.setVar(varname, bb.utils.join_deps(newdeps, False).replace("EXTENDPKGV", "${EXTENDPKGV}"))
+        self.d.setVar("EXTENDPKGV", orig)
 
     def map_packagevars(self):
         for pkg in (self.d.getVar("PACKAGES", True).split() + [""]):



