Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 872E1E732C8
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 12:42:36 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.12579.1695904951204265416
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Sep 2023 05:42:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LhVzyRxS;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2c007d6159aso208053721fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 05:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695904949; x=1696509749; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fUZntINhbFo7EpT8pVdfbJDd32FZE4dYL0cWYLhUGrQ=;
        b=LhVzyRxSMoULW5elcbVJCxBfpfWfxNg1lgt5W1VWw0EIgJAdRH18LYoAO5sG9fnyp1
         iYTqbMBsFPwDaK/T1RT5I41gXzWL2cCIGME0HqskXRoIgies8Urod3nPil4xmVLGK/IJ
         a7EE2AdoM+EiZQgAVv5lO2H5qrrzi0l3pfkmjgHbZJZ/MS1DMAlgZBreP8bb5kroUUO+
         8uILTSij8OvCtMGu97qiZzRgAjM7c981e9JCpRsdDrtrYHyJ2qjqxnPNvaDWoeeu6J1/
         6wn1kNQqlrwI5+Kfn5/nBZKvEEYL1hWAyctBj/6mlerNnMETzk5n59Oa/DaFzYQyZ/t+
         QIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695904949; x=1696509749;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fUZntINhbFo7EpT8pVdfbJDd32FZE4dYL0cWYLhUGrQ=;
        b=O1vKjMvU2u5jV9ss7CeM5TOIjfmD+AH59FV47dDFzl6O2p/cXztBAANgF5dVKb3S5M
         tRGGXqsOxCW0qdCw5iKlvLRn37SpHVPRDVKnU8sHIIM7rp/KgVMm7WVNppqh0db+enyi
         G873qq+XIkoEWN4oav/yh2DzRAi2n2VLl51Sl8kloDfw9W3u+zIulbvaa09UsEDoGRRa
         2wSBXcgJP06j5hifqhl6JO4hcCxkeLKpBS4/pNoaX0S8h8wxA7LbAcwUFOYaNlFpWCH8
         MoOe4F6jYkjRI4MBtuO4dsw09RGbcpJLVcEOhWzEByRPDzeQVriw2KZF82ybt/1w3KTb
         HGaA==
X-Gm-Message-State: AOJu0YxGr5ANRhFaaTnc3Erkjtea8y6AxCSFa1fBw0BtMPDRxig7lhWh
	dqRAJ5pGLeq0ha+8YMElSkua9TqJbaDlzVSRoBQ=
X-Google-Smtp-Source: AGHT+IFXL/FwOw6CI92g2uDbJTHTNxvKE1UQL7TcgMvk2AUXAvLB9ntk7QZO3hzn16/A+h18bgivVd6wiTA05Mn/vLk=
X-Received: by 2002:a2e:98c5:0:b0:2bf:e596:36f9 with SMTP id
 s5-20020a2e98c5000000b002bfe59636f9mr1016327ljj.13.1695904948931; Thu, 28 Sep
 2023 05:42:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230928015606.3252024-1-robert.joslyn@redrectangle.org>
In-Reply-To: <20230928015606.3252024-1-robert.joslyn@redrectangle.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 28 Sep 2023 14:42:17 +0200
Message-ID: <CANNYZj89rH9=bPNXL3Xt8PCdEuz_UQymNOhoQPYFMNR1h+9yaQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] curl: Skip tests marked flaky
To: robert.joslyn@redrectangle.org
Cc: openembedded-core@lists.openembedded.org, raj.khem@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 12:42:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188371

Thanks, I suspect many of those were enabled to begin with when I
recently changed the packaging to include all the tests.

Alex

On Thu, 28 Sept 2023 at 03:57, Robert Joslyn via
lists.openembedded.org
<robert.joslyn=redrectangle.org@lists.openembedded.org> wrote:
>
> From: Robert Joslyn <robert.joslyn@redrectangle.org>
>
> Some tests can fail intermittently and upstream has marked these as
> flaky so they can easily be skipped. At present there are 12 tests
> marked flaky with 10 of them running in the default recipe
> configuration. Skip them to avoid the failures.
>
> Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
> ---
>  meta/recipes-support/curl/curl/run-ptest | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/curl/curl/run-ptest b/meta/recipes-support/curl/curl/run-ptest
> index 95af2bd7b3..8f9c20f34d 100644
> --- a/meta/recipes-support/curl/curl/run-ptest
> +++ b/meta/recipes-support/curl/curl/run-ptest
> @@ -1,6 +1,6 @@
>  #!/bin/sh
>  cd tests
> -{ ./runtests.pl -a -n -s -j4 || echo "FAIL: curl" ; } | sed \
> +{ ./runtests.pl -a -n -s -j4 !flaky || echo "FAIL: curl" ; } | sed \
>       -e 's|\([^ ]* *\) \([^ ]* *\)...OK|PASS: \1 \2|' \
>       -e 's|\([^ ]* *\) \([^ ]* *\)...FAILED|FAIL: \1 \2|' \
>       -e 's/Warning: test[0-9]\+ not present in tests\/data\/Makefile.inc//'
> --
> 2.41.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188349): https://lists.openembedded.org/g/openembedded-core/message/188349
> Mute This Topic: https://lists.openembedded.org/mt/101630676/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

