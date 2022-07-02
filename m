Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B27DC433EF
	for <webhook@archiver.kernel.org>; Sat,  2 Jul 2022 10:22:36 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web12.48871.1656757353868299671
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Jul 2022 03:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ig+9TPjE;
 spf=pass (domain: gmail.com, ip: 209.85.167.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id t19so7074900lfl.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Jul 2022 03:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SUkkOtCbpl6vX+fVxLhLtdKcBYi85lBtDI5ngiZF7GQ=;
        b=Ig+9TPjEpcejw64AqkpABUGW/oQ2dKgGWN3qb/u9cynmnoQpheREF3OASYB3v5oh0V
         e33+wTG4vescXu9YMVRo7KVD9JB32bqGt9Ugbu86QnvQjTUR8JICJVATfXyLLCY6XqHM
         wQ2rlqiNP7Q27xOALbR35NicP4X89YtyrNnvFS1Ov7wdPG8bfmKMrLjqyyIzwsjN9PI3
         El5YExlGLzcGkfMkb6gTI0VKA8uf7cfGgFxD7wEqiQnudPp/pH8Go86c7/YRRdF5CtNJ
         XYrFP6v4YmtIkK0ZWRsDLDVlCzc1uu3iuYbVZum5MFZIw+qUjUCNH8UYwlO9yy08zcdC
         8ptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SUkkOtCbpl6vX+fVxLhLtdKcBYi85lBtDI5ngiZF7GQ=;
        b=7/DS2CtDopwwtnNMHOVXtuw6nM6dj6O2Ol4+zHt8k+AjShzUeqdN7b2CpG9m4A8K2p
         4P1GliKjn3UVxuLmEJJPjGigyk7zq7ZcQVSQ1SDKxgUq0dubcpnTrsA6axSUlZg++LWG
         lYohQpYQZx1kw6VZt0n7hCbxz3TNd+xAsNL1Ej5vIu35bpXhYMuhYfAOoxzCFoWERRo3
         brAoYktQeHqNBcv/6rd6WRkjmGKDsCHydy8c368XMrQLH2SLmoROA6vY2d8uUC4WjQz6
         pVi/3DNJcs/v0Ds+RVzu9OLUbViiJY9Vqo0ufHUOTqeFw3JP+fQzCu6sUVSGv6zIN54p
         kSYw==
X-Gm-Message-State: AJIora9Nnx0B5D2MkjN85w5OMfXQBYoThsT485hu4LhWkKVo+QECJ46e
	uRnfxLFa9mXqwnT5h083Yq/2U8SElZeEtOcVLGc=
X-Google-Smtp-Source: 
 AGRyM1vFmZfBpYZ5PgU3lOtIWObLjOXfa+UE6q0xHkiuPIOfO2OvvKDA8P973ZQStvbQ+mPZRybNhnus6dD6XEZll+o=
X-Received: by 2002:a05:6512:acc:b0:47f:769e:6aef with SMTP id
 n12-20020a0565120acc00b0047f769e6aefmr11341288lfu.26.1656757351832; Sat, 02
 Jul 2022 03:22:31 -0700 (PDT)
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
Date: Sat, 2 Jul 2022 12:22:20 +0200
Message-ID: 
 <CANNYZj9H4mZEkms5CRARga6EZ-8Vwi0O7BO3uLPyP4VNL4u4bw@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Sat, 02 Jul 2022 10:22:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167547

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
> 100% on board then. I will die on this mountain.

Ok, my brain couldn't avoid thinking about this, and so I have to
write it out before there's any code, and thus invite more
bikeshedding :)

The way this will work is that there will be a command:

$ bitbake-layers save-build-conf path/where name

that will take the existing active configuration from build/conf and
save it as a template in the specified location: path/where/name.

Then 'bitbake-layers create-layer-setup' will refuse to proceed if it
can't find any configuration templates in the active layers.
meta-poky/conf that we all know and love and use daily doesn't count,
but you can force the template-less setup with a command line switch
if you so wish but no karma points for it. All template locations will
be saved in the json metadata.

Once the layer setup script is done setting up the layers, it can
suggest a list of available configurations, and a command that you
need to run to use one of them to set up a build. And if there aren't
any, it will redirect concerns to the layer maintainers for not
helping the layer users.

Now this is getting somewhere, and that somewhere is more interesting
than sticking with submodules, repo or kas :)

Alex

