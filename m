Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TJMRW-0004rX-6K
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 12:44:42 +0200
Received: by wibhj13 with SMTP id hj13so1767784wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Oct 2012 03:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=JcpJUGPJ/AAOaljptbJO14hseDzSKzubVFUtSjuohIY=;
	b=iW4sAzpbWPJAKhvI5JuaH1yJ7qsjr/iDAtT9p9MmZGysc7tcT2Dt+H5iykwk9TE+BH
	iF/1d2Lu95v5Q8/MSZRoFRwqFikOyEz+FptS+d4DCGADCGS7ICjqgr1kNtw0AVcvn+dF
	dUkkT1y+pAj5BSn64veQzZ+tiljJY5qhzME8eSlxjHa41EGx0R0d80yI3JAFQDucXUUR
	pjzrrYH1GqxcX6VXI1/V98+wseeYAArWtdqS3ywA90VMpAiBfFwFdHDalVg00aiyDDwd
	EoLdC3zg8jChYNbuNAn53C/OlXzu7iGaeDrLuqDdeZWE4hzBV3wZlddu8H2YH4X6yw1K
	tFiA==
Received: by 10.216.240.3 with SMTP id d3mr1049683wer.87.1349260302779;
	Wed, 03 Oct 2012 03:31:42 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id hv8sm30540850wib.0.2012.10.03.03.31.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Oct 2012 03:31:41 -0700 (PDT)
Date: Wed, 3 Oct 2012 12:31:41 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Phil Blundell <philb@gnu.org>
Message-ID: <20121003103141.GA21043@jama.jama.net>
References: <1349259854.32611.106.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1349259854.32611.106.camel@phil-desktop>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] insane: detect and warn about relocations in .text
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
X-List-Received-Date: Wed, 03 Oct 2012 10:44:42 -0000
X-Groupsio-MsgNum: 30300
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline

--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 03, 2012 at 11:24:12AM +0100, Phil Blundell wrote:
> Signed-off-by: Phil Blundell <pb@pbcl.net>

Can you add a bit longer description of possible issues with relocations
in .text? So that people seeing this issue will know how dangerous it is
for them?

=46rom my understanding (after reading
http://www.gentoo.org/proj/en/hardened/pic-fix-guide.xml) it's mostly
performance issue?

Cheers,

> ---
> This requires qa.elf.run_objdump() so needs to be applied after the
> patch which adds that function.
>=20
>  meta/classes/insane.bbclass |   26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 5848ab4..ff35ed8 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -108,7 +108,7 @@ def package_qa_get_machine_dict():
> =20
> =20
>  # Currently not being used by default "desktop"
> -WARN_QA ?=3D "ldflags useless-rpaths rpaths unsafe-references-in-binarie=
s unsafe-references-in-scripts staticdev libdir"
> +WARN_QA ?=3D "ldflags useless-rpaths rpaths unsafe-references-in-binarie=
s unsafe-references-in-scripts staticdev libdir textrel"
>  ERROR_QA ?=3D "dev-so debug-deps dev-deps debug-files arch la2 pkgconfig=
 la perms dep-cmp"
> =20
>  ALL_QA =3D "${WARN_QA} ${ERROR_QA}"
> @@ -421,6 +421,30 @@ def package_qa_check_desktop(path, name, d, elf, mes=
sages):
>          for l in output:
>              messages.append("Desktop file issue: " + l.strip())
> =20
> +QAPATHTEST[textrel] =3D "package_qa_textrel"
> +def package_qa_textrel(path, name, d, elf, messages):
> +    """
> +    Check if the binary contains relocations in .text
> +    """
> +
> +    if not elf:
> +        return
> +
> +    if os.path.islink(path):
> +        return
> +
> +    phdrs =3D elf.run_objdump("-p", d)
> +    sane =3D True
> +
> +    import re
> +    textrel_re =3D re.compile("\s+TEXTREL\s+")
> +    for line in phdrs.split("\n"):
> +        if textrel_re.match(line):
> +	   sane =3D False
> +
> +    if not sane:
> +        messages.append("ELF binary '%s' has relocations in .text" % pat=
h)
> +
>  QAPATHTEST[ldflags] =3D "package_qa_hash_style"
>  def package_qa_hash_style(path, name, d, elf, messages):
>      """
> --=20
> 1.7.10.4
>=20
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBsFA0ACgkQN1Ujt2V2gBzA8wCghhjiNgcRUDZWTcoDMHgK6XJU
VCkAoLh7R+ZMh2T8PSFRAqg6XADaPpj1
=yoPs
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--
