Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A06C3600B
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 16:28:43 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.60.1743438514525767639
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 09:28:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CXp2c89D;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6eeb7589db4so48629156d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 09:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743438513; x=1744043313; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sShZvvIwhrjdYXXlkPfmLeb6lXC2BH6pnthiqV2XXHs=;
        b=CXp2c89DjCvD0R3UovVlLJsVGDM5mTpUb/Vn2aaz29qFzOcpuOG5ZczwsbgexU2Rea
         st5K6+sHAB0bw/ZLVT1TekeRXvpRK45kDcj4TlGhW0oaW7AhRgSi2akJwxBdMYbtspuA
         rhZW6WzhgTLStqIveRq/fS6rWdS6TPNQZlMNtooR56KlE/2g31q1zKW/2hJrSqDXG1WJ
         AA728LPyVGIhIpJdtQMul0gpO88gnPDzTp7twmmHsfXwXxqMFSsF1EsIYvX69+4ii428
         l3OiRZYWHZ59gXO0Am8DjUMYIH/JX3mLj2bxYbWptXubk6RlBq0lHOLbwo3aIXqrsTiv
         rc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743438513; x=1744043313;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sShZvvIwhrjdYXXlkPfmLeb6lXC2BH6pnthiqV2XXHs=;
        b=Fbqx7brcZOJ+rHo2mCqegnJFq/xK8RnxIS2wdHKIDUFHvYsLJtNr1t6KXFJzUm/eS7
         opH+e1Twtada28qx+1MYC3yiWOyXelb/s0T7pT3cROdydWnXDys+tzA99rxF9DcjgR/6
         5VjAtKxzJT4QuShW72W0EcHblSrbK69i7aGcND/KRVOJGxqeJHsUK6390KcXP/9+W3A3
         ijibOBHrozH/ybWkaGATjBdtaQ7dXK1AiGZxRFWM2e6ugepF3+kHjR8yny2ymtXcUUUE
         7C6MVs1Bf6EPDr3AcTtZPauGvHoilfTvPS3AkwD6dZV6MjBndSiGUCcAzJaElJiGkRue
         C91Q==
X-Forwarded-Encrypted: i=1; AJvYcCXzZwDvZA6Qd+xe+SIrhyAo40xGZaJRK0C7+b0xS+Bz9siK+nDVbAEFDyDlXPhP6N3XrRraKkUlXefGVHfvrbONPg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzWoQAk6PEykhDJl++53JMHONboRweijNBEJoPX3844Xt88UC+P
	GnNQtqTd1RbDmeVwFg77RdroDf+SKL1UI0ZEqMmNsO29ye+trpDmOVU4uULUcKIyAz7HVHXRX7X
	FtFjch8xT+ODDvM6b1GOyEh+An3k=
X-Gm-Gg: ASbGncusLSPY5g7+kHCM4eilUTgBTniY+jD+TH7WxBncaSkDeV765l263WpA/RzpvoH
	+5anWlcutNHFJt2vnJfOajge0JjgNMv/0D3cQdVErb0wqnzGXpH97dXm8jrpKZBzdIjReW3Yoq4
	30NeW5WF+zvY8voQlx6m7LJ59pPbARes/Ky5022a+jQ3sbWmV1lyGd7z39DzdcCvxW47qytEA=
X-Google-Smtp-Source: AGHT+IHFaLn7zL7HnbmhAwMSMNgT1kCeOyHbDlKyiNqzRxyVxOUpp/WJIQY1Wyw4lb3ri6UDXUK+OPP8KE5kZ357JGk=
X-Received: by 2002:a05:6214:1253:b0:6e6:6c10:76fb with SMTP id
 6a1803df08f44-6eed624fb7cmr176447336d6.25.1743438513565; Mon, 31 Mar 2025
 09:28:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250320165517.129442-1-martin.jansa@gmail.com>
 <182E912DEB60EF95.20788@lists.openembedded.org> <CA+chaQdD7i8xjuz9iPSNMfETo-5BNxsN=LibdZPrgdTYatccfw@mail.gmail.com>
 <182E91CCE4A2B275.19116@lists.openembedded.org> <d3f1a6601b2438007a963b69bf41d647672f78eb.camel@linuxfoundation.org>
 <CA+chaQc4kxzLcbFkZswbftUevsjcO4aYDzNVh6hMxj4miv9m1A@mail.gmail.com>
 <CAAuPjF8oBXzYug4E6HjxicDXbkahs7VXdGubsMi0J0VRho2bNQ@mail.gmail.com>
 <CANNYZj80f3_vmVSP0sBRVWKix+ZAAYSkT4v-prJHbpO6q8XrpA@mail.gmail.com>
 <CA+chaQfsMaBR7NgCKbrw56VSHFNj09r3irFNiCuBeMmZivv37w@mail.gmail.com> <3e8eedef-b9a9-458e-a3a7-dd86db2f21bc@gmail.com>
In-Reply-To: <3e8eedef-b9a9-458e-a3a7-dd86db2f21bc@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 31 Mar 2025 18:28:22 +0200
X-Gm-Features: AQ5f1Jo-N-LmoRe3gokT9UnFvTJUZZ1Tq127YfvkNYSoKduDIhnYgqWdBUIJ8Is
Message-ID: <CANNYZj-0xoyMB9dujwM8O547Bx8OF+gTz_+rrE-brWG+F8Tjxg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] cargo.bbclass: allow to avoid appending PACKAGECONFIG_CONFARGS
To: akuster808 <akuster808@gmail.com>
Cc: martin.jansa@gmail.com, jarsoper@gmail.com, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	DongJoo Kim <dongjoo.kim@lge.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 16:28:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213990

On Mon, 31 Mar 2025 at 18:18, akuster808 <akuster808@gmail.com> wrote:

> In meta-security,  suricata is  mixed C and Rust  build  so I use
> PACKAGECONFIG for the autoconf part and now the RUST portion is
> complaining about configuration options it does not understand.
>
> Rust error:
> error: unexpected argument '--with-libcap_ng-includes' found
>
> reverting the commits fixes my issue.

The recipe inherits both autotools and cargo, and then overwrites
configure(), compile() and install() with its own versions that
manually run the rust bits:

https://git.yoctoproject.org/meta-security/tree/recipes-ids/suricata/suricata_7.0.0.bb?h=master

It needs to be fixed to use cargo_common class, similar to librsvg.
Inheriting cargo class means cargo (and not something else) is used as
the top build system.

Alex

