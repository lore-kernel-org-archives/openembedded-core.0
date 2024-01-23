Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9341C47258
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 13:35:18 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.12274.1706016914727549628
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 05:35:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hM3nJjp6;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-55a9008c185so4947237a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 05:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706016913; x=1706621713; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=boj6BDtbFcUVGvE1X05AynqTXM96aEugm1BXjjQlr48=;
        b=hM3nJjp6Sx5sM2EzYmZmpPDtAkkN58AJDwAzRmeUfeH+BPFdSMt8cPuqTZKwcGdyX8
         Nkzq6das1b7rfI2AgWSdOLunZbC9o+649iXSJkv6C9uOcfsq38vw/QvGN1i63OzuuQpC
         e6IxXH7DZ0U7nfafLeiUa3bO13oM2niftmCzf3oaM9YHVL/eNqrmxtu98SD3jMxQB2j+
         zCrkLnpzStnT95G4lOe4JlEI1Rnygb6LteOSkK6O6o0okpCGmCATbIWHQ56kFP/LOU7I
         NHsLcCAAPkIVPTxHWVvKTka/9nrm7gMAb7xnkonxLqmMO2+mz10XO73hk3oA7+WwCEKK
         qJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706016913; x=1706621713;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=boj6BDtbFcUVGvE1X05AynqTXM96aEugm1BXjjQlr48=;
        b=gZNOA9HlM9ThsenpySDYmXHhAAy/5er2m7CQdVeWQ/U0HB5Uy5EBHqteSITRwZuZBu
         nP1SKMJCXFgx3oCdwxpTBw7xlYmcP6xZR9YTqHAHM3jlCQVAlExttnvaXptWfQmwZxjP
         PqlPMN7I7bOEwA1juGNgp6f2jjLKGlyGDLkSiOSFPyoGLxk+MEXo7yuq0oS+vLp4o4H7
         9KI/onGMM2SbvGUgv2CFJVbgTlhlixkGIc/25UqCySJffcS/CVSKM8dIifBBVLf+E5XJ
         mTCjLS4pz8YOQYT13JMLMGEbIK+U+j2CQEjkvTE8S3uhC9UVJSBgOVRJ/8nM9V/9aS6Y
         c5jA==
X-Gm-Message-State: AOJu0Yxi/KIJsI7THh6cqzMK9ijddElvwKEAjYGdbDBA3VjFUO4+B2rO
	/wjEOMUOydoTuZPqxNGBv8P5NHKxCBYVBCAynzIH1fWNFg1rGlXFQCPYG88zuJg2WZbHJcL2pRL
	TkhT1iGndK4RyhtYU2LgjIsqYtyo=
X-Google-Smtp-Source: AGHT+IHs0IhQfDA0N8r1MpXyiD9cuM5pB75AezIo2tQemJK8i/Sn7ZGYH75WroHdCZsGBFGHHES8bJ03FG+GRUCmKIA=
X-Received: by 2002:aa7:c60e:0:b0:559:cf48:630f with SMTP id
 h14-20020aa7c60e000000b00559cf48630fmr1717086edq.35.1706016912910; Tue, 23
 Jan 2024 05:35:12 -0800 (PST)
MIME-Version: 1.0
References: <20240119124323.3823059-1-alex@linutronix.de> <CALT56yOPW6akXrH_xyJbgoH_s5nYoMDYLX55H1betVZ+8T_uEg@mail.gmail.com>
 <CANNYZj_qrCvwjeGFjZcaoHJPtPJk1FyU9Rm28kZxMBM8aE37Dg@mail.gmail.com>
In-Reply-To: <CANNYZj_qrCvwjeGFjZcaoHJPtPJk1FyU9Rm28kZxMBM8aE37Dg@mail.gmail.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Tue, 23 Jan 2024 15:35:01 +0200
Message-ID: <CALT56yOgcVpJPPZgvdNZhQ1PJw3OpGu1i8WRgU0_KqcurNHpJg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] shadow: replace static linking with dynamic
 libraries in a custom location and bundled with shadow
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 13:35:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194235

On Tue, 23 Jan 2024 at 11:13, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Tue, 23 Jan 2024 at 02:13, Dmitry Baryshkov <dbaryshkov@gmail.com> wrote:
> >
> > On Fri, 19 Jan 2024 at 14:43, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> > >
> > > Despite our efforts to make static linking work, there have
> > > been new reports of bizarre build failures:
> > > https://lists.openembedded.org/g/openembedded-core/message/194006
> > > https://lists.openembedded.org/g/openembedded-core/message/193907
> > >
> > > This commit changes back to dynamic linking, but places
> > > the libraries in a custom location, per RP's suggestion.
> > >
> > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> >
> > Alexander, please excuse my ignorance. What was the original issue
> > that you observed on your build system? I tried simply reverting the
> > offending commit and performing the build. I see libbsd, libattr and
> > libmd populated in recipe-sysroot-native for both target and native
> > builds that depend on shadow-native (added manual dependency of test
> > -native recipe on shadow-native).
>
> shadow contains executables for user/group management such as useradd.
> These executables are used both in regular tasks and in setscene tasks
> to create users that a recipe provides (in addition to simply
> unpacking the sstate archive). It is those setscene tasks where
> providing library dependencies of shadow is problematic. If you delete
> tmp/ and run the build again from sstate, you'll see that for those
> recipes which add users, shadow-native will be installed but those
> three libraries will not. On some systems executing useradd will fall
> through to using the build host libraries (which is a ticking time
> bomb and can fail later), on others it will fail outright because e.g.
> libbsd is not installed on the host.

Thanks for the explanation. Indeed, reproduced the issue with these
libs missing in sstate.



-- 
With best wishes
Dmitry

