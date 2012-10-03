Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TJKzL-0002jn-93 for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 11:11:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q938wWA1025862
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Oct 2012 09:58:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25642-02 for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Oct 2012 09:58:26 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q938wLT4025856
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Oct 2012 09:58:22 +0100
Message-ID: <1349254704.18301.22.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 03 Oct 2012 09:58:24 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] package.bbclass: Fix regression in -dbg packages introduced by explode_dep_versions change
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
X-List-Received-Date: Wed, 03 Oct 2012 09:11:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We need to iterate over the dictionary pulling out the values, not take the top
level keys. If we don't do this, we end up with dependencies on the values of
PACKAGES, not library dependencies.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index a14561d..73c4358 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1763,7 +1763,10 @@ python package_depchains() {
 
     if "-dbg" in pkgs:
         pkglibdeps = read_libdep_files(d)
-        pkglibdeplist = pkglibdeps.keys()
+        pkglibdeplist = []
+        for pkg in pkglibdeps:
+            for k in pkglibdeps[pkg]:
+                add_dep(pkglibdeplist, k)
         # FIXME this should not look at PN once all task recipes inherit from task.bbclass
         dbgdefaultdeps = ((d.getVar('DEPCHAIN_DBGDEFAULTDEPS', True) == '1') or (d.getVar('PN', True) or '').startswith('packagegroup-'))
 




