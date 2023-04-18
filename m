Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B947CC77B72
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 01:14:03 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web10.15177.1681780437165871837
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Apr 2023 18:13:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=I54oUNX/;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6a437526b7cso78216a34.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 18:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681780436; x=1684372436;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RNA6tjzjBAJsISdbSZv5tzlbqZJnHuOPIn7gx3aPMK0=;
        b=I54oUNX/utK96/jTXu/kgAvCzGwB5218ej+H+tF3WAX5EC+RW1dzBZ1jUXlaPUNg9p
         Tzzn1gvcV5zReLolUVoFiW0M/1Kx7wzN5z46OJCjC/vaC7YkdcyAkwcqlFhADf/gpokt
         3MnDwbU+m1WYseoJnn9FN3xZL3qcwVaB7IuMySrhhLN0C1nYuwXPXLIlGRJ3BLf3TSLA
         2X2lHFLPk0ccpEAdHFyBvvxGCTm9N1yG7kgTw1eiQSNnTY8b1AaY9z9Xy6Ww+UaM5SkA
         MahC3+VhOy6wsXJE3yCPG+Mb8z2DQGVNOGfeWzTl1NATpMCtpI1xVaikQObs63nZ4A1I
         EmoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681780436; x=1684372436;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RNA6tjzjBAJsISdbSZv5tzlbqZJnHuOPIn7gx3aPMK0=;
        b=PCBf+E7nSMnkqoqguBePV2qfbo9c7uHQi9061n0i2arih4BaQS/8TG/S6ErotePDJW
         HPFORrREQP1CdkfV5eOpOWrzWg2rHF1I2vgZmdCvAbA9/aKak4SWCemnZyZr1dtF+3dC
         eiZCzwJ5+ulZYUPzTFj/wyMSyHDep5rLZEwuBm7rc2q1PPJtreQSOclyN2nMq5v0k/zR
         o81tzwzbwuzveTem+6hGCYjzpBsaRmL/Vpvsb1Bmes/oUjv/15j9rhD6k5SFAAD1nWLr
         MGgB2iG4312Njxe1BDNERKdc9D9WbMQSaM5WVople7PjfUoDSXZJ1LvQEwihgR0/Wmf/
         T+hA==
X-Gm-Message-State: AAQBX9dOV7UURYEGLZ++oKUSSMOo8XmnOT0cPldlIPqKTJb86QJwuRTd
	WlAgoztxkaaLWmILWDKszO7t1ZObmhiSHV31Ppg=
X-Google-Smtp-Source: AKy350Y4mCJOIRWkDVjCsjt4o3ZdHRnsrJKNJ8kQ4Bftz7vuiM5U/x0hXMNFmv6l96n8gREckAz0x/rezpGvWzqeAtk=
X-Received: by 2002:a05:6830:20d3:b0:6a4:4e5a:61ac with SMTP id
 z19-20020a05683020d300b006a44e5a61acmr115632otq.2.1681780436281; Mon, 17 Apr
 2023 18:13:56 -0700 (PDT)
MIME-Version: 1.0
References: <1681462400-3660-1-git-send-email-qiutt@fujitsu.com>
 <1efe32dfbfba7491c672f81571bd950c629f1d79.camel@linuxfoundation.org>
 <CAMKF1srH4rxtr6srtJvNZEpfPZhfYR_jOshBrZomSAGEy2JYuA@mail.gmail.com> <OS3PR01MB95151CD9CACC9273DA608B3EBA9D9@OS3PR01MB9515.jpnprd01.prod.outlook.com>
In-Reply-To: <OS3PR01MB95151CD9CACC9273DA608B3EBA9D9@OS3PR01MB9515.jpnprd01.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Apr 2023 18:13:45 -0700
Message-ID: <CAMKF1socwNE1yE3ywMyimSqu8JF03hzKR27YKXL6qJu-1r2d3g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V1] coreutils: Add gcc parameter for ptest
To: "Tingting Qiu (Fujitsu)" <qiutt@fujitsu.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"fnstml-fujitsuten@fujitsu.com" <fnstml-fujitsuten@fujitsu.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007eaec205f9920576"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 01:14:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180172

--0000000000007eaec205f9920576
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 17, 2023 at 6:05 PM Tingting Qiu (Fujitsu) <qiutt@fujitsu.com>
wrote:

>
>
> > -----Original Message-----
> > From: Khem Raj <raj.khem@gmail.com>
> > Sent: Saturday, April 15, 2023 12:11 AM
> > To: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Cc: Qiu, Tingting/=E4=BB=87 =E5=A9=B7=E5=A9=B7 <qiutt@fujitsu.com>;
> > openembedded-core@lists.openembedded.org; FNST fnstml-fujitsuten
> > <fnstml-fujitsuten@fujitsu.com>
> > Subject: Re: [OE-core] [PATCH V1] coreutils: Add gcc parameter for ptes=
t
> >
> > On Fri, Apr 14, 2023 at 3:06=E2=80=AFAM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Fri, 2023-04-14 at 16:53 +0800, qiutt@fujitsu.com wrote:
> > > > From: Qiu Tingting <qiutt@fujitsu.com>
> > > >
> > > > If gcc is installed in image, ptest result has 4 ERROR.
> > > >   ERROR: tests/rm/r-root.sh
> > > >   ERROR: tests/rm/rm-readdir-fail.sh
> > > >   ERROR: tests/cp/nfs-removal-race.sh
> > > >   ERROR: tests/ls/getxattr-speedup.sh
> > > >
> > > > r-root.log as an example:
> > > >   --------------------------
> > > >   k.c:1:10: fatal error: stdio.h: No such file or directory
> > > >       1 | #include <stdio.h>
> > > >         |          ^~~~~~~~~
> > > >   compilation terminated.
> > > >   r-root.sh: set-up failure: failed to build shared library
> > > >   ERROR tests/rm/r-root.sh (exit status: 99)
> > > >   --------------------------
> > > >
> > > > reason:
> > > >   In these cases, k.c file is created and compiled by gcc before ru=
n.
> > > >   There is a stdio.h file in /usr/include/ directory,
> > > >   but gcc parameter is not set it.
> > > >
> > > > solution:
> > > >   Add "-l /usr/include/" in gcc parameter.
> > > >
> > > > other:
> > > >   If gcc is not installed in image, these cases will be skipped.
> > > >
> > > > Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
> > > > ---
> > > >  meta/recipes-core/coreutils/coreutils_9.1.bb | 1 +
> > > >  1 file changed, 1 insertion(+)
> > >
> > >
> > > I'm a bit puzzled by this. Wouldn't on target gcc have /usr/include a=
s
> > > part of it's default search path? Why isn't the default search path
> > > working?
> >
> > yeah. Perhaps looking at full compiler commandline used just for this
> test
> > would help maybe there is something like -ffreestanding or something
> passed
> > to it.
>
> Normal gcc have /usr/include as part of its default search path.
> I used aarch64-agl-linux-gcc for aarch64 board, which does not search thi=
s
> path.


This should be a symlink to gcc on target so I wonder why it does not work


>
> Best regards,
> Qiu Tingting
> >
> > >
> > > Cheers,
> > >
> > > Richard
> > >
> > >
> > > >
> > > > diff --git a/meta/recipes-core/coreutils/coreutils_9.1.bb
> > > > b/meta/recipes-core/coreutils/coreutils_9.1.bb
> > > > index 4807eefd04..fe785b673d 100644
> > > > --- a/meta/recipes-core/coreutils/coreutils_9.1.bb
> > > > +++ b/meta/recipes-core/coreutils/coreutils_9.1.bb
> > > > @@ -184,6 +184,7 @@ do_install_ptest () {
> > > >      install ${S}/build-aux/test-driver ${D}${PTEST_PATH}/build-aux=
/
> > > >      cp ${B}/Makefile ${D}${PTEST_PATH}/
> > > >      cp ${S}/init.cfg ${D}${PTEST_PATH}/
> > > > +    sed -i 's/CC -Wall -shared/CC -Wall -shared -l
> > > > + \/usr\/include\//g' ${D}${PTEST_PATH}/init.cfg
> > > >      cp -r ${B}/src ${D}${PTEST_PATH}/
> > > >      cp -r ${S}/src/*.c ${D}${PTEST_PATH}/src
> > > >      sed -i '/^VPATH/s/=3D .*$/=3D ./g' ${D}${PTEST_PATH}/Makefile
> > > >
> > > >
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#179996):
> > > https://lists.openembedded.org/g/openembedded-core/message/179996
> > > Mute This Topic: https://lists.openembedded.org/mt/98258324/1997914
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-core/unsub
> > > [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
>

--0000000000007eaec205f9920576
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Apr 17, 2023 at 6:05 PM Tingting Qiu (Fujitsu) &lt;=
<a href=3D"mailto:qiutt@fujitsu.com">qiutt@fujitsu.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_bl=
ank">raj.khem@gmail.com</a>&gt;<br>
&gt; Sent: Saturday, April 15, 2023 12:11 AM<br>
&gt; To: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundatio=
n.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
&gt; Cc: Qiu, Tingting/=E4=BB=87 =E5=A9=B7=E5=A9=B7 &lt;<a href=3D"mailto:q=
iutt@fujitsu.com" target=3D"_blank">qiutt@fujitsu.com</a>&gt;;<br>
&gt; <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"=
_blank">openembedded-core@lists.openembedded.org</a>; FNST fnstml-fujitsute=
n<br>
&gt; &lt;<a href=3D"mailto:fnstml-fujitsuten@fujitsu.com" target=3D"_blank"=
>fnstml-fujitsuten@fujitsu.com</a>&gt;<br>
&gt; Subject: Re: [OE-core] [PATCH V1] coreutils: Add gcc parameter for pte=
st<br>
&gt; <br>
&gt; On Fri, Apr 14, 2023 at 3:06=E2=80=AFAM Richard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Fri, 2023-04-14 at 16:53 +0800, <a href=3D"mailto:qiutt@fujits=
u.com" target=3D"_blank">qiutt@fujitsu.com</a> wrote:<br>
&gt; &gt; &gt; From: Qiu Tingting &lt;<a href=3D"mailto:qiutt@fujitsu.com" =
target=3D"_blank">qiutt@fujitsu.com</a>&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; If gcc is installed in image, ptest result has 4 ERROR.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0ERROR: tests/rm/r-root.sh<br>
&gt; &gt; &gt;=C2=A0 =C2=A0ERROR: tests/rm/rm-readdir-fail.sh<br>
&gt; &gt; &gt;=C2=A0 =C2=A0ERROR: tests/cp/nfs-removal-race.sh<br>
&gt; &gt; &gt;=C2=A0 =C2=A0ERROR: tests/ls/getxattr-speedup.sh<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; r-root.log as an example:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0--------------------------<br>
&gt; &gt; &gt;=C2=A0 =C2=A0k.c:1:10: fatal error: stdio.h: No such file or =
directory<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A01 | #include &lt;stdio.h&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ^~~~~~~~~<br>
&gt; &gt; &gt;=C2=A0 =C2=A0compilation terminated.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0r-root.sh: set-up failure: failed to build share=
d library<br>
&gt; &gt; &gt;=C2=A0 =C2=A0ERROR tests/rm/r-root.sh (exit status: 99)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0--------------------------<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; reason:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0In these cases, k.c file is created and compiled=
 by gcc before run.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0There is a stdio.h file in /usr/include/ directo=
ry,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0but gcc parameter is not set it.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; solution:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0Add &quot;-l /usr/include/&quot; in gcc paramete=
r.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; other:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0If gcc is not installed in image, these cases wi=
ll be skipped.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Qiu Tingting &lt;<a href=3D"mailto:qiutt@fuji=
tsu.com" target=3D"_blank">qiutt@fujitsu.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 meta/recipes-core/coreutils/<a href=3D"http://coreutil=
s_9.1.bb" rel=3D"noreferrer" target=3D"_blank">coreutils_9.1.bb</a> | 1 +<b=
r>
&gt; &gt; &gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m a bit puzzled by this. Wouldn&#39;t on target gcc have /u=
sr/include as<br>
&gt; &gt; part of it&#39;s default search path? Why isn&#39;t the default s=
earch path<br>
&gt; &gt; working?<br>
&gt; <br>
&gt; yeah. Perhaps looking at full compiler commandline used just for this =
test<br>
&gt; would help maybe there is something like -ffreestanding or something p=
assed<br>
&gt; to it.<br>
<br>
Normal gcc have /usr/include as part of its default search path.<br>
I used aarch64-agl-linux-gcc for aarch64 board, which does not search this =
path.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">This should=
 be a symlink to gcc on target so I wonder why it does not work=C2=A0</div>=
<div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br=
>
<br>
Best regards,<br>
Qiu Tingting<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; Cheers,<br>
&gt; &gt;<br>
&gt; &gt; Richard<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/meta/recipes-core/coreutils/<a href=3D"http://c=
oreutils_9.1.bb" rel=3D"noreferrer" target=3D"_blank">coreutils_9.1.bb</a><=
br>
&gt; &gt; &gt; b/meta/recipes-core/coreutils/<a href=3D"http://coreutils_9.=
1.bb" rel=3D"noreferrer" target=3D"_blank">coreutils_9.1.bb</a><br>
&gt; &gt; &gt; index 4807eefd04..fe785b673d 100644<br>
&gt; &gt; &gt; --- a/meta/recipes-core/coreutils/<a href=3D"http://coreutil=
s_9.1.bb" rel=3D"noreferrer" target=3D"_blank">coreutils_9.1.bb</a><br>
&gt; &gt; &gt; +++ b/meta/recipes-core/coreutils/<a href=3D"http://coreutil=
s_9.1.bb" rel=3D"noreferrer" target=3D"_blank">coreutils_9.1.bb</a><br>
&gt; &gt; &gt; @@ -184,6 +184,7 @@ do_install_ptest () {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 install ${S}/build-aux/test-driver ${D}$=
{PTEST_PATH}/build-aux/<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 cp ${B}/Makefile ${D}${PTEST_PATH}/<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 cp ${S}/init.cfg ${D}${PTEST_PATH}/<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 sed -i &#39;s/CC -Wall -shared/CC -Wall -shar=
ed -l<br>
&gt; &gt; &gt; + \/usr\/include\//g&#39; ${D}${PTEST_PATH}/init.cfg<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 cp -r ${B}/src ${D}${PTEST_PATH}/<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 cp -r ${S}/src/*.c ${D}${PTEST_PATH}/src=
<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 sed -i &#39;/^VPATH/s/=3D .*$/=3D ./g&#3=
9; ${D}${PTEST_PATH}/Makefile<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#179996):<br>
&gt; &gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/mes=
sage/179996" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-core/message/179996</a><br>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/982=
58324/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/98258324/1997914</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.op=
enembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedde=
d.org</a><br>
&gt; &gt; Unsubscribe:<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/unsub" r=
el=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/openem=
bedded-core/unsub</a><br>
&gt; &gt; [<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem=
@gmail.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
</blockquote></div></div>

--0000000000007eaec205f9920576--

