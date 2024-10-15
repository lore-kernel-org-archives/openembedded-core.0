Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D4FCFC276
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 08:23:09 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.8395.1728980588307488844
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 01:23:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gmO9BKd1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43117917eb9so44854875e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 01:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728980586; x=1729585386; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7RceTBdMUmLOMHzyAUB5MNG7NUKqtp2I0L2bDmZ+CmY=;
        b=gmO9BKd1d3ImoBVu2batmCG33kf9yUwoASYKboN3s0hbF030jNOeSWa7KnuIsFPUB/
         vnIjIeIGdjJb/6sv2wtYfqotjNgAYujySImL/wl6jXyYqZTM1QRA5Y7Ww8Ku5Fk1O6og
         eqnhmq3kV/OLixRwUYvn0JDPRNcFD73pJCa0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728980586; x=1729585386;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7RceTBdMUmLOMHzyAUB5MNG7NUKqtp2I0L2bDmZ+CmY=;
        b=hMJf9n/RdO7h4yldUltvxMSnfDgjgxw74CAafGYcO70ilLUKTTW2Nb1lXfLgbAeVec
         xc0A2dJV4IciWBV9Tmp/iOmKLdVLkoCuuhE579a8ob50eyvzEISUMNCRF7kZSgYBSeRW
         UqwSEuRt4iTWbJfdaKa/teGsEVn6/TeQO5DbuCBfiULTjMOkIshrq2YmAE8uWxiB876p
         Lv5Kyctu1fW1J3B70/1xmX7ZZG2ae04/9hDRkaf39ennLEgsKWOLFj32PATXqEdRryxd
         FGa/hCkMiDzfm6QOw9tfBTaVWJ48X7h8jjP3QGR5xSUx5Ar7T2osA3Gf3tqdQlw3HmzW
         9dpQ==
X-Gm-Message-State: AOJu0Yws4I0daZ8+/MK6hJwG+l5RJLcIJBUGvNTSQZoe+layO5HqMQe6
	tFK1+F6xcviiFYFfXGYhlZI3IdEpNxsjg47qn4BnrXebL8d3YDClUjEGp4dX8QFeDuysHvXEFYm
	P
X-Google-Smtp-Source: AGHT+IGDIBzJEluVpPvoou8FWE2EN4RjqAHT4kV58tGV/8bna/I7VEdqCS3vagx7cflEZm+woadlGQ==
X-Received: by 2002:a05:600c:5122:b0:431:1868:417f with SMTP id 5b1f17b1804b1-4311dee4dfamr137639295e9.17.1728980586440;
        Tue, 15 Oct 2024 01:23:06 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:28fa:e6b1:dce2:85c9? ([2001:8b0:aba:5f3c:28fa:e6b1:dce2:85c9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fc12023sm932069f8f.91.2024.10.15.01.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 01:23:05 -0700 (PDT)
Message-ID: <565be395a1f9243e5eaf1c9c77c6ac97206f1282.camel@linuxfoundation.org>
Subject: Re: [OE-core] Latest AB-INT unexplained mystery failure
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>, Mathieu
 Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Ross Burton <ross.burton@arm.com>, Chuck Wolber
 <chuck.wolber@boeing.com>,  Adrian Freihofer
 <adrian.freihofer@siemens.com>, Marta Rybczynska
 <marta.rybczynska@syslinbit.com>, Jon Mason <Jon.Mason@arm.com>, Michael
 Halstead <mhalstead@linuxfoundation.org>
Date: Tue, 15 Oct 2024 09:23:05 +0100
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
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 08:23:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205800

l) libz reproducibiity failure

https://valkyrie.yoctoproject.org/#/builders/37/builds/265
https://valkyrie.yoctoproject.org/#/builders/37/builds/266

https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20241014-68a7dqot/=
packages/diff-html/

This looks familiar somehow. Looks like a 'configure' issue of some
kind (it isn't autoconf).

Who/Plan: TBD

