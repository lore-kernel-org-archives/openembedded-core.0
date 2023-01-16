Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF6EC54EBE
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 17:47:49 +0000 (UTC)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
 by mx.groups.io with SMTP id smtpd.web10.173938.1673891261385675539
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 09:47:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g6OTF7Tr;
 spf=pass (domain: gmail.com, ip: 209.85.221.170, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vk1-f170.google.com with SMTP id b81so13643439vkf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 09:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5FODYiKLjijj8p7vUaCPBvtyXfsCiIAq+Av7N3uQ1yU=;
        b=g6OTF7Tr1ein4MOAFw9lf+xlVNlLIB9Vw845pw4KBaKdnHF3khMEilyAMQtZSJ0MJk
         loREOF4MODHRN2NCQJuiirLK+f4BHOhacHfp9pLXS/498DypC/4f+5t0gtqfvfMZe31x
         BBI0ihgtSPoBU/43RpwlkGgYcLRZnkdXJD84osw3rHjnlFD8yqqTFzOTbk6Dy+FiYDXk
         pHeDC57qdIKP/eMrsXY5PLFkG/Hj6hqxiFKxAha06zu6Gkd8/WLPbXLyvV9K3ZAHbMrj
         0qCnaPtumrvfD7KBNJvzY56XSyQ8Kp8ZNOd+wdMGXtC3AXcxtNwAZWEFf9jiDBovfCvq
         l9PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5FODYiKLjijj8p7vUaCPBvtyXfsCiIAq+Av7N3uQ1yU=;
        b=S/L8drDITTUX/x1g4KxpCmvXN+xcbI6eO3Nj33x2HOxzgeK3AQRtW3k9MqLAsm0UXh
         L2T8va/ZGIIwGo+6ucRhA3fsGI4RJrA3/mQ5EmbJlq3prP3DW0//AW570baQ5wtrcqLP
         9Xgg3j59yzVWLC3xkUOe18S4BWt4NZFD9jVqQMBOsgRiUB+jNM04vIM3K1NsrLG2f2tK
         KSVgmkjQPo4tXUAfS12yAvN9sDclV6IUWrunbp9U8HJ/h4UxKbVxAVt1bnAYAqix34lE
         QvdnTWHsTFdZ/FpfUPjn1u8fADedquo0fH5QY6LCaO22Pc228Z/VbSITl1xF+tBH/D4v
         X6ZQ==
X-Gm-Message-State: AFqh2ko8aPSKd+P5cayTJMpsEBF55nqS12A0g5+s0PdYZ+nl4p5S/JLy
	JjaGGONkLDuU4Gs3lMEjMpt+LM0FSjXjC70ZJmY=
X-Google-Smtp-Source: AMrXdXt34uykvuQQ/QEtSG4zHlYbKonaEspX+ZNLhuarA6iykR60rW6h+wGyVnPIm6PpYEaf5S7rsHAPlvGGTxksClU=
X-Received: by 2002:a1f:d605:0:b0:3dd:fce2:8505 with SMTP id
 n5-20020a1fd605000000b003ddfce28505mr22576vkg.40.1673891260409; Mon, 16 Jan
 2023 09:47:40 -0800 (PST)
MIME-Version: 1.0
References: <20230116164325.289867-1-f_l_k@t-online.de> <ca881583fdf1906bb5828607c19a11113cbd895d.camel@linuxfoundation.org>
 <838LOR.7MMYBGDJNPM51@t-online.de> <74d632633cef4a52f0833ee6eeb1141403ecbff4.camel@linuxfoundation.org>
 <II9LOR.Y1Q7EACQVKAA1@t-online.de>
In-Reply-To: <II9LOR.Y1Q7EACQVKAA1@t-online.de>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 16 Jan 2023 17:47:29 +0000
Message-ID: <CANPvuRn=T-7Lzo8Ywz5xpZ0X620DNANN4kbELhEMJyikbE6BgQ@mail.gmail.com>
Subject: Re: [oe-core][PATCH] neard: dont pull in wpa-supplicant unconditionally
To: Markus Volk <f_l_k@t-online.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f82c7e05f2652de3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 17:47:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176010

--000000000000f82c7e05f2652de3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Markus,

Markus Volk <f_l_k@t-online.de> escreveu no dia segunda, 16/01/2023 =C3=A0(=
s)
17:20:

> Yes, that's right, of course. What would be the preferred way to deal wit=
h
> this. The dependency on wpa-supplicant is a bit annoying. Should I use a
> bbappend to remove it, or is the RRECOMMEND on wpa-supplicant perhaps
> removable from the neard recipe?
>

I think we can set on the recipe the default value of the WIRELESS_DAEMON
like on the patch you pointed out
so that globally changing WIRELESS_DAEMON will take effect everywhere where
it is used.

 WIRELESS_DAEMON ??=3D "wpa-supplicant"

Jose


> Am Mo, 16. Jan 2023 um 17:03:09 +0000 schrieb Richard Purdie <
> richard.purdie@linuxfoundation.org>:
>
> On Mon, 2023-01-16 at 17:49 +0100, Markus Volk wrote:
>
> > That isn't going to work as there is no default value for >
> WIRELESS_DAEMON ? > We have it set here
> https://git.yoctoproject.org/poky/commit/?id=3D1eaf64fbe16d2ceb472623c65c=
961b36aee33608
>
> Sure, but the neard recipe can't see in the packagegroup-base recipe
> scope? Cheers, Richard
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176009):
> https://lists.openembedded.org/g/openembedded-core/message/176009
> Mute This Topic: https://lists.openembedded.org/mt/96310274/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000f82c7e05f2652de3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi=C2=A0<span style=3D"white-space:break-spaces">Mark=
us,</span></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-onli=
ne.de</a>&gt; escreveu no dia segunda, 16/01/2023 =C3=A0(s) 17:20:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div id=3D"m_99676994028=
1472188geary-body" dir=3D"auto"><div>Yes, that&#39;s right, of course. What=
 would be the preferred way to deal with this. The dependency on wpa-suppli=
cant is a bit annoying. Should I use a bbappend to remove it, or is the RRE=
COMMEND on wpa-supplicant perhaps removable from the neard recipe?</div></d=
iv></blockquote><div><br>I think we can set on the recipe the default value=
 of the WIRELESS_DAEMON like on the patch you=C2=A0pointed out</div><div>so=
 that globally changing=C2=A0WIRELESS_DAEMON will take effect=C2=A0everywhe=
re=C2=A0where it is used.</div><div><br>=C2=A0WIRELESS_DAEMON ??=3D &quot;w=
pa-supplicant&quot;<br><br>Jose<br><br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><div id=3D"m_996769940281472188geary-quote" dir=3D"auto=
"><br>Am Mo, 16. Jan 2023 um 17:03:09 +0000 schrieb Richard Purdie &lt;<a h=
ref=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard=
.purdie@linuxfoundation.org</a>&gt;:<br><blockquote type=3D"cite"><div styl=
e=3D"white-space:break-spaces">On Mon, 2023-01-16 at 17:49 +0100, Markus Vo=
lk wrote:

<blockquote> &gt; That isn&#39;t going to work as there is no default value=
 for
 &gt; WIRELESS_DAEMON ?
 &gt;=20

 We have it set here
=20
 <a href=3D"https://git.yoctoproject.org/poky/commit/?id=3D1eaf64fbe16d2ceb=
472623c65c961b36aee33608" target=3D"_blank">https://git.yoctoproject.org/po=
ky/commit/?id=3D1eaf64fbe16d2ceb472623c65c961b36aee33608</a>
=20
</blockquote>
Sure, but the neard recipe can&#39;t see in the packagegroup-base recipe
scope?

Cheers,

Richard
</div><div style=3D"white-space:break-spaces">


</div></blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#176009): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/176009" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/176009</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96310274/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/96310274/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000f82c7e05f2652de3--

