Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F86C9832A
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 05:42:30 +0000 (UTC)
Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com [74.125.227.38])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68104.1790626258925676798
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 13:10:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=nbiAflz3;
 spf=pass (domain: baylibre.com, ip: 74.125.227.38, mailfrom: tgamblin@baylibre.com)
Received: by mail-vs2-f38.google.com with SMTP id ada2fe7eead31-7b33a8d79b3so863940137.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 13:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790626257; x=1791231057; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2RrxLvbX+4JBkGkol5oKWfO8nLOjYDrJWuNrSQb76bY=;
        b=nbiAflz3RvzHWahc6qJOV2cmWnX3ujcjx0FLUu7j6ROsyXZO6HpIY97NIBN1hJiFG/
         3gsjjTzKHUeT7NjmsD9gcInY1K40bHqnTdeRfJnZOxJa99lfsrrtVeUh7qoMqegrLQLx
         RZNoXQ5+NbE1EtD+2DErl6whuNJll95dZQBFXX1u8TMc7A/d41XIVKxT9KHLISYIjkQG
         Q4KOO48NCzL3VJgCkYpi9Q0wSCF5fdaePw91HGsYPxfT3+g6yKMy8kanu+cHQtOXP6u1
         z6HSjfCkwl81RGOVwa5TJPTr+lbr3aJGTdaYX/aB4xBPXO7zo9Sy/U6+AokeDGpVIN7D
         OtCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790626257; x=1791231057;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2RrxLvbX+4JBkGkol5oKWfO8nLOjYDrJWuNrSQb76bY=;
        b=O8ZN6BwiTyLnve3id5I584kvtqcyJ5xN0ReJVd6iBSJHSSCBw66NaDZE4libf3Y/aC
         OVYPWvuHMWXZWY0T2jwjIVByJxbvHTFi4XWYBfoLkPdQKD+qCRv7aJLvhXaM5TuDPAIP
         N+3v6gtdwWxqJOii+lyZUE0of/ZV2gl+0e8c5TuEaV8n/TXzsbZ9+ekvUavI8RQfmI1h
         ECYm7XHMP6vPhzsHczstaw00vSgz5cdFIfpZ/YWUj+rD2GtEXfYsg5Wk5Q8M787RHdy9
         PlLbnqQHqCkyDCeG3jcwgU+iQyAYSx1CPYkLGIzRJNC5dIB2USMC5FWLD3uBVd8ePrNE
         Axcw==
X-Forwarded-Encrypted: i=1; AKwUvByZ9CAdO1dFBNQ3Tw+cgcJbBK96wk2HmmIuVvlt5bqdFwEjcfLmvdt1wX3r2WtCzPkvwwFeQJrOMvhfvTuw3xA6Rg==@lists.openembedded.org
X-Gm-Message-State: AFq9FYKRu++8f7ZMAftIsxAaYBgUtSZ1Bs310Lyi9AWHDt4ThAf/F8X0
	CMiNqb0t7AhDmVFBOmQFObVCwfqd24xa+v1XHX/CI35FomHZjooZbLyLbojtwdclNcw=
X-Gm-Gg: AYBFou0YNadbn4vGuVnTYlZrrLcyL69L86iBfMbIDt5UyqPQnNevJYwMgsROTcMLLv9
	oigTk3kQuDAQvy9dQwTN1AZ+LqdkLutnee7Oc0aIDQFAl8ieQIZyPupjUdlwXji7rPmEh7xQ8IV
	n6lawVhbz4I4vcNI8F2zwdqahS4c5zFrCM30kfk7i+MNkCLayoxJ9FZPcKJLipbMScBJbOZkv7i
	zOqy/DBcKYVN9zfEzfewGhDJsljvufrmkqRnA6dNdsNUF/+hOu8tRZHYGZ2bVpEmo4GywaVRBN9
	/Pmh2AKf3pCEfk/v8l0cKKHOpZT51o1tlNtdIs8/CYW2KjdV1a98rj1xd7NUp59OP+9uy8Ek837
	OCDHYgjAaoww0WxXrXMJ2CvX1e40B8fbEIPFAd1l8/MCtH8Qj+ZQdVQ4QaMuVODCpIDWhn7q07u
	z2HiZgv9hTOwjRvkxTSDYh+kji3m9di/c1CCGxJcIU5gVxw/8USCSEm2+zKUR1UOfU0Xo+4BBZ9
	GgsnerIAkZsSYpmPI23obS58atPXd+0vg==
X-Received: by 2002:a05:6102:3e8e:b0:7a1:f7d2:e839 with SMTP id ada2fe7eead31-7af1dadc074mr4397180137.25.1790626257442;
        Mon, 28 Sep 2026 13:10:57 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:1977:be2f:4a71:2892])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-988baa163d9sm794019241.8.2026.09.28.13.10.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 13:10:56 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 28 Sep 2026 16:10:55 -0400
Message-Id: <DLR815MM9PVW.3UX36O7ENQ9JH@baylibre.com>
To: "Joao Marcos Costa" <joaomarcos.costa@bootlin.com>, "Trevor Gamblin"
 <tgamblin@baylibre.com>, <openembedded-core@lists.openembedded.org>
From: "Trevor Gamblin" <tgamblin@baylibre.com>
Subject: Re: [OE-core] [PATCH v2 1/1] recipes-support/gnutls: disable slow tests for RISCV64
Cc: <thomas.petazzoni@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20260928162614.1685239-1-joaomarcos.costa@bootlin.com>
 <20260928162614.1685239-2-joaomarcos.costa@bootlin.com>
 <DLR4232VEGLK.D4805FQMYD9Z@baylibre.com>
 <3e52db64-1a47-45da-b357-83044c711f10@bootlin.com>
In-Reply-To: <3e52db64-1a47-45da-b357-83044c711f10@bootlin.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 05:42:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246820

On Mon Sep 28, 2026 at 3:09 PM EDT, Joao Marcos Costa wrote:
> Hello,
>
> On 9/28/26 7:04 PM, Trevor Gamblin wrote:
>> On Mon Sep 28, 2026 at 12:26 PM EDT, Jo=C3=A3o Marcos Costa wrote:
>>> Timeouts have been observed (very frequently in the past weeks)
>>> in the autobuilder, and a bug [1] was filed at Bugzilla.
>>>
>>> After some investigation [2] was performed by Trevor Gamblin, we now ha=
ve a
>>> list of the most time consuming test cases:
>>>
>>> - mini-record-2 (187880ms)
>>> - record-retvals (145390ms)
>>> - rng-op-key (63820ms)
>>> - rng-op-random (63330ms)
>>> - rng-op-nonce (63260ms)
>>> - dtls-rehandshake-cert (61360ms)
>>> - dtls-rehandshake-cert-2 (61230ms)
>>> - dtls-rehandshake-anon (61030ms)
>>> - mini-loss-time (60130ms)
>>> - mini-dtls-hello-verify-48 (30050ms)
>>> - tls12-ffdhe (27790ms)
>>> - x509sign-verify-rsa (18460ms)
>>> - x509sign-verify-ecdsa (16050ms)
>>>
>>> Disable them to avoid so many timeouts in qemuriscv64-ptest runs.
>>=20
>> Thanks for submitting this. I'm sorry if I wasn't clear before, but I th=
ink we
>> should only disable mini-record-2 and record-retvals to start, since the=
y are
>> significantly longer than all of the others. If gnutls remains a problem
>> afterward then the others should be considered, but for now we want to t=
ry
>> retaining the others to maximize test coverage.
>>=20
>> Trevor
>
> In that case, I'd rather remove at least the cases that take > 60000ms=20
> to run, and avoid getting back to this again when the runners are more=20
> loaded than usual. What do you think?

Sure, let's do that for now. I'll keep a list of tests disabled for
load/performance reasons and come back to them at some point when we have f=
aster
riscv64 hardware in the AB cluster :)

