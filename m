Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D5BC433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 17:15:10 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.68.1646846097356989485
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 09:14:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E69U+4P6;
 spf=pass (domain: gmail.com, ip: 209.85.160.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id a14so2410030qtx.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 09:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PUDZAUP8KfcKLeZuuiOrW/by7Oo89vW7apLNcV7Cj44=;
        b=E69U+4P64RCr31GCQZki2TiN3AcnHVlocURh0Gip8TpJ5FUreFG7jx9Keu2tl+NaYg
         p0I6JKnaEtBaBWQZKrIOGJXqwfX6ElQ2TbnNThyxbkjnolLzV2z6tBn1z01mUHXQX9+j
         KXVxU2XEYCLi5B5yFk3h0mg5mV0USvSq6kmDftj0TNSoNwAIvXKirS7M8ueVbnLMN1TG
         PMaCRmtcADLyh1sCJXcoLV32Ayv3BlCesYCuDzvqboxeqwsQ410kvMjq7b4WwymDL19k
         8S4EcJ9BP4KacmF838pPgxXHewrUXhjOCtL7Bjm+GRWI4foFJCh7swn3+nG7lqopbm7b
         0ruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PUDZAUP8KfcKLeZuuiOrW/by7Oo89vW7apLNcV7Cj44=;
        b=330KjVRBiXQbtjudUPmHMz7xN6ke/8AKs/dMBuoGDSZWWXtONtnkdqyKMCc0z5rGFU
         AG4URgX8kfo40JM7oGJji8aH5LOQhh5o4yAIHOuyFAibFgWaOqY3P1YntfutjI/ztl8S
         CBlLVHnz/jtmz7880OmhHfLg4KXgZnzQawOsAXsp47yV/WxE0ibCDxDCbXmAfj/KyQra
         JfI/v8vMvXfSO8pSGKwiWil0R+wbUv4gvomrk0raYqf9PNdp9yp5dW/yT5csNrYphvSP
         FT2OKOxXb7J2yPV5s2Vf+lDBY63EQT5LFT+J7b0ffGnMVK8I40iSZv67UpFEPZKeWBEM
         bOvw==
X-Gm-Message-State: AOAM532MnQNnjuITXd/+I5c/4ubR4Np/835k5tPHKlI02IOfvdasO99G
	mmn36OEu3rNBjzxNP77xW9u5InMPIfaLNtVH2J/fARif7aE=
X-Google-Smtp-Source: 
 ABdhPJxyigmPzwAP14TqOnSD+BY0VhnKtMgoowAQK7JYN/E+PN+MSz/gvLx83EnY7psGWkYx0F6qcbocVEenBrytkdU=
X-Received: by 2002:ac8:7dd0:0:b0:2e1:a2c8:7dc1 with SMTP id
 c16-20020ac87dd0000000b002e1a2c87dc1mr609956qte.532.1646846096302; Wed, 09
 Mar 2022 09:14:56 -0800 (PST)
MIME-Version: 1.0
References: <20220309165113.2757010-1-ross.burton@arm.com>
In-Reply-To: <20220309165113.2757010-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Mar 2022 09:14:30 -0800
Message-ID: 
 <CAMKF1spVGtp8pcZHwcmQ=XV536Y5aJyVyO9YrtmN_s20_tqRZA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] pip_install_wheel: install wheel with a glob
To: Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 17:15:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162981

On Wed, Mar 9, 2022 at 8:51 AM Ross Burton <ross@burtonini.com> wrote:
>
> Now that the build systems that use pip_install_wheel are all building
> their wheel into a directory that we knew was empty before, we can just
> install *.whl and not need to know the precise names.
>
> By design a pyproject.toml will always build a single wheel, so there
> shouldn't be any way for this to end up installing more than expected.
>
> This obsoletes PIP_INSTALL_PACKAGE and PYPA_WHEEL, neither of which are
> needed anymore.
>

this looks a better approach, we can unbold ton of workaround on
meta-openembedded with this

> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes/pip_install_wheel.bbclass | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
>
> diff --git a/meta/classes/pip_install_wheel.bbclass b/meta/classes/pip_install_wheel.bbclass
> index 954a6b750f..3861dae75a 100644
> --- a/meta/classes/pip_install_wheel.bbclass
> +++ b/meta/classes/pip_install_wheel.bbclass
> @@ -1,20 +1,10 @@
>  DEPENDS:append = " python3-pip-native"
>
> -def guess_pip_install_package_name(d):
> -    import re
> -    '''https://www.python.org/dev/peps/pep-0491/#escaping-and-unicode'''
> -    name = d.getVar('PYPI_PACKAGE') or re.sub(r"^python3-", "", d.getVar('BPN'))
> -    return name.replace('-', '_')
> -
> -PIP_INSTALL_PACKAGE ?= "${@guess_pip_install_package_name(d)}"
> -
>  # The directory where wheels should be written too. Build classes
>  # will ideally [cleandirs] this but we don't do that here in case
>  # a recipe wants to install prebuilt wheels.
>  PIP_INSTALL_DIST_PATH ?= "${WORKDIR}/dist"
>
> -PYPA_WHEEL ??= "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-*-*.whl"
> -
>  PIP_INSTALL_ARGS = "\
>      -vvvv \
>      --ignore-installed \
> @@ -29,8 +19,14 @@ PIP_INSTALL_PYTHON = "python3"
>  PIP_INSTALL_PYTHON:class-native = "nativepython3"
>
>  pip_install_wheel_do_install () {
> -    nativepython3 -m pip install ${PIP_INSTALL_ARGS} ${PYPA_WHEEL} ||
> -      bbfatal_log "Failed to pip install wheel. Check the logs."
> +    COUNT=$(find ${PIP_INSTALL_DIST_PATH} -name '*.whl' | wc -l)
> +    if test $COUNT -eq 0; then
> +        bbfatal No wheels found in ${PIP_INSTALL_DIST_PATH}
> +    elif test $COUNT -gt 1; then
> +        bbfatal More than one wheel found in ${PIP_INSTALL_DIST_PATH}, this should not happen
> +    fi
> +
> +    nativepython3 -m pip install ${PIP_INSTALL_ARGS} ${PIP_INSTALL_DIST_PATH}/*.whl
>
>      cd ${D}
>      for i in ${D}${bindir}/* ${D}${sbindir}/*; do
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162975): https://lists.openembedded.org/g/openembedded-core/message/162975
> Mute This Topic: https://lists.openembedded.org/mt/89666433/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

