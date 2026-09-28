Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B53C9833F
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 10:56:47 +0000 (UTC)
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54735.1790592999977040356
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 03:56:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=tIubKSG8;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=WCTURZfJ;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.152, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id EBB6F7A00FB;
	Mon, 28 Sep 2026 06:56:38 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Mon, 28 Sep 2026 06:56:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1790592998;
	 x=1790679398; bh=vTNFzbQu22E1KClznUsf015RNjbxclADs/uVO4l1yco=; b=
	tIubKSG8swAhJTIUOhK5M6NgCItVlurMuJIFrhkCdXPXb89At6a8VTpk4WKG9mWm
	pZ/H4ou4b3bLkxo4SSQ3ifS5arkTVV48/hywcY5o24G2I5Lp422nsZltqLYXS3cu
	VFDIt1s0JB/QgtGpCAUKiqsHc77QEppbRx2R6Nb8+ktPQexi5HVr+GDCEKE+OwM5
	IvwuJVtb1ErGbs4en8K+GIDJ+6QTn9zaW8+anO3k/As+XtDVEgAsjcG/9zaxTzFD
	ZzLVDi8n/EFHP4YYRR4TN/M/2KGmQ+wV0+uexVHbJI5uAyYjWibdZHM2a0K9tnOd
	WIMueIQc4KDyk+PlVhO69g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790592998; x=1790679398; bh=v
	TNFzbQu22E1KClznUsf015RNjbxclADs/uVO4l1yco=; b=WCTURZfJmCqjlgz5K
	MHV7a4Yhs1zDaB7PEorO8GSw+nemPPeP33iWsee+IOftXRl2dj752/ZRrweazw9L
	cscM0ZyUhsm/iqsQfil0Kf51O0ASr8rmsN1Vg/CGxBHa2TpHWPfNEU1+QN+byPqa
	XFhrZHZDShvJupiLazM5UR/avBM9+n1X5KOYS34QWgIElSg5+7jtjMcfV+yd2368
	7NH3V4kuczau5n6Nk7nQ5JgkZqrNmx2AVgQMqpPe7dq6UQmZyUfwGcSMb8HIr0+b
	FS9Z3ef/YocJz8Hxqigo3ZXcZeYR0+F3XlbFP5vtvP7zxMb4K8lIKRn7HhZ53e9q
	n0Fbw==
X-ME-Sender: <xms:5ke6alFBTncQo0XLEF8wxvHpDblCikmkbrFaadG-t5wUCZUoN2U6og>
    <xme:5ke6agU1QGjO0ehKsrXHbTePBeNe3iZs3pefsnwt-Iy6NK5ADz7BnKfx_OLjl1BJf
    6_8w-rbyJEOUWdFaYEdnm8vEdgQX0DSjpyWn-evzrsIkqcWJ27ipnTY>
X-ME-Received: <xmr:5ke6akwH3n1Az15guVjcJYszZFb-LqOCJ5L1srGtDYZ1Q19T7t6vJDvUCpRtIIk_VUsOagRTS5HoAbkUq-ndBNQMtEvvYQEK229N0cc>
X-ME-Proxy-Cause: dmFkZTFSucmijAAI12koITYP1WVVFWBjCXndeQP9jOvuJhdMZxpWym4drNN8ThxX46F+R5
    X83rVBeZpRz4yqjy/gilRawnIHGNcXeO6p/9+BWuO2eSauixKXlEz3G5Uah0kRFI1Mpq0b
    SXKQ/ZtrNfPaivBiXuWADLapzjTCwAJ3l2Eqdn4zrX9/X5QKuQNJVpcl2AAKL2XaF2xnMp
    NmQhzEEL4CTZO0QJG5OSFUZPi+fnBW6NgVZbkMLAoldc2WnF6m1g993EgGcNTV9tolyz0B
    US0zDlFRvREraepuELysM5pEspiXW+kZfvjC25m0negKvwizcAZhaSihi53FI/3Ur/VoVx
    0Y/XYEDKhz1agKyuuivBBEzv8OG/KmLab0tScGZOnF04IiDavLRBn3GfphrQ3OKI56DW1e
    wPO4bwV4miGf0qtRiPpQMEB8YB1yDUgwCO53xPkndd/qGNA/bf53uPRIPDFmSyOugWujEd
    Svfwz/4zunsrf9hFAQCcMfGUFMLmrPz0vuTQfxQR/P1LlFc6EjMaHhZjDtisTgoOwjB18n
    8G79K9DlWD7HQSw4N+XieU4XSlvhJNVgws1/8z4dSs8xWqW68bQYakNcM/hChi9If+lYtY
    0SIQ/hzdSZOa/6v1SrFEQ5YjCRHk/xhXCTJtY1JMI9kyaVsQHcM1Ct8Xbe2A
X-ME-Proxy: <xmx:5ke6amOsAdzFq-YlAzQpWmXbvLLzJbruKBTPEDkW9hfd3bmdLXUG1Q>
    <xmx:5ke6at7VodzgKp7BlUEMYXkSSjQPQTzxRMmtLB9IHe6JxynbLtj-1Q>
    <xmx:5ke6avNuTaFcWwwXO0DZpO0tEln4eiwbHslWPXuJgueqrCk7hnTtUA>
    <xmx:5ke6ajlCPx3G1BUA_VI__r3HR2yhVEuQ8MqZbqSeO2FDWLdNjcTkcg>
    <xmx:5ke6aml3YfIu9vyqKEkQS39je5cES6KISSOizf2Spf_g--N9FgFfHJ0p>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Sep 2026 06:56:38 -0400 (EDT)
Message-ID: <22a606d48b2107c3eb2c8158369a656aefe4c057.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH v2] libpcre2-ptest: add testoutput3C for locale
 variant
From: Paul Barker <paul@pbarker.dev>
To: Bhavikkumar Girishbhai Ronvelia
	 <BhavikkumarGirishbhai.Ronvelia@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 28 Sep 2026 11:56:36 +0100
In-Reply-To: <20260928103639.816523-1-BhavikkumarGirishbhai.Ronvelia@windriver.com>
References: 
	<20260928103639.816523-1-BhavikkumarGirishbhai.Ronvelia@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 10:56:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246750

On Mon, 2026-09-28 at 10:36 +0000, Bhavikkumar Girishbhai Ronvelia
wrote:
> Test 3 (locale-specific features) fails because testoutput3C is missing
> from the PCRE2 10.48 release tarball. It exists on upstream main branch
> and will be in the next release. This carries it until OE bumps to that
> version.
>=20
> On systems where glibc fr_FR locale does not classify extended Latin-1
> bytes (0xC9, 0xE9, 0xAA, 0xBA) as alphabetic, none of the existing
> expected outputs (3, 3A, 3B) match, causing Test 3 to fail.
>=20
> testoutput3C was generated on the target by running:
>   ./RunTest 3
>   cp testoutput8/testoutput3 testdata/testoutput3C
>=20
> The file is installed into the ptest testdata directory at package time,
> following the same pattern as the existing run-ptest file.
>=20
> Signed-off-by: Bhavikkumar Girishbhai Ronvelia <BhavikkumarGirishbhai.Ron=
velia@windriver.com>

Hi,

I can confirm that the testoutput3C file is missing from the 10.48
release tarball, but it is present in `pcre2-10.48` tag in the git
repository [1]. I suspect the issue was that it was missing from
EXTRA_DIST in Makefile.am [2], which has now been fixed on the main
branch [3]. So this should be included in the next release tarball.

[1]: https://github.com/PCRE2Project/pcre2/blob/pcre2-10.48/testdata/testou=
tput3C
[2]: https://github.com/PCRE2Project/pcre2/blob/pcre2-10.48/Makefile.am#L76=
6
[3]: https://github.com/PCRE2Project/pcre2/blob/main/Makefile.am#L898

So, I think we can take this patch.

Best regards,

--=20
Paul Barker


