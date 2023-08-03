Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E53EB64DD
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 17:57:32 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.1073.1691085449686025545
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 10:57:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=PVAhxMav;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2b9ab1725bbso20224461fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 10:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691085448; x=1691690248;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lVp9C7qin74ZNfdxBmZkdeJRAWL3h/3IT1PrnNP+5tk=;
        b=PVAhxMavLMsjZXke/+GwnpHk3xYFTU1ZQdgFN8EsGfOu1BSfItAOU8bNmYeuS7vUE3
         IcbtiBQMxtfUN1HcF+XYK9OU3kKXCrbwFERDVmO+9GDVZV1L+iJ6HjLU3UMjL5lTFFBR
         kXRQ9uYqsKW8YYH/1VwCzrBNJLsKY60Lfr4JXWU2dwvr21jydTYcaskZhRB8WLT7qnPp
         RSAGglmwFmEuPSnWKinQlCF0TeqwYIF0jXONyxep0EvjRsDUlAi5CENobqsyTeh9pzOd
         4fzhTJJRaOnTWyz0gcZ6cfnKbRTzIxbJWuJpnlf8k+sy0fkgB6R6sVqHrzGbFG1XfjtA
         ZIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691085448; x=1691690248;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lVp9C7qin74ZNfdxBmZkdeJRAWL3h/3IT1PrnNP+5tk=;
        b=SBn07FjeMSVR18Ibke6vbi4002DKC7uVGbnB42XVmEZyiIzntIvk8RbZDiRsSk4cQR
         xGJHypKXbqhBGW5czUV+QtG6gpn3sWRkXNLLVz+Xt/HuPloKOtAEhsaUpnC3vR/7rLBY
         pvnnR7x9aY4DCUkDBgtbmWv3Wf6JcTql/65/0Qxdl5NEC1yuOIE9RWhUMKgvqvlSh2t7
         Q9CrG60ueVlejEkRJlkpV3QKaEAIXq3ykOyQ+dbTQuBZ7KN7ESMECcbwZ4qH6tJyGK88
         kUTZUQD/potOFQvgDo2PBbmwhelUlBBFCKER57SojpF6ak4JVuw7eXPTre2XT9UH29si
         4Asw==
X-Gm-Message-State: ABy/qLbwVnba27eH5TjcjYCZ75tXOEIosrRkVb9/dJkXxkBfBKiLKVJS
	/q9h6z8AE6qNXnbpCtfTpk12Ri7Vx8IMflRDXO0=
X-Google-Smtp-Source: APBJJlFUZOlRjsXkuC2V2leAOjizepIz2/wutm7qRxV8Am4rOP+nnrDiGQkGeYeNNB6Gdf+z/VNZbo2GkWkggExPU6A=
X-Received: by 2002:a2e:3008:0:b0:2b9:d28c:9c1c with SMTP id
 w8-20020a2e3008000000b002b9d28c9c1cmr8176170ljw.26.1691085447619; Thu, 03 Aug
 2023 10:57:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230803174724.1107094-1-tgamblin@baylibre.com>
In-Reply-To: <20230803174724.1107094-1-tgamblin@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 3 Aug 2023 19:57:16 +0200
Message-ID: <CANNYZj_hYZmpNRgO-7dKeB=Oo+SJzomJX8t1xvV7WYZr-7OcMA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] python3: add additional timing-related test skips
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 17:57:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185491

On Thu, 3 Aug 2023 at 19:47, Trevor Gamblin <tgamblin@baylibre.com> wrote:
>
> The following tests have been seen failing intermittently on the
> autobuilder:
>
> test.test_multiprocessing_forkserver.WithManagerTestBarrier.test_timeout
> test.test_time.TimeTestCase.test_thread_time

But have they, or have we seen them fail once? Both tickets have only
one reference each to a failure. I'm not sure we need to disable the
tests this quickly.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=15177
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15131

Alex

