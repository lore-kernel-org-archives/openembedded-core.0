Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 14ACA7319A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 11:02:37 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id l126so34129846wml.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 03:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=X/dHB+KweIXADlw682yjmcsRdWu5cYt6Zq9Ee8d8pPg=;
	b=sns3SEhY99hTFV6KKHE9yJzoiCRZnLJc6BgWGLO4II5Ly5nH3BXJUQxJj8EmxNh/Q/
	ftnBE2cArhzoJByZHQ8Yi80VxsgeFfALTT/GinQJKmluknTcvEYxBw18pXICWBg+BiGV
	82yqjhxOrkAIjx2ATdtmGxw2Q4H7vS3aTgKahD+wUDl2bKhplqm/+aF5ZNIkwclD1Y5R
	TRMWVNvzPl6UfMuACF0tjTcUh2JpRg39jOzAIxUiyBEHZnRBcIZPoqtEmpKJ5ooCwd2V
	iT0bgtxDxVD50VNoR2gpfQfTvMBzVeF/DQ1EVr9a3y0QJuU+UbJ0AvvKXswjJxI8Ebzh
	kLGg==
X-Received: by 10.28.100.69 with SMTP id y66mr11049916wmb.98.1450263758269;
	Wed, 16 Dec 2015 03:02:38 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id q7sm5518959wjz.12.2015.12.16.03.02.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Dec 2015 03:02:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 16 Dec 2015 12:04:50 +0100
To: jackie.huang@windriver.com
Message-ID: <20151216110450.GA2767@jama>
References: <1450259641-19389-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1450259641-19389-1-git-send-email-jackie.huang@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] staging.bbclass: make already-stripped can be skipped
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
X-List-Received-Date: Wed, 16 Dec 2015 11:02:39 -0000
X-Groupsio-MsgNum: 74826
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline

--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 16, 2015 at 05:54:01PM +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> Add a check like what we does in package.bbclass
> so that the already-stripped QA test can be skipped.

Cannot we use package_qa_handle_error function here? So that these
issues end in qa.log and user/distro can easily define how important the
warning is for them?

> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta/classes/staging.bbclass | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
> index 967eddd..243bcdf 100644
> --- a/meta/classes/staging.bbclass
> +++ b/meta/classes/staging.bbclass
> @@ -127,7 +127,10 @@ python sysroot_strip () {
>                      elf_file =3D isELF(file)
>                      if elf_file & 1:
>                          if elf_file & 2:
> -                            bb.warn("File '%s' from %s was already strip=
ped, this will prevent future debugging!" % (file[len(dvar):], pn))
> +                            if 'already-stripped' in (d.getVar('INSANE_S=
KIP_' + pn, True) or "").split():
> +                                bb.note("Skipping file %s from %s for al=
ready-stripped QA test" % (file[len(dvar):], pn))
> +                            else:
> +                                bb.warn("File '%s' from %s was already s=
tripped, this will prevent future debugging!" % (file[len(dvar):], pn))
>                              continue
> =20
>                          if s.st_ino in inodes:
> --=20
> 2.3.5
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZxRVEACgkQN1Ujt2V2gBz2WgCgpxV42zGhDMtM5lW8HC4wctHQ
plAAn2GMNc/L38SiEZS274jUW52PguSG
=bO7F
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--
