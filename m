Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RBoxd-0006KW-Se
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 16:30:09 +0200
Received: by bke11 with SMTP id 11so3654423bke.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Oct 2011 07:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=atSkgIYcz1bKCjwHIAX7OTpzCAQhcELPw91C9CsEJoU=;
	b=J8fSTp2lxXEVoeQirsDT6tYgHdwX+bVgZhQ1ojVOGSuc0E38WBY4HudUzbTWb8gVLh
	42ZZgnA+7YBnfpSfEo0i+dYXLHQ8D14hfaLvEHQINrYPIS1+K4CV/obmLH/6VSQWVlK7
	gfiqNHdhOSytcNtRMrWM09+1zHDnRfQTMuLvo=
Received: by 10.204.135.89 with SMTP id m25mr567210bkt.365.1317911074140;
	Thu, 06 Oct 2011 07:24:34 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e14sm5758209bka.0.2011.10.06.07.24.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Oct 2011 07:24:32 -0700 (PDT)
Date: Thu, 6 Oct 2011 16:24:27 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111006142426.GA3485@jama.jama.net>
References: <1317910715.6398.84.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1317910715.6398.84.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: base.bbclass: Implement PACKAGECONFIG
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
X-List-Received-Date: Thu, 06 Oct 2011 14:30:10 -0000
X-Groupsio-MsgNum: 10594
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline

--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 06, 2011 at 03:18:27PM +0100, Richard Purdie wrote:
> These enabled options to be specified in the form:
>=20
> PACKAGECONFIG ?? =3D "<default options>"
> PACKAGECONFIG[foo] =3D "--enable-foo,--disable-foo,foo_depends,foo_runtim=
e_depends"
>=20
> So that DEPENDS, RDEPENDS_${PN} and EXTRA_OECONF can be automatically
> built from specific options. Those options can easily be customised
> by the distro config or the user.
>=20
> Based on some ideas from Chris Elston <celston@katalix.com> but with
> an improved easier to use one line interface.

1) How can user check on target if his package was built with foo enabled?
   - is there some plan to keep this in ipk/deb metadata?
2) Is it possible to force some PACKAGECONFIG enable/disabled from
   DEPENDS/RDEPENDS, ie bar_1.0.bb with foo enabled, depends not only on
   abc recipe but needs abc also with foo enabled.

Regards,

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 7cd6efa..f539744 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -291,6 +291,44 @@ do_build () {
>  python () {
>      import exceptions, string, re
> =20
> +    # Handle PACKAGECONFIG
> +    #
> +    # These take the form:
> +    #
> +    # PACKAGECONFIG ?? =3D "<default options>"
> +    # PACKAGECONFIG[foo] =3D "--enable-foo,--disable-foo,foo_depends,foo=
_runtime_depends"
> +    pkgconfig =3D (d.getVar('PACKAGECONFIG', True) or "").split()
> +    if pkgconfig:
> +        def appendVar(varname, appends):
> +            if not appends:
> +                return
> +            varname =3D bb.data.expand(varname, d)
> +            content =3D d.getVar(varname, False) or ""
> +            content =3D content + " " + " ".join(appends)
> +            d.setVar(varname, content)
> +
> +        extradeps =3D []
> +        extrardeps =3D []
> +        extraconf =3D []
> +        for flag, flagval in (d.getVarFlags("PACKAGECONFIG") or {}).item=
s():
> +            if flag =3D=3D "defaultval":
> +                continue
> +            items =3D flagval.split(",")
> +            if len(items) =3D=3D 3:
> +                enable, disable, depend =3D items
> +                rdepend =3D ""
> +            elif len(items) =3D=3D 4:
> +                enable, disable, depend, rdepend =3D items
> +            if flag in pkgconfig:
> +                extradeps.append(depend)
> +                extrardeps.append(rdepend)
> +                extraconf.append(enable)
> +            else:
> +                extraconf.append(disable)
> +        appendVar('DEPENDS', extradeps)
> +        appendVar('RDEPENDS_${PN}', extrardeps)
> +        appendVar('EXTRA_OECONF', extraconf)
> +
>      # If PRINC is set, try and increase the PR value by the amount speci=
fied
>      princ =3D bb.data.getVar('PRINC', d, True)
>      if princ:
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6NuhoACgkQN1Ujt2V2gBz/hgCeL5SjI96Y7YT+2J7BQxvpnWVC
XfEAni9WejUPAEncZ1gjC/lFzlgQF3q2
=49hb
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
