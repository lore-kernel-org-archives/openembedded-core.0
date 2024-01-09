Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC7EAC3DA6E
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 00:09:16 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web11.5502.1704758954654846895
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 16:09:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20230601.gappssmtp.com header.s=20230601 header.b=x6Ho+K38;
 spf=pass (domain: ossystems.com.br, ip: 209.85.128.173, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5edfcba97e3so24300627b3.2
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 16:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20230601.gappssmtp.com; s=20230601; t=1704758953; x=1705363753; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7YLsd33dDgCamlmzj+OHIJFRFW1TE5ARwZY1FYd1bQA=;
        b=x6Ho+K38knjjc6TnSdPxfi7ktkJIclruAgbsmoEu7+DWc+fmzIX6plEpWKqlBxvl09
         cV7VCwhAPbDi9MfPFYS6w58g5iw9vqUcRTE6eCmYbbkTPnmu2SL384P+1iZmJjWp+ct7
         nR9734lSCTY84AiU5BlLTWwU5c+u1ASsFPZAlMhVOryD8MAvr3nY/aJOKvHKiKNZjsh8
         f+16KgB36W1tbccsK4ssXM6+rWAgAYF05sazmGWv2u6cQ50U17LUgRPwakUzktM2nJq5
         ymTM+Mlo4T1641KIum+RrK2503c7/YLi0xmH0shaf8uVdzYIUX01VmpqEuptDAR88+8R
         ccHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704758953; x=1705363753;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7YLsd33dDgCamlmzj+OHIJFRFW1TE5ARwZY1FYd1bQA=;
        b=P+eoWsKqZUjK81G/vvtMvO/lkALJc0FynxUKTbhcFQeQSGZLQV+8V3eEWSLKowrnmu
         44dwKn30yU3hRQZ98o6LH24y0nyv6g4N3X12CrDw5ytsPH5BdiNg7gK2F2/dzmHehqVw
         7lDeBOHP3vK4IPaesXUH6pgWV5hmypqg44i9aEXfWuPRuFch8muB9TFO0DD5Tl65qPLi
         +yEY/8g5slEJHV33zW1kCJtT/fXI47x1o0zhYFjrboqTzJumBSR53LIa9ts/gHGrq6PB
         AvWnbB5khwYmhrksMWjgS+eQ3G9C5hoT/dgn481RmEP8EPQhfkh0OsAg2q4+D4eH+sTT
         cegQ==
X-Gm-Message-State: AOJu0Yz1aPf7Oe+mpHU8SARrjoJCLhUM6ghXWd8iA//5gGz3O2JbSC33
	A//xsF2sb/wUMAKDVIGHHuT8j6fdWy7KJZtSUJeRz7S5q8QzcA==
X-Google-Smtp-Source: AGHT+IF0Hs170/cPvNHaHaxFjh3stz+ugmC0esjTqK2sJCkw4afU/TzSS4aOCCXZE8ZC+i2kCbDI5Q==
X-Received: by 2002:a81:770a:0:b0:5d7:1940:f400 with SMTP id s10-20020a81770a000000b005d71940f400mr3334676ywc.104.1704758953177;
        Mon, 08 Jan 2024 16:09:13 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id r5-20020a818105000000b005e71fbbc660sm297936ywf.137.2024.01.08.16.09.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jan 2024 16:09:12 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dbe344a6cf4so1681303276.0
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 16:09:12 -0800 (PST)
X-Received: by 2002:a25:d6d6:0:b0:dbd:5d37:e040 with SMTP id
 n205-20020a25d6d6000000b00dbd5d37e040mr2213819ybg.44.1704758951969; Mon, 08
 Jan 2024 16:09:11 -0800 (PST)
MIME-Version: 1.0
References: <20240108134323.37022-1-rodrigo.duarte@ossystems.com.br>
In-Reply-To: <20240108134323.37022-1-rodrigo.duarte@ossystems.com.br>
Date: Mon, 8 Jan 2024 21:08:59 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqQJc-20Hse=3eBU+U1rH1MpXjs4gybyMavEQjzLPGrHw@mail.gmail.com>
Message-ID: <CAP9ODKqQJc-20Hse=3eBU+U1rH1MpXjs4gybyMavEQjzLPGrHw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-firmware: Fix the linux-firmware-bcm4373
 FILES variable
To: rodrigo.duarte@ossystems.com.br
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c28a5e060e781ff7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 00:09:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193437

--000000000000c28a5e060e781ff7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 8 de jan. de 2024 =C3=A0s 11:17, <rodrigo.duarte@ossystems.com.br>
escreveu:

> From: "Rodrigo M. Duarte" <rodrigo.duarte@ossystems.com.br>
>
> This commit includes the 'cyfmac4373-sdio.clm_blob' file in
> the list of files for the linux-firmware-bcm4373 package.
> Without this file, the linux-firmware package adds all
> firmware packages to the image.
>
> Signed-off-by: Rodrigo M. Duarte <rodrigo.duarte@ossystems.com.br>
>

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br
<rodrigo.duarte@ossystems.com.br>>

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--000000000000c28a5e060e781ff7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em seg., 8 de jan. de 2024 =C3=A0s 11=
:17, &lt;<a href=3D"mailto:rodrigo.duarte@ossystems.com.br">rodrigo.duarte@=
ossystems.com.br</a>&gt; escreveu:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">From: &quot;Rodrigo M. Duarte&quot; &lt;<a href=3D"mailt=
o:rodrigo.duarte@ossystems.com.br" target=3D"_blank">rodrigo.duarte@ossyste=
ms.com.br</a>&gt;<br>
<br>
This commit includes the &#39;cyfmac4373-sdio.clm_blob&#39; file in<br>
the list of files for the linux-firmware-bcm4373 package.<br>
Without this file, the linux-firmware package adds all<br>
firmware packages to the image.<br>
<br>
Signed-off-by: Rodrigo M. Duarte &lt;<a href=3D"mailto:rodrigo.duarte@ossys=
tems.com.br" target=3D"_blank">rodrigo.duarte@ossystems.com.br</a>&gt;<br><=
/blockquote><div><br></div><div>Signed-off-by: Otavio Salvador &lt;otavio<a=
 href=3D"mailto:rodrigo.duarte@ossystems.com.br" target=3D"_blank">@ossyste=
ms.com.br</a>&gt;</div><div><br></div></div><span class=3D"gmail_signature_=
prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Otavio Sal=
vador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br><a href=3D"http://www.ossystem=
s.com.br" target=3D"_blank">http://www.ossystems.com.br</a> =C2=A0 =C2=A0 =
=C2=A0 =C2=A0<a href=3D"http://code.ossystems.com.br" target=3D"_blank">htt=
p://code.ossystems.com.br</a><br>Mobile: +55 (53) 9 9981-7854 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0Mobile: +1 (347) 903-9750</div></div>

--000000000000c28a5e060e781ff7--

