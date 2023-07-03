Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A05FEB64DC
	for <webhook@archiver.kernel.org>; Mon,  3 Jul 2023 06:37:00 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.21689.1688366211270686861
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jul 2023 23:36:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=T7eHSik5;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1b055510c9dso2646203fac.0
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Jul 2023 23:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688366209; x=1690958209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x1yfDEc/EK8Zifx8TsGZRDpIL7QXDsa1/F/rSRZQYO0=;
        b=T7eHSik5DfKezAerFZOLEhgnaaQ4+DCifVyS6gzip/LbZ4m2xZlhxydDe221Y2sGGk
         NPxwVFMGOG5qG6PzE+ovd27cy3EFegSRZA7xqEBvzI6r2pFm4tJa03F4el+O1H7PXyrw
         9Slx3EyMg9Mtw0wOSkpX1V3n3HXvpO3suGtxrD8T+bNo4HgAoe9vKY5iLh/ReM+msw6/
         wx9E50g4kx7NGeWR3TVQTwhP4LLMT0xpzFPEeH5BdVpPVmCVegDjk1DINUI8EbYEi69O
         HeP0RMZngqYY6XsafgoaT/nFkE9tUhFTFPuDTs2HfC1XuZpEllBq1xrQ/zEwTKBbE5/q
         sMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688366209; x=1690958209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x1yfDEc/EK8Zifx8TsGZRDpIL7QXDsa1/F/rSRZQYO0=;
        b=Z/vSf1uEQf+b9cQ5OgAkOyFP8AF101BUsALas/Mj+GP8W5+ykieUuI8cdTFqRgDHh1
         tjKjzjfSz0lBuYX8vrEM1Jrd0uNnQu8/3Gg9/BKBWsvfE0GKuDiCYcgwYP1dfPJsBGUx
         7y1wukR6D6lzjFEponK3rgha2I8sosdIjZveIsIhILIBllGupu6HR8ArvKB9YVZ1YHDi
         +MlZApv2w3odqX7+ftZf84K9zKK/4ac5actUfI54ElyyReQRyHAIXKxC9DDDt5QrGzMS
         eFLTpjr4dqSJfDKgigPorfQ2OME4A05Sd0V3nYMWesrpLpkiM2+LUWRQ9fryrY7sWR4s
         ftYA==
X-Gm-Message-State: ABy/qLaucbT97LaQPjb1nQfD7Grr4/cnNJqT36jGJ/HOre+LXJ0OCRya
	k1bSFlofq1i5csccLUDfqMJ+B4sG2uj2ztZAHCY=
X-Google-Smtp-Source: ACHHUZ7hTzrMUZ9FvSLhPiVtSSY6fdeC/PRsOx3YkNFzfqcY6HsAcyAE6CaI3N7FmBFDCwbjtCMU/5/rlhMWiXr411E=
X-Received: by 2002:a05:6871:8f85:b0:1b0:805:8670 with SMTP id
 aa5-20020a0568718f8500b001b008058670mr6102275oac.19.1688366209111; Sun, 02
 Jul 2023 23:36:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230703025959.3968541-1-raj.khem@gmail.com> <20230703025959.3968541-2-raj.khem@gmail.com>
 <CANNYZj967uL0xN2e1VhkkVEuVvF8_-XM=mUmWAnKDHyHyZGx5Q@mail.gmail.com>
In-Reply-To: <CANNYZj967uL0xN2e1VhkkVEuVvF8_-XM=mUmWAnKDHyHyZGx5Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 2 Jul 2023 23:36:23 -0700
Message-ID: <CAMKF1sqdq3U0OXhuajFR=vmmowH2CeB0L0ZisEZALz6ezTmPhA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] mesa: Point to native llvm-config
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jul 2023 06:37:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183793

On Sun, Jul 2, 2023 at 10:49=E2=80=AFPM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> But should this be fixed in meson class rather?

I am not sure, llvm-native is not so common yet as a dependency. When
it becomes we can revisit.

>
> Alex
>
> On Mon 3. Jul 2023 at 5.00, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Default search in meson would grok /usr/bin for llvm-config and if found
>> will use it, which might add wrong paths into cflags/ldflags, since we
>> depend on llvm-native when building gallium support ( thats when
>> llvm-config is effective), its better to point llvm-config into native
>> sysroot so it can add correct paths into compiler/linker cmdline
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-graphics/mesa/mesa.inc | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics=
/mesa/mesa.inc
>> index 928899008e6..63d7494dfc4 100644
>> --- a/meta/recipes-graphics/mesa/mesa.inc
>> +++ b/meta/recipes-graphics/mesa/mesa.inc
>> @@ -75,6 +75,11 @@ EXTRA_OEMESON =3D " \
>>  def strip_comma(s):
>>      return s.strip(',')
>>
>> +# llvm-config should be the one from llvm-native and not from build hos=
t ( if llvm is installed on host )
>> +do_write_config:append() {
>> +    sed -i -e '/\[binaries\]/a\' -e "llvm-config =3D '${STAGING_BINDIR_=
NATIVE}/llvm-config'" ${WORKDIR}/meson.native
>> +}
>> +
>>  PACKAGECONFIG =3D " \
>>         gallium \
>>         ${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland', d)} =
\
>> --
>> 2.41.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#183787): https://lists.openembedded.org/g/openembedd=
ed-core/message/183787
>> Mute This Topic: https://lists.openembedded.org/mt/99920489/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [a=
lex.kanavin@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

