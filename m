Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC367C43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 13:29:23 +0000 (UTC)
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.69210.1782998953724468873
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 06:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=cFqcFJhB;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=BtNoqACq;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.149, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 9BD3CEC022A;
	Thu,  2 Jul 2026 09:29:12 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 02 Jul 2026 09:29:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1782998952; x=1783085352; bh=3JOKCPrH90
	5du7RVSp6N30nNRAXn85uUecAo8VNCxO8=; b=cFqcFJhB6doIeK8DlcQmaPI/6x
	07Q5N1hwXC7qFVPlnrM0cvb0jjCYlRzqvrOQBmFe3w36sgnNxmMeujkPg7VfcWXV
	tDdsTE7ixQFNQlDPWQ0DXfEZoa6S5PRiTT/CYeUh/b/HidUIQjWnZKecPxZutfFi
	ZS0Mp7S1w8DlqmUgMhR6VPGAKk/CBE6KtF7mpGmEh32uTL6vrGi6nWnfPMNhK/Q1
	rxxc0FSBbaNiMFGRXA1HTQaW+zblLaQdsFhrUOZc2zI+jbNkRU/Q1O0cELkRzTwV
	fXvrN37TXGZ26fMYQW69LKMGuIYzgfDO12lzTHXooCz/4725G3NLG9clqpWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1782998952; x=1783085352; bh=3JOKCPrH905du7RVSp6N30nNRAXn85uUecA
	o8VNCxO8=; b=BtNoqACqt+9cx3UeouIUm3sm+ZYEwU+ZNJSb6ulMl+72tfvXANQ
	p2vByzOMQNwoQ3JBgU62HohZxE/iSYDZuVZ8k5Q4qpFzganqdep2X0lO47myRlI8
	+GZY0dQrIpd61DGdTthjyXeka6cRR3Y1IDMbiH0JeDzfadCQI6QjswibqBBy9sQE
	GibIRwlNynCdZTmZJ2dve+awrqMoHiW1wLQIe3Y5ap68b5/pptYCX9x0qjJypuwV
	J5i+Rhb0At9xj6VZuuJVq4rer+Qyws0c9tj6W34cadoqLwGXS3NvLyvyxE0DMVJa
	YxrxBNTtTcOVpqS2ztu6EXrUpzqazjlTTlA==
X-ME-Sender: <xms:qGdGaifMucxvND5-ZeV-yRNGqLIgMMy_fleKpMNnrBSH9w4Yf_Kwmw>
    <xme:qGdGaiOWDvd0jYVy5Br17Tn0MkF6lgTUKpI5ZVC5QfuH7uFXxs8_L4klgi5MLfrWk
    HRppTKQJ2hiXkEtwYuBGP57kwXyyfdZe2OA__CqR-enJ0a0JJDlKu0>
X-ME-Received: <xmr:qGdGahJVpkIgYd_vTGnCJH8OG4sZgkkkCZNcanccmgyTOwiLtl_e0Nqp8Al1f9sc7KA_uKQQWhId_TCLYqbPFDEdzCfiHRncg3YUQay_SXDH>
X-ME-Proxy-Cause: dmFkZTGKgDVdfrguQjgCgD9IHYoe2FYvzj+fXJc95v4WkT2qCG8MtaxIZ0MRxOL9Dr7RDH
    jl/z+imn7EBtjnF+KivBCR5f6DXWookGj+ziR9Jk01Wx9+kYdJohl83MwhiRJ88V/I5ZwN
    u/QH2+fqr8NJHM7PSXXCp6vldvxxrH9lI3ffUXG7+GbRR9vysylUzC18URBac7jcSSLdf1
    sEofUMAIuhviFu6hgUBB11hter45guPMmh815S57Bk89BCJOG1IGGxwr+87mTx0rRhr9Ss
    0NxKL+A5DOJe15cGsLKzJwtDsZhAv92wYbNeOiNcYcyeHyAXBehjNNr/OB9bDfzcueNihY
    pj5aszDZX+d38aRHjqCl/QVSM+Ed4h1nHfGRcogbqPkeJ00SAM+qrz02UcHYgsY515nymY
    BHYSt3tZ6bOi+bBiC5oeftqu2fQuNdPGlTCoLfGMEB6mDYUOdD9v1LPd0P7RrqzfJ3G0K4
    uvsf4D+4joaEzyfG0mOluDygCRAobW8kReehJ5oPn+Pi5g9rTOUcUmCA+ivgI5oHkrQtnm
    toOqr7pJPAaZr/Uwd3Ep1Tab96vhsrWeSux3OJ3Bssttxs/Vs1akuNGbgjiqrAvsI4vnXi
    R8WmnuMeol79jUMkgIwbQMTa0JiAFN1mYNIp3EMQScvBxmYbhyEofELXm+XQ
X-ME-Proxy: <xmx:qGdGarGtsgE1ElISulMLBehXNNvSF3IZNYDPpmtZVoj-7vwMblgcMg>
    <xmx:qGdGahR4E8iQ5nXjjvqfJs6ftQRF9IZfx70_tAebYQ9P3GAITjXNJw>
    <xmx:qGdGavEDNFZSfZDPTZXCEG7P5dW1Fdazu7rmA_fwc3onBOCOphQy8Q>
    <xmx:qGdGal_mcOtu1kQpmtbO9Y2lyZElbIwKi-YjWBN40hAjzErDIH2yog>
    <xmx:qGdGasGvR1YXTQtjB9rRrTAk0QMb3QGGuAh6DOz4oAfDC7bdJR2E0KSr>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Jul 2026 09:29:11 -0400 (EDT)
Message-ID: <a12a5df376af88c24d747bb106a03d0ceff01542.camel@pbarker.dev>
Subject: Re: [PATCH] perf: Fix BUILD_BPF_SKEL PACKAGECONFIG to not define
 variable when disabled
From: Paul Barker <paul@pbarker.dev>
To: Jaipaul Cheernam <jaipaul.cheernam@est.tech>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 02 Jul 2026 14:29:06 +0100
In-Reply-To: <20260629130515.39891-1-jaipaul.cheernam@est.tech>
References: <20260629130515.39891-1-jaipaul.cheernam@est.tech>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-aNlS6DSIl2K865sLw27a"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 13:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240050


--=-aNlS6DSIl2K865sLw27a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-06-29 at 15:05 +0200, Jaipaul Cheernam wrote:
> The kernel's Makefile.config has two BUILD_BPF_SKEL checks:
> - Line 219: ifeq ($(BUILD_BPF_SKEL),1) - value check (works with =3D0)
> - Line 668: ifdef BUILD_BPF_SKEL - defined check (triggers for ANY value)
>=20
> The previous fix (f48f6fb91c) passed BUILD_BPF_SKEL=3D0 which correctly
> skips the first check but still triggers the second 'ifdef' check,
> causing a build failure when clang is not available or too old.
>=20
> Change from:
>   PACKAGECONFIG[bpf-skel] =3D ",BUILD_BPF_SKEL=3D0"
> To:
>   PACKAGECONFIG[bpf-skel] =3D "BUILD_BPF_SKEL=3D1,"
>=20
> When bpf-skel is not in PACKAGECONFIG (the default), nothing is
> passed to make and BUILD_BPF_SKEL remains undefined, which correctly
> skips both checks. When enabled, BUILD_BPF_SKEL=3D1 is passed.
>=20
> Also move the PACKAGECONFIG entry to be grouped with the other
> PACKAGECONFIG options for consistency.
>=20
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

Hi Jaipaul,

Based on the line numbers and conditionals you've put in the commit
message, I assume you're trying to build perf with a kernel source tree
that doesn't contain commit 9925495d96ef ("perf build: Default
BUILD_BPF_SKEL, warn/disable for missing deps") [1], i.e. before Linux
6.10.

[1]: https://git.kernel.org/torvalds/c/9925495d96efc14d885ba66c5696f664fe0e=
663c

The bpf-skel PACKAGECONFIG handling in master/wrynose appears to be
correct for kernel versions 6.10 and later. Unfortunately, there's no
single check that will work across all kernel versions:

- With Linux 6.9 & earlier,
     BUILD_BPF_SKEL=3D1       -> enabled
     BUILD_BPF_SKEL=3D0       -> enabled
     BUILD_BPF_SKEL undef   -> disabled

- With Linux 6.10 & later,
     BUILD_BPF_SKEL=3D1       -> enabled
     BUILD_BPF_SKEL=3D0       -> disabled
     BUILD_BPF_SKEL undef   -> enabled

I can't see any value that consistently disables that across all kernel
versions :(

So, you'll need to handle this appropriately depending on your kernel
version.

Best regards,

--=20
Paul Barker


--=-aNlS6DSIl2K865sLw27a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCakZnohEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0biOqAQCzDRFo8oHNhCsZeFxIYPaiSX8a4DExhlHu
DJ1uYGlOQQD/YgZeuXbjX68+kSl6qxhOsGFqK8ki9dGtqSN/Xy36TgE=
=8UP3
-----END PGP SIGNATURE-----

--=-aNlS6DSIl2K865sLw27a--

