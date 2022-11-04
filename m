Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F914C433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 14:36:41 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web12.11814.1667572596040793212
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Nov 2022 07:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=LpQ1uwpo;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.47, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f47.google.com with SMTP id sc25so13703049ejc.12
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 07:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B3V2MDd3S7b8ciC9XkjhJ8GdLGHdj6ss9cUKqn3O+4A=;
        b=LpQ1uwpoXrSmnsmz26qoYcrYY+g3eK4XsvScEXkhkfS1QiPw+aRSBpp7318V6yjA/s
         aHOIrb+lFfMsocRSiGi+LPprpkx9L23afWU5sPvUnYJz/BgEZzdoKL5boM+AER93kgu0
         czJTwWO8smhxMhWnotBwN7T3FkJicYZkoRtVSt5D75oegYymwLg/xrHJdVlahLrwsDWA
         axUB4UDDuqP9aKWwvurG6bqsSUU8UxrQCHNedhCK15Br/QMhtZkzNAFK+J3dtxuleVUU
         +eILhdTNN0XU9nEf3UQvxFvqSDAgTpx/B02/4qu94ij59XJXOvzUzyV9e1hToZL18TJU
         S0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B3V2MDd3S7b8ciC9XkjhJ8GdLGHdj6ss9cUKqn3O+4A=;
        b=Ut1zdyrAW44v/RANUluxH3KuaejKDI5CEC+c8riy7XbY6lbp3XTaefNGEYL5YuNn4a
         qZCpr+PBKMy5NFKWUJbN1wQmp7xsQ3ZOfhYqxtgasnZFW8H2CUI8pNTTHtu/DXClhtS6
         uvUW3o5ncRTOF1JcoWpbt0xHQt5hlAqmMsDgueVzERxvrsEjF0P55mzC9neOMBabaJfg
         OFAJ/uDivtYYbcnxpyTHNYLp8YEYBBgT7fep3LhbJOLGcvIf2QlyYWwBN2LlOvOK5sRx
         sRYDID+cDoD3q45R0SJMguzyWc1P8aGP8ENKtVmKhjyOlyX1++Nwf/nU75431CRKOb/W
         9ofg==
X-Gm-Message-State: ACrzQf2nd3QgF2hOaIltPKT2aKKnYsIAvJTPETQSoY7W++4e3+RuYo/+
	HI9rKfGQiGSTZB4f1cbZnA38/YgZvqWX38JkL2NlIg==
X-Google-Smtp-Source: AMsMyM5lwxzOYxAJJEnLFHM19hduXTnuslTLsTgQJwz4lD/sR2dSEOUkEGMzkwy82FVjl5QzQ+D21Pubh0hnbGzYZC8=
X-Received: by 2002:a17:906:3607:b0:7ad:a798:cdc0 with SMTP id
 q7-20020a170906360700b007ada798cdc0mr34190593ejb.357.1667572594355; Fri, 04
 Nov 2022 07:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1666150638.git.bruce.ashfield@gmail.com>
 <00d1b34b5d92325ea31564c0f7f4a5876f2e2edc.1666150638.git.bruce.ashfield@gmail.com>
 <CANPvuRntp+PviLVBbyr72XnSMczB176WXYOROmDV2kV=WMeb0w@mail.gmail.com>
In-Reply-To: <CANPvuRntp+PviLVBbyr72XnSMczB176WXYOROmDV2kV=WMeb0w@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 4 Nov 2022 04:36:23 -1000
Message-ID: <CAOSpxdYBcmOHb9fcyDDJfVcMJSKk3y0iejSREvTA4k2FmUV31w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] kern-tools: fix relative path processing
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 14:36:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172716

On Tue, Nov 1, 2022 at 11:32 PM Jose Quaresma <quaresma.jose@gmail.com> wro=
te:

> Can this patch be backported to kirkstone?

Yes, I will add it to my list.

Steve

> Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia quarta, 19/10/2=
022 =C3=A0(s) 04:39:
>>
>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>>
>> The previous fix for processing of paths with relative components, broke
>> uses cases that were a mix of patches and configuration fragments.
>>
>> Updating the SRCREV to include a simplied fix for relative paths, and
>> a cleanup patch from Jose:
>>
>> [
>>   Author: Jose Quaresma <quaresma.jose@gmail.com>
>>   Date:   Thu Sep 29 16:37:23 2022 +0000
>>
>>       scc: only look for error in scc_output_file if it has valid conten=
t
>>
>>       When process_file function fails the output of the processed scrip=
t is show to
>>       the user, some parsing is performed as well to look for common err=
ors so we
>>       can point to the right input file.
>>
>>       This can only be done when the scc_output_file have some valid con=
tent
>>       otherwise it will show invalid messages to the user.
>>
>>       Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
>>       Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>>
>>   Author: Bruce Ashfield <bruce.ashfield@gmail.com>
>>   Date:   Wed Oct 5 19:13:33 2022 +0000
>>
>>       spp: ensure that prefix check uses absolute paths
>>
>>       The previous fix for this issue was too broad, and impacted
>>       all calls to the prefix check and removal. With this change,
>>       we only expand the input on scc/spp operations that may
>>       execute with relative paths.
>>
>>       Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>> ]
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>> ---
>>  meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/m=
eta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>> index dea7b65a7c..07d7daf5fb 100644
>> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "\
>>
>>  DEPENDS =3D "git-native"
>>
>> -SRCREV =3D "ba600ef61a85966596126a6e8d936971905e8749"
>> +SRCREV =3D "6a4752ebbe7d242c02b3c74a5772926edd243626"
>>  PV =3D "0.3+git${SRCPV}"
>>
>>  inherit native
>> --
>> 2.19.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#171951): https://lists.openembedded.org/g/openembedd=
ed-core/message/171951
>> Mute This Topic: https://lists.openembedded.org/mt/94424337/5052612
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [q=
uaresma.jose@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma

