Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF73C6FD1F
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 19:02:23 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.28761.1679770934986051814
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Mar 2023 12:02:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BxSbL4o7;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id j11so6301511lfg.13
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 12:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679770933;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JhTZOdqFeqxT+LW5ptUXmad1cN/HUAjcwew2liXFm1E=;
        b=BxSbL4o7jjZZU33VR+bJvNLY4Ck0ZoJb+28w9rYF371yXk3sLjsUOYM5XwAk5BJU+m
         BeJm8t1AJRI8sLO9/1SgRHDXBBljKjmmoGYmKYiIAtLh8L5AOAZZggEAztyBkf0G59vE
         V9WPsxWLS80vSMlgK8tQgVdDzBB4Fl0KeCtjrqRggdQmTNP5lJRObamlQYHc483tbv1I
         9hNTFbSX09Mn/SaACd9fLQ+m82cdOYVGhQyegy0a8plR2M8OfTdONANqX80SzotyyYvA
         Nto4m8mmNFaXNiaWOJ4vilBEhB883BgWjtHgjWB8t5mKX8Nniiu/L/bvFOwHuSXDP5pu
         ochw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679770933;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JhTZOdqFeqxT+LW5ptUXmad1cN/HUAjcwew2liXFm1E=;
        b=wtp2S5nXJmwNbdS2xLfPpTYsywwWULV4HcvS6j4rhVNcqGgxW6vNeWjusa5uX0p3HK
         lDeA/dyEnls47eKBPXLZi544DI/UshPoYibPROHfmzI3W6tKjcU5Bo+yTs3ST2XlMXtB
         mAkStnG7fDH7qoWhIzQXvRJoP1bK0xJuegncwAHvxtn4kvo1gJ/8bH0/gxTdoFbsEwcl
         s8JjdK0pzE4k7ePRg0/238spgpdwUSlkMGhhxNsE0TYuRTwyWpPqhUkWQ5CntRGQJZmW
         mbXN9DCCFHtGdrOz01dSJLmtbIg6iBqJQ7C5CEXK6PYJbXSrdBgiuSW27+945sFkuD1Q
         qbog==
X-Gm-Message-State: AAQBX9fw0CdqDERieg5vr3NetSNvAGOvvc0gxQRVdRYZJ92mtJnJcnoA
	pilMkvglqc2K8XOHidP8NnoiBe3FBm1OpU+H9nA=
X-Google-Smtp-Source: AKy350a1OSW17SBQsGSaCqu1jBG/3gaQEqmVd17jaVz3zruBnWBXdoef7wdwY5MD5JBa1bgc4QcjzSCscelb+jFMB68=
X-Received: by 2002:ac2:4a9d:0:b0:4e8:9988:f8ab with SMTP id
 l29-20020ac24a9d000000b004e89988f8abmr1866714lfp.11.1679770933066; Sat, 25
 Mar 2023 12:02:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1679734210.git.frederic.martinsons@gmail.com> <b48dd61e593e57d7673b65a34a44cd304cb7b7b8.1679734210.git.frederic.martinsons@gmail.com>
In-Reply-To: <b48dd61e593e57d7673b65a34a44cd304cb7b7b8.1679734210.git.frederic.martinsons@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 25 Mar 2023 20:02:01 +0100
Message-ID: <CANNYZj_W+qLQRMVTuW8RMSJeBSgstixSPh1rZh77KxvN4vsCgg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/5] devtool: add support for multiple git url
 inside a cargo based recipe
To: Frederic Martinsons <frederic.martinsons@gmail.com>
Cc: openembedded-core@lists.openembedded.org, alex.kiernan@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 19:02:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179105

On Sat, 25 Mar 2023 at 10:01, Frederic Martinsons
<frederic.martinsons@gmail.com> wrote:
> @@ -72,6 +73,8 @@ python () {
>                      url_data.type == 'npmsw' or url_data.type == 'crate' or
>                      'type' in parm and parm['type'] == 'kmeta'):
>                  local_srcuri.append(url)
> +            if url in cargo_git_deps:
> +                local_srcuri.append(url)

Come to think of it, it's better to use the same type parameter with a
special value as in kernel recipes:

git://.....;type=cargo-dep;...

This would avoid the ugly special variable.

Alex

