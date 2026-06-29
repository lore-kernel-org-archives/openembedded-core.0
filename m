Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29AA2C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 19:09:50 +0000 (UTC)
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4697.1782760187108820149
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 12:09:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=UlZMc+2x;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=JErpTamb;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.153, mailfrom: paul@pbarker.dev)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 107471400101;
	Mon, 29 Jun 2026 15:09:46 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Mon, 29 Jun 2026 15:09:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1782760186; x=1782846586; bh=glySSENbMq
	HtUesJ770VnLAura6yotNNO7CJLw565ww=; b=UlZMc+2xrQoEWu13rxR6HD/Rnj
	BwMVso2oY4KBRdtuWEHZfhvLRPYLEvK2nagCr7boei+CmHuvez4RysR7q59R3oSI
	xbiw6e39MBzyP/UrFvHvyS77GL3/rEj166p2+aEBCaAMC4fg8xOqHmKAfktw4Hu7
	3CS++loC+xyDHLthbV2k9lPfLZV5HO05S+M0eXbpnccglMenQYJrLAbULQIm2/FO
	VwHfvcIhKIh3DtEgxb0JKq04g/7ckovFGenYprVBDoj4r9oTYHP1jXinHf0/l1GP
	dntd67fnJGB0uzkJZ0I9cSxCzVswvdA2IOcRBPo7QMxI251t6bxlZTpN+riQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1782760186; x=1782846586; bh=glySSENbMqHtUesJ770VnLAura6yotNNO7C
	JLw565ww=; b=JErpTambwCIAhrtsvpbHpNJ8wAtb8chblis9vFmLlCYv89szWmL
	t4Kk+yW3RLdJe4vjyIerPV7TpGnY+S29X+753PxAaOrpP5j7r7h9vS04V2b+CVWM
	sUk9PjCXHAGrlGuD2NDyhG8OFjCoVgca+Vo0c80/asDriDnd+AYcR/jt7DtTWWLO
	O/VNDTwIjmAGj3t6Otpy5zOedrhLNyFQWcvdqd6czb+3YYw3Iyybad9AmdOldUgu
	gUQ5SRLtUU37WQG+MzLafUQE9j0tTJPTG0yef7zBfGydo+n5RzvK7jS9wjOd2RRX
	SDwZ6KpaL8y2EFOjPcPBlRUuhNoVrEgRudQ==
X-ME-Sender: <xms:-cJCaq2VJdI9Rzk1z_mnOtKYZF8TX2UAfsSQquD_bqBKgu3q8GZNCg>
    <xme:-cJCakggyPF2GB1PZHHdg_UeKiMaRjZQabuk7H-qECzAxU50MDbcOk-L-dLWcF-f9
    zxOz5jEOeaNY03hn0WzG60QgAwWtFxN5t10_t89vpRjiBzZ4dL2QsUt>
X-ME-Received: <xmr:-cJCagR3FCbpmtCKrv_N91UoPpfA--1g7WRJs7Q1qeqmtuHzNAoldd2rAZPwYtpUWr8-slnJev-MhJCARqyU7JiTsuzRDhAIT3k-pvzRUPmy>
X-ME-Proxy-Cause: dmFkZTGXvIsyffE7chGwmycNvwvWzCSq3ManVwnCKQTgDIfK3cMW89YA7frhkBGcfv0E99
    ZFPK49//pSdGwxc9ljsbjUJ4LGD6TquMBY+5rzbZEb1rLKaSyAoBnmKyeApl9jNs4PsyeJ
    htCNHOu+SVuPcg/WWfM7fQzy8n7iDeKIeyFnX9rKMYu+RzxIpafOYL0zKR1hNfVXIqIn/B
    9mt3S5Y4pteZo/JYMWaxF5LF+ee2Y5uUtPFnS+sonaZVT6syC6vS8jrktYOt3KnV8PgvmP
    5nWQOMZ/QL4q5HPC5PJ6mvlntIwCbt8mtkENpwo6crm5tVe1coCgqis5RWAONZWQMIxwQt
    vC3qh7kZksqcc7ais2rD0PLmoIEfFcsHSaHz9G6AkZEaOY3XB5cyDfnSidGw7/vELWlL3P
    dcCRHRR/kuTBhgpYUJa3v/Uqdvo1lX8rNLstFY3rrpsLer/CExyRnXi83atOb8CAu0HvfI
    hNjYOthD1g5ik1jSNLM+kWdtRvcvnBhi+0/EWQPzemsrX7qH2/l6mw0E31gsxYlm5txSs2
    YQe/RTv23vsy6rLkkpT3NR1mKLNWi2+QJIm6kTz3jMYd2+KxZGkB3Ds72V+a9drS9m3siB
    G7iKttWAxxY7eupAlWohht26d97dMKfgYNxct7TrTMrglBN+zd+GRo1xVWRw
X-ME-Proxy: <xmx:-cJCaljIHrKgbeOlPAD8uuwVGKLXugX_ACVu53eH5KFAtRew2kIRWQ>
    <xmx:-cJCag7Zm-oA5WetGGxKdq0MArrxiw0_2czce1JIE3Ozy4iE6TmLHg>
    <xmx:-cJCaiCA1zBDhj7f_YhQu15Zrjq2xYv4YpHXFg0Ev7tXgehNt81rlQ>
    <xmx:-cJCanZXMbQVKJ4rRahlt5dfhgPb1sV8eW2aTpejXYTsbP6v5OpkSg>
    <xmx:-sJCaire02WZzV1Q6ik8QiZPHTT4aaHHHovatmRDlf7aMo2kJ2V_KwT7>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Jun 2026 15:09:45 -0400 (EDT)
Message-ID: <0426063dfeb7ea258ec2329c489e4ba6310a0ee9.camel@pbarker.dev>
Subject: Re: [scarthgap][PATCH v2] cve-update-nvd2-native: allow setting
 resultsPerPage
From: Paul Barker <paul@pbarker.dev>
To: Awais B <awais.belal@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Date: Mon, 29 Jun 2026 20:09:39 +0100
In-Reply-To: <20260625132534.3979958-1-awais.belal@gmail.com>
References: <20260625132534.3979958-1-awais.belal@gmail.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-8T/lGCnWxe5UnejWRTx/"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 19:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239822


--=-8T/lGCnWxe5UnejWRTx/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, thanks for the patch!

On Thu, 2026-06-25 at 18:25 +0500, Awais B wrote:
> It is seen that during bulk updates on the NVD side the server
> struggles to keep up with the default/max of 2000 entries per
> page and we see a lot of incomplete read errors resulting in
> proper db sync failures most of the times. Lowering the per
> page value noticably increases the reliability of the process
> and hence should ideally be configurable.
>=20
> Signed-off-by: Awais B <awais.belal@gmail.com>
> ---
>  meta/recipes-core/meta/cve-update-nvd2-native.bb | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/reci=
pes-core/meta/cve-update-nvd2-native.bb
> index 945bd1d927..731cbb5d88 100644
> --- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
> +++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> @@ -34,6 +34,10 @@ CVE_DB_INCR_UPDATE_AGE_THRES ?=3D "10368000"
>  # Number of attempts for each http query to nvd server before giving up
>  CVE_DB_UPDATE_ATTEMPTS ?=3D "5"
> =20
> +# Maximum number of CVE records per API response.
> +# Lowering this value can help avoid incomplete read errors during bulk =
NVD updates.
> +CVE_DB_RESULTS_PER_PAGE ?=3D ""

It'd be good to document the max value in the comment here so users can
easily spot it.

> +
>  CVE_CHECK_DB_DLDIR_FILE ?=3D "${DL_DIR}/CVE_CHECK/${CVE_CHECK_DB_FILENAM=
E}"
>  CVE_CHECK_DB_DLDIR_LOCK ?=3D "${CVE_CHECK_DB_DLDIR_FILE}.lock"
>  CVE_CHECK_DB_TEMP_FILE ?=3D "${CVE_CHECK_DB_FILE}.tmp"
> @@ -217,6 +221,15 @@ def update_db_file(db_tmp_file, d, database_time):
>          api_key =3D d.getVar("NVDCVE_API_KEY") or None
>          attempts =3D int(d.getVar("CVE_DB_UPDATE_ATTEMPTS"))
> =20
> +        results_per_page =3D d.getVar("CVE_DB_RESULTS_PER_PAGE")
> +        RESULTS_PER_PAGE_MAX =3D 2000 # imposed by NVD
> +        if results_per_page:
> +            results_per_page =3D int(results_per_page)
> +            if results_per_page > RESULTS_PER_PAGE_MAX:
> +                bb.warn("CVE_DB_RESULTS_PER_PAGE exceeds maximum of %d, =
capping" % RESULTS_PER_PAGE_MAX)
> +                results_per_page =3D RESULTS_PER_PAGE_MAX
> +            req_args['resultsPerPage'] =3D results_per_page
> +

This code can raise ValueError if CVE_DB_RESULTS_PER_PAGE is not
convertible to an integer. That should be handled.

Best regards,

--=20
Paul Barker


--=-8T/lGCnWxe5UnejWRTx/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCakLC8xEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bll/AQDlcsP0AskSqM3rGZRj1eC+BkvwVSH9D6kY
SIpZ0PzD9wEAvOQeZQQEsUBEjzsOYVhbciI8R/r8Cab2qedGRWbPFw8=
=9bse
-----END PGP SIGNATURE-----

--=-8T/lGCnWxe5UnejWRTx/--

