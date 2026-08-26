Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8629CC61DC2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 09:11:31 +0000 (UTC)
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8567.1787735488589740041
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 02:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=Dd5kLqaI;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=A3+iIMem;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.145, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 9F85D1D00037;
	Wed, 26 Aug 2026 05:11:27 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 26 Aug 2026 05:11:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787735487;
	 x=1787821887; bh=vfNvhuC3rkSB2h5fssCStObTTkxChwHpfAhADrLdFdM=; b=
	Dd5kLqaIo3/E0Qg6wr8hASzq5YwUpMFeVz0s4Fp8IfQ2s8bfJKP3rDNFdYWYsc8e
	+0fXHH3kyp97OkaNmaFhmJwHp0QYwXT02KlOX2XHQ2/CkuHCYstfX10TNcWkXJMT
	XCkk7htm0ii4NtuCO8jobqLVZZx7ir5GA9aFzMjfO9N/ixSVKy+jLrY6AzCfORxI
	N4tKGTu1e2sbsUlhAzDwgFuQfft2IlkLW4eyaeLR32fHv5t2WfwtaVQ4ewMlKrHB
	cT1wbKGuKc/GKBLREBAGRX8O68DrzbzjOYaNsazQSPLe3E0r7i/8zRa1HGAo/tnP
	sPtfPwrPqUlLZVibzAazTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787735487; x=
	1787821887; bh=vfNvhuC3rkSB2h5fssCStObTTkxChwHpfAhADrLdFdM=; b=A
	3+iIMem1RFF9UUbDyJpP0mtm4c3TlyTeWaA367XHXOs0QthCYgl0NoHEpq6jJmgd
	Ym+MzA0/Cyc42w0x/jXDU/ew0rHrhqaZVk8Qs21sYwayvUjMlZoct3oi6GIqw1Cy
	nDXngWRRltbuELDjpfaKgQTMMmmn69tLS+n3EgsmZzeN32nAuvgGVneWmWvAuM+g
	QsVz1hLUJ2NkqZyrBE93Ou7pYLnxj9fbxiOU6yABff/RRaKY+nz9yQHYjhf9Rlq5
	U1GgoieKo2GQuH5Huzdpc/PGx1nP8cV3UnrGLu0NgPkwMjWqp7kCJu9A/ER2EslP
	oBnVQ1BudDnrC7cNrzwaQ==
X-ME-Sender: <xms:v62Oalz4t_bs-n9tBwgW6e2hFBuMBBZr4DB4KBLODbgMxpWtYAIDUA>
    <xme:v62OasteGcRa3fMdbA3bdsj9s5RJAp96_XvsX355UgaUNXuQYj3lyJxvgFuiOenah
    3HuN9Rt6IXqMl7kCzZRmisvZGmIxVMAVaKLRB0leBTPXxWO9aHtDV4>
X-ME-Received: <xmr:v62OasvGmetHDxt_4bEK1bjLb3bK2D1WFnU8UxW_wiGnYf782qA63unV0Q37RC82X0a0dg6RjRpqbrJy8sbN0v2TOKQMIV-CYFbUPKrLvuXL>
X-ME-Proxy-Cause: dmFkZTFR5Cqdc+YVZ61v8HlySdK9YlXjQmKl76y4D1KCIn3hSh0qI2c1eazp1Q6+DoqSpw
    wYHRLJjHuBdl3X6GHb5oiyuGJbwTrqQjpk33Oyd8HxJ7vwj5Qrm3c3UZHiKN5uNK+/76VJ
    Q5FFbPWth787H5tIvD2ATJY2NWoqQQIb8IrP6dd+jB6CZTDRCe6Px7KESI7NI/SpF8qvN8
    YuZMpIgLoGtiH9L4Lc9uNvGB0KjDeqlmN+m9HnAHrdtK6HXx+MinqOnIEyCkDqalPLGnor
    JInwREju4+lyo15MScGLLdcGqK3ABPogfF6pTuIdti+Xi9Xc5z4MME84bHoLdbWpiVpVoH
    UN2bFwLFuN+QQf+Z9hcAywi9DcQSs7n19jkX26zN75M5T4lJxs66BmwKDy0Tf4J3kLxsUz
    /L9pzLIOoiVU+osecu136mUkO7mOl3e+i2f1fz9MGJlk2cmhBk1e4wLaMefUaK5dsZo+64
    ENXvQQ+d8PDQ5GzlPwqRUvsrlXUk9TAPMSxfzslZgdOsG5FjkEhzDxrTdNHTKFTs3uUa3M
    yxQOltqGjKNh6vi+3EMMSUa3ESLWjhPE+5btdHRwtNSv6ekahuHmC1WFUY26MAMkl2Pe5+
    //DZD4FRy3TOh3GMgBG3fp7wcp1qatnpfEFHNVv2hk/Hzl5nkjcRvVFp7/XA
X-ME-Proxy: <xmx:v62OahOKAq80t9ZOJqzbQiYPIkFK7oEtBerwJ3auTmvI4BeIkRLzvg>
    <xmx:v62Oaq1XB_rFh4sja_TDb8p_ljckxC58E6mTpa65wXqISK-XEQk_9Q>
    <xmx:v62OatND8_GF4JDuz38hGRBFYexmmTtjamzxXCzrYeumPuLusd7Pjw>
    <xmx:v62Oaq182oE6IFv8u9syTzjJYXWu70b1iYTGidbMeQpW8LxPYazBLg>
    <xmx:v62Oau3t2LpdRUIUufscsezrXJAtPpyEVNHLiqVhpQ57AvB5iSKPWFIO>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Aug 2026 05:11:26 -0400 (EDT)
Message-ID: <42d681ade464ef72a7b693bb67a02b4907551cbd.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH] expat: correct CVE_PRODUCT mapping
From: Paul Barker <paul@pbarker.dev>
To: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	 <devanshp@cisco.com>, openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Date: Wed, 26 Aug 2026 10:11:25 +0100
In-Reply-To: <20260824110156.25775-1-devanshp@cisco.com>
References: <20260824110156.25775-1-devanshp@cisco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 09:11:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244388

On Mon, 2026-08-24 at 04:01 -0700, Devansh Patel -X (devanshp - E
INFOCHIPS PRIVATE LIMITED at Cisco) wrote:
> From: Devansh Patel <devanshp@cisco.com>
>=20
> The current product-only mapping generates vendor-wildcard CPEs, while
> the old libexpat:expat dictionary entries are deprecated.
> libexpat_project:libexpat is the active NVD dictionary CPE and
> configuration identity, and is also used by CNA affected-data records
> for the packaged libexpat source.
>=20
> This changes the generated product identity. With the frozen
> sbom-cve-check database, the 63-entry CVE report is unchanged, so this is
> an identity correction with no CVE delta.
>=20
> Signed-off-by: Devansh Patel <devanshp@cisco.com>
> ---
>  meta/recipes-core/expat/expat_2.8.3.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/expat/expat_2.8.3.bb b/meta/recipes-core/e=
xpat/expat_2.8.3.bb
> index 79e8c15227..e431792826 100644
> --- a/meta/recipes-core/expat/expat_2.8.3.bb
> +++ b/meta/recipes-core/expat/expat_2.8.3.bb
> @@ -30,4 +30,4 @@ do_install_ptest:class-target() {
> =20
>  BBCLASSEXTEND +=3D "native nativesdk"
> =20
> -CVE_PRODUCT =3D "expat libexpat"
> +CVE_PRODUCT =3D "libexpat_project:libexpat"

Hi,

This change would exclude CVEs that actually do apply to expat, such as
CVE-2026-76641 which has CPE libexpat:libexpat in the MITRE database
(most easily seen in the json representation [1]). I don't think it is
correct.

What was the motivation to change this CVE_PRODUCT assignment?

[1]: https://cveawg.mitre.org/api/cve/CVE-2026-76641

Best regards,

--=20
Paul Barker


