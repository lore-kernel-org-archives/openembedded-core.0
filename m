Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE373C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 15:56:56 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web08.11098.1646927815097228433
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 07:56:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=2IUteTqz;
 spf=pass (domain: burtonini.com, ip: 209.85.128.44,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f44.google.com with SMTP id
 m42-20020a05600c3b2a00b00382ab337e14so5729240wms.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 07:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9OPjHFEmgAQ7K/aRO7MHkxIWP3SKw9zD48hWQvOArr0=;
        b=2IUteTqzoonoOTFwXDoMyKAHAUi2xBUkZMar9Nu5IqHG1jaeySWfybkxJlsk0nKqfS
         RuSF7btEO6MdVQB43MJDU4jGRD2MccdUl2Xmz2x5ILzLVQA++PtAeQhvJ8Wmsu8fS5iE
         YeqJIO5ZJu2uhhzxcHwIow6gqgZ/FgHBJ9Sffq477KFb3sMrDpQPxTOxJitUM0o7e616
         u/LniHbqB5E1koTJPXE7PEg0nqP/lu5IefwJkPOWSMTalyT6C0HnorZNQOQ5I7L0X9S/
         Q3G4HfbVaPrn6zWISK5d7hUvzqfdPLqZNgLWIzcRScB4NnhKsIFF+lQm1w9YmiT1Y3Qc
         wiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9OPjHFEmgAQ7K/aRO7MHkxIWP3SKw9zD48hWQvOArr0=;
        b=LXbqs6bPitg0oVljYfUdu6//VNBGUezdm+864kagGUr13J0jsGcNGwmrcpVgNZpqSR
         ZeTBIUFl9j8U53pNPflIfvy1O4SX59WL0uf8NUb4ISkKqaYaqRXdfL8XnvjMenSdFk6o
         K7OSYbV5BoKlx2S2qUqt0FFrszS6pC0d2681iQZ2T5L1WzFGA5xLtxOiQZ19TDap+7Nf
         iuv1mF2YQvlhjW865riz6NRoH2+bAtxMWUMS/oPY9oS2fhZ6zD3x3v47pQEBX5RjFU8O
         TPydH9nRDOLAzDnV/ov4ujNiPZgHBFsLd8fzyv1qQetHMNrzx1tw8xrvF876DiyMmSje
         VZ3g==
X-Gm-Message-State: AOAM532tYKcX9ZbAUJthq9EICoumh0Fhlw7G1jIgCRRS77iRTdP14FKo
	mp1ACvP2L4ggVsKs8pmV8+7kfm3VK5aNsHC4okUecg==
X-Google-Smtp-Source: 
 ABdhPJxsIgVRZ9o4rbUIsvdVyaINg6vFB7vkmyYc0H/hUN1TfOzgaHHaUFsc4jyZYO6D7cz/QnVAAyu/Cn6CVx2+KWg=
X-Received: by 2002:a05:600c:2219:b0:389:bc8b:ac48 with SMTP id
 z25-20020a05600c221900b00389bc8bac48mr11925016wml.14.1646927813543; Thu, 10
 Mar 2022 07:56:53 -0800 (PST)
MIME-Version: 1.0
References: <20220310114035.2226442-1-ross.burton@arm.com>
 <AM9PR09MB4642CA1CCF4C29F109985C76A80B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CAAnfSTuga12XF0fDUAgpm0u0ryh4=L7f2bn4VHmiArusSo=hQA@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTuga12XF0fDUAgpm0u0ryh4=L7f2bn4VHmiArusSo=hQA@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 10 Mar 2022 15:56:42 +0000
Message-ID: 
 <CAAnfSTvgWdVtgW+GTqA8vCm0ANP330MJW302uFr=OFHDBbusPw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] pip_install_wheel: add a generic do_install
 for bootstrapping
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 15:56:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163031

On Thu, 10 Mar 2022 at 14:01, Ross Burton <ross@burtonini.com> wrote:
>
> On Thu, 10 Mar 2022 at 11:48, Konrad Weihmann <kweihmann@outlook.com> wrote:
> > > +pip_install_wheel_do_bootstrap_install () {
> > > +    install -d ${D}${PYTHON_SITEPACKAGES_DIR}
> > > +    unzip -d ${D}${PYTHON_SITEPACKAGES_DIR} ${PIP_INSTALL_DIST_PATH}/*.whl
> > > +}
> >
> > I think these two lines could be moved into a generic do_install:native
> > - and then removing all the override code from the recipes below.
>
> There's only a few recipes which need this bootstrap, 99% of native
> recipes can use pip: it's just flit_core/pip/setuptools/wheel which
> can't as they're needed to build pip itself.
>
> (and once installer is used instead of pip, it's just installer and flit_core)
>
> I may send a v2 to this, as we should be byte-compiling the bootstrap code too.

I won't send a v2 as this causes interesting problems which are not
easy to fix...

Ross

