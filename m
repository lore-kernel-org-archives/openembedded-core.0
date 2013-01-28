Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TzqUj-00012R-O2 for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 16:19:45 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0SF8GVB006886; Mon, 28 Jan 2013 15:08:16 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id tD9VVcOHhFoB; Mon, 28 Jan 2013 15:08:15 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0SF89c6006869
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 28 Jan 2013 15:08:12 GMT
Message-ID: <1359385412.22371.67.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 28 Jan 2013 15:03:32 +0000
In-Reply-To: <20130128143520.GB16904@jama.palm1.palmone.com>
References: <1359363680-4588-1-git-send-email-constantinx.musca@intel.com>
	<20130128125637.GY16904@jama.palm1.palmone.com>
	<20130128143520.GB16904@jama.palm1.palmone.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] migrate_localcount.bbclass: use PRAUTOINX instead of PN & PV
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
X-List-Received-Date: Mon, 28 Jan 2013 15:19:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-01-28 at 15:35 +0100, Martin Jansa wrote:
> On Mon, Jan 28, 2013 at 01:56:37PM +0100, Martin Jansa wrote:
> > On Mon, Jan 28, 2013 at 11:01:20AM +0200, Constantin Musca wrote:
> > > - we need to use PRAUTOINX (it covers all cases)
> > > - it addresses bumped PE issues
> > 
> > Build is still runing, but entries in prserv db look correct now,
> > thanks!
> 
> It's already too late for my local build, but maybe it would be
> interesting for people still using OEBasic (instead of default
> OEBasicHash) to use PRSERV _only_ as LOCALCOUNT replacement as that was
> removed completely.
> 
> Now I see all packages are upgraded on target because of extra .0 
> in PR.
> 
> And it will stay constant .0 with OEBasic if I understood RP's answer
> correctly.
> 
> "The service works with both OEBasic and OEBasicHash
> generators, with the understanding that PR bumps happen when the
> checksum changes and the different generator mechanisms change
> signatures under different circumstances."

It won't just stick as .0. The underlying hashes change a fair bit with
both variants. The OEBasic version just doesn't inject them into stamps.
I therefore don't think this is going to work well for your use case.

> Only manual PE/PV/PR bump will change OEBasic signature, but also use 
> different key in PRMAIN_nohist, so again with '.0'.

I've been giving the OEBasic situation a bit of thought and the split
between OEBasic and OEBasicHash probably doesn't make sense. As things
stand, OEBasic is probably going to become less and less useful. How
about we redesign OEBasic so that:

a) It uses hashes as part of the stamp filenames (same as OEBasicHash)
b) It doesn't include other tasks outside of the current recipe in the 
   hash construction.

This means it will behave like classic OE with things not rebuilding
that often. However certain classes of changes will get accounted for
and those are probably useful and make sense. For example:

a) If you edit patches of a given recipe it will rebuild
b) If you change a task like do_configure, things after it will rerun in
a given recipe.
c) If a dependent task in another recipe changes, it won't rerun.

I *think* the changes to do this are simple:

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 79a410e..11c4208 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -1,5 +1,11 @@
 import bb.siggen
 
+def sstate_rundepfilter_basic(siggen, fn, recipename, task, dep, depname, dataCache):
+    # Always include our own inter-task dependencies
+    if recipename == depname:
+        return True
+    return False
+
 def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
     # Return True if we should keep the dependency, False to drop it
     def isNative(x):
@@ -53,14 +59,14 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
     # Default to keep dependencies
     return True
 
-class SignatureGeneratorOEBasic(bb.siggen.SignatureGeneratorBasic):
+class SignatureGeneratorOEBasic(bb.siggen.SignatureGeneratorBasicHash):
     name = "OEBasic"
     def init_rundepcheck(self, data):
         self.abisaferecipes = (data.getVar("SIGGEN_EXCLUDERECIPES_ABISAFE", True) or "").split()
         self.saferecipedeps = (data.getVar("SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS", True) or "").split()
         pass
     def rundep_check(self, fn, recipename, task, dep, depname, dataCache = None):
-        return sstate_rundepfilter(self, fn, recipename, task, dep, depname, dataCache)
+        return sstate_rundepfilter_basic(self, fn, recipename, task, dep, depname, dataCache)
 
 class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
     name = "OEBasicHash"

I'd be interested to see if this works better for people's use cases. It
will need a clean tmpdir as the stamps directory layout changes with
this patch.

Cheers,

Richard



