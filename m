Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE38C001DF
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 09:32:27 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.7513.1691141541662843591
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Aug 2023 02:32:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=fdLLj8MD;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4fe389d6f19so3157826e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 02:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691141540; x=1691746340;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u5jknkizfq7Qs2bZokuastAxU8iS2ALTFpDQjwhMA74=;
        b=fdLLj8MDTzdId8HDG4oAeADFnSS4txkBjQLa3KN2cec7Ji9sFC77Q8CbqJJMAIyLFZ
         2Ee3MEFg2W3X3oeINbb3jbds4BJDoAVjbhxrBsPTMbLbk4trwdGufgufA3nKQmcvJJn/
         Fsqi45k/KqDo9OdgSfN/mkD4p35veOepTu5rM4jLUB/14xrJIPwrPGmSa86/MXWIH9sc
         W7/aMcevlUAlZ19BGEvDpbIyTIYhYa8ZHy20orbKoebCrGXAyaKHLBY96NQ5k2550RCQ
         f710Y2AEpXtOvEpr6d5laYFrc4wIyMK0rHaGCKjqqn1UQ7jQzZ5Ecb/2rW5WAaR6s9Qb
         H+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691141540; x=1691746340;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u5jknkizfq7Qs2bZokuastAxU8iS2ALTFpDQjwhMA74=;
        b=C5KaDpwc027pG+eJq0vYE46O1vQvxtMV1Uiu4Xjur4UDgUGjgEnfhQfhPUwyEXhDB9
         p5sYhzJpYH0zs+0sYLMLQ+Uf2LPx5V0zy6lDAUTaQZ7QaEuiCYgeTOxFXMyZCuCpISbO
         Xob6mTpoqZrAsLuEK16gROG5qudYZlWcp5SfjCapdsLl8RLKVz/7FJhJKu+sIuCWk57L
         kqiY5mkbK6Z8cuZpUsCtwSokxq2IjWmLohWx3a2VVdL7Qz7OlKXWm9glgY4hgwl3wan9
         ugh6LCc/sSPO6MXoADdDipiNZktTBtaLAXpzb97dct+ih5qOR8uWUty6yWxm7iIKLud4
         b7Yg==
X-Gm-Message-State: AOJu0Yx2Cer/GxW1O+0rbZtm4tkar5L7ymtvmGjVOirc0EAg1kzGOTm6
	B0xFblieJjoehYWp/Rq7+9qgD0SrCdezQlDvilk=
X-Google-Smtp-Source: AGHT+IFdLy8JELjXab/72szhXV4dB5pbtoZnQTV6oJu1ugFfj1cBkwK8z5b97WYVljoCR9AK/vf4h9Mqu6d61vcEubg=
X-Received: by 2002:ac2:58f8:0:b0:4fb:8948:2b8e with SMTP id
 v24-20020ac258f8000000b004fb89482b8emr800345lfo.8.1691141539557; Fri, 04 Aug
 2023 02:32:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230802214019.1068795-1-charlie.johnston@ni.com>
 <20230802214019.1068795-6-charlie.johnston@ni.com> <CANNYZj9djkn0bxvRnNyvwNwUrMx6hHuAPwSwD9QFOWhEUb-rAA@mail.gmail.com>
 <36a2aa5c-e417-7ac2-f669-0c0a712c4325@ni.com>
In-Reply-To: <36a2aa5c-e417-7ac2-f669-0c0a712c4325@ni.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 4 Aug 2023 11:32:08 +0200
Message-ID: <CANNYZj9ggJiQVrz27x-fDBv-O6yh3DYGRWDLNfiRWP+3g8-BsA@mail.gmail.com>
Subject: Re: [oe-core][PATCH 5/6] packagefeed.bbclass: Add new bbclass for
 building feeds.
To: Charlie Johnston <charlie.johnston@ni.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 09:32:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185519

On Fri, 4 Aug 2023 at 01:53, Charlie Johnston <charlie.johnston@ni.com> wrote:

> Got it. Is running runtime_test.TestImage.test_testimage_dnf sufficient for testing the change? Or are there specific images I should try with testimage?

core-image-minimal, core-image-full-cmdline, core-image-sato,
core-image-sato-sdk should do.

> For the examples, how many sample recipes would be adequate? 1 or 2?

I think just writing an example or two into the comment at the top of
the class would be ok.

Also, update the documentation, everywhere where package-index is mentioned:
https://git.yoctoproject.org/yocto-docs/about/

Alex

