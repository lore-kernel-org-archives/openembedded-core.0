Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0FE5574689
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 17:47:08 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id b9so529018pgf.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Apr 2018 10:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=acappl/52dvzzI+2koki/1WRuWT6va06aC6Dj2zM2b8=;
	b=kqFXJYtI4M3rn2nJJYQn9Nw9SwRYaD7j/uQAHo2eeBvQFl20GSmME2tCibwWW7YuKd
	+XoGuuksm9UVIQCZscR4RVefu5Y5XVQph5E/PwcnOL/rEcPi7KuLR590L7j9Z1ZMW151
	f+//YnyHJXjFQXzXigE0GiTKIT66wqWt41PFJk9j5sWtAh/tZrgBiAmRLPmTGPlHmbGs
	Zp0dv7UzkDmorL3yO4yZH0q+S6re0D3Cg/xvcDmw6ca1Wi8EyqxnSsFlTvDubPKfnczU
	94jIrqejjtf9OgJzKNKN134FrqRJNLrHgQTvIMmFizMjgITL79fWpVQ+Ve7yFDE3RA4H
	NTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=acappl/52dvzzI+2koki/1WRuWT6va06aC6Dj2zM2b8=;
	b=cAKKfloieLuvGFWOGus9XhM3pHWF07+bCrs5gPaKOv3szg+AjG2CD9nlk3Hge21Iqf
	WVRHJkWObyJWK7m0tiNxKqU75ZgLpBY/X/tVmgQEtBbiHnzqpCKn0UY99EZpuucbDne0
	o69VopuWsPXOdzRTsFjxzRDVAqjj7IlbcE/h3I6RY8cc1R7bfAsg8NhWtquprRpHznXR
	vEqGeRVz4cGZtsr9o2JGeFEqy07b/yDCM/J1L5S9gkqjkn57/ncq89s/tCx0CLxGt3AZ
	2JoreAJwfQUbChSfxJUxSxqie0cj2mas18nE8BQcJAf3IcxKkZJoA53oeRReCC+Chsp4
	NAFg==
X-Gm-Message-State: AElRT7HMZ5Qm+LU3c01kaM1IFKrfIP9bv3r74k3GVFqtXqrt+sso1ode
	M3vHNcTnVcWHqm3iIGkp5qMz4cMsLzg6RG7rpFg=
X-Google-Smtp-Source: AIpwx48d9XSXNbXnoo6mJqvkbKztnfHGHC8NijdY4nTHqjJm8lC/clUbfScS0tAB1jEcgz4SvlQkijY0QGXG0fJUQ+A=
X-Received: by 10.98.89.89 with SMTP id n86mr28324979pfb.158.1523296029701;
	Mon, 09 Apr 2018 10:47:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.166.196 with HTTP; Mon, 9 Apr 2018 10:46:39 -0700 (PDT)
In-Reply-To: <20180409151919.9133-1-ross.burton@intel.com>
References: <20180409151919.9133-1-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Apr 2018 10:46:39 -0700
Message-ID: <CAMKF1sp3TFC-hR4+mWefFwEfm5fJmJ8Xj8r5MPKf0LeRJ14Hrg@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] populate_sdk_base: use xz -T instead of pixz
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
X-List-Received-Date: Mon, 09 Apr 2018 17:47:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 9, 2018 at 8:19 AM, Ross Burton <ross.burton@intel.com> wrote:
> xz has native support for threaded compression now and SDK creation was the only
> part of oe-core which is using pixz instead of xz.
>
> Not only does this remove pixz-native from the SDK dependencies, but in my
> limited testing xz -T0 is slightly faster and produces smaller archives than
> pixz for the same input.
>

this is using nativesdk-xz ?

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/populate_sdk_base.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> index 77ec8aaec27..79984d7914f 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -46,7 +46,7 @@ TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""
>  TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${SDK_VERSION}"
>
>  SDK_RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
> -SDK_DEPENDS = "virtual/fakeroot-native pixz-native cross-localedef-native ${MLPREFIX}qemuwrapper-cross"
> +SDK_DEPENDS = "virtual/fakeroot-native xz-native cross-localedef-native ${MLPREFIX}qemuwrapper-cross"
>  SDK_DEPENDS_append_libc-glibc = " nativesdk-glibc-locale"
>
>  # We want the MULTIARCH_TARGET_SYS to point to the TUNE_PKGARCH, not PACKAGE_ARCH as it
> @@ -225,7 +225,7 @@ fakeroot tar_sdk() {
>         # Package it up
>         mkdir -p ${SDKDEPLOYDIR}
>         cd ${SDK_OUTPUT}/${SDKPATH}
> -       tar ${SDKTAROPTS} -cf - . | pixz > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
> +       tar ${SDKTAROPTS} -cf - . | xz -T 0 > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
>  }
>
>  fakeroot create_shar() {
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

