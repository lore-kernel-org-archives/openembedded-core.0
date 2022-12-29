Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00925C4332F
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 19:22:08 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web11.1939.1672341725772391118
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 11:22:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BXtpFTGq;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id v15-20020a9d69cf000000b006709b5a534aso11959332oto.11
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 11:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gwpZQBcZIv7oq4FnWE5yS2Vh5oJZxmtqbBRGBgAjG5I=;
        b=BXtpFTGqMMOUPAue/gcNST0p6uKZ1u6Y47RvVtjXv7Cjrexva1jCUKwC/qnLBynNAs
         FNfp4g1DzCcsEGP6hqnGrIt9s2h4XEn4E9u37hVQtdLs9FSDN4pHw+vt32hzkkdpHWId
         DWxWRUtruWiGYyObKrfFX4ahiflVASQrpOgssOKnGaKglK7XQK67ClYdwW8eqOpcmwnB
         9anCKTANnkf7XQ3zk/2synI+FOChWKVERN+/zeTV/0KToBSGgmvrAiJhGKxGrKg5HWIr
         IWy7ACmPVWDHyRS743Ojl00SZgS4vjOLH10RkkXLAtcnGh0KCBMi8RkV9PxeSq2Jj66d
         uW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gwpZQBcZIv7oq4FnWE5yS2Vh5oJZxmtqbBRGBgAjG5I=;
        b=boq8aB1o8aWit0lsFEap5k+DZfKsHATypJNEHZymY/HeDB0XPRMN3nmEDjINi73pyl
         RDlCW9H7fTKzjEBoANUnlwVAXyBGMX4D/52vOQIS+znoSnZ3p01AfAsskK0q1qvaS5KY
         nRvBkNglnt04YyC8n8oC8ZbYXvt9Bgdjc1YhXBLLK8Dk2Hu+RUKe2NgfX81gdQwTl65w
         CeCcCiV5Pyn4c+EpTOgKLyVnQ3MTDJFY7stGJwfLff2LaJ62MKE0lLU3Qk2WTUcldJ3O
         IgI61bgHA0pOq3wTu9N7aUOCouyMJBUgZ5hTHtHNk0XCMd9VplLc+WNSC2qS7Odw9ROR
         lGTQ==
X-Gm-Message-State: AFqh2koeFr2VHEl8SdufRMWo0puhad+8LXIwcWXTIfgMZ2lJp8EG/mn3
	x0ysnJMwFow8KOXy+F2kuRPTkxFlIb0Wqq4AIwI=
X-Google-Smtp-Source: AMrXdXvi4Z3K8iYOPtm8sIUMp9NAkb/7T9ezcAWTBLrHu7uWWWB7FylVkrB9aYDBy6xUTGD1Xr2shaMd8Prq4zVJeBU=
X-Received: by 2002:a9d:5cc5:0:b0:676:92ca:f7f4 with SMTP id
 r5-20020a9d5cc5000000b0067692caf7f4mr1549921oti.55.1672341724990; Thu, 29 Dec
 2022 11:22:04 -0800 (PST)
MIME-Version: 1.0
References: <20221229190918.2242791-1-raj.khem@gmail.com> <CAO5Uq5SXZrmiu-RsxaJ_yxj6RV=+-LH1765D7Dqdz+a1DCecMA@mail.gmail.com>
In-Reply-To: <CAO5Uq5SXZrmiu-RsxaJ_yxj6RV=+-LH1765D7Dqdz+a1DCecMA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 Dec 2022 11:21:38 -0800
Message-ID: <CAMKF1sq7+8u+pA5duTdpXn86qQySVdE482U+GLQpQS=xTzOVrA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo: Do not use open64 on musl anymore
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 19:22:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175128

On Thu, Dec 29, 2022 at 11:11 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> Should we just move these patches to rust-source and apply them for everyone who consumes it?

A common source will certainly be better however, we do not use shared
workspace for rust recipes
so it does not matter as much.

>
> On Thu, 29 Dec 2022, 19:09 Khem Raj, <raj.khem@gmail.com> wrote:
>>
>> The same rust getrandom patch is needed for cargo on target as well
>> as it uses the same crate
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-devtools/rust/cargo_1.66.0.bb                   | 5 ++++-
>>  .../rust/{rust => files}/getrandom-open64.patch              | 0
>>  2 files changed, 4 insertions(+), 1 deletion(-)
>>  rename meta/recipes-devtools/rust/{rust => files}/getrandom-open64.patch (100%)
>>
>> diff --git a/meta/recipes-devtools/rust/cargo_1.66.0.bb b/meta/recipes-devtools/rust/cargo_1.66.0.bb
>> index 37e0123ee3..f45f8f1e12 100644
>> --- a/meta/recipes-devtools/rust/cargo_1.66.0.bb
>> +++ b/meta/recipes-devtools/rust/cargo_1.66.0.bb
>> @@ -14,7 +14,10 @@ LIC_FILES_CHKSUM = " \
>>  require rust-source.inc
>>  require rust-snapshot.inc
>>
>> -SRC_URI:append:class-target = " file://crossbeam_atomic.patch;patchdir=${RUSTSRC}"
>> +SRC_URI:append:class-target = "\
>> +    file://crossbeam_atomic.patch;patchdir=${RUSTSRC} \
>> +    file://getrandom-open64.patch;patchdir=${RUSTSRC} \
>> +"
>>
>>  # Used by crossbeam_atomic.patch
>>  export TARGET_VENDOR
>> diff --git a/meta/recipes-devtools/rust/rust/getrandom-open64.patch b/meta/recipes-devtools/rust/files/getrandom-open64.patch
>> similarity index 100%
>> rename from meta/recipes-devtools/rust/rust/getrandom-open64.patch
>> rename to meta/recipes-devtools/rust/files/getrandom-open64.patch
>> --
>> 2.39.0
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#175126): https://lists.openembedded.org/g/openembedded-core/message/175126
>> Mute This Topic: https://lists.openembedded.org/mt/95942095/3618097
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kiernan@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

