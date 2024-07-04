Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6748C3271E
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 15:21:47 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.12777.1720106502686510271
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 08:21:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ILKhduoV;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ee910d6a9eso4039671fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 08:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720106501; x=1720711301; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rslrsOsWtLXdLh2DV/FoO/x8I3Qm+1FNSKuqYu5+Qw8=;
        b=ILKhduoVm4gsfgKaDL59unWasOyGlBgXHyIRWcIcOjzaRsHCIYA0V2zp76wSBW1ORv
         vuNXPeaKgvpfTT8QXgzE4J/pe+ngo/PlDnJZt2AInJcUi3i4GQOLSGNt6qrakfg2Z7Yi
         p8BP/ZaVMu6WuyzalXLQbD+Z2cOHomSfEp0oiiOB3AqoZRUSQYboICutKpWXzX+7Oj5g
         5HXkipggc8+8D/MvqKi8EqxQk41fE8dEOzGKBJfzWWw3Mb3vJzRQPFs88X91iZDc9bWd
         8+4T8Qf50d+XS8pdVXV8fx9erhPbgYU3ec108lO+G5XhJcdHKKdN4wKlxIlq9HR/o+4e
         Znqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720106501; x=1720711301;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rslrsOsWtLXdLh2DV/FoO/x8I3Qm+1FNSKuqYu5+Qw8=;
        b=IjK2PIBozBriGN9FB+510myfUBUpdloG6Su4FYKd4C+gB04cM5d3Q0BgDX7QBwTlU1
         giX1bq6SIo4EF/voC2jWKy4q+6wMp/ePUwKQSAIxPtq6myFmNIFlzbwdjjQSvjOdg6gg
         gNe1QWqX/fzq2TSmcGI+ugWQlEODSIp1uRsmHpbRkN4xXb6EScpyxQO46BYKZ57y26/c
         dxgg9uIBTYUPSs0tlQUOYCtoDeCshrK0912L1UnunkNXUJnnPsOWndAkZKjJimsamGk1
         s9l0FPWUJ8zGV13ceYiE0jOO4qDRakf8IWX8OW1VvdwWiQwyv8H79oeWTJYJyHuLaQGS
         aCRQ==
X-Gm-Message-State: AOJu0YzFqQcJ255WOQ/vXta0huZOI8gY08oW1rRNdIkffb7sWS4k+Qx/
	jTt01CdkzLWRli482pL7lKsA6FQ18OW3yRBZKOkK/gonoCwaXGeMc/wzp+RbkKqkRI+NUQhyJLW
	oMGciKOd8XwqXIKH0iwrlGvZqpeZXHg==
X-Google-Smtp-Source: AGHT+IGAOxeAS5U7htgvTl16cWYN59A1Y8BuroKDzhDVuXB1JEsgdhBi0VqQsqJcLDo4JNL0f7OEMJXx8KLxbxiRiKM=
X-Received: by 2002:a2e:b04a:0:b0:2ee:8b28:96e3 with SMTP id
 38308e7fff4ca-2ee8f2d9f79mr6366271fa.23.1720106500447; Thu, 04 Jul 2024
 08:21:40 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj-m-m+B3iaNLHeEq5C9w5Rfg28fGY+U8ezaZS6N33P4Ag@mail.gmail.com>
 <31491.1720105991184445170@lists.openembedded.org>
In-Reply-To: <31491.1720105991184445170@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 4 Jul 2024 17:21:29 +0200
Message-ID: <CANNYZj9vSOdetOTfghRN4r9iOpai1zwSPkUU7_pJRoaYoEZL2g@mail.gmail.com>
Subject: Re: [OE-core] Rust reproducibility issue summary
To: sundeep.kokkonda@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 15:21:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201580

Hello,

I simply ran two independent builds, each with their own sstate. The
host distro is not relevant, as it's been observed on yocto
autobuilder across many different distros.

I'm not sure why you insist on being able to reproduce the issue, as
you're simply going to get the same build trees as in the tarballs I
provided.

Alex

On Thu, 4 Jul 2024 at 17:13, Sundeep KOKKONDA via
lists.openembedded.org
<sundeep.kokkonda=windriver.com@lists.openembedded.org> wrote:
>
> Hi Alex,
>
> What distro you used to reproduce the issue & what pkgs were installed. You used any shared sstate of Yocto?
> With this info I will retry to reproduce the issue on my local machine.
>
>
> Thanks,
> Sundeep K.
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201578): https://lists.openembedded.org/g/openembedded-core/message/201578
> Mute This Topic: https://lists.openembedded.org/mt/106407787/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

