Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C27EDC19F2D
	for <webhook@archiver.kernel.org>; Sat, 13 Aug 2022 14:28:14 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web09.5397.1660400891457655894
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Aug 2022 07:28:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kXeVFM+J;
 spf=pass (domain: gmail.com, ip: 209.85.208.178,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id l10so3455524lje.7
        for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Aug 2022 07:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=XHOiJQdE34qVdviwAJQDa+jCJtiahFvvD97iL4j8REY=;
        b=kXeVFM+JgbJIUV8qag0EIDvB9pc6UhsC/6Ff+0IlJs3eBtbjdUOAs9+70G8CqhS6TC
         IIPJoTYVLW/Emo7MafnFYzokDxB3ntWTzpZFhjZ9htiItikOL7If3kka4uLXjiNkzBKZ
         hUGGKksbn+sDqF94MAnv7XCk2E1MczCVy8jJcmLWN1BqjufzI7ZlsLuQqiNjnaP+iR6h
         QJiPGkW9ovyoIkD2n71lHSjf87dZ2sm1zOAdtPYGQLWFk1Psevg7znlhLbyuqnfxNaAq
         BTkFe0Z4+EhN36LaWwtc+GpwFPIi30DZOwkQ5nfHjsVyT8d/L9Xez0+iqpD84/xjVk/6
         ijPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=XHOiJQdE34qVdviwAJQDa+jCJtiahFvvD97iL4j8REY=;
        b=2i7LnsyUEJmoHPWGnen7ZgRYvQ1yyW14U8VU1TRvDq9Jq2Flaxb4pXXIbtcXstoanC
         bnIlcihynsLp6+kk96anl4s1P7kKz9C8oJXpQc9qjFVuwlnRdxQXt2sJrblAuylIx95/
         Aljv6xj7olfgJAvSIzXLXYOPNtDyRrQGHUALUoAm8yZRb3eyWGrxGQyVCChJL3d8WL+u
         Z1RXlNxjDN395C0NqsvMEfKSw6vEKYLAe1E+57+5zon74ftkYfLS96Ypqo6WkXa/gdbZ
         mMD/hN3ubB6vJjOUarS6MkjWIiaZ4dErxCqXHKRiW1m07RkAxp1aAVysmmqNCpMD77cK
         yXeQ==
X-Gm-Message-State: ACgBeo0mnzPtvem5hfhPb5h8nszJLz/6YnuF0O3DWPVf2l9Uz2QjTPln
	rVd0WTkm2KfyAkMYYPbOvQ/Jh8uqImfMjG4potk=
X-Google-Smtp-Source: 
 AA6agR7BO51lc72I7Qq16VkKKLDo66AcKW1sy+xPwDE8ZesbJD5DjSb6m50kPt7eEbLRHNmm1FLbLGNJPMffyEItHeI=
X-Received: by 2002:a2e:9dc5:0:b0:25e:6fa0:1243 with SMTP id
 x5-20020a2e9dc5000000b0025e6fa01243mr2712132ljj.513.1660400889293; Sat, 13
 Aug 2022 07:28:09 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CABF_=yi9-vQ4b-4qnOz+W5bbJmjRmk72YOog+GvDVBVyQ160+Q@mail.gmail.com>
 <CANNYZj-c97JgQnN-W3Ae3YzpWRGOO9hwO_xF0WDuoMsCaOwyKg@mail.gmail.com>
 <CABF_=yhQmn4Odw1wabzdS+_+D3tqpE0S6r6aCsuP9PbsudF9ow@mail.gmail.com>
In-Reply-To: 
 <CABF_=yhQmn4Odw1wabzdS+_+D3tqpE0S6r6aCsuP9PbsudF9ow@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 13 Aug 2022 16:27:57 +0200
Message-ID: 
 <CANNYZj8M+RfFmhPdM7caohuOtThORatkDZKuxL68xodDd_=v8w@mail.gmail.com>
Subject: Re: [OE-core] makeself
To: jan vermaete <jan.vermaete@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Aug 2022 14:28:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169308

meta-openembedded/meta-oe/recipes-devtools is fine I think.

Alex

On Sat, 13 Aug 2022 at 16:09, jan vermaete <jan.vermaete@gmail.com> wrote:
>
> fine for me, I'll do.
>
> But where to place it?
>  * meta-openembedded/meta-oe/recipes-support
>  * meta-openembedded/meta-oe/recipes-devtools
>  * meta-openembedded/recipes-devtools
>  * poky/meta/recipes-devtools/
>
> Jan,
>
>
> On Sat, Aug 13, 2022 at 1:36 PM Alexander Kanavin <alex.kanavin@gmail.com=
> wrote:
>>
>> No need to ask. Make a patch, write a good commit message and send it :)
>>
>> Alex
>>
>> On Sat, 13 Aug 2022 at 12:11, Jan Vermaete <jan.vermaete@gmail.com> wrot=
e:
>> >
>> > Could it be useful to transfer the makeself recipe from the no longer =
maintained intel-iot-refkit into meta-openembedded?
>> >
>> > https://github.com/intel/intel-iot-refkit/blob/master/meta-refkit-core=
/recipes-core/makeself/makeself_2.2.0.bb
>> >
>> > https://github.com/megastep/makeself
>> >
>> > It's useful as a native recipe to create self extracting installers fo=
r firmware updates, as an example.
>> >
>> > br,
>> >
>> > --
>> > Jan Vermaete
>> > =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Ham=
el
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#169301): https://lists.openembedded.org/g/openembe=
dded-core/message/169301
>> > Mute This Topic: https://lists.openembedded.org/mt/92997365/1686489
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[alex.kanavin@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >
>
>
>
> --
> Jan Vermaete
> =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

