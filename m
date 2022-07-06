Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B10CC43334
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 18:34:53 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.826.1657132488313251364
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 11:34:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fBSiw6Zk;
 spf=pass (domain: gmail.com, ip: 209.85.208.172,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id r9so19491863ljp.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 11:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3eoxf02RxxTJIwp1ShFfyuxDCKejT1t4ik6laU5BxFw=;
        b=fBSiw6ZkDWOihn1LvfzQ9droQq72BjODWCix4HRaaIALAhyhC8lrmvjF5BLOUg7M7p
         L4z6Mh/a6pv9dzzOE8RKbipZNuP4zesWtHmKHllez872Qzbl7N4EsBQv4eKhR9pwWMMQ
         Spz2rCjBfgfZjdQXn+yVUPHCx18t+uRVgCE3TPpYbX+rg6Z+UUxSdAYK6A+NzQEUNV7K
         IBmzRoUQf8PNtplFNnIuI2VhcOtSbA146TS4CFZ8lQJCJ24VBuVqiERLUgybgX1d8Mo8
         7H6pprFX/cl6VJPnrUWfjeZP8p7TKHAgSs5aQEQ2Et8QioD0YxVlZcvY0kB6v3frU1rz
         mvyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3eoxf02RxxTJIwp1ShFfyuxDCKejT1t4ik6laU5BxFw=;
        b=pEKrHw9I/e2BRuuXSV8IKa5ykH2E+NIqZ8cFfKd+1E9LMHMgojCXolWEniLACNo8fS
         qxvdScmN4LOCLo6zrMrMC8LGHzoY3TG2sfLpuTqQ3fnWA7k0fWGszno1VwSQqZPBIokm
         dBkJoP+2KhnCMuR6GPj0DG67VgRiubGsl+LqFV1UNuJMNmsPISixP/jE0Nogj8xL1u1v
         vebaC06Cg0hHDJJIR3QeeTUlG5rWVbc6dWPtyBvO2LmOca9u+1ihL9RvvX2CncYuiujz
         wG9rzok34rvpH5zl86ErWt8jOWiap+nsytBteQ0BFPUpS647fDMR9K4BzqvRl2yJx2Xo
         3T7A==
X-Gm-Message-State: AJIora8HAwfIB2EE6swrEPc6Of7rXkuBlBa97lM9qEmr/sd8zzLn43yZ
	Ea5gReGWCpF2bCY9vLvt0hyU1dx3ZeyfuK6tqZ0=
X-Google-Smtp-Source: 
 AGRyM1uDKy+bcdHgkC0w1tOiVQeRMCbBmHwK8CWQ7FOO8LuFUXOyM5OzhHU5u1WWmCoJPabZ9LCd4bINQdY5zI2IiYI=
X-Received: by 2002:a2e:9882:0:b0:25b:eb1e:8d with SMTP id
 b2-20020a2e9882000000b0025beb1e008dmr24243946ljj.41.1657132484975;
 Wed, 06 Jul 2022 11:34:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220701192449.1358325-1-alex@linutronix.de>
 <92f3c188-a784-3af2-9bb9-76353e60deb0@gmail.com>
 <CANNYZj_6PJ=E3M5X21eYhih3am62jvVE+G+vgjenKoSfRCL36g@mail.gmail.com>
 <CAJdd5Gai4N1MXGVOMhqceocjWGpr9D4zEjRgvu3vN8Lgi8WAzg@mail.gmail.com>
 <CANx9H-Db+K=hMKGJzwmRQbyz+VTLC=tcMviSj5kPzKkTCWKBTg@mail.gmail.com>
 <CANNYZj_OZ735VtV_QYH9H-0ckT_1faeOZ35H=qN5zXN8H8C4Xg@mail.gmail.com>
 <CANx9H-Dz+qoXt-uEkfj+fvYHcDbL74DsnTpHmEFpQo2kom8ZLw@mail.gmail.com>
In-Reply-To: 
 <CANx9H-Dz+qoXt-uEkfj+fvYHcDbL74DsnTpHmEFpQo2kom8ZLw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 6 Jul 2022 20:34:32 +0200
Message-ID: 
 <CANNYZj9ndgsgKRFGBKSiJ2y_k8kK5dsxJgYWnrVk4_sfLO2QxQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] bitbake-layers: add layer
 repositories/revisions save and restore tooling (aka 'layer configuration')
To: Tim Orling <ticotimo@gmail.com>
Cc: Joshua Watt <JPEWhacker@gmail.com>,
 Alexander Kanavin <alex@linutronix.de>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 18:34:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167742

On Sat, 2 Jul 2022 at 10:28, Tim Orling <ticotimo@gmail.com> wrote:
>> Configuration will be handled with TEMPLATECONF and a set of templates
>> in a product/platform layer. It's already in core, it's simple to
>> understand and it works. We used it in a very large project. It also
>> requires a certain bit of discipline, which is a good thing: you don't
>> get to implement ugly local.conf hacks in a turing complete language,
>> and must design your configuration (distro, machines and images)
>> carefully in a static manner. Then local.conf must contain only DISTRO
>> and MACHINE, and a 'confuguration' is essentially a choice of those
>> two plus a set of enabled layers plus site-specific settings for
>> sstate, downloads, proxies and parallelism level. Back to
>> (maintainable) basics.

I just sent out patches for this bit (build configuration). The layer
configuration generator/script needs a few changes which I'll do next.

Alex

