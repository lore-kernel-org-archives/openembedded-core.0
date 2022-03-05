Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5424C433EF
	for <webhook@archiver.kernel.org>; Sat,  5 Mar 2022 01:57:30 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.1945.1646445449671826555
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 17:57:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dzsJYyCw;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id kc12so1278493qvb.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 17:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YDHBO2+mVQGhxXGrkeOMMKZBsei/DhErt1KH4Bqkugg=;
        b=dzsJYyCwn27vj8XJ6no6k3i1jtvkEi0IptZKjVCdGEkfgBacga2b0C1yZvHow5DXVw
         xPnL/zRKa0lEnZ8KIJzUg+WT33HILrdQ1DZZqS3LrqtR6KMl7SuRciHFJjNdI82lROQi
         /VODU0tgKcjMXsvcSKp7CeamSmAaPf/P5T/1ClD3eMYE1Gua0UzoavbSHKwBQx4i0HQx
         mgCw2u7Z+umjO66XHKjE7bZcCkMDmeHsA6Ye2t+A4zflYUImTGikfRddNcMwwcnRfuyx
         gec6kDO+VWf9L+bOALT2ZEHOoiwPbkIDJOHb3lvdEFx13f2+7d+VjCp8kMFN+JjvKcnr
         XzHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YDHBO2+mVQGhxXGrkeOMMKZBsei/DhErt1KH4Bqkugg=;
        b=hsVcoLOvSeYcxCgq8/rKOoLu8M+23SZNhGuOsaFKb/UIccVHmH6t5jP0wF+wWc32RT
         IN0er3nfEl3ETqxr8tA/TwzOgzNip/H9MBE/wk9De5WC+8OW1szkMIc5zOKoTT1zG9AR
         UCO4QWRzsqgFGYGOmmzEm++E3Ji3FsKafpVAzD9JJ1yituWiRB8HCW63KyXXIxCom+If
         aO7fR9HQPS1lXAziKUxI8ge5IIdLho+HV7nRsHguGfOzUM95pOpAtmcHV5gFrW9Krp/P
         pqsIpW81Q+momYdXGbq+y0Q8OBppjekzjMLaadjnLL5OAJMXo/2AU5IFpxe4pa9+Indm
         TzUQ==
X-Gm-Message-State: AOAM533lpb8FeqsoAv1KIltUuheKPI4U7mAnZ4Uw1Wpk7DMfaaQwhcfk
	ZSBJMGkcV++L0PtXwVUG+S8aF1jkvRWc7exyYoE=
X-Google-Smtp-Source: 
 ABdhPJy57FVs0m1+LVld+chAogG9vMN0AzpZhsMAnVd4dZ8i3HN0lqlcqC+K2mDjE1Cue72GazF9ACwkTq3u3RwGs60=
X-Received: by 2002:ad4:574a:0:b0:42b:ef56:c2a4 with SMTP id
 q10-20020ad4574a000000b0042bef56c2a4mr1174764qvx.16.1646445448571; Fri, 04
 Mar 2022 17:57:28 -0800 (PST)
MIME-Version: 1.0
References: <20220304171408.2672507-1-ross.burton@arm.com>
 <20220304171408.2672507-3-ross.burton@arm.com>
In-Reply-To: <20220304171408.2672507-3-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Mar 2022 17:57:02 -0800
Message-ID: 
 <CAMKF1sqsb7qGrGYuAC6v-scJ4rR-4XaCVJFdkhKus0TwhcjQkg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] pip_install_wheel: clean up
To: Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Mar 2022 01:57:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162775

This is causing some install failures in meta-openembedded see
last five recipes in this batch

https://errors.yoctoproject.org/Errors/Details/651080/
https://errors.yoctoproject.org/Errors/Details/651082/
https://errors.yoctoproject.org/Errors/Details/651083/
https://errors.yoctoproject.org/Errors/Details/651084/
https://errors.yoctoproject.org/Errors/Details/651085/

These are the same failures across architectures and libcs.



On Fri, Mar 4, 2022 at 9:14 AM Ross Burton <ross@burtonini.com> wrote:
>
> There's been a lot of work in this class lately, so a little spring
> cleaning is needed.
>
> Remove redundant creation of PYTHON_SITEPACKAGES_DIR, pip will do that.
>
> Remove redundant export of PYPA_WHEEL.
>
> Simplyify recompile code using "realpath --relative-to".
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes/pip_install_wheel.bbclass | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
>
> diff --git a/meta/classes/pip_install_wheel.bbclass b/meta/classes/pip_install_wheel.bbclass
> index 3beff685bb..1870b916fe 100644
> --- a/meta/classes/pip_install_wheel.bbclass
> +++ b/meta/classes/pip_install_wheel.bbclass
> @@ -20,29 +20,20 @@ PIP_INSTALL_ARGS ?= "\
>      --prefix=${prefix} \
>  "
>
> -pip_install_wheel_do_install:prepend () {
> -    install -d ${D}${PYTHON_SITEPACKAGES_DIR}
> -}
> -
> -export PYPA_WHEEL
> -
>  PIP_INSTALL_PYTHON = "python3"
>  PIP_INSTALL_PYTHON:class-native = "nativepython3"
>
>  pip_install_wheel_do_install () {
>      nativepython3 -m pip install ${PIP_INSTALL_ARGS} ${PYPA_WHEEL} ||
> -    bbfatal_log "Failed to pip install wheel. Check the logs."
> +      bbfatal_log "Failed to pip install wheel. Check the logs."
>
> +    cd ${D}
>      for i in ${D}${bindir}/* ${D}${sbindir}/*; do
>          if [ -f "$i" ]; then
>              sed -i -e "1s,#!.*nativepython3,#!${USRBINPATH}/env ${PIP_INSTALL_PYTHON}," $i
>              sed -i -e "s:${PYTHON}:${USRBINPATH}/env\ ${PIP_INSTALL_PYTHON}:g" $i
>              sed -i -e "s:${STAGING_BINDIR_NATIVE}:${bindir}:g" $i
> -            # Recompile after modifying it
> -            cd ${D}
> -            file=`echo $i | sed 's:^${D}/::'`
> -            ${STAGING_BINDIR_NATIVE}/python3-native/python3 -c "from py_compile import compile; compile('$file')"
> -            cd -
> +            nativepython3 -mpy_compile $(realpath --relative-to=${D} $i)
>          fi
>      done
>  }
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162746): https://lists.openembedded.org/g/openembedded-core/message/162746
> Mute This Topic: https://lists.openembedded.org/mt/89553658/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

