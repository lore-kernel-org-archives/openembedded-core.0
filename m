Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 697FFD3399F
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 16:50:52 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.56872.1730134246545107957
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 09:50:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Lu9d4JAv;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.178, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e290554afb4so4640036276.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 09:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730134245; x=1730739045; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2L7nL/zAoWZQQK+tU/9sOGb0t5fN2ilnAB9DDDnRC/c=;
        b=Lu9d4JAvPRKFtftXqhgYSoZfmNSix+e8rA2kT49XLTemVLBf5G5c1JsjJpRJMyqeqM
         E/YVjnUkzaWtFV4tinzWweH34J5c3ypl+vj3YA/WncQj6QNukgJH0/7uQjn1iQSm/6kx
         9JEbgQFMLWu4g/f8eJAZvbpRqPMBQl0r9jrscy+cx4RQNsfwE0DBz7Ml5x2ZiA+e16i4
         Cth6ybY5RprO0D262eC7PZIfSzNBq+2yHtSUR7rg/6ui64qxQR7YsdB80GxdM0iRkPod
         nGPZbQFg+oiH7N2D+pQXS8HWPNqRNjpeVFlTVYwuS6R+mGEnT+ba1rMpRVGsVZsi52sW
         wqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730134245; x=1730739045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2L7nL/zAoWZQQK+tU/9sOGb0t5fN2ilnAB9DDDnRC/c=;
        b=PJZWqsMqGA+5pH4sQUWSQfCAKO0oO76R81lyTtXn5lWPnjzVbxVrc3OlF7mIevljlV
         Lu1HTIe+HvKh52gvL5Q0fFAwimoCuvxwo0d4iPzGm/pACD1hPoeVZFrg5+FnGkNyB+wo
         9XvOajruAg40EQrisbu4xJbx7z3QvbG5P4Co+AHSJhivzIF+4aE9EM6YPO/VbWBFC7Uv
         5tXPa1ftMgeMk5fF08TWwjVOBymkwpA2bcVJ4hfOGjQ9D1lsU+wHl5k3zbn2A1bqKoLF
         MIPni5d8Z9wWNSriZKr9hIMJaF4ZEgJU7rC38AQD4oEmM+kx+Xd5AeGwsgNnKMJ0UTU6
         /iNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmKDWRFyj/51e/WCR2MGfYzgjuPFHeClqi2LWm2IPEr+py/wLQ7dpkfKy2ArSVvol0tnmydJ1/TbZqKQnCExx4Jg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw9aodtw0XZyAdemIlxSWjlQyeYMCT+aUzcV4GHKikc3aPntdtF
	RaqCOGCFZbs+WFGsu91n0R1Fy63BBNMrVhXPPQeJ5pBNfG0J2j1LukLjn7j04rhOSD3qjBqa5qw
	gANlbePmMSsUydtz767Up5bJvf5DmHTX4guaTmA==
X-Google-Smtp-Source: AGHT+IE1ZIlPpnDMBKj22dop8G9pXUpJ9cDrXPLiILqOmat1eW2Eu5vLEeBrrT/ph3cvBGfqolKNrt15ctQK2+dnpws=
X-Received: by 2002:a05:6902:11cc:b0:e29:3b5:6e60 with SMTP id
 3f1490d57ef6-e308794ba59mr6797455276.2.1730134245500; Mon, 28 Oct 2024
 09:50:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1723551231.git.steve@sakoman.com> <092d2a6df6eae6f93a35a0429d2cdfc9b246cecf.1723551231.git.steve@sakoman.com>
 <DS7PR10MB4926DCB745BE2CB39CA0A994FA6F2@DS7PR10MB4926.namprd10.prod.outlook.com>
 <CANNYZj-xXKRZSX8TWZnJSEsYc8+-7uKVdWy==4g5Uz0x5_q1cA@mail.gmail.com> <CANQUz187fQEeEcZXpGCz0kbN06h8QeD2Jyn7v1N07CVEz+60HQ@mail.gmail.com>
In-Reply-To: <CANQUz187fQEeEcZXpGCz0kbN06h8QeD2Jyn7v1N07CVEz+60HQ@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 28 Oct 2024 09:50:34 -0700
Message-ID: <CAOSpxdaeK-GRrm8WWyWP3a7PyeX5+BO1Y1zNNZSpyyh91TCwSg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 10/11] orc: upgrade 0.4.32 -> 0.4.39
To: Vijay Anusuri <vanusuri@mvista.com>
Cc: alex.kanavin@gmail.com, Arturo.Buzarra@digi.com, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 16:50:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206451

On Sun, Oct 27, 2024 at 6:32=E2=80=AFPM Vijay Anusuri <vanusuri@mvista.com>=
 wrote:
>
> Hi Steve,
>
> orc updated in master to the version 0.4.40 which resolves the above ment=
ioned issue.
>
> could you please merge it to scarthgap, styhead and kirkstone.

OK, I will do so.

Steve

> Thanks & Regards,
> Vijay
>
> On Tue, Sep 24, 2024 at 12:10=E2=80=AFAM Alexander Kanavin via lists.open=
embedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> This needs to be updated in master first, and then you can send a backpo=
rt.
>>
>> Alex
>>
>> On Mon, 23 Sept 2024 at 15:33, abuzarra via lists.openembedded.org
>> <Arturo.Buzarra=3Ddigi.com@lists.openembedded.org> wrote:
>> >
>> > Hi all,
>> >
>> > After this update of the ORC recipe for the kirkstone branch the build=
 is broken with Ubuntu 18.04 due to an issue with the GCC version supported=
 on that version ( GCC < 8 ).
>> >
>> > The build throws an unexpected error related with a missing _xgetbv in=
trinsic function that apparently was introduced in GCC > 8
>> >
>> > I notice that there is a new version ORC v0.4.40 that fixes the build =
issues, is there a plan to backport this ORC version to kirkstone branch?
>> >
>> > Thanks in advance,
>> >
>> > -----Original Message-----
>> > From: openembedded-core@lists.openembedded.org <openembedded-core@list=
s.openembedded.org> On Behalf Of Steve Sakoman
>> > Sent: martes, 13 de agosto de 2024 14:17
>> > To: openembedded-core@lists.openembedded.org
>> > Subject: [OE-core][kirkstone 10/11] orc: upgrade 0.4.32 -> 0.4.39
>> >
>> > [EXTERNAL E-MAIL] Warning! This email originated outside of the organi=
zation! Do not click links or open attachments unless you recognize the sen=
der and know the content is safe.
>> >
>> >
>> >
>> > From: Vijay Anusuri <vanusuri@mvista.com>
>> >
>> > Include security fix CVE-2024-40897
>> >
>> > Ref: https://github.com/GStreamer/orc/blob/0.4.39/RELEASE
>> >
>> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
>> > ---
>> >  meta/recipes-devtools/orc/{orc_0.4.32.bb =3D> orc_0.4.39.bb} | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)  rename meta/recipes-de=
vtools/orc/{orc_0.4.32.bb =3D> orc_0.4.39.bb} (92%)
>> >
>> > diff --git a/meta/recipes-devtools/orc/orc_0.4.32.bb b/meta/recipes-de=
vtools/orc/orc_0.4.39.bb
>> > similarity index 92%
>> > rename from meta/recipes-devtools/orc/orc_0.4.32.bb
>> > rename to meta/recipes-devtools/orc/orc_0.4.39.bb
>> > index 829255f110..320abf536a 100644
>> > --- a/meta/recipes-devtools/orc/orc_0.4.32.bb
>> > +++ b/meta/recipes-devtools/orc/orc_0.4.39.bb
>> > @@ -5,7 +5,7 @@ LICENSE =3D "BSD-2-Clause & BSD-3-Clause"
>> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1400bd9d09e8af56b9ec982b3d=
85797e"
>> >
>> >  SRC_URI =3D "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.x=
z"
>> > -SRC_URI[sha256sum] =3D "a66e3d8f2b7e65178d786a01ef61f2a0a0b4d0b8370de=
7ce134ba73da4af18f0"
>> > +SRC_URI[sha256sum] =3D "33ed2387f49b825fa1b9c3b0072e05f259141b895474a=
d085ae51143d3040cc0"
>> >
>> >  inherit meson pkgconfig gtk-doc
>> >
>> > --
>> > 2.34.1
>> >
>> >
>> >
>> >
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#204824): https://lists.openembedded.org/g/openembedd=
ed-core/message/204824
>> Mute This Topic: https://lists.openembedded.org/mt/107874802/7301997
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [v=
anusuri@mvista.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

