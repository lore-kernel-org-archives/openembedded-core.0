Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E34D7C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 13:36:44 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web09.5614.1657200994580122134
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 06:36:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qlInfE6f;
 spf=pass (domain: gmail.com, ip: 209.85.208.172,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id r9so22252962ljp.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 06:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MAaJR6DAgn/jVF/G6Qr0/imCRM1phR42e/O9Fl+8Xy8=;
        b=qlInfE6fxwcQ4R/JL4bNEuhWqfIbc0QWQYqYVwsxD36pqCCwJV4++Yja6hoYwpVEQ9
         baBiIJYkrhKDIowLvi5fCNI9+qwdski0loRbrFyMKBlrIN9sPwywET41SMwx3k60BuGD
         SUiDOBToL+0DQc0lRVCsXt1lwjJNVIsSgt4TmCbXGjfG0Jj7yXJ8AJrkksqYN4nXOekq
         6uPYYwcJ35pIHn8/TLeL4mnHx80eT9USqZTRC0H8rNfCtGXx53oQZ1DBah0wHrulVAJS
         vXn6kwB6MoUqypO+RgJYIp4JxEFMKtl7vb1avKWFXompuu40thh1dbLsfwadMo2MyQ8S
         fm1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MAaJR6DAgn/jVF/G6Qr0/imCRM1phR42e/O9Fl+8Xy8=;
        b=rJ84VjKIzlVoY/wdRkVORFR3EDRisjWsdIUkXzm5amDIEUMHvnncTmBY01DLzHXYJy
         +gN+hgvCl8r9ztAwcBNUSwItJH8VM7HMEcQHC3GGQNjjR7fnxDLCnl8+RTEYo5W1LJoS
         tL0h0rZiGLWnmBz7k/XLg2GxEJy0HKCCYYsXv3zxEA11VtvfO8Ocrb5qqEwFGQBrzGTO
         DthkxQ8jHK5a4p3/GvtB+FRqZLWdTmtlwmHB6bzDQsx4nZewzlpe6Z769jQd8RySS6u6
         OVkwarEEJmyfda/V8wg4o3v7KoMxw8/TPKbcjgiBlEUCvcF8MMwF7crbvlnd6xoSylSo
         RGyQ==
X-Gm-Message-State: AJIora8/qYQ0X8RTDD2aHApZVNewnPNJep1Bs3+UponRXI2a4lHPXCRr
	zulqI8QDqAbS7AQHbkaa/Mg+gikowEtOep98T2k=
X-Google-Smtp-Source: 
 AGRyM1vHgliR0U9p41PTXja5mA5znlsQjlldQfPUp8hCrJ71rMApETVuEsxUSFzmRH8vUhxkGqTuRu9+DHfX7sujHOQ=
X-Received: by 2002:a2e:9882:0:b0:25b:eb1e:8d with SMTP id
 b2-20020a2e9882000000b0025beb1e008dmr26979651ljj.41.1657200992741;
 Thu, 07 Jul 2022 06:36:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220706182329.3085564-1-alex@linutronix.de>
 <d04fa3ca7398489a99f8356b17f1174a@axis.com>
In-Reply-To: <d04fa3ca7398489a99f8356b17f1174a@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 7 Jul 2022 15:36:20 +0200
Message-ID: 
 <CANNYZj-Dtx6ETvTTgtJUE6Eizn-S=vm=Oug=cB3zRsQCC7AM=g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] scripts/oe-setup-builddir: copy
 site.conf.sample out of template directories (if it exists)
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 13:36:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167779

On Thu, 7 Jul 2022 at 15:26, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:

> While I can't speak for others, this change will break our build environment.
> We have a global site.conf file in an NFS directory that everyone use. It
> contains all proxy settings and similar that are required to build inside the
> corporate environment. Copying a dummy site.conf file into the local build
> directory will prevent the global file from being used.

Then you need to create a configuration template that is specific to
your company first, and there's a convenient command to do that
provided in patch 2/2. Setting up a build directory from standard poky
or oe-core templates (which I presume is how you set up builds) does
not hold a promise that what is being copied will not change in
potentially breaking ways.

Alex

