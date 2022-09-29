Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABEDCC433F5
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 20:38:38 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.15792.1664483917667074128
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 13:38:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K1PN0dJy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id m4so3906493wrr.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 13:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=InIJpw3FgBA39KaAvRj/ObiEaV57xOsacphvM5jgZtw=;
        b=K1PN0dJyhYhSHTxxvwTHVOx6+hC4Q6B7jI8D+lh6pybKepHurjR8WX5gbj1CIEmjKp
         GmD+H2hlWhdiIMkdG3KTAbGG/Ts++cVkkxQtCae/kzbU5LVF+XJPRq/SmBIJgZMebhQY
         hXCCHmwmW4qzDMw+Ez/XmpDD/zBhoTzRl10/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=InIJpw3FgBA39KaAvRj/ObiEaV57xOsacphvM5jgZtw=;
        b=PLUO6ydHxR2ArYBWvYOcnyzdEQWA34MgzIChtq6kBn7b96wvKX5se94dPfJ3Uqtx7o
         Vsf0lyWSKlwCrx0tMZsj+yXaBWUZkTz1Au7A8NCpiaU/8F7dKG9VbQMIzTZUdcfiykTW
         jTdAOHr5TGUPSnjNQvdyB8HmJPKbiF3L7RN5Y2TwkAV0t1LU+ZKYtNqj49NrhrHZ9hHk
         qlZ1nL6RwS2qAaxJRCgYyovZnP0gmRJOIjdVfb/6/q2claqeB3zFs7HowRNvaij8C+id
         O0CX3x4ctfmShRtsFJQqj/Dywjd2uG/y0YFq8vUgykxe/mHDN4R29T8sMkTW9lM9NWYd
         JDqQ==
X-Gm-Message-State: ACrzQf2nL0Z0AxQcS3N5nchNA1s73HN91aO9SLWl3W6E4OXv8bmcaIB7
	85kuvDqm15GEffJ65jbgWZ5Y8w==
X-Google-Smtp-Source: 
 AMsMyM5YBtWPI7hq7LUJR7J1CLRYFuqqtaBRWOKAfMbuv8ht+4gycfRHlvcBHyVNHkyVsQCvhY9bxw==
X-Received: by 2002:a5d:61d1:0:b0:22c:c284:a886 with SMTP id
 q17-20020a5d61d1000000b0022cc284a886mr3914116wrv.30.1664483915926;
        Thu, 29 Sep 2022 13:38:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bfa:f678:7e20:8850?
 ([2001:8b0:aba:5f3c:bfa:f678:7e20:8850])
        by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c4e8e00b003b47e75b401sm5805985wmq.37.2022.09.29.13.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 13:38:35 -0700 (PDT)
Message-ID: 
 <1dad6d5f0886715064b83fa60c83db5b83366c0f.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH] babeltrace: Handle negative time and offset
 from Epoch
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <Ross.Burton@arm.com>, Jonathan Rajotte-Julien
	 <jonathan.rajotte-julien@efficios.com>
Cc: Xiangyu Chen <xiangyu.chen@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Sep 2022 21:38:33 +0100
In-Reply-To: <EE2E3768-2430-45DD-ADEE-C04C789AF015@arm.com>
References: <20220927011315.20729-1-xiangyu.chen@windriver.com>
	 <e5fea18f18d766bf9690c876bc169d7425407b0e.camel@linuxfoundation.org>
	 <EE2E3768-2430-45DD-ADEE-C04C789AF015@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 20:38:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171198

On Thu, 2022-09-29 at 11:18 +0000, Ross Burton wrote:
> > On 29 Sep 2022, at 08:03, Richard Purdie via lists.openembedded.org
> > <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> >=20
> > I'm reluctant to carry a patch which has feedback like that
> > upstream
> > and stands no chance of being merged.
>=20
> Agreed.
>=20
> They also say:
>=20
> > Unless there is very compelling reasons why you are sticking with
> > babeltrace 1.5.8, please upgrade to babeltrace2.
>=20
> Which is a good point. Why do we have babeltrace and babeltracel2?

I think it was dependencies and tests. Whether we still need both now
I'm less sure of.

Cheers,

Richard

