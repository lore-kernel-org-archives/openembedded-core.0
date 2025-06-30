Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 325C2C8302D
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 13:06:00 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.40063.1751288753733891090
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 06:05:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NUWJXnUw;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so2526160f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 06:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1751288752; x=1751893552; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jXjiu+JT+OOuUt2kbEiJVRXYPSf0Mo5lNDrf6kCw/Y0=;
        b=NUWJXnUwfjS5aflMrX+rBi1OHdIWIeaOwbOThJ0eIYLrBL/Hl70wot1UHQe7B5nJjO
         GcI0ZFQB4C4x/ISrZH681B8wZJMCq0HPeLjc1ZRkt9rOpTf3zUTgPVHgytC6x7m/xMi0
         zVpnmtdbRDT48YiVPAk6xWOpQmMU414j2IJ0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288752; x=1751893552;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jXjiu+JT+OOuUt2kbEiJVRXYPSf0Mo5lNDrf6kCw/Y0=;
        b=wWyY1EWrDNK/Jv1og+q7IKWasm6QC1RwTcQnXif/phHDDyECYdap60nT1K9b6es3LO
         FM5UOGX6v0NXywTl4oyR+c6JAwgwV2OqBF4nFWblxQwLcssZctVQj+zR9Of9P9FyF/4g
         d+W5/fDTl8AIetw0KKWwFF0APepskAdzX0/SGTJ0FgB0R4EhStuCtVcs41Aw7gXYUYWg
         hyhmmX2XEfZqgwBq9L9AAyd4oJXa0O7EGeFvRICXy03rbTG/mNjEAbq9r1B0NFp4R5ui
         066x5LN5WrmVfJHVM/X7tPziss6AMrZ9oAh8Swl/EqMfIFE+stEJEYwJFkYNuHNPwUe1
         14Cw==
X-Forwarded-Encrypted: i=1; AJvYcCXfCabr4IqCtUg1+gozDYYxxx6Nwp4/h7BDBDgUTBRplXaiGO+wCOyrx3GkyIZvtNxTIyztoEilwweHYPvUuOAgGw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx5tsoSn72w28xu3Y7BZ+WAQzQlLWFqW+J+09bQO2RX5VPQZQfL
	/YbwoI66NVUKFZarxwKlHqithbWEpvXFTYgPXVcIP6hL8IFXSzbATy7u0cHH1oAP1E6DaIBeFky
	eKyGumnBdVyXxYkgcEeOba32px5H0bD0zt+c5puxLPg==
X-Gm-Gg: ASbGncvsHIXsQZZHRiPTGENpwN2i1hbyGgQFpIYH5AvQweWV5osacbOmomHKhBPjF3y
	Lz5SCq3BZ4JdP/T9Pqt4anEAnvG7BONiilAfZzzj6CZqrF//cQdTPBeisJq3H4oZBwZ+2U8kvEV
	FYz36O52hbibdbseKsSjGjX8okS7lR44Gec9SDTyeZej/f26hWsiBTYueWyMkfl5pUXzFdGcw7F
	xgYQQ==
X-Google-Smtp-Source: AGHT+IF7a36up867/xGlnvV6jP8uDhM7Me4TE1hd9j0lOqAUyDwDf++qn2WRgJvBezKcb48Whq0SWsOxtHJwUhNa0vg=
X-Received: by 2002:adf:b64f:0:b0:3a4:ec32:e4da with SMTP id
 ffacd0b85a97d-3a8fe1dde28mr9767065f8f.15.1751288751692; Mon, 30 Jun 2025
 06:05:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250630104104.4093207-1-Moritz.Haase@bmw.de> <20250630104104.4093207-4-Moritz.Haase@bmw.de>
 <CAMSfU+7WhC+=fKu8kGOSiqH2cnRqisJy90ZBMcUB27NYiCPesg@mail.gmail.com> <CANNYZj99OZz_zK=vhei1N5rwbrU3QsCTWM963NpUx6t_O6uTsA@mail.gmail.com>
In-Reply-To: <CANNYZj99OZz_zK=vhei1N5rwbrU3QsCTWM963NpUx6t_O6uTsA@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Mon, 30 Jun 2025 15:05:25 +0200
X-Gm-Features: Ac12FXznOHlTqVemRTOOqmCxONQRp2j9uNfKpWKOANEnzMq7FTKVVcDtdOZO7_Q
Message-ID: <CAMSfU+44WYQhz8Qhc0SxOOzMBEAkpBvd=WrZN=wn-qitkyO9_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 3/3] cmake: upgrade 3.31.6 -> 4.0.3
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Moritz.Haase@bmw.de, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f1b6100638c9af15"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 13:06:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219517

--000000000000f1b6100638c9af15
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 30 juin 2025 =C3=A0 13:05, Alexander Kanavin <alex.kanavin@gmail.co=
m> a
=C3=A9crit :

> On Mon, 30 Jun 2025 at 12:51, Yoann Congal <yoann.congal@smile.fr> wrote:
> > Out of curiosity (because we will soon find out), do we know how much o=
f
> meta-openembedded does "Compatibility with versions of CMake older than 3=
.5
> has been removed" break?
>
> I do not think this is a fair question, and it is asked too soon
> indeed. It implies that the submitter should set up an (extremely
> heavy) world build with all of meta-oe, and possibly makes them
> obliged to fix the fallout. Neither is expected from Moritz, just to
> be clear.
>

Oh! Sorry I wasn't clearer!
I was not expecting that from Moritz as well : Neither the world build nor
the fixes for the inevitable fallout.
I have nothing against the patch.
I'll try to be more cautious next time.


>
> Alex
>


--=20
Yoann Congal
Smile ECS

--000000000000f1b6100638c9af15
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 30=
 juin 2025 =C3=A0=C2=A013:05, Alexander Kanavin &lt;<a href=3D"mailto:alex.=
kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, 30 Jun 2025 a=
t 12:51, Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" target=
=3D"_blank">yoann.congal@smile.fr</a>&gt; wrote:<br>
&gt; Out of curiosity (because we will soon find out), do we know how much =
of meta-openembedded does &quot;Compatibility with versions of CMake older =
than 3.5 has been removed&quot; break?<br>
<br>
I do not think this is a fair question, and it is asked too soon<br>
indeed. It implies that the submitter should set up an (extremely<br>
heavy) world build with all of meta-oe, and possibly makes them<br>
obliged to fix the fallout. Neither is expected from Moritz, just to<br>
be clear.<br></blockquote><div><br></div><div>Oh! Sorry I wasn&#39;t cleare=
r!=C2=A0</div><div>I was not expecting that from=C2=A0Moritz as well : Neit=
her the world build nor the fixes for the inevitable fallout.</div><div>I h=
ave nothing against the patch.</div><div>I&#39;ll try to be more cautious n=
ext time.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
Alex<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000f1b6100638c9af15--

