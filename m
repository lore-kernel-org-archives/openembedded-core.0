Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E89DC001DE
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 10:31:13 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.17129.1690281067372786192
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jul 2023 03:31:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=D094Cp4t;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2b9a828c920so4221181fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 03:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690281065; x=1690885865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rEiiC7fUTyaeWdbCrhxYlOtinnBxHQhRnJMdr5C1Krs=;
        b=D094Cp4tPdK6H+dMC87CBrzvOkGSJPLq270hKaUWuupDkZ7oFUFV93YkTtQrUoHxeZ
         CMIOBqpICzu+w3XhKlfI5xLlXbNszObcTZluD7xt+5TgB85NPX3fEF0ewXAIHFkuFDkM
         acVEGZ1NFKFxffMitBknklLMSTSTQqzYbdB9g8Y638hVvpamZSIguWGOZSsED/rzFMtl
         TTxidUflDJU4tyNLrQSKBYh9uksnuJjxttI6OGD2RC+SvX1Wt0XgPDXioTITVOOJT6sK
         4bO8qt4ckE7lsaw6wndkY2DODbaPrKGzYZvfJOXnRajYxvew31cYbY7vQYG98NVbsi/h
         tWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690281065; x=1690885865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rEiiC7fUTyaeWdbCrhxYlOtinnBxHQhRnJMdr5C1Krs=;
        b=fkfzgBHmyky1XY011YAnI9F88GxgpS8uciukl4yGPyTRN8NjL/7FoUGdN4spm1wK1A
         0sn8iL7OFjpRdMKZxt4rszZ/+FegqmtUJUt3z6NI4HzwKT/as/jKBT+gTfDyfOfgWwgY
         EAtS10OOLQ5ZxVDsipBklgVH6oeRJFBZpewXjFPs2brCytXBWIByAjY6sLjbcmAHAubK
         1507xaEySCCDlTHCiQN5glBIqVE2g2908IyxpGB/7GUrXEeRf4wihHJSKGHDPGZ20Sn8
         QY0DLZKoeuLNoW8wtRxlmu9KKupgsS4/s6pmHlSs/ZO8Ujo7HT2F4vkG4l3iWzC8+YO+
         fPug==
X-Gm-Message-State: ABy/qLYTspN/o1OALf7dzoiDtn/9HoWiD7SXtrmV5FBEExmtjLuiUAtZ
	ysGPBJ4e/lsGn8nvCBWlajrT4z0K8w/M6ab/ySY=
X-Google-Smtp-Source: APBJJlFU/HebApGmJNvWNvO/ct4Lkiwv3ynakIM/6EyCzja/44qrUt3sZ6+T7XFyvdx3ubToXv4JlE69jLNt1hymlWw=
X-Received: by 2002:a2e:9043:0:b0:2b6:daed:494f with SMTP id
 n3-20020a2e9043000000b002b6daed494fmr7414085ljg.35.1690281065195; Tue, 25 Jul
 2023 03:31:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230724123529.288581-1-zboszor@gmail.com> <CANNYZj9FLbQxnbhd-Lzcr5GB3Ycf+35O1eADZ51EuVNg-eN33A@mail.gmail.com>
 <CANNYZj8HRnoCSBax5VzHU+xU+=XqeS3gF_ys_jFzJYs2+MivwQ@mail.gmail.com>
 <3040946c-5697-d6f5-567c-7bb85f8e0c49@gmail.com> <CANNYZj__RUD=T7qgBpAmNs5K9Qf1hgFkjeqnsm_04yAQJkxQow@mail.gmail.com>
 <79529556-5b85-c8b5-1145-177c741f9da4@gmail.com>
In-Reply-To: <79529556-5b85-c8b5-1145-177c741f9da4@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 25 Jul 2023 12:30:53 +0200
Message-ID: <CANNYZj92V90ADfPLOwT2QEkm9JyE4aDWM7SFCPO6JpFVbE7xqw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rpm: Install and/or tweak rpm macros file to
 make rpmbuild work
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Ross Burton <Ross.Burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 10:31:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184834

On Tue, 25 Jul 2023 at 12:27, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbosz=
or@gmail.com> wrote:
> I have a working recipe change based on
> https://github.com/rpm-software-management/rpm/pull/2579 (for 4.18.x)
> https://github.com/rpm-software-management/rpm/pull/2580 (for 4.19.x)
>
> I will send it soon.

I'd want to see what rpm upstream says. Maybe we're doing the whole
platform macro thing wrongly.

Alex

