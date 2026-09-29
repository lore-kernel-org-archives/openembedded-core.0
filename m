Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A68ACA5FA1
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 12:08:55 +0000 (UTC)
Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6275.1790683727765443971
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 05:08:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SNcY4CRn;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.228.98, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aaea178c96so4958401a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 05:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790683726; x=1791288526; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9r1MsvBkqwgbhgoAmBT1nbWSmt/1gMbfUub+7IwH8i0=;
        b=SNcY4CRnZbxatacLIoWouYV2vnLqMNtxZW32xpsa2XT8RiY40jcuU15eph9isnt2bc
         jBnYqp9AcclWEDmLqIHLbVYwnsZ3hp0ZS7x4IXGcBsWWfwpp2HjxmfV+2wrHih7ZKL2P
         UZ2k+syqrXOAz0z8VcmXJQLF/G4QwkFXSXtTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790683726; x=1791288526;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9r1MsvBkqwgbhgoAmBT1nbWSmt/1gMbfUub+7IwH8i0=;
        b=CV1lRqDOUezXO4TXgNQ3kfTk7eTr8NAyZWqJB4qdozeM4yRtV+0qFQrEWEiBn8jzlI
         z0T31wMJYydEtoS0Cee3gqg3pWD04yR/UP93r/G0m1rz7J0WFUzHXnHREBgz/iP0dXn/
         kIzhGSBqjLPXdgCC+2g4NUxDp2YsmNQ/OAfQ8L63ruhDqpvxY0HSTAtojm/Ip3TY5SJk
         DLi4vXLfzIzJoLV0ImVlPcwNSlEHZxC6A9dvzXdcWInN4mX1o2JrlK12ssqaikPSWjDE
         qLykbSJUliyqOlUhpljNXhPSJbLMsRGkGGsGCcbfbeRLcaF/6BTqAItzMK2w+22yvflo
         17Lw==
X-Forwarded-Encrypted: i=1; AKwUvBzyTxE+hJZZV3nurlwXehiToVXG30wg2w2oNMgWaxCVLnxDn2nW2hsL3vrmHSZJqlyUDPp7C5eoaBJbYoU3vw/9FA==@lists.openembedded.org
X-Gm-Message-State: AFq9FYLOxcFZCydqJ1D+oTeiRxtt47mFgdXh2HBQHZcRcQp+ZcR8rsqm
	KayoVNP5hQPt31GovYgV16xDehcipWGULiXJJABow0wpgSQufrYedqlFrfIt8sucADo=
X-Gm-Gg: AYBFou3Yv4x1JernqyVVRjcZVMR/Djou1GyCFH5D3K+eGRkm3mBtUxwMieWxRAdMI5L
	rqxEL3t3QWZ7o7UOtVpuxrl+c1hh0KJ34puB3gG+qCndm+A3/rtx2k/Xo4wE+sQtCmXXoE/PYeP
	BkdtMqUsYfkASw+BOGySUA2iHt9xEhmBZGJN61x71irAj3bBjU4M/xzdPIC/PLyE6Fpkhno38Qc
	8xdki280+mg+odhBp4DhB4ACnxl53qM3eAcnE1gDVtd6cwROvmd8ZV4xFxM4fC04nqehRvYptKj
	NmWrzQkRKrDT7kO15yxC/Or2BbF13xMMd96dL2/PmAD7hBSjfLBgBpaXOkJz5L6ZXv5m5PEBCZm
	qnloZKKsmh3QtQJYmVZgTsmDMThizFKuDc+26qPWHb70WHObzEqYzQLAZvtlroTgWIl0BIpaQYK
	x3N9mZOWgRHN+WWq2UkP+KDVkmKmMDdjP8BWSfteDhVQ/J9lNm152G2xLUzv8TotyZfqQBYr142
	ZWjHsVyf4P99SxNaBnwNfzh9G/XwL9E2UuAYZ4DY5HC/JDtAPBqVPrapOJMe9RCuemKcPo=
X-Received: by 2002:a05:6402:3241:b0:6ac:b9b5:8e7a with SMTP id 4fb4d7f45d1cf-6acb9b59424mr761076a12.19.1790683725781;
        Tue, 29 Sep 2026 05:08:45 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c2fb:8115:9b9:553a? ([2001:8b0:aba:5f3c:c2fb:8115:9b9:553a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6acb9037302sm749563a12.28.2026.09.29.05.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:08:44 -0700 (PDT)
Message-ID: <e97ebd18e97df989e06522e09735e185e2fbb6c6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gdb: Upgrade 17.2 -> 18.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jaipaul.cheernam@est.tech, openembedded-core@lists.openembedded.org
Date: Tue, 29 Sep 2026 13:08:42 +0100
In-Reply-To: <20260929093506.88396-1-jaipaul.cheernam@est.tech>
References: <20260929093506.88396-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 12:08:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246852

On Tue, 2026-09-29 at 11:35 +0200, Jaipaul Cheernam via
lists.openembedded.org wrote:
> NEWS:
> https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;a=3Dblob_plain=
;f=3Dgdb/NEWS;hb=3Dgdb-18.1-release
>=20
> - Refresh existing patches
>=20
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

I think this triggered:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/4785

Cheers,

Richard

