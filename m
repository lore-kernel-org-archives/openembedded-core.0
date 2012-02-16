Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Ry1uw-0007je-Bc
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Feb 2012 15:02:38 +0100
Received: by eekd41 with SMTP id d41so649108eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2012 05:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5p5dNMsfPZaomggr+BnjUXklncVsv6Sm8Q18pt2QEZA=;
	b=HojifrfaHfEzPRzNjWReMh4ZExtXL31BQicV2CqAIU3SsgNtd9DUnqMwWdaaV4oflT
	j2P11FkUnzxrET0gNO20E8Ldau5HOfnyWAKCKsqZVJYNOfBh6MdwNI+1NNJXL0AP96gI
	SQwBtcnAY0kmkS4TVdlpkl7Z0HaceZSPkJ3c0=
Received: by 10.14.202.197 with SMTP id d45mr1543296eeo.128.1329400465202;
	Thu, 16 Feb 2012 05:54:25 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a58sm23555913eeb.8.2012.02.16.05.54.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Feb 2012 05:54:24 -0800 (PST)
Date: Thu, 16 Feb 2012 14:54:22 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120216135422.GE5822@jama.jama.net>
References: <1327425729.19643.113.camel@ted>
	<20120216134447.GD5822@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120216134447.GD5822@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Machine dependencies validation with sstate
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
X-List-Received-Date: Thu, 16 Feb 2012 14:02:38 -0000
X-Groupsio-MsgNum: 17541
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FEz7ebHBGB6b2e8X"
Content-Disposition: inline

--FEz7ebHBGB6b2e8X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2012 at 02:44:47PM +0100, Martin Jansa wrote:
> On Tue, Jan 24, 2012 at 05:22:09PM +0000, Richard Purdie wrote:
> > In the process of diving into the issues in bug 1916
> > (http://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1916), I've come up
> > with a good way of detecting machine specific changes to generic
> > PACKAGE_ARCH packages.
> >=20
> > The idea is to have two identical machines, qemux86 and qemux86copy.
> > These can be setup by:
> >=20
> > $ cp meta/conf/machine/qemux86.conf meta/conf/machine/qemux86copy.conf=
=20
> > [Add SRCREV entry for qemux86copy to meta/recipes-kernel/linux/linux-yo=
cto_3.0.bb]
> > $ cp -r meta/recipes-core/netbase/netbase-4.47/qemux86 meta/recipes-cor=
e/netbase/netbase-4.47/qemux86copy
> > [Add PACKAGE_ARCH_qemux86copy to meta/recipes-core/netbase/netbase_4.47=
=2Ebb]
> > [Add RRECOMMENDS_${PN}_qemux86copy to meta/recipes-multimedia/gstreamer=
/gstreamer_0.10.35.bb]
> >=20
> > You can then generate all of the sigdata files for two machine builds by
> > running the following commands. The nice thing about these is that you
> > don't have to run a complete build, it just writes out the data the
> > build would have generated:
> >=20
> > rm tmp/stamps/*/*sigdata*
> > MACHINE=3Dqemux86 bitbake core-image-sato -S
> > find tmp/stamps/i586-poky-linux/ -name \*sigdata* | sort > l1
> > find tmp/stamps/all-poky-linux/ -name \*sigdata* | sort >> l1
> > MACHINE=3Dqemux86copy bitbake core-image-sato -S
> > find tmp/stamps/i586-poky-linux/ -name \*sigdata* | sort > l2
> > find tmp/stamps/all-poky-linux/ -name \*sigdata* | sort >> l2
> >=20
> > and then comparing the files l1 and l2, you can see which sigdata files
> > differ. Running bitbake-diffsigs on the files, e.g.:
> >=20
> > bitbake-diffsigs tmp/stamps/all-poky-linux/x11-common-0.1-r44.do_packag=
e_write_ipk.sigdata.*
> >=20
> > can show what changed and you can then consider whether that is a valid
> > change and how it might be avoided if necessary. This is how some of the
> > patches I've just posted were developed.
> >=20
> > Comparing qemux86 and qemux86copy as above with core-image-sato now
> > yields only two differences, in the package_write* tasks of iptables and
> > gstreamer. This is due to the dependencies these two recipes have on
> > kernel-module-* packages which in turn depend on linux-yocto which is
> > machine specific. As yet I can't find a good way to avoid the kernel
> > dependencies. If we could break debian.bbclass's hold in the
> > kernel-module case (which never get renamed), that would be one way to
> > avoid this problem.
> >=20
> > I thought people might find this intersting and it was worth documenting
> > in the list archives if nothing else.
>=20
> Thanks for this how-to!
>=20
> Helped me to find e.g. this:
> http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dcommit;h=3Dc6=
be068de2f716c9fdfc54970fd9908b4f2cd0e6
>=20
> Now I'm looking into why busybox depends on MACHINE variable.
>=20
> And interesting case is when something depends on linux-libc-headers even=
 task-* recipe=20
> which includes ie iptables (which rdepends or rrecommends some kernel mod=
ules)
>=20
> Any idea why identical hash of linux-libc-headers_3.1.bb.do_package_write=
 is=20
> once compared with linux-gta04_git.bb.do_deploy and once linux-nokia900-m=
eego_git.bb.do_package_write?
>=20
> Is it bug in bitbake-diffsigs output or fault of signature handler?
>=20
> om-gta02@shr ~/shr-core $ bitbake-diffsigs tmp-eglibc/stamps/armv7a-vfp-n=
eon-oe-linux-gnueabi/ecalc-git-r1.do_build.sigdata.e772dc750d69dd217f6c7dfe=
7de98246 tmp-eglibc/stamps/armv7a-vfp-neon-oe-linux-gnueabi/ecalc-git-r1.do=
_build.sigdata.ec74b075811b5316554475fb6360313a
> Task dependency hash changed from c38789fba09937fbb2c2ba96b13fb2e8 to 406=
8dabb3a553492e678b90434f6c893 (for linux-libc-headers_3.1.bb.do_package_wri=
te and linux-gta04_git.bb.do_deploy)
> Task dependency hash changed from 9470058e15b666452c6209230c2d445b to 742=
657c20542706b17592336b1a0e09a (for linux-nokia900-meego_git.bb.do_deploy an=
d linux-gta04_git.bb.do_package_write)
> Task dependency hash changed from e547a64f5b883431b63dcbcaa0ad1f30 to c38=
789fba09937fbb2c2ba96b13fb2e8 (for linux-nokia900-meego_git.bb.do_package_w=
rite and linux-libc-headers_3.1.bb.do_package_write)
> Task dependency hash changed from 7f72940519de5e7f16fe1ec5f7108df5 to bd3=
580a29e1922eacec0c798b009f8e9 (for systemd-serialgetty.bb.do_package_write =
and systemd-serialgetty.bb.do_package_write)
> Task dependency hash changed from bcf02bbe9d89f4dff8d3c7b289202fbb to 644=
a5cc5cd8e2a05716bd84f694d2511 (for systemd_git.bb.do_package_write and syst=
emd_git.bb.do_package_write)
>=20
> or more simple case
> $ bitbake-diffsigs tmp-eglibc/stamps/armv7a-vfp-neon-oe-linux-gnueabi/ipt=
ables-1.4.12.2-r0.do_package_write_ipk.sigdata.6cc951872c73234753749ba739be=
9796 tmp-eglibc/stamps/armv7a-vfp-neon-oe-linux-gnueabi/iptables-1.4.12.2-r=
0.do_package_write_ipk.sigdata.7eb3867f1291db17de32fb142e8c9af2
> Task dependency hash changed from 4d510f798d684afd0edaf8c15720e595 to ef1=
8cfc890c39697919a7a6f2ae3e2cb (for linux-nokia900-meego_git.bb.do_package a=
nd linux-gta04_git.bb.do_package)
>=20
> So everything what somehow rdepends/reccomends on machine specific kernel=
 should be also machine specific?
> Or can we remove kernel dependency somehow to way that we want package ma=
nager to fill use RRECOMMENDS_${PN}
> but we don't care (from sstate pov) how kernel was built. We already don'=
t need such module to be built at all.

and one more weird issue, why are some -native packages depending on
kernel.do_deploy?

bitbake-diffsigs
tmp-eglibc/stamps/x86_64-linux/evas-native-2_1.1.0+svnr67991-r3.1.do_build.=
sigdata.958e626749c6668426b053c235679492
tmp-eglibc/stamps/x86_64-linux/evas-native-2_1.1.0+svnr67991-r3.1.do_build.=
sigdata.653789da75b68fd24290dc8364950ccc
Task dependency hash changed from 9470058e15b666452c6209230c2d445b to
4068dabb3a553492e678b90434f6c893 (for
linux-nokia900-meego_git.bb.do_deploy and linux-gta04_git.bb.do_deploy)

If I grep for linux/kernel/deploy in whole meta-efl I don't see how it
could became dependant task of it (the same for edje-native and
ecore-native).

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FEz7ebHBGB6b2e8X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk89Co4ACgkQN1Ujt2V2gBzn2ACeLFE17nSe3nLbHoT+N454SRoS
bzcAn2kFBNiKcEGQ6Mfe04Dj7A//Uduy
=LIzI
-----END PGP SIGNATURE-----

--FEz7ebHBGB6b2e8X--
