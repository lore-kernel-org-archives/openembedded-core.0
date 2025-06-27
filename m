Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 300C9C77B7F
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 10:15:16 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.10282.1751019315158695201
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jun 2025 03:15:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ou5QBBcX;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a6e2d85705so1161396f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 03:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1751019313; x=1751624113; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RQT0Lh3AXYlh+atrFPUQsB5j4ThSzw+thlZhF0+Noh4=;
        b=ou5QBBcX8w7Wc2ZH5RrQMZgVnp80/93M6jzEOT7YhQsXzI4zDg+f913PcxC+wq227W
         jwsNw1xoTaD+sv5tx6lfPzXPxQMmMthrpCB7nqPn97z8SJyIlBS9cp05V43P4cAi/A9d
         wHARv6z6qg6NYJ9fEQASlTCygj74Mn+uRw96U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751019313; x=1751624113;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RQT0Lh3AXYlh+atrFPUQsB5j4ThSzw+thlZhF0+Noh4=;
        b=FGd8klm+DKZCXcCPTHQYtSgYXLE5uEvipfrvFr2Jpv/DVvGXrJP5aN8k2hnyHZImBS
         V6jI9b8TVw3znhdfqx7YyUb7oZv6sq2IOoMdw7FGSSBl0QodmHPdScETCVS/AnRUwbtv
         lPrXOAsLouso3aIAw6J+PyVVaJ2VIw5L+xDFj2K/jCXYCMEUDURHXVrHrnzvJE2wXAnr
         uOG7Kvc8R+wJ88VzWYEflzso3uF/Rl4s+gdEVIiXlIeasjjTaXmmAB0eYpCtl0qaDrZ6
         AAbtWxhwsglnBtUJteQLcmKfQCqBSn+jC2fneXXQM2V6Q+PhnJ1NKBpcgRWRh25lAPFl
         h0jg==
X-Gm-Message-State: AOJu0Yw8gUpUOVWLxK/qlWvO0x7TRWJaK8yrDiLCi3N/AnHd2qscHuTj
	PXcftwMYGunN8YTGnQSoC3+R0ooAN3ggiVnYgy6258pM1YIU4VzfYYiDCpCe5x3pB/lJYUL3GyX
	q6hSYC21jKFDqFYIrIihN1YsHLzd3v+id+6ByMr7Vmg==
X-Gm-Gg: ASbGnctuYKbpP6FwMmYSWv+UhrYxEdtpDjHhHD7y3cUq5PwPJC/s/4wspdoq9BAmqhz
	3c3M9S3Q3IF2zba5XHNTyD7gmz7gw9kI/nV63WCQ5Iw+WAiFPXOhzxjAJOtbGANaWLr+oq62CIl
	pcrDbvFyitmfqlxhZzkndY8rE8QzYTMLBC3jXILLygHEBGsPWEPg78t35VHdyq+E3JLDVMfQJG8
	16sQA==
X-Google-Smtp-Source: AGHT+IHAdCiIzgpnYmkP0rriC3qUFAES0zAw4djVdRHpKyxe55eGqVtmOfhbZMC9yLJoWnqPqet/V+FM4uBzdDGz0yc=
X-Received: by 2002:a05:6000:2b0d:b0:3a4:dfc2:2a3e with SMTP id
 ffacd0b85a97d-3a90038b75bmr1962158f8f.39.1751019313487; Fri, 27 Jun 2025
 03:15:13 -0700 (PDT)
MIME-Version: 1.0
References: <c78307592bee5e95421fb1973522e6258ec417ad.camel@linuxfoundation.org>
In-Reply-To: <c78307592bee5e95421fb1973522e6258ec417ad.camel@linuxfoundation.org>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 27 Jun 2025 12:14:47 +0200
X-Gm-Features: Ac12FXy5FGZK383o0pjhTrwnnx7NvaacbtoHpq454dlAlY1TnElPuFGVSMFCc8k
Message-ID: <CAMSfU+5oWnozk3ZXyWCv61k-VNkL-3UWhK2TGzUZ_95FZTZbVA@mail.gmail.com>
Subject: Re: [OE-core] runqemu compressed image support - request for help
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	Ross Burton <ross.burton@arm.com>
Content-Type: multipart/alternative; boundary="0000000000002cfc1b06388af40c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 10:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219392

--0000000000002cfc1b06388af40c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Le jeu. 26 juin 2025 =C3=A0 12:25, Richard Purdie via lists.openembedded.or=
g
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> a =C3=A9crit =
:

> We've had a dilemma for a while. The qemu classes set IMAGE_FSTYPES +=3D
> "ext4" and then use that to boot the images, which makes a lot of
> sense. When the project comes to make a release, we really want to
> compress these, so "ext4.zst" would be nicer. The problem is qemu
> doesn't support those.
>
> I was reminded of this after Ross sent a patch recently adding
> "wic.zst" to the list of formats we generate, alongside the preexisting
> "wic".
>
> I'd love to simplify our release process and make all of this a bit
> more seamless and efficient. One solution would be to add support to
> runqemu (and assume snapshot mode for compressed files).
>
> Is this something someone might like to help with?
>

We will look at this one :)

Regards,

It would then simplify our long overdue cleaup of our published release
> artefacts.
>
> Cheers,
>
> Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219345):
> https://lists.openembedded.org/g/openembedded-core/message/219345
> Mute This Topic: https://lists.openembedded.org/mt/113840901/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--0000000000002cfc1b06388af40c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div></div><div>Hello,</div></div><br><di=
v class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gma=
il_attr">Le=C2=A0jeu. 26 juin 2025 =C3=A0=C2=A012:25, Richard Purdie via <a=
 href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;rich=
ard.purdie=3D<a href=3D"mailto:linuxfoundation.org@lists.openembedded.org">=
linuxfoundation.org@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">We&#39;ve had a dile=
mma for a while. The qemu classes set IMAGE_FSTYPES +=3D<br>
&quot;ext4&quot; and then use that to boot the images, which makes a lot of=
<br>
sense. When the project comes to make a release, we really want to<br>
compress these, so &quot;ext4.zst&quot; would be nicer. The problem is qemu=
<br>
doesn&#39;t support those.<br>
<br>
I was reminded of this after Ross sent a patch recently adding<br>
&quot;wic.zst&quot; to the list of formats we generate, alongside the preex=
isting<br>
&quot;wic&quot;.<br>
<br>
I&#39;d love to simplify our release process and make all of this a bit<br>
more seamless and efficient. One solution would be to add support to<br>
runqemu (and assume snapshot mode for compressed files).<br>
<br>
Is this something someone might like to help with?<br></blockquote><br><div=
>We will look at this one :)</div><div><br></div><div>Regards,</div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
It would then simplify our long overdue cleaup of our published release<br>
artefacts.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#219345): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/219345" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/219345</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/113840901/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/113840901/4316185</a><br>
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
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000002cfc1b06388af40c--

