Return-Path: <sakoman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49507C433EF
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 20:57:28 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web12.2629.1648760246783755056
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 13:57:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Aq87h8mQ;
 spf=pass (domain: gmail.com, ip: 209.85.166.173, mailfrom: sakoman@gmail.com)
Received: by mail-il1-f173.google.com with SMTP id e9so641056ilu.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 13:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OIeoAHskgkj88MPodw93xkHu+vSSAOjHQjAM05zF9JY=;
        b=Aq87h8mQBr1GOjo1NVvx3Bse3So2Iz3+O3RJuLvGYQxs0yfAYd96kT33bCIeqeERY3
         w+feM8ssj6D18CuBBZjns51SabhTM6qPJepQ6XytPPJ4uY3J1DF60HaL+ogKRMxF4rHa
         ukfwkCztguH/+PEmxDeDUNWUuRR7atAi4coBX1su7NDSY1/2GnJXtxtWR4pilTR/Sx12
         uHDmSF4q4gFw2Zk+S7z1XJORpfjN6lee8ImY/tHj2ZR+gxRhaCsax8JGqNgXQpMHisg+
         ZauqdpzmdQlf4OMW7DSNsyWAXH15Di/xTdV8eGiP4zTJgV85pWpF+62Z8OFZJI79Zz10
         ZJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OIeoAHskgkj88MPodw93xkHu+vSSAOjHQjAM05zF9JY=;
        b=E84dT+dcWU88dCKK8ThoHchnf2XrnvLxTEddOb8uVMBijmiV8ixIhHuIAMJFjSrbEp
         MtSIL84R6TsATMQYGCxQ36UZw3/WOehsOmrzpfnTZAulIch/PPZ0ZE6OKIZKGDvHA+y+
         ipNOrmwpDKFcHvIKoWRIWmh9LZ7PEyFKHtfkRkdcuKyOLQyWeKngOXN7Bq7sDyVATtiN
         LShYEJhRqbW/YsBjp38Yzw22aukP8xbvIQnPRcTUwIqwzJ8jKZPzfOSAWbcvAcAxRBCA
         XSsRESQvwP5wabVquXP1m4AxndPR7BEUU0H3r1aigK5C4Kx7fHYPxBq8f2MGU3BGWy4y
         iKcg==
X-Gm-Message-State: AOAM533SGXZiHzJR0zPVo+HAR7gBShvwGHe6QrZbzNvifyfK4Za4sD12
	sbPIYZe4IXIXp23xWqu2UZ0ztKnDP1vxNumSgzI=
X-Google-Smtp-Source: 
 ABdhPJxm3ZaWbo/4/z2YN6Fn11s1HksYST9l+Lmd8jX/aRtMSJAU/rzJ4YDlJJd90C5fFiikQuKCBGIs9eHkfP91sX4=
X-Received: by 2002:a05:6e02:1a8f:b0:2c9:da3d:e970 with SMTP id
 k15-20020a056e021a8f00b002c9da3de970mr6720097ilv.239.1648760246198; Thu, 31
 Mar 2022 13:57:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220331193819.1623580-1-ralph.siemsen@linaro.org>
 <CAMKF1sr7htUph5S7Fx=W69kjOfHbdcsOtHCC0cChyR3sodtCxA@mail.gmail.com>
 <CANp-EDZuqfBLJfvdFBHkDV=zz-CB+Pz9dHghYqfigHpej0iqeg@mail.gmail.com>
In-Reply-To: 
 <CANp-EDZuqfBLJfvdFBHkDV=zz-CB+Pz9dHghYqfigHpej0iqeg@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 31 Mar 2022 10:57:15 -1000
Message-ID: 
 <CAGDS+n=tvqvoXkoxVbWaszGDkg7NgDKNGv=hFbsaWU-HUNBxsA@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] bluez5: fix CVE-2022-0204
To: Ralph Siemsen <ralph.siemsen@linaro.org>
Cc: Khem Raj <raj.khem@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 20:57:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163870

On Thu, Mar 31, 2022 at 10:32 AM Ralph Siemsen <ralph.siemsen@linaro.org> wrote:
>
> Yep, I must have fumbled it before sending it out.
> Please ignore this one, I'll do a v2 later.
>
> Any comments on the usefulness/format of the "Status in other
> branches" would be appreciated.

I approve of the location and format.  And it is useful too :-)

Steve

>
> Ralph
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163869): https://lists.openembedded.org/g/openembedded-core/message/163869
> Mute This Topic: https://lists.openembedded.org/mt/90162847/3617601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sakoman@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

