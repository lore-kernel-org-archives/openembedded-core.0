Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04BB5CCF9F4
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 11:18:59 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.10198.1694085532681970359
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 04:18:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JnIPVuYv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-401b5516104so9414155e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 04:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1694085531; x=1694690331; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wQjFFKtMB2kxKuBnDWNRQ6heESp7hC5hSq/IlrpaaCE=;
        b=JnIPVuYvJmbYBfiNonaVhkenJO40zhh479gW1nocwYUSp8S+h5Yl/wcke6OPyisR0A
         Qx/iXBjpJ58h7nbY+HmgryIQ7xSvv1w5UcXIxsABrkMP3iu4NRghP5HUAtEep+IU0YLH
         yVpR9rPTIURFGbS5cfqPXXvdVVrk5lTuCyHHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694085531; x=1694690331;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wQjFFKtMB2kxKuBnDWNRQ6heESp7hC5hSq/IlrpaaCE=;
        b=ZjZ0hGZ81frexJSvaM4D/EAVSxsEHngX78RR8cJGWf6S9udlj7SP8fNUbX2DOnlFWb
         97mTenloHC2oSif3/8TgSofOVrX1H/npUO8E0zUqFMFtHyiZNcJatTCNLlcqOD/sAXsz
         nA06AE/EbrboagWt6F1CDxF7HSYzdENk9RlPrTOWgUrBTrSgWo8OJVf/NREPiUvSA+5n
         BN8v0z+irWepYaWDaTBY+UpkmeMFbTja0HKIq+X32+64dDyetau83O8/i+FYuRSM/896
         RSMU+upLzdMprGlB03jkgG8lX+nVWXTVUnftFpBJ4V8sZES9XmW3U0yluUXgUy7erIrT
         Nfsg==
X-Gm-Message-State: AOJu0YxZmjtQwzrHywzy/CX4gpvTRwxhrmVPLKvU9HLBLr7LPxbb9KMB
	Ld8p/G9O6w96qczlQo2B5lxYGg==
X-Google-Smtp-Source: AGHT+IFMGvjirYfNgknaJvbaD9810GUgr8Fak9HMTOXE7brxKUPs6EGlK5StJcUFAxrMCEm2jsJ0mA==
X-Received: by 2002:a7b:c855:0:b0:401:b0f2:88cc with SMTP id c21-20020a7bc855000000b00401b0f288ccmr4845999wml.41.1694085530933;
        Thu, 07 Sep 2023 04:18:50 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5f38:2f43:a165:5f10? ([2001:8b0:aba:5f3c:5f38:2f43:a165:5f10])
        by smtp.gmail.com with ESMTPSA id k17-20020a7bc411000000b003fed1ba0b8esm2259246wmi.8.2023.09.07.04.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 04:18:50 -0700 (PDT)
Message-ID: <e4706c56b8faab51081682ec06f1de645306f82a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 16/17] build-sysroots.bb: run tasks one after
 the other
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Thu, 07 Sep 2023 12:18:49 +0100
In-Reply-To: <CANNYZj8zRk0SYzX-GYdwhSQGQidGrK1PT9mCH7LPeSp4ANERhg@mail.gmail.com>
References: <20230906165633.2382629-1-alex@linutronix.de>
	 <20230906165633.2382629-16-alex@linutronix.de>
	 <18264a59f21e43aed1138bc58ffdf2471c5ccc05.camel@linuxfoundation.org>
	 <CANNYZj_ptnLNvwPGDcAciok0bsE7Ctzww4WkAJmamgkCyB19CQ@mail.gmail.com>
	 <781c93976fbd19e146ab2626a6202a0ccb23ab82.camel@linuxfoundation.org>
	 <CANNYZj_RfCwHmt_TnUgdHeoTNdqMcX+f7aAzZ7e=MYSx+E-rXg@mail.gmail.com>
	 <02407d75fc40487431a84d18b60476552083b1ce.camel@linuxfoundation.org>
	 <CANNYZj_HBxGaz9c8X875fZ8rgPGD4MNCjv6mkANAiVZKD4vswg@mail.gmail.com>
	 <ffda1a9441f4d6e947bb6aa383f5a1e2e2e0d39b.camel@linuxfoundation.org>
	 <CANNYZj8zRk0SYzX-GYdwhSQGQidGrK1PT9mCH7LPeSp4ANERhg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 11:18:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187377

On Thu, 2023-09-07 at 13:05 +0200, Alexander Kanavin wrote:
> On Wed, 6 Sept 2023 at 23:44, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>=20
> > I know it is really tempting just to add dependencies and ignore the
> > deeper issues but some of this really doesn't make sense when you step
> > back and think about it.
>=20
> I sent a different patch that decouples native/target sysroot
> population tasks from do_build in the build-sysroots recipe and tweaks
> usage to run them explicitly.
>=20
> I agree that user/group handling at build time needs a redesign:
> there's just too many corner cases and special handling all over the
> place currently. I would really just rather place a file into
> /etc/passwd.d/ and that would amount to 'making' a user. Indexing or
> other special processing, if needed, can happen at do_rootfs time.

It isn't just do_rootfs, it is also package creation as the
users/groups are encoded into the packages.

Crazy idea - can we statically link the shadow-native binaries?

Cheers,

Richard

