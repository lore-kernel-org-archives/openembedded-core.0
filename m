Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SwwMD-0001pH-VF
	for openembedded-core@openembedded.org; Thu, 02 Aug 2012 16:26:34 +0200
Received: by bkcik5 with SMTP id ik5so3445668bkc.6
	for <openembedded-core@openembedded.org>;
	Thu, 02 Aug 2012 07:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hxiuU6tU/Fmntg9lCS4QfvEBjpKhVOV+w3d49JwXQFg=;
	b=B4w9qBR8Mfn4xR7fxob30I9di0/CAp4rkqv4z5zzkbzcVTK8Q2lqTymR5XvjQVvEyR
	1WMVQ15OFbugRr/mruYHioGvtiozebu051Kc2X4gz5Sib0S/QnKDpdOSr0U+qjAn7T2U
	ZGP4naUdJgVeXKpH2kJguV5arsJqClror1rFRlPVqDtOE3fGyZLvGD8YifuKi88ozjik
	rjbroPSPdKY1dHRGsvrCgA4EqDOSQ/HE82cVm1xrzmWl5B6aS6VG5h2cvdUH4UuGX7zv
	4Ts9QrC86+lIuRIx6c3vW65grFd4sJOLjnuEW+GWEn9TtgrGy+uucmEynZhoGftpcqrD
	Nqfg==
Received: by 10.204.133.194 with SMTP id g2mr8225377bkt.13.1343916894439;
	Thu, 02 Aug 2012 07:14:54 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y20sm3512842bkv.11.2012.08.02.07.14.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 07:14:52 -0700 (PDT)
Date: Thu, 2 Aug 2012 16:14:50 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120802141450.GS16306@jama.jama.net>
References: <1343250562.29991.0.camel@ted>
	<20120802135335.GQ16306@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120802135335.GQ16306@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core <openembedded-core@openembedded.org>
Subject: Re: [oe] [PATCH] sstate: Add a two character subdirectory to the sstate directory layout
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
X-List-Received-Date: Thu, 02 Aug 2012 14:26:34 -0000
X-Groupsio-MsgNum: 26784
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="562f9N4fbIs+fPrJ"
Content-Disposition: inline

--562f9N4fbIs+fPrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 02, 2012 at 03:53:35PM +0200, Martin Jansa wrote:
> On Wed, Jul 25, 2012 at 10:09:22PM +0100, Richard Purdie wrote:
> > Currently all sstate files are placed into one directory. This does not=
 scale and
> > causes a variety of filesystem issues. This patch adds a two character =
subdirectory
> > to the layout (based on the first two characters of the hash) so that f=
iles
> > can be split into several directories.
> >=20
> > This should help performance of sstate in most cases by avoding creatin=
g directories with=20
> > huge numbers of files.
> >=20
> > The SSTATE_MIRRORS syntax needs updating to account for the extra path =
element by
> > the addition of a PATH item, for example:
> >=20
> > SSTATE_MIRRORS =3D "file://.* file:///some/path/to/sstate-cache/PATH"
> > SSTATE_MIRRORS =3D "file://.* http://192.168.1.23/sstate-cache/PATH"
> >=20
> > This change also sets the scene for using things like lsb-release in
> > the=20
>=20
> Is it possible to create 2nd level cache with this?
>=20
> I have some server with slow upload but fully populated sstate-cache.
>=20
> So on server with faster upload which could be used as offical
> SSTATE_MIRROR for SHR distro I would like to add
>=20
> SSTATE_MIRRORS ?=3D "file://.* http://slow-server/sstate-cache/PATH"
>=20
> And then sync my sstate-cache directory to public accessible web root (wi=
th rsync).
>=20
> Problem is that now sstate-cache has all files in slightly different=20
> layout then original sstate-cache on slow server. From what I see I guess=
=20
> it finds URL with correct prefix "sstate-cache/Gentoo-2.1/0d" and downloa=
ds it=20
> directly to sstate-cache dir (and adds .done)
>=20
> OE @ ~/oe-core $ ll sstate-cache/sstate-apr-native-x86_64-linux-1.4.6-r1-=
x86_64-2-*populate-lic*
> -rw-r--r-- 1 bitbake bitbake 9257 Jul 30 12:31 sstate-cache/sstate-apr-na=
tive-x86_64-linux-1.4.6-r1-x86_64-2-0d2ed24b90d50bf83e5fe94536596e50_popula=
te-lic.tgz
> -rw-r--r-- 1 bitbake bitbake    0 Aug  2 15:40 sstate-cache/sstate-apr-na=
tive-x86_64-linux-1.4.6-r1-x86_64-2-0d2ed24b90d50bf83e5fe94536596e50_popula=
te-lic.tgz.done
>=20
> And then creates symlink in right prefix back to absolute path of sstate-=
cache/file:
> OE @ ~/oe-core $ ll sstate-cache/Gentoo-2.1/0d/sstate-apr-native-x86_64-l=
inux-1.4.6-r1-x86_64-2-*populate-lic*
> lrwxrwxrwx 1 bitbake bitbake 123 Aug  2 15:40 sstate-cache/Gentoo-2.1/0d/=
sstate-apr-native-x86_64-linux-1.4.6-r1-x86_64-2-0d2ed24b90d50bf83e5fe94536=
596e50_populate-lic.tgz ->=20
> /OE/oe-core/sstate-cache/sstate-apr-native-x86_64-linux-1.4.6-r1-x86_64-2=
-0d2ed24b90d50bf83e5fe94536596e50_populate-lic.tgz
>=20
> But after sstate-cache directory is rsynced somewhere else and oe-core/ss=
tate-cache is removed,=20
> all those symlinks point nowhere and public sstate-cache is unusable.
>=20
> Can we have relative paths used in symlinks or even instruct fetcher to d=
ownload that=20
> file directly to right prefix?

2 more ideas:

1) would be great to also download file.sigdata if it exists, to be able
   to compare them when they change even on machine which downloaded
   older sstate file from remote url
2) if the reason for this patch was number of files in shared
   sstate-cache directory, then fetcher creating .done files makes
   number double too (would be fine if fetcher stores all 3 files
   (.tgz, .tgz.sigdata, .tgz.done) in right prefix, or moves them to
   right prefix instead of symlinks.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--562f9N4fbIs+fPrJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAai1oACgkQN1Ujt2V2gByIhACgkwnhzuUdRvP6n9oKbh38nFdG
kFoAn0wB6xgEwIPPMGXIUdAsQo3C+kQO
=Yvtb
-----END PGP SIGNATURE-----

--562f9N4fbIs+fPrJ--
