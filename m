Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95120C6370A
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:01 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.31652.1649693081254041855
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 09:04:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SMykGkWv;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id hu11so13579012qvb.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 09:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wUF3iyUHOBalVTfSVZBIsN4ZyrnfVs22DMxDqn9ZA1g=;
        b=SMykGkWvxcusPQyM+C1TUtX+tUKdx5EAhdIsCR2qQIZ+atFVlnyiq9o9lHzRFpcjP3
         awQJ37BWJF5M2Kj8qkb2k6A/BvbQ69jqKpqy+LHQBmiEroDvXdIpS3E3HyBoPix/EuSb
         HarJy+sis0r2aWe5NnDAUl/j1i1jdAyal3nLtjIRg5JWpW4AEuPhYXskvEmSKHtg7ysz
         UEXK5ZeZzP2RcsyNv7gFC4E9q3yqucKXYRvO0b0pjj7XXCdU98GMeqmY3eNtKG5o0nSK
         PXfTvDct3r/9myhq8+6YYocpZUEL5MzIt1JlxsiuosRA9EvXWKAa0ZtBmbiAWp+QCujo
         cRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wUF3iyUHOBalVTfSVZBIsN4ZyrnfVs22DMxDqn9ZA1g=;
        b=bHMzRu9dQbNXsZyaR38ZwCt/kyUTnuiUgNqGQ3rErlt2/OgH971k9Td3JlJZ72nMGW
         0D8cFgBBuNOb6hquTdqnCulCPmjvVIdklT2DJvcLm2EgQl8IH+s6ev+4YR872jX+ByT2
         D96DjSgLNH8l0qqxhyxTul0JBX67dTb9iLgECs3q4XGp7GuP9fRcF4/n6iIN64QBKOOU
         JeAF2PVeZsrQh7EZU6TyVVgQMz6u875rMXfY2/UTqGSeMiOZEdEdOOyFpaAZpHHVnV/k
         NvC4yUWQW3+wrAyJ73kc4yMdb1KFgxyVCy/GCkkT3q8y8BxfD4XIt6iBI0/bvEAI5KTU
         1EWA==
X-Gm-Message-State: AOAM530xtMpUN4YHJBH5h8g9XdbyB1pc66idYGMqL0R1TAhjijKvtV8S
	MewZq3klOOlLMv1I9AmIIPrvKWreU4Is5zFQiXo=
X-Google-Smtp-Source: 
 ABdhPJwWhnJTTMEzTX3MAAYwJaLJaxyTx1BnJ2Py2fVO257mioD/CwCBy+X+G9ApVqLbrwYPOSYCu1ngT+MHFXds1bw=
X-Received: by 2002:a05:6214:1194:b0:444:45d6:d79d with SMTP id
 t20-20020a056214119400b0044445d6d79dmr4654283qvv.36.1649693079985; Mon, 11
 Apr 2022 09:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220411123520.95107-1-lkml@jv-coder.de>
 <CANPvuRnKqQaanAZMVWym8K+t3sBm_noNNoCH=kV37RWtb8ncqw@mail.gmail.com>
In-Reply-To: 
 <CANPvuRnKqQaanAZMVWym8K+t3sBm_noNNoCH=kV37RWtb8ncqw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Apr 2022 09:04:14 -0700
Message-ID: 
 <CAMKF1sq2zZigpSpX5AzgTY+7Q0JR1q2pWDOgcioTPeQ6F52nkg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] go: Always pass interpreter to linker
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: "J?rg Vehlow" <lkml@jv-coder.de>,
 OE-core <openembedded-core@lists.openembedded.org>,
	Joerg Vehlow <joerg.vehlow@aox.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164230

On Mon, Apr 11, 2022 at 6:30 AM Jose Quaresma <quaresma.jose@gmail.com> wro=
te:
>
>
>
> J?rg Vehlow <lkml@jv-coder.de> escreveu no dia segunda, 11/04/2022 =C3=A0=
(s) 13:35:
>>
>> From: Joerg Vehlow <joerg.vehlow@aox.de>
>>
>> When gos internal linker is used, it uses hardcoded paths to the
>> interpreter (dynamic linker). For x86_64 this hardcoded path is
>> /lib64/ld-linux-x86-64.so.2, but yocto's default dynamic linker path
>> is /lib64/ld-linux-x86-64.so.2.
>
>
> Is this correct? The first path is the seme one of the second.

its a typo, Sadly we do differ in baselib naming convention on x86_64
( without multilib )
compared to other distributions which are inherently multilib and use
/lib64 OE instead uses
/lib when multilib is not enabled but lib64/ when multilib is enabled.

>
> Jose
>
>>
>> Most of the time, the internal linker is not used and binutils linker
>> sets the correct path, but sometimes the internal linker is used and
>> the resulting binary will not work on x86_64.
>>
>> To ensure the path is always correct, pass  it to the linker.
>>
>> Signed-off-by: Joerg Vehlow <joerg.vehlow@aox.de>
>> ---
>>  meta/classes/go.bbclass | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
>> index 9c4c92bffd..df8d4db26d 100644
>> --- a/meta/classes/go.bbclass
>> +++ b/meta/classes/go.bbclass
>> @@ -1,4 +1,5 @@
>>  inherit goarch
>> +inherit linuxloader
>>
>>  GO_PARALLEL_BUILD ?=3D "${@oe.utils.parallel_make_argument(d, '-p %d')}=
"
>>
>> @@ -44,7 +45,7 @@ GO_LINKMODE ?=3D ""
>>  GO_LINKMODE:class-nativesdk =3D "--linkmode=3Dexternal"
>>  GO_LINKMODE:class-native =3D "--linkmode=3Dexternal"
>>  GO_EXTRA_LDFLAGS ?=3D ""
>> -GO_LDFLAGS ?=3D '-ldflags=3D"${GO_RPATH} ${GO_LINKMODE} ${GO_EXTRA_LDFL=
AGS} -extldflags '${GO_EXTLDFLAGS}'"'
>> +GO_LDFLAGS ?=3D '-ldflags=3D"${GO_RPATH} ${GO_LINKMODE} -I ${@get_linux=
loader(d)} ${GO_EXTRA_LDFLAGS} -extldflags '${GO_EXTLDFLAGS}'"'
>>  export GOBUILDFLAGS ?=3D "-v ${GO_LDFLAGS} -trimpath"
>>  export GOPATH_OMIT_IN_ACTIONID ?=3D "1"
>>  export GOPTESTBUILDFLAGS ?=3D "${GOBUILDFLAGS} -c"
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#164219): https://lists.openembedded.org/g/openembedd=
ed-core/message/164219
>> Mute This Topic: https://lists.openembedded.org/mt/90393660/5052612
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

