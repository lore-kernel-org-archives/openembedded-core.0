Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 965D4C433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 15:53:29 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web09.11811.1651247601835087514
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 08:53:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=xJCKdFTt;
 spf=pass (domain: linaro.org, ip: 209.85.217.48,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-vs1-f48.google.com with SMTP id a127so7958561vsa.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 08:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o3aRx82jWHgOnZaH43Oq3Zz0CVtjkcA/tKwGoHPPbIU=;
        b=xJCKdFTtT6DKx2f5nB2EhkUX1tA8e+mOFwGW6LO7cylGKDeq54yueuABVQN6ttsbcC
         innIjjghRfAncHNxWTH4tWUvr4oeq4sP5ssNdTcqFUCNXUXOPtyBFNUgY2w5uNSzrkcB
         leptpdUYfFqxEyqaICQ9kbAiJyTFnBEa4sCmEWykl3q0ATa8LcHDqmxvZJRKtbNsM4ue
         WVhPIpQ7EtjUMiGyFb+10B+a9FpDAvYLfmFakcQ3XWSB1GkGZQDlzy01/S6EvT56xm+G
         R+RMHPoTbMsQ8zXGm3jScaw4ONJUL6U6Hq21g7tTjopg8C+ntJl/W/NDZKWiM3lowvvo
         RVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o3aRx82jWHgOnZaH43Oq3Zz0CVtjkcA/tKwGoHPPbIU=;
        b=JKc3Ok81Q46Kekhqb6lguE3qsEJxcH9WC+4tGWJpsn8BGL7YM7t8m965SpkVLfDaO5
         fuzV2f4vRilTka9kOpXITk/ssnonMj5N9ArUtc/lg83JaIKcI9IuJitM1TmE4VDhbsgp
         SWYgLtVxxROZIurJOJsrDTCqM7SGF4embb494g6dfSFJbVXyZu3fEZH02Z68hlrTGdV2
         zl9lFhaLHdWxNntavzy+EN2B4r40k76SqUQejimhfn1UxLbGvcupNpcBFzoGsnaPsmpZ
         59yQAqzRP5RscRSinO63OuoWirea16X/KEYe6T+oiymW+OJodxaEVbsNmOD6VCuS4n8x
         Q0Ug==
X-Gm-Message-State: AOAM5300xNWg/X+3ZHQvQuRk2dmQpo+JMX+noLr15PcluPni24Wn+tjB
	SqJKWg3lGZV/buH3sB4ZvUHH/jGso+lIXmhnVcXTRQ==
X-Google-Smtp-Source: 
 ABdhPJzieY513i+2Lv1qIQovvR5+nC1bKHoUC2xzj4+bSiT/vkla9dROHQtBFDEGzJB9/IDi516kKUd5Fr8fybRnUFo=
X-Received: by 2002:a67:ba0d:0:b0:32d:f15:71e6 with SMTP id
 l13-20020a67ba0d000000b0032d0f1571e6mr2304486vsn.70.1651247600958; Fri, 29
 Apr 2022 08:53:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220429063226.22192-1-rybczynska@gmail.com>
 <20220429063226.22192-2-rybczynska@gmail.com>
In-Reply-To: <20220429063226.22192-2-rybczynska@gmail.com>
From: Ralph Siemsen <ralph.siemsen@linaro.org>
Date: Fri, 29 Apr 2022 11:53:10 -0400
Message-ID: 
 <CANp-EDZJRbjkUwF1368YCr2k2EyHr3-ynDNNArxkVB2kqf9sXw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] cve-update-db-native: allow an option to
 force the CVE database update
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 15:53:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165018

Hi Marta,

This explains why the CVE database update seemed to happen far more
frequently than it should. Thanks for digging into it.

On Fri, Apr 29, 2022 at 2:32 AM Marta Rybczynska <rybczynska@gmail.com> wrote:
>
> Add a new variable FORCE_CVE_DB_UPDATE allowing the user to force
> the database update, if the default update frequency is too low.

Just an idea, maybe instead of a boolean, the variable could specify
the interval, eg:

# Interval between CVE database updates, in seconds.
# Set to "0" to to force an update of the database.
CVE_DATABASE_UPDATE_INTERVAL ?= "24*60*60"

Regards,
Ralph

