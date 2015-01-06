Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6FFFF601F5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 08:57:30 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id ex7so4903660wid.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Jan 2015 00:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=aNPgGsH2VJiBw6LsOdPa0fLaxwrjWPCGVaJNenZeaIE=;
	b=fdSsWUfREkYuSmnu9ju4eWZwBbnKVsriwOp8oSk5THoTvp0p5HGW+NC2Z5zT/1DSww
	F75FwILtn5ipExRds4vFYuTFzbMCSyduscn/71UVoknZx9shYeA8Usnb3Kezc1fdSmex
	84eFLrwNF3hug4qPjyiQ4YUJ3yfqLBn7ZQ74PYPh1KLs6EQacRm6LH2fqneJraOe3gZf
	Lvlrz9qZh/J3KqUys9jTcLgvRuERj2w+jfX941QEj37g954b1pBn2Dsq9Wa3/TQRoVfu
	o3esWYfbg4j2Y9Ws4Jn2ZAPpPNYJsoC9B6toZzynOyaKdMSA0cWF5vbaUivAKc2EWRsj
	C48Q==
X-Received: by 10.194.90.81 with SMTP id bu17mr97114159wjb.3.1420534650785;
	Tue, 06 Jan 2015 00:57:30 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	e4sm1688683wjw.48.2015.01.06.00.57.29
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Jan 2015 00:57:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 6 Jan 2015 09:57:31 +0100
To: Mike Looijmans <mike.looijmans@topic.nl>
Message-ID: <20150106085731.GC19402@jama>
References: <54AA4536.7030101@topic.nl> <54AA4B86.9040905@topic.nl>
	<CADkTA4MgqEASmHgGunCkTUR=1qdgxP6dqW90PmgYmZ2HHTUWPg@mail.gmail.com>
	<54AB8B59.7080702@topic.nl>
MIME-Version: 1.0
In-Reply-To: <54AB8B59.7080702@topic.nl>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: What is expected of a kernel recipe nowadays?
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
X-List-Received-Date: Tue, 06 Jan 2015 08:57:38 -0000
X-Groupsio-MsgNum: 61026
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Md/poaVZ8hnGTzuv"
Content-Disposition: inline

--Md/poaVZ8hnGTzuv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 06, 2015 at 08:14:33AM +0100, Mike Looijmans wrote:
> =EF=BB=BFOn 01/05/2015 09:18 PM, Bruce Ashfield wrote:
> > On Mon, Jan 5, 2015 at 3:29 AM, Mike Looijmans <mike.looijmans@topic.nl=
> wrote:
> >> I think I found it. The kernel bbclass changes "S" to point elsewhere.
> >> Moving the statement
> >> S =3D "${WORKDIR}/git"
> >> to after the "inherit kernel" line makes the compile run again.
> >
> >
> > Interesting. Can you confirm that Richard's commit:
> >
> > -----------------
> >
> > commit 1dd37a2a9960ad26e27567d1871d78bec336e1a2
> > Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Date:   Fri Dec 19 17:46:27 2014 +0000
> >
> >      kernel: Fix non linux-yocto builds
> >
> >      After the recent kernel changes, non linux-yocto builds stopped wo=
rking
> >      properly for two reasons:
> >
> >      a) ${S} was being reset to ${WORKDIR}/git for example and STAGING_=
KERNEL_DIR
> >         did not contain the source
> >
> >      b) Most builds were using ${B} =3D=3D ${S}
> >
> >      This patch adds a fixup to the unpack function to handle the case =
where
> >      ${S} !=3D ${STAGING_KERNEL_DIR} and also set up the infrastrcture =
so that
> >      B !=3D S for kernel builds from now on. The kernel build system is=
 one of the
> >      best for supporting this and there is no good reason not to take a=
dvantage
> >      of it.
> >
> >      (From OE-Core rev: 106dab2fd0321e6b4e77b40111e59a3a31d329d4)
> >
> >      Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >
> > ------------
> >
> > Is in your tree ? it should be fixing things up and allowing the source=
 to
> > be found.
>=20
> Yes, this is the part that changes "S" and it's how I discovered to move =
the=20
> assignment to after inheriting it.
>=20
>=20
> > Alternatively, if you drop the explicit set of S, does the build start =
working
> > again ?
>=20
> If I just remove the S=3D... line, it fails in the same way. The git fetc=
h=20
> apparently places the code at WORKDIR/git where the new kernel recipe can=
not=20
> find it.

FWIW: I'm also seeing various kernel failures since the changes.

Most my kernel are also using linux.inc from meta-oe which wasn't updated y=
et
(I plan to look into it soon, unless someone else beats me to it)

The worst part is that some of these issues are random (the race-condition =
showing
more often than before).

1) do_unpack failing:

ERROR: Error executing a python function in /home/jenkins/workspace/luneos-=
unstable/webos-ports/meta-smartphone/meta-samsung/recipes-kernel/linux/linu=
x-samsung-tuna_git.bb:

The stack trace of python calls that resulted in this exception/failure was:
File: 'base_do_unpack', lineno: 24, function: <module>
     0020:        subprocess.call(d.expand("mv /home/jenkins/workspace/lune=
os-unstable/webos-ports/tmp-glibc/work/maguro-webos-linux-gnueabi/linux-sam=
sung-tuna/3_3.0.72+gitrAUTOINC+f8ed73f94a-r12/git/ /home/jenkins/workspace/=
luneos-unstable/webos-ports/tmp-glibc/sysroots/maguro/usr/src/kernel"), she=
ll=3DTrue)
     0021:        os.symlink(kernsrc, s)
     0022:
     0023:
 *** 0024:base_do_unpack(d)
     0025:
File: 'base_do_unpack', lineno: 21, function: base_do_unpack
     0017:        bb.utils.mkdirhier(kernsrc)
     0018:        bb.utils.remove(kernsrc, recurse=3DTrue)
     0019:        import subprocess
     0020:        subprocess.call(d.expand("mv /home/jenkins/workspace/lune=
os-unstable/webos-ports/tmp-glibc/work/maguro-webos-linux-gnueabi/linux-sam=
sung-tuna/3_3.0.72+gitrAUTOINC+f8ed73f94a-r12/git/ /home/jenkins/workspace/=
luneos-unstable/webos-ports/tmp-glibc/sysroots/maguro/usr/src/kernel"), she=
ll=3DTrue)
 *** 0021:        os.symlink(kernsrc, s)
     0022:
     0023:
     0024:base_do_unpack(d)
     0025:
Exception: OSError: [Errno 2] No such file or directory

ERROR: Function failed: base_do_unpack
ERROR: Logfile of failure stored in: /home/jenkins/workspace/luneos-unstabl=
e/webos-ports/tmp-glibc/work/maguro-webos-linux-gnueabi/linux-samsung-tuna/=
3_3.0.72+gitrAUTOINC+f8ed73f94a-r12/temp/log.do_unpack.13495

2) do_configure failing:

ERROR: Function failed: do_configure (log file is located at /home/jenkins/=
workspace/luneos-unstable/webos-ports/tmp-glibc/work/mako-webos-linux-gnuea=
bi/linux-lg-mako/3.4.0+gitrAUTOINC+38bdbfe224-r0/temp/log.do_configure.1749=
8)
ERROR: Logfile of failure stored in: /home/jenkins/workspace/luneos-unstabl=
e/webos-ports/tmp-glibc/work/mako-webos-linux-gnueabi/linux-lg-mako/3.4.0+g=
itrAUTOINC+38bdbfe224-r0/temp/log.do_configure.17498
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: Executing shell function do_configure
| NOTE: make oldconfig
| make: *** No rule to make target `oldconfig'.  Stop.
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at /home/jenkin=
s/workspace/luneos-unstable/webos-ports/tmp-glibc/work/mako-webos-linux-gnu=
eabi/linux-lg-mako/3.4.0+gitrAUTOINC+38bdbfe224-r0/temp/log.do_configure.17=
498)
NOTE: recipe linux-lg-mako-3.4.0+gitrAUTOINC+38bdbfe224-r0: task do_configu=
re: Failed
ERROR: Task 491 (/home/jenkins/workspace/luneos-unstable/webos-ports/meta-s=
martphone/meta-lg/recipes-kernel/linux/linux-lg-mako_git.bb, do_configure) =
failed with exit code '1'

3) do_patch failing when S assignment is dropped

ERROR: Command Error: exit status: 1  Output:
Applying patch patch-3.2.52
can't find file to patch at input line 5
=2E..
8 out of 8 hunks ignored
Patch patch-3.2.52 does not apply (enforce with -f)
ERROR: Function failed: patch_do_patch
ERROR: Logfile of failure stored in: /OE/build/shr-core/tmp-glibc/work/om_g=
ta02-oe-linux-gnueabi/linux-openmoko/1_3.2-r14/temp/log.do_patch.15984
NOTE: recipe linux-openmoko-1_3.2-r14: task do_patch: Failed

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Md/poaVZ8hnGTzuv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSro3sACgkQN1Ujt2V2gBx6zQCeOz84oKP8mJuTLHW9hKBlNFGz
imoAmwek1nMA9OfEasrbFPcjK1S4pSpS
=nNVk
-----END PGP SIGNATURE-----

--Md/poaVZ8hnGTzuv--
