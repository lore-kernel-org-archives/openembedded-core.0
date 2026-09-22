Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA1ACC982FA
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 21:25:35 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.370.1790112332733569435
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 14:25:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bWRds7GW;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b91369d18so1810465e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 14:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790112331; x=1790717131; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vBCefUO48LiCZYg2mgAtMT/+Ey2QAYvf3Xbqr/DfKz4=;
        b=bWRds7GWJSTIRfG285TNvTwGCx1PjEF4ZK439ULkDyQPtJCeiKG2NN+MF32t3WciFw
         eYN2vV4FvFCgBv927GtZPwquwgC0GxLNAsF4VMwYr2iAIZCmtpZj6m2BlWpl7P5k3y3Y
         A/G26EzjlZH5u1RwWF8t49F/3V9BGlrauoOp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790112331; x=1790717131;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vBCefUO48LiCZYg2mgAtMT/+Ey2QAYvf3Xbqr/DfKz4=;
        b=rRdNFh/D1RPoxhBmNjCBoGPhGBI7ET6ulj0vmLE5Yz/akhjBzNQrTnwJ02BAWFpr/O
         ta3j1qXNhihjWVWev7up7w+YftiWBNkjvld0u8DODHiCvaNZt0qgZE2DLn0buWLy1bwz
         +mUWWRYl63us+bTupMWF8J2CibNpVdu8emFk8MQoeK4Wb8BfTtSCAgmm6gLfnEp+v+HM
         zr+w3bDNlHltd3USgKFSAXmCiAZ2Z3cwpuz70fcOcY/SsKhDZ8tbQEU/WbptkSkNMurH
         33Rhvhjt+bG6owPv9In+bEvK3KnI3aMSs1IAfYV8XBG2MeRqJ6seawGVG+9NspkIIukt
         0FNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzo0VjHgTMAYrjlyNkqkdAI6UUoaEb197t59ypIvSOnWGY1BUu8Uz3+ZOrBu4mcY7SQsOoDowNbDqQTswp1Gc4fJQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++nYOE0xAAE8+rrRd72tkfp6QVkZ7yOYEn9hx44VE3Zm77unRSMP
	tGUdCd65jlWkPDLmpc5ZIN+aksDgO8e6kK9Oc2vfOnz9orANIpyhxJB+8/B/uYSCswU=
X-Gm-Gg: AYBFou3Ez5Lq4Rb7J2AkExLHlpVGK5HksT+0G4Cbrqc9jioLq1YfOfcJdAJe8u/exDF
	mDfKmImAjKE11Nzw3duQuFQC45WlBGRMHunySaTjZeBr5sHzVibS+evfRnjFdoGycLEyjwzsigc
	eP/UOmeTw/VwuWP8ytZfH3+KlTrpRknT4wkyNsr0/gf2A+BYWHZqhQpULTuriG6hCwK6FGqEQOX
	NzZF+XdFWVkM748fHvNge5YU28r9FZg3E2euEixagbdrhneGiO0EhmEXjXlFBhJveUP0SE7t6Mq
	qIndj+LB9ph/+m/mljusPgr5K6C5lw3QWXgK3ZBldkSD2ixOVCRDcx/CPQJ7KVOwbEMKNZJaVqo
	+5ELYKOSl5fxjn/soH/9eekHVNkX0MLxy+CTQJ5aT+OnG5eEN0YwhFOzx9JK9IF6TVCI71MfmWt
	cty2FtAWAWDE9rzND9X43vuLeY08Qc0ogAzaL7BGtXxZ+4cswsB21iwl2D9YslXwfvB1GD8M6/g
	C9j22TkXvLhSmD6nO/tmQSLK6HsTJtNZS2+Z0HPhpgVYgU1NGie+AW0dbhrngXF2133l66PzQ==
X-Received: by 2002:a05:600c:3581:b0:49b:96a0:5c00 with SMTP id 5b1f17b1804b1-49fdf0fc7abmr7252615e9.13.1790112330872;
        Tue, 22 Sep 2026 14:25:30 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fc4d:729f:8bd0:1e4f? ([2001:8b0:aba:5f3c:fc4d:729f:8bd0:1e4f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868486408sm1132818f8f.9.2026.09.22.14.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 14:25:30 -0700 (PDT)
Message-ID: <037ed18f93c13a14073b1cb5c83c1da3d3b647a6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] package: introduce PACKAGE_BASENAME for
 consistent kernel -src naming
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.kjellerstedt@axis.com, "adrian.freihofer@siemens.com"
	 <adrian.freihofer@siemens.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Sep 2026 22:25:29 +0100
In-Reply-To: <DB5PR02MB1021327C9D3FB6F7CE13BEAFCEF832@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260921215300.582692-1-adrian.freihofer@siemens.com>
	 <20260921215300.582692-2-adrian.freihofer@siemens.com>
	 <DB5PR02MB1021327C9D3FB6F7CE13BEAFCEF832@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 21:25:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246428

On Tue, 2026-09-22 at 17:09 +0000, Peter Kjellerstedt via lists.openembedde=
d.org wrote:
>=20
> But that isn't really true, is it? E.g., PACKAGES below is defined=20
> based on ${PN} rather than ${PACKAGE_BASENAME}, and so are all the=20
> FILES variables. This seems more like a band-aid than a complete=20
> solution. (And no, I am not suggesting to change ${PN} to=20
> ${PACKAGE_BASENAME} throughout the code because that would be=20
> madness.)

PN is really the recipe name so it should be RN too!

Cheers,

Richard

