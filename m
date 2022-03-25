Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FAC9C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 18:08:37 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.107.1648231711156801454
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 11:08:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=w9zPp3/0;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.49,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f49.google.com with SMTP id yy13so16937275ejb.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 11:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xefeH7PRy0EavhU7gX38vWRd5SrUtNIsflRmhuddcB0=;
        b=w9zPp3/0T5ZWcpY405zrWuLBDQSaKlfY2s8F5pKBwy/okptGmBMZOAFLLonThPRZ3v
         lkNlRJyUljIGKU21SDiQKsR00Ef9Ra/Of/I5L+Id0RQCIXhH5wg7guLq1ZqJ2ANbkPYR
         DKRsw9gudIUHFawg3Dwb44li2prC0zMvjR7uVUdbW9qqKm/AQnSNX61F6T/ClZhvZJYn
         dMn4WvYmu+cXGRq8eHke4q+cYcK581RB4J9uVS4kkruzfKoPzVTlzsJbXRZsqkpeOj/d
         Dfxhd7WsaSmHfGiZjU0T2VMTtex8PUPTv85WtwlpSMexcvqNhS8g7PRs1fzYDMdEKAyu
         YJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xefeH7PRy0EavhU7gX38vWRd5SrUtNIsflRmhuddcB0=;
        b=d8DRJgOG4j7CUf9TIq9XI6BKiv/4rvVbO75yFaChG1Ok67wytfcVgqwaLOq54rRuR3
         Mrk0J1HDpOjHlQZZKa+W7u4bt+USIHatOe12RjIotVF8Q4SA9NcNDJXmuLW5MJH4kIpW
         IJfslGeGsK+MSs/MpL+qoTIb/F8nBu5+/vz+784cJLimz9b9NjhatYnHwn5JrkeDlTml
         OAiAfvbGOM3SEkUOHbXp908f+4R+DRyoXp5bGL87vXtcKFlIvboMzOAFWrKFXL+a7d2V
         XPP6HdcvyM0EXLsFbIV7NSQsUrpzVyCyLiY+3yuRKa1M+enJd/YJJs72m3vs+kgX1+g9
         554g==
X-Gm-Message-State: AOAM5318Li2jX0rkHD2sbHTivXmjYdqeGotQLCzcApkrsrKsyPt/a0DG
	maeJYP/6JZta6mD3NvbmMv0ErUwTJqpFKylPAzsPMA==
X-Google-Smtp-Source: 
 ABdhPJxP+Kw02HkSKdavOemEn3qrYwi7l6BimJVnw/QQFiaH3G+nLGOUBFi1Gbdav3hYmklbejsHj/166SJ82mf6U8o=
X-Received: by 2002:a17:907:60d1:b0:6e0:22a8:e2e5 with SMTP id
 hv17-20020a17090760d100b006e022a8e2e5mr12720043ejc.612.1648231708497; Fri, 25
 Mar 2022 11:08:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220323142411.1277228-1-richard.purdie@linuxfoundation.org>
 <CANPvuRmu=VTrkQmJvBU43jYJ-1N-XwP_sLTr-4UxL=q4W9YLQQ@mail.gmail.com>
In-Reply-To: 
 <CANPvuRmu=VTrkQmJvBU43jYJ-1N-XwP_sLTr-4UxL=q4W9YLQQ@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 25 Mar 2022 08:08:17 -1000
Message-ID: 
 <CAOSpxdb+rZqeZF=cBCAK3ivvw34_EqJwRWMgnaZcpKA-w+-uPw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sanity: Add warning for local hasheqiv server
 with remote sstate mirrors
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Mar 2022 18:08:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163648

On Fri, Mar 25, 2022 at 7:53 AM Jose Quaresma <quaresma.jose@gmail.com> wro=
te:
>
> Hi Steve,
>
> I see this patch on dunfell-nut but afaik dunfell don't support upstream =
hash equivalence server
> https://git.yoctoproject.org/poky-contrib/commit/?h=3Dstable/dunfell-nut&=
id=3D1d33ad9c8ea2388f51ff00ba3a3442f15f29e663

Yes, a moment of temporary insanity :-)

If you look again you'll see it's gone.  The stable/dunfell-nut branch
is not to be trusted, it gets changed and rebased multiple times per
day.

Once I send patches to the list for review, stable/dunfell-next can be
trusted a bit more, but even that occasionally gets rebased if there
is some last minute feedback before I send the pull request.

Steve

> Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia quart=
a, 23/03/2022 =C3=A0(s) 14:24:
>>
>> We're seeing a lot of users configuring an sstate mirror but not realisi=
ng that
>> the default hash equivalenve setting will make this ineffective. Add a w=
arning
>> to highlight this to the user for the common case.
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>  meta/classes/sanity.bbclass | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
>> index 92807dc88e9..be956fbcd6c 100644
>> --- a/meta/classes/sanity.bbclass
>> +++ b/meta/classes/sanity.bbclass
>> @@ -914,6 +914,11 @@ def check_sanity_everybuild(status, d):
>>                      mirror_base =3D urllib.parse.urlparse(mirror[:-1*le=
n('/PATH')]).path
>>                      check_symlink(mirror_base, d)
>>
>> +    # Check sstate mirrors aren't being used with a local hash server a=
nd no remote
>> +    hashserv =3D d.getVar("BB_HASHSERVE")
>> +    if d.getVar("SSTATE_MIRRORS") and hashserv and hashserv.startswith(=
"unix://") and not d.getVar("BB_HASHSERVE_UPSTREAM"):
>> +        bb.warn("You are using a local hash equivalence server but have=
 configured an sstate mirror. This will likely mean no sstate will match fr=
om the mirror. You may wish to disable the hash equivalence use (BB_HASHSER=
VE), or use a hash equivalence server alongside the sstate mirror.")
>> +
>>      # Check that TMPDIR hasn't changed location since the last time we =
were run
>>      tmpdir =3D d.getVar('TMPDIR')
>>      checkfile =3D os.path.join(tmpdir, "saved_tmpdir")
>> --
>> 2.32.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#163584): https://lists.openembedded.org/g/openembedd=
ed-core/message/163584
>> Mute This Topic: https://lists.openembedded.org/mt/89976515/5052612
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

