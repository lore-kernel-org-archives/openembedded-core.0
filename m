Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C275ECAAD8
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 20:32:58 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.189.1663878777051325787
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 13:32:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=A80PZx9g;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id ay36so7559078wmb.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 13:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=daIAvtXsPPAUBuL23PiVZPBS/uQTK29ncFOf3hvafN8=;
        b=A80PZx9g4i7h78xPodXktV6/ZZnZR+y0dLzguhLPfJVl+b5liIGrLNKpaoNtI6o6u7
         3Nz3To8fbOdkZ9dfTkPOdYRNZXTnSdoBZ7Cmkb5Gz72ZTDMXCLHivc+/SmYd6s8YXWId
         3iUeplnOIVCbXPadJlEVO8sI/eb1gTyeKqz7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=daIAvtXsPPAUBuL23PiVZPBS/uQTK29ncFOf3hvafN8=;
        b=1X+UzRKRDr59H/uiIATwoC5kHZ0Zgrr0cqXEoGfzkgQXXaCUNOWr6lptDhJZ1/D5vk
         l6mIgyq7G69AozBnI/uSeQ2qi4hqzHmXgSUWkEKtSfR8CIoAlD1jbnoIltQKBZNdy700
         2MgGNu+QUHTWvhq0ARpLEZCBt6xEwKEQqy9RTKi7tkvJdqDbceiqbJkCwmFuayZDLXT8
         qI7pLZKSFbpVsv1zyTEiJq9WnQ+45eEsa6degL7uwRf4z+l8rJtTObjnAwo1CQBsLFuC
         2d2b9q/3TSOrm0MrVTmcK3E1uIU4UOPjjKapwtgHB0BTGoKrR2cpK6rzYav8MlANGyLo
         cOhg==
X-Gm-Message-State: ACrzQf2B8waLK+3v2SHrdDXl4d1JR76oKH1R6vX2TTyfYNvy+4ZkdtZ8
	fh3mYJ/8WV/b153iqUm/DYtSVw==
X-Google-Smtp-Source: 
 AMsMyM5/VmVJ1o62eLr4wnvtXDKHRx4STqkbC4dCXBtmb+l+tX7ZadQHFwIZv+ZbHDQiP/4etYilkw==
X-Received: by 2002:a05:600c:19cc:b0:3b4:b15a:7df with SMTP id
 u12-20020a05600c19cc00b003b4b15a07dfmr3631468wmq.185.1663878775132;
        Thu, 22 Sep 2022 13:32:55 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7946:c7c6:1ddc:ce8e?
 ([2001:8b0:aba:5f3c:7946:c7c6:1ddc:ce8e])
        by smtp.gmail.com with ESMTPSA id
 f12-20020adffccc000000b0022afddab5dfsm6031726wrs.7.2022.09.22.13.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 13:32:54 -0700 (PDT)
Message-ID: 
 <c78bac9a0a53243336d237bc5f6d51758f5a5dfe.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] oe-setup-builddir: Do not hardcode
 invalid paths for templates
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Peter Kjellerstedt
	 <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Sep 2022 21:32:50 +0100
In-Reply-To: 
 <CANNYZj__Gud2xeWrtK=tZaY_BGQ2d4tVVJLfZt4R0aqzUadK-A@mail.gmail.com>
References: <20220922124708.2218995-1-pkj@axis.com>
	 <20220922124708.2218995-2-pkj@axis.com>
	 <28947223c26b05f58c4b6cd13919b025617318a2.camel@linuxfoundation.org>
	 <ee0aa31d5fa34a5ba889e3518d8b2a95@axis.com>
	 <CANNYZj__Gud2xeWrtK=tZaY_BGQ2d4tVVJLfZt4R0aqzUadK-A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Sep 2022 20:32:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170988

On Thu, 2022-09-22 at 17:52 +0200, Alexander Kanavin wrote:
> .templateconf is not the way to specify the location of custom
> templates, and never was.

That much isn't true. It was a way this has been done, it was suggested
as a way people do it and it was even documented as such. The original
commit does make the intent clear:

https://git.yoctoproject.org/poky/commit/.templateconf?id=3D614faa66a442069=
b8cd81ee74a01ecc5d73870d9

I think the key point is that it has been of limited use as it requires
a custom repo due to the use of OEROOT. Where you had a custom repo, it
was fine to use. Poky was one example.

I haven't read back through the discussions but I suspect Peter must
have some kind of custom repo setup like that to be able to alter files
in OEROOT.

> It got added to documentation by misunderstanding,

Again, I'm not sure about that. I think at the time, when layers were
much newer things and technology was more in flux, we did think this
was a valid customisation. At the time we were suggesting people might
want to use tools like combo-layer to mess with repos.

What the documentation doesn't make clear is that this trick only works
for repo alterations as far as I can see.

Since we don't recommend such repo alterations now and combo-layer is
pretty dead, the code is of limited use and I do think it probably
should be removed. I therefore don't like adding complexity to
something which really shouldn't be there at all. I appreciate this
does looks like it creates a challenge for Peter's situation though.

I have put off touching this particular area of code since I know there
will be a ton of problems exactly like this. The success or failure of
such changes does depend on how the migration is handled. A large part
of this is communication and to some extend negotiation too. The fact
I'm having to start trying to understand all the details is the
situation I didn't really want to be in.=C2=A0

I suspect to get anywhere I now need to go and read all the previous
threads to then try and unravel this :/.

Peter: is there a pointer you can give to the setup you're using?

Cheers,

Richard






