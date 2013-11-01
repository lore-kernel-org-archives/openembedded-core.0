Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 3D5476D61F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 18:14:23 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA1IEAuP011999; Fri, 1 Nov 2013 18:14:11 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uaqKczF0HeKz; Fri,  1 Nov 2013 18:14:10 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA1IE79H011981
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 1 Nov 2013 18:14:09 GMT
Message-ID: <1383329643.6271.63.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Fri, 01 Nov 2013 18:14:03 +0000
In-Reply-To: <3227290.SyHHWdF4KT@helios>
References: <1383307932-4041-1-git-send-email-Martin.Jansa@gmail.com>
	<3227290.SyHHWdF4KT@helios>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] packagegroup.bbclass: Drop build-time dependencies
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
X-List-Received-Date: Fri, 01 Nov 2013 18:14:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-11-01 at 13:37 +0000, Paul Eggleton wrote:
> Hi Martin,
> 
> On Friday 01 November 2013 13:12:12 Martin Jansa wrote:
> > * RFC because:
> >   packagegroup.bbclass inherits allarch and by default sets
> >   PACKAGE_ARCH = "all", but then it has runtime-dependency on
> >   TUNE_PKGARCH packages and different signatures, so instead
> >   of setting INHIBIT_DEFAULT_DEPS in addition to inherit allarch
> >   I would like to drop default allarch completely.
> 
> The fix looks OK, but I don't think we should be going further and removing the 
> inherit. To my mind, the question of dependencies comes down to whether or not 
> the packagegroup output changes depending on TUNE_PKGARCH, which in the 
> general case it should not do.
> 
> If we need to do some optimisation to avoid the packagegroup recipe rebuilding 
> when it shouldn't due to packages it "contains" changing, we can certainly 
> look at that.

A better idea might be something like:

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 852fb7e..23e28f0 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -11,6 +11,8 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
     def isKernel(fn):
         inherits = " ".join(dataCache.inherits[fn])
         return inherits.find("module-base.bbclass") != -1 or inherits.find("linux-kernel-base.bbclass") != -1
+    def isPackageGroup(x):
+        return "packagegroup-" in x
 
     # Always include our own inter-task dependencies
     if recipename == depname:
@@ -27,6 +29,10 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
 
     # Only target packages beyond here
 
+    # packagegroups are assumed to have well behaved names which don't change between architecures/tunes
+    if isPackageGroup(recipename):
+        return False  
+
     # Drop native/cross/nativesdk dependencies from target recipes
     if isNative(depname) or isCross(depname) or isNativeSDK(depname):
         return False

although this is untested and needs more careful thought...

Cheers,

Richard


