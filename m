Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RDGkX-0000WU-Fq for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 16:22:38 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9AENWjM027615 for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 15:23:32 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ZJYR+LtVx9SF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 15:23:32 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9AENRZx027601
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 15:23:30 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 10 Oct 2011 15:16:45 +0100
In-Reply-To: <20111010114506.GC5065@jama.jama.net>
References: <1317910796.6398.86.camel@ted>
	<37FC7DDC-D175-45B4-AF8A-F4D5AF384750@dominion.thruhere.net>
	<20111009181016.GB3847@jama.jama.net>
	<9CD7A2A3-228F-46AE-AE56-5D73C9372E4A@dominion.thruhere.net>
	<20111010114506.GC5065@jama.jama.net>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318256216.23801.37.camel@ted>
Mime-Version: 1.0
Subject: Re: sstate.bbclass: Ensure machine specific stamps are only wiped for the current task
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
X-List-Received-Date: Mon, 10 Oct 2011 14:22:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-10-10 at 13:45 +0200, Martin Jansa wrote:
> On Sun, Oct 09, 2011 at 08:11:45PM +0200, Koen Kooi wrote:
> > 
> > Op 9 okt. 2011, om 20:10 heeft Martin Jansa het volgende geschreven:
> > 
> > > On Sun, Oct 09, 2011 at 01:25:09PM +0200, Koen Kooi wrote:
> > >> 
> > >> Op 6 okt. 2011, om 16:19 heeft Richard Purdie het volgende geschreven:
> > >> 
> > >>> sstate was being a little too ethusiastic about removing stamp files and
> > >>> was removing stamp files for other machines when it shouldn't have been.
> > >>> 
> > >>> This patch teaches sstate about machine specific stamp extensions and
> > >>> allows it to only remove the current task's stampfiles.
> > >> 
> > >> Not sure if it's related to this problem or not but sstate is still not working as intented for me when switching machines, it keeps rebuilding the toolchain when switching machine. What I did this morning:
> > >> 
> > >> 1) wipe out tmp, sstate-cache, pseudodone
> > >> 2) MACHINE=beagleboard bitbake u-boot
> > >> 3) cp conf/machine/beagleboard.conf conf/machine/brokensstate.conf
> > >> 4) MACHINE=brokensstate bitbake u-boot
> > > 
> > > Same here.. :/ (building 3 armv7 machines.. always "from scratch").
> > 
> > To eliminate varables: Angstrom/shr/aurora/micro/other/all of the above?
> 
> DISTRO=shr
> 
> MACHINE=nokia900 bitbake shr-image -> builds from scratch, finished ok
> MACHINE=palmpre bitbake shr-image -> builds from scratch, finished ok
> MACHINE=palmpre2 bitbake shr-image -> builds from scratch, finished ok
> 
> without wiping anything (same tmp, same sstate-cache, same pseudodone)
> 
> MACHINE=palmpre bitbake shr-image -> builds from scratch, again!, finished ok
> MACHINE=palmpre2 bitbake shr-image -> builds from scratch, again!, finished ok
> MACHINE=nokia900 bitbake shr-image -> builds from scratch, again!, finished ok
> 
> palmpre and palmpre2 are "the same"
> $ cat meta-smartphone/meta-palm/conf/machine/palmpre.conf | grep -v ^#
> require conf/machine/include/palmpre.inc
> 
> $ cat meta-smartphone/meta-palm/conf/machine/palmpre2.conf | grep -v ^#
> require conf/machine/include/palmpre.inc
> 
> nokia900 is also armv7a-vfp-neon (that's why all packages except
> MACHINE_ARCH were always reused without rebuilding in OE-classic).
> 
> I have tried to debug sigdata files to see why and also tried to add
> MACHINEOVERRIDES[vardepsexclude] = "MACHINE"
> as RP suggested, but sofar haven't found solution at least to reuse
> already built sstate packages for armv7a-vfp-neon.

Also as a tip for debugging this, you can do what is in the following
commit (patch also inline below):

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/wip9&id=1261cc69b152f33b934c2448020dfa3c95f312c6

which will mean bitbake -n generates stamp files for a given bitbake
run. You can then quickly do:

MACHINE=A bitbake -n foo
MACHINE=B bitbake -n foo

for example and then look for cases where two stamp sigdata files were
generated. If you see them you can "bitbake-diffsigs A B" and I'll be
very interested in the results of that and "bitbake-diffsigs A"...

Cheers,

Richard

bitbake: Allow easier dry run stamp debugging

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/bitbake/lib/bb/build.py b/bitbake/lib/bb/build.py
index 8937f08..efa9ffe 100644
--- a/bitbake/lib/bb/build.py
+++ b/bitbake/lib/bb/build.py
@@ -255,7 +255,7 @@ def _task_data(fn, task, d):
     data.expandKeys(localdata)
     return localdata
 
-def _exec_task(fn, task, d, quieterr):
+def _exec_task(fn, task, d, quieterr, dryrun=False):
     """Execute a BB 'task'
 
     Execution of a task involves a bit more setup than executing a function,
@@ -317,10 +317,13 @@ def _exec_task(fn, task, d, quieterr):
     event.fire(TaskStarted(task, localdata), localdata)
     try:
         for func in (prefuncs or '').split():
-            exec_func(func, localdata)
-        exec_func(task, localdata)
+            if not dryrun:
+                exec_func(func, localdata)
+        if not dryrun:
+            exec_func(task, localdata)
         for func in (postfuncs or '').split():
-            exec_func(func, localdata)
+            if not dryrun:
+                exec_func(func, localdata)
     except FuncFailed as exc:
         if not quieterr:
             logger.error(str(exc))
@@ -355,13 +358,13 @@ def _exec_task(fn, task, d, quieterr):
 
     return 0
 
-def exec_task(fn, task, d):
+def exec_task(fn, task, d, dryrun=False):
     try: 
         quieterr = False
         if d.getVarFlag(task, "quieterrors") is not None:
             quieterr = True
 
-        return _exec_task(fn, task, d, quieterr)
+        return _exec_task(fn, task, d, quieterr, dryrun)
     except Exception:
         from traceback import format_exc
         if not quieterr:
diff --git a/bitbake/lib/bb/runqueue.py b/bitbake/lib/bb/runqueue.py
index aca06b5..e53da56 100644
--- a/bitbake/lib/bb/runqueue.py
+++ b/bitbake/lib/bb/runqueue.py
@@ -1156,8 +1156,7 @@ class RunQueueExecute:
                     logger.critical(str(exc))
                 os._exit(1)
             try:
-                if not self.cooker.configuration.dry_run:
-                    ret = bb.build.exec_task(fn, taskname, the_data)
+                ret = bb.build.exec_task(fn, taskname, the_data, self.cooker.configuration.dry_run)
                 os._exit(ret)
             except:
                 os._exit(1)






