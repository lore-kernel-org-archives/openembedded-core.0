Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB08AECAAD8
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 08:51:22 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web12.4001.1663145478905990555
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 01:51:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=uePp47qI;
 spf=pass (domain: linaro.org, ip: 209.85.210.179,
 mailfrom: mikko.rapeli@linaro.org)
Received: by mail-pf1-f179.google.com with SMTP id b75so9005388pfb.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 01:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=X9cPkFMJMlZJsE/tCbVVKnxRfab4qQL8NGAx6kcIQRs=;
        b=uePp47qIgf78t23lF6oN2tguMf6MFAb9+Ffy1f7cV8rGQJwqOLb3e8kKPMxt2PW04H
         QIoRfRUqvmUJgJ5IFmZsgWzmM/DmRr6vAmK2PPXl457IDLN0+GGqGVsDQTuL9k/5mGDK
         WlXGYC25AcJrOmMZzSN5ssftfEHrAvRbQJJb5HU5m4trO2SN66ZKwU+9RtL9XYCrnMIf
         liyxc7tg8sBiPFPU6KPGjni0EAalAkOwySJ/JYwaSusA67DSGuLY2MQ6T1EitVE1r9Mb
         pecmGd9Ug6QsgdgTwmwlEPvtP3vQgWCnh5Xd+lUg33Kx5Kom6ivDQveNbVpbaBVpGqVL
         aNCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=X9cPkFMJMlZJsE/tCbVVKnxRfab4qQL8NGAx6kcIQRs=;
        b=qVw6rzH5lPyl2r5B3/wzwm4k+o3H0BpurgUqojxj6iZQH0kcT1Cur7mMHaMuFmy2Fl
         Zaf57p/+xIgfF7Nsz7OW+ls5I3Wyx6OCem7JagPucYYFCzGVycguMY0r5GcX79blK5oq
         app0jdiNJqzQgRLUZO6/qm3Oei0MOLTrdT6l3f4cia9PG81MltPVzTWpZ7dwHWTfJbr7
         eR9s21UE2IhDrXUg9iAZ99Z30nMD4mHgCR15oRv6EVhwmrYkdYTxEO87R1o0uZP2D8SS
         GQFpT2L7EKLxzoQVoJJx8NDOM070ksijqcoZaepE5d49Kcw/PHqCsy9Twemu0ViqUSst
         NsZQ==
X-Gm-Message-State: ACgBeo3GfBKu4tPbIlA2XWNho6kUT4VATDSbCizLT60JYuveXW1Yyf1a
	AxKqXQv/5DZeqYrNCvkS89NdYrgdwcMFthnj5q7pvg==
X-Google-Smtp-Source: 
 AA6agR5g4JuAfindY01kgwcE0Yn17SGXr++UqUhwfmdAicGBE4gTGxNFJCr3OJnMPK8DFaR5uG0kQKo5hzHCjsn35H8=
X-Received: by 2002:a65:498b:0:b0:412:8e4:2842 with SMTP id
 r11-20020a65498b000000b0041208e42842mr31030163pgs.71.1663145478179; Wed, 14
 Sep 2022 01:51:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220913093452.47839-1-mikko.rapeli@linaro.org>
 <0d0f3e3d53f675a0edff4e1582b33998288c95e6.camel@linuxfoundation.org>
 <CAJFpGrO=Kd5qTgUQRbzcX3kYuCZKJNayxA6puVXAc_W=ATN6Pg@mail.gmail.com>
 <7a1aa96b6b8883d47234c198992963c25b3ff6cd.camel@linuxfoundation.org>
 <CAJFpGrMqa3hk=QL56zFgZBHiJn173Wocz7a5AH=2a9=Eny1tog@mail.gmail.com>
 <41df899720a40675568c55a571308c9624ef5d2e.camel@linuxfoundation.org>
 <CAJFpGrNM3sqj0o0L3CtNOtiLsq=++sbxun5eGXZHPN+A-oT3Zg@mail.gmail.com>
 <CANNYZj8FpujQ+D3xc+g63LMJahyY2NRZK0KQpp2m=L2L9Jadow@mail.gmail.com>
 <CAJFpGrN4DzOqFsq-HLgdonuNuLFKTyb1BKRg=_6btzjjtN+eOg@mail.gmail.com>
 <CANNYZj8AiQ2bEfxk5ujs2H7C+3ER1OQ+hUeXUVnJxZjJ2O3QaA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8AiQ2bEfxk5ujs2H7C+3ER1OQ+hUeXUVnJxZjJ2O3QaA@mail.gmail.com>
From: Mikko Rapeli <mikko.rapeli@linaro.org>
Date: Wed, 14 Sep 2022 11:51:21 +0300
Message-ID: 
 <CAJFpGrOETn=9tkMccp1PF5Z_sdqMb3zmicM4Xntfd=GgEPDcbA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-cryptography: workaround broken native
 functionality
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 08:51:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170646

On Wed, 14 Sept 2022 at 11:45, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> But I'm not asking to make wrappers. I'm asking to patch openssl code
> itself to check for an oe-specific environment variable where it's
> making the decision where these things should be looked for. We
> already do this with native python.

Yes, I got this. Was just thinking out loud over email while checking
these details.

Was there some discussion in the past with openssl upstream about how
to find config
files, modules etc, or was there some alignment with e.g. Debian package?

-Mikko

