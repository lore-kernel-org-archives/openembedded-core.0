Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A657BC3DA4A
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 10:10:42 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.10015.1724321432971237098
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 03:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PuE0l4yA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3717ff2358eso308462f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 03:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724321431; x=1724926231; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdeo/f3EaA+4nzhoqxx37q/WKzbK7OJuDl9JAsn1SBs=;
        b=PuE0l4yAaMdpuR58URxhHM5Ci+l+P6FIO8WiN4gv0F8f9iBljDLN6Rtt6SjLuACF+X
         MVy/08BpWsHMtRJYlidbpftwM3lkASQsWihazz8IhkcSGGE30jQgbiR3gvyXwUPJhwfn
         1zAxMj0vmFW/URhocgIAgbmubJR9e+X0woMXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724321431; x=1724926231;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bdeo/f3EaA+4nzhoqxx37q/WKzbK7OJuDl9JAsn1SBs=;
        b=fnVNoA7TXMUqdVbTF9/vkKKNPbanA/wjCm5PqkRPc8oU4GhIX16or9/Bur1bxLBKLB
         ifjq55ykrKtjImVEtUHYovQUMjIigHPhy2GkC6gQBJO+DIIn889411Hi2afwmdOOBfsj
         UDP6taafctaQBi+T/zmJBw49cCsaRrs+R1x28AfHYWWGN/MVweUmALdKy//XkwIkDgYe
         eJHWldv7abn8PiEEswU0urXbsalr0sw9YwmIIGVTC4X6vv3BWobmP0z/HHTWNoua4Ra6
         GhKzrONySjz1t7a6zCIu5J9x9eTG7+JJPiOwY+cE1f9IsqFffXySBj1FwmnKWGg29W8a
         csIw==
X-Forwarded-Encrypted: i=1; AJvYcCXqMTIzXMemn0VW6C0VFSdU9vnYifQJU2G5njRFlUHqm5iWT+uo8mh+KRztWzuLDgZrDCUIjy7QmuTkvVyfKYkqfw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz3IOfwdVYj8UTSnBQ7QBLhEKU25RF9P0Y4Zrv0UJ2Fq/kiqxTU
	EQlZbDBB0hNkANLhqBpobU00Nyu5bl17QAd2GBap2ODU9cDON0NNfUvqgQcMK+Y=
X-Google-Smtp-Source: AGHT+IEY1xToQQLqMixGH2D3Py9qJHchMFnHqU0cc0pxX6e8yE9RxvBFIYcqawDb6Tr4JlI/2hDdgw==
X-Received: by 2002:adf:e501:0:b0:369:9358:4634 with SMTP id ffacd0b85a97d-372fd5878aamr2834182f8f.19.1724321430816;
        Thu, 22 Aug 2024 03:10:30 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:71f4:5834:b5b2:ea3a? ([2001:8b0:aba:5f3c:71f4:5834:b5b2:ea3a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abed8bbebsm55985175e9.7.2024.08.22.03.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 03:10:30 -0700 (PDT)
Message-ID: <0882fdac9b736640e2ede0363318b699a0b99d51.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCHv2 2/2] oeqa/selftest/bbclasses: Add tests for
 systemd and update-rc.d interaction
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.kjellerstedt@axis.com, openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2024 11:10:29 +0100
In-Reply-To: <17EE05117ACE9BE7.29141@lists.openembedded.org>
References: <20240820223140.770567-1-pkj@axis.com>
	 <20240820223140.770567-2-pkj@axis.com>
	 <17EE05117ACE9BE7.29141@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 10:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203650

On Thu, 2024-08-22 at 11:07 +0100, Richard Purdie via
lists.openembedded.org wrote:
> I'm really happy to see tests so thanks for that! Unfortunately
> something isn't quite right, some builds passed and some failed. The
> failures:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/3754/s=
teps/15/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/3754/s=
teps/15/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/7088/st=
eps/14/logs/stdio
>=20
> and the passes:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/7074
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/7096
>=20
> At this point I've not looked into what happened, I'm just reporting
> the results.

I meant to add that I'm a bit worried this series is also causing these
runtime test failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/101/builds/8100/ste=
ps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/6427/ste=
ps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/6478/ste=
ps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/109/builds/8213/ste=
ps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/8253/ste=
ps/14/logs/stdio

Cheers,

Richard

