Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B24E7C3ABD8
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 17:19:16 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.18917.1747415952184560887
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 May 2025 10:19:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EqJiGWUG;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c5b8d13f73so275704585a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 10:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747415951; x=1748020751; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lws62SPclx8rgtCPsVVadfonAVhGHHdkOlA5a7EmB5A=;
        b=EqJiGWUGyhVELkptUSrUq9pL6/BxqgrDymtzmDoYsRXYaIDBvJJgMNCdphDyCsZjR0
         thcQZG6oFmRaps+ey3fOUAy+gOVOvLXy5lLX3JpWMFhlz3AlTUtkGDZ54WhTy6ee2K4n
         ETuzgJNS4lsxRd0E+YuPegraORKVtayaAIpLe9sZAN3xUg6I9ATTj6LOIk7nmwGBpGdu
         jAkVk3rfmZXJBmkqFrzrpp8ntC5vHh7YeWqAwp5zj6xGRSIMD9508Zxy6CLD8Ui0D0FN
         nsuplStcQlrP+NTIVVxbEeSK9RQtaKbua3zkdf+FKPzEkf+gXHrggcCgRhF6gJkhkd5s
         +ceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747415951; x=1748020751;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lws62SPclx8rgtCPsVVadfonAVhGHHdkOlA5a7EmB5A=;
        b=Nnvb++ACguCmiLlMYgrqDCkcVSVOxhzxrmqeWzRloYbFR0Nie/cYP9VZm4IbyUhC66
         8VV8B5sgN1YDdhNq+LommEOHU+lPj5NzYhXHctNbL+jsNQamnz3X2b6Cj5b6HQ94arxc
         RwtXn3OPeinQf2dC4Ifk6zx56JKD/ZJE7l8lC4vAnRRsA+vxUOD72HFYe3UNDnxrniba
         00/bfU3IQbR/iS4TcxCgupRjSddB0FTkGADWjNpBwBQwvviOyiZa4lGcEZmNEnfS8lH2
         fVhMNa008RPelY4pynd8EMXFDMdbu5pBxJ0hfBqJlfHxVC+IxbTNBR+9SxuwZs5c3aFf
         JWTw==
X-Gm-Message-State: AOJu0Yw26sCrh7AzOHujxFGiAnR5FHGmcz5rp90edFKa09NtWLkoP1wH
	guB97en6ptQi5HEWjFKKMMmRthAtZ0h46zXXUhZhuTiZPMSpOvlZBe+oFhr2rWRt6sDV0EDeNLv
	AxtlTRdzERMZrcbsZQ+cAF2+691K6Vw0=
X-Gm-Gg: ASbGncv7XGLJ1t48c+MYQUPC81OEm0DA9bk0XvMfve2sIo1Z71hWxy1HWwJhP9grrTd
	g3aDP+BsC3Rf29qR0mKdcqJusEE/qiIeWS9gBd/h1jjROvud/JzXWpESZ+79SryAdkDdSRkBpre
	Lqz0/ZZA1v4hTPpEdGfnkze72jOsR2bjAusiA+nBtboyfLBx3B9wmBFy1ACivKRb+yJQ==
X-Google-Smtp-Source: AGHT+IHjZxE0eTioUp9DDZWWhIQbXKUllX9OyoHHzkmh9RPhKlQLYXTb85EmPU6er74e5/5ii6IJr9D3WypcJz69xlA=
X-Received: by 2002:a05:620a:459f:b0:7cd:31ca:d81 with SMTP id
 af79cd13be357-7cd4673b9e8mr517663685a.27.1747415950876; Fri, 16 May 2025
 10:19:10 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj8WRTH0He_BcxPt4q5VeHHkG8qyTFHfKL-_LGiuYstxVw@mail.gmail.com>
 <13420.1747413559731422430@lists.openembedded.org>
In-Reply-To: <13420.1747413559731422430@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 16 May 2025 19:19:00 +0200
X-Gm-Features: AX0GCFtT056i4q8eQ-S9H8k1bjy9KI3RzC2bCK5y48FkpTfZIJ_yBD-ml3myKUs
Message-ID: <CANNYZj_L16xr8rTpsghREB6PmEE549BKZjPE4zLdszGbx2fpNw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] cargo.bbclass: allow to avoid appending PACKAGECONFIG_CONFARGS
To: anton.antonov@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000006e4f7063543fb33"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 17:19:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216760

--00000000000006e4f7063543fb33
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Can you put =E2=80=94features directly into packageconfig definitions? Does=
 cargo
accept multiple =E2=80=94features flags?

Alex

On Fri 16. May 2025 at 18.39, Anton Antonov via lists.openembedded.org
<anton.antonov=3Darm.com@lists.openembedded.org> wrote:

> On Fri, May 16, 2025 at 08:55 AM, Alexander Kanavin wrote:
>
> If you need to supply these
> arguments some other way, then you can follow for example mesa.inc and
> define empty PACKAGECONFIGS:
>
> PACKAGECONFIG[amd] =3D ""
> PACKAGECONFIG[svga] =3D ""
> PACKAGECONFIG[virgl] =3D ""
>
> And then use them to form a custom variable, which you can use as you see
> fit:
>
> GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
> 'gallium-llvm', '${GALLIUMDRIVERS_LLVM}', '', d)}"
> GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'amd',
> ',r600', '', d)}"
>
>   I think using PACKAGECONFIG to define cargo features list is a normal
> use-case in rust based recipes. With this change is not easily achievable
> because ${PACKAGECONFIG_CONFARGS} is unquoted in cargo.bbclass and we can=
't
> use it with CARGO_BUILD_FLAGS +=3D " --features" if there are more than o=
ne
> feature.
>   So, if the change is not going to be reverted then we realistically hav=
e
> two options - either complicate the recipes with a lot of conditions like
> you suggest or just add a comment that oe_cargo_build() is broken in
> cargo.bbclass and define our own do_compile()
>
> Anton
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216759):
> https://lists.openembedded.org/g/openembedded-core/message/216759
> Mute This Topic: https://lists.openembedded.org/mt/111812482/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000006e4f7063543fb33
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Can you put =E2=80=94features directly into packageconfig=
 definitions? Does cargo accept multiple =E2=80=94features flags?</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"=
gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Fri 16. May 2025 at 18.39, Anton Antonov via <a href=3D"http://lists.opene=
mbedded.org">lists.openembedded.org</a> &lt;anton.antonov=3D<a href=3D"mail=
to:arm.com@lists.openembedded.org">arm.com@lists.openembedded.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bord=
er-left-color:rgb(204,204,204)"><div>On Fri, May 16, 2025 at 08:55 AM, Alex=
ander Kanavin wrote:</div>
<div>
<blockquote>If you need to supply these<br>arguments some other way, then y=
ou can follow for example mesa.inc and<br>define empty PACKAGECONFIGS:<br><=
br>PACKAGECONFIG[amd] =3D &quot;&quot;<br>PACKAGECONFIG[svga] =3D &quot;&qu=
ot;<br>PACKAGECONFIG[virgl] =3D &quot;&quot;<br><br>And then use them to fo=
rm a custom variable, which you can use as you see fit:<br><br>GALLIUMDRIVE=
RS:append =3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#39;,<br>&#39;g=
allium-llvm&#39;, &#39;${GALLIUMDRIVERS_LLVM}&#39;, &#39;&#39;, d)}&quot;<b=
r>GALLIUMDRIVERS:append =3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#=
39;, &#39;amd&#39;,<br>&#39;,r600&#39;, &#39;&#39;, d)}&quot;</blockquote>
</div>
<div>=C2=A0 I think using PACKAGECONFIG to define cargo features list is a =
normal use-case in rust based recipes. With this change is not easily achie=
vable because ${PACKAGECONFIG_CONFARGS} is unquoted in cargo.bbclass and we=
 can&#39;t use it with CARGO_BUILD_FLAGS +=3D &quot; --features&quot; if th=
ere are more than one feature.<br>=C2=A0 So, if the change is not going to =
be reverted then we realistically have two options - either complicate the =
recipes with a lot of conditions like you suggest or just add a comment tha=
t oe_cargo_build() is broken in cargo.bbclass and define our own do_compile=
()<br><br></div>
<div>Anton</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#216759): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/216759" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/216759</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111812482/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/111812482/1686489</a><br>
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

--00000000000006e4f7063543fb33--

