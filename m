Return-Path: <gael.portay+rtone@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D49CED17122
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 18:02:55 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.2087.1729533773505811515
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Oct 2024 11:02:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UjQ1C9yz;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: gael.portay@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43158124a54so6387865e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 11:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729533772; x=1730138572; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:references:in-reply-to:sender
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vJ8ecmzrHRZSKEv8OR/ILvgcp9OD38O+d49G60LgRTo=;
        b=UjQ1C9yzqg9TrbAlbkLgrRxSWIuVs6e5dnm5bLsbZgpFMgC44hrvt9OecOzGzXvErI
         Bp5jb0PMgwvXgcZntbuIWedQ6EuZ2SCsZ0+x92j3g0bQsD0B7SJ45e4CRvJhgZNvvpNB
         N+DT8qYFWhSoIWAqzJzZEL1PbWp5yVxZ5QVPq9lLLQsKFyIFTGhU2Lekzu22BdW7iciq
         SaGrNO/WsJgSbczdnI1CvvRhNfjeNynwvel4f5jSy4DmcVxu2c81zVVasIihBuJuDM+1
         diUK8zHfEpWgYSCUn2msDICMRnW5qnwS7Hkjso+Eq6FiA29R4UxPZXRMSyxJDS1ylkPO
         +RPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729533772; x=1730138572;
        h=cc:to:subject:message-id:date:from:references:in-reply-to:sender
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vJ8ecmzrHRZSKEv8OR/ILvgcp9OD38O+d49G60LgRTo=;
        b=LTluyq6wLCKlAmJJC/knNYvlJQm2SqqxFNq/2y1aiEKZPojA7hqTTavhUlZIk9imHs
         lAREyIrSOIiaYzYzI1hZbqWp9GWQCPiW1ENJ0+3VfNp7YTOtDHSUUOdz3KiaO+5gY9AX
         2QvLa5MSGsICKA1b7yxSXvN1qP7Me/GGWZF2OOD9wppOarkZ2y5eMp/AkEEGFxyW6cWY
         ZXRCAifncCLT30vkQJbIfVxLRj3o5/P6YdV+bIiXDAexz5NVPUApQdGHxDd0OZQgc5h0
         CsU91RjNYUhX0Mx2VEioetAp+rKrfbVM5vRSAD7my78SSdcmNcDUI5bnQyyna1oRqzZC
         +2/w==
X-Gm-Message-State: AOJu0YzZLSFDW8QEu9Mhd9u6Pwl7VL/45G0cyhYP90Q7+AvrRxvm0kFv
	0f3TwCFc3bF310oJJrgAPy24XF5Bkn4O9TRRuEu8tzYz/smVt6YtLsMuOsLz09VzXMJN+d44yAJ
	ihTuOWxuIu95O9hR0TrsO9AtDm6Y=
X-Google-Smtp-Source: AGHT+IGwskPL/xOMuyhYSU+RQR0RuGqGpVLpSv4HBH2qNzpcKyZaQb1o3YIy1hSq76JmjBnGhbLcGHStqaKX4eCYcU4=
X-Received: by 2002:a5d:5889:0:b0:378:955f:d47d with SMTP id
 ffacd0b85a97d-37eb4860850mr4458007f8f.11.1729533771643; Mon, 21 Oct 2024
 11:02:51 -0700 (PDT)
MIME-Version: 1.0
Sender: gael.portay@gmail.com
Received: by 2002:a05:7412:1083:b0:12b:7c67:57fe with HTTP; Mon, 21 Oct 2024
 11:02:50 -0700 (PDT)
In-Reply-To: <CANNYZj-TGg4RcBwXyvfN2D0Pq5kKSE5mT5u8wsYHjsK3KPx6YA@mail.gmail.com>
References: <20241019021935.2105739-1-gael.portay+rtone@gmail.com>
 <CANNYZj-bdtFmFHnK2ppSMY+iXRDX-J5GwWaQjYMwX_t66SnJoQ@mail.gmail.com>
 <D51N9GUUD7NN.KLL01VZA4V8U@gmail.com> <CANNYZj-TGg4RcBwXyvfN2D0Pq5kKSE5mT5u8wsYHjsK3KPx6YA@mail.gmail.com>
From: =?UTF-8?B?R2HDq2wgUE9SVEFZ?= <gael.portay+rtone@gmail.com>
Date: Mon, 21 Oct 2024 20:02:50 +0200
X-Google-Sender-Auth: DCkFsb_Z2gpvm0gmY0HkEbrupLk
Message-ID: <CAHs7_BaKc3L-94aZrS1sewfTML13idmgL1c=KsN3KX4w17kvvg@mail.gmail.com>
Subject: Re: [PATCH] classes: rootfs-postcommands: set better sane time to systemd
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000016092506250076fe"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 18:02:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206129

--00000000000016092506250076fe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Monday 21 October 2024, Alexander Kanavin <alex.kanavin@gmail.com> wrote=
:
> On Mon, 21 Oct 2024 at 19:02, Ga=C3=ABl PORTAY <gael.portay@gmail.com> wr=
ote:
>
>> Or, linking the file instead:
>>
>>         rootfs_update_timestamp () {
>>                 if [ "${REPRODUCIBLE_TIMESTAMP_ROOTFS}" !=3D "" ]; then
>>                         # Convert UTC into %4Y%2m%2d%2H%2M%2S
>>                         sformatted=3D`date -u -d
@${REPRODUCIBLE_TIMESTAMP_ROOTFS} +%4Y%2m%2d%2H%2M%2S`
>>                 else
>>                         sformatted=3D`date -u +%4Y%2m%2d%2H%2M%2S`
>>                 fi
>>                 echo $sformatted > ${IMAGE_ROOTFS}/etc/timestamp
>>                 bbnote "rootfs_update_timestamp: set /etc/timestamp to
$sformatted"
>>         +
>>         +       if [ -x /lib/systemd/systemd ]; then
>>         +           ln -sf /etc/timestamp /usr/lib/clock-epoch
>>         +       }
>>         }
>>
>> Does it look better for you?
>
> This does look better, yes. Will systemd follow the symlink and read
> the mtime of the original file?
>
> Alex
>

I have not tested it so far, but I guess so.

systemd stat() the file, so it should follows symlink.

I will give a try tomorrow.

Also, I wonder what is the best test to symlink the file:
- testing for the ${IMAGE_ROOTFS}/llib/systemd/systemd
- testing for systemd in DISTRO_FEATURES,
- testing for systemd in IMAGE_INSTALL?

https://github.com/systemd/systemd/blob/4d47aa8c0435ad7bcd45aea3a091c22027f=
c0aa8/src/core/clock-warp.c#L26

Ga=C3=ABl

--00000000000016092506250076fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Monday 21 October 2024, Alexander Kanavin &lt;<a href=3D"mailto:=
alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br>&gt; On Mo=
n, 21 Oct 2024 at 19:02, Ga=C3=ABl PORTAY &lt;<a href=3D"mailto:gael.portay=
@gmail.com">gael.portay@gmail.com</a>&gt; wrote:<br>&gt;<br>&gt;&gt; Or, li=
nking the file instead:<br>&gt;&gt;<br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0rootfs_update_timestamp () {<br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${REPRODUCIBLE_TIMESTAMP_ROOTF=
S}&quot; !=3D &quot;&quot; ]; then<br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Convert UTC=
 into %4Y%2m%2d%2H%2M%2S<br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sformatted=3D`date -u -=
d @${REPRODUCIBLE_TIMESTAMP_ROOTFS} +%4Y%2m%2d%2H%2M%2S`<br>&gt;&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>&gt;&gt;=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0sformatted=3D`date -u +%4Y%2m%2d%2H%2M%2S`<br>&gt;&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>&gt;&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo $sformatted &g=
t; ${IMAGE_ROOTFS}/etc/timestamp<br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbnote &quot;rootfs_update_timestamp: set /e=
tc/timestamp to $sformatted&quot;<br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0+<br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =
=C2=A0if [ -x /lib/systemd/systemd ]; then<br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf /etc/timestam=
p /usr/lib/clock-epoch<br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=C2=A0=
 =C2=A0 =C2=A0 =C2=A0}<br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>&g=
t;&gt;<br>&gt;&gt; Does it look better for you?<br>&gt;<br>&gt; This does l=
ook better, yes. Will systemd follow the symlink and read<br>&gt; the mtime=
 of the original file?<br>&gt;<br>&gt; Alex<br>&gt;<br><br>I have not teste=
d it so far, but I guess so.<br><br>systemd stat() the file, so it should f=
ollows symlink.<br><br>I will give a try tomorrow.<br><br>Also, I wonder wh=
at is the best test to symlink the file:<br> - testing for the ${IMAGE_ROOT=
FS}/llib/systemd/systemd<br> - testing for systemd in DISTRO_FEATURES,<br> =
- testing for systemd in IMAGE_INSTALL?<br><br><a href=3D"https://github.co=
m/systemd/systemd/blob/4d47aa8c0435ad7bcd45aea3a091c22027fc0aa8/src/core/cl=
ock-warp.c#L26">https://github.com/systemd/systemd/blob/4d47aa8c0435ad7bcd4=
5aea3a091c22027fc0aa8/src/core/clock-warp.c#L26</a><br><br>Ga=C3=ABl <br>

--00000000000016092506250076fe--

