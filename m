Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A99DCC5DF70
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 08:26:55 +0000 (UTC)
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4326.1787041605963450045
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 01:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=jt9fDyyE;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=D6fxkQ4a;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.145, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id DE29AEC025C;
	Tue, 18 Aug 2026 04:26:44 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 18 Aug 2026 04:26:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787041604;
	 x=1787128004; bh=7IxRWkxSVNJPK+4LC2h9C7OTlJoWhkQFA50ZbLcis6U=; b=
	jt9fDyyEd5df8bLJUNSRS2H8BfKNazjjIjSJruHldihyrsS33tsryYCKodRAAZv/
	slwunXlBiZYEbPjNUd0A/2Wd9DPkIMAzDejkZacOAXRFIdCi/O259FBMIP7ZqA/S
	tRFh3gWS2PZh/hGurhbf7nODznRWJ7QjJsZYHkSpRBfNgKJw9+8pEbgDvSIMM7cn
	z088T98bbtiSiLkJTQnv0taX/SvZ52kNsvH3CFCobt+pMevXHUexO0n47ixhJpj8
	kOrsWxqwqrOOKMDOhAbt9oqOdni+Xi6M/eaLFj7990NO/HUk7OmYyReR6rvvjNno
	VI6LdxAuWr+gY0TVmToToQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1787041604; x=1787128004; bh=7
	IxRWkxSVNJPK+4LC2h9C7OTlJoWhkQFA50ZbLcis6U=; b=D6fxkQ4aVSozHKTkL
	6t42OeWBIcGic7LKsXouaXra7KjmmEcWda5KBnqWi7F4s0By6XDDPMeaHIm1WyJ+
	QI3cZT3fo20/EGQNIPfyoh+Y5T8hJZW5g7RwD9AjidI1zZJIUiuYAU2dwt8oFXvx
	6kMOsFxm2CgocXM78OdL7CNCPwcAQP3uXVL8Y6/0V4TYVpTnFH62LQjXc7f63ZOf
	J5jPJ2tFzTEzdn0+N67puY2ES3txsQ85Rp1baEiPrgKO+FkASnyOm1IOEhcsPyTM
	9bYrCqBXhK2sGdxnC5wAdSEYfrPWca2eCxoYi+lWIoRSj9wcEObsa1zprovkw4E5
	lAeRQ==
X-ME-Sender: <xms:RBeEalt0SNeVOym9G285F41lC_rTw4mpqoiLBITlwfr2zZqQPWnj-A>
    <xme:RBeEakfs2shbOge4KhsZixWo57BEybr6ogdf1XtFiiKRo2by1MFqLyDnUzUzGosEj
    MbOqtLMVnFtYsUjKxwCSwnyK671dq7YDUBsG3bf3WC0UY8IM3V8KWc->
X-ME-Received: <xmr:RBeEamZaO82keVk7YSheWFLzCadenwHFJG1iTmBdEOZ0AvNTad6-vNsJR0dPQK4GpZeMQIAsV5W5kHXFqbiNlHSn8AtyWw8rzZs9sXo>
X-ME-Proxy-Cause: dmFkZTEll5LmgWHjWQO/ncqECp3ge5ixL7MJl7ojeB04NDZgH9OXjxLqQZCddu3j+BzSuq
    1sQNGNLoR7+rUXOUInpyHcsMXmxpRkO4besXWKqmc/DzU0rtXWJOLpJwzXh3s+i+DVKCma
    yXLEpZFhyt7ssthvHptQmMP5KqG8mnAt4viNV6Y7u1NX0ufzpm7+SG4OXwHBNRMm3qnO2T
    KiRYgX/4q64tKyID+kwMNDGCwuh8ePrcJkQyvRQw3TzmlLSBLCL0unplJhoQVuPBjolQp7
    v8ZFyBvSHEveiB8ZeylzUeOgr5puThfp3XowN2gn6pTKiB4xJ+QyIOtuA1UL1Z8sLYnLU/
    EZf1MY5aFzFjqbHI7Pl25ofpHDxSLZaIL2HoQpdrIZShXXYU8/qHCG2v5ayZqNfd0+Pj/Q
    76wF9su+811UP40/8rAIiTTdVH6Rm+1S53PRiYCGb4QTFeklo4YewbWrJIaInRa0hK1elT
    UG1DGPo+JISyxCp/eOIH6aojPIQWoepFvagQ8a3ZvUGbywB8j4UXcA6Wmrfexz1/kftAM/
    6Jsu7Pov5bxR+ICvJI/g8b0UQF1kuJlIg2EB9F2DatCOEJqlS4hKAeirLXhY+Hzucnxe+X
    DvuNYOzfkQiIR0lquV5I4GINQ1nYYQEI3FkzQ74fS3PPaD1e1iekitYy6nhg
X-ME-Proxy: <xmx:RBeEanVqX6cTt7CqrCcb1mrSWxwmEMxRNoOeS8a07SHOCZc2p_LGGg>
    <xmx:RBeEaojv54CKIOy0Gk-ODwGL2PuqaGiBZsViMP6f_9kOew_zwC8jLg>
    <xmx:RBeEalUY7aKXyOYM7bTfaDyvv2V2gWHk3eEp3B5QR2VjmuGPHUqyIA>
    <xmx:RBeEavNswGLx4BXLpTVSc-L6w-Cs-Ewh2imtilccrPKFBrRa3Dr5lg>
    <xmx:RBeEarsv4Ncfvora-8YbkLgjwKaDWTOBvvvMLAM7diUMauhleIWhof6S>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Aug 2026 04:26:44 -0400 (EDT)
Message-ID: <eb876035744ebb0dc0f0c591bbc625693d35af63.camel@pbarker.dev>
Subject: Re: [oe-core][PATCH 2/2] clang: auto-derive CLANG_EXTRA_OE_DISTRO
 from DISTRO
From: Paul Barker <paul@pbarker.dev>
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Date: Tue, 18 Aug 2026 09:26:43 +0100
In-Reply-To: <20260812161341.822689-2-f_l_k@t-online.de>
References: <20260812161341.822689-1-f_l_k@t-online.de>
	 <20260812161341.822689-2-f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 08:26:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243668

On Wed, 2026-08-12 at 18:13 +0200, Markus Volk wrote:
> CLANG_EXTRA_OE_VENDORS already auto-derives from TARGET_VENDOR and
> SDK_VENDOR, recognizing a self-hosted OE build host without manual
> configuration. CLANG_EXTRA_OE_DISTRO has no equivalent -- it ships
> only 'poky:poky', so a self-hosted host running a custom DISTRO must
> be manually registered before Distro::IsOpenEmbedded() recognizes it
> via /etc/os-release.
>=20
> This is easy to get wrong by hand, since the registered id must
> exactly match the raw ID=3D value in /etc/os-release, including any
> hyphens, which must NOT be converted to underscores (unlike the
> generated C++ enumerator name, which requires the conversion). A
> single typo silently disables the OE-specific GCC-install candidate
> with no error, causing native clang-toolchain builds to fail to find
> crtbeginS.o/libgcc despite running on a genuinely OE-built host.
>=20
> Auto-derive an entry for the current DISTRO the same way
> CLANG_EXTRA_OE_VENDORS already does, so self-hosted OE build hosts
> are recognized out of the box with no configuration and no
> hyphen/underscore typo risk. 'poky' is skipped since it is already
> the shipped default.
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> Co-authored-by: Claude <noreply@anthropic.com>
> ---
>  meta/recipes-devtools/clang/llvm-project-source.inc | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-devtools/clang/llvm-project-source.inc b/meta/r=
ecipes-devtools/clang/llvm-project-source.inc
> index 5cd08d4085..5a07080d55 100644
> --- a/meta/recipes-devtools/clang/llvm-project-source.inc
> +++ b/meta/recipes-devtools/clang/llvm-project-source.inc
> @@ -28,6 +28,7 @@ CLANG_EXTRA_OE_VENDORS ?=3D "${TARGET_VENDOR} ${SDK_VEN=
DOR}"
>  # ":" separated the ID in "/etc/os-release" and the triple for finding g=
cc on this OE DISTRO.
>  # eg: "poky:poky wrlinux:wrs"
>  CLANG_EXTRA_OE_DISTRO ?=3D "poky:poky"
> +CLANG_EXTRA_OE_DISTRO:append =3D "${@ ' ' + d.getVar('DISTRO') + ':oe' i=
f d.getVar('DISTRO') not in ['poky', ''] else ''}"

Hi Markus, we've merged the first patch of this pair but have a couple
of comments on this one.

Does this need to be an :append? Can we instead just extend the default
assignment on the line above?

This hardcodes the default vendor to 'oe' for non-poky distros. Should
we instead use the value of TARGET_VENDOR with the leading dash removed?
Perhaps we should just have one default entry?

    CLANG_EXTRA_OE_DISTRO ?=3D "${DISTRO}:${@d.getVar('TARGET_VENDOR')[1:]}=
"

Let me know if I've missed some nuance here, I've not tested this.

Best regards,

--=20
Paul Barker


