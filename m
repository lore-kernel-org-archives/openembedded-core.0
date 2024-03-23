Return-Path: <joel.winarske@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DBEDC54E58
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 15:14:39 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.10633.1711206877001498163
 for <Openembedded-core@lists.openembedded.org>;
 Sat, 23 Mar 2024 08:14:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Iis5Idia;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: joel.winarske@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1df01161b39so23526895ad.3
        for <Openembedded-core@lists.openembedded.org>; Sat, 23 Mar 2024 08:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711206876; x=1711811676; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/XzZSGVzEt1KUX3XqmHK1UgsJ9k8yOLdkWiMfxuQpA0=;
        b=Iis5Idia9x2LvflvB4fptJYD15aCfY4DXZBdUp5DJqB26Nbx/0oHKlsiWdlIzWVP42
         DcWqpY0IvZiNvZdFqeLrf371AXIcdS18Hq4DPnRpFe94C0g5CQJh01oUp2mYBqr0Eb71
         7YwXdyWQ6sjeoPHlUkgX4az4qHtWo5tWe+ZDPhydubhaQtqEYcL9b1s/REg56Zd7kWPE
         1UIi8AEhaRBiC54xU+6c9I4g9DWJn/q0+M6w2xociJ3SN2WC43NlHazppKr98/5cldVu
         JNkfqNU6yxBMemLJS3R3mOK1oKLIH9m8gHoNxSPAq3Ei64iiC9vrK0nNaQ+E7T6rjG6I
         EnBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711206876; x=1711811676;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/XzZSGVzEt1KUX3XqmHK1UgsJ9k8yOLdkWiMfxuQpA0=;
        b=bKpoJY2sBuuN+9M3Lm4eH4GqlOjxWCaNQSWYNy2Ybks4ZCrpY0Xb/VqwSH1Ja6K/ER
         MB8OeSOAN4qZRlnh20YUH+2/iP5av6thpnWe5vX6JQXJR3hq7VTys7JFms55D29pq0s9
         4A36bnxrQJucVh8Q+OpaU8oSwL3NzIr8b8dgYQ3sk5HVFWWSICzG+S1F3jpdJnmJtTC8
         GasSdhcBEJGIJkFuE5ff7HSTwJEKmSrl+dAWcLMyRDu6hi80v4cuvr9AwxHZdbTnSbOt
         mL6gX5Y4PZ1VIrjqkeFi23bYBdthLdjafeL1+4UVW1RL7pOM76HxEIbuh7oYzQQWa+YJ
         MU/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWwIfmfrPi2eSjuPGyKF9QNU2uE4zVRhoIamUbLwUujNcSlLHTvvei7Z77Nrl7iJLT/AVpXmlcQL9WQ4AO2qQrw+RA0ZHcxfNe8r7fbXA+armYrjpZmtgF8
X-Gm-Message-State: AOJu0Yw+GZ1UeZRc8UbkGPwSkFlzj44aMZwIFEvvauVEvl3SL71kHgX6
	O6YXXU47XEcM7UKzakBfTKdV+CUD8J/9CZw3r3AJkXQeBYPUXchB97O7dg/VIX253LzhdWtvzWi
	qk+Kbz9ihUM9fMVx9uhsVlPITNKg=
X-Google-Smtp-Source: AGHT+IEXMtc0ZukFgsN2K1ns8REGNY6YnN1Oxkz7hRfLpS3wj4ZmwnxE+dvoqN/TKJHQ/YkEKXFgyqPN9CNcOTv2OqM=
X-Received: by 2002:a17:902:a3c6:b0:1dd:22ec:7b22 with SMTP id
 q6-20020a170902a3c600b001dd22ec7b22mr2751799plb.33.1711206876105; Sat, 23 Mar
 2024 08:14:36 -0700 (PDT)
MIME-Version: 1.0
References: <CABKMkPKN__Jh6jvc_CfHtwp3HGbRsBJ3YxHxGb1RPPN2WWqRMw@mail.gmail.com>
 <20240321220849ed4253c3@mail.local> <CAMKF1srrNXOGk8E1wzdDeRVtxmdu1sQrHpnFJA3zTs-cQA7NSQ@mail.gmail.com>
 <CAMKF1sp4jpg2fhWLXzvQG0+rizoK_1Hb_08vXiCTWhYUB_D5Yg@mail.gmail.com>
In-Reply-To: <CAMKF1sp4jpg2fhWLXzvQG0+rizoK_1Hb_08vXiCTWhYUB_D5Yg@mail.gmail.com>
From: Joel Winarske <joel.winarske@gmail.com>
Date: Sat, 23 Mar 2024 08:14:24 -0700
Message-ID: <CABKMkPJChp+_rP6fctFigxQi1i_UvHFMKFntxEcM-SNrAEgPDg@mail.gmail.com>
Subject: Re: [OE-core] [master] riscv: libcamera stack smashing detected
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	OE-core <Openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fcd48106145565e0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Mar 2024 15:14:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197453

--000000000000fcd48106145565e0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The patch is good!

visionfive2:~$ cam -l
[0:04:03.111334926] [405]  WARN IPAManager ipa_manager.cpp:154 No IPA found
in '/usr/lib/libcamera'
[0:04:03.111423176] [405]  INFO Camera camera_manager.cpp:284 libcamera
v0.2.0+dirty (2024-03-23T15:11:32+00:00)
Available cameras:
visionfive2:~$

On Fri, Mar 22, 2024 at 11:57=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:

> Joel, please test the patch I posted to oe ml which should hopefully
> fix the problem you are seeing on rv64 Let me know if it is working or
> not working for your use case.
>
>
> https://lore.kernel.org/openembedded-devel/20240323065503.4149463-1-raj.k=
hem@gmail.com/T/#u
>
> On Thu, Mar 21, 2024 at 3:15=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > yes I am aware of it.
> >
> > On Thu, Mar 21, 2024 at 3:08=E2=80=AFPM Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> > >
> > > Hello,
> > >
> > > This report should have gone to the openembedded-devel mailing list a=
s
> > > libcamera is in meta-oe. But I guess Khem will have a look anyway.
> > >
> > >
> > > On 20/03/2024 09:10:05-0700, Joel Winarske wrote:
> > > > In master there is a problem running the libcamera "cam" app on a
> RISC-V
> > > > device:
> > > >
> > > > *** stack smashing detected ***: terminated
> > > >
> > > > If I remove the patches in the libcamera recipe, it builds and runs
> on
> > > > target without issue.
> > > >
> > > > libcamera bug has the details:
> > > > https://bugs.libcamera.org/show_bug.cgi?id=3D214
> > > >
> > > > Joel
> > >
> > > >
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#197371):
> https://lists.openembedded.org/g/openembedded-core/message/197371
> > > > Mute This Topic: https://lists.openembedded.org/mt/105047726/361717=
9
> > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub [
> alexandre.belloni@bootlin.com]
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >
> > >
> > >
> > > --
> > > Alexandre Belloni, co-owner and COO, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://bootlin.com
>

--000000000000fcd48106145565e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The patch is good!<br><br>visionfive2:~$ cam -l<br>[0:04:0=
3.111334926] [405] =C2=A0WARN IPAManager ipa_manager.cpp:154 No IPA found i=
n &#39;/usr/lib/libcamera&#39;<br>[0:04:03.111423176] [405] =C2=A0INFO Came=
ra camera_manager.cpp:284 libcamera v0.2.0+dirty (2024-03-23T15:11:32+00:00=
)<br>Available cameras:<br>visionfive2:~$ <br></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 22, 2024 at 11:57=
=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Joel, please test the patch I posted to oe ml which should hopefully<=
br>
fix the problem you are seeing on rv64 Let me know if it is working or<br>
not working for your use case.<br>
<br>
<a href=3D"https://lore.kernel.org/openembedded-devel/20240323065503.414946=
3-1-raj.khem@gmail.com/T/#u" rel=3D"noreferrer" target=3D"_blank">https://l=
ore.kernel.org/openembedded-devel/20240323065503.4149463-1-raj.khem@gmail.c=
om/T/#u</a><br>
<br>
On Thu, Mar 21, 2024 at 3:15=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:raj.=
khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; yes I am aware of it.<br>
&gt;<br>
&gt; On Thu, Mar 21, 2024 at 3:08=E2=80=AFPM Alexandre Belloni<br>
&gt; &lt;<a href=3D"mailto:alexandre.belloni@bootlin.com" target=3D"_blank"=
>alexandre.belloni@bootlin.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Hello,<br>
&gt; &gt;<br>
&gt; &gt; This report should have gone to the openembedded-devel mailing li=
st as<br>
&gt; &gt; libcamera is in meta-oe. But I guess Khem will have a look anyway=
.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On 20/03/2024 09:10:05-0700, Joel Winarske wrote:<br>
&gt; &gt; &gt; In master there is a problem running the libcamera &quot;cam=
&quot; app on a RISC-V<br>
&gt; &gt; &gt; device:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; *** stack smashing detected ***: terminated<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; If I remove the patches in the libcamera recipe, it builds a=
nd runs on<br>
&gt; &gt; &gt; target without issue.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; libcamera bug has the details:<br>
&gt; &gt; &gt; <a href=3D"https://bugs.libcamera.org/show_bug.cgi?id=3D214"=
 rel=3D"noreferrer" target=3D"_blank">https://bugs.libcamera.org/show_bug.c=
gi?id=3D214</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Joel<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; &gt; View/Reply Online (#197371): <a href=3D"https://lists.openem=
bedded.org/g/openembedded-core/message/197371" rel=3D"noreferrer" target=3D=
"_blank">https://lists.openembedded.org/g/openembedded-core/message/197371<=
/a><br>
&gt; &gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/m=
t/105047726/3617179" rel=3D"noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/mt/105047726/3617179</a><br>
&gt; &gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lis=
ts.openembedded.org" target=3D"_blank">openembedded-core+owner@lists.openem=
bedded.org</a><br>
&gt; &gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alexandre.b=
elloni@bootlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>]<br=
>
&gt; &gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Alexandre Belloni, co-owner and COO, Bootlin<br>
&gt; &gt; Embedded Linux and Kernel engineering<br>
&gt; &gt; <a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_bla=
nk">https://bootlin.com</a><br>
</blockquote></div>

--000000000000fcd48106145565e0--

