Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 939D4CD5BB1
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 13:53:18 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37495.1779803595817962215
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 06:53:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eD5r8jNe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-44509921fbcso6794427f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 06:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1779803594; x=1780408394; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SLNbS7DVipj5CKYat1XmPWddDvkmhtmC2QKCO0tJBB8=;
        b=eD5r8jNeM5d/W7TXpJ50f9Ft8QffwmS0SoIS0M8n/H12MJq+S7AUWE7HcWXzDIfP3N
         Y9Li1gPcJMHyhPU+UpoXS6XU3J0HakaLIz2waeRXb7Kn5UcJ/4PPT9UEXRhNIrqoPZkp
         rDTYSG1nJPPu5OE7BK98sXKf8fQqYHPp3GTrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779803594; x=1780408394;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SLNbS7DVipj5CKYat1XmPWddDvkmhtmC2QKCO0tJBB8=;
        b=YcoFkbLJzp7ZE/5smZxihc9Tnpdve6p7/H0jVYw7ovUQtKyQ5Ee+A3SYwtkWnr8MSQ
         U6V7lu0H4SL+7c+DYhN92S4j1vxwQL5zxpIB0NmS/qqME/DXj6GtI7UdVjiXAyfQJutC
         z2CBQ18bn1J+nA97/r0ax7yBtxbQyEuOGCgrQbR3B6UIJTGBTXZ39op3S4+6ZCr1XwpA
         nSM5/iwe5/UOmsHUxF/aDL9SF8fz8f18Aw6p2TB5PW9bWkqLA/DV3r6fTCq67kW+1DiP
         t1XUFu/AsJI/LMFzx7gOpU63gzamfj1ulqNNnIowxpy6MqYqVwkToosei6eYuyafWBnm
         yNhg==
X-Gm-Message-State: AOJu0YwrvNEjDzX14X5LK0WYxo+bDE5RJJqR3ScuS/X9DQlIfsDCQnxk
	12ZAaTC6KDZLDyhIEgm6uyTcxzQe0zi9F1mhMBz56O3f84GvC5S2XXNtclG913ROuxQ=
X-Gm-Gg: Acq92OEdpYgCk1fw87uqpsWJlI4D5oOVoSVAQFbSmYer0jL/RUNvblCfTRSM3T6rWoR
	vF86vTWMnnZFDC9alldsOldq2UREGX/BGqcUKXsX7i90idtX/4Br+fwjtiohzDd7seTWjG4+3hS
	k8vygCVH1CMvZktU3yC3PNiF177XaAbIfmaUO5j9/0Q3Drt2paHaVeDeeZRpF+OUua7xipCBULp
	WFAzncCienm9E02CJFmVGLQAJbd87uE7xmgx0za+EdNtjcIsHVOoQl93Cvo1kNDBdwAx1M21pl5
	eXmEHTZe4+HSbI+tMDy5Zf6hxbwV8tykrcS9I2o+4gLciF5Fd5D7dIX2boKeKdzajMCQt2U0JPu
	b+cY4/ioTGeV9mU2hB39MOSX86jKbYwmL5mPPooRNJprRYEMtP2Qegayb3DCBWeo3x80ixJ+ieb
	2GZlVEDN2mPYzgSoVmyXWx37OVPCfUq73CS+ZKP1E53FJSsKNcpZgtMH+qg+8Tc4riIpFgaUdWR
	gX6wPyxgoRv7TvS
X-Received: by 2002:a05:6000:1ac7:b0:43d:67d1:2022 with SMTP id ffacd0b85a97d-45eb36890ccmr33144896f8f.19.1779803594097;
        Tue, 26 May 2026 06:53:14 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2e34:2d9a:782f:4147? ([2001:8b0:aba:5f3c:2e34:2d9a:782f:4147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5cb9asm38651274f8f.27.2026.05.26.06.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:53:13 -0700 (PDT)
Message-ID: <955fabd11056b0527cbf0ec96988cd98674ed1f1.camel@linuxfoundation.org>
Subject: Re: [OE-core] Re-visiting: bitbake-setup on PyPI as the recommended
 install path
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer	
 <openembedded-core@lists.openembedded.org>, Daiane Angolini
 <angolini@gmail.com>,  Rob Woolley <rob.woolley@windriver.com>
Date: Tue, 26 May 2026 14:53:12 +0100
In-Reply-To: <CAP9ODKp1eh1Rj+q5s7Mr+vTZQBny9-Zwxty0qJkJ0gyaYvYX_w@mail.gmail.com>
References: 
	<CAP9ODKq0E4gjR2R6TXK38v-a3wQa5Yi892BVOB=3YoU+ibM23A@mail.gmail.com>
	 <da740047848f706c420629378838229833bc9fe4.camel@linuxfoundation.org>
	 <CAP9ODKp1eh1Rj+q5s7Mr+vTZQBny9-Zwxty0qJkJ0gyaYvYX_w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 13:53:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237610

Hi Otavio,

On Tue, 2026-05-19 at 20:11 -0300, Otavio Salvador wrote:
> The reason I'm pushing a bit on timing: we're working on the fourth
> edition of our BitBake/Yocto book and are wrapping up the initial
> chapters to send to the technical reviewers. As mentioned before,
> we'd like to use bitbake-setup as the default installation path we
> recommend to readers. We're trying to cover the BitBake setup story
> as thoroughly as we can, and we genuinely believe pip is the more
> user-friendly option for newcomers =E2=80=94 the git clone prerequisite i=
s a
> real friction point before they've even built anything.
>=20
> Would it be fair to assume a non-alpha release on PyPI is realistic
> in the coming weeks? Even a rough sense would help us. If it's
> likely, we'll go ahead and structure the install chapter around `pip
> install bitbake-setup`. If the timeline is more open-ended, we'd
> rather know now so we can lead with the git clone path and keep the
> pip method as a forward-looking note.
>=20
> And the offer to help stands =E2=80=94 happy to test Rob's patches, revie=
w
> packaging, contribute documentation, or whatever else would actually
> move things along.

We talked a bit about it on the weekly call. I think PyPi is the
direction we will go, I'm just really hesitant to give out commitments
on timing. I do expect changes in the coming weeks and hope that we'll
be able to pull things together in that kind of time frame. We just
don't have a plan about how to handle the versioning that I'm happy
with yet and that makes it hard to commit.

Cheers,

Richard

