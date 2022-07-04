Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD73C433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 16:27:42 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.74296.1656952058332221507
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 09:27:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aJQfwObV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id
 o19-20020a05600c4fd300b003a0489f414cso5939970wmq.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 09:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=/BxdPfnOIOTuXkTM75lhIocNuzcbb2g6DNEDLca1nGY=;
        b=aJQfwObVWMzchEmE7d28Vh21rqYsZIHdu+Je7VnQ2iTFH9wwdrA5r6PtOUBiBKyeuK
         BHvl8nVPQBAKpfyYWnnUeEMzZbVCd4aig4TXsHGFrS3AILl55mkqB8YqO1GW6WdsJKdg
         yCMhEbZKTey7rNeX8zmMbDMBGTGL0Y258PQmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=/BxdPfnOIOTuXkTM75lhIocNuzcbb2g6DNEDLca1nGY=;
        b=7tgq3xT71I0FM5CcQRb2tgs3jQZzq51jTvJkRLlQoce0IjfzlgnwXPGc6miuxHi4be
         66MQguIK747s4AQWd4NjyvvirIOZn/XIo7je81LYvfA3QyHaEi0UYAHDbbdtn/OJnyKC
         dERSCUztziFd73KojP8KaXsk17DDUp28fdYTDj84Jljcv6JtO91bSd1VgD6L1aoebWhP
         U0aVGhvqOQZQhtS0qm9ol9wIlJ7FeRSFj18CRq+0ghEH3J0QrKqJii5yg9pK20+e9FtB
         xi5KFrbGC3TGE2OqEx0stvtitedZapFf6nstOoi35wAYuHTrrp1mr1idvCLmVGkd3LmP
         hj2Q==
X-Gm-Message-State: AJIora8IQHxJtek57GFHyjJw7djkyi+vD+ZHWUlo6j1dNwEAMOL4C87w
	PUgUXt76BF+jfAtGdP6/N31k/w==
X-Google-Smtp-Source: 
 AGRyM1sFs1C8wC4KkyaQ2aduJDIza58IyPX4KggHJgccvNUnRade42AgYFEPbFRm5sQdj2ZBJygPNw==
X-Received: by 2002:a05:600c:3588:b0:3a1:74c8:e7e8 with SMTP id
 p8-20020a05600c358800b003a174c8e7e8mr30538890wmq.64.1656952056560;
        Mon, 04 Jul 2022 09:27:36 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fa18:c075:6c8f:aaa2?
 ([2001:8b0:aba:5f3c:fa18:c075:6c8f:aaa2])
        by smtp.gmail.com with ESMTPSA id
 r12-20020a05600c35cc00b00397393419e3sm16480884wmq.28.2022.07.04.09.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 09:27:36 -0700 (PDT)
Message-ID: 
 <9ebcef8cbdd821fb5e60d9dde1b9979a8d908526.camel@linuxfoundation.org>
Subject: Re: [OE-core] Build paths/reproduibility issues in master - help
 requested
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, Bruce
	Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 04 Jul 2022 17:27:35 +0100
In-Reply-To: 
 <CANNYZj_2ZJXOotiROS72EsSAspU3oRDAgA-t37kjipQVQMyA6A@mail.gmail.com>
References: <16FE039DA287E43E.1980@lists.openembedded.org>
	 <4770b1475916c1c4e8b7118dab2ba934af604c03.camel@linuxfoundation.org>
	 <CANNYZj_vu9dY==pXQE6VMB_cYKuq3T0TK-g0U4jv2kKHTzuA+g@mail.gmail.com>
	 <576a6c208bd89721228fa201212a557778f01079.camel@linuxfoundation.org>
	 <CANNYZj_2ZJXOotiROS72EsSAspU3oRDAgA-t37kjipQVQMyA6A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Jul 2022 16:27:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167623

On Mon, 2022-07-04 at 16:24 +0200, Alexander Kanavin wrote:
> On Mon, 4 Jul 2022 at 15:55, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > I guess the go one might, and using it as a template for some of our
> > other workarounds might also help some of the other patches upstream
> > but I have no connection to golang so help there from anyone with
> > better connections might help.
> >=20
> > The gperf one is a workaround, I doubt it would be accepted upstream
> > unfortunately but I'm also not sure what else we can do about the
> > issue.
>=20
> Right, I was just asking to go through the mechanics of the upstream
> submission. Basically trying to keep that weekly pending number from
> going up :) Maybe just the gperf patch then? If they don't want the
> patch, that's fine.

FWIW I've tried to join the bug-gperf list and sent the patch there but
it is very inactive and I think things are stuck waiting for a
moderator for the join and email.

Cheers,

Richard


