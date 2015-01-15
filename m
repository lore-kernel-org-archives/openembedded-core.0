Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5F36D72541
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 15:33:24 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id q59so15346758wes.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 07:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=03BXB6SfJUS2sqWH3kgr3L1BxOmPv9pkOydBtnGCB5M=;
	b=GsiiYsRKTnZULhc2wJOdfWDZzgPFTof+nrtp9cyruOKfGFVgtv0CXCLm9DEC+w96Bi
	ieopRvpdF/b+vkEZPLkZPwIkix/MU5dDnt6zgfeSledsf3p8z05IpSF065siOfISVZZ1
	NY5ITU4aNwLle4DsGOTL377NW6LxZnm3bO37H4Nu10AuO1gI0Yuy/4bnsFaeHwKVe8F3
	tmyDPifieggKuDhh+RQsA/Wrm5YNAQMq9/RJGVKBD3//CGFC3E0cqdKigKUjNcK8zVjY
	wKOmpGXt7yhqgBzbxJ7Exoa4UuCEhqEKiRRuCxCDV8SJA/nlnXYpSwBSyXyX7cBiU4TY
	yTtw==
X-Received: by 10.180.81.169 with SMTP id b9mr20090829wiy.41.1421336004959;
	Thu, 15 Jan 2015 07:33:24 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fp2sm23207294wib.8.2015.01.15.07.33.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Jan 2015 07:33:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 15 Jan 2015 16:33:28 +0100
To: openembedded-core@lists.openembedded.org
Message-ID: <20150115153328.GA2482@jama>
References: <1420737078-24121-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1420737078-24121-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] package.bbclass: Fix support for private libs
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
X-List-Received-Date: Thu, 15 Jan 2015 15:33:32 -0000
X-Groupsio-MsgNum: 61415
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline

--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 08, 2015 at 06:11:18PM +0100, Martin Jansa wrote:
> * n is a tuple since this commit:
>   commit d3aa7668a9f001044d0a0f1ba2de425a36056102
>   Author: Richard Purdie <richard.purdie@linuxfoundation.org>
>   Date:   Mon Jul 7 18:41:23 2014 +0100
>   Subject package.bbclass: Improve shlibs needed data structure
>=20
>   since then 'n in private_libs' was always false and private libs
>   were always processed
> * this is bad when we have libfoo in private libs, but also some package
>   providing libfoo, that way we ship own libfoo.so, but together with
>   runtime dependency on package providing libfoo

ping, please merge this to dizzy as well.

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/package.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index fc501fc..31c9e08 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1574,7 +1574,7 @@ python package_do_shlibs() {
>              # /opt/abc/lib/libfoo.so.1 and contains /usr/bin/abc dependi=
ng on system library libfoo.so.1
>              # but skipping it is still better alternative than providing=
 own
>              # version and then adding runtime dependency for the same sy=
stem library
> -            if private_libs and n in private_libs:
> +            if private_libs and n[0] in private_libs:
>                  bb.debug(2, '%s: Dependency %s covered by PRIVATE_LIBS' =
% (pkg, n[0]))
>                  continue
>              if n[0] in shlib_provider.keys():
> --=20
> 2.2.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlS33cgACgkQN1Ujt2V2gBxvHwCeNlziMVeS3PMDHvlRlw8iEIPC
6+EAnRRJDGt0oa4YomcJy8sWzMKctmN/
=4Hai
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--
