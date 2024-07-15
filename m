Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41CBEC3DA4B
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 12:41:48 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.37143.1721047297946068733
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 05:41:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mDep8jQl;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52e99060b0dso4482720e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 05:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721047296; x=1721652096; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7dvWVp+u21Hx3SCH1NXEaNRDSyBwV/LnL4DFfilM400=;
        b=mDep8jQlcabmAoBfVzosKOnmLHXB7nk279ibpKr2Qc3OVt1jNMlDX0Qs4h1BXBA5nm
         I27e9CgY/ccg7Og32uiszp4JWoYYBescX+H+mB1PpQQBvU1VLuTexyytH7yLVwBAM8iX
         T/V5aN9W8IF1DePZi5BOTuF5/Et8+WkwNMA7I8y/A9DjpcCfxZEDF9HjsxShyp+XiaSt
         tryQ3gM0kg7jMGKHrlRdJqJIBBbPIgagZrDpGucpnTs6ggrjHuKe1XcDnbvLSQsmb/GN
         JbJxzO+43s2fU7Ufq9ZErclO+V3mQW376GZiIoR6Ntw4EZ2Y2YcFnODT73wn/C8w4tIJ
         n3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721047296; x=1721652096;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7dvWVp+u21Hx3SCH1NXEaNRDSyBwV/LnL4DFfilM400=;
        b=YuXeSgOuUcZZvPfBgdJ/LDDlMuJAmCDOnMoTulyWR7sWKRJBfwTCx2tfOZCQka0Lh6
         H9My/XM0R8LlUhQa9zAN/yY64R3ykCLXQtDZLdocGHm2jA0sEtMAVWey4cGMZzyxeQ00
         12ktDzcMJfujFO8lZWXHdWp15ScdfKrZQfQeMHGxWYvFkHfNul3HEWjy7PIziKeF5+X/
         R99tlAXVfWc7hlFZc3ST5WL3LsAuGv9Mzq9cavUFidNn5KzvlHE7z7+aBkJ8+ueCQlnd
         tMbyaFN/P7KBmJREYVenJbEPVHrd1GVs0KZaB+Zn6GJWyjnHFrbfulNaHCcwQ+mY4tz1
         5TJA==
X-Gm-Message-State: AOJu0YzravzxxsK/SYdoJG21r9ZQoxqwBvr2s0YvfOf/kflUqsbJw91V
	gErIu4Ffuwoyg1P8nVZ8sgT6vlwMP0/Q7wogYzknkH3Zf17LqXaSdegb8h4YyKUWVb5rfHuPpl/
	lrwwC14NhEvTc2Q/u0+QX1FREf0pMWQ==
X-Google-Smtp-Source: AGHT+IFriIbBUTfl0Ki98Csdw+40dPeGSt2VtmZd2/KlyE4yLmC9qpnNH8+Vskervfz5+AU9wyW//wZt9L4wCzlSJfE=
X-Received: by 2002:a19:434e:0:b0:52e:9e70:d06e with SMTP id
 2adb3069b0e04-52eb99d4c9bmr11013587e87.53.1721047295680; Mon, 15 Jul 2024
 05:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <PH8PR11MB69284EC66E641DB6521B904EB8A12@PH8PR11MB6928.namprd11.prod.outlook.com>
In-Reply-To: <PH8PR11MB69284EC66E641DB6521B904EB8A12@PH8PR11MB6928.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 15 Jul 2024 14:41:24 +0200
Message-ID: <CANNYZj-Drv_kv_M29iYvQohCLdNR9MFb8BOwCVxJ6Gd1oP-rCQ@mail.gmail.com>
Subject: Re: [OE-core] Regarding the issue of adding a symbolic link from
 python to python3
To: Jiaying.Song.CN@windriver.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Li, Changqing" <Changqing.Li@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 12:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201922

On Mon, 15 Jul 2024 at 08:31, Song, Jiaying (CN) via
lists.openembedded.org
<Jiaying.Song.CN=windriver.com@lists.openembedded.org> wrote:
> 2) Add the symbolic link directly to the python3-core package, so this modification will take effect as long as python3 is used.
> Reference attachment: [PATCH] Add Python symbolic links into the Python3-core package
>
> A similar issue was resolved this way in Ubuntu 20.04:  https://askubuntu.com/questions/1296790/python-is-python3-package-in-ubuntu-20-04-what-is-it-and-what-does-it-actually

Fedora and Debian take option one for now, but I do think we should
just go ahead and provide /usr/bin/python from the core package. If
someone is *still* using python 2.x (the public layer is not
supporting anything after kirkstone but people can do private hacks),
they can undo that provision with a .bbappend easily. Meanwhile we'll
be able to drop a whole lot of patches that tweak #! in scripts.

Can you send the second patch as an email with 'git send-email'?
Please adjust the title to say: 'python3: provide /usr/bin/python as a
symlink to python3'.

Alex

