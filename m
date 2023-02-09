Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EFCDC61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 11:42:31 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.12364.1675942943728750886
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 03:42:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aEsoSyNQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id a13so180090ljq.6
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 03:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+jSmHIvIK0hp8oN0FumJv67kv579+dG0azcEGKWTwHU=;
        b=aEsoSyNQpUn3ehd+jGsgJacQKTlCbmyfySExpqpU4JRKYNz2b46qfCjCex4PA9Fi2d
         yiu4eBDqGvpX1goGBvBk6wosfJ32G9r5yMGmT2Ybo88KtUwACs98AkTzR/uzX9/e+pHF
         b50BCbc8lUXRfqn71me8MArqkhWqM5P7p++yGbZcbKkmQMThRMHxuMZogKB2wjlBjrtF
         nDzgiPNKzqnP0eLYOP+myP6Bhiobo0O00XZtwEgQf9uKqoiJoXq69FPHFONdIlqoUFo0
         UzfEgdrepvHVPbJjCG6PI15YL+dNlUpL9fOPeCrM01U4O3ExOBtloUFBb8HNBFcRtWy4
         z9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+jSmHIvIK0hp8oN0FumJv67kv579+dG0azcEGKWTwHU=;
        b=RX6akVRBh+HE5P5nUL3Q1JmCnhNRSZd29avAEITkZ4WB1mxEre8CkK03DlYXhxHSk/
         y2s3dpGQVpa+87I2fSPgT3pKC1yNOtpOVsopbnL39pYcoXgfIqICOJtJccFJhNYfG1gA
         ymdykYahEvhYkgiYfn/HzGJy+yJ9ku/t7LVS9Il5xEnEIdJ/G8BYyGXyb5f/Di7gxseE
         V2kPRDilTEdIBauXs5BWCiXb/UEvDUqT5BILdb3mBfa4cFIjCxpIj9DgfdY1FbaeKoX1
         KQT1ygY1J2sWwxumHmkyNPRjw64yTi1DNeQdf8wOvq7tyaXyTC6edb7HcOPZvF7MngY6
         Q1uA==
X-Gm-Message-State: AO0yUKX+PWnin4UzGUpY5tKg9Tx0HRRM1U912KhzXHUWzsxe2GqtRxDt
	wu8dRxBv8eCDHC7x88MzzsE9nh6eQLcZGlHKR5o=
X-Google-Smtp-Source: AK7set+KMGabmkBEeTfcB3fhcMjFjyFXuU06SkaCnKfYo2WSVeGjeGD+7+xKnrk4VA0gEJgzqkOYvi8S4bwoKN1z7LI=
X-Received: by 2002:a05:651c:1054:b0:293:341d:b765 with SMTP id
 x20-20020a05651c105400b00293341db765mr98643ljm.90.1675942941918; Thu, 09 Feb
 2023 03:42:21 -0800 (PST)
MIME-Version: 1.0
References: <20230209080936.148489-1-mikko.rapeli@linaro.org>
 <20230209080936.148489-3-mikko.rapeli@linaro.org> <b9dd7731ad6e5e5bbe2a061f87c2d2452ca6524f.camel@linuxfoundation.org>
 <Y+S+g0W4NZ+0zd5g@nuoska> <CANNYZj9Hr2AZSuXutfF8kktatFt-AmsYT2bp9oauOLLFonQ5wQ@mail.gmail.com>
 <Y+TVGJ+OOfSL+pBX@nuoska>
In-Reply-To: <Y+TVGJ+OOfSL+pBX@nuoska>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 Feb 2023 12:42:09 +0100
Message-ID: <CANNYZj8KYxL_W+oPXT4T+MU3RtB6h4t7egdassM1W__9yoATxA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/8] oeqa ssh.py: fix hangs in run()
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 11:42:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176948

On Thu, 9 Feb 2023 at 12:12, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> select() returns with any data, even single character. Fancy readers
> will read larger chunks but will read more data than is available and thus
> block for ever. Plain read() will read the data which is available from
> select() and thus really small amounts like single characters if that's
> available over the socket. This is visible in the partial read output of
> do_testimage() task output log which becomes quite unreadable without change.

Yes, but this does not explain why single characters happen to begin
with - RP offered a hypothesis, but the problem is that data arrives
that way, not the tight-loop manner in which we're reading it.

Alex

