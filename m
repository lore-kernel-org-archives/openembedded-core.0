Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id A95186A463
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 00:35:29 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g15so2779777eak.18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 16:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SSLuBLGc2vJkk2J6zabnjNrgaul9c+MUY4BnMRw1+fA=;
	b=hvSAIPYARgQB8KD28YfPwzUptPsFVeiGApygTtNQeQGoNGeZU8BxV+CO2elQasaNfW
	LXPOYPXlL4AW9wQj1DInn1Qn4v3PUvB9/ZbGWWEAXlZYLWlCs8CVjJeVnCvv1XucrBwW
	Dpgl5DV42h+/ok88Jv6eCDeCSRrLvLxOzPK6TPMRaWTlKWOFLU4H7bFzvrqgWAO0E5ER
	DnIqKUnjAc2sWFll0JNJS2dmE8tH6lRzn1OsbZFOUmgc0tAKovKtLqReTkoFwALYsRzq
	2hfslxZWqXjM0iGOdXsM8cSfybBXwJjq4UV7iXpevXKtZXyZs8kRwKCdD0yJxhcMEW2l
	5jCA==
X-Received: by 10.14.246.140 with SMTP id q12mr71956eer.123.1384907731010;
	Tue, 19 Nov 2013 16:35:31 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 44sm53936792eek.5.2013.11.19.16.35.29
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Nov 2013 16:35:30 -0800 (PST)
Date: Wed, 20 Nov 2013 01:35:32 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Peter Seebach <peter.seebach@windriver.com>
Message-ID: <20131120003532.GI3708@jama>
References: <cover.1384907111.git.peter.seebach@windriver.com>
	<16a4c667fd7dde1f7d503942c45e03a6bda98ae8.1384907111.git.peter.seebach@windriver.com>
MIME-Version: 1.0
In-Reply-To: <16a4c667fd7dde1f7d503942c45e03a6bda98ae8.1384907111.git.peter.seebach@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sanity.bbclass: Don't fatal() when trying to dump environment.
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
X-List-Received-Date: Wed, 20 Nov 2013 00:35:30 -0000
X-Groupsio-MsgNum: 47309
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qLni7iB6Dl8qUSwk"
Content-Disposition: inline

--qLni7iB6Dl8qUSwk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2013 at 06:31:57PM -0600, Peter Seebach wrote:
> It is distressing when bitbake -e can't run due to sanity check
> failures, because the solution often involves figuring out what
> configuration file are being read and what values they are setting.
> Solution: Don't do that. If the datasmart object reports that
> tracking is enabled, emit an error() but not a fatal(), and also
> warn the user that things may be badly broken.
>=20
> This depends on a change to bitbake (adding the isTracking() method).
>=20
> Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
> ---
>  meta/classes/sanity.bbclass |    8 +++++++-
>  1 files changed, 7 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 6807a23..1ef811d 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -82,11 +82,17 @@ def raise_sanity_error(msg, d, network_error=3DFalse):
>              bb.event.fire(bb.event.SanityCheckFailed(msg), d)
>          return
> =20
> -    bb.fatal(""" OE-core's config sanity checker detected a potential mi=
sconfiguration.
> +    msg =3D (""" OE-core's config sanity checker detected a potential mi=
sconfiguration.
>      Either fix the cause of this error or at your own risk disable the c=
hecker (see sanity.conf).
>      Following is the list of potential problems / advisories:
>     =20
>      %s""" % msg)
> +    if d.isTracking():
> +	bb.warn("Environment tracking enabled: NOT exiting on sanity check fail=
ures.")
> +	bb.warn("Results may be inconsistent or meaningless; proceed at your ow=
n risk.")

Inconsistent whitespace

> +        bb.error(msg)
> +    else:
> +        bb.fatal(msg)
> =20
>  # Check a single tune for validity.
>  def check_toolchain_tune(data, tune, multilib):
> --=20
> 1.7.1
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qLni7iB6Dl8qUSwk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKMA9QACgkQN1Ujt2V2gBznFACfXhf9b0DSdoP6KFctTZkZ9qAB
ILwAnjrrOyJ0xaDeZkTsGxGIETKknVCP
=ZmvN
-----END PGP SIGNATURE-----

--qLni7iB6Dl8qUSwk--
