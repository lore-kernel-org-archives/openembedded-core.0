Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id D2EEB6DEEA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2013 22:57:52 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rB2Mvkr6015900 for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Dec 2013 22:57:46 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 59ZXWvTOE_vk
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2013 22:57:46 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rB2Mvi08015896
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Dec 2013 22:57:45 GMT
Message-ID: <1386025059.4463.6.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 02 Dec 2013 22:57:39 +0000
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: RFC: Locked down sstate cache usage
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
X-List-Received-Date: Mon, 02 Dec 2013 22:57:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I've been giving things some thought, specifically why sstate doesn't
get used more and why we have people requesting external toolchains. I'm
guessing the issue is that people don't like how often sstate can change
and the lack of an easy way to lock it down.

Locking it down is actually quite easy so I thought I'd share a quick
proof of concept of how you can do this (for example to a specific
toolchain). With an addition like this to local.conf (or wherever):

SIGGEN_LOCKEDSIGS = "\
gcc-cross:do_populate_sysroot:a8d91b35b98e1494957a2ddaf4598956 \
eglibc:do_populate_sysroot:13e8c68553dc61f9d67564f13b9b2d67 \
eglibc:do_packagedata:bfca0db1782c719d373f8636282596ee \
gcc-cross:do_packagedata:4b601ff4f67601395ee49c46701122f6 \
"

the code at the end of the email will force the hashes to those values
for the recipes mentioned. The system would then find and use those
specific objects from the sstate cache instead of trying to build
anything.

Obviously this is a little simplistic, you might need to put an override
against this to only apply those revisions for a specific architecture
for example. You'd also probably want to put code in the sstate hash
validation code to ensure it really did install these from sstate since
if it didn't you'd want to abort the build.

Anyhow, I thought I'd put this out there and see if there is interest in
better supporting this kind of usage of sstate?

Cheers,

Richard


diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 329c84d..fd015de 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -62,6 +62,16 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
     # Default to keep dependencies
     return True
 
+def sstate_lockedsigs(d):
+    sigs = {}
+    lockedsigs = (d.getVar("SIGGEN_LOCKEDSIGS", True) or "").split()
+    for ls in lockedsigs:
+        pn, task, h = ls.split(":", 2)
+        if pn not in sigs:
+            sigs[pn] = {}
+        sigs[pn][task] = h
+    return sigs
+
 class SignatureGeneratorOEBasic(bb.siggen.SignatureGeneratorBasic):
     name = "OEBasic"
     def init_rundepcheck(self, data):
@@ -76,9 +86,22 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
     def init_rundepcheck(self, data):
         self.abisaferecipes = (data.getVar("SIGGEN_EXCLUDERECIPES_ABISAFE", True) or "").split()
         self.saferecipedeps = (data.getVar("SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS", True) or "").split()
+        self.lockedsigs = sstate_lockedsigs(data)
         pass
     def rundep_check(self, fn, recipename, task, dep, depname, dataCache = None):
         return sstate_rundepfilter(self, fn, recipename, task, dep, depname, dataCache)
+    def get_taskhash(self, fn, task, deps, dataCache):
+        recipename = dataCache.pkg_fn[fn]
+        if recipename in self.lockedsigs:
+            if task in self.lockedsigs[recipename]:
+                k = fn + "." + task
+                h = self.lockedsigs[recipename][task]
+                self.taskhash[k] = h
+                #bb.warn("Using %s %s %s" % (recipename, task, h))
+                return h
+        h = super(bb.siggen.SignatureGeneratorBasicHash, self).get_taskhash(fn, task, deps, dataCache)
+        #bb.warn("%s %s %s" % (recipename, task, h))
+        return h
 
 # Insert these classes into siggen's namespace so it can see and select them
 bb.siggen.SignatureGeneratorOEBasic = SignatureGeneratorOEBasic


