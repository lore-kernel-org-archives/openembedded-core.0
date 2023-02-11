Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82747C61DA4
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 14:11:45 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.9632.1676124701067533288
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Feb 2023 06:11:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=cZitJM5q;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.47, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f47.google.com with SMTP id p26so22148461ejx.13
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 06:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rjIKXEWhskgl/LFRUGj1xr6b1dIkBMd3lEyH2xW++yM=;
        b=cZitJM5q3tvf/enG0DLfruYDjQUCbQ5uEr0HbXU0LoPJQ2Q9HjZks9JgifNTYemJgl
         1SIYn4fZhkbsIY3jvzLUGcGEw2ZIeFcaJuxTE7DCso6SxtPOLl6pFvGgUc4dhSG6dvPX
         fO+kH469U8OfLI6//HMwm6ceYKInbAtixzylNQKeAXE+5e40aPbX2zikUSy6gfTVnd69
         UOO9VcvoQNjGeGqm9MpnJonebeTfBvnvuJr/BChQ16EKOkMqXG98Dd9bIyH21Q1fTfLK
         8/b+QEUBOF/4jOfqWIxVlMHF1cUlqMa161bycPKIN8KMdeht53aDeVzraofBQSboIPWF
         Bpcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rjIKXEWhskgl/LFRUGj1xr6b1dIkBMd3lEyH2xW++yM=;
        b=sRAPNbYGUOEVamE75kQGHlxS4Q6P1S88rF5yIVmy9poYM+Gewq8O05A/Se92n64iWc
         IAmj+oEAgGwgx9b/YMp0d8rE+FdRoEp1T8hJT6llrpHnpbgDpa9ez1VxU/CP6XtWxgCK
         K/WSTQGjnbn8i/iPf5gl212BR7x2O30CrswaekgwBWU+xvGnHWxGXmjlqVg8rseRU2XV
         3KBUZR8hgMVCmmDDGgSeyiurTmESDVyuDu1cvfdxT2PvCeji/D7uGzbneRPzyo5m89yU
         2VXppwLIrMzQ6DKHrz6RVlGbuZK5XvFMnOoNgotqsin2cy9L7SsmDiphMdoaM0+UOEE8
         4/Vw==
X-Gm-Message-State: AO0yUKVZAzRtqvJ39Lm6Ei/g5KJmo61VXTVruMNZiRcd9TrMUfFN48zI
	2OCJntaMNqNyTfjJGIVZvo5BOvI24cnXa5q6KbPdJQ==
X-Google-Smtp-Source: AK7set9/hoPNhM7nVFFH/b7o0S7r/AOgKfVgDQaafiv+/VhCyjemBQL7KP12cD1ONzrMUcvJo6J8qk/PaaDESy138gU=
X-Received: by 2002:a17:906:c801:b0:8ae:96f5:fbb0 with SMTP id
 cx1-20020a170906c80100b008ae96f5fbb0mr2360750ejb.7.1676124699379; Sat, 11 Feb
 2023 06:11:39 -0800 (PST)
MIME-Version: 1.0
References: <20230202084116.2583868-1-raj.khem@gmail.com> <CA+chaQfohEhko1oBEm-k46QBG0To9D3-b9c458kSdtr13=ONgw@mail.gmail.com>
In-Reply-To: <CA+chaQfohEhko1oBEm-k46QBG0To9D3-b9c458kSdtr13=ONgw@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Sat, 11 Feb 2023 04:11:28 -1000
Message-ID: <CAOSpxdYYNwBD5H4crtUAohj_mMwegKTtkZBDeLHnpQQFVqJQqw@mail.gmail.com>
Subject: Re: [PATCH] scons.bbclass: Make MAXLINELENGTH overridable
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 14:11:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177004

On Fri, Feb 10, 2023 at 11:22 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Steve,
>
> I've noticed that you have:
> b0e7777a91 scons: Pass MAXLINELENGTH to scons invocation
> in contrib/stable/kirkstone-nut, but not this follow-up fix.

Got it!

Thanks,

Steve

> On Thu, Feb 2, 2023 at 9:41 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> older scons do not support MAXLINELENGTH and some packages still may be
>> using older scons, these recipes can clear SCONS_MAXLINELENGTH in them
>> and get going. Set
>>
>> SCONS_MAXLINELENGTH = ""
>>
>> in such recipes.
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Cc: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>  meta/classes-recipe/scons.bbclass | 9 +++++----
>>  1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/classes-recipe/scons.bbclass b/meta/classes-recipe/scons.bbclass
>> index d510c12b9b..d20a78dc6e 100644
>> --- a/meta/classes-recipe/scons.bbclass
>> +++ b/meta/classes-recipe/scons.bbclass
>> @@ -10,11 +10,12 @@ DEPENDS += "python3-scons-native"
>>
>>  EXTRA_OESCONS ?= ""
>>  # This value below is derived from $(getconf ARG_MAX)
>> -SCONS_MAXLINELENGTH ?= "2097152"
>> +SCONS_MAXLINELENGTH ?= "MAXLINELENGTH=2097152"
>> +EXTRA_OESCONS:append = " ${SCONS_MAXLINELENGTH}"
>>  do_configure() {
>>         if [ -n "${CONFIGURESTAMPFILE}" -a "${S}" = "${B}" ]; then
>>                 if [ -e "${CONFIGURESTAMPFILE}" -a "`cat ${CONFIGURESTAMPFILE}`" != "${BB_TASKHASH}" -a "${CLEANBROKEN}" != "1" ]; then
>> -                       ${STAGING_BINDIR_NATIVE}/scons --directory=${S} --clean PREFIX=${prefix} MAXLINELENGTH=${SCONS_MAXLINELENGTH} prefix=${prefix} ${EXTRA_OESCONS}
>> +                       ${STAGING_BINDIR_NATIVE}/scons --directory=${S} --clean PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS}
>>                 fi
>>
>>                 mkdir -p `dirname ${CONFIGURESTAMPFILE}`
>> @@ -23,12 +24,12 @@ do_configure() {
>>  }
>>
>>  scons_do_compile() {
>> -       ${STAGING_BINDIR_NATIVE}/scons --directory=${S} ${PARALLEL_MAKE} PREFIX=${prefix} prefix=${prefix} MAXLINELENGTH=${SCONS_MAXLINELENGTH} ${EXTRA_OESCONS} || \
>> +       ${STAGING_BINDIR_NATIVE}/scons --directory=${S} ${PARALLEL_MAKE} PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS} || \
>>         die "scons build execution failed."
>>  }
>>
>>  scons_do_install() {
>> -       ${STAGING_BINDIR_NATIVE}/scons --directory=${S} install_root=${D}${prefix} PREFIX=${prefix} prefix=${prefix} MAXLINELENGTH=${SCONS_MAXLINELENGTH} ${EXTRA_OESCONS} install || \
>> +       ${STAGING_BINDIR_NATIVE}/scons --directory=${S} install_root=${D}${prefix} PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS} install || \
>>         die "scons install execution failed."
>>  }
>>
>> --
>> 2.39.1
>>

