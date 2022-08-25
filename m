Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF43AECAAA2
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 21:07:11 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.29575.1661461624640778247
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 14:07:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qjMbe7YO;
 spf=pass (domain: gmail.com, ip: 209.85.128.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-333a4a5d495so572548067b3.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 14:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=MHvDx4mZn6U8l1Caw9MiPacj1Ey83Hb/aBNttCiRI4s=;
        b=qjMbe7YO4ohEml9XIJ0X0BQUF58jHXBoj6MDnT6i7PjEHnnt38s5ObPVBjPdGFnH5f
         PLEKFtOjYHaVvjGjnB2+OqLID5lDut4XlFMmkMPhvcoKbqqGX+qIp4h01kmnl6AxFi6e
         eLiGHjqTsZ+ijRL8WqExuZdlx2o4C/QZnpRGRFj49S9kBXrOxNFmZ/u/Imqc4mpatZaa
         gALNb8yT/og0MrxjAXxnrtvisbsTwiGLOSlneX9EL9vq47oyRfBS0dJkRdMSczAe//0+
         WSHKNSVVDh5w6W/y4tqdA7yVaVLaAAtlOsz9MRPBd3tR/sWd+dtmmuAb/HWYE6IKdacT
         NGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=MHvDx4mZn6U8l1Caw9MiPacj1Ey83Hb/aBNttCiRI4s=;
        b=sJ7BCQ6uhrKCJUrDrn/CrYLIU1c1S0U7WEW9j9bhjQZHI3IQsy7vkoD/aTK28wW654
         JSQYE1VccVo/tum9q4AXxeQqqQgHgdhQyqlTHMISiW1y8KxDf+ExWsB7DC6Xjr/+JFaL
         rQFAiqUy0WVNy6S00+s28bWAcSYTOI+3Dh3ZINw+x2Tcd2g4Ab8+/FPQTOTnYj3asTl6
         Xw85TmgRGsEWBRfQ4LFAhzjJQ6hXpVhinlAx2KqXrwSbXV7I0HskrKODY6Nk5WXx68pS
         V0agR2r+1zj3fRsWVXU7JmLDaSL6sJspl6zTPx/huJ+JIjtPlrjDo9StcHeePl9F9vWY
         BKZA==
X-Gm-Message-State: ACgBeo19Jd3J7cTSE24SMlLN+4j+Le5HWIcOxmWgdiL2nzYZaJT5u48R
	477OtJOiweQvQ6v88j2Qul5pINUvVVgOY1WSVJ8=
X-Google-Smtp-Source: 
 AA6agR4NpTfMFLbZk4YS7DKdMXtCKk7/DXKzC1HmhOSZCIr7EAyrY9QdwMvd8xmbOCgyzvlqUdFoBZpRLz+EzRXRq6Y=
X-Received: by 2002:a0d:f204:0:b0:333:c23f:d793 with SMTP id
 b4-20020a0df204000000b00333c23fd793mr5747886ywf.71.1661461623651; Thu, 25 Aug
 2022 14:07:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220825072103.641291-1-raj.khem@gmail.com>
 <20220825223521.04c7284d@booty>
In-Reply-To: <20220825223521.04c7284d@booty>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 25 Aug 2022 14:06:37 -0700
Message-ID: 
 <CAMKF1soNs3Nvw-+Z8-HGunmMhYqbqSb0eC7tCWr5w7mE52=xVA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] apr: Cache configure tests which use AC_TRY_RUN
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 21:07:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169895

On Thu, Aug 25, 2022 at 1:35 PM Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>
> Hi Khem,
>
> On Thu, 25 Aug 2022 00:21:03 -0700
> "Khem Raj" <raj.khem@gmail.com> wrote:
>
> > AC_TRY_RUN macro means the test needs to run to find the result and we
> > are cross compiling so this will always get wrong results, this results
> > in miscompiling apache2 on musl because it disables rlimit
> > (ac_cv_struct_rlimit) wrongly.
> >
> > All these variables are determined with AC_TRY_RUN checks
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> There are several failures with this patch applied:
>
> | locks/unix/proc_mutex.c: In function 'proc_mutex_choose_method':
> | locks/unix/proc_mutex.c:1494:28: error: 'mutex_proc_pthread_methods' undeclared (first use in this function); did you mean 'mutex_posixsem_methods'?
> |  1494 |         new_mutex->meth = &mutex_proc_pthread_methods;
> |       |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
> |       |                            mutex_posixsem_methods
>
> and other undeclared mutex-related symbols.
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/1446/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/3720/steps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/5767/steps/11/logs/stdio
>

Yeah, I will take a look and perhaps trim the list to minimum what we
need for apache2

> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

