Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 064D4C25B74
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 14:19:19 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.15175.1715869153171878125
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 07:19:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LqKv6wTw;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: quaresma.jose@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3c9a604e367so147144b6e.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 07:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715869152; x=1716473952; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BqYa8TfwathWY3Nxpv4KU0D/qgoLN3La3hWRkikzBQg=;
        b=LqKv6wTwpwv2L02N4JbV+pq+PNK/ug+K/kr7Qwf982nVWbAnic39ih71TUFvfjJ/8k
         WqJpP6DyD2qhhaHPAUsTl1Uei5DeB4F+2fkp0ktpd1J9BpsMuhpRS1y9fAxW24QOwt75
         MA8W7tRZ+QAf3g+cCnpPdzAyxdmYZolv5wKK83KtJ/ick7k1r4oHH8iXbtws5c8mHZXG
         w3zvL+jLZmsKRl1kZm6g3FNJ+JuyBnsd3oU5dDRVBvpxNRmBHoqRbmdSfSqVuCdQhnK/
         RgjLuOubURo+GwLjl1mBPEJtnToUIgtBWQSjQzHx5bhKFDhvwi+uM6ryHueDlJjRZRqj
         r4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715869152; x=1716473952;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BqYa8TfwathWY3Nxpv4KU0D/qgoLN3La3hWRkikzBQg=;
        b=ujMnkyuA6enP2b7dDw7m4yTTLOn4w7gpR5A0MifZAubeLkP8GnBR+h5avBsvY0LMLB
         Itn3jcrncZ2qWy6TLjPTgJXy7dOYTD06GerQyiWt99MUOSJ4YbympOd085IBesPRB6pY
         irGUo2VWywdV3ThL9m5bh4D66rhyiYu5xsQeDONjVSV0TGTumPPTiMqG0jFItDhXguCY
         ZS7rDTpAspSaHHePi5mGfy2Yxy8Wikh0g3zK7HBJE+4WoByAIwOH3fCt83A+vm9MmXYo
         aUAk6m7dsLqvit51k+sl2R5qQhYyP4U305Wt3aGt4LlonTqwF6Kyz02Igpw/lyJYyBJB
         q05g==
X-Forwarded-Encrypted: i=1; AJvYcCUEmJwwjDqey62FhL7YQX+uygxngtdztAtBSKrY4++OaLj4aqU4iuEMmUAmZQs4oIZWZ1coqs+0a/NAW9cBq0gooeHm4JRqmOFyzzZueM6Qc9y2I+Q+fXrg
X-Gm-Message-State: AOJu0YyMplo43ckI9KKADxh+fz8w8l1yGOSpH9rFhwCSEioNYNBUl6Ty
	iUy+rfP0GVhR482ooZjXNBsJLonN+l5OKHAcIP6CCC9ZLG4l0xomjtzPfJY3p5Yt2Eqd21+sDTT
	U27Fbr/lGi8TrM2OvcZU7uEnNClHZAyse4QI=
X-Google-Smtp-Source: AGHT+IGbreOMiIEcHTF+jmYh68ajXLHfbau9zxWmDnhcHG/09qz0hZJGEYQOlqQTdsO4gRlKITihclhzJC1MkMJaPus=
X-Received: by 2002:aca:1318:0:b0:3c9:710a:89dd with SMTP id
 5614622812f47-3c9970b9bfcmr18752141b6e.38.1715869148928; Thu, 16 May 2024
 07:19:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAApg2=SACqdG_g=2LUj1=-ECJY20p=r8RoPTag-if-kpo0ozQg@mail.gmail.com>
In-Reply-To: <CAApg2=SACqdG_g=2LUj1=-ECJY20p=r8RoPTag-if-kpo0ozQg@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 16 May 2024 15:18:57 +0100
Message-ID: <CANPvuRmgNHJzS0US2a_jC5dtpXO7O5cYFgb5LvPQUuT5PnsnBg@mail.gmail.com>
Subject: Re: [yocto-security] CVE status for scathgap on 2024-05-16 and ask
 for help
To: rybczynska@gmail.com
Cc: yocto-security@lists.yoctoproject.org, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Steve Sakoman <steve@sakoman.com>, 
	liezhi.yang@windriver.com, wangmy@fujitsu.com, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000001a6761061892eb58"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 14:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199490

--0000000000001a6761061892eb58
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Marta Rybczynska via lists.yoctoproject.org <rybczynska=3D
gmail.com@lists.yoctoproject.org> escreveu (quinta, 16/05/2024 =C3=A0(s) 14=
:20):

> Hello all,
> The prototype CVE check via the MITRE database is giving the following fo=
r
> scathgap today (adding maintainers of affected packages in copy):
>
> CVE-2024-32002.json: affected: git 2.44.0
> CVE-2024-32004.json: affected: git 2.44.0
> CVE-2024-32020.json: affected: git 2.44.0
> CVE-2024-32021.json: affected: git 2.44.0
> CVE-2024-3205.json: affected: libyaml 0.2.5
> CVE-2024-32465.json: affected: git 2.44.0
> CVE-2024-33599.json: affected glibc 2.39
> CVE-2024-33600.json: affected: glibc 2.39
> CVE-2024-33601.json: affected: glibc 2.39
> CVE-2024-33602.json: affected: glibc 2.39
>
> I would also like to ask for volunteers to help with looking up the
> following CVEs and submitting fixes to
> https://github.com/mrybczyn/cvelistV5-overrides/tree/overrides if they
> are malformed:
> go: CVE-2024-24788, CVE=3D2024-24787
>

All the golang was fixed in today bump to 1.22.3
https://patchwork.yoctoproject.org/project/oe-core/patch/20240516102322.301=
064-1-jose.quaresma@foundries.io/

Anyway the CVE-2024-24787 only affects the Apple people on Darwin.

Jose

aiohttp: CVE-2024-30251
> x server: CVE-2024-31053, CVE-2024-31082
> bluez: CVE-2023-27349, CVE-2023-50229, CVE-2023-50230
> gstreamer: CVE-2023-50186, CVE-2023-44446
> less: CVE-2024-32407
> ncurses: CVE-2023-45988
> ofono: CVE-2023-4234, CVE-2023-4233
>
> If you have any question on how to do that, ask me.
>
> Kind regards,
> Marta
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#1166):
> https://lists.yoctoproject.org/g/yocto-security/message/1166
> Mute This Topic: https://lists.yoctoproject.org/mt/106134183/5052612
> Group Owner: yocto-security+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/yocto-security/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000001a6761061892eb58
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Marta Rybczynska via <a href=3D"http:=
//lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;rybczynska=3D<a hr=
ef=3D"mailto:gmail.com@lists.yoctoproject.org">gmail.com@lists.yoctoproject=
.org</a>&gt; escreveu (quinta, 16/05/2024 =C3=A0(s) 14:20):<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hello all=
,</div><div>The prototype CVE check via the MITRE database is giving the fo=
llowing for scathgap today (adding maintainers of affected packages in copy=
):<br></div><div><br></div><div>CVE-2024-32002.json: affected: git 2.44.0<b=
r>CVE-2024-32004.json: affected: git 2.44.0<br>CVE-2024-32020.json: affecte=
d: git 2.44.0<br>CVE-2024-32021.json: affected: git 2.44.0<br>CVE-2024-3205=
.json: affected: libyaml 0.2.5<br>CVE-2024-32465.json: affected: git 2.44.0=
<br>CVE-2024-33599.json: affected glibc 2.39<br>CVE-2024-33600.json: affect=
ed: glibc 2.39<br>CVE-2024-33601.json: affected: glibc 2.39<br>CVE-2024-336=
02.json: affected: glibc 2.39</div><div><br></div><div>I would also like to=
 ask for volunteers to help with looking up the following CVEs and submitti=
ng fixes to <a href=3D"https://github.com/mrybczyn/cvelistV5-overrides/tree=
/overrides" target=3D"_blank">https://github.com/mrybczyn/cvelistV5-overrid=
es/tree/overrides</a> if they are malformed:</div><div>go: CVE-2024-24788, =
CVE=3D2024-24787</div></div></blockquote><div><br>All the golang was fixed =
in today bump to 1.22.3=C2=A0<br><a href=3D"https://patchwork.yoctoproject.=
org/project/oe-core/patch/20240516102322.301064-1-jose.quaresma@foundries.i=
o/">https://patchwork.yoctoproject.org/project/oe-core/patch/20240516102322=
.301064-1-jose.quaresma@foundries.io/</a><br><br>Anyway the CVE-2024-24787 =
only affects the Apple people on=C2=A0<span style=3D"color:rgb(51,51,51);fo=
nt-family:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;font-size:1=
4px">Darwin.<br></span><br>Jose</div><div><br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div dir=3D"ltr"><div>aiohttp: CVE-2024-30251</d=
iv><div>x server: CVE-2024-31053, CVE-2024-31082</div><div>bluez: CVE-2023-=
27349, CVE-2023-50229, CVE-2023-50230</div><div>gstreamer: CVE-2023-50186, =
CVE-2023-44446</div><div>less: CVE-2024-32407</div><div>ncurses: CVE-2023-4=
5988</div><div>ofono: CVE-2023-4234, CVE-2023-4233</div><div><br></div><div=
>If you have any <span style=3D"background:none">question</span> on how to =
do that, ask me.</div><div><br></div><div>Kind regards,</div><div>Marta<br>=
</div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#1166): <a href=3D"https://lists.yoctoproject.org/g/yoct=
o-security/message/1166" rel=3D"noreferrer" target=3D"_blank">https://lists=
.yoctoproject.org/g/yocto-security/message/1166</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/106134183/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/106134183/5052612</a><br>
Group Owner: <a href=3D"mailto:yocto-security%2Bowner@lists.yoctoproject.or=
g" target=3D"_blank">yocto-security+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/yocto-security/uns=
ub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/y=
octo-security/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" target=
=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--0000000000001a6761061892eb58--

