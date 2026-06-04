Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED32CD6E68
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 07:29:06 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5982.1780558144256841683
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2026 00:29:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GI7wz89M;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5176b9c476aso3757081cf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 00:29:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780558143; cv=none;
        d=google.com; s=arc-20240605;
        b=O2FnVjBThUqkJHF1L8LvuvyhW7dCsg7Ryj9UxajOH1htO5JM9Oqmh40DmbRUQfuynd
         FtSd9+68EhKYMW+nRQjZf1By5clcKpe0zh0uJJYmibuQP4pFJRU7FZ3Swp32QEG/Vxd7
         Vf0sGsySt2fcJ+VYYzqj3M3jEX1QgerNVCdDClRMoHz4uhv/3rbqK0XgRpP9xphE7VY+
         tyL661KM+VP+rEbwxtDQywglB+uRU8WIUdDrly6sSnTiuZShd5yJd6yyN+8PkNMAKzqq
         RBvPsuH5TJWsWVGbjsPffN9DIoQ07OMiKvGO6gX6DCal1FBqxGP/Jydu1Vg9vpXAbiZi
         mHrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EX0QHK9+BObLffz09vQCQQALklCzPN4mQsV4Rhz51B0=;
        fh=7Tdpp1GonPoRsRdfb7A5+EER5kPiaIbCVeaF/5Yk+uM=;
        b=IOT/PYw82FybeQDei9vQbUVtwwVVSVRbzOBJeCLua35thJ2spyBMj2CCOipMsY8fj/
         yEn/mzCUoucYjiJQTd7x+t4+utbKHYE5ClCAEX8dI3KA024pgEpGVxbRv3VVYcWg/Uqj
         8x5IfjeCzy8TYFQj5LSmagOsk66utVEqGKQmQoHhLmUK0rEZj//ZF2og3KI0PXJ2xwnq
         Jdl5cNwOEpKq/hqHbpPJePbfc5RUEoNMU0zEOzqGvmNZZ6JeQ9WD/g0cVue/giP63p3j
         sLxi308oDxXKvvRfH/3C9w0M+5AjtjnXKF360kDn/V9UTeKT8XLcWUk+OLBDR66rgz+9
         DVuQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780558143; x=1781162943; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EX0QHK9+BObLffz09vQCQQALklCzPN4mQsV4Rhz51B0=;
        b=GI7wz89MlG1/P8TujZIAKoe0b3V2vnnyJiVF3sOAil0oPzmkMD5McZ4EJQCQfXB9df
         A+ZQ1hM2/s01VX9Ozm7eGQj4QJRTN5HDWCzbeRsMFb1K11YsS0jFG/lsG0GAG+WHp0lq
         fW7hQ9EJUetuyDCYeSbB3y3+EkM3Y8zjtA1OYyZahwKlTsjEN0nfe9Zj5HwwHF70BXr9
         uyhxj/+daSkBiKyoGJZvrkVns/euwE9Hn4uIQLFjEmgd0/D+RvlWQE0RRBKxeYDh1Vcs
         /nmz7S7qiKPVlG8sbpACGipUa3+Fyayogy1o+ZBAkj6JG492X/SxZ/BpD5QLsIRypitp
         jKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780558143; x=1781162943;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EX0QHK9+BObLffz09vQCQQALklCzPN4mQsV4Rhz51B0=;
        b=YLUK5ZOJ/Aty/bX0kL+tna6PHVe5JNrEchVDf/5b7TFq+GRGF+3XYLDMBtDmnJOL6M
         MFr2sqR6HSWrkjKLC7Ts6odd0hScwEBwAg+7EMMFGir1eyI6ryJp7V4ojT/SJUrTqRTa
         0VJaFAPkmvzBa3/fN89hAGMUPasRKxUZ7VeWERwsROHtJ2onxgPYd9mGwTziE3G9VSR4
         jxEe+LcDsgUBWPnshunQTsIWLomhJH9VOF19k+V3oaPO0uX2I6Cmp8tguzsPOcXEBIuX
         eB57MMQ3kAPMu0rbtErZy0MOVwVBGRUoxAO9v2Mat9ivHuPo4xcubp02b8dsm6GTfk5E
         BIjQ==
X-Gm-Message-State: AOJu0YxPhAqK4cNUWmQjDXySiy5u+mhR0dWFB1D5xxEBc3gbhPihEpvV
	ZSagKkLfpRYmCB4ANtA2JdkDX3W1+CzOu0XjbMDWSGWi6srzVxEgvNSbPF1JYuxwi25bTxgEHzZ
	mlhKG021DvjHV99cbc1sTQbKtGHSk5ks=
X-Gm-Gg: Acq92OHN4BSx0WE0wD/cioUDj3Fly2skeT+RgeXq7Uhdgl2u/hNZ5cmDgCfo5uTtJsI
	L+pfUI4gR/gkQ+LFgQmIdZnezWaR+84pGIIC203KR8hV3K+ZAx9P/wGA3cnthBps+ApMtF1Wzlb
	BskUevNNE5w2oDNquGhk8jbUEfbKqluxQSFQ1vSllldwj7XhSSlpoTYaeB0X58I1RpZirLPjxFA
	NFpPEXsha3jLjhGbYePXH3Og6Yk3k0L4YMzImo51XM0c3/1FLgSal6IJ7dJRFD4q8nEC0qLmesO
	I+T98r8QAP0z5bW1rMQa1zOmZP4xcWsO0Ma+rFmeDk2yHPCBy4eNgd11t8ayLbo=
X-Received: by 2002:ac8:5d07:0:b0:517:773d:15cb with SMTP id
 d75a77b69052e-517786191a9mr106091341cf.13.1780558143069; Thu, 04 Jun 2026
 00:29:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260604050245.2932931-1-bin.cao.cn@windriver.com>
In-Reply-To: <20260604050245.2932931-1-bin.cao.cn@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 4 Jun 2026 09:28:52 +0200
X-Gm-Features: AVHnY4IdlNJa8ULa_nV5bQGGMfnBg0g--1q4HCvFojE97T6XYlkuIA50XHTPeH8
Message-ID: <CANNYZj-Jou5mg=-57omtthGH1s3Jq3ezz0KGA2NtCJVeh6tyiA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3: sanitize userbase in _sysconfig_vars
 JSON to avoid host path leak
To: bin.cao.cn@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 07:29:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238117

I wonder if there should be a qa test for what gets installed that
checks such $HOME leakage. It breaks reproducibility, for example, but
Yocto AB builds everything under one user, and so won't catch it.

Alex

On Thu, 4 Jun 2026 at 07:02, Bin Cao via lists.openembedded.org
<bin.cao.cn=windriver.com@lists.openembedded.org> wrote:
>
> The _sysconfig_vars__linux_x86_64-linux-gnu.json file contains a
> "userbase" field that is populated from the build host user's $HOME
> at build time. This leaks the build host user's home directory path
> into the target rootfs.
>
> The existing py_package_preprocess() cleanup for this JSON file only
> strips known OE build path prefixes (STAGING_DIR_TARGET, RECIPE_SYSROOT,
> etc.), but the userbase value comes from the build user's $HOME
> environment variable which doesn't match any of those patterns.
>
> Set userbase to an empty string in the packaged JSON. This is safe
> because at runtime, sysconfig.get_config_vars() always recomputes
> userbase by calling _getuserbase(), which resolves the actual target
> user's ~/.local path dynamically. The static value in the JSON is
> never used for runtime path resolution.
>
> Signed-off-by: Bin Cao <bin.cao.cn@windriver.com>
> ---
>  meta/recipes-devtools/python/python3_3.14.5.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/python/python3_3.14.5.bb b/meta/recipes-devtools/python/python3_3.14.5.bb
> index 2f821b130f..cc18e13747 100644
> --- a/meta/recipes-devtools/python/python3_3.14.5.bb
> +++ b/meta/recipes-devtools/python/python3_3.14.5.bb
> @@ -390,6 +390,7 @@ py_package_preprocess () {
>                  -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
>                  -e 's:${RECIPE_SYSROOT}::g' \
>                  -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
> +                -e 's|"userbase": ".*"|"userbase": ""|g' \
>                 ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfig_vars*.json
>  }
>
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#238114): https://lists.openembedded.org/g/openembedded-core/message/238114
> Mute This Topic: https://lists.openembedded.org/mt/119641392/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

