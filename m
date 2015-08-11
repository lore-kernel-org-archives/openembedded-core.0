Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id B9B707691A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 00:12:15 +0000 (UTC)
Received: by igbij6 with SMTP id ij6so80546917igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 17:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=eQen1lBnX57Gbeci4vU7bRc2wPVRFhLY8X0rhyLK51Y=;
	b=BVernksUI7jIdOH0GI3kvAslWeFwYzqkGnDfjyEk9b9btV5SYdlLon1MZ4PwgHYwRf
	XyiE/g22Ev2lZ83LVbVmMWe7kRD8WWaZwUT58Pvg6989LGoGqoU1kZiRDbNn5vd75bhM
	tN0jIzSZSY887imZqVTc+B2qOIsPVHC71p7uBxR6Jz0e3fae6euW3wXIRc4paxG+TN9k
	G+ftH5gutW7pmxPxIgjVjpcb5M7dnIc8Y61nSwAccB1evTEuFlbtWuiqssMWotNhgGle
	2StfU4lphwKSftLNv/L4Q1WpQ5htao60AFFfO7UBtpu7ulHhUU6s2DWxkHCqoRBhl0A9
	DnHw==
X-Received: by 10.50.119.33 with SMTP id kr1mr5408108igb.75.1439251936112;
	Mon, 10 Aug 2015 17:12:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Mon, 10 Aug 2015 17:11:46 -0700 (PDT)
In-Reply-To: <1437996390.821.229.camel@linuxfoundation.org>
References: <1437996390.821.229.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Aug 2015 17:11:46 -0700
Message-ID: <CAMKF1sq1_xwge6wmTOEu1Hn3VYgdao5wDUUQ3ZOggjJo4LumUQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] security-flags: Disable PIE for coreutils, elfutils, gcc, iptables
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
X-List-Received-Date: Tue, 11 Aug 2015 00:12:20 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 27, 2015 at 4:26 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> With gcc 5, we need to disable the PIE flags for more recipes in order
> to have successful builds.

what error do you see ?

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
> index 85a3bfe..3724972 100644
> --- a/meta/conf/distro/include/security_flags.inc
> +++ b/meta/conf/distro/include/security_flags.inc
> @@ -25,11 +25,10 @@ SECURITY_CFLAGS_pn-webkit-gtk_powerpc = ""
>
>  # arm specific security flag issues
>  SECURITY_CFLAGS_pn-lttng-tools_arm = "${SECURITY_NO_PIE_CFLAGS}"
> -SECURITY_CFLAGS_pn-elfutils_arm = "${SECURITY_NO_PIE_CFLAGS}"
> -
>  SECURITY_CFLAGS_pn-aspell = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-beecrypt = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-blktrace = "${SECURITY_NO_PIE_CFLAGS}"
> +SECURITY_CFLAGS_pn-coreutils = "${SECURITY_NO_PIE_CFLAGS}"
>  # Curl seems to check for FORTIFY_SOURCE in CFLAGS, but even assigned
>  # to CPPFLAGS it gets picked into CFLAGS in bitbake.
>  #TARGET_CPPFLAGS_pn-curl += "-D_FORTIFY_SOURCE=2"
> @@ -39,10 +38,12 @@ SECURITY_CFLAGS_pn-db = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-directfb = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-glibc = ""
>  SECURITY_CFLAGS_pn-glibc-initial = ""
> +SECURITY_CFLAGS_pn-elfutils = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-enchant = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-expect = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-flac = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-flex = "${SECURITY_NO_PIE_CFLAGS}"
> +SECURITY_CFLAGS_pn-gcc = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-gcc-runtime = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-gcc-sanitizers = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-gdb = "${SECURITY_NO_PIE_CFLAGS}"
> @@ -60,6 +61,7 @@ SECURITY_CFLAGS_pn-gstreamer1.0-plugins-bad = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-gstreamer1.0-plugins-good = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-harfbuzz = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-kexec-tools = "${SECURITY_NO_PIE_CFLAGS}"
> +SECURITY_CFLAGS_pn-iptables = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-libaio = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-libcap = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-libgcc = "${SECURITY_NO_PIE_CFLAGS}"
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

