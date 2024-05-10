Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5016C25B10
	for <webhook@archiver.kernel.org>; Fri, 10 May 2024 17:58:54 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.20642.1715363931105908625
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 May 2024 10:58:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SrKwRqdU;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2e09138a2b1so28032171fa.3;
        Fri, 10 May 2024 10:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715363929; x=1715968729; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OeMbVPruBmJFVfleHM27o7UuzSBjAnwpIRsnCWVrAtk=;
        b=SrKwRqdU0bJOsczT047nS9czLQNoaliEYhUVed6UOwefnbKXiwSzuTAOdpz3lJJ0Xj
         W1wfY1J6UcIXjEmMm+nTBpQVfpv9Q8Dkwmf7aKM6QDl2+bFL87xg6baszDB/uajqD5E3
         Kj0OSoAzraHLm0A1ATubvp6HAyq56d1PveRVbnCRl0pUynwv9rcL7zM0u8w7oG+uxTGk
         WleqPWxZ4yHWHpQQ8UHJSsmKD/10KhRnXr/FYtirn35H0XK+SPjXXZoaCHRi+0VNlV79
         jg6Ghi9rYdDF7C0wt4RGHjQek4m46MCv4FOipbIJycGR3OxU2OWmN8tGcyHwvIcMOKcZ
         K4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715363929; x=1715968729;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OeMbVPruBmJFVfleHM27o7UuzSBjAnwpIRsnCWVrAtk=;
        b=bXhk6lcxyodJM0QaaMW1K9Y81d9LaGscc0qmJaaqjRycoRgobuDT391/vF8j6QHJXN
         X8KqkIXffUEjeW3rf+GPPzuoOFZxVEYikm9gQZ6T6RzXVq91oasaxAbgb7VBWXLsF8d1
         TE/pKjrZ98Y3OC0zqwA89Qin73scFgm34Z5EB9z709++iR7o4/LRURoI6HI5mfDRN9xv
         e11B0fulbc7e0Dn3v99UdV4djhe0M02BCa2KaJf/6TsCvRY7Y0HRs/zO9VJ6cHjCAwOm
         OuBHUnwmtTy/4Aekdfyggi/ZpwIF3BXbf4dHiNx4DXbM4tLIq1p1m9APMO71czIRJ0ae
         xOGw==
X-Forwarded-Encrypted: i=1; AJvYcCVjL11mbJ5wFvTVeUE3qaj1Muw1WeFRVvwtPTMm8Q0I234NEpBfZA81h+zXhDsFqe6g0SOTCr+Iki/+n/qVf+HhAm/kdZqQ17SEiCxUb2uniWr+Nej3S6hn
X-Gm-Message-State: AOJu0YyIyh36GU6GTL3OKwAFR/Inmu9/X+HcDluti0Aq2eSZwBliv7SZ
	HUNr/IYBA5aK4krLWvWuLZj/Ix5NNTPs3I3wosubNEZ6uUtd+YD8STCoFSMVxu8HG7fzaNgGY6m
	QzC8lTiLi3j/AEcNoDSyu8fo1Wtw=
X-Google-Smtp-Source: AGHT+IE6FYCTGRlREsOFpWpAAiewepqPRPhLlY1mND54S8cfF15oPOlYxWbkv9+EzTVy9TeR0lvyPZUAPbGBtygHk6Q=
X-Received: by 2002:a2e:9051:0:b0:2e1:ebec:1ded with SMTP id
 38308e7fff4ca-2e5200627a2mr19630551fa.25.1715363928830; Fri, 10 May 2024
 10:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <737087f797ecd87620bc96abab014d4fac6bb1e5.camel@linuxfoundation.org>
In-Reply-To: <737087f797ecd87620bc96abab014d4fac6bb1e5.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 10 May 2024 19:58:36 +0200
Message-ID: <CANNYZj-i90gLUfdk51Now0HY+=RCNkg8ugr2qcK65xXS+AypZg@mail.gmail.com>
Subject: Re: [yocto] Where are we at?
To: yocto@lists.yoctoproject.org, richard.purdie@linuxfoundation.org
Cc: openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 May 2024 17:58:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199201

On Thu, 9 May 2024 at 11:37, Richard Purdie via lists.yoctoproject.org
<richard.purdie=linuxfoundation.org@lists.yoctoproject.org> wrote:
> A rust reproducibility issue lurking somewhere:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/8318
> https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/8906/steps/17/logs/stdio
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=15185
> [both master and scarthgap]

I have reproduced this. The filenames differ depending on whether the
build host is arm or x86. If packagedata sstate comes from arm and
package sstate from x86, the reported error will occur.

I'm going to look into how the hash part is formed and how the build
host architecture leaks into it (on monday).

Alex

