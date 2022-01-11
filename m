Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1629DC433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 13:57:56 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.7175.1641909474921612178
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 05:57:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=kUNsitBs;
 spf=pass (domain: burtonini.com, ip: 209.85.221.41,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f41.google.com with SMTP id t28so26376839wrb.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 05:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=aD84REIk0FBUB++bweJnYHZtHK9WzF7vCR4Oa4ExZ2Q=;
        b=kUNsitBs0r4KNM9LFmkp/H/EkDEa5fxEbQnzjsWpR82BSSE1vJalczG7Jh/5iAtG91
         sxNke9+5UDsNqM497tVBxWsj8fSgpy/1QYFQOzHMRIC02/TTm7KyCbviTQI6REQeQNXt
         ejuItQwn+uULvDDvtHpeUPOMPDAO/9n4KySe7BjjHxHe5NnE9oP+J8qbEcHnYgasfcUS
         CQwvhri/ulGKHFFdVNkrb2ilQYlOk3JQVH1VS5MTo5VIqMKPB8REZzQUMCu5GeuItOLf
         3mKe0+gACLteZLqYn7qk91MWsWN/A7wSky6+EUeUsCDrFLm6MJSwsxP4uN8IwFIM1k9d
         f81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=aD84REIk0FBUB++bweJnYHZtHK9WzF7vCR4Oa4ExZ2Q=;
        b=xWkbXLYYkhCemUohhUeW9goAQnp+Vr0BWvrBmAmiq/MpYo4/RktyRFPeXKBrWrIyP8
         EYzDhBh5mUjFokQtnlgIUkEjEk1ZC1vBfIa0+IAalRZ3xnChguNmhWJ1XgDShpF8BLLF
         hBEzdXtMkxWvOZl5hxg5qZLPywnCPOgWR6Zit1EmNv4hWirD/FD2X65gRuqNMdQS7hBp
         uz3Gw3D+eRL8TQLH8oRXjd7Mbg2OPTVgQuudgWvRHAMAvi2fFmplHYNan9n/XUuDpcAC
         0vn5dIk619AbSUtO80jGelz+3AgdrpWY2Um6F8b/rZBVy5bOlk4ggZX/0JFUHQ6PWQoG
         UzNQ==
X-Gm-Message-State: AOAM532wuGCz7ZSei4zj5khw/QYAgY9sQ43eVof52fZ7AM9haex4/zxz
	nflQAVyd9xK4YF3wt5d77w6X1Mf39doUaOk/2tY8UIztyUH9Zg==
X-Google-Smtp-Source: 
 ABdhPJwSpdT9PZnfLIwaz1gphpC1pGEEUooy0Nzri899nVZvGBP3+W6D/hWY1wqAgLJA6z4/VUCjOi8CEbwzhnvyA1U=
X-Received: by 2002:a5d:4841:: with SMTP id n1mr3913375wrs.620.1641909472900;
 Tue, 11 Jan 2022 05:57:52 -0800 (PST)
MIME-Version: 1.0
References: <20220111135540.2874535-1-ross.burton@arm.com>
In-Reply-To: <20220111135540.2874535-1-ross.burton@arm.com>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 11 Jan 2022 13:57:41 +0000
Message-ID: 
 <CAAnfSTuYa5wJEJWwqAFTp8cRYBndYeuh-2opSEYcatcqBo0sZQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oeqa/selftest: add test that kernels build with
 defconfig
To: openembedded-core@lists.openembedded.org,
	"Mittal, Anuj" <anuj.mittal@intel.com>,
 Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 13:57:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160402

On Tue, 11 Jan 2022 at 13:55, Ross Burton via lists.openembedded.org
<ross=burtonini.com@lists.openembedded.org> wrote:
> The standard linux-yocto builds using config fragments, but it's a
> supported option to use the standard defconfig.
>
> However, our enhanced config checking means that defconfig will often
> cause configure warnings.  Add a test suite that exercises a defconfig
> build is successful without any warnings.

Note that this breaks with current oe-core master:
https://www.irccloud.com/pastebin/nAapZUm6/

Anuj, would you be able to patch the x86_64_defconfig so that it
doesn't break with our tools?

Ross

