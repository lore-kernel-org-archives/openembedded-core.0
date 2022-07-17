Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DCD9C433EF
	for <webhook@archiver.kernel.org>; Sun, 17 Jul 2022 19:35:27 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web10.18948.1658086523089091725
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 12:35:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@zhukoff.net header.s=fm3
 header.b=oDGt9pho;
 spf=pass (domain: zhukoff.net, ip: 64.147.123.24,
 mailfrom: pavel@zhukoff.net)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id F027632003CE;
	Sun, 17 Jul 2022 15:35:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sun, 17 Jul 2022 15:35:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1658086521; x=1658172921; bh=1D
	c+LqIKgpgmwyAEwuxyqEj9cvI4fKLUHIWpXas8It4=; b=oDGt9pho1D+bopmHuS
	b9JKLKCVPCU5nxmxy3UExAK7y/bF+sgngM/iae03LK35buHOQgtNDaSOovZAkaax
	Dg0rP+C/vV9nNp710Do3vVjqDpAbpkDBkD7YgUAPI6YrpHnbB+7z27cWlALyUAAA
	+Re5C48lZwUuWrPjZeweK2VkuSTVP0CF5F/Bxy3zWg38si/lyJGl1ojJIvsFJ6Nu
	/rQhO7UpM/Z2OggbYJGURYmVpXc0UUDGItjQtcIixWsslrLHQihfYeZUNjB8svmH
	dixrSS+1V/dQErmHd2WRoocsiGmMqg519j8cTdatWcshvmfuDyzyorgAZhs0U6/k
	ffbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1658086521; x=1658172921; bh=1Dc+LqIKgpgmw
	yAEwuxyqEj9cvI4fKLUHIWpXas8It4=; b=rXe6DZrca8pdvBJ13cz+lNmmtw/pQ
	p4pGLrKY6cB0PES89vsvfQU5aGyezSttfs5eepgjrp6tvznUhvMXXtnigX9nXAIb
	6SqjEh+bd2PIB/VG8+zv9tzQiyVCQQxqAcmz473As4+tkq0XsYwWYBHXGWmHOVEV
	aXR+1lKX1RG8btMt2W+A8Ucvf482wlMiREKSmAFUy5ZuFeIOqjDUfEbqdIsJ0soN
	HWKk/J980cJVKDAL6CCAjER46HUUmgVtGkXEyCA4iHbyJqt7HBC8E58WW3Y41g6W
	BiVKwV8pFzTY6owL2JC+1rN9rQPg61U5TygcEpYJigS0qBRxYuldEsngw==
X-ME-Sender: <xms:eWTUYvfeBE1rk719o-4xjuL8trked_jKZBIFANkdmrSjrFfBgDavfQ>
    <xme:eWTUYlP1DjHZ5qlDmsbmYkz7_vDwoJE7sByICp6tB2gGJeb_QgL5lwgW9zTG5h8Uy
    1sVieBOAM4WPTucDNc>
X-ME-Received: 
 <xmr:eWTUYoheq20wQn8KpLIssme8kVrXM0DyvLGsp1qDMTOfZgEjdL9qhpgfB3qhA_ALSfMFVms>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrudekiedgudegudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpehffgfhvfevufffrhgjkfggtgesthdtredttdertdenucfhrhhomheprfgr
    vhgvlhcukghhuhhkohhvuceophgrvhgvlhesiihhuhhkohhffhdrnhgvtheqnecuggftrf
    grthhtvghrnhepjeefudffffevveehtefhuddtvddvueffkefhueeiteeuleevffefvddv
    ieefheegnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghvvghlseiihhhukhhofhhfrdhn
    vght
X-ME-Proxy: <xmx:eWTUYg_cKAP6J7qT-YtWBpyNJvjUnwn2jNKdzD7sJoO4YpwjCTcQ6w>
    <xmx:eWTUYrvwMiph7bOtaNBvIP_kbN_qec71aH1Y-O-iMNHUduHf_JRiew>
    <xmx:eWTUYvEdQ1N9fRhPRQ9jFqMowGJhOWU8Q111rLndEo4GN1ZKHkIORg>
    <xmx:eWTUYkW6cwPpxCAniZDPsqCKpyC_pkHofIuowcSaemEH5754EO1jUw>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 17 Jul 2022 15:35:20 -0400 (EDT)
References: <cover.1657772638.git.steve@sakoman.com>
 <537e7d323f57a0484c279c3b52ad5bb45eb44a10.1657772638.git.steve@sakoman.com>
User-agent: mu4e 1.6.10; emacs 28.1
From: Pavel Zhukov <pavel@zhukoff.net>
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org,  wentao.zhang@windriver.com
Subject: Re: [OE-core][kirkstone 05/27] harfbuzz: fix CVE-2022-33068
Date: Sun, 17 Jul 2022 21:32:45 +0200
Reply-To: pavel@zhukoff.net
In-reply-to: 
 <537e7d323f57a0484c279c3b52ad5bb45eb44a10.1657772638.git.steve@sakoman.com>
Message-ID: <87k08bttxw.fsf@gentoo.zhukoff.net>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Jul 2022 19:35:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168162


This breaks build with clang:

| In file included from ../harfbuzz-4.0.1/src/hb-ot-face.cc:39:
4429| ../harfbuzz-4.0.1/src/hb-ot-color-sbix-table.hh:301:11: error: use of bitwise '|' with boolean operands [-Werror,-Wbitwise-instead-of-logical]
4430|       if (png.IHDR.height >= 65536 | png.IHDR.width >= 65536)
4431|           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
4432|                                    ||
4433| ../harfbuzz-4.0.1/src/hb-ot-color-sbix-table.hh:301:11: note: cast one or both operands to int to silence this warning
4434| 1 error generated.


"Steve Sakoman" <steve@sakoman.com> writes:

> From: Wentao Zhang <wentao.zhang@windriver.com>
>
> Backport patch from
> https://github.com/harfbuzz/harfbuzz/commit/62e803b36173fd096d7ad460dd1d1db9be542593
>
> The 'tff' file in upstream patch is for testing only which cause error during do_patch so need be dropped.
> File test/fuzzing/fonts/sbix-extents.ttf: git binary diffs are not supported.
>
> Signed-off-by: Wentao Zhang <wentao.zhang@windriver.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  .../harfbuzz/harfbuzz/CVE-2022-33068.patch    | 35 +++++++++++++++++++
>  .../harfbuzz/harfbuzz_4.0.1.bb                |  3 +-
>  2 files changed, 37 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2022-33068.patch
>
> diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2022-33068.patch b/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2022-33068.patch
> new file mode 100644
> index 0000000000..931b9abe1e
> --- /dev/null
> +++ b/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2022-33068.patch
> @@ -0,0 +1,35 @@
> +From 62e803b36173fd096d7ad460dd1d1db9be542593 Mon Sep 17 00:00:00 2001
> +From: Behdad Esfahbod <behdad@behdad.org>
> +Date: Wed, 1 Jun 2022 07:38:21 -0600
> +Subject: [PATCH] [sbix] Limit glyph extents
> +
> +Fixes https://github.com/harfbuzz/harfbuzz/issues/3557
> +
> +Upstream-Status: Backport [https://github.com/harfbuzz/harfbuzz/commit/62e803b36173fd096d7ad460dd1d1db9be542593]
> +CVE:CVE-2022-33068
> +Signed-off-by: Wentao Zhang<Wentao.Zhang@windriver.com>
> +
> +---
> + src/hb-ot-color-sbix-table.hh | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/src/hb-ot-color-sbix-table.hh b/src/hb-ot-color-sbix-table.hh
> +index 9741ebd45..6efae43cd 100644
> +--- a/src/hb-ot-color-sbix-table.hh
> ++++ b/src/hb-ot-color-sbix-table.hh
> +@@ -298,6 +298,12 @@ struct sbix
> + 
> +       const PNGHeader &png = *blob->as<PNGHeader>();
> + 
> ++      if (png.IHDR.height >= 65536 | png.IHDR.width >= 65536)
> ++      {
> ++	hb_blob_destroy (blob);
> ++	return false;
> ++      }
> ++
> +       extents->x_bearing = x_offset;
> +       extents->y_bearing = png.IHDR.height + y_offset;
> +       extents->width     = png.IHDR.width;
> +-- 
> +2.25.1
> +
> diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
> index bf77a5e56c..81518a53ea 100644
> --- a/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
> +++ b/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
> @@ -11,7 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6ee0f16281694fb6aa689cca1e0fb3da \
>  UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
>  UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
>  
> -SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz"
> +SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz\
> +           file://CVE-2022-33068.patch"
>  SRC_URI[sha256sum] = "98f68777272db6cd7a3d5152bac75083cd52a26176d87bc04c8b3929d33bce49"
>  
>  inherit meson pkgconfig lib_package gtk-doc gobject-introspection


