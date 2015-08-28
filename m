Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 7391960043
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 06:07:46 +0000 (UTC)
Received: by pacdd16 with SMTP id dd16so51407150pac.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 23:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=MygEOrrgtlFQJiMM4IHb9XMkV6TqVePoNNoUvuZUKl0=;
	b=0fCR3rdXn67zRRi24Nps4M6hoEX0XGTq1kIeC/eRsGomUQzTecPzv8aI1Av7GoETD5
	9LKZ29LM1jX/VvXPac61uEBAKUScIb7wKwBBzoHvdh9bz7/c1Ijx1JeAzfsYFck+s5Ru
	joQAg8dmPNlSdlwQ63hZ2xC1l9c/S1mm6Y4exgNnItGPNs1PiQ0rJvvDS6aFniGtKUJX
	InYRd4YymC/NVXYdSY1h3e3aQ5LnJJK65Rxp3dQxpGSw81cUZZuIMVGGGBHaeYjiZfJs
	8isE4ax+2HgmqYeNksNrKyLr7B51krqv7Pyqk3tQjnSWXcjNSdIVHuQ7SgybcEMV/+Ki
	7qfQ==
X-Received: by 10.68.178.1 with SMTP id cu1mr12653124pbc.1.1440742066524;
	Thu, 27 Aug 2015 23:07:46 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:e943:4351:71e0:b332?
	([2601:646:8601:4580:e943:4351:71e0:b332])
	by smtp.gmail.com with ESMTPSA id l4sm4409936pde.31.2015.08.27.23.07.45
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 27 Aug 2015 23:07:45 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <762e79dfb769e885758bdcc627fadbe4dc6454fd.1440678731.git.paul.eggleton@linux.intel.com>
Date: Thu, 27 Aug 2015 23:07:44 -0700
Message-Id: <26B844B8-BE69-427B-8DA7-B649C46A5632@gmail.com>
References: <cover.1440678731.git.paul.eggleton@linux.intel.com>
	<cover.1440678731.git.paul.eggleton@linux.intel.com>
	<762e79dfb769e885758bdcc627fadbe4dc6454fd.1440678731.git.paul.eggleton@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/1] classes/whitelist: add class to allow whitelisting recipes from a layer
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
X-List-Received-Date: Fri, 28 Aug 2015 06:07:51 -0000
X-Groupsio-MsgNum: 70204
Content-Type: multipart/signed;
	boundary="Apple-Mail=_66693188-9123-419C-8662-CED5A13B3545";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_66693188-9123-419C-8662-CED5A13B3545
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 27, 2015, at 5:36 AM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:
>=20
> Allow restricting recipes brought from a layer to a specified list. =
This
> is similar in operation to blacklist.bbclass, but instead specifies a
> per-layer whitelist of recipes (matched by PN or BPN) that are able to
> be built from the layer - anything else is skipped. This is =
potentially
> useful where you want to bring in a select set of recipes from a =
larger
> layer e.g. meta-oe.

For the record, I am not in favor of such feature in OE, Distros can =
still use BBMASK if they wish to


>=20
> Implements [YOCTO #8150].
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
> meta/classes/whitelist.bbclass | 34 ++++++++++++++++++++++++++++++++++
> 1 file changed, 34 insertions(+)
> create mode 100644 meta/classes/whitelist.bbclass
>=20
> diff --git a/meta/classes/whitelist.bbclass =
b/meta/classes/whitelist.bbclass
> new file mode 100644
> index 0000000..ab6ac73
> --- /dev/null
> +++ b/meta/classes/whitelist.bbclass
> @@ -0,0 +1,34 @@
> +# Class that allows you to restrict the recipes brought from a layer =
to
> +# a specified list. This is similar in operation to blacklist.bbclass
> +# but note the difference in how PNWHITELIST is set - we don't use =
varflags
> +# here, the recipe name goes in the value and we use an override for =
the
> +# layer name (although this is not strictly required - you can have =
one
> +# PNWHITELIST value shared by all of the layers specified in
> +# PNWHITELIST_LAYERS). The layer name used here is actually the name =
that
> +# gets added to BBFILE_COLLECTIONS in the layer's layer.conf, which =
may
> +# differ from how the layer is otherwise known - e.g. meta-oe uses
> +# "openembedded-layer".
> +#
> +# INHERIT +=3D "whitelist"
> +# PNWHITELIST_LAYERS =3D "layername"
> +# PNWHITELIST_layername =3D "recipe1 recipe2"
> +#
> +# If you would prefer to set a reason message other than the default, =
you
> +# can do so:
> +#
> +# PNWHITELIST_REASON_layername =3D "not supported by ${DISTRO}"
> +
> +python() {
> +    layer =3D bb.utils.get_file_layer(d.getVar('FILE', True), d)
> +    if layer:
> +        layers =3D (d.getVar('PNWHITELIST_LAYERS', True) or =
'').split()
> +        if layer in layers:
> +            localdata =3D bb.data.createCopy(d)
> +            localdata.setVar('OVERRIDES', layer)
> +            whitelist =3D (localdata.getVar('PNWHITELIST', True) or =
'').split()
> +            if not (d.getVar('PN', True) in whitelist or =
d.getVar('BPN', True) in whitelist):
> +                reason =3D localdata.getVar('PNWHITELIST_REASON', =
True)
> +                if not reason:
> +                    reason =3D 'not in PNWHITELIST for layer %s' % =
layer
> +                raise bb.parse.SkipRecipe(reason)
> +}
> --
> 2.1.0
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_66693188-9123-419C-8662-CED5A13B3545
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXf+rAACgkQuwUzVZGdMxQy/wCfZlJ6Jn6Z/ljkzK3bSWglKD8K
+/UAnir9BZnx2xfUZtFk98IN7d/DVSlb
=30HN
-----END PGP SIGNATURE-----

--Apple-Mail=_66693188-9123-419C-8662-CED5A13B3545--
