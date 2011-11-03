Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RM5Yt-0002v3-RS
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2011 23:15:03 +0100
Received: by faas16 with SMTP id s16so2260153faa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2011 15:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8Djb/ycqVqPQOcja/I7RWF6ZtGr2yFi+VhEBKv/jZnM=;
	b=oYb3960lVUFuvIVEu5zX0+mJVsuOVh7UyIJHtRD/wIbThSnXlww/l06UhUDlOxgcvE
	SjZjJ+tt8r0Gpu4y7Zx6emlEBo4xANSkiFbHAw4kPke4pdfZ4a3tX+pr/LsAA7I8hImM
	vED5KgXYEIo8CyHIEU3bzCaApvsMLQa1ORp48=
Received: by 10.223.76.27 with SMTP id a27mr19265058fak.12.1320358134353;
	Thu, 03 Nov 2011 15:08:54 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id g25sm14181403fae.16.2011.11.03.15.08.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Nov 2011 15:08:53 -0700 (PDT)
Date: Thu, 3 Nov 2011 23:08:37 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111103220837.GO9949@jama.jama.net>
References: <1317910796.6398.86.camel@ted>
	<37FC7DDC-D175-45B4-AF8A-F4D5AF384750@dominion.thruhere.net>
	<20111009181016.GB3847@jama.jama.net>
	<9CD7A2A3-228F-46AE-AE56-5D73C9372E4A@dominion.thruhere.net>
	<20111010114506.GC5065@jama.jama.net>
	<1318256283.23801.38.camel@ted>
	<20111103163328.GM9949@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20111103163328.GM9949@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Thu, 03 Nov 2011 22:15:04 -0000
X-Groupsio-MsgNum: 11883
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UOYwgDhKKQYesrzQ"
Content-Disposition: inline

--UOYwgDhKKQYesrzQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 03, 2011 at 05:33:28PM +0100, Martin Jansa wrote:
> Hi,
>=20
> to recap what we have talked about on ELCE;
>=20
> Currently it doesn't seem to change sstate checksums after switching
> MACHINE, but still it rebuilds everything at least once after switch.
>=20
> Today I've tried to wipe tmp and rebuild from sstate-cache and I've
> noticed interesting thing:
>=20
> All recipes are starting with=20
> do_populate_lic_setscene=20
> not=20
> do_populate_sysroot_setscene
> like ie koen's build does
>=20
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing SetScene Tasks
> NOTE: package quilt-native-0.48-r0: task do_populate_lic_setscene: Started
> NOTE: package shr-image-2.0-r18: task do_populate_lic_setscene: Started
> NOTE: package quilt-native-0.48-r0: task do_populate_lic_setscene: Succee=
ded
> NOTE: package shr-image-2.0-r18: task do_populate_lic_setscene: Succeeded
>=20
> Does do_populate_lic_setscene wipe all stamps after do_populate_lic so it=
=20
> causes the rebuild instead of population of sysroot from sstate?
>=20
> IIRC I had similar issue when I was starting to use oe-core and it was=20
> in the end caused by inheriting package_ipk (once directly from distro co=
nfig=20
> and once through sane-feed-ipk.inc) and it was fixed 6 months ago by:
> http://git.shr-project.org/git/?p=3Dmeta-shr.git;a=3Dcommit;h=3D00623b3c6=
dd01c4a227008f7cfdb0801cb06f49a
> And IIRC we've talked about some ways to make sstate less error-prone
> for such things.
>=20
> Now I have similar symptoms but only after switching MACHINE.
>=20
> Any hint?

With few more hours of debuging this.. I can say that sometimes it works,=
=20
but sometimes it's too strict to be usefull anyway.

Whole logs are here:
http://build.shr-project.org/tests/jama/sstate.test
here I'll try to shorten as much as possible.

OE @shr ~/shr-core $ export MACHINE=3Dqemuarm
OE qemuarm@shr ~/shr-core $ bitbake -k core-image-core
=2E....
NOTE: package core-image-core-1.0-r0: task do_rm_work_all: Succeeded
NOTE: Tasks Summary: Attempted 5306 tasks of which 5250 didn't need to be r=
erun and 0 failed.
OE qemuarm@shr ~/shr-core $ bitbake -k expat
Parsing of 1436 .bb files complete (1423 cached, 13 parsed). 1837 targets, =
56 skipped, 0 masked, 0 errors.

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Running task 2428 of 2428 (ID: 11, /OE/shr-core/openembedded-core/met=
a/recipes-core/expat/expat_2.0.1.bb, do_rm_work_all)
NOTE: package expat-2.0.1-r1: task do_rm_work_all: Started
NOTE: package expat-2.0.1-r1: task do_rm_work_all: Succeeded
NOTE: Tasks Summary: Attempted 2428 tasks of which 2427 didn't need to be r=
erun and 0 failed.

All done

OE qemuarmB@shr ~/shr-core $ cp openembedded-core/meta/conf/machine/qemuarm=
=2Econf openembedded-core/meta/conf/machine/qemuarmcopy.conf
OE qemuarmB@shr ~/shr-core $ export MACHINE=3Dqemuarmcopy
OE qemuarmcopy@shr ~/shr-core $ bitbake -k expat
Parsing of 1436 .bb files complete (0 cached, 1436 parsed). 1837 targets, 5=
6 skipped, 0 masked, 0 errors.

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
=2E.
libproxy fail (around task 2232)
fix

OE qemuarmcopy@shr ~/shr-core $ bitbake -k expat
libproxy built
NOTE: Tasks Summary: Attempted 2428 tasks of which 2232 didn't need to be r=
erun and 0 failed.

So after 3 hours we have qemuarm and qemuarmcopy (identical machine) with e=
xpat built! hurray
But seems like nothing was reused from qemuarm build.

once again for check

OE qemuarmcopy@shr ~/shr-core $ export MACHINE=3Dqemuarm
OE qemuarm@shr ~/shr-core $ bitbake -k expat
Parsing of 1436 .bb files complete (1423 cached, 13 parsed). 1837 targets, =
56 skipped, 0 masked, 0 errors.
=2E..
NOTE: Tasks Summary: Attempted 2428 tasks of which 2428 didn't need to be r=
erun and 0 failed.

OE qemuarm@shr ~/shr-core $ export MACHINE=3Dqemuarmcopy
OE qemuarmcopy@shr ~/shr-core $ bitbake -k expat
Parsing of 1436 .bb files complete (1423 cached, 13 parsed). 1837 targets, =
56 skipped, 0 masked, 0 errors.
=2E..
NOTE: Tasks Summary: Attempted 2428 tasks of which 2428 didn't need to be r=
erun and 0 failed.

great

OE qemuarmcopy@shr ~/shr-core/tmp/sstate-control $ ls -lah manifest-qemuarm=
*expat* manifest-spitz-*expat* | sed 's/.*bitbake//g'
  460 Oct 30 00:54 manifest-qemuarm-expat.deploy-ipk
 1.2K Oct 30 00:54 manifest-qemuarm-expat.package
  138 Oct 30 00:34 manifest-qemuarm-expat.populate-lic
  732 Oct 30 00:54 manifest-qemuarm-expat.populate-sysroot
  460 Nov  3 19:50 manifest-qemuarmcopy-expat.deploy-ipk
 1.2K Nov  3 19:50 manifest-qemuarmcopy-expat.package
  138 Nov  3 19:17 manifest-qemuarmcopy-expat.populate-lic
  788 Nov  3 19:50 manifest-qemuarmcopy-expat.populate-sysroot
  460 Oct 25 15:35 manifest-spitz-expat.deploy-ipk
 1.2K Oct 25 15:35 manifest-spitz-expat.package
  138 Oct 25 15:35 manifest-spitz-expat.populate-lic
  704 Oct 25 15:35 manifest-spitz-expat.populate-sysroot

OE qemuarmcopy@shr ~/shr-core/sstate-cache $ ls -la1 sstate-expat-armv5te-o=
e-linux-gnueabi-2.0.1-r1-armv5te-2-* | sort | sed 's/.*bitbake//g'
    926 Nov  3 19:17 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-b198883dcffdb3af1a2c669f97d379ca_populate-lic.tgz
   8444 Nov  3 19:17 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-b198883dcffdb3af1a2c669f97d379ca_populate-lic.tgz.siginfo
  12409 Nov  3 19:50 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-62f6df13c2e883d59f8e73e5eb24fdab_deploy-ipk.tgz.siginfo
  12419 Oct 25 15:35 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-757ebe15c6afc27935bb3f3b823f1a12_deploy-ipk.tgz.siginfo
  12419 Oct 30 00:54 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-e2d316a9a054855d4433a3734e343db8_deploy-ipk.tgz.siginfo
  21852 Nov  3 19:50 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-1a807cb22931fac0fbd848d258cafecd_populate-sysroot.tgz.siginfo
  21920 Oct 25 15:35 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-d813b67ed935225757b90d014f631652_populate-sysroot.tgz.siginfo
  21927 Oct 30 00:54 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-e90bb07db6e100f14ee8f8eed99a7d7e_populate-sysroot.tgz.siginfo
  91310 Oct 25 15:35 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-f22b72a744d826703a553960f3402bc9_package.tgz.siginfo
  91317 Oct 30 00:54 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-634056338ea09623cd84437f710e04d5_package.tgz.siginfo
  91826 Nov  3 19:50 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-0bd093f2a681edc159eff0dc784022f9_package.tgz.siginfo
 339323 Oct 25 15:35 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-d813b67ed935225757b90d014f631652_populate-sysroot.tgz
 339468 Oct 30 00:54 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-e90bb07db6e100f14ee8f8eed99a7d7e_populate-sysroot.tgz
 339470 Nov  3 19:50 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-1a807cb22931fac0fbd848d258cafecd_populate-sysroot.tgz
 437319 Oct 25 15:35 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-757ebe15c6afc27935bb3f3b823f1a12_deploy-ipk.tgz
 437805 Nov  3 19:50 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-62f6df13c2e883d59f8e73e5eb24fdab_deploy-ipk.tgz
 437864 Oct 30 00:54 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-e2d316a9a054855d4433a3734e343db8_deploy-ipk.tgz
 882262 Oct 25 15:35 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-f22b72a744d826703a553960f3402bc9_package.tgz
 882411 Nov  3 19:50 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-0bd093f2a681edc159eff0dc784022f9_package.tgz
 882415 Oct 30 00:54 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-634056338ea09623cd84437f710e04d5_package.tgz

So it seems we have the same populate-lic.tgz.siginfo for all 3 machines bu=
t remaining tasks are 1 for each machine.

so lets check deploy-ipk for qemuarm and qemuarmcopy..

OE qemuarmcopy@shr ~/shr-core/sstate-cache $ bitbake-diffsigs sstate-expat-=
armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te-2-e2d316a9a054855d4433a3734e343db=
8_deploy-ipk.tgz.siginfo sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-arm=
v5te-2-62f6df13c2e883d59f8e73e5eb24fdab_deploy-ipk.tgz.siginfo
basehash changed from 1d549bac0c3a8e400f1b56b7df9cf79e to 7558b2191b73c3ef5=
d99e608c2701215
Variable OPKGBUILDCMD value changed from opkg-build -o 0 -g 0 to opkg-build
Hash for dependent task virtual:native:/OE/shr-core/openembedded-core/meta/=
recipes-devtools/opkg-utils/opkg-utils_svn.bb.do_populate_sysroot changed f=
rom ed94400e8710f5a838f362f1ce67fb78 to 23c7d629ee4bf98f81cb85af901e7396
Hash for dependent task /OE/shr-core/openembedded-core/meta/recipes-core/ex=
pat/expat_2.0.1.bb.do_package changed from 634056338ea09623cd84437f710e04d5=
 to 0bd093f2a681edc159eff0dc784022f9
Hash for dependent task virtual:native:/OE/shr-core/openembedded-core/meta/=
recipes-devtools/pseudo/pseudo_1.1.1.bb.do_populate_sysroot changed from dd=
e1a4ad1e7479005c272dda013d87ef to fca554e63de71499466d62d6c6d0f38c

ahh lots of changes.. but wait!
So MACHINE=3Dqemuarm first said
NOTE: Tasks Summary: Attempted 2428 tasks of which 2427 didn't need to be r=
erun and 0 failed.
but sstate checksums were invalid already for qemuarm (ie due to OPKGBUILDC=
MD change)

So let's retry with clean sstate:

OE qemuarmcopy@shr ~/shr-core $ bitbake -c cleansstate -b openembedded-core=
/meta/recipes-core/expat/expat_2.0.1.bb
=2E.
OE qemuarmcopy@shr ~/shr-core/sstate-cache $ ls -la1 sstate-expat-armv5te-o=
e-linux-gnueabi-2.0.1-r1-armv5te-2-* | sort | sed 's/.*bitbake//g'
ls: cannot access sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te-2-=
*: No such file or directory

OK no sstate tgz for all 3 armv5t machines

OE qemuarmcopy@shr ~/shr-core/tmp/sstate-control $ ls -lah manifest-qemuarm=
*expat* manifest-spitz-*expat* |  sed 's/.*bitbake//g'
  460 Oct 30 00:54 manifest-qemuarm-expat.deploy-ipk
 1.2K Oct 30 00:54 manifest-qemuarm-expat.package
  138 Oct 30 00:34 manifest-qemuarm-expat.populate-lic
  732 Oct 30 00:54 manifest-qemuarm-expat.populate-sysroot
  460 Oct 25 15:35 manifest-spitz-expat.deploy-ipk
 1.2K Oct 25 15:35 manifest-spitz-expat.package
  138 Oct 25 15:35 manifest-spitz-expat.populate-lic
  704 Oct 25 15:35 manifest-spitz-expat.populate-sysroot

Remaining 2 armv5t machines still have their manifests, lets clean them too.

OE qemuarmcopy@shr ~/shr-core $ export MACHINE=3Dqemuarm   =20
OE qemuarm@shr ~/shr-core $ bitbake -c cleansstate -b openembedded-core/met=
a/recipes-core/expat/expat_2.0.1.bb=20
=2E...

OE qemuarm@shr ~/shr-core $ export MACHINE=3Dspitz
OE spitz@shr ~/shr-core $ bitbake -c cleansstate -b openembedded-core/meta/=
recipes-core/expat/expat_2.0.1.bb=20
=2E..

OE qemuarm@shr ~/shr-core/tmp/sstate-control $ ls -lah manifest-qemuarm*exp=
at* |  sed 's/.*bitbake//g'
ls: cannot access manifest-qemuarm*expat*: No such file or directory

OK good, clean start

OE qemuarm@shr ~/shr-core $ bitbake expat
Parsing of 1436 .bb files complete (1423 cached, 13 parsed). 1837 targets, =
56 skipped, 0 masked, 0 errors.
=2E..
NOTE: Tasks Summary: Attempted 2428 tasks of which 2414 didn't need to be r=
erun and 0 failed.

OE qemuarm@shr ~/shr-core $ export MACHINE=3Dqemuarmcopy                   =
                                                                           =
       =20
OE qemuarmcopy@shr ~/shr-core/sstate-cache $ ls -la1 sstate-expat-armv5te-o=
e-linux-gnueabi-2.0.1-r1-armv5te-2-* | sort | sed 's/.*bitbake//g'
    926 Nov  3 21:50 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-b198883dcffdb3af1a2c669f97d379ca_populate-lic.tgz
   8444 Nov  3 21:50 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-b198883dcffdb3af1a2c669f97d379ca_populate-lic.tgz.siginfo
  12409 Nov  3 21:51 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-62f6df13c2e883d59f8e73e5eb24fdab_deploy-ipk.tgz.siginfo
  21852 Nov  3 21:50 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-1a807cb22931fac0fbd848d258cafecd_populate-sysroot.tgz.siginfo
  91826 Nov  3 21:51 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-0bd093f2a681edc159eff0dc784022f9_package.tgz.siginfo
 339474 Nov  3 21:50 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-1a807cb22931fac0fbd848d258cafecd_populate-sysroot.tgz
 437687 Nov  3 21:51 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-62f6df13c2e883d59f8e73e5eb24fdab_deploy-ipk.tgz
 882413 Nov  3 21:51 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-0bd093f2a681edc159eff0dc784022f9_package.tgz

OE qemuarmcopy@shr ~/shr-core/tmp/sstate-control $ ls -lah manifest-qemuarm=
*expat* |  sed 's/.*bitbake//g'
  460 Nov  3 21:51 manifest-qemuarm-expat.deploy-ipk
 1.2K Nov  3 21:51 manifest-qemuarm-expat.package
  138 Nov  3 21:50 manifest-qemuarm-expat.populate-lic
  732 Nov  3 21:50 manifest-qemuarm-expat.populate-sysroot

sofar good

OE qemuarmcopy@shr ~/shr-core $ bitbake expat
Parsing of 1436 .bb files complete (1423 cached, 13 parsed). 1837 targets, =
56 skipped, 0 masked, 0 errors.

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: package expat-2.0.1-r1: task do_package_write_ipk_setscene: Started
NOTE: package expat-2.0.1-r1: task do_populate_sysroot_setscene: Started
NOTE: package expat-2.0.1-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: package expat-2.0.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: package expat-2.0.1-r1: task do_package_setscene: Started
NOTE: package expat-2.0.1-r1: task do_package_setscene: Succeeded
NOTE: Executing RunQueue Tasks
NOTE: Tasks Summary: Attempted 2428 tasks of which 2428 didn't need to be r=
erun and 0 failed.

OE spitz@shr ~/shr-core/tmp/sstate-control $ ls -lah manifest-qemuarm*expat=
* |  sed 's/.*bitbake//g'
  460 Nov  3 21:51 manifest-qemuarm-expat.deploy-ipk
 1.2K Nov  3 21:51 manifest-qemuarm-expat.package
  138 Nov  3 21:50 manifest-qemuarm-expat.populate-lic
  732 Nov  3 21:50 manifest-qemuarm-expat.populate-sysroot
  460 Nov  3 21:54 manifest-qemuarmcopy-expat.deploy-ipk
 1.2K Nov  3 21:54 manifest-qemuarmcopy-expat.package
  788 Nov  3 21:54 manifest-qemuarmcopy-expat.populate-sysroot

nice! everything reused! lets try spitz..

OE spitz@shr ~/shr-core $ bitbake expat
NOTE: Out of date cache found, rebuilding...
NOTE: shr DOES NOT support sysvinit because use systemd now                =
                                                                    | ETA: =
 0:01:26
NOTE: shr DOES NOT support external-poky-toolchain because use internal too=
lchain                                                              | ETA: =
 0:01:29
NOTE: shr DOES NOT support external-csl-toolchain because use internal tool=
chain
NOTE: shr DOES NOT support console-tools because use kbd now
NOTE: shr DOES NOT support libiconv because libiconv is provided by LIBC   =
                                                                    | ETA: =
 0:01:30
NOTE: shr DOES NOT support libiconv because libiconv is provided by LIBC
NOTE: shr DOES NOT support gconf-dbus because gconf-dbus is provided by gco=
nf                                                                  | ETA: =
 0:01:32
NOTE: shr DOES NOT support xserver-common because use x11-common now#######=
####################################                                | ETA: =
 0:00:35
Parsing recipes: 100% |####################################################=
####################################################################| Time:=
 0:04:23
Parsing of 1436 .bb files complete (0 cached, 1436 parsed). 1837 targets, 5=
2 skipped, 0 masked, 0 errors.

OE Build Configuration:
BB_VERSION        =3D "1.13.3"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D "spitz"
DISTRO            =3D "shr"
DISTRO_VERSION    =3D "20111103"
TUNE_FEATURES     =3D "armv5 dsp thumb xscale"
TARGET_FPU        =3D "soft"
meta-jama         =3D "master:f699df1c7aa69f669cf0e6f0e1fe5cc1e7f3e29e"
meta-shr         =20
meta-aurora      =20
meta-fso          =3D "jama:b159c41f87b6349a1b3963b77a696e3414012fc9"
meta-efl         =20
meta-oe          =20
meta-gnome       =20
meta-gpe          =3D "shr:b4ef7ac3f70ef15c45ef01af87a665d2a4135890"
meta-nokia       =20
meta-htc         =20
meta-palm        =20
meta-openmoko    =20
meta-samsung      =3D "jama:b159c41f87b6349a1b3963b77a696e3414012fc9"
meta-handheld     =3D "jansa/spitz:b228c7de95d49afc31866523c1c542a53f6229a7"
meta              =3D "jansa/test:9f46daa3b656ccd83ac3322ab8c8a027eb09b260"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Running task 1961 of 2428 (ID: 4, /OE/shr-core/openembedded-core/meta=
/recipes-core/expat/expat_2.0.1.bb, do_fetch)
NOTE: Running task 2142 of 2428 (ID: 1248, virtual:native:/OE/shr-core/meta=
-openembedded/meta-gnome/recipes-gnome/gobject-introspection/gobject-intros=
pection_
git.bb, do_fetch)
NOTE: package expat-2.0.1-r1: task do_fetch: Started
NOTE: package expat-2.0.1-r1: task do_fetch: Succeeded
NOTE: Running task 2143 of 2428 (ID: 0, /OE/shr-core/openembedded-core/meta=
/recipes-core/expat/expat_2.0.1.bb, do_unpack)
NOTE: package expat-2.0.1-r1: task do_unpack: Started
NOTE: package gobject-introspection-native-1.29.0+gitr3+8d64bc23d2b837421ec=
f9c7b0e4b8d5d95ca0d21-r0: task do_fetch: Started
=2E..
NOTE: package gobject-introspection-native-1.29.0+gitr3+8d64bc23d2b837421ec=
f9c7b0e4b8d5d95ca0d21-r0: task do_rm_work: Succeeded
NOTE: package libproxy-0.4.7-r1: task do_fetch: Started
=2E..
NOTE: package expat-2.0.1-r1: task do_rm_work: Succeeded
NOTE: package libproxy-0.4.7-r1: task do_rm_work: Started
NOTE: package libproxy-0.4.7-r1: task do_rm_work: Succeeded
NOTE: Running task 2428 of 2428 (ID: 11, /OE/shr-core/openembedded-core/met=
a/recipes-core/expat/expat_2.0.1.bb, do_rm_work_all)
NOTE: package expat-2.0.1-r1: task do_rm_work_all: Started
NOTE: package expat-2.0.1-r1: task do_rm_work_all: Succeeded
NOTE: Tasks Summary: Attempted 2428 tasks of which 2388 didn't need to be r=
erun and 0 failed.

libproxy was built because I had to cleansstate it in first qemuarmcopy bui=
ld - remember?
gobject-introspection-native was rebuilt for some reason, but probably not =
important

but why did it build expat again?

OE spitz@shr ~/shr-core/sstate-cache $ ls -la1 sstate-expat-armv5te-oe-linu=
x-gnueabi-2.0.1-r1-armv5te-2-* | sort | sed 's/.*bitbake//g'
    924 Nov  3 22:02 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-b198883dcffdb3af1a2c669f97d379ca_populate-lic.tgz
   8444 Nov  3 22:02 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-b198883dcffdb3af1a2c669f97d379ca_populate-lic.tgz.siginfo
  12409 Nov  3 21:51 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-62f6df13c2e883d59f8e73e5eb24fdab_deploy-ipk.tgz.siginfo
  12409 Nov  3 22:04 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-8ddf3a5ca6b77e09cb0c64fcc7ff5279_deploy-ipk.tgz.siginfo
  21845 Nov  3 22:03 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-20b5b1202729ee864303af147d64958d_populate-sysroot.tgz.siginfo
  21852 Nov  3 21:50 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-1a807cb22931fac0fbd848d258cafecd_populate-sysroot.tgz.siginfo
  91819 Nov  3 22:04 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-cab79e114cc993bf250b13dfa8a93624_package.tgz.siginfo
  91826 Nov  3 21:51 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-0bd093f2a681edc159eff0dc784022f9_package.tgz.siginfo
 339330 Nov  3 22:03 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-20b5b1202729ee864303af147d64958d_populate-sysroot.tgz
 339474 Nov  3 21:50 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-1a807cb22931fac0fbd848d258cafecd_populate-sysroot.tgz
 437571 Nov  3 22:04 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-8ddf3a5ca6b77e09cb0c64fcc7ff5279_deploy-ipk.tgz
 437687 Nov  3 21:51 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-62f6df13c2e883d59f8e73e5eb24fdab_deploy-ipk.tgz
 882277 Nov  3 22:04 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-cab79e114cc993bf250b13dfa8a93624_package.tgz
 882413 Nov  3 21:51 sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te=
-2-0bd093f2a681edc159eff0dc784022f9_package.tgz

OE spitz@shr ~/shr-core/tmp/sstate-control $ ls -lah manifest-qemuarm*expat=
* manifest-spitz-*expat* |  sed 's/.*bitbake//g'
  460 Nov  3 21:51 manifest-qemuarm-expat.deploy-ipk
 1.2K Nov  3 21:51 manifest-qemuarm-expat.package
  138 Nov  3 21:50 manifest-qemuarm-expat.populate-lic
  732 Nov  3 21:50 manifest-qemuarm-expat.populate-sysroot
  460 Nov  3 21:54 manifest-qemuarmcopy-expat.deploy-ipk
 1.2K Nov  3 21:54 manifest-qemuarmcopy-expat.package
  788 Nov  3 21:54 manifest-qemuarmcopy-expat.populate-sysroot
  460 Nov  3 22:04 manifest-spitz-expat.deploy-ipk
 1.2K Nov  3 22:04 manifest-spitz-expat.package
  138 Nov  3 22:02 manifest-spitz-expat.populate-lic
  704 Nov  3 22:03 manifest-spitz-expat.populate-sysroot

OE qemuarm@shr ~/shr-core/sstate-cache $ bitbake-diffsigs sstate-expat-armv=
5te-oe-linux-gnueabi-2.0.1-r1-armv5te-2-cab79e114cc993bf250b13dfa8a93624_pa=
ckage.tgz.siginfo sstate-expat-armv5te-oe-linux-gnueabi-2.0.1-r1-armv5te-2-=
0bd093f2a681edc159eff0dc784022f9_package.tgz.siginfo
basehash changed from 46af1626aaa837363f75be1feb68a887 to 538e0e2d40c961a31=
a4347625af0b0f2
Variable TUNE_CCARGS value changed from  ${@bb.utils.contains("TUNE_FEATURE=
S", "armv5", "-march=3Darmv5${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}", "", d)} ${=
@bb.utils.contains("TUNE_FEATURES", "armv4", "-march=3Darmv4${ARMPKGSFX_THU=
MB}", "", d)} ${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M=
_OPT}", "", d)} ${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork",=
 "-mno-thumb-interwork", "-mthumb-interwork", d)} ${@bb.utils.contains("TUN=
E_FEATURES", "vfp", bb.utils.contains("TUNE_FEATURES", "callconvention-hard=
", "-mfloat-abi=3Dhard", "-mfloat-abi=3Dsoftfp", d), "" ,d)} ${@bb.utils.co=
ntains("TUNE_FEATURES", "xscale", "-mtune=3Dxscale", "", d)} to  ${@bb.util=
s.contains("TUNE_FEATURES", "armv5", "-march=3Darmv5${ARMPKGSFX_THUMB}${ARM=
PKGSFX_DSP}", "", d)} ${@bb.utils.contains("TUNE_FEATURES", "armv4", "-marc=
h=3Darmv4${ARMPKGSFX_THUMB}", "", d)} ${@bb.utils.contains("TUNE_FEATURES",=
 "thumb", "${ARM_THUMB_M_OPT}", "", d)} ${@bb.utils.contains("TUNE_FEATURES=
", "no-thumb-interwork", "-mno-thumb-interwork", "-mthumb-interwork", d)} $=
{@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUNE_FEATURE=
S", "callconvention-hard", "-mfloat-abi=3Dhard", "-mfloat-abi=3Dsoftfp", d)=
, "" ,d)} ${@bb.utils.contains("TUNE_FEATURES", "arm926ejs", "-mtune=3Darm9=
26ej-s", "", d)}
Hash for dependent task /OE/shr-core/openembedded-core/meta/recipes-core/ex=
pat/expat_2.0.1.bb.do_install changed from caca792bd48071654a7061388de25373=
 to 18e1dbc2128e23f65b5a8d8fc418a38d
Hash for dependent task /OE/shr-core/openembedded-core/meta/recipes-devtool=
s/gcc/gcc-cross_4.6.bb.do_package changed from dd50ecd95cc6795a9dd0cd2bf46f=
402d to b781ef14e88af52bab8e86f18fd44e8a
Hash for dependent task /OE/shr-core/openembedded-core/meta/recipes-core/eg=
libc/eglibc_2.14.bb.do_package changed from 585a01290d2062f02ec6618a9b4b661=
d to 27699293b72b7b12aa2662b9a1a66a53
Hash for dependent task /OE/shr-core/openembedded-core/meta/recipes-devtool=
s/desktop-file-utils/desktop-file-utils-native_0.15.bb.do_populate_sysroot =
changed from 67753340d7173dcf7d0a50f750b322b1 to 9d6d5166a23472faa5b66c8ab8=
6a9448
Hash for dependent task /OE/shr-core/openembedded-core/meta/recipes-devtool=
s/gcc/gcc-runtime_4.6.bb.do_package changed from 66c434a5afcb5895d45e5f78a5=
375240 to de96ebfb46addf8e7a945a56da436af5
Hash for dependent task /OE/shr-core/openembedded-core/meta/recipes-devtool=
s/libtool/libtool-cross_2.4.bb.do_package changed from c2e9e854f6c13ae537f6=
d6edc6b6ed54 to 34ccdc741d85abba60afe3ce93676e77

aaah so they're compatible only as far as they have completely the same TUN=
E_CCARGS?

few more white-spaces to see the diff:
Variable TUNE_CCARGS value changed from =20
${@bb.utils.contains("TUNE_FEATURES", "armv5", "-march=3Darmv5${ARMPKGSFX_T=
HUMB}${ARMPKGSFX_DSP}", "", d)}=20
${@bb.utils.contains("TUNE_FEATURES", "armv4", "-march=3Darmv4${ARMPKGSFX_T=
HUMB}", "", d)}=20
${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", "", d)=
}=20
${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", "-mno-thumb-int=
erwork", "-mthumb-interwork", d)}=20
${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUNE_FEATUR=
ES", "callconvention-hard", "-mfloat-abi=3Dhard", "-mfloat-abi=3Dsoftfp", d=
), "" ,d)}=20
${@bb.utils.contains("TUNE_FEATURES", "xscale", "-mtune=3Dxscale", "", d)}=
=20
to =20
${@bb.utils.contains("TUNE_FEATURES", "armv5", "-march=3Darmv5${ARMPKGSFX_T=
HUMB}${ARMPKGSFX_DSP}", "", d)}=20
${@bb.utils.contains("TUNE_FEATURES", "armv4", "-march=3Darmv4${ARMPKGSFX_T=
HUMB}", "", d)}=20
${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", "", d)=
}=20
${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", "-mno-thumb-int=
erwork", "-mthumb-interwork", d)}=20
${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUNE_FEATUR=
ES", "callconvention-hard", "-mfloat-abi=3Dhard", "-mfloat-abi=3Dsoftfp", d=
), "" ,d)}
${@bb.utils.contains("TUNE_FEATURES", "arm926ejs", "-mtune=3Darm926ej-s", "=
", d)}

That's pity as they are overwritting the same files in feeds:

OE qemuarm@shr ~/shr-core $ ls -lah tmp/deploy/ipk/armv5te/libexpat*
-rw-r--r-- 1 bitbake bitbake 8.3K Nov  3 22:04 tmp/deploy/ipk/armv5te/libex=
pat-bin_2.0.1-r1_armv5te.ipk
-rw-r--r-- 1 bitbake bitbake 191K Nov  3 22:04 tmp/deploy/ipk/armv5te/libex=
pat-dbg_2.0.1-r1_armv5te.ipk
-rw-r--r-- 1 bitbake bitbake  13K Nov  3 22:04 tmp/deploy/ipk/armv5te/libex=
pat-dev_2.0.1-r1_armv5te.ipk
-rw-r--r-- 1 bitbake bitbake 4.4K Nov  3 22:04 tmp/deploy/ipk/armv5te/libex=
pat-doc_2.0.1-r1_armv5te.ipk
-rw-r--r-- 1 bitbake bitbake 171K Nov  3 22:04 tmp/deploy/ipk/armv5te/libex=
pat-staticdev_2.0.1-r1_armv5te.ipk
-rw-r--r-- 1 bitbake bitbake  48K Nov  3 22:04 tmp/deploy/ipk/armv5te/libex=
pat1_2.0.1-r1_armv5te.ipk

So user won't know if the package he downloads was built as qemuarm or qemu=
armcopy or spitz..
all he will notice is that md5 sums for ipk files are changing alot.

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UOYwgDhKKQYesrzQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6zEOUACgkQN1Ujt2V2gBzGNwCdGKgFlCSfq8HpMG1/uccbvope
rDUAn3L6FsOc9FUr0GAm2QOjNpbLprJY
=bP3V
-----END PGP SIGNATURE-----

--UOYwgDhKKQYesrzQ--
