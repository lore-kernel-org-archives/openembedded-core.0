Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id A486C65E2D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Aug 2014 17:50:27 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id h18so3240927igc.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Aug 2014 10:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=BVnYbmJxTXCWa76Rbh9bH8A15QLMixZw3SMrE0aqtNM=;
	b=c7qMNi7UJMGaOCC/W9cenFgVkBKRP7fVauQb/KIYeyDzvHyUKt3m6WCG9NaRMNyh59
	NSRYFxkJQptPRsth3Df2QwfuDQ+6oNm1/CSobrjO0QFZGdpNYLK3ZjAc2dK8COBmSibB
	j6dRCueeclcDIvN87QKYZl9EIDmXfp/NV7ifoKWolsk/ttp36PsjBlhh1Mxg3PJXbDgr
	hO7s9EO/YHfbBAy0zwFiVVX5+2Td0Uqv4hZ/6izLHOsJC9YpQh6r5grJms3FlVMiSug7
	y2iFX4bfuLSV/LHR+7SacrghDNIJsUn7KGOXaKZIsK7v6AOmhqsZdbhyfy3d9AbmZe9O
	OJ8A==
X-Received: by 10.51.17.2 with SMTP id ga2mr20454731igd.2.1407001828209; Sat,
	02 Aug 2014 10:50:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Sat, 2 Aug 2014 10:49:58 -0700 (PDT)
In-Reply-To: <1406969187.6981.13.camel@ted>
References: <1406969187.6981.13.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 2 Aug 2014 10:49:58 -0700
Message-ID: <CAMKF1sogzpvfA199VsW3PkY5kcrWYTRH=yAvM4xrvtpjpsdZJg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sstate: Allow switching between linux and non0-linux SDK builds within the same tmpdir
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
X-List-Received-Date: Sat, 02 Aug 2014 17:50:34 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Aug 2, 2014 at 1:46 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Currently if you try and switch between linux/darwin/mingw SDK builds in the
> same TMPDIR, things break. This is due to sstate not reflecting the SDK_OS in
> the manifest names.
>
> Since they are different, reflect this in the manifest naming and allow
> this to work.


typo in the subject otherwise good.

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
> index c678968..2136504 100644
> --- a/meta/classes/autotools.bbclass
> +++ b/meta/classes/autotools.bbclass
> @@ -186,7 +186,7 @@ python autotools_copy_aclocals () {
>          if c.endswith("-native"):
>              manifest = d.expand("${SSTATE_MANIFESTS}/manifest-${BUILD_ARCH}-%s.populate_sysroot" % c)
>          elif c.startswith("nativesdk-"):
> -            manifest = d.expand("${SSTATE_MANIFESTS}/manifest-${SDK_ARCH}-%s.populate_sysroot" % c)
> +            manifest = d.expand("${SSTATE_MANIFESTS}/manifest-${SDK_ARCH}_${SDK_OS}-%s.populate_sysroot" % c)
>          elif "-cross-" in c or "-crosssdk-" in c:
>              continue
>          else:
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 9011973..0d3940e 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -45,11 +45,11 @@ python () {
>      if bb.data.inherits_class('native', d):
>          d.setVar('SSTATE_PKGARCH', d.getVar('BUILD_ARCH'))
>      elif bb.data.inherits_class('crosssdk', d):
> -        d.setVar('SSTATE_PKGARCH', d.expand("${BUILD_ARCH}_${SDK_ARCH}"))
> +        d.setVar('SSTATE_PKGARCH', d.expand("${BUILD_ARCH}_${SDK_ARCH}_${SDK_OS}"))
>      elif bb.data.inherits_class('cross', d):
>          d.setVar('SSTATE_PKGARCH', d.expand("${BUILD_ARCH}_${TARGET_ARCH}"))
>      elif bb.data.inherits_class('nativesdk', d):
> -        d.setVar('SSTATE_PKGARCH', d.expand("${SDK_ARCH}"))
> +        d.setVar('SSTATE_PKGARCH', d.expand("${SDK_ARCH}_${SDK_OS}"))
>      elif bb.data.inherits_class('cross-canadian', d):
>          d.setVar('SSTATE_PKGARCH', d.expand("${SDK_ARCH}_${PACKAGE_ARCH}"))
>      elif bb.data.inherits_class('allarch', d) and d.getVar("PACKAGE_ARCH", True) == "all":
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

