Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C2D2CAC5B0
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 21:01:46 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.2297.1758834100718422763
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 14:01:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GIwvI3wF;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-57edfeaa05aso1539193e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 14:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758834099; x=1759438899; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HwH9HieMYR7/+9WKkL481NwgIrbxG4t+QnU6Uj7eEmk=;
        b=GIwvI3wFOeEIIPTxSIBmKrpXArDAc6PwhPBg5TjQTO2KvE7li38GAPwqBAsQTUkjsd
         IqW7NtATzaEYkyd8udPtTwnaMMLpjGDyNKGPJQzkqKhDcBiEzzSSCPFR9PX6VvqL5FIF
         ljTvJDTgU6o0kXPacawGez0YSG371TtBXflUbekO5d/aWyl2upZOy9aoG/OPoAgUosp0
         XC9dfVox0PXVT/DVNMLKGaV5d1s/nVMDuftPCqD1ldOUUj0OhKkZ28kC51X+6YgmsiPL
         kDcfY7ALG7PyNWWDMs1ZYkFnA3M1SQ0ARjpPEvZ41P3vXDEqUYXqaOAJ9iq2vPfJA5gL
         ddZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758834099; x=1759438899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HwH9HieMYR7/+9WKkL481NwgIrbxG4t+QnU6Uj7eEmk=;
        b=NSHnrIgujJMjBjlBrQhgcqRoR09jzQnaIVdNTsDbllPFC7CA9HjSHjatgXJsq7dUJt
         5I1HwLBHUnaFhzgjJ07xBPnEoo/gXxbKCTiJDY4cq0M4AdZcpCmJQFrnu0Q2GKW2v1kG
         XUF79Orw5nAXysFemh2bZcCwcof674rPmAUkfsOz924i7NA8hRqmYXaVuUwEUDOmWBn3
         ReSZF0IoPATpaLLaP8iVPmvn0nEsHftLDhHdAHEQMxAWSVve13ynVLGFFGUZZa3FN/W4
         vRc5DqU6qYhP5TSBHJ5NDATfYer368mc9qsetmLjoFOj/0T/yKapC1a0ETnd7GifhNJ6
         t9lQ==
X-Gm-Message-State: AOJu0YypOjVkqrY4xwOsBhRNJOw7ZjPaZtdIYlQFqqGgV95jRyRwN7UD
	b0XlDMajmbGi1HUwCoAEASItqk9Go+rYehl+5wxBJHRK5onBWiGvOLD8ZELT8tkgH1LKTOtXiZN
	8/RURT0oR8iD0B6/gID7eiHppM1AOYr4=
X-Gm-Gg: ASbGncvOc75EIa/HYSSE0JjdGCAodAJrXfO/DzExo7G9mdXjy1jX+aI7970W6IqdhQu
	kKFFWA+zmd62ebUf5t8oTJLDlm4tvgEKVQmpQFtcjiui3BUL8WDcYoozYFrASMxJrC9O8FLk8aR
	run728kn5Y++69cT0mQwwCbBKEDfZdRHr4F0Er/pH7g97eXYALzyzaEj66b/Vw1WnlNfk3kGJYa
	X9qwkWmew==
X-Google-Smtp-Source: AGHT+IFZnaRmoLbkDtcy8yUpMrgB8hmGwxunnDO20uMWtYLA2uVAOnPb6SgHL1L8kmbYx8aJ8cr4IQecpPA21buvqkY=
X-Received: by 2002:a05:6512:61a8:b0:579:ffc7:19c0 with SMTP id
 2adb3069b0e04-582d2b4c70bmr1387342e87.40.1758834098561; Thu, 25 Sep 2025
 14:01:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250925192115.21761-1-reatmon@ti.com>
In-Reply-To: <20250925192115.21761-1-reatmon@ti.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 25 Sep 2025 23:01:24 +0200
X-Gm-Features: AS18NWAwkWCJfg0-1FZSIPWbiFc5e9c6CJifkrsyRRxzAdrxEjVBBH9FhR1J5Gg
Message-ID: <CA+chaQdeDK_-buP-nq9BoPqbD3dBHGKo+kr5xD_1=sJXdaqqgg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] linux-firmware: Fix FILES for intel firmware
To: reatmon@ti.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 21:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224048

On Thu, Sep 25, 2025 at 9:21=E2=80=AFPM Ryan Eatmon via lists.openembedded.=
org
<reatmon=3Dti.com@lists.openembedded.org> wrote:
>
> The 20250917 version is installing the firmware files into the
> /usr/lib/firmware/intel directory and symbolic links to those files
> under /usr/lib/firmware.  FILES needs to be updated to correctly package
> all of the files into the right packages.  Without this we get a dependen=
cy
> from the linux-firmware-iwlwifi-* and linux-firmware-qat packages back to
> linux-firmware which means you have to install ALL of the drivers when yo=
u
> depend on the specific package.

Can we set FILES:${PN} to empty, so that issues like this trigger
installed-vs-shipped QA issue in the version upgrades? Or are there
any files which should be packaged in ${PN}?

Cheers,

