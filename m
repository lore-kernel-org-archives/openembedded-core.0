Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07534C4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 18:32:36 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.2935.1669141951281340820
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Nov 2022 10:32:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iRq/seE1;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id s8so24817828lfc.8
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 10:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ucfea3RUDaFAW0g3dU/l8QTJqXE/itX9/ksDa+hPM3g=;
        b=iRq/seE10uVAjhBnJ9ieLJ8IYHy0fR9aaDxpLsqyee+Z4rB4+X8XGEHaESP4q5jHkb
         txOt9dvg4mkQJ5VkcjIMkRcGCJCTbz7zyFfs4adxYc7U2Zlw7fn2N6r7WMjVMECua9YZ
         cCXCD0uTCMzSihDJHl08/GO4sQtQ98ca3UMdXjyy4gtgpYDmKIBX+sGTwr7JPdvyKZs1
         gy3DsbqQuciH1r7MVzME6HiOJS9K73fLh5shZbSF14KnfJobMz4ytRBYygDVmSDCgdJn
         r9KgWiVPfawpF9cAO91HoC0nmtQIn0eoTgKFs6zbVOAlVL4CHEHMwpq4K4JNApa+yZre
         kGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ucfea3RUDaFAW0g3dU/l8QTJqXE/itX9/ksDa+hPM3g=;
        b=hQDjWyM1aS4bXEL5Jf6ljX0uREh2asX61PMUTjkt+pKe6ER/krUebprDYJOsucLszo
         Oo7ZWfxzzt7NBpu4epejPxLTE/hFCpkIenC9jSL9tkkPQ+DYEVVxao/W15oRGRGY6dzv
         5ra0oYZg0Y0eIvBqd82ltoVf0oifqlJTWcWJzrck77dyY+mpAqCxxydrt2wc+xSI6yBc
         h1LSgHGlxIRKWXvdjMCtmAYMXBrPTm1KGbOQvHcSfgF089SNgvkN47WgCiLMXJ2fGZEV
         vRJsGKOpE0kHJQ2QG70tvAjbJa9uFbdeIUsd89hpiEeSRa/2xT7vTtY8X1CMpdPiVH9o
         DlJg==
X-Gm-Message-State: ANoB5pkbOu229ZrXZ6vSHGoTXUGs25sxXMAhrRyoF6hgugAR9ImLLJTq
	OoG3DlGn2M/lPvAPRIPhb/krkJvkxCa9lG0n4O4=
X-Google-Smtp-Source: AA0mqf57P7LXjvQhOVeCRKnUQX4vqQ/RJW6Vcq5E7n0NJV7dH1vjmrfc7mvMsX1rkhB+cjcguUVbXnhhLFGnxMuGoN0=
X-Received: by 2002:a05:6512:3b9b:b0:4a2:4aad:8fff with SMTP id
 g27-20020a0565123b9b00b004a24aad8fffmr7805709lfv.445.1669141949176; Tue, 22
 Nov 2022 10:32:29 -0800 (PST)
MIME-Version: 1.0
References: <20221120175237.194899-1-f_l_k@t-online.de> <CAMKF1spErHg3JX+DFRLcW4EthTGBMm4A24XsyAVOO3RNr6Wgfw@mail.gmail.com>
 <CANNYZj-UTuxW0-Rr7FhgjwE007Gr28Pc5ZCo=cnrDcaNsuZStw@mail.gmail.com>
 <CAMKF1srs_tmRRNqWQAmBKOkJkfysJt=OZjefq_mPd4htPGi6VA@mail.gmail.com>
 <1729A925BA1D06C8.25787@lists.openembedded.org> <CANNYZj-mhM6FzQY4Lv2BckodcLtPSUV29GG4TCUb_Tp003SAbw@mail.gmail.com>
 <HRFQLR.NFABK2KMZ9XR2@t-online.de> <4BF25A91-3F02-49A2-A546-A9CF7881E0ED@arm.com>
 <CANNYZj9uxKov0vrox7N3kv-HdQJ9VDbLu7Jsn_SuVUTz_Nbrzw@mail.gmail.com> <d945c2d89848932cd437ab8ae0a4f41a6f76ef19.camel@linuxfoundation.org>
In-Reply-To: <d945c2d89848932cd437ab8ae0a4f41a6f76ef19.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 22 Nov 2022 19:32:17 +0100
Message-ID: <CANNYZj9ukvo3YE5Aj+cCPUR-ut6ZCKyNK77TRk_bytsV2ArgwA@mail.gmail.com>
Subject: Re: [oe-core][PATCH] python3: add ${bindir}/python symlink
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <Ross.Burton@arm.com>, Khem Raj <raj.khem@gmail.com>, 
	Markus Volk <f_l_k@t-online.de>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 18:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173698

On Tue, 22 Nov 2022 at 19:14, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Rightly or wrongly, this patch will cause large amounts of pain for
> some portion of our userbase and I'm not sure we have enough
> justification to do that. That pain wouldn't likely be realised for
> some time either :/.

I have to point out that meta-python2 hasn't even received a
compatibility update for langsdale:
https://git.openembedded.org/meta-python2

While this might be 'too soon' to conclude that python2 is truly dead,
maybe a year (or two, or three) from now it won't be. Fedora has
already made the switch, Debian will follow, and honestly, I just
can't muster any sympathy for python2 users anymore. You can't push
back paying off technical debt forever and expect others to
accommodate you.

Let me propose this: a PACKAGECONFIG for the python recipe that adds
and installs the symlink in a dedicated package. We can keep it off
for now, but somewhere down the line we could revisit that against
established practice and what PEPs say then.

Alex

