Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F42C433F5
	for <webhook@archiver.kernel.org>; Fri, 22 Oct 2021 09:42:39 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.6193.1634895758389687260
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Oct 2021 02:42:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=G2AG/fg1;
 spf=pass (domain: burtonini.com, ip: 209.85.221.52,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f52.google.com with SMTP id u18so3831818wrg.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Oct 2021 02:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SMMRqqscqpX51nrcD5vP3GZ651PsgXb6lQ6RhVsaSUM=;
        b=G2AG/fg1y7YgHTyIsM+40UdyI8/NjtRz3ykoiRaqJOd1gd4ryU1TFW0SBw6MUddLu/
         QtbNubNAktEhIwn+ZPfDLa5U+IUh/bw3W252zy25zoriTTETroh1Us97U5yir4eAC4k2
         5lR2YLEssfQnPFT5HXReBekBvE0AUzWSEG9TPPaiBj6DR7G10M/4xpuYxvtoUy9rD/gc
         yENn0LZWcSRd5Us/gIL2KunIH8U2e5wz+YhvLMuHw5zQUrwVVaPnSnNahF1Img6c6RiL
         ZVvZL33B87RxV4jw15PdwWKeGnip6HUm1jpY18x/zngykaA8V//5nxOkKibapxjIPuq8
         1CVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SMMRqqscqpX51nrcD5vP3GZ651PsgXb6lQ6RhVsaSUM=;
        b=BErQzcki+lRNltVypUfIHVis0P+joXH7pf+bOj9uSN+IQ0g+LoUiOiniMiBj67CcFp
         ZmV2dQoF1jSlnZgq818XcGAtnkqTaKfJCg0pbBkSmbtQC1+IJmXPmGag26AxxsU234/R
         ZMuYOWfj04AJP4a882svsDIJRUHpzo8eYllI3Mso6Zpk8nPCiZ3d1oCKdN81Ww4n54t2
         onfaJwKjhSR7dPipSfQSdzc9C/wvUDc7Hc3fP7+6oWTHAnEnOqu/A239uI9dECwSpEGp
         PYN/oJ2h5pZZPEr3zhadTr+jJwQdxHXbWta9riTzU/StgC1CPdUlv9tJTcJTs6+RUwQB
         NcXw==
X-Gm-Message-State: AOAM5328T/em8CRSiY2eb9/i2j6ccmBvA2H6BooIfIQScSXms63assNi
	2iOa5ivpBpXDURPi5OYUDcXQ93wi8muA1Vk1vUGaIQ==
X-Google-Smtp-Source: 
 ABdhPJw3ilJ+X9u6ZZjCWyTNu6vqCETdYmZYVWlc2G32/vQJL10aWeLY3F3NtKQT96KFN1fPXAQFOHxE7zp2dvzoEh4=
X-Received: by 2002:adf:8b45:: with SMTP id v5mr14248471wra.211.1634895756685;
 Fri, 22 Oct 2021 02:42:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211021143010.803736-1-ross.burton@arm.com>
 <CABcZAN=WLDgnkcq1=4T63v872YXKYkwadF=rcyK3=PnE_QCw_w@mail.gmail.com>
In-Reply-To: 
 <CABcZAN=WLDgnkcq1=4T63v872YXKYkwadF=rcyK3=PnE_QCw_w@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Fri, 22 Oct 2021 10:42:25 +0100
Message-ID: 
 <CAAnfSTtbfPQTzKOZCmXsrkxbUg-F7fYRvSV0-nJOY9WN=4cQEw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] strace: show test suite log on failure
To: Christopher Larson <kergoth@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Oct 2021 09:42:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157294

You're right, it will.

I'm on a roll this week. :/

Ross

On Thu, 21 Oct 2021 at 22:53, Christopher Larson <kergoth@gmail.com> wrote:
>
> I'm not familiar enough with the ptest-runner to say, but does the exit code of run-ptest get used at all, or only the output in the expected format? Just noticed this will suppress the non-zero exit code of run-ptest.
>
> On Thu, Oct 21, 2021 at 7:30 AM Ross Burton <ross@burtonini.com> wrote:
>>
>> If the tests fail, dump the log so we can see the failures.
>>
>> Signed-off-by: Ross Burton <ross.burton@arm.com>
>> ---
>>  meta/recipes-devtools/strace/strace/run-ptest | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/strace/strace/run-ptest b/meta/recipes-devtools/strace/strace/run-ptest
>> index 3a51fb0be9..42ececdc4f 100755
>> --- a/meta/recipes-devtools/strace/strace/run-ptest
>> +++ b/meta/recipes-devtools/strace/strace/run-ptest
>> @@ -3,4 +3,4 @@ export TIMEOUT_DURATION=240
>>  chown nobody tests
>>  chown nobody tests/*
>>  chown nobody ../ptest
>> -su nobody -c "make -B -C tests -k test-suite.log"
>> +su nobody -c "make -B -C tests -k test-suite.log" || cat tests/test-suite.log
>> --
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#157284): https://lists.openembedded.org/g/openembedded-core/message/157284
>> Mute This Topic: https://lists.openembedded.org/mt/86490861/3617123
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kergoth@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>
>
> --
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics

