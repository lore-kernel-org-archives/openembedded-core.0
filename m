Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9912E7071D
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 11:12:04 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.13846.1695294717271576372
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 04:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ehnC52xg;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2bff7d81b5eso13706611fa.0;
        Thu, 21 Sep 2023 04:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695294715; x=1695899515; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hnUEYAY9fFitD3R9QWynmbf070MIEmrpPJMaWHMT/Fk=;
        b=ehnC52xgdNQMTis6c5eIRWUJVy/vema/q19Hhx2/FPgXSsWymZE0wy/dG8J0hP21aq
         z7Nqx7qXnEBTEPXhgBXi2irDoi4ip0svSkI9roZsNusMBZUIuxMhQnjIuqqchdhXkIrI
         zwdUnPHd0YkyOqntvIZtO2K09+Hc4V7pP7znlZejK6DOkOeRux+qLxiJqmNBxZBQ2+wD
         OIe+80h98ZgniiocroArJu5YDL7BoTuLv9phA6/ie4LP5xIG8Vmo2cdyT8xCLhdiO0Rc
         1KSvMpR/6swI7kwxxda/0ylJurUhciz5Va1w0LQmuW2I8n5j4ES7otbkVZUetB7wFTDi
         rqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695294715; x=1695899515;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hnUEYAY9fFitD3R9QWynmbf070MIEmrpPJMaWHMT/Fk=;
        b=e7Vt5ZyQt6RPFZwvWCUZV9u7+x8RyQM43wWlV16NB4A4A6A9kGtq/fpU+pPqQm3RF0
         Ujt5IxC3V348JssBhZ1lRC8lSYXV6/FR2ZFDh3y/lDc7hyzNZY9zfakKxMEhP/QqFKR4
         jspFlkWht1nA4Bd7UWqMMWP0ey1E19cBoAxETWbMunznqawY8CahjtDBuNxzFUjrsSAf
         ZMLLoDwmUtj7fuNCNEBRK7zBsPmML3OZLWPxhtyP19xcaugaTVu+DCscJsKWzC779TsU
         +tW/u4pMtZJDR7cZgQDFgaWtNFcQzr1UIfjbr/o4iTE71Ydzc/cQmS/hhFDsUEqEEZ6u
         aF8w==
X-Gm-Message-State: AOJu0YywKt8CDX6bV496bLONfcEeIwqs9bPC1uqZfkKwN30kc0Y+meCy
	pLUCu8qChz+v5eeTskUcd2A2PCsE03of6eX09Dk=
X-Google-Smtp-Source: AGHT+IG8w5HEu/Ny0dWMsX0ZcQiELNZFk15PU5TGH/EQ23iVCui2Y6jIwzBBqVO7mYSxRmgv/YEe+S9eOmzgp9P5yGY=
X-Received: by 2002:a2e:8908:0:b0:2bd:a85:899e with SMTP id
 d8-20020a2e8908000000b002bd0a85899emr4565007lji.3.1695294714932; Thu, 21 Sep
 2023 04:11:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAK5yBb9gO+WOJrv4TArzXK_1Bxu5AORp2oi=P-v=2nn6PgJE5Q@mail.gmail.com>
 <CANNYZj9QpstUj_A8Vb2RbiaFGZkHkFjHkUfF=E1HR-nDJ_Vk6w@mail.gmail.com>
 <81f4c191fe6dead1feec6bfc0d36aa328af1f7d4.camel@linuxfoundation.org>
 <CANNYZj_uSknujoQUK2yV7U4N+WW_RkUH=sJnFDBfZgV0G5fv7Q@mail.gmail.com> <5ef99df95ab74e74df6f1e07ef4877487230d9fe.camel@linuxfoundation.org>
In-Reply-To: <5ef99df95ab74e74df6f1e07ef4877487230d9fe.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 21 Sep 2023 13:11:43 +0200
Message-ID: <CANNYZj8RAvj=sJtQuH9J_zKKAsUbhcdKe0hiA2JJy1wwxuzDNQ@mail.gmail.com>
Subject: Re: Core workflow: sstate for all, bblock/bbunlock, tools for why is
 sstate not being reused?
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Julien STEPHAN <jstephan@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 11:12:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187989

On Thu, 14 Sept 2023 at 21:54, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> The tools are already supposed to support doing this with local file
> sstate sources, they just do a bad job at getting the diffs right. One
> intent of this work item was to try and understand why they don't work
> and address that so at least for filesystem sstate mirrors, you can get
> better results. I don't know how we solve the remote http issue as yet.

I ran a few experiments with bitbake -S printdiff, and so far I
haven't yet seen an unhelpful result. Here's the most impressive one:

$ bitbake libsolv-native (uses cmake-native)
$ git revert <latest cmake version update>
$ rm -rf build/tmp/
$ bitbake -S printdiff libsolv-native
...
The differences between the current build and any cached tasks start
at the following tasks:
/srv/work/alex/poky/meta/recipes-devtools/cmake/cmake-native_3.27.4.bb:do_recipe_qa
NOTE: Writing task signature files
Writing locked sigs to /srv/storage/alex/yocto/build-sstate/locked-sigs.inc

Task cmake-native:do_recipe_qa couldn't be used from the cache because:
  We need hash 5e649a49c4f0de2e62bc8fa4215df1021b9772762065352ef0d204d2d72f4efb,
closest matching task was
85c73eadca06d0e92fcea130ae6e23e902c96314ef1c38c60a14ed3445d24ed7
  basehash changed from
7d4adf817d99893a30a94330803a0eb1c00652ab217c21599944f81f023af6cd to
7e93631376ed159c11460647bf7f4178cb260d44f367d0858c2cd96ae2256b09
  Variable PV value changed from '3.27.5' to '3.27.4'
  Variable SRC_URI[sha256sum] value changed from
'5175e8fe1ca9b1dd09090130db7201968bcce1595971ff9e9998c2f0765004c9' to
'0a905ca8635ca81aa152e123bdde7e54cbe764fdd9a70d62af44cad8b92967af'

That's pretty good, isn't it? It does print both what needs to be
re-run, and *why* as well.

I have no idea yet what kind of magic it does to find the 'closest
matching task' in sstate, but if this breaks down in some other
scenarios, we need to find them to get a starting point for making the
tools better. Ideas? I'm ready to try them :)

Alex

