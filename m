Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 475ABC433EF
	for <webhook@archiver.kernel.org>; Sat,  2 Jul 2022 07:45:05 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web12.48104.1656747903936059104
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Jul 2022 00:45:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JTOXrBc4;
 spf=pass (domain: gmail.com, ip: 209.85.208.177,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id r9so5038267ljp.9
        for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Jul 2022 00:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ruQ8EtKJol1GsOR5Xah/hGz8xroJXJe090xOEAfsdd0=;
        b=JTOXrBc4lgRouYiph+9B+3zdMsHuCdqiR1NL31NVypWgtdjzxBMLyLL+DtkmponIaI
         ipr4E/KdThR1IqKlcFsGBYAo8/BVoWh/U9895D1RvSlxllXq3Ch6RBRtRBhx7flW+FXD
         XOSc1d6xgL4ZF7oLCbQHM5QKWCyiQY7jrqH6Z1Ic0y7fjOaikuJAE94ixq6pyvftZdGA
         z770qXXixi9CIAzF+K9UWL9UAvlVVc8wHMc1R7KuRw9a9WnH3na8B1Ja+ZxYA12GKBfg
         9/66rpbAH3yVJEk4m2JhoxCQHfVroHtWAFGGVcGbkd4Z+kAPVN+Ehc8sYN9nNX46Ozc/
         xBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ruQ8EtKJol1GsOR5Xah/hGz8xroJXJe090xOEAfsdd0=;
        b=Z60bPHqkavek2OCq3Mf6CA15IxMO9Q5CvakfD4vHaUB1SJEU9SaBLpqqRE9fbkSzjq
         Hh8zyiQtLryZHJypCbr93w4e+/JG68WNVmqNvqhDbhuJ98LWI0j4atOcdg4sit+d17KV
         YsEyiZ+Bi+kLcYXelqidNenOqjlaqL/X2Lhq3pU+M9+CmHt5w4P8Cwd9QvscPvM0kgwi
         UY4hUdsztkWDoHDa6/FhFfeAwXGI+M+O7peMWJmdpNvZ9HRMdc+XpkIlAMpW+z678bdS
         XZl+ux1ziqO8oMacu8yPQZh43mElGKba4vgl2qP+pU9pkFW+cGijJCZ5E3R+gIrfncmK
         s9wA==
X-Gm-Message-State: AJIora9FkOoO9j52gi3ke6ZvYHtvHT2l6D+QRG26aRXA4TCMN10nu7eo
	758W29az37fW7imGQ/0RQiROw0No45gcyw4Z6hk=
X-Google-Smtp-Source: 
 AGRyM1snGzD+kgtXqmtX0nr4EoHg/bW0GprXt4BKsg2nuQxyzlXjAmc1gOAsH2N5VVQaekH0R9FvIYpTMe36Jy4Ial0=
X-Received: by 2002:a05:651c:4c7:b0:25a:755d:5f9f with SMTP id
 e7-20020a05651c04c700b0025a755d5f9fmr9667277lji.109.1656747901789; Sat, 02
 Jul 2022 00:45:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220701192449.1358325-1-alex@linutronix.de>
 <92f3c188-a784-3af2-9bb9-76353e60deb0@gmail.com>
 <CANNYZj_6PJ=E3M5X21eYhih3am62jvVE+G+vgjenKoSfRCL36g@mail.gmail.com>
 <CAJdd5Gai4N1MXGVOMhqceocjWGpr9D4zEjRgvu3vN8Lgi8WAzg@mail.gmail.com>
 <CANx9H-Db+K=hMKGJzwmRQbyz+VTLC=tcMviSj5kPzKkTCWKBTg@mail.gmail.com>
In-Reply-To: 
 <CANx9H-Db+K=hMKGJzwmRQbyz+VTLC=tcMviSj5kPzKkTCWKBTg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 2 Jul 2022 09:44:50 +0200
Message-ID: 
 <CANNYZj_OZ735VtV_QYH9H-0ckT_1faeOZ35H=qN5zXN8H8C4Xg@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Sat, 02 Jul 2022 07:45:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167545

On Sat, 2 Jul 2022 at 07:58, Tim Orling <ticotimo@gmail.com> wrote:
> One remaining question is how do we handle configuration? This seems to address manifest?

Configuration will be handled with TEMPLATECONF and a set of templates
in a product/platform layer. It's already in core, it's simple to
understand and it works. We used it in a very large project. It also
requires a certain bit of discipline, which is a good thing: you don't
get to implement ugly local.conf hacks in a turing complete language,
and must design your configuration (distro, machines and images)
carefully in a static manner. Then local.conf must contain only DISTRO
and MACHINE, and a 'confuguration' is essentially a choice of those
two plus a set of enabled layers plus site-specific settings for
sstate, downloads, proxies and parallelism level. Back to
(maintainable) basics.

And yes, I didn't want to open a discussion about this, I even didn't
describe upfront how I'm going to do this to a customer who's
supporting the work (if said customer is reading this, I appreciate
the trust). I simply sat down and wrote the code. The principle is:
make a tool that fits in a single commit and that I would want to
personally use.

Alex

