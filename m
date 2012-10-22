Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TQGv3-0008FS-9p
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 14:15:45 +0200
Received: by mail-ee0-f47.google.com with SMTP id t10so910860eei.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 05:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1qtjpGPS0i+alvtYW+d1TzzW3uub2AQ3KcWO3JWSuOY=;
	b=ui6n58Vk4U6j37Ofj/TsGuZaW859DcMlmIRmMO2JVEGaQYrz4jhG5PRj9VT+FZO6gG
	KNQtFuNa4xqFuVOepvd6SBrK0vNm3uhwjgcohSbFe8m9n7g7ulBLLdiBBJmSlf+2biLL
	YBUzpv73fxleCdbi7iRZDxNbTEjSis36padNNJBNnjAuO9Xh3tg2XtL4o4poxgY5BwBy
	4j7JsTzJqDhJRpWUz51CR4T9djtTS6mPbtZPtv3WlU11852yXUZtoipaiayVcWgRi25H
	fO8H9M48jv6gj1neRivU7fOCpCQVmXzZs8mzjpQ3Eh4EEhQVEh09rZY9yUWzETPFfMy5
	AvHQ==
Received: by 10.14.193.136 with SMTP id k8mr11684822een.30.1350907340589;
	Mon, 22 Oct 2012 05:02:20 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id g5sm15671166eem.4.2012.10.22.05.02.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Oct 2012 05:02:19 -0700 (PDT)
Date: Mon, 22 Oct 2012 14:02:34 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20121022120234.GG3269@jama.jama.net>
References: <1350658135.2520.29.camel@ted>
	<20121022104442.GD3269@jama.jama.net>
	<1350903508.2520.77.camel@ted>
	<20121022110809.GF3269@jama.jama.net>
	<1350906171.2520.82.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1350906171.2520.82.camel@ted>
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
X-List-Received-Date: Mon, 22 Oct 2012 12:15:45 -0000
X-Groupsio-MsgNum: 30801
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jt0yj30bxbg11sci"
Content-Disposition: inline

--jt0yj30bxbg11sci
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 22, 2012 at 12:42:51PM +0100, Richard Purdie wrote:
> On Mon, 2012-10-22 at 13:08 +0200, Martin Jansa wrote:
> > On Mon, Oct 22, 2012 at 11:58:28AM +0100, Richard Purdie wrote:
> > > On Mon, 2012-10-22 at 12:44 +0200, Martin Jansa wrote:
> > > > On Fri, Oct 19, 2012 at 03:48:55PM +0100, Richard Purdie wrote:
> > > > > Now do_package isn't machine specific, we're only left with do_po=
pulate_sysroot as a
> > > > > machine specific task. This change marks only the machine specifi=
c manifests as machine
> > > > > specific, defaulting to PACKAGE_ARCH for everything else.
> > > > >=20
> > > > > This means we do less work where there are multiple machines usin=
g the same
> > > > > core package architecture and we can start to clean up the sstate=
 duplicate files
> > > > > whitelist.
> > > > >=20
> > > > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > > > ---
> > > > > diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bb=
class
> > > > > index d2a120b..dee84bf 100644
> > > > > --- a/meta/classes/sstate.bbclass
> > > > > +++ b/meta/classes/sstate.bbclass
> > > > > @@ -17,10 +17,7 @@ SSTATE_EXTRAPATH   =3D ""
> > > > >  SSTATE_EXTRAPATHWILDCARD =3D ""
> > > > >  SSTATE_PATHSPEC   =3D "${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}=
*/${SSTATE_PKGSPEC}"
> > > > > =20
> > > > > -# In theory we should be using:
> > > > > -# SSTATE_DUPWHITELIST =3D "${DEPLOY_DIR_IMAGE}/ ${DEPLOY_DIR}/li=
censes/ ${DEPLOY_DIR_IPK}/all/ ${DEPLOY_DIR_RPM}/all ${DEPLOY_DIR_DEB}/all/=
 ${TMPDIR}/pkgdata/all${TARGET_VENDOR}-${TARGET_OS}"
> > > > > -# However until do_package is not machine specific, we'll have t=
o make do with all of deploy/pkgdata.
> > > > > -SSTATE_DUPWHITELIST =3D "${DEPLOY_DIR}/ ${TMPDIR}/pkgdata/"
> > > > > +SSTATE_DUPWHITELIST =3D "${DEPLOY_DIR_IMAGE}/ ${DEPLOY_DIR}/lice=
nses/"
> > > >=20
> > > > Looks like warnings are back :/
> > > >=20
> > > > WARNING: The recipe attr is trying to install files into a shared a=
rea when those files already exist. Those files are:
> > > >    /OE/jansa-test/shr-core/tmp-eglibc/deploy/ipk/armv7a-vfp-neon/at=
tr-locale-de_2.4.46-r4_armv7a-vfp-neon.ipk
> > > >    /OE/jansa-test/shr-core/tmp-eglibc/deploy/ipk/armv7a-vfp-neon/at=
tr-dbg_2.4.46-r4_armv7a-vfp-neon.ipk
> > > >    /OE/jansa-test/shr-core/tmp-eglibc/deploy/ipk/armv7a-vfp-neon/at=
tr-locale-sv_2.4.46-r4_armv7a-vfp-neon.ipk
> > > > ...
> > > >=20
> > > > and new warnings from pkgdata
> > > > WARNING: The recipe bison is trying to install files into a shared =
area when those files already exist. Those files are:
> > > >    /OE/jansa-test/shr-core/tmp-eglibc/pkgdata/armv7a-vfp-neon-oe-li=
nux-gnueabi/bison
> > > >    /OE/jansa-test/shr-core/tmp-eglibc/pkgdata/armv7a-vfp-neon-oe-li=
nux-gnueabi/runtime/bison-locale-nl.packaged
> > > >    /OE/jansa-test/shr-core/tmp-eglibc/pkgdata/armv7a-vfp-neon-oe-li=
nux-gnueabi/runtime/bison-dbg.packaged
> > > >    /OE/jansa-test/shr-core/tmp-eglibc/pkgdata/armv7a-vfp-neon-oe-li=
nux-gnueabi/runtime/bison-doc
> > > >    /OE/jansa-test/shr-core/tmp-eglibc/pkgdata/armv7a-vfp-neon-oe-li=
nux-gnueabi/runtime/bison-locale-th.packaged
> > > > ...
> > >=20
> > > The question is why as they shouldn't be, these changes were meant to
> > > fix this properly. Initially I wondered if this was another
> > > manifestation of https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D=
3219
> > > but I'm not so sure.
> >=20
]> > Probably not as this happens on builder with 2 machines using the same
> > tune and the same CCARGS.
> >=20
> > > Can you figure out which two recipes are trying to install these sets=
 of
> > > files?
> >=20
> > I'll try to compare them with scripts/sstate-diff.sh again to see if
> > checksums are the same between those 2 machines, but those warnings are
> > shown already when building 1 machine.
> > =20
> > > Or perhaps this is a one off transition issue I didn't see here when
> > > testing this? Does a build from a clean tmp do this?
> >=20
> > Yes I've removed tmp-eglibc before starting this build (kept only
> > sstate-cache) and it's building first machine.
>=20
> If the warnings are showing up even after building one machine, there is
> something very strange going on. Did it run the setscene do_package task
> for these recipes?

No, only for populate_lic and populate_sysroot:

NOTE: recipe attr-2.4.46-r4: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.4.46-r4: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.4.46-r4: task do_populate_lic_setscene: Started
NOTE: recipe attr-2.4.46-r4: task do_populate_lic_setscene: Succeeded
NOTE: recipe attr-2.4.46-r4: task do_fetch: Started
NOTE: recipe attr-2.4.46-r4: task do_fetch: Succeeded
NOTE: recipe attr-2.4.46-r4: task do_unpack: Started
NOTE: recipe attr-2.4.46-r4: task do_unpack: Succeeded
NOTE: recipe attr-2.4.46-r4: task do_patch: Started
NOTE: recipe attr-2.4.46-r4: task do_patch: Succeeded
NOTE: recipe attr-2.4.46-r4: task do_configure: Started
NOTE: recipe attr-2.4.46-r4: task do_configure: Succeeded
NOTE: recipe attr-2.4.46-r4: task do_compile: Started
NOTE: recipe attr-2.4.46-r4: task do_compile: Succeeded
NOTE: recipe attr-2.4.46-r4: task do_install: Started
NOTE: recipe attr-2.4.46-r4: task do_install: Succeeded
NOTE: recipe attr-2.4.46-r4: task do_populate_sysroot: Started
NOTE: recipe attr-2.4.46-r4: task do_populate_sysroot: Succeeded
NOTE: recipe attr-2.4.46-r4: task do_package: Started
NOTE: recipe attr-2.4.46-r4: task do_package: Succeeded
NOTE: recipe attr-2.4.46-r4: task do_package_write_ipk: Started
NOTE: recipe attr-2.4.46-r4: task do_package_write_ipk: Succeeded
NOTE: recipe attr-2.4.46-r4: task do_rm_work: Started
NOTE: recipe attr-2.4.46-r4: task do_rm_work: Succeeded

But I see this behavior when setscene tasks are executed and=20
later it rebuilds it again quite often (assuming that some error=20
in setscene task was hidden - e.g. that fetcher error from
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D3250
wasn't shown until lately, but maybe was there all the time)

> Its as if it installed from sstate and then decided to overwrite the
> files. Something isn't making sense though :/. Firstly, the sstate
> should have been invalidated due to the package class and variable
> changes. Secondly, if it had installed the files, it should be
> uninstalled them before installing a second set. So I'm confused as to
> what is going on here...

It seems to reinstall a lot of files in sysroot too (which weren't shown be=
fore).

e.g. all files from gst-plugins-good now show warning
WARNING: The recipe gst-plugins-good is trying to install files into a shar=
ed area when those files already exist. Those files are:
   /OE/jansa-test/shr-core/tmp-eglibc/sysroots/tuna/usr/share/gstreamer-0.1=
0/presets/GstIirEqualizer10Bands.prs
   /OE/jansa-test/shr-core/tmp-eglibc/sysroots/tuna/usr/share/gstreamer-0.1=
0/presets/GstIirEqualizer3Bands.prs
=2E..

I'll try to wipe tmp-eglibc again after this build finishes to see if it was
one off or if it will repeat again.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jt0yj30bxbg11sci
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCFNdoACgkQN1Ujt2V2gBxfDwCeMc7S9bfddzRb1FBnaCOlJoZ7
a1gAn0rqu3cQcHBqZYvB0b6SUbV05qdg
=RoL0
-----END PGP SIGNATURE-----

--jt0yj30bxbg11sci--
