Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB14D18148
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 20:40:33 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.2302.1728938430839448786
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 13:40:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SsWAahFb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43123368ea9so22715875e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 13:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728938429; x=1729543229; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zGADr7bsgxw+yDFXH9AkYG3Yti6z84ZVtmthC/ho9Zk=;
        b=SsWAahFb+3d1BpkHYAseNBhLz1q6haniIfLUCawew80RBMEpwFfgpmsbOD/kJbNWyF
         Njn1fmFIHBhgjMkS2xJDg5NZgHsqmMp9NkiH0lfHJ1mDRIGVUUH0KtArpSgNqCiOV5/L
         9bzee19KhIxJLvFHSRMS61xwno2+iApCPZZ10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728938429; x=1729543229;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zGADr7bsgxw+yDFXH9AkYG3Yti6z84ZVtmthC/ho9Zk=;
        b=X96jXCKsskOMllIBjEg1JH2IPgP0wCbYnA+fOdhx4WDRlhyEnjS3EM++ma3PJvu3YC
         k0r5tazxoatsc/aD06Ytp6k2RaplCmM5e23Zc8Qvuc/SHgNAKYNzmk6fZH/FDObCV9Rl
         GgmorCamZRlId32fkM6xKfgz1BqK4ZjlFKUHhemnjeXot3XEh6GakzGDYzt7dNDnh2Vf
         aimOVii4dcV4T9Y3ra5oWlQz1Lol774gb6/vryTugg4F/99dPz8w9MM9Ud7QTX2lbzyJ
         07RXn7f8kztpNO+CGZ6Ro1FSGN0ADwqudWPguUzOa4o8RKhJscj/GdY/xzVlNaYtDGKe
         nZPw==
X-Gm-Message-State: AOJu0Ywonp/nJZsyl0lU2nai3xm24XIqCV6TedX2BR1/qLS17Bz0yzLc
	OxxDRyvkEs5ao0swj+m94N5sCAnJvebEksRyiFszh1Cj/cXYhkp6gCXM7vQAMfXjFT0lFntAqC3
	9
X-Google-Smtp-Source: AGHT+IFR6azHFJPbdiV7wVOTGJY4gDcmbiAlnXOrc9ZHqxCdVL3vfr3ZNYxN09gJmthFeozmEXk6Ng==
X-Received: by 2002:a05:600c:5126:b0:42c:b63e:fe8f with SMTP id 5b1f17b1804b1-431255dd131mr91749835e9.13.1728938429047;
        Mon, 14 Oct 2024 13:40:29 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5d67:aec8:c701:7924? ([2001:8b0:aba:5f3c:5d67:aec8:c701:7924])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43117ff5930sm132302915e9.0.2024.10.14.13.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 13:40:28 -0700 (PDT)
Message-ID: <98d9bfbfe67799f05a0ad897ec2a91638afde647.camel@linuxfoundation.org>
Subject: Re: [OE-core] Latest AB-INT unexplained mystery failure
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>, Mathieu
 Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Ross Burton <ross.burton@arm.com>, Chuck Wolber
 <chuck.wolber@boeing.com>,  Adrian Freihofer
 <adrian.freihofer@siemens.com>, Marta Rybczynska
 <marta.rybczynska@syslinbit.com>, Jon Mason <Jon.Mason@arm.com>, Michael
 Halstead <mhalstead@linuxfoundation.org>
Date: Mon, 14 Oct 2024 21:40:27 +0100
In-Reply-To: <17FE55BCAF4D83DD.4702@lists.openembedded.org>
References: <17FE0CA1425F2338.24631@lists.openembedded.org>
	 <17FE55BCAF4D83DD.4702@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 20:40:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205794

On Mon, 2024-10-14 at 14:46 +0100, Richard Purdie via
lists.openembedded.org wrote:
> e) bitbake server timeout issues
> --------------------------------
>=20
> https://valkyrie.yoctoproject.org//#/builders/48/builds/185/steps/14/logs=
/stdio
>=20
> I've saved=C2=A0
>=20
> https://valkyrie.yocto.io/pub/shared-failure-data/fedora41-vk-1-selftest/
>=20
> =C2=A0- the json logs are something we've not had before for that
> =C2=A0- the key message in cookerdaemon is "Idle loop didn't finish queue=
d
> commands after 30s, exiting."
> =C2=A0- that message is there twice, it failed twice
> =C2=A0- can we decode the json logs and get timestamps
> =C2=A0- looks like it happens in particular in the siggen code?
>=20
> Who/Plan: TBD
>=20

Happened again:

https://valkyrie.yoctoproject.org/#/builders/48/builds/192

fedora41 again. Logs into:

https://valkyrie.yocto.io/pub/shared-failure-data/fedora41-vk-1-selftest/2

Cheers,

Richard

