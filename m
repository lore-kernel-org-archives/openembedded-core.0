Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3A7AB749A2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 13:14:16 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id 126-v6so11087918oig.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 06:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=0EHtf/4QD2cio6eq1JkdQLVz/FTLZZVEvLRPIYqng2w=;
	b=rCLzRa74lPdkXvMJT66gPp3+N13+zLfqRX/iGFaviSZtuGLPSXX4Yq/9as0+vZVCex
	KuHA2HoTlFy2fe0+d00icM2fohq5mluT0Zv7glCrrIwW4Fhqblb5sDofGpdaEKtoMZZc
	Q1E2fyYuyXsUDAO4O/WA+FW4ArGGoDICEbjQRc4pHV3fdmuSwkob34m+itkTPxotFCW7
	gGaU6svNvYewxGZgnWbXc+RaunlPkLpA4M7/16UfCMsjuLcbS2+afXA6otzvre/0E0M3
	V6hg8LOTfWeySH637DUZZo5MiBa00zkkl3nhnRbNbruQ2UZ9M17CpX1I5vMzK1syFaze
	GlUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=0EHtf/4QD2cio6eq1JkdQLVz/FTLZZVEvLRPIYqng2w=;
	b=N2ZHhtZRijZI/chuxSxF6I9R5R9Id4t9LQpCT7/R6swcTqtnYCowihK3zRKKJJvZjk
	BDsHNs1BbS7DVsfPdE7p8nf0bgiZjlOcQ7NAJQ5Jc3lsFg3+WNIZJCPny3x+qP9aIKnD
	Jih2zy4xy8yQx52v0uCHwuMB852q8AOiGdNlTxExILkHfxix3Pp2qoxMYUoBbXuqdf3A
	5DHEbOHrlk3g62PFS85PGh67E2dh6IH+DmgaYps+1gkr2dSoPB12PRxri0BmeJUeIV5e
	fG/3aEKBo0XSA3mZhko0D8DDVxvZO9AYDDh7wjrO7bgQhOxqZ9ekVTlx6P8/G1I3twZZ
	6/zw==
X-Gm-Message-State: ALQs6tCC5hTsM7X9CvLOSmDKx9xS9URC8mswNwTJSUijgNL/2EvSUGGo
	2vBN83EMuQx7AdraIW9FxXUWhXS11QhdW0L4LTAuvA==
X-Google-Smtp-Source: AIpwx4/XSfSpy0O2rubSAjKjJiRySN5n1p1A4xh69Ewm30VV2OcZk6zIagRH23CVG17KiLtPt+if0NML1vEZKDWyDUE=
X-Received: by 2002:aca:d455:: with SMTP id
	l82-v6mr271922oig.102.1523366057831; 
	Tue, 10 Apr 2018 06:14:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.138.17.198 with HTTP; Tue, 10 Apr 2018 06:13:57 -0700 (PDT)
In-Reply-To: <20180409115657.16651-1-koen.kooi@linaro.org>
References: <20180409115657.16651-1-koen.kooi@linaro.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Apr 2018 14:13:57 +0100
Message-ID: <CAJTo0LZ+K9tG+0Sgctmw-AAVeira4px618yeYTZeivz-+8=rxA@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Koen Kooi <koen.kooi@linaro.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] libcap: fix (base_)libdir usage
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
X-List-Received-Date: Tue, 10 Apr 2018 13:14:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is breaking libcap-native:

| mv: cannot stat
'/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/b=
uild/tmp/work/x86_64-linux/libcap-native/2.25-r0/image/home/pokybuild/yocto=
-autobuilder/yocto-worker/nightly-oe-selftest/build/build/tmp/work/x86_64-l=
inux/libcap-native/2.25-r0/recipe-sysroot-native/usr/lib/libcap*':
No such file or directory

Ross

On 9 April 2018 at 12:56, Koen Kooi <koen@dominion.thruhere.net> wrote:
> The recipe wants to install libs into base_libdir, but uses "basename $li=
bdir" to derive that. That breaks in a multiarch setup. Use the proper vari=
able and remove the inline python usage.
>
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
>  meta/recipes-support/libcap/libcap_2.25.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/libcap/libcap_2.25.bb b/meta/recipes-su=
pport/libcap/libcap_2.25.bb
> index d619a2e..47ecf34 100644
> --- a/meta/recipes-support/libcap/libcap_2.25.bb
> +++ b/meta/recipes-support/libcap/libcap_2.25.bb
> @@ -32,7 +32,7 @@ PACKAGECONFIG[pam] =3D "PAM_CAP=3Dyes,PAM_CAP=3Dno,libp=
am"
>
>  EXTRA_OEMAKE =3D " \
>    INDENT=3D  \
> -  lib=3D${@os.path.basename('${libdir}')} \
> +  lib=3D'${base_libdir}' \
>    RAISE_SETFCAP=3Dno \
>    DYNAMIC=3Dyes \
>    BUILD_GPERF=3Dyes \
> --
> 2.9.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

