Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADFBEC61DC7
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 09:02:21 +0000 (UTC)
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8279.1787734939740080246
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 02:02:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=e/J7nzmD;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=P21uJ+1D;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.152, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id CB3EA7A0168;
	Wed, 26 Aug 2026 05:02:18 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 26 Aug 2026 05:02:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787734938;
	 x=1787821338; bh=uVwiY1kEKT+OJivnopzsCFfe3GghmtKGbTux11yTpUM=; b=
	e/J7nzmDu0xjaplkzwKu+NHzR8eeZiLymhnrUCBi6+KNW0ggiVu2MrGZqTIO99Fj
	RmMdSHJ0HyqLnlzWM492GcE4jv8CFb+ydr5CJr+evS7t2OSe0JgQAixp+BU566Jf
	gSpM4x23/2pZ6ncebxPw8+MTeTl6eJ8Nn4Zt5Z3pQiIx5eZle1PveoI5qwB2B9Wn
	gJKYefRCcALyh/Qr+4KDNVAeQ5h5S1uSzyxadwUNPd3PLbO13ZmAGU8jSp4QU33s
	BM+wh3nURXQWHzRR6uyZvQaEFmTyfSARH4m1ZjvgzaPuYCPQdzW2z2EU3czW9eKa
	74zox9kD5UO9LdkeWIha7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787734938; x=
	1787821338; bh=uVwiY1kEKT+OJivnopzsCFfe3GghmtKGbTux11yTpUM=; b=P
	21uJ+1D+1FQhF00GPQKx/7YYbmHqh8e+VHeQatu/E+eJa+cjSf9ropnBtesLXr0r
	fLzDxyKs8kIIWu5B+MNqujCcORsFREiawdmF6m8w9zTmweCbZO0z8uAP5QhEwhco
	3nJp3DWI94xtda/pJfv+JP+BESP7Yw9cYYN75Y23ZYwnRf43T2tUzaG5qzUV1ahS
	W8LEkvCxNqhRfb6vCv8vaWh6idUui38X8LVJ2X0XQaAAEvuCyLG0o1U8COAr2o54
	ZYXwhdWC+t2ORmwBD4hVrh5QErQpGB2pdmrN985J8r5a7bpdY7k1gCWK6gqFJNdx
	Z/IvqCiNHVlEPzN7z5Tww==
X-ME-Sender: <xms:mquOaqCU-MUo5kzxgnYK1qUCw_8BJbkgSytzMrLSy-HJPKDrEqgk4g>
    <xme:mquOar__sBVN2N0i8id_8ErYUPDpYwMEPSD4DMslGr0llxASmAJTFvaEH4z8msAZK
    Kmd92kzjJ3TGh-OnScoBj1B6Ug--K8oxbgO-Xtx7idW3Bx0Z8Ac3g>
X-ME-Received: <xmr:mquOaq-GtNzQvH502Tygn0s_m1BHdieaVv-HGj7myEdOPlic3CwF8qv8Dc1dFjT-1MGu56dB43xjFuXaxRAv1vo0AnalIG8HI4bW0OeVFatR>
X-ME-Proxy-Cause: dmFkZTEProjBtgX8+xRW9orAwXv9SBgbut3OOYJlY9FdBn5sG314De2Xh0gEOm8vna1gSe
    EYrskTN3QNo9wSEK1lw6E8KWbVy+fPGWgsmxZerJx5NDRUypz0uZkruDCOYj8A1Uvzw7K9
    zP1JpPTzFp4RQqkvKqnpT7T+NIbi0+U7AYgFi5VCmILj9l+ckR6CIa8059fW6WTHXSXYIO
    ePTAp30L2F/L8O5aXCjuPLUa8avD84/qVmRw26bDC1Rscdr9oLXVz8uczEB73q3JR1Mdo9
    G1EJpP13KBICAXIh0M/IpWQ7AdwLGmHpR40eSClo3KIPI+FvglEm72vBwSXzHxZ6mIQvGb
    mjAnAWracW/LiUg7MQtrBtUJxsSZSeX9qtWp8f8v98YI3/zTI2Ua4Wn0aAImmqh8wbzSPW
    gWwrVdQV87oeuZ+1atkMauvVBuY4qSiLj5A4eDHUTQSxjLVUejMw9I4Ezcul1XkRp3/Neo
    hykP04XMDx2yWEzVT2RsaOAfiB9qaY9m5yu46NgdGaJRQP8c/0mwiccDlI1qgv2Z/FvYFs
    uLPZ/4KXSPjfFMZJfsBimvSWELruzf//Q+t+EEn28CmMDEz6s5nu5JGrHCSZAgW8/Mnrca
    72omfXttEWMdyjFXFDr1XpCPvHTSn20EusrXlMNldZVg22zNNdmCwrfmTe/Q
X-ME-Proxy: <xmx:mquOaicW_f2GVY1GuF9ySxVbUB6dS5bB491QmKgidKeJUeoUWwn3vw>
    <xmx:mquOajH0_i4YE56reMzIJlO9rjTsaNRjBNIlpV27i-qkHWV7dRE3rg>
    <xmx:mquOageAr7ctNCaqOY8UjPJcicduSCL5menev9z2ttf6TCWLh7iB7Q>
    <xmx:mquOatHWBmmJcs335nFDMy9n6bcUIDQdZk1-j7xevR300IvjyMwpCg>
    <xmx:mquOaoFC3lUNEYqYN9iPORetLCS-55we9SsGFRSmyPWj1o0bngxjyDJc>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Aug 2026 05:02:17 -0400 (EDT)
Message-ID: <82653ab103f8116bfb0a9a675cf9d7f38a92a588.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH] binutils: correct CVE_PRODUCT mapping
From: Paul Barker <paul@pbarker.dev>
To: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	 <devanshp@cisco.com>, openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Date: Wed, 26 Aug 2026 10:02:16 +0100
In-Reply-To: <20260824110156.25702-1-devanshp@cisco.com>
References: <20260824110156.25702-1-devanshp@cisco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 09:02:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244386

On Mon, 2026-08-24 at 04:01 -0700, Devansh Patel -X (devanshp - E
INFOCHIPS PRIVATE LIMITED at Cisco) wrote:
> From: Devansh Patel <devanshp@cisco.com>
>=20
> The current "binutils" mapping generates a vendor-wildcard product
> identity for the packaged GNU Binutils source.
>=20
> Use "gnu:binutils", which matches the active NVD dictionary CPE, NVD
> configuration criteria, and CNA affected data for the Sourceware project.
>=20
> This changes the generated identity from
> cpe:2.3:*:*:binutils:2.47:*:*:*:*:*:*:* to
> cpe:2.3:*:gnu:binutils:2.47:*:*:*:*:*:*:*, but sbom-cve-check 1.3.3
> with the frozen 2026-08-10 databases has no current CVE report delta.
>=20
> Signed-off-by: Devansh Patel <devanshp@cisco.com>
> ---
>  meta/recipes-devtools/binutils/binutils_2.47.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/binutils/binutils_2.47.bb b/meta/recip=
es-devtools/binutils/binutils_2.47.bb
> index 79bcac2025..798d886614 100644
> --- a/meta/recipes-devtools/binutils/binutils_2.47.bb
> +++ b/meta/recipes-devtools/binutils/binutils_2.47.bb
> @@ -1,6 +1,8 @@
>  require binutils.inc
>  require binutils-${PV}.inc
> =20
> +CVE_PRODUCT =3D "gnu:binutils"

Hi,

We have a default CVE_PRODUCT value so that we don't have to manually
maintain mappings in every recipe. Per-recipe CVE_PRODUCT assignments
are useful when the default mapping either misses CVEs or matches
unrelated CVEs.

In this case you say there is no CVE report delta between having this
CVE_PRODUCT assignment and not having it - so is there any reason it is
needed?

Best regards,

--=20
Paul Barker


