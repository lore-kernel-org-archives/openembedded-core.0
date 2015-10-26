Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id CFCFB6013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 19:56:36 +0000 (UTC)
Received: by wicfx6 with SMTP id fx6so130278591wic.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 12:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=F/QqotBR0s5Dmh74zvXNxlMiwKgTFQtIEe/WJuUMjCM=;
	b=cFOLon3VfxTz6BEqWhWl548p3li4dcmA/JwRuksZLgQdqW7Dfxy7xGeEnE5FvFRG1v
	+UnOOyGcL8MlHwFOp4yXu9LIxYtcWIrerXrWEVkalCHTvRa9T/Wkdw/25pvYWvE4ygpd
	vn0x2GwvcmU4Lda3ovMc9ad2pzhtPpmEWe5SBiTpZwmtHGDNtnQixOhURsWu2ipH4mqn
	RHH1byiKiOo1R4qAdmvqe0cKYSRZdfOF3c6fu/dbcC9E/SliZyGjdD4VpDEpEUNoZ6Dn
	ZwLVM9YS1loYp7Db8s/2zab8hcCFNfqm8yJlv8AYPWSzNAjfm5ILkKaWYF0ZlTDn0vsR
	OFSg==
X-Received: by 10.194.76.178 with SMTP id l18mr22619791wjw.75.1445889396545;
	Mon, 26 Oct 2015 12:56:36 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	om1sm37591331wjc.2.2015.10.26.12.56.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Oct 2015 12:56:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 26 Oct 2015 20:56:47 +0100
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20151026195647.GH2554@jama>
References: <1445873454-108723-1-git-send-email-mark.hatle@windriver.com>
	<1445873454-108723-2-git-send-email-mark.hatle@windriver.com>
	<20151026181521.GF2554@jama> <562E7C74.5090105@windriver.com>
MIME-Version: 1.0
In-Reply-To: <562E7C74.5090105@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [jethro/master][PATCH 1/1] local.conf.sample: Disable image-prelink by default
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
X-List-Received-Date: Mon, 26 Oct 2015 19:56:38 -0000
X-Groupsio-MsgNum: 72649
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SdvjNjn6lL3tIsv0"
Content-Disposition: inline

--SdvjNjn6lL3tIsv0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2015 at 02:18:12PM -0500, Mark Hatle wrote:
> On 10/26/15 1:15 PM, Martin Jansa wrote:
> > On Mon, Oct 26, 2015 at 10:30:54AM -0500, Mark Hatle wrote:
> >> Due to problems with the prelinker itself, we need to disable the
> >> image-prelink by default.  This will hopefully be re-enabled in the ne=
ar
> >> future.
> >=20
> > Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
> >=20
> > We had to disable it in our builds back in Dylan days.
>=20
> FYI this is working just fine in Dizzy.  I've heard reports it works in F=
ido.
> This is the first that I know it's universally broken.  (It's possible th=
ere
> were some issues in Fido, as I have not verified it either way.. but Dizzy
> definitely works and passes expected testings.)

The main reason why we disabled it back then was that it was causing
debug symbols in -dbg packages not matching the prelinked binary in the
image

  The size of dynamic relocation section(rel.dyn) was changed from 0027a0
  to 003b70 by prelinking. Hence, the code section offset was also changed
  from 015550 to 016920.
  So, we can not use the dwarf file (.debug/libc-2.14.1.so) made before
  prelinking.

  The number of relocations was 1296 when i use prelinked libraries.
  This value was same on non-prelink. But the number of relative
  relocations has decreased from 2296 to 328.

Then we did some benchmarks on our target and they didn't show any
significant difference with and without prelink, for 4 stages of our
boot we got:

7.06 -> 7.08, 0.28%
5.63 -> 5.75, 2.09%
10.47 -> 10.53, 0.53%
26.11 -> 26.15, 0.15%

So we have disabled it and never looked back.

Regards,

> >> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> >> ---
> >>  meta/conf/local.conf.sample | 4 +++-
> >>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
> >> index 3ae24ab..9d1480e 100644
> >> --- a/meta/conf/local.conf.sample
> >> +++ b/meta/conf/local.conf.sample
> >> @@ -128,7 +128,9 @@ EXTRA_IMAGE_FEATURES =3D "debug-tweaks"
> >>  #   - 'image-swab' to perform host system intrusion detection
> >>  # NOTE: if listing mklibs & prelink both, then make sure mklibs is be=
fore prelink
> >>  # NOTE: mklibs also needs to be explicitly enabled for a given image,=
 see local.conf.extended
> >> -USER_CLASSES ?=3D "buildstats image-mklibs image-prelink"
> >> +# NOTE: image-prelink is currently broken due to problems with the pr=
elinker.  It is advised
> >> +# that you do NOT run the prelinker at this time.=20
> >> +USER_CLASSES ?=3D "buildstats image-mklibs"
> >> =20
> >> =20
> >>  #
> >> --=20
> >> 1.9.3
> >>
> >> --=20
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >=20
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SdvjNjn6lL3tIsv0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYuhX4ACgkQN1Ujt2V2gBx7ogCgo4+Fsx2/c2SozaBPxBjY0PR0
aXYAoI44QwTLvwciGHKUgGJj/GpZaQST
=Ldda
-----END PGP SIGNATURE-----

--SdvjNjn6lL3tIsv0--
