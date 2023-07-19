Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30940C001B0
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 20:26:34 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.463.1689798390502693472
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 13:26:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=APMzct3t;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2b701e1ca63so380831fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 13:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689798388; x=1692390388;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4pi66pDu9Zrq2tYf/tMpbFhvu1mEMSJkLAVvVkNfwV8=;
        b=APMzct3tCUFxnZxALB0A77xZlEa5uZaEaFpdInts2fjhp1FwDv8AwTVuwYoH8IPCKR
         PdTObZz+kDHjhvhhrWn4+3xMpwd3gZXqWepXkijUepv0XPY0Zv4h/LjxA4rAFsq5deXI
         9U0IlJ7pHpNTydqxrHgIK23wkhSjtxb7nkQ9JlbYV+e2ms+TLoG9RdSmNhqA7nC4A4U4
         BTKAdALRqbAuC3uFggXnXE1L9iYDIh9Dhobi8J0JopQnAoYTefO6MjvqiQuZ/K0XzlwU
         kiJwXBEVBkhzDGSUCKzSFnfBRwQs+ZBCqxSv31SCWXZxzJBdkBicF28sfafXNOhJhJKm
         eBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689798388; x=1692390388;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4pi66pDu9Zrq2tYf/tMpbFhvu1mEMSJkLAVvVkNfwV8=;
        b=l7jQBV2iNCfULcuHD0XM1bNyYD3mrAD0xAXNmiCQ+s+gvwwioSMi63koDygCr9j2l8
         InKinfIrTwL7HiF5aU5HJcpR4eq6nXsv045v3OtDw9t37DPgexKKKBkrmyLzgay6Uz3A
         cTOdRAgmP1Oitgzquc8xhCB2SwCATJfkF4KltzNfAnZ9iRRS4eiHDBjHyqHxnllfGr1S
         q+SZst40yWxOGJ2vGtWA7BTs8duKz/SmAWZorF4zQ6tlkU7XdA/vjhLVU9fBIlSG2lD1
         pgW+bz8juK09R8QKdyXInyXp9wyZHiWLnNws85oLNB3OMOxvLIdzcRIKzXy8YApti7Ub
         jQBA==
X-Gm-Message-State: ABy/qLYnlFDojmrquBlpxylEdZMB2ov8v05ZSszec6iStDpbiniQvESi
	cK54NaubrdRYkxREysQ/mLEk9rWkg8ukEOEGo8c=
X-Google-Smtp-Source: APBJJlG/Wa4dOPFHMvmfLwpbhSCrSkw4FE7druAeJAtZNgVTuTXNCVlg5pwHSOcxg/bjgId5th17BJvTR4b8lho/UfE=
X-Received: by 2002:a2e:7805:0:b0:2b6:e12f:267 with SMTP id
 t5-20020a2e7805000000b002b6e12f0267mr749933ljc.5.1689798388274; Wed, 19 Jul
 2023 13:26:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230717143624.437293-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20230717143624.437293-1-richard.purdie@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 19 Jul 2023 22:26:20 +0200
Message-ID: <CANNYZj-9u4gDwvjL8+9F8+GSJUqes45w-DMn-v2xvg3qaXRH5w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ptest-runner: Pull in parallel test fixes
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 20:26:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184607

Unfortunately this seems to once again have regressed glib/codegen
ptest (the test writes large amounts to stdout):
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15154

I'll send a revert.

Alex

On Mon, 17 Jul 2023 at 16:36, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Pull in the commits:
>
>     Change test timeout to be total elapsed time
>     Report if child dies from a signal
>     Recreate pipe for each test
>     Revert "runner: Correctly handle running parallel tests"
>     runner: Correctly handle running parallel tests
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
> index 6f3104499f2..77e2b94f376 100644
> --- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
> +++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
> @@ -7,7 +7,7 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
>  LICENSE = "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
>
> -SRCREV = "8259375d306a8129f6c5d8528314496fc6ae1ca3"
> +SRCREV = "07d8a676aa962ecc5ec264ec33b0074adf2a8733"
>  PV .= "+git${SRCPV}"
>
>  SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master;protocol=https \
> --
> 2.39.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184473): https://lists.openembedded.org/g/openembedded-core/message/184473
> Mute This Topic: https://lists.openembedded.org/mt/100195650/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

