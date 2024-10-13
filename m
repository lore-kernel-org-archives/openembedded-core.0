Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15435CF258D
	for <webhook@archiver.kernel.org>; Sun, 13 Oct 2024 20:25:09 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web10.39484.1728851103722371306
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Oct 2024 13:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XI/fDtex;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5e989f7cc7aso1650077eaf.0
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Oct 2024 13:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728851103; x=1729455903; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZrmqe4MCk55Vviq0blPOAN5ojYsW4az8QYQjV1U040=;
        b=XI/fDtexs0xXRApasSAkbp9RM4A7c3qDIjZRXKGb0Dg3PA18vVUoVYQDqInORNBYhg
         n0DaL85EpulUwapnrVAmvM2LsRQDORbKKv/Sp6msz4rZQNA4TzWlxA3N1Dkz69XlsgE5
         jo/VDkXK+IDhV9K46XSxc4bqA3ZYqdymEZWnYhWcA/IUQMsmeWLCFtz+VSWcrLNomHvS
         zfjRUITkq+f76Izd+oQzW7jNuMbOj6lKt38OdLHM4zgisf0xX5I6CDIjFnfdTo29TEpB
         g0qCuf9KpfkTdgfpAOPa5OcEWCic33HILrv+l1eoz7rEz6rFEjRHZmbe7rTPqIB+Jf2H
         S1hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728851103; x=1729455903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xZrmqe4MCk55Vviq0blPOAN5ojYsW4az8QYQjV1U040=;
        b=JFbC62DWSkN79c4v38GgYB76iBRCRrqYpcHzNywfCBXAxBoCjeGw6uhmPxTmiloJZO
         f/ubld5DECA+bUXwu2n9QKQiQxq68RCI2rPtjr9bI3Ro2TOBUumKewMiRpUwSM5y2Sl8
         KJc1eOaRDBTwnIc2k8YchP2kDKWUeTpLwMfnMmDk9XKwVKhV1mOpZlpiAzwJC1klIoHk
         V/JiUNNGu83tIa4NQUSY0KaupzidylX6sf+hDJhFsVkJJG64qADS1tTGhGLCjWrWvEyV
         DZ/o9e63hmTWhRpVM1Y7v8aRmNFvXAvJN1iF9GiN1G2LRe2uuCRBJpwwrykZnPcOT2NY
         AH/A==
X-Gm-Message-State: AOJu0YygySDJp3HRS/ySOeHitIvZu6qWUBij8Gmg8a5Ag1i41YEANCSa
	W6E1gajLMjpI8K4a2DBBkxhz6w3IqWx/76oaC0b0l9mWzw48NIxk3SbsREnZQ5+H17VZ77TrH4x
	XHSPlgi3XDUlUa/mrA3eX9crNVOk=
X-Google-Smtp-Source: AGHT+IF9LHVtnE62YFj/95m1eYnUBlMlgOoTJE4hGPt/jp0mUTngmKU4hoCYMTJoS/Y+Xs+sMfuiXpy2Qv3t8LzkUR0=
X-Received: by 2002:a05:6820:1ac5:b0:5e5:b728:9962 with SMTP id
 006d021491bc7-5eb1a2f1939mr4528282eaf.8.1728851102910; Sun, 13 Oct 2024
 13:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20241013191703.317096-1-raj.khem@gmail.com> <CANNYZj8xzYfaZwcbi5+gtxCPdoyKjVQK2pjAcTKRfhL3e9dpWQ@mail.gmail.com>
In-Reply-To: <CANNYZj8xzYfaZwcbi5+gtxCPdoyKjVQK2pjAcTKRfhL3e9dpWQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 13 Oct 2024 13:24:36 -0700
Message-ID: <CAMKF1spKT_4ZkkUV-L3DJ+pz5QtqjaSL_k9bpoA=YWee+6xD2A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ffmpeg: Disable asm optimizations on x86
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Oct 2024 20:25:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205726

On Sun, Oct 13, 2024 at 12:37=E2=80=AFPM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Wouldn=E2=80=99t this be a build time error? Why is it not seen on the ab=
?

It is a build time error with lld linker for sure I am not sure why we
don't see it with GNU ld.

| i686-yoe-linux-ld.lld: error: relocation R_386_32 cannot be used
against local symbol; recompile with -fPIC
| >>> defined in libavutil/x86/tx_float.o
| >>> referenced by tx_float.asm:228 (src/libavutil/x86/tx_float.asm:228)
| >>>               libavutil/x86/tx_float.o:(.text+0x668)

The files in question are compiled using nasm assembler for x86 and
x86_64 here is full log
https://gist.github.com/kraj/12d633834d032d19005cdbac281390b7

>
> Alex
>
> On Sun 13. Oct 2024 at 21.17, Khem Raj via lists.openembedded.org <raj.kh=
em=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> disable asm code if PIC is required, as the provided asm
>> decidedly is not PIC for x86.
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Cc: Ross Burton <ross.burton@arm.com>
>> ---
>>  meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb b/meta/recip=
es-multimedia/ffmpeg/ffmpeg_7.0.2.bb
>> index af66104ebf3..3c66851b8d2 100644
>> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
>> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
>> @@ -129,6 +129,8 @@ EXTRA_OECONF =3D " \
>>  "
>>
>>  EXTRA_OECONF:append:linux-gnux32 =3D " --disable-asm"
>> +# --enable-pic is used and x86 assembly is not PIC on x86
>> +EXTRA_OECONF:append:x86 =3D " --disable-asm"
>>
>>  EXTRA_OECONF +=3D "${@bb.utils.contains('TUNE_FEATURES', 'mipsisa64r6',=
 '--disable-mips64r2 --disable-mips32r2', '', d)}"
>>  EXTRA_OECONF +=3D "${@bb.utils.contains('TUNE_FEATURES', 'mipsisa64r2',=
 '--disable-mips64r6 --disable-mips32r6', '', d)}"
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#205724): https://lists.openembedded.org/g/openembedd=
ed-core/message/205724
>> Mute This Topic: https://lists.openembedded.org/mt/108988536/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [a=
lex.kanavin@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

