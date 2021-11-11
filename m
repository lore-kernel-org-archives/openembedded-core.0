Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D73FC433EF
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 18:08:13 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.3456.1636654092098151807
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 10:08:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=7BxtVuB8;
 spf=pass (domain: burtonini.com, ip: 209.85.221.48,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f48.google.com with SMTP id u1so11175548wru.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 10:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=baHfmio5Sg/3ubJkbdBUC78sfByZqPij0kAa6aLEJQ0=;
        b=7BxtVuB8iiCuikH2Xle2YJqEEJeeveEbWU6Tx0BQwOKZrC5i1My0O2scMD8JW6nwt9
         7+IwIeHtFBJfusiBfEB7kif5n1pSF8grHT+vsFLg5vMJJMYJUo2CosqSa6pT74Ua3aMx
         2BvVoSdZhRONQ5H6Qrj5nggDBZCG2qJvTEZrfN8VsaC9sfKj42P+WG7R3em14sGR8I+w
         5Wg2pOhKznUAzVK/qZDenWslNz7NnWNxrA6golZ2AiftJVyu5/HxfyP4mj+52vFTAfHr
         REbWJrkYYPounSgSpQuAgnYssJ6QavjRsH2zTpzR5OvweFmAs/KK9vd5eQaH1/cj8aPb
         jjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=baHfmio5Sg/3ubJkbdBUC78sfByZqPij0kAa6aLEJQ0=;
        b=JhGLr84QGdX44kebEyVLlZFr2/ijhkQQXb6Zfo6VT/EvYFsxdwbUypseCdYHR6ruMi
         EdtbB38MRR9VUSTdh1ulaEhl5TCKzZAVzg8ZloJQEacXajxv94No3PM1kwS584v/qVir
         fyB6zYeT+y04N52t6BME9SsBuGzfy/e5lWKcxn16llUx8sCXoHirwpDK1cEJiJEOSmrr
         p7DIcVu/Sx/QazBaXxMQhYnEy0IISZHHyA4QBaCpjhS6W6mqG15geeUU7SbH9xi0hn+N
         WaVHTHBLTM5LQvOsLWx6vWzcZjNnqFzDZ0kpxHRHn52QUKdml15teROOt7zm2LbzI9lY
         XcbA==
X-Gm-Message-State: AOAM531uYhY3IOfsTEY3KnoSrnv8PncCPTaV593he5Q5tpQvfm0nJFhq
	709S7OoMKYWq1gwPlBd4QlN3D7nSBBq/sVe0gY/ilw==
X-Google-Smtp-Source: 
 ABdhPJxm0T4g0FvtHhwCDI5t4bz1zFtM3Q83lj0n+BJwLWfbCBSiby0UoHbhEshanvj/xw44SA4vsA3Jox3icQ2tFmM=
X-Received: by 2002:a5d:6843:: with SMTP id o3mr10863377wrw.174.1636654090367;
 Thu, 11 Nov 2021 10:08:10 -0800 (PST)
MIME-Version: 1.0
References: <20211111170650.3112950-1-anibal.limon@linaro.org>
 <CAAnfSTs0RK0KnKiQgJF6F83d4QrMs+Rj2q4-bJzenwLx0MVffQ@mail.gmail.com>
 <CANNYZj8oBXJDN2r9y7L-u6FW=FdfKntKDW8SBjR4L+Bfh5V0cQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8oBXJDN2r9y7L-u6FW=FdfKntKDW8SBjR4L+Bfh5V0cQ@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 11 Nov 2021 18:07:59 +0000
Message-ID: 
 <CAAnfSTuaVnUFrYTDw6kFPuFogcjimKBh4XU=1RgpzuHGn4GyBw@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv2] recipe-graphics/waffle: Add depends on
 cmake-native
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Anibal Limon <anibal.limon@linaro.org>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 18:08:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158198

> Maybe this?
> https://gitlab.freedesktop.org/mesa/waffle/-/blob/master/src/waffle/meson.build#L238

Well that's annoying that it needs cmake just to write a configuration file.

I suggest rewriting the commit message:

waffle: add explicit dependency to cmake-native

cmake-native can get pulled into the sysroot via dependencies, but it
is always needed:

| Program cmake found: NO
| ERROR: meson failed

Ross

