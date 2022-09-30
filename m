Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9721C433FE
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 18:10:45 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.502.1664561435822212812
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 11:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WpHmVbfX;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d11so4629567pll.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 11:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=vm3zKtmUgamdMPtp3o+eZeUofvUb1ESRtz8lgOZMX1w=;
        b=WpHmVbfXyC3UlAVX2+/AgREhzNQ7aPV65umzWYqU/x0+YMPcIxdullS4YTxOPGHrNA
         s8Guh6R17aqxf6mjP+Q1eg7ok9RZswOHgAvslqlgveWK0tx+c2UuGynQdSwTKf7xqEar
         Bygfo746ScsldPQFyrQP5xeUiJ+smTbkerSnU4v609hkzTxprKv1EkUYC4xAQ4c+0NKw
         hZD0XxHQy6QKd1WZ5YXcQ1jlxIp/ign+JWKSK650o5yvC9AOnglFkf0m13w2E5nGU1bF
         RDYmMYQWS0a+mKTzZGPZVUhT/NGNNp0LHVi2ov7AFIwpze8JyPH+386vqybjY3zP0GBN
         R3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=vm3zKtmUgamdMPtp3o+eZeUofvUb1ESRtz8lgOZMX1w=;
        b=UDWuc6j7stc9jc1BNXp7l3rD74Ieo0oq48BwXh39vP1JE/rhItTeARqYi9wgPAiCgy
         9FiVN3wIsxDuga/cCxcdKELx13+ifgogE1SUGfX+CKMsdD08Rax0OpwQIl+tMIyLrV8M
         VQ7f0nOedN5rbUrEKuHEXp0+6xd89bgEC+eCihxL5GDtEPhcsuQs12+pxNVryVFJAr4H
         hamqH06rgLV6/9rCVR49xVRLwh3PeIl6GZqhTAeN4NAKf6iiCeZarElgjHv4lK4ywB4G
         IaHYIn+LDKn7m++V0ELC0DodbMQlS8G8TB3z+Xnwj06pFV9woR69SncJtYLjFffVfAy/
         Ui+w==
X-Gm-Message-State: ACrzQf12k/i125ukKoJinpWa51H+9B03zBBiVRNpV/3GYwu4raJBGSkJ
	frin4DNRw2r7I/3EPumsp6Zo97ujxiYpuxVs6KU=
X-Google-Smtp-Source: 
 AMsMyM4yC9CVNkdqrQ8l0cgu8NmuZRFSPaui8DGSDpT5gZjho2BBLbMNnIZAVJdhLfM9ISN827BNoU5iLqw9ZSfGAXY=
X-Received: by 2002:a17:903:284:b0:178:2a94:9b6a with SMTP id
 j4-20020a170903028400b001782a949b6amr10265032plr.135.1664561435328; Fri, 30
 Sep 2022 11:10:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220930175440.2168008-1-jose.quaresma@foundries.io>
 <CANNYZj-15uhYQwhU95q0Yr=FcX_qGhWj5Vy=7qFdqyJ4QfSsww@mail.gmail.com>
 <CANPvuRkXLnZMYGttuO1k6SVoN=vhee5K0uk7eXSzpYZxvQRiXQ@mail.gmail.com>
 <CANNYZj9hSLESrhTHYQr2tPiA6W94GVayntUD5qOoa0692HUP+g@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9hSLESrhTHYQr2tPiA6W94GVayntUD5qOoa0692HUP+g@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 30 Sep 2022 19:10:13 +0100
Message-ID: 
 <CANPvuRnUWmdmr_RzzK5C1E82RT_yqOjNERZt-nZZ0m+r4GFw5w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] go: drop patch to make content based hash
 generation less pedan
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="0000000000000f46ed05e9e8e9d1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 18:10:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171242

--0000000000000f46ed05e9e8e9d1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alexander Kanavin <alex.kanavin@gmail.com> escreveu no dia sexta,
30/09/2022 =C3=A0(s) 19:02:

> On Fri, 30 Sept 2022 at 20:01, Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
> > Forgot to remove the patch! Will send a v2 but I can't run the
> reproducibility now.
>
> You should, I believe the patch was added in the first place to fix
> the reproducibility issues, and won't be accepted if its removal
> breaks that.
>

Sure, I can do it but only next week.
I tried to understand and come up with a way to fix the issue but don't
understand the real problem behind it.

Jose


> Alex
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000000f46ed05e9e8e9d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Alexander Kanavin &lt;<a href=3D"mail=
to:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; escreveu no dia s=
exta, 30/09/2022 =C3=A0(s) 19:02:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Fri, 30 Sept 2022 at 20:01, Jose Quaresma &lt;<a href=
=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.c=
om</a>&gt; wrote:<br>
&gt; Forgot to remove the patch! Will send a v2 but I can&#39;t run the rep=
roducibility now.<br>
<br>
You should, I believe the patch was added in the first place to fix<br>
the reproducibility issues, and won&#39;t be accepted if its removal<br>
breaks that.<br></blockquote><div><br></div><div>Sure, I can do it but only=
 next week.<br>I tried to understand and come up with a way to fix the issu=
e but don&#39;t understand the real problem behind it.<br><br>Jose<br><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Alex<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--0000000000000f46ed05e9e8e9d1--

