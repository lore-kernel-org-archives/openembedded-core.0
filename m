Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 263FAC433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 10:00:00 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.70359.1656928790908872205
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 02:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hIZCOVuX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id v16so1255384wrd.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 02:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=9N6gS1aKtOeVIHSAp26emIs2GElfqoKM76ypOzfM7UQ=;
        b=hIZCOVuX2FGMi+0DjefuZDhSu5+nCfdRTbKjFHdMcW3a6jZ0ApAx7RRbQkQ7G/RHxr
         ptEjCtnbStXaSxrA+Q48ZQ3FwuHwOdBnwWq6ywAwkWYdup6XnhhGHxw6g+KFQOdZg17X
         Hxgp/3XkJDovuDyCtodzatj9ru+zlpDbiT1Fw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=9N6gS1aKtOeVIHSAp26emIs2GElfqoKM76ypOzfM7UQ=;
        b=bkzsaMe35sJXwnNJ6YgXPgxDyD2beLYH6lg4F/QIUKBIa9uTndYcwaLXal5pt0BCdo
         E7h+H8o7UAnC1bAw+MEaaCGx5ESCRuf4+sBDbV3/JLlZaohlrLd59B3Pujf0/hHZOmc4
         yxWT7fa8I3wGVhKol+F+R18ypHEFdH3Mzxq0KQ6VRBSrqx8VeBtx0laQOlrhiyQlgohN
         K3HMUrtLDw5ZIM5amFYzYxo9oq5ZmYT05LmHYxjBgCUFaID/ysNbYSABw7Mc00NDycun
         YFSENNGFaPfNZMV1VtHbONU7IRyzAiee9RzrjwU0FXDLLsUfvYQmbLdWbnsfcxz+aKoF
         smcg==
X-Gm-Message-State: AJIora9Bs28Wgkyn74Xhjb7JpIRC54YQSXRMKlyvlH4JppkdF6TCjRx8
	bctglsdjtxBp3RhVT1yoFwlW1GIC1OsSxg==
X-Google-Smtp-Source: 
 AGRyM1vdpQwzxIMmkN1iNpFNSOEDnSNs6fyK62t6edj5UfmKjSPaIvhfl3YyW7l1yyDk+lOXgNXHuA==
X-Received: by 2002:adf:d1c9:0:b0:20f:c3dc:e980 with SMTP id
 b9-20020adfd1c9000000b0020fc3dce980mr25596769wrd.552.1656928789231;
        Mon, 04 Jul 2022 02:59:49 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fa18:c075:6c8f:aaa2?
 ([2001:8b0:aba:5f3c:fa18:c075:6c8f:aaa2])
        by smtp.gmail.com with ESMTPSA id
 l2-20020a05600c2cc200b003a18e7a5af2sm11912749wmc.34.2022.07.04.02.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 02:59:48 -0700 (PDT)
Message-ID: 
 <dc9548916fa201b3b4fff5b2cd133816d4630d25.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH] bitbake-layers: add layer
 repositories/revisions save and restore tooling (aka 'layer configuration')
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Freihofer <adrian.freihofer@gmail.com>, Alexander Kanavin
	 <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 04 Jul 2022 10:59:46 +0100
In-Reply-To: <57530a45296f2c2e7e86b05aa1b7f10965b586f7.camel@gmail.com>
References: <20220701192449.1358325-1-alex@linutronix.de>
	 <57530a45296f2c2e7e86b05aa1b7f10965b586f7.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Jul 2022 10:00:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167602

On Mon, 2022-07-04 at 11:01 +0200, Adrian Freihofer wrote:
> Thank you for initiating this important discussion with the code. This
> could be one way to address this issue. However, the discussion here
> also shows how complicated the issue is and how fragmented the
> solutions and opinions are. There are already several tools out there,
> but none of them has proven to be "the only right way". I'm not sure
> that writing another tool is really the best approach. The complexity
> of the proposed tool seems to me to be already at the upper limit,
> where on the other hand Richard suggests to develop it even further and
> publish it via pip. At the very least, I see the risk of ending up with
> just another tool that is very complicated, needs maintenance, but
> still won't be accepted by the community.
>=20
> Personally I really like to build software as simple as
> git clone --recursive
> bitbake my-image

This simply can't work, unless you have a different parent git repo for
each configuration you're going to share with users. It can work for a
single configuration (e.g. set of layers) only.

That works well for your single company single use case, it doesn't
work well for developers dealing with multiple layers/configurations.

> Setting up layers is basically just about fetching git repos. I don't
> see the need for creating some configuration files or other complicated
> tasks during the initial setup. So before introducing a new tool,
> please let me understand why git submodules have not been very
> successful in the past. I see some reasons for that:
>  * In the past, there were different RCS systems and the knowledge
>    about git was not everywhere. I think that has fundamentally changed
>    and the acceptance of git (and also git submodules) has massively
>    increased. Today, git may even be the only version control system
>    that needs to be officially supported to manage bitbake layers.

I think at this point we're only considering git. That said, there are
submodules, repo, subtree and outliers like combo-layer so even limited
to git, this isn't straightforward.

>  * We still use the submodule structures that Tim mentioned. In
>    general, I agree that using Git submodules is unnecessarily
>    complicated.=C2=A0The challenges start when multiple hierarchies of
>    submodules are used. In this use case, I miss a simple command like
>    "git checkout --recursive" that does everything I currently have to
>    do manually with multiple Git submodules sync, init and update and
>    cd commands.
>  * Probably the lack of a simple, recursive command in git is also the
>    reason why some CI implementations are in rare cases not able to
>    checkout git submodules correctly.
>=20
> Do you think there would be a need for a new tool if:
>  * git submodules would be easy to use?
>  * The Yocto manual would suggest to use git submodules for managing
>    the layers and also provide an example folder and submodules
>    structure as a guide line for the users?

The Yocto manual cannot mandate submodules. They work for some people,
others despise them.

>  * If the knowledge of git had been as widespread a few years ago (when
>    the distributions Tim mentions were published) as it is today?
> I believe that today it may well be possible to establish git
> submodules as the recommended solution. (Something like an easy to use
> "git checkout --recursive" command would certainly helpful.)

If people were going to standardise on that it would have happened by
now. It hasn't and I don't think it will. They work well for some
usecases, people want/need/like other tools in other cases.

> Since the majority of mostly experienced Yocto/OE developers who are
> participating this discussion tend to develop a new tool, it makes me
> wonder if I'm missing something. I see the following use cases where
> layers need to be fetched:
>  * Initial project setup for working with bitbake.
>  * Retrieving layers from an SDK. (I'm not sure if this should remain
>    something special. The PoC which was recently posted by Alex for
>    bootstrapping the SDK directly from the bitbake environment looks
>    very promising to me).
>  * Fetching the layers on CI infrastructures which often call git fetch
>    with fancy options to improve efficiency. (That would probably not
>    work with a Yocto specific fetch tool anyway.)

There would be some value in having a common shared way of doing this
should as many people need to handle CI at some point.

> Do you see other use cases for a layer fetching tool?
>=20
> What do you think about trying to optimize git submodules to handle the
> "layer fetching" use case with a simple command, rather than developing
> a new Yocto-specific git wrapper?

I think you'll end up with repo :). There are definitely Yocto specific
elements to this which is why we're seeing specific tools.

> Is it really useful to generate a configuration for KAS? A tool that
> generates a configuration for another tool that finally does a Git
> checkout seems a bit over-engineered to me. At least for us, an
> implementation based on Git submodules would be usable, which would not
> be the case for a KAS based implementation.

If the alternative is reinventing kas then it could make sense. See my
email for why I think we need something higher level than these tools,
which is implementation independent (as much as it can be).

Cheers,

Richard



