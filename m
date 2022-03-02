Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F26C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 11:25:21 +0000 (UTC)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
 [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web11.6138.1646220320400445271
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 03:25:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cVzT92Ct;
 spf=pass (domain: gmail.com, ip: 209.85.217.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id d26so1519515vsh.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 03:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zpvp/UAL/cGN3VXPZuMWui8yZBOjSAX9/ZcDlmo2P8Q=;
        b=cVzT92CtzWjsR3JJHHJU5MNPEti+03gXdGObpRUD6nRlF8kuUYF6PtGial6VnMUKI5
         YFM9keRiSRYRSjUtyKAvwTO6qWRjqRojn1251Qtlxy6LgM1dEdukZGbe0vhXW0DmkdLu
         f8fp/Ses7KO8Hzb3Oyqx2JRMLxdZUSjo4T3LLlBM14YUjAMcRfpJefnKEA+D8T9eUhvF
         q+HS3LvqUGA6Bm/pRcn6aF6W04bq8xqnYnaWrE4xcOdekZmxj/uLTXsWLSLE82rhyYQ8
         wJDByFW+bHZmWVQ6wfLs/UQp59vvZ0gMojLIWwPjWC8mtbY6NDUou5JUisscOJ6LJgej
         219g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zpvp/UAL/cGN3VXPZuMWui8yZBOjSAX9/ZcDlmo2P8Q=;
        b=Hk+9U1f869Ym6xOrLfORV7QoixX/HoDMDEn2JQXqX5xgF21TxErasYdIlHuOqV8+vU
         G/reUNy7J4ppz1CLeL41/r1Y/106A3WDWUGPKvSm22WoGAcej5bhqLkpFnpU1rvn/1cq
         DhW+pq1+dyza+SpFA1vCc6qrrNJ6A23PyLGHsgu8c7imrhz+1xfwXxLu/r431E2qDH2c
         jxmU+b1EpSpm9I9wRdC9kLcuCvF1sxT+nvOAnAsV23wzffnoI33LoPtFJNu7fbHI8hb8
         BMGMaUy+JQPFq7uCjAZ1QXJ/vDAngNtimVeF37GKaJfXro06+qn0zOTYPnKYZGdWKH0c
         pbPA==
X-Gm-Message-State: AOAM530EurKncPebe1zhuFKf85y4ht/3BdLPuLa5xCOGekjcUYqsy5Sj
	j3Q33GZZOS8bsU9dcItkvEwUr+QhOlXRqt7vjq8=
X-Google-Smtp-Source: 
 ABdhPJzUsmQh5c1MztWLt6whPp+2FtMj5TcTHP174z1ZJkLgvRxlpLRd7lRxF8LzdJutvwozALLLWmgNvQVpDRUOR9Y=
X-Received: by 2002:a05:6102:cd0:b0:310:4636:78c5 with SMTP id
 g16-20020a0561020cd000b00310463678c5mr11993227vst.45.1646220319255; Wed, 02
 Mar 2022 03:25:19 -0800 (PST)
MIME-Version: 1.0
References: <20220301081218.25469-1-Qi.Chen@windriver.com>
 <9ee751152333845c93c411b467090f007d63c9b3.camel@linuxfoundation.org>
 <6e10eedc-d789-5189-6c65-1747a1d94665@windriver.com>
 <06508a1bf3fc6e8ea170885eea2fb66de83733bd.camel@linuxfoundation.org>
In-Reply-To: 
 <06508a1bf3fc6e8ea170885eea2fb66de83733bd.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 2 Mar 2022 12:25:08 +0100
Message-ID: 
 <CANNYZj8yOi0fh47GjJTaysc=G_xupe=RbYer8ub=Dc=VfC1N-w@mail.gmail.com>
Subject: Re: [OE-core][PATCH] multilib_global.bbclass: fix setting preferred
 version for canadian recipes
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: ChenQi <Qi.Chen@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
 Ross Burton <ross@burtonini.com>,
	Lee Chee Yang <chee.yang.lee@intel.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 11:25:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162606

Also, Ross, use HOST_PREFIX please (insert grumpy face  >:-|   ).

Alex

On Wed, 2 Mar 2022 at 12:18, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2022-03-02 at 09:59 +0800, ChenQi wrote:
> > On 3/2/22 08:20, Richard Purdie wrote:
> > > On Tue, 2022-03-01 at 16:12 +0800, Chen Qi wrote:
> > > > Currently the TRANSLATED_TARGET_ARCH is not changed when trying
> > > > to set preferred version for canadian recipes.
> > > >
> > > > e.g.
> > > > ```
> > > > bitbake core-image-minimal -c populate_sdk -e > env
> > > > grep ^PREFERRED_VERSION_gcc-cross-canadian env
> > > > ```
> > > > The result is:
> > > > """
> > > > PREFERRED_VERSION_gcc-cross-canadian-x86-64="11.%"
> > > > """
> > > >
> > > > We need to explictly change DEFAULTTUNE to ensure TRANSLATED_TARGET_ARCH is
> > > > changed when trying to set the preferred version for multilib version of
> > > > the canadian recipes.
> > > >
> > > > e.g.
> > > > ```
> > > > bitbake core-image-minimal -c populate_sdk -e > env
> > > > grep ^PREFERRED_VERSION_gcc-cross-canadian env
> > > > ```
> > > > The result is:
> > > > """
> > > > PREFERRED_VERSION_gcc-cross-canadian-i686="11.%"
> > > > PREFERRED_VERSION_gcc-cross-canadian-x86-64="11.%"
> > > > """
> > > >
> > > > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > > > ---
> > > >   meta/classes/multilib_global.bbclass | 3 +++
> > > >   1 file changed, 3 insertions(+)
> > > This seems to break multilib builds:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/4844
> > >
> > > Cheers,
> > >
> > > Richard
> > >
> > Hi Richard and Ross,
> >
> > I looked at the above failure. It's not caused by this patch. It's
> > caused by the one below.
> >
> >    package: do_package should depend on binutils
> >
> > I could reproduce this problem by cherry-picking this commit to latest
> > master branch. See detailed console output below.
>
> Sorry, it does look like it is Ross' change and not yours!
>
> Ross: I think yours may also be causing the sstate sigs issue in:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3233/steps/14/logs/stdio
>
> Cheers,
>
> Richard
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162604): https://lists.openembedded.org/g/openembedded-core/message/162604
> Mute This Topic: https://lists.openembedded.org/mt/89471636/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

