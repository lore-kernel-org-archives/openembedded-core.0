Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4564FC02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 16:15:58 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.19982.1739376950362736021
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 08:15:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=kUP4XFR3;
 spf=pass (domain: smile.fr, ip: 209.85.218.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ab7f860a9c6so140177266b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 08:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739376949; x=1739981749; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/mqGyNXpTaQPAXyu62ByKcSD3uSEO8lU9XbqQNp+6T4=;
        b=kUP4XFR36O7NqGxWng6GKPVrxY7zY+cK1zhkwsd3Akg4Yyq+98IVUz+NVMgCrAWM1z
         RagKhA7lkPCZHCua1467B6Zsy6TwOVcuBUfBWTALfmLjsKvlQkyNVIAGzLm+2PjNoPf/
         t+5Gat80rJPNAAJkcDAbWRuzNKEV78unm2JUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739376949; x=1739981749;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/mqGyNXpTaQPAXyu62ByKcSD3uSEO8lU9XbqQNp+6T4=;
        b=LhI+8l5V59fqxTTAi/qXMWaEDkUHDAA7Cj6H6x+fA3YbGfp5i1JfOOScHF55uDB2lL
         xQJkBwP9vJGx5I/i5/9IpeRa7CX2cYEW80OR9lsAakWCTgsPUoM6lU0CVqvVNMJbDoaU
         UXvFzZyElTxy6JAcR7hJ2TZCCpfmmZf76RzebvQZAPqp8vn/I+jBkfCxYt5aSTDpALYd
         cq79DAEFjnOV0X6E/LacxQZVic+Ur5dwNOcH7MOikkIPAs6Is8RjqXEZXvPEQRVhGoOY
         KIz81hSmdEZ8e2mNu5rrvwMilC+4+ovbYMh6WtxuFRLAAsb1Xq9Qf7nR4+eUfs/UczmU
         aNig==
X-Gm-Message-State: AOJu0YwisjwdZvuAQPMWFWE6Vgu1L2tgTlojsSARUts0L708bcVKOQTP
	2rxH7JJQZ1S6/pnasuFSDe8HOi+OpNRHICbprw7b8WFf1UeLE3CNHDd+svrklYqU5vm6s90rx8i
	g6XuuIX7dvQ+8pLQnpBuAlHVKLV4unIMYn6xtWg==
X-Gm-Gg: ASbGncvceVB0enurB3ALK0d2DNNerEcecwViBmBIvWi3IadrW58unMdYk7qdX57XmhY
	88X6bAdsgjF4tcZgDIs7BISDlk4rVT9iBKidp/6K9fBFAbgc69q4wGEV+ZwQAuraq6xoOBK7Wco
	Jo6kb31uVDwlB5yIIvou1xE0lFD8ZZh0g=
X-Google-Smtp-Source: AGHT+IGvnmlRuihWE6SYEm2eDiWC/PQHsg9C3ff8y1pYKTPyC+RzafYmkDmWhrjT5MxJXDZxRg/085XNksK2DxrNcAE=
X-Received: by 2002:a17:907:2d10:b0:ab7:c6f4:9522 with SMTP id
 a640c23a62f3a-ab7f334ac0cmr375416666b.9.1739376948617; Wed, 12 Feb 2025
 08:15:48 -0800 (PST)
MIME-Version: 1.0
References: <20250212155404.76504-1-Sven.Kalmbach@loewensteinmedical.com> <27034.1739375710678980238@lists.openembedded.org>
In-Reply-To: <27034.1739375710678980238@lists.openembedded.org>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 12 Feb 2025 17:15:21 +0100
X-Gm-Features: AWEUYZmDa5C5o1CCmCO0C3hL9nOgIdRm-OxZ5BuuLKEzxrVLD_1uuKf4EFIkbVs
Message-ID: <CAMSfU+7KHHSKFndiGnqjSkyMRWW63nHJvkKhRnp6csGq0PFPaQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Fixes [YOCTO 15731]
To: sven.kalmbach@loewensteinmedical.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000273f0b062df4415f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 16:15:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211257

--000000000000273f0b062df4415f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 12 f=C3=A9vr. 2025 =C3=A0 16:55, Sven Kalmbach via lists.openembedd=
ed.org
<sven.kalmbach=3Dloewensteinmedical.com@lists.openembedded.org> a =C3=A9cri=
t :

> Does that work? I found a workaround to use git send-email
>

Yes, your patch does apply cleanly now.

Thanks for seeing it through from bug report to patch sending :-)

As Alex wrote, you still need to change the commit title but you are on the
right tracks.


> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211253):
> https://lists.openembedded.org/g/openembedded-core/message/211253
> Mute This Topic: https://lists.openembedded.org/mt/111143606/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS - Tech expert

--000000000000273f0b062df4415f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0mer. 12 f=C3=A9v=
r. 2025 =C3=A0=C2=A016:55, Sven Kalmbach via <a href=3D"http://lists.openem=
bedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;sven.kalmbach=
=3D<a href=3D"mailto:loewensteinmedical.com@lists.openembedded.org" target=
=3D"_blank">loewensteinmedical.com@lists.openembedded.org</a>&gt; a =C3=A9c=
rit=C2=A0:</div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div>Does that work? I found a workaround to use git send=
-email</div></blockquote><div><br></div><div>Yes, your patch does apply cle=
anly now.</div><div><br></div><div>Thanks for seeing it through from bug re=
port to patch sending :-)</div><div><br></div><div>As Alex wrote, you still=
 need to change the commit title but you are on the right tracks.</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#211253): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/211253" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/211253</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111143606/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/111143606/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS - Tech expert<br></font></div></div><=
/div></div>
</div>

--000000000000273f0b062df4415f--

