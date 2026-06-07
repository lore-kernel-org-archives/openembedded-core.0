Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E78BFCD8C8C
	for <webhook@archiver.kernel.org>; Sun,  7 Jun 2026 10:26:46 +0000 (UTC)
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31393.1780828005392624110
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Jun 2026 03:26:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=2dDNgwb9;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=byvI+Wat;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.156, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1AD127A0081;
	Sun,  7 Jun 2026 06:26:44 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sun, 07 Jun 2026 06:26:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1780828003; x=1780914403; bh=VDhrS4xH+F
	DELASMWeL7tQRZYTktwg7xvjosGMn7Ol0=; b=2dDNgwb9Sb59zgsFZ1O9THroYs
	W3bywAHYXZHmra4s/zs+RwYxIz6IYAr1Roee68Ue1qLg00ipyjW121pjnYp0xHZt
	SifyQweS3CpYVpy1rfrDe7Rv0aum2CpAm3tyIaoTCd2UCzWXJe/lGVVE1yQ4nWPK
	8p+oojqK5Hf9R8Kv/dYsVqjEuyXutXfTw/RlTsemDsMlA8UQI6aef6jisZ3hGFjq
	+xteJPsPoiOYzIpzymYKLafnL2Sl1RlaKd+r9h3CAcxigw8kO9cm618Jkg1tymPr
	Ac5P0Lapz1cFC9QiY0hJpsn9Z5KW1S8WIMRoQbHSjjf2IIIVDvctMdVNxlKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1780828003; x=1780914403; bh=VDhrS4xH+FDELASMWeL7tQRZYTktwg7xvjo
	sGMn7Ol0=; b=byvI+WatNM2Gs91vML9CGqbRGZivxKb/zxS9R3z7WIhePlY37hR
	iDVOMMspm3AvJ+VstMiSaAd6CTvgysfYENZ09kcKKR9H3YDwZ2nNACc3TKk+Bh3h
	4iisbIwwPlqmXkTMXtf7qJZ+SgiWX96XNeGQgYx3zFX29J7NP50Q4nWLBkbbOr/8
	kGFFbLWyL2qsPjLDqwlKroHSLODpuKzbTwG/ELZx8V081ctOsYmxWLjlHCpW7kJ/
	dqiaVWDJewtngUo9+pWdFCuwB/4+B+Y/Jy/a7Ur0wKnlUbehcBoR1poSqRLE/QVK
	7dsHHd7z8C8G2oHvWarrGNrBnskYqb5GI1A==
X-ME-Sender: <xms:Y0clag1uQMhLhLtaiy4kt3jyi0Y2oGegJR8GNcb63uH-y-ixda8kOw>
    <xme:Y0clahEp3rjJVBXW2WUkFgpq9MuIcccYjlGT0hZ84jQJflUL4gnNrbA7GtPysacSj
    cUxuGId5IGPg9g6TpvdnIvHYNQYBYQ_YT8ZU4jxvcrkTi7k85N5xrM>
X-ME-Received: <xmr:Y0clami4cR1FUj9SW97n09tV4hfBK6gvJ4YeuwJ6hdYJ7cXlK9519X8XdmAsdQGJK8eKhUTN0FTUAuJ4pRRTqH2wfGrRVFrNqiLYoFdMW6_8FLlshcuVpxhOIyaai5J8>
X-ME-Proxy-Cause: dmFkZTEzLMimJKAvmm+C63HsiKrqZIgScS+uizKzfqL2Vxf6tVREMuKthuCwT8vCSz5uYk
    JKaQHiOs8csd9qNTUh3kBn/1dVPIbCp6voEyPbeKnUjNQnKrk7s7NoEySAsP+IgX6ngmd2
    Rn+iglU9gm6yThuMmULDxS950G2IHJRb3OdT93+WW6eqc+hd9eAdOXl12TjrIzh8fg2aRj
    IHGgELbPsmK+T2rQ1Wqy9rrYS2W+nfGxHYltmZ6qR53UmB7318B7apcM1ISfriuuJbvlch
    G53rVhrf21d+flIXRm/jE7BCL9uljmUPOSIIhjOPdV3Sr/FWKoJzwM+iVOAf+cCf3SGyf5
    CJyfxRTLZdsX2dUaiyShH/Xva0fkBhwtcRmgiKJeYwNy3C0ikP4ihdLfnsEuX4cMqXNXJh
    aHUXrLzFikRxUhNIe1FYWLMscrpM3HqWyenXGnlNLnMRpcJfsD7T8KFd6FsGij4flukiHC
    tvQb4hmuFRvXgC08AiboRro/fAPyAII9tBQiGvej9wD9FkNrb6OO56wNPw7pzR5daPrzhL
    JbGAdbCkxMVV4/H5qMWgscBo57+1E3FyhYrqHFiTK7gjqm9v2ZHoa48BBWyhI7mh6coR5y
    bWjsOMM8gKt30JCW7d1iAtOoOd3meUmu20zskh8yo2bT4V5BCVdtNrUGFaJw
X-ME-Proxy: <xmx:Y0clak890wzMYjJnlSvglqETN5obDi1T-X6fFMWmQG2WJ5Gty8_6Lw>
    <xmx:Y0clalqSoC_95Mf8Sy1JPIgrKw4FP_NQ5ucD1qh-5kUYeLDPrg1THg>
    <xmx:Y0clar8Xax8OWJz16u3_7e5Ty42Fl8C0vQL9xo19h3fyOjKsE6VjsQ>
    <xmx:Y0clahVpl_mGUBbBnj_LG1E0dMJ5EqWCVV08KxclHP4MBDEI4nSdWQ>
    <xmx:Y0clahd2JU0Zm1EiQmGrDcHQBuCBaAuv8VDsQmObZRplPy3kem4aGy-b>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 7 Jun 2026 06:26:43 -0400 (EDT)
Message-ID: <b2edbe057c6569a2260c5dc4ae4d8b8199c57f83.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH v2] vim-tiny: bugfix lack of defaults.vim
From: Paul Barker <paul@pbarker.dev>
To: zhengrq.fnst@fujitsu.com, openembedded-core@lists.openembedded.org
Date: Sun, 07 Jun 2026 11:26:38 +0100
In-Reply-To: <20260605100736.13413-1-zhengrq.fnst@fujitsu.com>
References: <20260605100736.13413-1-zhengrq.fnst@fujitsu.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-4DwFh4/oxVOBmW+udIpn"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Jun 2026 10:26:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238223


--=-4DwFh4/oxVOBmW+udIpn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-06-05 at 18:07 +0800, zhengruoqin via
lists.openembedded.org wrote:
> When vim-tiny was used in image, it lacks defaults.vim file which will ca=
use following error
> root@qemux86-64:~# vi
> E1187: Failed to source defaults.vim
> Press ENTER or type command to continue
>=20
> So add a new patch to fix this issue.
>=20
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
> ---
>  ...e_defaults-when-Vim-is-invoked-as-vi.patch | 61 +++++++++++++++++++
>  meta/recipes-support/vim/vim.inc              |  3 +
>  2 files changed, 64 insertions(+)
>  create mode 100644 meta/recipes-support/vim/files/0001-skip-source_defau=
lts-when-Vim-is-invoked-as-vi.patch
>=20
> diff --git a/meta/recipes-support/vim/files/0001-skip-source_defaults-whe=
n-Vim-is-invoked-as-vi.patch b/meta/recipes-support/vim/files/0001-skip-sou=
rce_defaults-when-Vim-is-invoked-as-vi.patch
> new file mode 100644
> index 0000000000..7e7bfe0a6d
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/0001-skip-source_defaults-when-Vim-i=
s-invoked-as-vi.patch
> @@ -0,0 +1,61 @@
> +From 7dad45f751d4adbee480005a5546b32a97fdbfb2 Mon Sep 17 00:00:00 2001
> +From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
> +Date: Fri, 5 Jun 2026 09:34:18 +0000
> +Subject:[PATCH] Skip sourcing defaults.vim when Vim is invoked as
> + vi
> +
> +This is used only in the vim-tiny package to skip "source_defaults" erro=
r
> + E1187: Failed to source defaults.vim
> +Press ENTER or type command to continue
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>

Why not directly import the Debian patch? You can find it at
  https://salsa.debian.org/vim-team/vim/-/blob/debian/sid/debian/patches/de=
bian/Support-sourcing-a-vimrc.tiny-when-Vim-is-invoked-as-vi.patch?ref_type=
=3Dheads

Best regards,

--=20
Paul Barker


--=-4DwFh4/oxVOBmW+udIpn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaiVHXhEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bhqHAQDFMY6vNcaTlhRHK8dP4UBtwMsgLGrK2cBA
wxLyZg1y9wEAyIrb5cLdR84ivF8Bz3GtUQ0Byc3mETXqtpjcDIEAqQQ=
=+Auh
-----END PGP SIGNATURE-----

--=-4DwFh4/oxVOBmW+udIpn--

