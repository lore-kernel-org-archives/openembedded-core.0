Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7780D44150
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 12:07:49 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web10.19330.1732018066255152681
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Nov 2024 04:07:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zg93J5ER;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e388c3b0b76so2237206276.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 04:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732018065; x=1732622865; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0eZVOncSaCPbX1XUMKsq1T35zllHeNhhejhs5oniE6Y=;
        b=Zg93J5ERae/AJpHOIE9EWh/s813ZJRatmYU0/cGtsbEFrbJjnupBxo5hSDBlJ17vU2
         ajXY0Yr9gh8En/ehKh3tHkgXicN+bvPFLgYjtoOWirgKMMZAiFzKCVKCW0wie6uVuKMT
         7ynJBt+kofBYuYgmJJwiAw8n3mgLAqlyeo7UnKoJygf/5g2gPjI0zyGAYZqVrlxjM1/8
         pw9VLwP+8+k0I4dkywnv0W++nczyw9CD551i9kbe8vxZn1lJE3t1YrExEi5nLtfNAWnm
         KECSey5Hs82XknNyP8e6GRuaHeczooTr45lG5ytlJeDjljGpYTH1CbSRCkPnDP+GT95W
         TqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732018065; x=1732622865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0eZVOncSaCPbX1XUMKsq1T35zllHeNhhejhs5oniE6Y=;
        b=Dz641Q3GQ2voZ6OqlGvYoLRyLuNNYtSQsZ2c1/1mr4IReAA8dGZXUwuPgGTGAL/CNM
         vXUZfjdHxznD7c+q7b20bRuGkOOMow125oklR4tK1jOU9B1YDI2qgPpfwznEt3fpa7a2
         oGCTlOvHE7lMM5vJWENG7CP70ggDuPtg+1kE0nOOMZPvgfKZD9INkHYgLKPsRMsRBQ2a
         PMmV8eU/mWRtDW4Ocq3747hgxoqJY/TUDH050AFV97/kN8c6cJzAe4KptVNB9be81i+N
         kIeUfGJzHrJfG7XNaTKUptaJZ8GHXK5E+vabNJzU0qF7/Bp5Rr/JzH7ZpKYUBPWwn5ip
         n6BA==
X-Forwarded-Encrypted: i=1; AJvYcCVVFC5WJJh1bC9i8dHcSOTaXvWWHXWCFFwDMWPTkWq17xNQ8rvg0EgGDpoDMLGkUZ8Bq+NSu+kCHJwl4ZUKbSt3cQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxDOUliGr4ax8EgKUylPl4GRC+Swm9LOfS8USlxXhwskiFSBNJ0
	aIjYIH7WWRiMWzzovjAkjXtiTeitI0kQhj6f+SS6zI310SRGQYJMxn4Gq+tdMg1U+wSK1Z6xtkg
	2FH9hMGMEEzqzBBzjkzBNcDdsvXQ=
X-Google-Smtp-Source: AGHT+IHHTcRyrWcUY/H0ZDFdMqqVn4SeQimjV7S6Rq2Tq2EEZgnGm7LQ7NxmRNSlNpqZIcqw8o8mtUDLuAOSMipFjAA=
X-Received: by 2002:a05:6902:2208:b0:e38:87bf:8e65 with SMTP id
 3f1490d57ef6-e3887bf9531mr9100205276.0.1732018065348; Tue, 19 Nov 2024
 04:07:45 -0800 (PST)
MIME-Version: 1.0
References: <20241022081140.1464860-1-thakur.virendra1810@gmail.com>
 <CANNYZj8VR90wUtudX4FiA-teKaJFrkgK_hohmb2o6iNXeGL96w@mail.gmail.com> <MA0PR01MB9355C27D944D288DF19DEE389D202@MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MA0PR01MB9355C27D944D288DF19DEE389D202@MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 19 Nov 2024 13:07:34 +0100
Message-ID: <CANNYZj9n-DiX3WfUJTqa=s_iKAfLSuNJZ7QuD6+H+PW9_m3ZrQ@mail.gmail.com>
Subject: Re: [OE-core] [master][PATCH] libyaml: Add libyaml ptest
To: virendra.thakur@kpit.com
Cc: "thakur.virendra1810@gmail.com" <thakur.virendra1810@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"wangmy@fujitsu.com" <wangmy@fujitsu.com>
Content-Type: multipart/alternative; boundary="00000000000087a2fc062742e1f0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 12:07:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207387

--00000000000087a2fc062742e1f0
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Nov 2024 at 13:02, Virendra Thakur via lists.openembedded.org
<virendra.thakur=kpit.com@lists.openembedded.org> wrote:

>
>
> Below test does not require any argument to be pass. Its is a simple binary
> > +       test-version and test-reader
>
>
>  run-emitter|run-dumper|run-parser|run-scanner|run-loader
> Other test require an argument and yaml file which it needs to perform
> task. Like parsing or emmiting or to perform run-loader test
>

This does not quite answer this part of my question:

How does the test suite work upstream and why can't we
simply use that?

I still don't understand why a custom yaml needs to be created.

Alex

--00000000000087a2fc062742e1f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Tue, 19 Nov 2024 at 13:02, Virendra Thakur via <a href=3D"htt=
p://lists.openembedded.org">lists.openembedded.org</a> &lt;virendra.thakur=
=3D<a href=3D"mailto:kpit.com@lists.openembedded.org">kpit.com@lists.openem=
bedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div class=3D"msg8462282516339188922">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div id=3D"m_8462282516339188922Signature">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Below test does not require any argument to be pass. Its is a simple binary=
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test-version and test-reader=C2=
=A0</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0run-emitter|run-dumper|run-parser|run-scanner|run-loader</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Other test require an argument and yaml file which it needs to perform task=
. Like parsing or emmiting or to perform run-loader test</div></div></div><=
/div></blockquote></div><div class=3D"gmail_quote"><br></div><div class=3D"=
gmail_quote">This does not quite answer this part of my question:</div><div=
 class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">How does the te=
st suite work upstream and why can&#39;t we<br>
simply use that? <br></div><div class=3D"gmail_quote"><br></div><div class=
=3D"gmail_quote">I still don&#39;t understand why a custom yaml needs to be=
 created.<br></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail=
_quote">Alex<br></div></div>

--00000000000087a2fc062742e1f0--

