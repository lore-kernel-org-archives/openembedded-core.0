Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TQI5A-0001Hx-UV
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 15:30:16 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so1383853wey.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 06:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=U/B+j0oVMdykStIDdunOT9kN/PUfD7OP36dbAaJcGwA=;
	b=TJBti13mSDlJifvBEUHefwU/hoa+BldCg6TWPMezy5N9hNyXJhYYysMjK86l7vHoBu
	SVHkSC9HsCACxIW/TfwwLfy9TkGKQ3T21YI3tXtkuOmbVpAtJ8rAM9H0mvdBRuQpst9C
	hzKSen9n7l+mBdOoMKY/vDh2ryxwttG4GmzFbHi55UQrsBeZMihm+diP7zyfe3FBTemN
	5Cyn7HDJy4ENWbv5xyRCcIEatolZO4NSsCa4qBZHBi8kT2+2pIyTnFguqCsAfIhjtgmu
	00+9qw2EZdikKosjROV3kbCDZE82wpUiC3rmJdtq0lsvZ10jSuhJG6OeOIFrNO3YOf3x
	X4aA==
Received: by 10.216.139.104 with SMTP id b82mr5538030wej.24.1350911812318;
	Mon, 22 Oct 2012 06:16:52 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a10sm21875519wiz.4.2012.10.22.06.16.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Oct 2012 06:16:50 -0700 (PDT)
Date: Mon, 22 Oct 2012 15:17:05 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20121022131705.GH3269@jama.jama.net>
References: <1350658135.2520.29.camel@ted>
	<20121022104442.GD3269@jama.jama.net>
	<1350903508.2520.77.camel@ted>
	<20121022110809.GF3269@jama.jama.net>
	<1350906171.2520.82.camel@ted>
	<20121022120234.GG3269@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20121022120234.GG3269@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sstate: Improve handling of machine specific manifests
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
X-List-Received-Date: Mon, 22 Oct 2012 13:30:17 -0000
X-Groupsio-MsgNum: 30807
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lrvsYIebpInmECXG"
Content-Disposition: inline

--lrvsYIebpInmECXG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 22, 2012 at 02:02:34PM +0200, Martin Jansa wrote:
> On Mon, Oct 22, 2012 at 12:42:51PM +0100, Richard Purdie wrote:
> > On Mon, 2012-10-22 at 13:08 +0200, Martin Jansa wrote:
> > > On Mon, Oct 22, 2012 at 11:58:28AM +0100, Richard Purdie wrote:
> > > > On Mon, 2012-10-22 at 12:44 +0200, Martin Jansa wrote:
> > > > > On Fri, Oct 19, 2012 at 03:48:55PM +0100, Richard Purdie wrote:
> > > > > > Now do_package isn't machine specific, we're only left with do_=
populate_sysroot as a
> > > > > > machine specific task. This change marks only the machine speci=
fic manifests as machine
> > > > > > specific, defaulting to PACKAGE_ARCH for everything else.
> > > > > >=20
> > > > > > This means we do less work where there are multiple machines us=
ing the same
> > > > > > core package architecture and we can start to clean up the ssta=
te duplicate files
> > > > > > whitelist.
> > > > > >=20
> > > > > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.o=
rg>
> > > > > > ---
> > > > > > diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.=
bbclass
> > > > > > index d2a120b..dee84bf 100644
> > > > > > --- a/meta/classes/sstate.bbclass
> > > > > > +++ b/meta/classes/sstate.bbclass
> > > > > > @@ -17,10 +17,7 @@ SSTATE_EXTRAPATH   =3D ""
> > > > > >  SSTATE_EXTRAPATHWILDCARD =3D ""
> > > > > >  SSTATE_PATHSPEC   =3D "${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCAR=
D}*/${SSTATE_PKGSPEC}"
> > > > > > =20
> > > > > > -# In theory we should be using:
> > > > > > -# SSTATE_DUPWHITELIST =3D "${DEPLOY_DIR_IMAGE}/ ${DEPLOY_DIR}/=
licenses/ ${DEPLOY_DIR_IPK}/all/ ${DEPLOY_DIR_RPM}/all ${DEPLOY_DIR_DEB}/al=
l/ ${TMPDIR}/pkgdata/all${TARGET_VENDOR}-${TARGET_OS}"
> > > > > > -# However until do_package is not machine specific, we'll have=
 to make do with all of deploy/pkgdata.
> > > > > > -SSTATE_DUPWHITELIST =3D "${DEPLOY_DIR}/ ${TMPDIR}/pkgdata/"
> > > > > > +SSTATE_DUPWHITELIST =3D "${DEPLOY_DIR_IMAGE}/ ${DEPLOY_DIR}/li=
censes/"
> > > > >=20
> > > > > Looks like warnings are back :/
> > > > >=20
> > > > > WARNING: The recipe attr is trying to install files into a shared=
 area when those files already exist. Those files are:
> > > > >    /OE/jansa-test/shr-core/tmp-eglibc/deploy/ipk/armv7a-vfp-neon/=
attr-locale-de_2.4.46-r4_armv7a-vfp-neon.ipk
> > > > >    /OE/jansa-test/shr-core/tmp-eglibc/deploy/ipk/armv7a-vfp-neon/=
attr-dbg_2.4.46-r4_armv7a-vfp-neon.ipk
> > > > >    /OE/jansa-test/shr-core/tmp-eglibc/deploy/ipk/armv7a-vfp-neon/=
attr-locale-sv_2.4.46-r4_armv7a-vfp-neon.ipk
> > > > > ...
> > > > >=20
> > > > > and new warnings from pkgdata
> > > > > WARNING: The recipe bison is trying to install files into a share=
d area when those files already exist. Those files are:
> > > > >    /OE/jansa-test/shr-core/tmp-eglibc/pkgdata/armv7a-vfp-neon-oe-=
linux-gnueabi/bison
> > > > >    /OE/jansa-test/shr-core/tmp-eglibc/pkgdata/armv7a-vfp-neon-oe-=
linux-gnueabi/runtime/bison-locale-nl.packaged
> > > > >    /OE/jansa-test/shr-core/tmp-eglibc/pkgdata/armv7a-vfp-neon-oe-=
linux-gnueabi/runtime/bison-dbg.packaged
> > > > >    /OE/jansa-test/shr-core/tmp-eglibc/pkgdata/armv7a-vfp-neon-oe-=
linux-gnueabi/runtime/bison-doc
> > > > >    /OE/jansa-test/shr-core/tmp-eglibc/pkgdata/armv7a-vfp-neon-oe-=
linux-gnueabi/runtime/bison-locale-th.packaged
> > > > > ...
> > > >=20
> > > > The question is why as they shouldn't be, these changes were meant =
to
> > > > fix this properly. Initially I wondered if this was another
> > > > manifestation of https://bugzilla.yoctoproject.org/show_bug.cgi?id=
=3D3219
> > > > but I'm not so sure.
> > >=20
> ]> > Probably not as this happens on builder with 2 machines using the sa=
me
> > > tune and the same CCARGS.
> > >=20
> > > > Can you figure out which two recipes are trying to install these se=
ts of
> > > > files?
> > >=20
> > > I'll try to compare them with scripts/sstate-diff.sh again to see if
> > > checksums are the same between those 2 machines, but those warnings a=
re
> > > shown already when building 1 machine.

Hmm, checksums are different not only for target recipes but also for nativ=
e now:

OE @ ~/jansa-test/shr-core $ ls */*/*/zlib-native*do_package.sigdata*
stamps.1350908965/nokia900/x86_64-linux/zlib-native-1.2.7-r0.do_package.sig=
data.f8ca8403df4a25b68553291341717a29
stamps.1350908965/om-gta02/x86_64-linux/zlib-native-1.2.7-r0.do_package.sig=
data.af2b16d88415c39245731409c8e15f70
stamps.1350908965/tuna/x86_64-linux/zlib-native-1.2.7-r0.do_package.sigdata=
=2E815e9385589d3ffe41099fca79c3d8e7
OE @ ~/jansa-test/shr-core $ ls */*/*/zlib-1*do_package.sigdata*
stamps.1350908965/nokia900/armv7a-vfp-neon-oe-linux-gnueabi/zlib-1.2.7-r0.d=
o_package.sigdata.3c23b95f321e5430b3d21d7288acea89
stamps.1350908965/om-gta02/armv4t-oe-linux-gnueabi/zlib-1.2.7-r0.do_package=
=2Esigdata.bcfc3d562d4dc6d85b2d8bf0aa7f0b89
stamps.1350908965/tuna/armv7a-vfp-neon-oe-linux-gnueabi/zlib-1.2.7-r0.do_pa=
ckage.sigdata.0b50fd9e90c6c922877f637378280163

OE om-gta02@shr ~/jansa-test/shr-core $ bitbake-diffsigs stamps.1350908965/=
nokia900/armv7a-vfp-neon-oe-linux-gnueabi/zlib-1.2.7-r0.do_package.sigdata.=
3c23b95f321e5430b3d21d7288acea89 stamps.1350908965/tuna/armv7a-vfp-neon-oe-=
linux-gnueabi/zlib-1.2.7-r0.do_package.sigdata.0b50fd9e90c6c922877f63737828=
0163
basehash changed from ff270729884d94ba712e579e19e9989f to b01c64c65799d2a3f=
ebcf7ec164a8b14
Variable PKGTRIPLETS value changed from nokia900-oe-linux-gnueabi armv7a-vf=
p-neon-oe-linux-gnueabi armv7a-vfp-oe-linux-gnueabi armv7a-oe-linux-gnueabi=
 armv6-vfp-oe-linux-gnueabi armv5e-vfp-oe-linux-gnueabi armv5e-oe-linux-gnu=
eabi armv5-vfp-oe-linux-gnueabi armv5-oe-linux-gnueabi armv4-oe-linux-gnuea=
bi arm-oe-linux-gnueabi noarch-oe-linux-gnueabi any-oe-linux-gnueabi all-oe=
-linux-gnueabi to tuna-oe-linux-gnueabi armv7a-vfp-neon-oe-linux-gnueabi ar=
mv7a-vfp-oe-linux-gnueabi armv7a-oe-linux-gnueabi armv6-vfp-oe-linux-gnueab=
i armv5e-vfp-oe-linux-gnueabi armv5e-oe-linux-gnueabi armv5-vfp-oe-linux-gn=
ueabi armv5-oe-linux-gnueabi armv4-oe-linux-gnueabi arm-oe-linux-gnueabi no=
arch-oe-linux-gnueabi any-oe-linux-gnueabi all-oe-linux-gnueabi
Hash for dependent task eglibc_2.16.bb.do_package changed from 44e54b452f83=
1141f15d7fa61a637997 to 31b9950443659def02296d4b2aed43a5
Hash for dependent task gcc-runtime_4.7.bb.do_package changed from 7db515c5=
1f06c6db5a77e8f089aedf64 to 6e1ee054521f3a41fcc6e17aa0d8acbc

OE om-gta02@shr ~/jansa-test/shr-core $ bitbake-diffsigs stamps.1350908965/=
nokia900/x86_64-linux/zlib-native-1.2.7-r0.do_package.sigdata.f8ca8403df4a2=
5b68553291341717a29 stamps.1350908965/tuna/x86_64-linux/zlib-native-1.2.7-r=
0.do_package.sigdata.815e9385589d3ffe41099fca79c3d8e7
basehash changed from b086f2a2ad21c163d0002edd355103fb to 61aa7f2d5d3ec073c=
bde0e1df1b0813b
Variable PKGTRIPLETS value changed from nokia900-linux armv7a-vfp-neon-linu=
x armv7a-vfp-linux armv7a-linux armv6-vfp-linux armv5e-vfp-linux armv5e-lin=
ux armv5-vfp-linux armv5-linux armv4-linux arm-linux noarch-linux any-linux=
 all-linux to tuna-linux armv7a-vfp-neon-linux armv7a-vfp-linux armv7a-linu=
x armv6-vfp-linux armv5e-vfp-linux armv5e-linux armv5-vfp-linux armv5-linux=
 armv4-linux arm-linux noarch-linux any-linux all-linux

I guess I don't need to build test anything now..

> > > > Or perhaps this is a one off transition issue I didn't see here when
> > > > testing this? Does a build from a clean tmp do this?
> > >=20
> > > Yes I've removed tmp-eglibc before starting this build (kept only
> > > sstate-cache) and it's building first machine.
> >=20
> > If the warnings are showing up even after building one machine, there is
> > something very strange going on. Did it run the setscene do_package task
> > for these recipes?
>=20
> No, only for populate_lic and populate_sysroot:
>=20
> NOTE: recipe attr-2.4.46-r4: task do_populate_sysroot_setscene: Started
> NOTE: recipe attr-2.4.46-r4: task do_populate_sysroot_setscene: Succeeded
> NOTE: recipe attr-2.4.46-r4: task do_populate_lic_setscene: Started
> NOTE: recipe attr-2.4.46-r4: task do_populate_lic_setscene: Succeeded
> NOTE: recipe attr-2.4.46-r4: task do_fetch: Started
> NOTE: recipe attr-2.4.46-r4: task do_fetch: Succeeded
> NOTE: recipe attr-2.4.46-r4: task do_unpack: Started
> NOTE: recipe attr-2.4.46-r4: task do_unpack: Succeeded
> NOTE: recipe attr-2.4.46-r4: task do_patch: Started
> NOTE: recipe attr-2.4.46-r4: task do_patch: Succeeded
> NOTE: recipe attr-2.4.46-r4: task do_configure: Started
> NOTE: recipe attr-2.4.46-r4: task do_configure: Succeeded
> NOTE: recipe attr-2.4.46-r4: task do_compile: Started
> NOTE: recipe attr-2.4.46-r4: task do_compile: Succeeded
> NOTE: recipe attr-2.4.46-r4: task do_install: Started
> NOTE: recipe attr-2.4.46-r4: task do_install: Succeeded
> NOTE: recipe attr-2.4.46-r4: task do_populate_sysroot: Started
> NOTE: recipe attr-2.4.46-r4: task do_populate_sysroot: Succeeded
> NOTE: recipe attr-2.4.46-r4: task do_package: Started
> NOTE: recipe attr-2.4.46-r4: task do_package: Succeeded
> NOTE: recipe attr-2.4.46-r4: task do_package_write_ipk: Started
> NOTE: recipe attr-2.4.46-r4: task do_package_write_ipk: Succeeded
> NOTE: recipe attr-2.4.46-r4: task do_rm_work: Started
> NOTE: recipe attr-2.4.46-r4: task do_rm_work: Succeeded
>=20
> But I see this behavior when setscene tasks are executed and=20
> later it rebuilds it again quite often (assuming that some error=20
> in setscene task was hidden - e.g. that fetcher error from
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D3250
> wasn't shown until lately, but maybe was there all the time)
>=20
> > Its as if it installed from sstate and then decided to overwrite the
> > files. Something isn't making sense though :/. Firstly, the sstate
> > should have been invalidated due to the package class and variable
> > changes. Secondly, if it had installed the files, it should be
> > uninstalled them before installing a second set. So I'm confused as to
> > what is going on here...
>=20
> It seems to reinstall a lot of files in sysroot too (which weren't shown =
before).
>=20
> e.g. all files from gst-plugins-good now show warning
> WARNING: The recipe gst-plugins-good is trying to install files into a sh=
ared area when those files already exist. Those files are:
>    /OE/jansa-test/shr-core/tmp-eglibc/sysroots/tuna/usr/share/gstreamer-0=
=2E10/presets/GstIirEqualizer10Bands.prs
>    /OE/jansa-test/shr-core/tmp-eglibc/sysroots/tuna/usr/share/gstreamer-0=
=2E10/presets/GstIirEqualizer3Bands.prs
> ...
>=20
> I'll try to wipe tmp-eglibc again after this build finishes to see if it =
was
> one off or if it will repeat again.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lrvsYIebpInmECXG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCFR1EACgkQN1Ujt2V2gBzV2gCeM/A4COFkgXLXR/vqP0lPSWdi
ZxEAoKUKId86u474m74HLxA/dBsgefsA
=fspg
-----END PGP SIGNATURE-----

--lrvsYIebpInmECXG--
