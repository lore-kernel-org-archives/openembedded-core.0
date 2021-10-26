Return-Path: <sakoman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33C15C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 14:05:30 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web10.12736.1635257120815591049
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 07:05:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qmuS6cFT;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id a6so24247962ybq.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 07:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LGeIe0VvqhbVP3c38PA0NtN5Hfun4hSl7g9XAWuBGBc=;
        b=qmuS6cFT/+iZ1LcyhlF7d8CAkKNrpZG5jHxO5FyVwRgNmVAERM21YoZDKc0P4Zt5CZ
         C1PgPj6M9f8GhhjBaIai62levN3ovrxHXAZFChaUkWTNSEJIQKgoSMF/BuKc632Bo+oi
         KQb1DNseUb2pzDoTxmNoLhj2a8EqSQmaqZyFNaA9Hd7XHlrxkanmS9nSC3Ss0Y8j6iFo
         Qh8+2IgXZiEf1V9/S4H8hmfubsNV1IeiWcIz/Snbxgie+dqBSn1gfhsnUZiSnJX1sSLe
         TQCs++NLQXZbA+BudCB9Vr/fznRs/dFX5n+x8CaSqJhmFLTUu64qgjR6rSUPsJluZxxB
         29mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LGeIe0VvqhbVP3c38PA0NtN5Hfun4hSl7g9XAWuBGBc=;
        b=qi7BrsmHjHbRURig+IcFhKvA7bzCOE+mAAVrJ8BN9sBbXuHmICeKQ4bffuQkklgi9D
         kVeJq+b/9FxMbwbgo+E4Z8rAsH3oCZud8mTIyeQKaBL0ai90AD0OW8t9zWmF9McFKMDe
         qx9TYbcqfyrzOymVL3odwV6F/PKOszJx1hKswBsCRZGjMwRTEtCdAE1/1tYrNUq1iqAj
         uI9EVHD0W/WXLUNUKw9+s+EGHwTLGv1wUy3Vb12FfGWIBJk2BxmHZqLWlQuOHBUKTwWc
         7tAwpbgL+cS3IW7//smRpdrO9QBrwW7xuto4he9+t+Na1tgT8P4JvIc8PnhrzgpcVz+w
         CrDg==
X-Gm-Message-State: AOAM533vidC6ihVFrf3lVMMGzwizQGrYFYSKJqodPtJ9uLHpZiJSvM1i
	fN5i0lNNzyPJKLtU20SmKJRSRuv/vNU29Tovd7E=
X-Google-Smtp-Source: 
 ABdhPJxCBXJvk5rcPlRFiaNJukLRT+NdKGQUBkluPtbEPJztvvrs0p7lpi6VHcDtCj5kMdbzt4qhXj+5y/6QJDDQKiU=
X-Received: by 2002:a25:1487:: with SMTP id
 129mr26894859ybu.206.1635257120056;
 Tue, 26 Oct 2021 07:05:20 -0700 (PDT)
MIME-Version: 1.0
References: <20211020172544.394910-1-quaresma.jose@gmail.com>
 <0f410a21bce841669662ebb9b742f08a@axis.com>
 <CANPvuR=3KGiP6mcdVaBkod6xYz9tbwKXx-Z-SBo7qVa82w+EWQ@mail.gmail.com>
In-Reply-To: 
 <CANPvuR=3KGiP6mcdVaBkod6xYz9tbwKXx-Z-SBo7qVa82w+EWQ@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
Date: Tue, 26 Oct 2021 04:05:09 -1000
Message-ID: 
 <CAGDS+n=fcNC1v502kB17yKaXXB5bXNgj+9AzpN8TEjhXkQ_FuA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] sstate: fix touching files inside pseudo
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, "Mittal,
 Anuj" <anuj.mittal@intel.com>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 14:05:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157395

On Mon, Oct 25, 2021 at 11:06 PM Jose Quaresma <quaresma.jose@gmail.com> wr=
ote:
>
> I have found this bug on the dunfell branch, can it be backported to dunf=
ell too?

I'll add it to my testing queue.

Steve

>
> Jose
>
> Peter Kjellerstedt <peter.kjellerstedt@axis.com> escreveu no dia segunda,=
 25/10/2021 =C3=A0(s) 15:28:
>>
>> > -----Original Message-----
>> > From: openembedded-core@lists.openembedded.org <openembedded-
>> > core@lists.openembedded.org> On Behalf Of Jose Quaresma
>> > Sent: den 20 oktober 2021 19:26
>> > To: openembedded-core@lists.openembedded.org
>> > Cc: Jose Quaresma <quaresma.jose@gmail.com>
>> > Subject: [OE-core] [PATCH v2] sstate: fix touching files inside pseudo
>> >
>> > running the 'id' command inside the sstate_create_package
>> > function shows that this funcion run inside the pseudo:
>> >
>> >  uid=3D0(root) gid=3D0(root) groups=3D0(root)
>> >
>> > The check for touch files [ ! -w ${SSTATE_PKG} ]
>> > will always return true and the touch can fail
>> > when the real user don't have permission or
>> > in readonly filesystem.
>> >
>> > As the documentation refers, the file test operator "-w"
>> > check if the file has write permission (for the user running the test)=
.
>> >
>> > We can avoid this test running the touch and mask any return errors
>> > that we have.
>> >
>> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
>> > ---
>> >
>> > v2: redirect stderr to /dev/null to avoid messages in the log
>> >
>> >  meta/classes/sstate.bbclass | 4 ++--
>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
>> > index 3c179259e7..146f56ea2d 100644
>> > --- a/meta/classes/sstate.bbclass
>> > +++ b/meta/classes/sstate.bbclass
>> > @@ -830,7 +830,7 @@ sstate_task_postfunc[dirs] =3D "${WORKDIR}"
>> >  sstate_create_package () {
>> >       # Exit early if it already exists
>> >       if [ -e ${SSTATE_PKG} ]; then
>> > -             [ ! -w ${SSTATE_PKG} ] || touch ${SSTATE_PKG}
>> > +             touch ${SSTATE_PKG} 2>/dev/null || true
>> >               return
>> >       fi
>> >
>> > @@ -865,7 +865,7 @@ sstate_create_package () {
>> >       else
>> >               rm $TFILE
>> >       fi
>> > -     [ ! -w ${SSTATE_PKG} ] || touch ${SSTATE_PKG}
>> > +     touch ${SSTATE_PKG} 2>/dev/null || true
>> >  }
>> >
>> >  python sstate_sign_package () {
>> > --
>> > 2.33.1
>>
>> Can this please be backported to Hardknott and Honister now that
>> it has been accepted for master?
>>
>> //Peter
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
> View/Reply Online (#157377): https://lists.openembedded.org/g/openembedde=
d-core/message/157377
> Mute This Topic: https://lists.openembedded.org/mt/86470820/3617601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sa=
koman@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

