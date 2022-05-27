Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C74C433F5
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 14:19:09 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web09.4196.1653661148357269681
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 07:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TCcuJC/3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id
 c9-20020a7bc009000000b0039750ec5774so2800523wmb.5
        for <Openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 07:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=9uRR1PfF+NUrXPlrpGofqNUOC2poM0W31ej0xbIj5As=;
        b=TCcuJC/3qbgSPhztOGJeSNt+sNvNoG6xl4QLPoAfiiwnwaUGTaEdykvflA6DABrZEW
         KZlX0nokpls1UJfcponZQySWxZOcv+sOpJvknl0YOgXq2B8LCB4FkusRNnUUEJLVgI8y
         ACd4chAWntOG/3ZKvmwSJy45SHDZ3LcfsqezM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=9uRR1PfF+NUrXPlrpGofqNUOC2poM0W31ej0xbIj5As=;
        b=l9O8okvkuVApkNbC/sksofihrzsJcNm3Zzs5DvnkEVCYLmSuNbiu/W817z6sBEOb7X
         wLqR8fU86/J39/K8OL12Y2lwj49pVWJX+MT2U9XHvNY2E206fiS93Bm38U/h+vshGXAJ
         pVF2lN6r5K9GDvn9Bt731qUDImu62JNROqvd/nuVCjkK8HkY+Z4hq3/gjHEvOmeF0Ceh
         +9bxmvh3CoLAga2jEtx8fYdC9OqmwzwTJxZedzQ3MVbYjuPJcWqfJYh5TUQu2cdgGmxl
         JnLYOy8GlRfkTPg7P/mlA5EcnBBzwTtJeLxuHI+kBjfW6bLiVeUxrl17+NmmrHGTEimQ
         BuAQ==
X-Gm-Message-State: AOAM531B8gEr1u8Scx5pbbb2M/2UyAbuZ0+MXQNz9VJ4oMd3gIul/NZi
	TEJF8v7A5GPU7cVNCXSP0nENUg==
X-Google-Smtp-Source: 
 ABdhPJy/vKANhtget7QWL3clHLJjSWvkHa9dvXeH6H1ppAR1qzIZlBaakb9v+5gUeWjpsquRbUhSbg==
X-Received: by 2002:a05:600c:2e54:b0:397:57df:dfb with SMTP id
 q20-20020a05600c2e5400b0039757df0dfbmr7178670wmf.200.1653661146785;
        Fri, 27 May 2022 07:19:06 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6a82:36c1:b105:e682?
 ([2001:8b0:aba:5f3c:6a82:36c1:b105:e682])
        by smtp.gmail.com with ESMTPSA id
 v22-20020a7bcb56000000b003942a244f47sm2252579wmj.32.2022.05.27.07.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 May 2022 07:19:05 -0700 (PDT)
Message-ID: 
 <01c18d2c70290294a649df5c8e044b9d680ebf82.camel@linuxfoundation.org>
Subject: Re: [OE-core] externalsrc wiping out external source directory
From: richard.purdie@linuxfoundation.org
To: kristian.amlie@northern.tech, OE-core
	 <Openembedded-core@lists.openembedded.org>
Date: Fri, 27 May 2022 15:19:01 +0100
In-Reply-To: <f3eb760d-07f2-b5ca-a425-fc1166be8064@northern.tech>
References: <f3eb760d-07f2-b5ca-a425-fc1166be8064@northern.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 May 2022 14:19:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166209

On Fri, 2022-05-27 at 14:07 +0200, Kristian Amlie via
lists.openembedded.org wrote:
> Hey all,
>=20
> I have a problem on kirkstone where using the "externalsrc" class wipes=
=20
> out the directory mentioned in EXTERNALSRC, in other words my personal=
=20
> development repository.
>=20
> I have traced it down to the "do_unpack[cleandirs]" variable flag. This=
=20
> flag is supposed to be removed here [1] when using "externalsrc", and=20
> indeed I have verified that this is the case. But when the function is=
=20
> about to be executed, the "cleandirs" variable flag has somehow been=20
> restored [2]. This causes the directory to be removed after all, despite=
=20
> the attempt at avoiding it.
>=20
> At this point I'm a bit lost, I don't really know what happens between=
=20
> those two steps. Does anyone have any idea what might be happening? It=
=20
> sounds like a pretty serious bug to me, wiping out things in the home=20
> directory of the user.
>=20
> [1]=20
> https://git.yoctoproject.org/poky/tree/meta/classes/externalsrc.bbclass?h=
=3Dkirkstone#n93
> [2]=20
> https://git.yoctoproject.org/poky/tree/bitbake/lib/bb/build.py?h=3Dkirkst=
one#n191

That certainly isn't supposed to happen. As you say, the code is
supposed to disable that and isn't behaving as intended. It is hard to
say more though.

Is there a test case you can share with us so we can reproduce the
issue? Without some way to replicate of more details of the environment
this occurred in, debugging it will be very hard.

Cheers,

Richard

