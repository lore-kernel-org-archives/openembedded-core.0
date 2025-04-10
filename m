Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F7FEC3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 08:02:59 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.29096.1744272174510911213
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 01:02:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PTzxhiGL;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6f0cfbe2042so5961246d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 01:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744272173; x=1744876973; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HmlYVZOBom79oDfB4yH56SSfJWaUuKHaUM+VlprQg9Y=;
        b=PTzxhiGL0VI5sK1XvGx/+YmAHoT+m62TXKY8YhglbI+egTnCpWNgkmnqdb0GAW69rM
         tKaBYhXlbNximwpk4SzzomC6I1mNcHEcdcO3k75mhREqChOxs/Is/kRawHIqO5BAWzKf
         VrCeU4kKKMc6kJNOMwkhJTXGr9iVhKQ0hhCzw3+aCMtOR8UZCqsy74zV6ZFHosaJHVj1
         Ut/b09C+RZA/Au69LbfTqFMhwOgCPM5qrtEs8c5shg/IlbcR3m2PxG7O8xDW5tBjRkzE
         1IhYTvnDaSN/ctgTCvFiZ4d1xP0GUo44AAY6qevbH8RnLXhkeuGvReSNmvvWJ753ZOH7
         3YAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744272173; x=1744876973;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HmlYVZOBom79oDfB4yH56SSfJWaUuKHaUM+VlprQg9Y=;
        b=f28rJ4FMdyh4+saq5PCQf+Sig0J0iqGuMfgycQ5FD5kdHvPY4zNOsQ/jUswPdw+hIk
         rKNRGRDVyPB5tcrhDghVlsBnLNN2xVUqskLpSHP2F3hHMt7gQ/1m8Xz+vGtyYRTH2tk9
         HQYLXB8yASFA4cffJ4okLrS1Y6DeHLKy9gUYXIVEEcnorrp3POOXZPYi2kjZt6a8xYd0
         RchDCwNgsL5VvNCZ4xDCabSYVlpExwba1RvtftVUDnlOWP/h8t1pgv69bANkyrox0IdG
         mKPbDGmwBtJb2VKz1fExDtfBotYxz9ZKBTUySs+PQMVwj+TLfB3o9x7n222j6/u7VefP
         Q5RA==
X-Gm-Message-State: AOJu0YyQiCWV0Bv/3BJMtQK+aPLwRhYm7SHjRxc4s2SoGB2iEe8gmrLx
	6kgNmpL398zDsFCWD2zYmXrY8HwnQ/wjTYBISWHsKzQ8VHEhA8G5sMswCdL4quFI5W3BHdUIcI3
	KtfSykQBkmVuLflf+YiELuvrg3o4=
X-Gm-Gg: ASbGncvX+g1eB+nrWagNEAo6PHl0URx7v+B4GYA95KJ8rfRcgD4pkJwuyS8QDK8cEct
	kApZrBGm6UguUp9y15zdroRfWYx30ZcsvbiKxgGvGeO1+Wjtu98BZIt2drFge+sQbhpOeb/nHMx
	vFCo3FknBDmUIAfszSKX3Qcod/UU8a/7wfti3vyJX8+ZGW1+aQfdMJGvJZ
X-Google-Smtp-Source: AGHT+IGBEpS+thbKD+sEvwG7AAdD4sFSqjcBiGIzzH3zJGbCEVINSd6S1jeCKla/mTO+2r4RW0k0uG154BLlNJ4y43A=
X-Received: by 2002:a05:6214:b2d:b0:6e4:3478:8ea7 with SMTP id
 6a1803df08f44-6f0e63bea0fmr18871616d6.4.1744272173582; Thu, 10 Apr 2025
 01:02:53 -0700 (PDT)
MIME-Version: 1.0
References: <2c0885e1-8821-4470-8e54-dcad6a241834@hqv.ch>
In-Reply-To: <2c0885e1-8821-4470-8e54-dcad6a241834@hqv.ch>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 10 Apr 2025 10:02:42 +0200
X-Gm-Features: ATxdqUEHC7pb7mTxL5-UFqJnMlVHfhsbU6jUoN1SIz57tPEgsuIMDLsjj-qi5AU
Message-ID: <CANNYZj9qgX5=4Jym0Uq2u5VJcZ89c-MRSU9oiTkUbBvNvfSFtQ@mail.gmail.com>
Subject: Re: [OE-core] python3: Allow to specify which pyc files to keep
To: lw@hqv.ch
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 08:02:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214630

Should we rather just package the higher level .pyc into their own packages?

Alex


On Thu, 10 Apr 2025 at 08:37, Lukas Woodtli via lists.openembedded.org
<lw=hqv.ch@lists.openembedded.org> wrote:
>
>  From d7159cd842fd2a10ba5aeff62877be2ebb2eab87 Mon Sep 17 00:00:00 2001
> From: Lukas Woodtli <lukas.woodtli@husqvarnagroup.com>
> Date: Mon, 7 Apr 2025 11:55:33 +0200
> Subject: [PATCH] python3: Allow to specify which pyc files to keep
>
> The pyc files for a specific optimization level can be kept and are
> installed in the final image.
>
> Signed-off-by: Lukas Woodtli <lukas.woodtli@husqvarnagroup.com>
> ---
>   .../recipes-devtools/python/python3_3.13.2.bb | 32 +++++++++++++++----
>   1 file changed, 25 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python3_3.13.2.bb
> b/meta/recipes-devtools/python/python3_3.13.2.bb
> index 7c36fd92ed..ac74432a2a 100644
> --- a/meta/recipes-devtools/python/python3_3.13.2.bb
> +++ b/meta/recipes-devtools/python/python3_3.13.2.bb
> @@ -217,6 +217,12 @@ do_install:append:class-native() {
>           mv ${D}/${bindir}/${PN}/python*config ${D}/${bindir}/
>   }
>
> +# We want bytecode precompiled .py files (.pyc's) by default
> +# but the user may set it on their own conf
> +INCLUDE_PYCS ?= "1"
> +
> +PYCS_OPT_LEVEL ?= "0"
> +
>   do_install:append() {
>           for c in
> ${D}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py; do
>               python3 ${UNPACKDIR}/reformat_sysconfig.py $c
> @@ -249,10 +255,25 @@ do_install:append() {
>           # so remove it too
>           rm -f
> ${D}${libdir}/python${PYTHON_MAJMIN}/__pycache__/traceback.cpython*
>
> -        # Remove the opt-1.pyc and opt-2.pyc files. They effectively
> waste space on embedded
> -        # style targets as they're only used when python is called with
> the -O or -OO options
> -        # which is rare.
> -        find ${D} -name *opt-*.pyc -delete
> +        if [ "${INCLUDE_PYCS}" -eq "1" ]; then
> +             # Remove only the .pyc files of unused optimization level.
> +            if [ "${PYCS_OPT_LEVEL}" -eq "0" ]; then
> +                # keep only unoptimized .pyc files
> +                find ${D} -name *.opt-1.pyc -exec rm -f {} \;
> +                find ${D} -name *.opt-2.pyc -exec rm -f {} \;
> +            elif [ "${PYCS_OPT_LEVEL}" -eq "1" ]; then
> +                # keep only .pyc files with optimization level 1
> +                find ${D} -name *.pyc -and -not -name *.opt-1.pyc -exec
> rm -f {} \;
> +            elif [ "${PYCS_OPT_LEVEL}" -eq "2" ]; then
> +                # keep only .pyc files with optimization level 2
> +                find ${D} -name *.pyc -and -not -name *.opt-2.pyc -exec
> rm -f {} \;
> +            else
> +                bberror "Python optimization level ${PYCS_OPT_LEVEL} is
> not supported"
> +            fi
> +        else
> +            # remove all .pyc files
> +            find ${D} -name *.pyc -delete
> +        fi
>   }
>
>   do_install:append:class-nativesdk () {
> @@ -326,9 +347,6 @@ py_package_preprocess () {
>           rm -rf ${PKGD}/${libdir}/python-sysconfigdata
>   }
>
> -# We want bytecode precompiled .py files (.pyc's) by default
> -# but the user may set it on their own conf
> -INCLUDE_PYCS ?= "1"
>
>   python(){
>       import collections, json
> --
> 2.43.0
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214621): https://lists.openembedded.org/g/openembedded-core/message/214621
> Mute This Topic: https://lists.openembedded.org/mt/112186823/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

