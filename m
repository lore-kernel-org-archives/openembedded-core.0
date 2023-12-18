Return-Path: <alex.bennee@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17FFFC35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 22:27:34 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.4260.1702938452046503406
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 14:27:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=opODMyZ6;
 spf=pass (domain: linaro.org, ip: 209.85.128.45, mailfrom: alex.bennee@linaro.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40d22d3e751so705365e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 14:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702938450; x=1703543250; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/6w5A2v171lBOsZ7STXxcMoHzFoKgZ5tAYmGx1icj8=;
        b=opODMyZ6E7WsbwjGKb22JTO1XpDsnVnS/QdJ9ah0myQekYJZHxdPeRM7b1GZ45VAbM
         iveCHpQhw3grypzcKghW8pKSVzu0eEpLTnmNjAyoOv3fE2OTxiAi/W8RhFfQ/yK9nAAk
         JeQpizNf1RMGtCqzCcTBOcfCFDZld3c+qCy7fU/GhRxdoXpWKahh1QHNA6CH68KROIe7
         nwKCQw38Q/wVNr8Unt2//I9tJuEYrqiW51TSptjqyko95LgBCLsDBBcJn1HoziQLx16g
         cxUPvtwVp1UvRETLlrdtB0cHI7b3rV5fMDEWJYIFDHsI7LYpcTM02YFJbuFC4L7lGQL9
         oa0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702938450; x=1703543250;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C/6w5A2v171lBOsZ7STXxcMoHzFoKgZ5tAYmGx1icj8=;
        b=FIxZn3YE9X9nJsvNYiMFbP37UMReWI7GKiFJEuvdqo3r2yTs9AfAvyrcVvShkqx79t
         WNd7zwje4eg6LHA2UegiEceWzqHMyM4ndOup1hivn1sRughxuH7Ll7GTT15K0o5E4VE9
         b5s5f+AZswO7ELcaPhcUOcP9Bm5jx/n06eJi7qJsAitlX+jrnggQRcmohOB1GYDek51p
         iKpf9iEXjScUXuhqyLaXIqsVoK7PO3LVtkw9fc9bUHRQq2wpV/uYdpzOVNyX6wwC0WVv
         IHx+s5UZ6M7WOXwURuzBrSHNXz8BBFuVSwX3bKhqm2U6k2doCf24S2oA9oHhBCL3mdGe
         SLmg==
X-Gm-Message-State: AOJu0YzCuIgKtuL0IExKcqxteZNAZzGD0LYf9l0RR6qQ2Q+nl+zIoCN0
	ie+noeWSeZACtOIXkJOY5pHDnmt4LbBWn3gk210=
X-Google-Smtp-Source: AGHT+IGANcxLrd8Gxv+yMQcUCs+LwJK8aOCgcWeuMnWvbaGf3Vdu9imA+g6LYyJaQv6SWF+AGL4hmg==
X-Received: by 2002:a05:600c:3420:b0:40c:3277:d6df with SMTP id y32-20020a05600c342000b0040c3277d6dfmr31522wmp.88.1702938450283;
        Mon, 18 Dec 2023 14:27:30 -0800 (PST)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id u9-20020a05600c19c900b0040d18fdfe96sm92250wmq.44.2023.12.18.14.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 14:27:30 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 937385F7D5;
	Mon, 18 Dec 2023 22:27:29 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>,  openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] qemurunner: Impove stdout logging handling
In-Reply-To: <09096b377fb5ac72d118926a861c9d70265b0f6d.camel@linuxfoundation.org>
	(Richard Purdie's message of "Mon, 18 Dec 2023 17:58:49 +0000")
References: <20231218152951.3398964-1-richard.purdie@linuxfoundation.org>
	<CAMKF1sqkizk++vW++TsyiOBSsHhM7euMNWGs8KHBJq_2yB=dFw@mail.gmail.com>
	<09096b377fb5ac72d118926a861c9d70265b0f6d.camel@linuxfoundation.org>
User-Agent: mu4e 1.11.26; emacs 29.1
Date: Mon, 18 Dec 2023 22:27:29 +0000
Message-ID: <871qbj5epa.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192679

"Richard Purdie" <richard.purdie@linuxfoundation.org> writes:

> On Mon, 2023-12-18 at 09:45 -0800, Khem Raj wrote:
>> I tried the two patches in this series. It did improve the situation
>> but I am still getting SSH timeouts. But this time its 13 tests
>> earlier it used to be 40+
>> btw. my images are using systemd. So it might be good to see if we see
>> this with poky-altcfg as well or not.
>
> Do you have the log.do_testimage and the ${WORKDIR}/testimage/ files?
>
> Did you still see rcu stalls in the logs?

rcu stalls in the kernel is just a sign of QEMU's relative inefficiency
compared to real HW. However multiple -smp will help alleviate busy
vCPUs if you can. If you want guest time to be a bit more realistic you
can use icount but actual wall clock time will be longer as you can only
have one thread.

>
> Cheers,
>
> Richard
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192674): https://lists.openembedded.org/g/openembedde=
d-core/message/192674
> Mute This Topic: https://lists.openembedded.org/mt/103244414/5085169
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.bennee@linaro.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

