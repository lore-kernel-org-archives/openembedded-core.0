Return-Path: <Kexin.Hao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5804A7DEA7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 12:10:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x49CASh0013048
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 9 May 2019 05:10:28 -0700 (PDT)
Received: from pek-khao-d2.corp.ad.wrs.com (128.224.137.13) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Thu, 9 May 2019 05:10:27 -0700
Date: Thu, 9 May 2019 20:09:54 +0800
From: Kevin Hao <kexin.hao@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Message-ID: <20190509120954.GV803@pek-khao-d2.corp.ad.wrs.com>
References: <20190507131151.31070-12-bunk@stusta.de>
	<2396569c84a5fa3ababe93d837c025bce876cd40.camel@linuxfoundation.org>
	<20190508203052.GC18736@localhost>
	<7f99a5accb9261548f88e3f2787bad806eb5dd05.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <7f99a5accb9261548f88e3f2787bad806eb5dd05.camel@linuxfoundation.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Originating-IP: [128.224.137.13]
Cc: openembedded-core@lists.openembedded.org, Adrian Bunk <bunk@stusta.de>
Subject: Re: [PATCH] lttng-modules: upgrade 2.10.8 -> 2.10.9
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
X-List-Received-Date: Thu, 09 May 2019 12:10:30 -0000
X-Groupsio-MsgNum: 124225
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oXXuwmZolLKlWh2N"
Content-Disposition: inline

--oXXuwmZolLKlWh2N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 08, 2019 at 09:38:50PM +0100, richard.purdie@linuxfoundation.or=
g wrote:
> On Wed, 2019-05-08 at 23:30 +0300, Adrian Bunk wrote:
> > On Wed, May 08, 2019 at 09:06:19PM +0100, Richard Purdie wrote:
> > > On Tue, 2019-05-07 at 16:11 +0300, Adrian Bunk wrote:
> > > > Remove the backported patches.
> > > >=20
> > > > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > >=20
> > > Unfortunately this seemed to cause:
> > >=20
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/46/builds/574
> >=20
> > ...
> > recipe linux-yocto-4.19.14+gitAUTOINC+9bda6190bf_eebb51300a-r0: task do=
_compile: Succeeded
> > ...
> >  In file included from /home/pokybuild/yocto-worker/beaglebone-lsb/buil=
d/build/tmp/work/beaglebone_yocto-poky-linux-gnueabi/lttng-modules/2.10.9-r=
0/lttng-modules-2.10.9/probes/lttng-kprobes.c:31:
> > > /home/pokybuild/yocto-worker/beaglebone-lsb/build/build/tmp/work/beag=
lebone_yocto-poky-linux-gnueabi/lttng-modules/2.10.9-r0/lttng-modules-2.10.=
9/probes/../blacklist/kprobes.h:19:4: error: #error "Your kernel is known t=
o have buggy optimized kprobes implementation. Fixed by commit 0ac569bf6a79=
83c0c5747d6df8db9dc05bc92b6c \"ARM: 8834/1: Fix: kprobes: optimized kprobes=
 illegal instruction\" in Linux. Disable CONFIG_OPTPROBES or upgrade your k=
ernel."
> > >  #  error "Your kernel is known to have buggy optimized kprobes imple=
mentation. Fixed by commit 0ac569bf6a7983c0c5747d6df8db9dc05bc92b6c \"ARM: =
8834/1: Fix: kprobes: optimized kprobes illegal instruction\" in Linux. Dis=
able CONFIG_OPTPROBES or upgrade your kernel."
> > >     ^~~~~
> > > make[4]: ***=20
> > [/home/pokybuild/yocto-worker/beaglebone-lsb/build/build/tmp/work/beagl=
ebone_yocto-poky-linux-gnueabi/lttng-modules/2.10.9-r0/lttng-modules-2.10.9=
/probes/lttng-kprobes.o] Error 1
> > ...
> >=20
> >=20
> > Upstream turned a runtime breakage into a build failure:
> > http://git.lttng.org/?p=3Dlttng-modules.git;a=3Dcommit;h=3D2d16de12b197=
aed57212826187bcb0ab24ad071e
> >=20
> > IOW, this needs an update of beaglebone-yocto in
> > meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.19.bbappend
> > (4.19.34 already seems to be in the git tree).
>=20
> Right, sorry, I hadn't actually read the error :/.
>=20
> CCing Kevin/Bruce.

I just sent out a patch to bump the kernel version for these BSPs.

Thanks,
Kevin

>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20

--oXXuwmZolLKlWh2N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEHc6qFoLCZqgJD98Zk1jtMN6usXEFAlzUGJIACgkQk1jtMN6u
sXFS8ggAxx0wIcxcpKWFl2yeUrK5EKXRQ9+tXT1dG5gqjdoDBjwuZdxDOygk32um
i9qSYKl/ifsaSxdruFzko33O5jA9bUqWGgj4Pz5+pbn/g039JYPhBAn1wn/Gnjaa
b38HeBGCLM6KHca+WLa0On3xbqtBvhB/FRtb/UnT4bsWi6JRwNd9zwUaoQiuESLT
oJt2t1F8TeNqN98pm50u8BHBPyN2pfuYa8UkabtT9aDEdxwMtYKvQGLlNrKiTNWz
2VctuJTJI2Nhas/lI8dic6Rj0rGCSsu5F42dEkcmFgJjpCADdJvPgt2tpS3fNZkQ
qdXki0GXz2GJmZ4235ygu8YG3scUkw==
=kStO
-----END PGP SIGNATURE-----

--oXXuwmZolLKlWh2N--
