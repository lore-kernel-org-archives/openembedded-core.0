Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D43ACC19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 09:06:27 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.7168.1741338384129298331
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 01:06:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nNG0KiDC;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6e41e18137bso11347036d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 01:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741338383; x=1741943183; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nQ4vXNrxVDGJ2+Wfc713RVrTWbm/26drOtd1nlU5DPs=;
        b=nNG0KiDCyMWVybEC4LwUAf4UuhyorpEwzD9w3IJRjpDaaRVA4RNn3Lg6iHxXQyWvwX
         SaqqXr1F1QkSfn2xkW2JfRmZEMekiZe3+eYiTkvyMhZKudn4mO9u+flOSrNuzUQl5Lvg
         b9GzlfXSfeLjCVnJHsIbxtsBDuCHB6dydj9Olif7VS9MdfYKALbliKOpzw9JJ2YCUNwY
         o6R17f6dKmADSxkVlgorNdelKvycznzKO6Zd6NzCyNa/1epgvMPxLR9Aujy1utAsx9Pb
         SbbwAmlnAyn3YVIp2OdU33kdbwTp/g7Yr441M8WBz2jMjtKh7IOSv09RNXllBfAOJ+uK
         lqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741338383; x=1741943183;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQ4vXNrxVDGJ2+Wfc713RVrTWbm/26drOtd1nlU5DPs=;
        b=StQh6CoUMm01o38R9cdMFq5Lk/MVbX5is1pSt7trZiPMntVc6ZGg4TvivpWevsBoPX
         cbqYnfUjauIjeDM9NU3mIP5iIa4YTMVLxos6YxE8WJWnQ8h7HmF2bZdFvyzGnFZuvP6s
         iXysxlUuhlN/GAx9Bv0puEE8r6fx9l8SU+WEI36trGoSlu/qHEGnCsaT5JRrzglLLYUD
         fMuEfZSem/coTCTOAfOAEJ7at4WMltTXmfrdIZkyEvmQDk+50lEK1uYyJUQrYSb1AOZE
         N+yPmI+mAMLKqxe8oM7mWWy5w2N50XT3rRueYC7u60bwRCYL4GIyHc4C5qs+XDZLyxtb
         efUg==
X-Gm-Message-State: AOJu0YwwUTakguwPT2dEw4R/xQCfaBWZ/YVgn3gBoBkxONya1nKWz14R
	XigXPsKaj5EDiR/xjuZvRdUENoYru2mDIWVS73n4VKf5gx5p7lJyH5/cbmeMikzhSSIskNNLoyZ
	31RWut62fOUOqlSaS+O7sbs+oofo=
X-Gm-Gg: ASbGnctdsLVkhCqkIKS/LlkdZ/wly0mkIlNrFsXu3qbzyegqSDj5YYLu/2s3UiZAJrc
	VswXU0mSbwff0Vftf84zE7LmXsdNC+JdJ21YaQL5YF1YncdgoyigrkIMHf6WiIJqgZQFmSjClog
	pT4R+orZAhqS2Uh8SYSsUChFhU0hmQendbN0ZFfUlAHqHdFbBT+9jVXQZxpWkY
X-Google-Smtp-Source: AGHT+IEaR1zTKUPxiv9BqwqiatU57RDlM2HzFlJ94iMJ31EiAmZ05M1fUkb+2eNzobGTZxUun1ycvRhMmNI7WmWFmu0=
X-Received: by 2002:ad4:5c62:0:b0:6e8:fe0a:7031 with SMTP id
 6a1803df08f44-6e900683748mr21815856d6.43.1741338382999; Fri, 07 Mar 2025
 01:06:22 -0800 (PST)
MIME-Version: 1.0
References: <20250307084821.451112-1-pavel@zhukoff.net>
In-Reply-To: <20250307084821.451112-1-pavel@zhukoff.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 7 Mar 2025 10:06:10 +0100
X-Gm-Features: AQ5f1Jrgg4t_9qbNSA67xYPv8S1geZq9vX3jiR7WDPSpUJaiJbrqm5q0sQRbvNY
Message-ID: <CANNYZj9MhDqc8WXspdZD3YKi-ZV1wR-6uDQ1B4=3RQEu0B2HWg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] ovmf: Add OVMF_BUILD_TYPE to support debug builds
To: pavel@zhukoff.net
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 09:06:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212418

There is a standard mechanism for such tweaks: PACKAGECONFIG. Can you
rework the patch to use that please? You can still use this variable
but it becomes an intermediate one, and set from what is in
PACKAGECONFIG.


Alex

On Fri, 7 Mar 2025 at 09:48, Pavel Zhukov via lists.openembedded.org
<pavel=zhukoff.net@lists.openembedded.org> wrote:
>
> In release mode, OVMF does not output any debug information to the QEMU port, making it extremely difficult to debug boot issues.
> This commit introduces the OVMF_BUILD_TYPE variable (RELEASE|DEBUG) to enable debug mode.
>
> Usage:
> OVMF_BUILD_TYPE="DEBUG"
> runqemu qemuparams="-debugcon file:debug.log -global isa-debugcon.iobase=0x402"
>
> The OVMF debug console output will be written to debug.log.
>
> Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
> ---
>  meta/recipes-core/ovmf/ovmf_git.bb | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
> index 559c86b546..920944b713 100644
> --- a/meta/recipes-core/ovmf/ovmf_git.bb
> +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> @@ -67,6 +67,10 @@ OVMF_SECURE_BOOT_FLAGS = "-DSECURE_BOOT_ENABLE=TRUE ${OVMF_SECURE_BOOT_EXTRA_FLA
>
>  export PYTHON_COMMAND = "${HOSTTOOLS_DIR}/python3"
>
> +# Build type (RELEASE|DEBUG)
> +# in RELEASE mode debug console is disabled. Switch to DEBUG to enable it.
> +OVMF_BUILD_TYPE ?= "RELEASE"
> +
>  do_patch[postfuncs] += "fix_basetools_location"
>  fix_basetools_location () {
>  }
> @@ -200,11 +204,11 @@ do_compile:class-target() {
>      fi
>      FIXED_GCCVER=$(fixup_target_tools ${GCC_VER})
>      bbnote FIXED_GCCVER is ${FIXED_GCCVER}
> -    build_dir="${S}/Build/Ovmf$OVMF_DIR_SUFFIX/RELEASE_${FIXED_GCCVER}"
> +    build_dir="${S}/Build/Ovmf$OVMF_DIR_SUFFIX/${OVMF_BUILD_TYPE}_${FIXED_GCCVER}"
>
>      bbnote "Building without Secure Boot."
>      rm -rf ${S}/Build/Ovmf$OVMF_DIR_SUFFIX
> -    ${S}/OvmfPkg/build.sh $PARALLEL_JOBS -a $OVMF_ARCH -b RELEASE -t ${FIXED_GCCVER} ${PACKAGECONFIG_CONFARGS}
> +    ${S}/OvmfPkg/build.sh $PARALLEL_JOBS -a $OVMF_ARCH -b ${OVMF_BUILD_TYPE} -t ${FIXED_GCCVER} ${PACKAGECONFIG_CONFARGS}
>      ln ${build_dir}/FV/OVMF.fd ${WORKDIR}/ovmf/ovmf.fd
>      ln ${build_dir}/FV/OVMF_CODE.fd ${WORKDIR}/ovmf/ovmf.code.fd
>      ln ${build_dir}/FV/OVMF_VARS.fd ${WORKDIR}/ovmf/ovmf.vars.fd
> @@ -214,7 +218,7 @@ do_compile:class-target() {
>          # Repeat build with the Secure Boot flags.
>          bbnote "Building with Secure Boot."
>          rm -rf ${S}/Build/Ovmf$OVMF_DIR_SUFFIX
> -        ${S}/OvmfPkg/build.sh $PARALLEL_JOBS -a $OVMF_ARCH -b RELEASE -t ${FIXED_GCCVER} ${PACKAGECONFIG_CONFARGS} ${OVMF_SECURE_BOOT_FLAGS}
> +        ${S}/OvmfPkg/build.sh $PARALLEL_JOBS -a $OVMF_ARCH -b ${OVMF_BUILD_TYPE} -t ${FIXED_GCCVER} ${PACKAGECONFIG_CONFARGS} ${OVMF_SECURE_BOOT_FLAGS}
>          ln ${build_dir}/FV/OVMF.fd ${WORKDIR}/ovmf/ovmf.secboot.fd
>          ln ${build_dir}/FV/OVMF_CODE.fd ${WORKDIR}/ovmf/ovmf.secboot.code.fd
>          ln ${build_dir}/${OVMF_ARCH}/EnrollDefaultKeys.efi ${WORKDIR}/ovmf/
> --
> 2.48.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#212417): https://lists.openembedded.org/g/openembedded-core/message/212417
> Mute This Topic: https://lists.openembedded.org/mt/111564662/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

