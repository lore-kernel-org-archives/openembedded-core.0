Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E62C433F5
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 11:08:52 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.10173.1652267324174585888
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 04:08:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o8AJDQXO;
 spf=pass (domain: gmail.com, ip: 209.85.167.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id y32so2907871lfa.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 04:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t1db5npQzi91+PdK50WLklIUafJXAR2u5QBTLC17L74=;
        b=o8AJDQXOXhFY0K+6PPX4oQixj8Q/tHeRpXeuHKXqw8EczhP+g9pVDNl1sSFdLImx5j
         RpGGTMk8wyJvVJl3BqdHWhKWa+sOcrwQtNclmk8FVBohWYN3Hpfvnek4KZ2TQpdOnl3X
         gTMSPiXS1BEa8/mExlxlsYjrSgGBbGxxjeOiJuDbuQ+e353o7u4E76HI0NdvjeeL8BVw
         iqDUShg275xgV6qj7hj1CLkjuNUxHaTHOQpxb+rqnrRaoVvP7yIyIrlGUVhvMzeHcFrf
         AknDcUKu7iME4BgJ42dnijIAWwaSZIquf05QB9TtEMEShFhM1xVkG5vK6OOD0KOzuroE
         jT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t1db5npQzi91+PdK50WLklIUafJXAR2u5QBTLC17L74=;
        b=4tvNTBoJr1ch29VxU9vPYTvU4oLL5TyiG3ppq+TlnBqo0i54jomIp02DyDj4wSlILS
         SKG+Yjg1mJOLQFD9ibuQw7rTd4Qy1a2/i6jbMVerWQvc4fwjzT9BITzW8TvngI0h8OkB
         XuNa8EX2+jH9DqdR99z38qEgglhTTDucOYjbRb+K3gTK3dn39YcIO0SzsFBo7PkLHkXp
         ptevKnS8Liowiw0clAwZYf0ABIjgsCUdreUMi4iFcN5+ByCMRRxEEInAx3uptPv2ywtS
         NVxaJ0yU8RUfAGYidI+1u6LVpVJG9NuKoOg3HcbZough1WaPdmVvJf9u7mGw4mGk1FOC
         YdaQ==
X-Gm-Message-State: AOAM531KCEcjKAsgp4anWHr1n1hzcWcDN3up0xUVQcdFO7/bPPVfCBT/
	hR4oZiVZTlba0bT3GipWJm5xGfxxnKaGTxwzrYf83TEvksg=
X-Google-Smtp-Source: 
 ABdhPJyBAMY5Oc2N3c/oDBNI0qNvAxyd1AUd0egui+y+Vgb447CyumPwX1GwCljyVt9gvllr/fSXZnYHvGUVkrDJjWY=
X-Received: by 2002:a05:6512:3047:b0:473:cf43:6d8f with SMTP id
 b7-20020a056512304700b00473cf436d8fmr20502407lfb.380.1652267321996; Wed, 11
 May 2022 04:08:41 -0700 (PDT)
MIME-Version: 1.0
References: <1651808269-3775-1-git-send-email-leimaohui@fujitsu.com>
 <CANNYZj96-SMiUCmTMhZ3uoLSHN8mH0js6e2k2JJQOW3Tp3MV5w@mail.gmail.com>
 <OS0PR01MB6178F9B577423A035BD3CCDDA0C49@OS0PR01MB6178.jpnprd01.prod.outlook.com>
 <CANNYZj_wg3r2smGwNVoN34L0ai-pPjPEfjg0P7LoQEirfL8rhQ@mail.gmail.com>
 <OS0PR01MB61785EBD9D1441B3201AC1A2A0C69@OS0PR01MB6178.jpnprd01.prod.outlook.com>
 <CANNYZj_K42tgo7kRVV4fOHkFXQBxEs86KdGBX_vbYsahip9FVg@mail.gmail.com>
 <OS0PR01MB61786F05D3748BC41FBC3CDBA0C99@OS0PR01MB6178.jpnprd01.prod.outlook.com>
 <CANNYZj9-xW5_mEh1UTyX_AJ=nVbsN4LOhTGjYGVRvZjLH7=skg@mail.gmail.com>
 <OS0PR01MB6178F55D656ACB5989CB03D9A0C89@OS0PR01MB6178.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <OS0PR01MB6178F55D656ACB5989CB03D9A0C89@OS0PR01MB6178.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 11 May 2022 13:08:30 +0200
Message-ID: 
 <CANNYZj87uzyMMsM32Y=_aiGagfm9ZG+yzcmLqRq1BMTXQm7VZA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] gnutls: Added fips support option.
To: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 11:08:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165496

On Wed, 11 May 2022 at 10:15, leimaohui@fujitsu.com
<leimaohui@fujitsu.com> wrote:
> I got it. It seems an unusual method because there is no recipe using this way in .
> In this way, it means that if user want to enable fips, the following PACKAGECONFIG should be added in recipe.
>
> PACKAGECONFIG:append:class-target = fips
> PACKAGECONFIG:append:class-nativesdk = fips
> PACKAGECONFIG:append:class-target = fips-native

Yes, this should be fine. You can add a comment in the recipe
explaining how to do it.

> So, I'll send a v3 patch in this way, is it ok?

Yes please. The real problem here is that gnutls upstream didn't
consider how fips build is supposed to work in cross-compilation,
so you should also file a ticket with them and hopefully discuss how
the problem can be properly solved.

There are two options:
- do what your patch does and use the needed binary from the host
system, subject to ./configure flag.
- build the needed binary twice, first for the host (using BUILD_CC),
then for the cross-target.

Alex


>
> > -----Original Message-----
> > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > Sent: Wednesday, May 11, 2022 1:40 PM
> > To: Lei, Maohui <leimaohui@fujitsu.com>
> > Cc: OE-core <openembedded-core@lists.openembedded.org>
> > Subject: Re: [OE-core] [PATCH v2] gnutls: Added fips support option.
> >
> > On Tue, 10 May 2022 at 02:54, leimaohui@fujitsu.com <leimaohui@fujitsu.com>
> > wrote:
> > > I'm afraid I'm not quite with you. Searched poky by the following command and
> > there is no example about how to config PACKAGECONFIG[xxx] for target or
> > native separately.
> > > The result is all about how to config PACKAGECONFIG for target or native.
> > > ----------------------------------------
> > > $ grep -ir PACKAGECONFIG *|grep class-native
> > > meta/recipes-support/libcap/libcap_2.64.bb:PACKAGECONFIG:class-native ??=
> > ""
> > > meta/recipes-support/vim/vim_8.2.bb:PACKAGECONFIG:class-native = ""
> > > meta/recipes-support/sqlite/sqlite3.inc:PACKAGECONFIG:class-native ?= "fts4
> > fts5 rtree dyn_ext"
> > > ......
> > > ----------------------------------------
> > >
> > > But I think you mean not PACKAGECONFIG but PACKAGECONFIG[fips]. For
> > example, in libcap_2.64.bb file:
> > > $ cat meta/recipes-support/libcap/libcap_2.64.bb
> > > ......
> > > PACKAGECONFIG ??= "libidn  ${@bb.utils.filter('DISTRO_FEATURES',
> > > 'seccomp', d)} "  //not here ......
> > > PACKAGECONFIG[fips] = "--enable-fips140-mode
> > --with-libdl-prefix=${STAGING_BASELIBDIR},--disable-fips140-mode"   //Your
> > comment means modify here
> > > .......
> > >
> > > Did I misunderstand?
> >
> > Sorry, it's always a bit confusing with PACKAGECONFIG, as the keyword is used for
> > two different purposes.
> >
> > What I meant is something like this:
> >
> > PACKAGECONFIG ??= "fips"
> > PACKAGECONFIG:class-native ??= "fips-native"
> >
> > Alex

