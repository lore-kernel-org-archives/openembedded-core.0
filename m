Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 044A1C982E1
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 08:26:23 +0000 (UTC)
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44425.1789979178062749549
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 01:26:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=inaIxAhR;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=NiNKdVTm;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1EC9D7A00DD;
	Mon, 21 Sep 2026 04:26:17 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 21 Sep 2026 04:26:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789979176;
	 x=1790065576; bh=FWTX6byTaZPV/ze0LjWfsXfopyJOF/zypoQ1Ng8wW3k=; b=
	inaIxAhRq0BWgFNlTXke4J01NYKOojNUKCTvIq/AmniZ6GwpqZeK6Pcx8c+D2AOv
	hKMwBNu+k26ek+S9/uU+81XbALU6PMeOb/QOh0e8iE+tKou3K2TNOUWQn69eGLsM
	MAPSO05RCOuaEUbQXBA9dtpYKW8RNjg6vAcQhdrqctIVvC6pQWJ0Q8/9zxMBGNom
	pk3uERqtNo7ORBBoY3DyO89Esv4f1V573E/rVmVtt6vnOLbHdfIXb/TRtNsYRZda
	Fbriz11WrM+54kr2GDm46C9S6VkAmh/7/wk47fAfWcZjdB9wOM6uYCGqrck0uXpA
	MUULELdFx0FzFMta7dOATQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789979176; x=1790065576; bh=F
	WTX6byTaZPV/ze0LjWfsXfopyJOF/zypoQ1Ng8wW3k=; b=NiNKdVTmG1V9aaH5/
	JV2HdLevwPD/OfduoR2/bH5/htMu5tzTGD3S1UnR1c9qjh5mJ+gs2aoL8qmmXPSJ
	OG9gduCNJTyrnUFEecusO5jM8W8a264mqKWMmHTJ14AJCOwXtGeXwt3A0CZID2fm
	2dfBG44r5irT0zTyMAGUBzy4OZjIAEdK4bX1YuhjKxA/wRu5GogN9+FQS8kKBFOY
	CRsCVbKRywW/lbn5SvPr63YY0narkT94reo1aklb5mAiKQzFTYe07eT24dwfH6QE
	d+RxSmXzAJJlJWnEVv5Aajd/+Hg01HhR/bCfo5YoEBgnN0cipaVgnG4sf5Skqj0f
	UwlSw==
X-ME-Sender: <xms:KOqwakEYsjMkm2ljm4cM0p-_sApRzKVT5V5lXJUg5BQQCOeJgByGTg>
    <xme:KOqwajVZHpeAykdGc3PHdlU1KT1t5naJd4Uy8EWi1-p2O8GBday4roHB6vbDuZcLr
    vlyog8xU6RNdg6302MO0-deKO4ryL1rIGQF5ObttzDMhrN9LUIcPvCl>
X-ME-Received: <xmr:KOqwaryPNgNqgmiPiCLYqlYDpqoeLnvc6ccAc6e1ZN3mfnpnJJAix6Z0xRWYnEgaYTMx>
X-ME-Proxy-Cause: dmFkZTEi6sOhkqqxIQ5FlgcQvGNY/pH+PT0/FnlKyH658MvT4SUM8kzz0XcOnq3qtvAbo9
    QINivxW4Sq40m7RTOlSpE/B9+yYE0gP2ufbEe34kUDtUl+NXqz/MyczgvKHysZ8XGi28YP
    UwW5G3DEU+n1wiMN1hnA1C73dXoifBU60qw/ByAnbcuqqQ8UsVNaeYflrSHikWC7G61sHk
    LO7h9WDdvF4xkDVcwPw477RG2S2pSV5fgGnTwPMhuvIdT6h16zaPG8MYjtI0M98S3y52q1
    j9Ajo0OxafSdbSMZmXTwzBNc4SmWjoQBVnaQQEim30eu38TGs2Z9pSkqgJsaidBAhI8Vo+
    i7s0Fs9ILTKSXDaL43mi60ltYNXYdR8YgwERBmzQVUdDgLAxV0wQWHF5fV4J3+L/OK2iLZ
    BLllOLa2YOSkMXhLoHR1Ixpu/fe3Uaulw23BI/cqzxib8gDBCS0H2yTc1H+iLRD1u0MLCV
    vLB5jiw75CLZWqTHcu+H5BUhn2mr3ag7xAmq1k3n1mhMS9PeY6yJk/jKz/bzSMTAT6reul
    e8VJ4sHAiiaMtLx6bpvRRQRH8hYrsDq6Xv6ta5wkEO7NMppO+YmmJ6Gg5yzKj2oABP+a+J
    tegklFcCf/nbO1nxAqd+M13bJeg0oER/cVyw4q7ME8bLoUIcJk5uXQgo/qwA
X-ME-Proxy: <xmx:KOqwahNkiBTSNXUtMbxo5GMpCkTP52ff1LLfSz0-WFOKkZTAiNyPQg>
    <xmx:KOqwas4rRu3qn-hToilSQLT2jIfA8O1apcCbJ9Ub1SYwHnAOLq0kOg>
    <xmx:KOqwaiOmu7VSmrTrMM0faWG3WaoFAV6bfe4b2lAzfXcuK9w3ZwJHJg>
    <xmx:KOqwaqnhAVaFI9DawH2-8wSQqUqe5Kt4hlJm5kQrv5IaH3uAhHoAaw>
    <xmx:KOqwatVZKJSL1PKaZPlJwZv9px-ftRGumt3Nc1RVRZN96NknLCAVnY_t>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Sep 2026 04:26:16 -0400 (EDT)
Message-ID: <af30a5dc9e588d52d44d73a1c1c00996976083f3.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH] oeqa/selftest: add fs-uuid.bbclass coverage
From: Paul Barker <paul@pbarker.dev>
To: Angel2Eyes <thefireking@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 21 Sep 2026 09:26:15 +0100
In-Reply-To: <20260919181900.443-1-thefireking@gmail.com>
References: <20260919181900.443-1-thefireking@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 08:26:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246310

On Sat, 2026-09-19 at 21:19 +0300, Angel2Eyes wrote:
> The class has had no tests since it was added. Load the live helpers
> and cover tune2fs UUID parsing, placeholder replacement used by
> syslinux/grub/systemd-boot, and a real ext image when e2fsprogs is
> present.
>=20
> [YOCTO #15020]
>=20
> AI-Generated: Cursor Grok 4.6

Hi,

Please review the existing test cases for an understanding of how we
typically do things in OE-core selftests. Mocking out the bitbake
datastore & bb module, reading a bbclass file in and calling
exec(compile()), etc are not things we usually do and require further
explanation for why they are needed.

As mentioned in the description of the bug [1], the way forward is
probably to move the functions from fs-uuid.bbclass into a Python module
under lib/oe. That should allow simpler testing as a second patch.

[1]: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15020

Best regards,

--=20
Paul Barker


