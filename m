Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BAEFC433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 17:40:44 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web08.941.1646674842239079232
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 09:40:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=xR+f+Kwi;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.54,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f54.google.com with SMTP id h13so8869391ede.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 09:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FQfDaf+tyIyzp9A7lK9N7/VyxWBZiZtYNTJxfbNZ9sU=;
        b=xR+f+KwidJDU8MDukzABcXA1Fah1DueElmzQNZQRiB+C2nQvG0Q8rzOLsX5l5m3aWC
         38uVGsipHCKAamEqtlsIrKYlrqPIz2gaS9QiBfF7Uw03B4ZTe+Qk/I4whtvhwwxnhwtc
         vbShQkTppzFlmiTrXuR168MCoCtXbDDp2/8ko0W0VTFbPAnfjydUaWbE2nLlAaIDsUwR
         bdl0ckw9y9ffbZPYNpbgDtrDvdeF+HGQpwpHs1NTM0vZeblw4x5U5HaA969UIjtr+I9X
         LIBiNhg/FgmhtWBa42OqzlJgKbMZGwuZboi6T/7pgzbRgYURbtFr0+tt8QhV4XCwE19g
         nrTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FQfDaf+tyIyzp9A7lK9N7/VyxWBZiZtYNTJxfbNZ9sU=;
        b=Vpafoz4kfau6nQu1jjXXAP301uM5kd2Fa1VKXMV85GMLU+mG5Tt+YrNvr0xUN80OxZ
         fv8FJ3DHocYaAibDu3iD5R1ly75aVQIfRl7X3e3pBAnkeCbDH1Frgt1uKAHWkTl0l91F
         /U7LYE4DWDOFqM7UNbZIujcZdW6bNOg+iwui2AoUtGa0ErRXvqqDSxNkNs5zufr6ERFC
         7y/TJNkNzhKZ68302p8XudWXrMoQ+p70UC23N9Q3mY3SSh4LdIM7/gwEUyl49nz418XQ
         pB/wtTrurcYRqZL35wqqMFz2MU1L+ZhzvkM6vuxwkHn9ZCc8wO6820b+akvQUWGb05FF
         PKcA==
X-Gm-Message-State: AOAM5307SvLT5UBT19uQSlmCj9J+hoZbyG+cxPfV5a3uZdBu9fpRHzQk
	kM2XnmW6j2GMINwjIWQRV4RYM4i3JJRpRcjCgkYn4w==
X-Google-Smtp-Source: 
 ABdhPJxTfUlbipmF+G3usCTQRr5TBzeMyE6mEKRjoK2xtST8P38G9tdWbE/R5QkY8AIOiXdNgbc1KOTpAlJtSqK+Zrk=
X-Received: by 2002:a05:6402:51c7:b0:416:401c:cd7c with SMTP id
 r7-20020a05640251c700b00416401ccd7cmr7034999edd.224.1646674840530; Mon, 07
 Mar 2022 09:40:40 -0800 (PST)
MIME-Version: 1.0
References: <20220306210823.53177-1-quaresma.jose@gmail.com>
 <b5b62038-9549-114c-72b3-cc1acb633aa9@kernel.crashing.org>
 <CANPvuRnBFgnG4uqpLBqPORPsNBQyaOU1QewfwSkbtx5Cz8b1sA@mail.gmail.com>
In-Reply-To: 
 <CANPvuRnBFgnG4uqpLBqPORPsNBQyaOU1QewfwSkbtx5Cz8b1sA@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 7 Mar 2022 07:40:29 -1000
Message-ID: 
 <CAOSpxdZMvmCJULCrsn-tS_1iP2s1tSZfNoxdrsL=Fk_RUXUa8g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sstate: inside the threadedpool don't write to
 the shared localdata
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Mark Hatle <mark.hatle@kernel.crashing.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 17:40:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162858

On Mon, Mar 7, 2022 at 7:30 AM Jose Quaresma <quaresma.jose@gmail.com> wrot=
e:
>
>
>
> Mark Hatle <mark.hatle@kernel.crashing.org> escreveu no dia segunda, 7/03=
/2022 =C3=A0(s) 16:14:
>>
>> Note, it appears this bug is in honister as well.
>
>
> is already a little old, dunfell needs this fix as well.

In my test queue now.

Thanks!

Steve

>> On 3/6/22 3:08 PM, Jose Quaresma wrote:
>> > When inside the threadedpool we make a copy of the localdata
>> > to avoid some race condition, so we need to use this new
>> > localdata2 and stop write the shared localdata.
>> >
>> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
>> > ---
>> >   meta/classes/sstate.bbclass | 2 +-
>> >   1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
>> > index dc9a2c085b..7aca415159 100644
>> > --- a/meta/classes/sstate.bbclass
>> > +++ b/meta/classes/sstate.bbclass
>> > @@ -988,7 +988,7 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFalse=
, currentcount=3D0, summary=3DTrue,
>> >
>> >               localdata2 =3D bb.data.createCopy(localdata)
>> >               srcuri =3D "file://" + sstatefile
>> > -            localdata.setVar('SRC_URI', srcuri)
>> > +            localdata2.setVar('SRC_URI', srcuri)
>> >               bb.debug(2, "SState: Attempting to fetch %s" % srcuri)
>> >
>> >               import traceback
>> >
>> >
>> >
>> >
>> >
>>
>>
>>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162856): https://lists.openembedded.org/g/openembedde=
d-core/message/162856
> Mute This Topic: https://lists.openembedded.org/mt/89597961/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

