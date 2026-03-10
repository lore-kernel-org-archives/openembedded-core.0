Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16DD0FD2D71
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 12:50:08 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39251.1773146998444225946
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 05:49:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=mXBzjgpH;
 spf=pass (domain: linaro.org, ip: 209.85.210.171, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-829a27414a3so2323884b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 05:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773146998; x=1773751798; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AJ2Pp0mfQNgkPg7b0yKAy8a2oH6fKbEXjm4TO66BkZo=;
        b=mXBzjgpHByL5uVe12e17r5rZG/FeFgJ1VJF9SZePuBDNN1Z+DEzL9SK7jkpBRNbUl0
         lwHwntyNAYHHlL610pO08JFB2fzCESpIZo3bVfEx/ufi9m/qgY/ECYYOvq5eN4zXUjqx
         9qbVESvUfhh0dGQfHodO6MODlrvTJ4iWGYH0GDmQyRGXMmn+23GU5EGQTjpPQ/u2ZxDL
         MZ0x7XuvI0072h+NyER5U7ArCd5xmtRFKY/K2FRHDOddDrJ2LYJdR8KnZmz93g339Fkr
         4h3yzBZAn7SLPIfj/2o4BN8S1/5tT6PWr1xokCLSZhQNU7NbwKGYlFiaPXi9DrS8lnBv
         tIrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773146998; x=1773751798;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AJ2Pp0mfQNgkPg7b0yKAy8a2oH6fKbEXjm4TO66BkZo=;
        b=EzXULGcdqu10mWcPy5AzIRuogvDdhHwTSQ4agOPpyswpY3xqlNW+44zBJtC2I8X+OK
         /8tDcgufYYrJIZnUaAm02Ad1gOaTBSmB4pA59vkHWw80G/L9ArJmSa/+bZZhv6/0iX/J
         ZXeJYFC5UkzqBpSX2rUqnDPsPA6JdM6HeRwI4AM72zdzp8Y11Apk9oWrP23klbVOsJOn
         0tUv0dIMicgqNse/niOyH1DhfUMeImj3t9GLVtBSlPkYARPabA8z55lcdMTcIkg5TFxH
         dU9ocvlYnpU8ZvJLiSH9COcqZi91WPHGXG5beZ1A3lvXCvhfg9QPaRXO8xjP/9vND+0y
         YGrg==
X-Gm-Message-State: AOJu0YzAwMzx84SXI3yzuHQat4vlh3+zilyoY1lDs3cwE0WG+NvvtxGo
	T95muo515lUlrv/FgwjQ1f+/c9yr4ezyK06BWrRuH6voCRxpzIEaJm9vel59Npbs1ig=
X-Gm-Gg: ATEYQzyVcijm2r+diI2rcHEtpaVAdfGx26yJiG8HFGr9rULcChwlnyObxz7AtAfJM4j
	fjNYwvqHuiQF3bOrhOiB2fH0T4bKrGOxvfmFhZMKPeBlyCefM08iWJyoh2eDMCtZhKM8hKT9RI3
	C2sSmT7efhuuIMhxXwvbrZttbPG1fruUU90iI7ERidGIWGFMVOltLOpnBLrXbr4fbw5jjyvbJNQ
	iOAALPwu8u5NDHtS4KUNNCqw4sFKy26ZOj98fQ/z7xnCOnk8/n/AWMZwBpS+LlvYRp9rXAEKEQB
	dLZEJV7udzxVhpNP4Gd76rq1IGJHoGe3PQKujKV1747kCtSMbQWP5CSiRfVL+EHzUxX9eXzMFi4
	eXkx0iQONA/Uoj91zhM+4dqDqu09V6EnBeun/4fom6FGty6Uz1u2vhQVsQYEYs6Y+pMzXdsZPCA
	gfkAgylvTWx7yDB055ii7efnWTDxA7EhNmZgYILtrCuGuQU2bZ0F6kwIwN
X-Received: by 2002:a05:6a20:c890:b0:35d:7f7:4aac with SMTP id adf61e73a8af0-398590877a4mr14113870637.47.1773146997750;
        Tue, 10 Mar 2026 05:49:57 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e0acde5sm11475881a12.7.2026.03.10.05.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 05:49:56 -0700 (PDT)
Date: Tue, 10 Mar 2026 14:49:53 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] kernel-yocto.bbclass: capture merge_config.sh
 output to task log
Message-ID: <abATcQuhfbPrfcYr@nuoska>
References: <20260310113351.194882-1-mikko.rapeli@linaro.org>
 <CADkTA4Ofx5RBm-Zxa9+8HOT7edDMCSV2RdAf7xcE7MFfN2cHiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADkTA4Ofx5RBm-Zxa9+8HOT7edDMCSV2RdAf7xcE7MFfN2cHiQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 12:50:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232777

Hi,

On Tue, Mar 10, 2026 at 08:41:46AM -0400, Bruce Ashfield wrote:
> On Tue, Mar 10, 2026 at 7:34 AM Mikko Rapeli via lists.openembedded.org
> <mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
> 
> > With https://lists.yoctoproject.org/g/linux-yocto/message/16359
> > updates to merge_config.sh in kern-tools-native the output
> > is useful and not too verbose. Thus capture it to normal
> > do_kernel_configme task logs.
> >
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >  meta/classes-recipe/kernel-yocto.bbclass | 7 +------
> >  1 file changed, 1 insertion(+), 6 deletions(-)
> >
> > diff --git a/meta/classes-recipe/kernel-yocto.bbclass
> > b/meta/classes-recipe/kernel-yocto.bbclass
> > index e53bf1519418..d981ca0e30e6 100644
> > --- a/meta/classes-recipe/kernel-yocto.bbclass
> > +++ b/meta/classes-recipe/kernel-yocto.bbclass
> > @@ -492,14 +492,9 @@ do_kernel_configme() {
> >                 bbfatal_log "Could not find configuration queue
> > (${meta_dir}/config.queue)"
> >         fi
> >
> > -       CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC="${BUILD_CC}
> > ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" CC="${KERNEL_CC}"
> > LD="${KERNEL_LD}" OBJCOPY="${KERNEL_OBJCOPY}" STRIP="${KERNEL_STRIP}"
> > ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs} >
> > ${meta_dir}/cfg/merge_config_build.log 2>&1
> > +       CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC="${BUILD_CC}
> > ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" CC="${KERNEL_CC}"
> > LD="${KERNEL_LD}" OBJCOPY="${KERNEL_OBJCOPY}" STRIP="${KERNEL_STRIP}"
> > ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs}
> >         if [ $? -ne 0 -o ! -f ${B}/.config ]; then
> >                 bberror "Could not generate a .config for
> > ${KMACHINE}-${LINUX_KERNEL_TYPE}"
> > -               if [ ${KCONF_AUDIT_LEVEL} -gt 1 ]; then
> > -                       bbfatal_log "`cat
> > ${meta_dir}/cfg/merge_config_build.log`"
> > -               else
> > -                       bbfatal_log "Details can be found at:
> > ${S}/${meta_dir}/cfg/merge_config_build.log"
> > -               fi
> >
> 
> There are tools built on having the log around in a file. So we can't merge
> this as-is.

Which tools? Why aren't these tools part of oe-core?

Standard practice of oe-core is to have details in task logs. I do not
think extra log locations should be used or logs hidden behind other
variables or switches.

Cheers,

-Mikko

