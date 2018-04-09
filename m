Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 4A43E74A4A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 20:13:28 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id u11so10790707wri.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Apr 2018 13:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=slvFtpNRMazZHx5GwCMr4gS4SeoCY1r9cCfOqK9bFUs=;
	b=AhG/394+DfJZ84kd7HWPc643mkVoiDUGQ5u0FvmfyE1IUovE+hmR6EbQ9adJfqdD0V
	GhlmS7OU8lfcCuBwqWU6bFQMKdgEHhqbeZP02mXqaNN8wBZZNs7G/fS+AE0fEsc2FeSW
	6lqSEdJUshl+NyBRPd9vnCpsMDQ35mtVIRNqMSDjRj3fvNgfzHzfZraTB7k7JyTZDeCc
	XIHJkZiSaTsE60NyXXjvxU2l+bOT2xXdZU1z0nF8EjIZ24qbBGyZiWMxCxieZJ24dqbY
	iduub01U5uYeO40r01GDeOmdbwcQktYxWdspqtB+iLWtoXkGuAZEWJ0wfkgpOLZxcMOq
	yJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=slvFtpNRMazZHx5GwCMr4gS4SeoCY1r9cCfOqK9bFUs=;
	b=tEF2xGvwopOWdeu3r1PcyZLKka5vbJRidGWCSRV0uxf+kKn7NNuhGcnCk2bLPtsM0h
	63Nw4XNKBPUDrh5QCRwdkwVLXmQcr5RKO2O295GhiIUa0fmeN3TnPS9sDAq7LdNafWUv
	C5/+SAym7Sx7Ypw1QVZwNzOILSL15rxALS5DSODEJOehpaI2hEUf+QJPAOu7xOUnDwoq
	fg/riB+ZzmWlmpCK4onpOXmgndvWCt+gbIuEZCAoznTiVdg0jcLDDcdSWD6k6f0YUBrm
	TLpeLG1Hqnd/YRRqKDGFLfOt4uE/JH38u/cqWGZB3pj5+v1x2Gh7hbPZEnv6tE9IhY0R
	cbcA==
X-Gm-Message-State: AElRT7Ed4mxv2UuPaj5NhhnAwMjpwOZ365xV2GsDY81srvIbN3/xZwVq
	4GLd3/SakEbsoj61l/pBWXu/sE6StdhM5tCYudU=
X-Google-Smtp-Source: AIpwx49nxnjZL/uDv7MqP3Ea16DqmfZKSMDXE9KVwELChVlLC8i/z8DVucpcQI/VA8Et4ZmF8nHxOhw/29mxCqaZHTk=
X-Received: by 10.223.182.132 with SMTP id j4mr26615682wre.66.1523304809823;
	Mon, 09 Apr 2018 13:13:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.163.65 with HTTP; Mon, 9 Apr 2018 13:13:29 -0700 (PDT)
In-Reply-To: <20180409151919.9133-1-ross.burton@intel.com>
References: <20180409151919.9133-1-ross.burton@intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 9 Apr 2018 13:13:29 -0700
Message-ID: <CAJ86T=V7o5nE-pX9QZGqXFL93O2Nt=GE7cist-zo2WGg0zO_sg@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 09 Apr 2018 20:13:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 9, 2018 at 8:19 AM, Ross Burton <ross.burton@intel.com> wrote:
> xz has native support for threaded compression now and SDK creation was the only
> part of oe-core which is using pixz instead of xz.
>
> Not only does this remove pixz-native from the SDK dependencies, but in my
> limited testing xz -T0 is slightly faster and produces smaller archives than
> pixz for the same input.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>
>  # We want the MULTIARCH_TARGET_SYS to point to the TUNE_PKGARCH, not PACKAGE_ARCH as it
> @@ -225,7 +225,7 @@ fakeroot tar_sdk() {
>         # Package it up
>         mkdir -p ${SDKDEPLOYDIR}
>         cd ${SDK_OUTPUT}/${SDKPATH}
> -       tar ${SDKTAROPTS} -cf - . | pixz > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
> +       tar ${SDKTAROPTS} -cf - . | xz -T 0 > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz

Since -T 0 will use all available CPUs (ie any attempts the user may
have made to limit parallelism via BB_NUMBER_THREADS or PARALLEL_MAKE
will be ignored), perhaps it's worth adding something like
"--memlimit=70%" to try to give some protection for environments with
lots of CPUs but not so much DRAM?

