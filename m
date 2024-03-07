Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3415BC54798
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 16:41:11 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.28218.1709829665934240714
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 08:41:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bcLaR3Ff;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5131f3fc695so1179166e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 08:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709829664; x=1710434464; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T54LqgFMS5AQ1+2O3CsoSw4QYAS3RaKSTYa64EtIGYs=;
        b=bcLaR3FfCfom2anCk4M3PYk55nSgQBtbHsCBwfxvcw8cz4mFYkC1yIkqlvCidjZYlQ
         qk4PmqjAiPu/dETxhEqp8vkZSxi4XCosmlF3TcWmmrFolEitOa3kfrKrGnPV54SfezWh
         +mQxuM71pzA41KQd37hGrdoKAQnOB/e7rXp7xxs32BL119RZ8DyW+Z+yQbVKi192OvLn
         a5BQ8d2NppsKD7M/ra9Kn7EwINvUL9Bn4swRZSWHL/xIDY3tn3lsndIAGhjIznLhMNu7
         nIH9kemSY7uPulDMTdlOHli56GAHlDBxbpVUvwoc6YT2eHPRR94zHGPM+Q90hsmeRBMu
         mI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709829664; x=1710434464;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T54LqgFMS5AQ1+2O3CsoSw4QYAS3RaKSTYa64EtIGYs=;
        b=iWzhazm5isO/kWz4bB3YAHER/2S+p3AmH6rtwvzIdOEbvwQy/nQJCZtmsIlAa2tLHA
         UaA/9LtDHzBKRflAiYGJMQMWJrB7sxWCeWcrB8T8rqgaqdn9JKEkjkkNsMHthVYx4IbH
         hVn31AODMYFEy5AML/n/dTCRVzc8P9F+FwnoTQjzv1v8a9o2JinvuHgT1su4lSLd/jyt
         u3irFDfRbRBCjopL3b0mxluBjoc89jraBtKNjQCxdkyHqYHmq1WiUtcPmDscvDC8r8qn
         CPMVTv/D0ph6s1e4yibZbdAZXf/4VL0O8EU5MFByA/aaWvp9kaEFi9WEw3u8SIjQ2QSl
         nPWQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/j2Rk183QZFZbx85h6lOP9D089kTqKjxrCS1NZBXBtl2Uh+EK73tCuXTBLgJkzVdcoFt2x31YpI9wuhvqu+qWCrQVP6kpCqFGHD1Z4UewkrhDClTfZ3C5
X-Gm-Message-State: AOJu0YyfsSqf+xhmIct4ycDZoiawi1CckzQYvdg2gJlDqWo0TMCs1mtj
	NSc7GucC/vj2GPgUXcsQvMVNENkspkDRpV/L1gUqw1Oy8spxAP014Ht3MBycC9niYY5KAC1nUiX
	JhGGkVvtLjJ7XF0wDwTZqVKuAlsU=
X-Google-Smtp-Source: AGHT+IGGrCGSxjtQOqwKM2dQkfGY7PsDiOZGyTKLm08KRVA/ACK9tX4FEDJ9kaJyCOgsBxQrHDiy/H+cN+TM2HeS5cY=
X-Received: by 2002:a05:6512:3b9f:b0:512:a4ce:abaa with SMTP id
 g31-20020a0565123b9f00b00512a4ceabaamr2445631lfv.48.1709829663805; Thu, 07
 Mar 2024 08:41:03 -0800 (PST)
MIME-Version: 1.0
References: <20240307134316.3047342-1-tom.hochstein@nxp.com>
 <CANNYZj8G27VbzzQ8Ab7LK77YrEQsxR0roL8Ci2GbkgicdGiA=Q@mail.gmail.com> <CAP9ODKp8fgFQTXODhPuD0PNcvi4aDOcCbSLz_fPNbR4BM=yKFQ@mail.gmail.com>
In-Reply-To: <CAP9ODKp8fgFQTXODhPuD0PNcvi4aDOcCbSLz_fPNbR4BM=yKFQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 7 Mar 2024 17:40:51 +0100
Message-ID: <CANNYZj_qmw9LrkKfuYpXr6EQiNTHarBpu3x6S4o_-4qZeDqqAw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] bmaptool: Add bmap-tools runtime alias for compatibility
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>, Tom Hochstein <tom.hochstein@nxp.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000bcd7cc061314bdca"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 16:41:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196806

--000000000000bcd7cc061314bdca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Is it? Why? There=E2=80=99s plenty of recipes in core  that don=E2=80=99t d=
o it. Package
managers resolvers are able to figure out that one package needs to be
replaced with another.

Alex

On Thu 7. Mar 2024 at 17.17, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

>
>
> Em qui., 7 de mar. de 2024 =C3=A0s 13:14, Alexander Kanavin <
> alex.kanavin@gmail.com> escreveu:
>
>> On Thu, 7 Mar 2024 at 14:43, Tom Hochstein <tom.hochstein@nxp.com> wrote=
:
>> > +# For compatibility with layers before scarthgap
>> > +RPROVIDES:${PN} =3D "bmap-tools"
>> > +RREPLACES:${PN} =3D "bmap-tools"
>> > +RCONFLICTS:${PN} =3D "bmap-tools"
>>
>> Only RREPLACES/RCONFLICTS please. Do not add the obsolete RPROVIDES.
>>
>
> For package feed upgrade it is required.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196805):
> https://lists.openembedded.org/g/openembedded-core/message/196805
> Mute This Topic: https://lists.openembedded.org/mt/104787184/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000bcd7cc061314bdca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Is it? Why? There=E2=80=99s plenty of recipes in core =C2=
=A0that don=E2=80=99t do it. Package managers resolvers are able to figure =
out that one package needs to be replaced with another.</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Thu 7. Mar 2024 at 17.17, Otavi=
o Salvador &lt;<a href=3D"mailto:otavio.salvador@ossystems.com.br">otavio.s=
alvador@ossystems.com.br</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left=
-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><div dir=
=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Em qui., 7 de mar. de 2024 =C3=A0s 13:14, Ale=
xander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_bla=
nk">alex.kanavin@gmail.com</a>&gt; escreveu:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border=
-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">On T=
hu, 7 Mar 2024 at 14:43, Tom Hochstein &lt;<a href=3D"mailto:tom.hochstein@=
nxp.com" target=3D"_blank">tom.hochstein@nxp.com</a>&gt; wrote:<br>
&gt; +# For compatibility with layers before scarthgap<br>
&gt; +RPROVIDES:${PN} =3D &quot;bmap-tools&quot;<br>
&gt; +RREPLACES:${PN} =3D &quot;bmap-tools&quot;<br>
&gt; +RCONFLICTS:${PN} =3D &quot;bmap-tools&quot;<br>
<br>
Only RREPLACES/RCONFLICTS please. Do not add the obsolete RPROVIDES.<br></b=
lockquote><div><br></div><div>For package feed upgrade it is required.</div=
><div>=C2=A0</div></div><span class=3D"gmail_signature_prefix">-- </span><b=
r><div dir=3D"ltr" class=3D"gmail_signature">Otavio Salvador =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 O.S. Systems<br><a href=3D"http://www.ossystems.com.br" target=
=3D"_blank">http://www.ossystems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a h=
ref=3D"http://code.ossystems.com.br" target=3D"_blank">http://code.ossystem=
s.com.br</a><br>Mobile: +55 (53) 9 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0Mobile: +1 (347) 903-9750</div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#196805): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/196805" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/196805</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104787184/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/104787184/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000bcd7cc061314bdca--

