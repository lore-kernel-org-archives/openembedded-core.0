Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A23FC19F2B
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 16:56:21 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.22264.1658940973199244138
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 09:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112
 header.b=nqls7gmi;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.180,
 mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f180.google.com with SMTP id o21so13684942qkm.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 09:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=wSY6E+ZAie96L3Zy0vyQZzjepvJP+vTvjcRLk/jIz0M=;
        b=nqls7gmiK52fqkioptK32TGLXUHDBaUX+1CXDixb5cjRiyahc1hD9xenN0uWAnMica
         4/bB1L52iSAKVdoc0KUtAThK/W2GRRAYb82Kfll4IMSN+saec30P6qIrqfzggwS6MsuK
         XzxceB34623mriCfmHQIYH4kiqcBmoMk5bDkwj9+k7grQCU4QKJIfVV6CjBaKiyN8ifK
         QvZdhpqb+c1/gdzd47FMehal59/HPAKDwHwuXrcnSLJuKMgb5MNa8LIUmcJaQ9/4SzvP
         DWv8+Y5QMlmGFeesHG2UinwPckSiblc4MI2n7i41IQaKJlprNw58ERdcICOe6/727sX6
         wSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=wSY6E+ZAie96L3Zy0vyQZzjepvJP+vTvjcRLk/jIz0M=;
        b=0sVJzQyMEe3WaJBzWSpJAt5sJfnXBQIvS1U3StIrV3ONeMl8vOWv7oJheXoZakjMaZ
         oD/GJlrM9nEFhRemP9KoT7C1tEStUountFkFbhO3jT5znzx1YWVhWeKwNiZOO9y5uu1R
         rPTYRTSwk9ekid5bc0vNw9n3OmUE0aHF4lhBjyy6YOOU+RN6iJuNInaY5ydxnK4kY9kd
         eXXiTp6igShqmKnZFSxBzWxupfS9pkho/Ad69UDnToGhKznloPWJfxSfvLljJSWQHfaP
         UtgH55WUK0vUelBfclj7K569N4WUpbLNmJ6qNviezaDBTJuv68V0FEUgoGst8VyqDbCG
         vznA==
X-Gm-Message-State: AJIora/lCENUfQzPG0PUPX3A585ZjJOX5JI52ZZartDlVHa7kVSM8UM4
	hzw/Pzvqv3DWM38iq6CSJ4HageHcNxmWnAzI
X-Google-Smtp-Source: 
 AGRyM1sCVRCgd7O9JlpfQTZtElHmNIkTclm1y67FLtP/dIpVwGwWrav4hfGiBMzzoyOARHw/lIg8/w==
X-Received: by 2002:a05:620a:4905:b0:6b5:c742:6161 with SMTP id
 ed5-20020a05620a490500b006b5c7426161mr17384349qkb.107.1658940971786;
        Wed, 27 Jul 2022 09:56:11 -0700 (PDT)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com.
 [209.85.219.47])
        by smtp.gmail.com with ESMTPSA id
 bk4-20020a05620a1a0400b006b5fe4c333fsm13954718qkb.85.2022.07.27.09.56.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 09:56:11 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qv1-f47.google.com with SMTP id mh14so13341338qvb.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 09:56:11 -0700 (PDT)
X-Received: by 2002:a05:6214:27ec:b0:474:4ce:e7a4 with SMTP id
 jt12-20020a05621427ec00b0047404cee7a4mr20514701qvb.4.1658940970914; Wed, 27
 Jul 2022 09:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220727120036.633822-1-otavio@ossystems.com.br>
 <EC73E18E-0AA2-4655-8A53-EA278A198969@arm.com>
 <CAP9ODKpT6y0qvhryKm_NqTX82dmOytSU34yR_-8fG=WGZ06QNg@mail.gmail.com>
 <PA4PR08MB7411B7CCCEF2AF6FFB1EA063E8979@PA4PR08MB7411.eurprd08.prod.outlook.com>
 <CAP9ODKpo9=JeKvdEK+kX5_2gVWv4haSyU1jYgFLGcwPci8qMsQ@mail.gmail.com>
 <fb3e160b-4c49-f08a-716d-1ed69ecb3c00@gmail.com>
In-Reply-To: <fb3e160b-4c49-f08a-716d-1ed69ecb3c00@gmail.com>
Date: Wed, 27 Jul 2022 13:55:59 -0300
X-Gmail-Original-Message-ID: 
 <CAP9ODKq_i_BvaOQ4RXHe=ebU=7vgFV8-XxKtLgFYQRLOsEoWWw@mail.gmail.com>
Message-ID: 
 <CAP9ODKq_i_BvaOQ4RXHe=ebU=7vgFV8-XxKtLgFYQRLOsEoWWw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libusb1: Link with -latomic only if no atomic
 builtins
To: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>,
	"Purdie, Richard" <richard.purdie@linuxfoundation.org>,
	"otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004658fb05e4cc4be4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 16:56:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168580

--0000000000004658fb05e4cc4be4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sent :-)

Em qua., 27 de jul. de 2022 =C3=A0s 13:45, Khem Raj <raj.khem@gmail.com>
escreveu:

>
>
> On 7/27/22 12:41 PM, Otavio Salvador wrote:
> >
> >
> > Em qua., 27 de jul. de 2022 =C3=A0s 13:35, Ross Burton <ross.burton@arm=
.com
> > <mailto:ross.burton@arm.com>> escreveu:
> >
> >     Whoever adds the patch needs to add their S-o-b.
> >
> >
> > The patch sanity check should warn about it as it does for the status
> > header. I said, RP can add it.
>
> RP can do, but he can only do so much :) lets try to help him.
> Its not something that can be added during applying patch which could be
> done, this needs to change the libusb1 patch and then final patch
> regenerated, its better if it can be done by you and resend a v2.
>
> > --
> > Otavio Salvador                             O.S. Systems
> > http://www.ossystems.com.br <http://www.ossystems.com.br>
> > http://code.ossystems.com.br <http://code.ossystems.com.br>
> > Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168577):
> https://lists.openembedded.org/g/openembedded-core/message/168577
> Mute This Topic: https://lists.openembedded.org/mt/92647443/3617537
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> otavio.salvador@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--0000000000004658fb05e4cc4be4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sent :-)</div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">Em qua., 27 de jul. de 2022 =C3=A0s 13:45, Khem Ra=
j &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; escr=
eveu:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 7/27/22 12:41 PM, Otavio Salvador wrote:<br>
&gt; <br>
&gt; <br>
&gt; Em qua., 27 de jul. de 2022 =C3=A0s 13:35, Ross Burton &lt;<a href=3D"=
mailto:ross.burton@arm.com" target=3D"_blank">ross.burton@arm.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:ross.burton@arm.com" target=3D"_blank">ro=
ss.burton@arm.com</a>&gt;&gt; escreveu:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Whoever adds the patch needs to add their S-o-b.<br=
>
&gt; <br>
&gt; <br>
&gt; The patch sanity check should warn about it as it does for the status =
<br>
&gt; header. I said, RP can add it.<br>
<br>
RP can do, but he can only do so much :) lets try to help him.<br>
Its not something that can be added during applying patch which could be <b=
r>
done, this needs to change the libusb1 patch and then final patch <br>
regenerated, its better if it can be done by you and resend a v2.<br>
<br>
&gt; -- <br>
&gt; Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br>
&gt; <a href=3D"http://www.ossystems.com.br" rel=3D"noreferrer" target=3D"_=
blank">http://www.ossystems.com.br</a> &lt;<a href=3D"http://www.ossystems.=
com.br" rel=3D"noreferrer" target=3D"_blank">http://www.ossystems.com.br</a=
>&gt; <br>
&gt; <a href=3D"http://code.ossystems.com.br" rel=3D"noreferrer" target=3D"=
_blank">http://code.ossystems.com.br</a> &lt;<a href=3D"http://code.ossyste=
ms.com.br" rel=3D"noreferrer" target=3D"_blank">http://code.ossystems.com.b=
r</a>&gt;<br>
&gt; Mobile: +55 (53) 9 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile:=
 +1 (347) 903-9750<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#168577): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/168577" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/168577</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92647443/3617=
537" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92647443/3617537</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:otavio.salvador@gmail.com"=
 target=3D"_blank">otavio.salvador@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Sys=
tems<br><a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://ww=
w.ossystems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.os=
systems.com.br" target=3D"_blank">http://code.ossystems.com.br</a><br>Mobil=
e: +55 (53) 9 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: +1 (347) =
903-9750</div>

--0000000000004658fb05e4cc4be4--

