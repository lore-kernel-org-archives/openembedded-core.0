Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1256C43334
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 16:16:23 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.1033.1654186575934961637
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:16:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MNL55gvs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id o9so2833337wmd.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=7Ija/LSdAIcSpdCkoNtG6GXoD+Fd8q6fEqCdKltfKGY=;
        b=MNL55gvsa+Xrepf92tZEsu8X1bFCb3NxnAGm6YFeoMY8WRvq2/sf3MeMjdEah3k/tw
         e3mbk0RLjRnpx7M85EEtwnfk2Wt2t++y2K6Mj1GJObUNCUEdLt7M87V7z903b4u9hvDu
         kfK3u4hMZAd6iyq1tKYKRkZe+/1b3TNJSxj+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=7Ija/LSdAIcSpdCkoNtG6GXoD+Fd8q6fEqCdKltfKGY=;
        b=NBuGJ+XmUyda630BJ5E6QN3vAK9RohUuJyH9cO0WqjloIJp+p20bJETLB8JKPgSJ/7
         h0I7THSppbehlC/HT7ddl7QavMWmDmmgh3RrXvOS7/oQ/HenyYQeTxqUNN4pEo6kV81P
         S8bFO1zpaHjFZCUM0+8oV7bYLe3ZA42HGuFoGKk9t30FQf/qpvNDazQSCocdOe6BvS7l
         T7lKv/4gAvimY48erPHBPwVJebz3IrGn42hz+8x+zejIDqoiL/QBUJd9+9tNF418DGzl
         SCznvadj0qS5Uhot4VAczIy2KqxkQD4Y+wXSBRvEzcTZSqdHQMTmO1UimtK0Z7oIufbI
         jHWA==
X-Gm-Message-State: AOAM53359lR85S0uY/upKtjHZhTnAMHleC6P6zKIVMIVM17yjMqNuFUs
	J282H6jS09K8XUlV795fzIv3CoDWvp62VMLX
X-Google-Smtp-Source: 
 ABdhPJymVD0ePCLCMseNysiD8qcmEXK3fdssANQH9yrQdF7l5WZPvCNqmb2oiTjK7ih0f/05WhY/XQ==
X-Received: by 2002:a05:600c:4e88:b0:394:8835:2220 with SMTP id
 f8-20020a05600c4e8800b0039488352220mr4633007wmq.140.1654186574354;
        Thu, 02 Jun 2022 09:16:14 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:171c:95a:9d1d:26d3?
 ([2001:8b0:aba:5f3c:171c:95a:9d1d:26d3])
        by smtp.gmail.com with ESMTPSA id
 r12-20020a05600c2c4c00b0039750c29cf7sm5514595wmg.40.2022.06.02.09.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 09:16:13 -0700 (PDT)
Message-ID: 
 <ed46ed5cfe8204530a7e4e24c1a8f098a5b00424.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] perl: Fix build with gcc-12
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Yu, Mingli" <mingli.yu@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 02 Jun 2022 17:16:13 +0100
In-Reply-To: <16F4D9D44BEAC048.30120@lists.openembedded.org>
References: <20220602054640.3543512-1-mingli.yu@windriver.com>
	 <16F4D9D44BEAC048.30120@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 16:16:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166476

On Thu, 2022-06-02 at 17:14 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Thu, 2022-06-02 at 13:46 +0800, Yu, Mingli wrote:
> > From: Mingli Yu <mingli.yu@windriver.com>
> >=20
> > Fix the build failure when debug build is enabled.
> > Add DEBUG_BUILD =3D "1" in conf/local.conf.
> >  $ bitbake perl
> >   | In function 'dynprep',
> >     inlined from 'S_sortsv_flags_impl' at pp_sort.c:358:20,
> >     inlined from 'sortsv_amagic_i_ncmp' at pp_sort.c:572:5:
> >   |  pp_sort.c:1232:1: error: inlining failed in call to 'always_inline=
' 'S_amagic_i_ncmp': function not considered for inlining
> >   | 1232 | S_amagic_i_ncmp(pTHX_ SV *const a, SV *const b)
> >=20
> > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > ---
> >  .../files/0001-Fix-build-with-gcc-12.patch    | 143 ++++++++++++++++++
> >  meta/recipes-devtools/perl/perl_5.34.1.bb     |   1 +
> >  2 files changed, 144 insertions(+)
> >  create mode 100644 meta/recipes-devtools/perl/files/0001-Fix-build-wit=
h-gcc-12.patch
>=20
> Dropping this as is seems to break things:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/5315/st=
eps/11/logs/stdio

Looking further this may be a repeat of:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14096

but nobody seems able to work that one out :(

Cheers,

Richard


