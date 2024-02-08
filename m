Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0141EC48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 11:53:37 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.16037.1707393209095712651
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 03:53:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iQqjyCZS;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5116063585aso2147095e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 03:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707393207; x=1707998007; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7+IASg6tC9/co3DyJ8tGRNmtYAClyEmaP5dRnf8mq0=;
        b=iQqjyCZS68Of2TjvGW1At3nLykfr8hzJlJz3oJDLriXVcDdnAwdcsanru6gs41nhc8
         8pajAI65vYwDHb++9mLh5Cq0kgx8HDgvmaZWnxxNKrfTLHl7iTZBFCGpcGrI5m6fV0gU
         ZACZXJsYX8yRJmTOm7EsHxX9+MFQvsVwTMOnDGrLUN1iyL9Dh4dv/jTVpoIjrhU61YH0
         2lFfsTbJkqQTMvAxwk4ulh//wYGs4C4Bo8SxjLxZUXfYiGeiaped3G+vVcFv59evh7Zg
         IFIYD2Rt15y+4ECCHkPL1tOM5EEU5F5/jFFHl4IAXN59m77oDzs3juBbhGz0LFSsshLJ
         rc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707393207; x=1707998007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T7+IASg6tC9/co3DyJ8tGRNmtYAClyEmaP5dRnf8mq0=;
        b=Kh3l48qNt1nE8jJ0Se2W8AWuRVm9krNnKksGK/WB54MMZo3y0T/alOM1KCniVW/5iE
         PDM+EqoQuXDc2F1QYQk1VczDbRlXJO6Ow2b5ezuqDBMF4Ci8q/Kymv8LJcrxDyac9I1t
         WF/ipl0PUdlQKgTLiRYku4+j/+SDu9EzL+NfefgpHC8pGcxLdSjC6XL+tjBkRYeXhri0
         LBtpQxXQ7I4oBQt1kutd8Db8nHErCpuW+xmVP1jbLtCHWuJCZG2Re6xZfa2ktIbR6xe1
         Dtw2hdxXC+Gi7qFJ/KDRkORyzWHGbIzPAe7YUorxVGccvhY+haNTG50dkRNrpNxpifgm
         H70w==
X-Forwarded-Encrypted: i=1; AJvYcCUKc5VdZeqGAL1xG5cGaPY7vfFaAGCfZL9yzAMfWmwSzWU3we/s4/Pa1AeHFuYUNhgFyc/C0M4RgdQpWhCBbboVs/PyRDT/BmyZRdJXjsTq5GUsbHuu3eCS
X-Gm-Message-State: AOJu0YyAypSc7ZkKqdYLp8s5Ohz8PdD66+KVjTL4Q6Zp6wJsPOoy+LaX
	aoKX201CYeoZ3gXnIhrjDWwQkutJRfN/6DHkkLB+jsWrRAmhLyEAi0B97dwahjjF6AONLdvWvPz
	f6U1e1tcKbvkRW6v92mgKwkhLFqw=
X-Google-Smtp-Source: AGHT+IHJufSBGJ1Ma2YX/4rvKCWXt0n9Lo3hVnvM1MwbVTxILn6m4At5znzgwosHoZt2xRMQhB1GRonVNYmN2HCzih4=
X-Received: by 2002:ac2:58f9:0:b0:511:4752:fbb8 with SMTP id
 v25-20020ac258f9000000b005114752fbb8mr5294432lfo.37.1707393207115; Thu, 08
 Feb 2024 03:53:27 -0800 (PST)
MIME-Version: 1.0
References: <20240208111737.6480-1-attila.hannibal@heitec.hu>
 <ad2c67bb503873dd90a5fb08df1c1922e6adfc17.camel@linuxfoundation.org> <CANsWD5rkpdej1QXuNBBSmaQ4cXY9p7uhYyqN=jZRB7NS_+1DCw@mail.gmail.com>
In-Reply-To: <CANsWD5rkpdej1QXuNBBSmaQ4cXY9p7uhYyqN=jZRB7NS_+1DCw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 8 Feb 2024 12:53:15 +0100
Message-ID: <CANNYZj9AVBa2NBOL_DKaVgixP5wefPfZM9WCWMi4d4g92rdSew@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gstreamer1.0-omx: remove commercial license flag
To: Attila Hannibal <attila.hannibal@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Attila Hannibal <attila.hannibal@heitec.hu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 11:53:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195142

I guess it's better to be cautious here. There can be multiple
implementations of the codecs, we can't ensure they all have the flag,
and gstreamer1.0-omx needs one of them to function, so there's no
scenario where the commercial flag would not apply.


Alex

On Thu, 8 Feb 2024 at 12:31, Attila Hannibal <attila.hannibal@gmail.com> wr=
ote:
>
> Yes, based on the Readme in the gstreamer-omx repo (https://github.com/GS=
treamer/gst-omx/blob/master/README) it and its contents are LGPL.
>
> In case it uses external codecs, shouldn't the external codecs recipe(s) =
contain the commercial license flag?
>
>
>
> Attila
>
>
> On Thu, Feb 8, 2024 at 12:22=E2=80=AFPM Richard Purdie <richard.purdie@li=
nuxfoundation.org> wrote:
>>
>> On Thu, 2024-02-08 at 12:17 +0100, Attila Hannibal wrote:
>> > The gstreamer OpenMAX IL plugin is completely LGPL licensed,
>> > the "commercial" marking should be removed.
>> >
>> > Signed-off-by: Attila Hannibal <attila.hannibal@heitec.hu>
>> > ---
>> >  meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.9.bb | 1 -
>> >  1 file changed, 1 deletion(-)
>> >
>> > diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.9=
.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.9.bb
>> > index 05d64748bb..fad3714839 100644
>> > --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.9.bb
>> > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.9.bb
>> > @@ -4,7 +4,6 @@ HOMEPAGE =3D "http://gstreamer.freedesktop.org/"
>> >  SECTION =3D "multimedia"
>> >
>> >  LICENSE =3D "LGPL-2.1-or-later"
>> > -LICENSE_FLAGS =3D "commercial"
>> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3=
64516c \
>> >                      file://omx/gstomx.h;beginline=3D1;endline=3D21;md=
5=3D5c8e1fca32704488e76d2ba9ddfa935f"
>> >
>>
>> This is not about the license of the code but whether you can actually
>> use the codecs in there without some kind of license to do so.
>>
>> Even if code is open source, the algorithms it implements can have
>> other restrictions.
>>
>> Cheers,
>>
>> Richard
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195138): https://lists.openembedded.org/g/openembedde=
d-core/message/195138
> Mute This Topic: https://lists.openembedded.org/mt/104236817/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

