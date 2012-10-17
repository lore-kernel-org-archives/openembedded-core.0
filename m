Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TOaeb-0003Lh-M9
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Oct 2012 22:55:49 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TOaRk-0001s8-OD; Wed, 17 Oct 2012 22:42:32 +0200
Message-ID: <1350506395.4470.163.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Wed, 17 Oct 2012 21:39:55 +0100
In-Reply-To: <1350414852.4470.128.camel@x121e.pbcl.net>
References: <1349112564.32611.71.camel@phil-desktop>
	<507B3297.3010102@linux.intel.com>
	<1350297128.3259.132.camel@phil-desktop>
	<507DA7A0.5060100@linux.intel.com>
	<1350414852.4470.128.camel@x121e.pbcl.net>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] insane: Rationalise phdrs-based QA checks
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
X-List-Received-Date: Wed, 17 Oct 2012 20:55:49 -0000
X-Groupsio-MsgNum: 30649
Content-Type: multipart/mixed; boundary="=-/Bzh19DaZqU1I91SuDnP"

--=-/Bzh19DaZqU1I91SuDnP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-10-16 at 20:14 +0100, Phil Blundell wrote:
> On Tue, 2012-10-16 at 11:29 -0700, Saul Wold wrote:
> > On 10/15/2012 03:32 AM, Phil Blundell wrote:
> > > On Sun, 2012-10-14 at 14:45 -0700, Saul Wold wrote:
> > >> On 10/01/2012 10:29 AM, Phil Blundell wrote:
> > >>> Various different QA checks are based on essentially the same data from
> > >>> the ELF program headers.  Calling objdump to extract it repeatedly is
> > >>> inefficient, particularly if the shell is involved.  Instead, let's
> > >>> cache the output from objdump inside the qa.elf object and allow it to
> > >>> be reused by multiple tests.
> > >>>
> > >>> Also, using objdump instead of scanelf to check for bad RPATHs (in the
> > >>> same way that the useless-rpaths check was doing already) allows the
> > >>> dependency on pax-utils-native to be dropped.
> > >>>
> > >> This seems to be failing for a QemuArm build of world, specifically
> > >> lsbsetup, quilt, sysvinit, and foomatic-filters seems like its failing
> > >> on symlinks.
> > >
> > > I wasn't able to complete a build of world successfully due to some
> > > unrelated-looking breakage in xserver-xorg, but I did reproduce this
> > > problem by building quilt by hand.  The attached patch fixes it for me.
> > >
> > This is better, but I found another failure:
> > 
> > > ERROR: Error executing a python function in /intel/distro/meta/recipes-devtools/qemu/qemu_1.2.0.bb:
> > > ExecutionError: Execution of '/intel/poky/builds/world/tmp/sysroots/x86_64-linux/usr/bin/armv5te-poky-linux-gnueabi/arm-poky-linux-gnueabi-objdump -p /intel/poky/builds/world/tmp/work/armv5te-poky-linux-gnueabi/qemu-1.2.0-r3/packages-split/qemu/usr/share/qemu/palcode-clipper' failed with exit code 1:
> > > /intel/poky/builds/world/tmp/sysroots/x86_64-linux/usr/bin/armv5te-poky-linux-gnueabi/arm-poky-linux-gnueabi-objdump: /intel/poky/builds/world/tmp/work/armv5te-poky-linux-gnueabi/qemu-1.2.0-r3/packages-split/qemu/usr/share/qemu/palcode-clipper: File format not recognized
> > >
> > 
> > When I run file:
> > /intel/poky/builds/world/tmp/work/armv5te-poky-linux-gnueabi/qemu-1.2.0-r3/packages-split/qemu/usr/share/qemu/palcode-clipper: 
> > ELF 64-bit LSB executable, Alpha (unofficial), version 1 (SYSV), 
> > statically linked, not stripped
> > 
> > I was building qemuarm, but I had a done a qemuppc build earlier also.
> 
> Well, that's a bit weird.  It seems as though you have somehow gotten an
> Alpha binary installed, which isn't appropriate for either qemuarm or
> qemuppc.  In fact I don't think we support alpha in oe-core at all so
> it's a bit of a mystery how it would have been built in the first place.
> 
> On the one hand, this is a genuine problem and it's good that the QA
> check is diagnosing it.  On the other hand, it probably oughtn't to be
> diagnosing it by means of an objdump failure (and I think there is
> already a dedicated check for wrong ELF arch anyway).  So probably the
> right thing to do is just trap exceptions around running objdump and
> ignore any files that it doesn't understand.

So, it turns out that:

a) qemu is deliberately turning off the "wrong ELF architecture" check,
which implies that it wants to ship these foreign-architecture binaries.
It's not clear to me why this is a useful thing to do, but still.

b) if binutils is configured for qemux86 then it is quite happy to let
you run "objdump -p" on alpha and sparc binaries, which is what I would
have expected.  If it is configured for qemuarm then, for reasons which
are mysterious to me, you get "File format not recognised" in that
situation.

Anyway, we clearly shouldn't get a failure in that situation.  The
attached patch causes qa.py to trap errors from objdump and just return
a null output, which is pretty much what the calling code will expect.

p.


--=-/Bzh19DaZqU1I91SuDnP
Content-Disposition: attachment; filename="0001-qa-Trap-exceptions-when-running-objdump.patch"
Content-Type: text/x-patch; name="0001-qa-Trap-exceptions-when-running-objdump.patch";
	charset="UTF-8"
Content-Transfer-Encoding: 7bit

From ec8a41e464ae0fba8ad1d72f529a38b5ae30bfcf Mon Sep 17 00:00:00 2001
From: Phil Blundell <philb@gnu.org>
Date: Wed, 17 Oct 2012 21:34:58 +0100
Subject: [PATCH] qa: Trap exceptions when running objdump

This avoids propagating a failure if we encounter an ELF file
that objdump can't parse for any reason.  Some versions and/or
configurations of objdump will refuse to read files for "the
wrong" architecture.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/lib/oe/qa.py |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
index 9e5ab58..12dcd1f 100644
--- a/meta/lib/oe/qa.py
+++ b/meta/lib/oe/qa.py
@@ -102,5 +102,10 @@ class ELFFile:
         env = os.environ
         env["LC_ALL"] = "C"
 
-        self.objdump_output[cmd] = bb.process.run([ os.path.join(staging_dir, objdump), cmd, self.name ], env=env, shell=False)[0]
-        return self.objdump_output[cmd]
+        try:
+            bb.note("%s %s %s" % (objdump, cmd, self.name))
+            self.objdump_output[cmd] = bb.process.run([ os.path.join(staging_dir, objdump), cmd, self.name ], env=env, shell=False)[0]
+            return self.objdump_output[cmd]
+        except Exception, e:
+            bb.note("%s %s %s failed: %s" % (objdump, cmd, self.name, e))
+            return ""
-- 
1.7.10.4


--=-/Bzh19DaZqU1I91SuDnP--
