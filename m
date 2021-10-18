Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C33DC433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 16:50:36 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web08.39835.1634575835713137396
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 09:50:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nwUVokB8;
 spf=pass (domain: gmail.com, ip: 209.85.215.179,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id m21so16785531pgu.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 09:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lw3aCl9ZsQBP3DFI6d7tZcy8WWlbQ1xtxfbuE53XECc=;
        b=nwUVokB8qNo0u3RjmxvfOC39QRfVZUW1otXBy3qJU20iszplxlTOPHTicA3tl6mpc7
         OSO2x7LHHaZXY/bvmPsQQ6b6udQMoD1iGdkMff064NX6rjS3ENZwrKcKzvLENh2++4wl
         vS8iOHuWerbW9DlKqTVfteL5sZc0JLCJEyAs5AEfTQKQLs+TAR4yPsuPzayvbCIFNqPO
         cLZmrz1ZXld60+IkY+ticgs9FsvE/aqJwafSkIVWHFy7Dn+6wO83fP5nLHA4jc4L2Nr1
         28kFmYxAP0LUliXbemRQi315xFttY+UO32HWUHZI6CooZzk69TuN3dicTv6xsbTFseYo
         jR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lw3aCl9ZsQBP3DFI6d7tZcy8WWlbQ1xtxfbuE53XECc=;
        b=Z/DtKeHha5xoFKvG23TZVJkONP+s16p/U9YoG7+QKpb/a3W2OknKkr+4F9CNaCCqOW
         wm5KAFdACk/48wA21lYYRmtNbj+gPvK091tttWOBe7DAToV8E0DyP69wfslXQl22Dsiz
         k0AvpBvPVaQWaTAJT18HXoMzTqiVmAhbBJZrAfv2+eP+ghBjEev6Z8xILKwOTGKrosxt
         wCv2kiXKznPJj3Yan5lTwFvOiW1TVaBVK77QyxjhpP4Ckml7Ov4XW/kuBlsRlXPVR41q
         6WlVeyNeM+I2Y+GEb5D0RwJEv9uk/f9usBtE20qZhG7nqsX91xovYf+4P2E6mWfcXj2h
         u6Qg==
X-Gm-Message-State: AOAM5339Y4FEnN4Txf3GYafqyXph5g4D2GBO5h4nDgCIxUatAZb5wecd
	4MwO5nCqimFNQ2Q55oza2fGcfP7snVvtN80MLko=
X-Google-Smtp-Source: 
 ABdhPJzvBmdVpDyJnldAmvc/wAgkC3eGhEuJNvd3+b/FeYTYDVU7agoH4nLb+QiHTwGq02GBFeJbtZrTcB+7FWLnKBk=
X-Received: by 2002:a05:6a00:2343:b0:44d:2e13:3edf with SMTP id
 j3-20020a056a00234300b0044d2e133edfmr29615788pfj.72.1634575835144; Mon, 18
 Oct 2021 09:50:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
 <16A68880435BB472.28512@lists.openembedded.org>
 <e22062ab2915a57b1bff1217c911a97c3c647e30.camel@linuxfoundation.org>
 <0700251c-57a1-cc4c-dd94-a253032a02d1@gmail.com>
 <CAMKF1spNqjAHRh=0F2ohMCCoSdwDOTWAFRMz2RCVU9+rBiiO_g@mail.gmail.com>
 <CA+chaQfO61hdhNtHO-hTu_4QZbnwmHUTMAJ6XaHrDCdhww2EVg@mail.gmail.com>
 <CALbNGRR+VLOvuTFaZFFcp1eSR_gKw6z1EMeH1c28QjqV_YUP3w@mail.gmail.com>
 <CA+chaQctdc_sUpmvs-vN0RatkOx=JoMnVZCqY+WjxGfXOYX0fQ@mail.gmail.com>
In-Reply-To: 
 <CA+chaQctdc_sUpmvs-vN0RatkOx=JoMnVZCqY+WjxGfXOYX0fQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 18 Oct 2021 18:50:21 +0200
Message-ID: 
 <CALbNGRRX4x_gJmSbqOGoYgLg171XR_gPDOLhsNOVF4nskO_E=w@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 14/14] layer.conf: Extend recipes not to
 install without explict dependencies
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Joshua Watt <JPEWhacker@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 16:50:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157086

On Mon, Oct 18, 2021 at 4:12 PM Martin Jansa <martin.jansa@gmail.com> wrote=
:
>
> On Mon, Oct 18, 2021 at 1:50 AM Andreas M=C3=BCller <schnitzeltony@gmail.=
com> wrote:
>>
>> On Fri, Oct 1, 2021 at 4:17 PM Martin Jansa <Martin.Jansa@gmail.com> wro=
te:
>> >
>> > FWIW: I've fixed some bigger layers where pkgconfig was causing quite =
a few build failures,
>> >
>> Had an off-oe time due to  heavy work load.
>> Think this one is the reason for the pkgconfig patch flood. You are
>> aware that there are packages not failing at build time for missing
>> pkgconfig but build output is different and bugs will pop up at
>> runtime.
>>
>> To avoid responsible maintainers have to go through EVERY recipe (and
>> combination of PACKAGECONFIGs) and check if builds are still as
>> expected - Can't believe it!
>
>
> Not sure why this seems targeted to me.
>
> Yes I've tried to fix whatever issues this change caused in my world buil=
ds and I'm partially responsible for pkgconfig patch flood, because I wante=
d layers like meta-ros/*, meta-qt5, meta-qt6, meta-webosose/* to stay compa=
tible with oe-core whenever this change from RP is merged to master.
I am not against the flood of pkconfig patches I am against this patch.
>
> I've also tried to compare buildhistory and image content (for ros-image-=
world with ros1-melodic) to see if I can spot more cases of non-fatal build=
 output changes as in collada-dom and unfortunately there is a lot of noise=
 in buildhistory (due to many recipes included in this image not really bui=
ld-reproducible), so I've used mostly installed-package-sizes.txt file to s=
pot 2 more recipes where the size was different (but both don't seem to be =
caused by pkgconfig-native in the end).
>
> I did both builds from scratch without sstate, so I would assume that it =
will catch all possible cases, but surprisingly just yesterday I've caught =
another missing pkgconfig-native in one of meta-ros1-melodic recipes (caugh=
t in kirkstone based build - while before I was testing on top of a bit old=
er honister with this change cherry-picked just for test - to prepare recip=
es to be future-proof for kirkstone).
>
This was huge effort - and it sounds there is still no 100% confidence
to get same you had before - right? Others have to do same.

And for what? A build acceleration of how much - this patch does not
mention numbers. Or is it: Only the perfect recipes are allowed to
survive.

To me oe-core has decided (again) to make changes without taking care:
Break dozens of layers and force maintainers to spend days to get what
they had before this change. From image perspective nothing has
changed. And the very best: Some layers were just made for fun and
since this is definitely no fun they are going to die.

After this I have to work on my motivation spending time on this
project - not an easy task.

My opinion

Andreas
> Regards,

