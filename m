Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2A07CD4F5E
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 10:25:38 +0000 (UTC)
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33453.1779359131193570327
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 03:25:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=Zuh6xlOi;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=LFfmNenL;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.159, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 340AE7A0089;
	Thu, 21 May 2026 06:25:30 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 21 May 2026 06:25:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1779359129; x=1779445529; bh=dwkrA0It7v
	QEyFkY0bWnCKgCzmSnY26EBCDiLuKzIBE=; b=Zuh6xlOiJ3YCGYIyxtvMy91XLa
	1BQPnvYtqdIdb3bxz2GIXVa2CCGv8B8VKTc4fPnjMblfFDlwz5JT9baGHY5NQpeL
	3Gkgjk/c9tBxAGNlqLvCO6VTFcgZbryXMnCiMMGuwKPf1rz1YKcyi025jGV/ZXam
	Lk/XnqtsHOIBoDgHIwUryLWHDTANSECIhjMg1mCdM6Ho+BcnwC331SNmeOE5Fc5I
	GPX8EQRD5z+RwcPl7n0uIT05JFLPG6OnlLdiYlAndxIS+Uu9DAXlKZlrQfe22B9Z
	wxzbbdcYWerrx+Ps1yGkI+6LnbzGWF+ifSocZOjnzFl4RHIhl8XdfnWegFtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1779359129; x=1779445529; bh=dwkrA0It7vQEyFkY0bWnCKgCzmSnY26EBCD
	iLuKzIBE=; b=LFfmNenLXN8hFVPrzZkaSvIqRlbDPUBDsnyIrc2fwb43gq6Q8ak
	bd9G5cSpg5Me7g+rOwTnsp4escqvXxgvWdg2jeo9+jTtIIrbL9SrGDweaYADe8ow
	WEVImM4o+ucEn8BexXC8JJ3EcuAi+vwFyBb1Pa8RUWYX0N0wW9VpjEXicgKgpjst
	89IDJ5JE76oSMp6W+uqtVgdTRfoKBguPzNy08U6hmEu2QEiVXgIa8Am8992Lkgh3
	v3mr76Z6ryRZjWiHOnRe5oz22lDQqqG2wVYkIPuXtPqvb+QIqiR3tGxdVg+qZeSt
	JsBYXR56uPJTPYiSSaUBLiwhnBkaBoiFUQg==
X-ME-Sender: <xms:md0OasGAkaOhc5OYwbjLfQVSE3nZhsdPRDbej7TnxEdUFielyqEJBw>
    <xme:md0OasX4u9EHuvkXTiiS_cBn85fM3lzRh2eP-K8_s7MXfagSj8ZK8xdOZs_aW1W7I
    7g0MTw0caHDApbWHVd2ITBEZSpAZgctKkxy0Ge3ifgfuI9FdWBKWrs>
X-ME-Received: <xmr:md0OarL3D8gsxlthPm0eAEKHBdRfq1lO3bb3z58I93KGjo-6-eyvPS1W3lfANFPvXCQ6jTlVvRylOuFmDLF82lLz8xHe3sZhFQic4cIeSLMz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddugeejvdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epfeffvdefgeevkeduhfetueehhfeikedvieeufeevieffueektdeluddtgfegveehnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlse
    hpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegrlhgvgigrnhguvghrrdhsvhgvrhgulhhinhesshhivghmvghnsh
    drtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhs
    rdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopehmihgthhgrvghlrdhoph
    guvghnrggtkhgvrhesrhhoohhttghomhhmihhtrdgtohhmpdhrtghpthhtoheprhhitghh
    rghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhg
X-ME-Proxy: <xmx:md0Oas9wjhTlHmZ0SqpaChTQPjrWjWa4RQBGUR_aehAhxtOT9BEGCg>
    <xmx:md0OauI3FeiWovuBQMYw18Z1GNHIv3wJaYh35N7jfu7dVW7ZHuVS-g>
    <xmx:md0OahklLLDirZwn7UOjl70a0rDEFzBWJ_P_ZcEphLR2mu8b9ymbrA>
    <xmx:md0OaiNVFxVgt9hNvZxehWEWeTFcQ3aVRB_yeCXwj_wz4uOQeGsTNQ>
    <xmx:md0OaiYP37cDVGnEvaBefknt1ZJLlYqLnHDJES7QbrUcsIyCGrzz_wjX>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 May 2026 06:25:28 -0400 (EDT)
Message-ID: <484fb04a4b512d8456d42720ad89a8bbe8d85b20.camel@pbarker.dev>
Subject: Re: [PATCH] initramfs-framework: replace eval-based bootparam parser
From: Paul Barker <paul@pbarker.dev>
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>, 
	openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, Richard Purdie
	 <richard.purdie@linuxfoundation.org>
Date: Thu, 21 May 2026 11:25:22 +0100
In-Reply-To: <20260519090517.1201609-1-alexander.sverdlin@siemens.com>
References: <20260519090517.1201609-1-alexander.sverdlin@siemens.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-dEezONdQY+F8f5b7T5qq"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 10:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237500


--=-dEezONdQY+F8f5b7T5qq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-05-19 at 11:04 +0200, A. Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>=20
> The bootparam parsing loop uses "eval" to set shell variables from
> kernel command line parameters.  Since eval interprets its argument as
> shell code, a crafted boot parameter such as:
>=20
>   rootdelay=3D1";command;"
>=20
> would be executed as arbitrary shell code during early init.

Hi Alexander,

If you can modify the kernel command line, you can pass options like
`init=3D/bin/sh` and then execute arbitrary commands anyway.

>=20
> Replace the eval-based parser with a single sed invocation that
> tokenizes /proc/cmdline (respecting double-quoted values) and feeds the
> result to a while-read loop that uses only "export" for variable
> assignment, which never interprets the value as code.
>=20
> The sed script works as follows:
> - Split the line at unquoted spaces into one token per line.  The regex
>   treats sequences of non-space/non-quote chars, balanced "..." pairs,
>   and lone " (for mid-value quotes) as atomic units that are never split.
> - Strip outer quotes from whole-param-quoted tokens ("param=3Dval").
> - Strip balanced quotes around parameter values (key=3D"val" -> key=3Dval=
).
> - Replace . and - with _ in parameter names (the key part before =3D),
>   iterating until none remain.
> - Print each processed token and loop (P/D).
>=20
> Additional benefits:
> - Whitespace inside quoted values is now preserved exactly as specified
>   (the for-loop word-splitting collapsed multiple spaces)
> - Reduced from 3+ sed/cut invocations per parameter to a single sed
>   process for the entire command line
>=20
> Co-developed-by: GitHub Copilot (Claude)
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> ---
>  .../initrdscripts/initramfs-framework/init    | 61 ++++++++-----------
>  1 file changed, 24 insertions(+), 37 deletions(-)
>=20
> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/m=
eta/recipes-core/initrdscripts/initramfs-framework/init
> index 67590ad765..97ec62e2da 100755
> --- a/meta/recipes-core/initrdscripts/initramfs-framework/init
> +++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
> @@ -92,43 +92,30 @@ if [ -d $EFI_DIR ];then
>  fi
> =20
>  # populate bootparam environment
> -for p in `cat /proc/cmdline`; do
> -	if [ -n "$quoted" ]; then
> -		p_rstripped=3D${p%\"}
> -		value=3D"$value $p_rstripped"
> -		if [ "$p_rstripped" !=3D "$p" ]; then
> -			# End of a opt=3D"word1 word2..." parameter=20
> -			eval "bootparam_${quoted}=3D\"${value}\""
> -			unset quoted
> -		fi
> -		continue
> -	fi
> -
> -	opt=3D`echo $p | cut -d'=3D' -f1`
> -	opt=3D`echo $opt | sed -e 'y/.-/__/'`
> -	if [ "`echo $p | cut -d'=3D' -f1`" =3D "$p" ]; then
> -		# opt parameter
> -		eval "bootparam_${opt}=3Dtrue"
> -	else
> -		value=3D"`echo $p | cut -d'=3D' -f2-`"	# Option value
> -		value_lstripped=3D${value#\"}
> -		value_rstripped=3D${value%\"}
> -
> -		if [ "$value_lstripped" !=3D "$value" ] && [ "$value_rstripped" !=3D "=
$value" ]; then
> -			# opt=3D"value" parameter
> -			eval "bootparam_${opt}=3D${value_lstripped%\"}"
> -			continue
> -		fi
> -
> -		if [ "$value_lstripped" !=3D "$value" ]; then
> -			# Start of a opt=3D"word1 word2..." parameter=20
> -			quoted=3D${opt}
> -			value=3D${value_lstripped}
> -			continue
> -		fi
> -		eval "bootparam_${opt}=3D\"${value}\""
> -	fi
> -done
> +while IFS=3D read -r token; do
> +	case "$token" in
> +	*=3D*)
> +		opt=3D"${token%%=3D*}"
> +		value=3D"${token#*=3D}"
> +		;;
> +	*)
> +		opt=3D"$token"
> +		value=3D"true"
> +		;;
> +	esac
> +	export "bootparam_${opt}=3D${value}"
> +done <<EOF
> +$(sed -E '
> +s/^(([^ "]*|"[^"]*"|")*) +/\1\
> +/
> +s/^"(.*)"$/\1/
> +s/^([^=3D]*)=3D"(.*)"/\1=3D\2/
> +:k
> +s/^([^=3D.-]*)[.-]/\1_/
> +tk
> +P
> +D' /proc/cmdline)
> +EOF

The main issue here is that this replaces comprehensible code with
incomprehensible line noise, reducing maintainability. If you want to
remove eval calls from this script, it needs to be done in a different
way.

Best regards,

--=20
Paul Barker


--=-dEezONdQY+F8f5b7T5qq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCag7dkhEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0br2vAQCo6CdgJac7r0kS1n4NmOnyH6IfMG/WMeVZ
0FsZMmfHFQEApxw5ZK1WYUKAJiyaHeQeuj64kHj84pQdkAVZ/876IAU=
=o7RD
-----END PGP SIGNATURE-----

--=-dEezONdQY+F8f5b7T5qq--

