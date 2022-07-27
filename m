Return-Path: <rustyhowell@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B7A7C04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 14:32:41 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.20559.1658932356270809844
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 07:32:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VcrGNYF0;
 spf=pass (domain: gmail.com, ip: 209.85.167.52,
 mailfrom: rustyhowell@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id a23so25032521lfm.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 07:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lsTsqn3D0NKROQLlHD32fzerUpnwo5wDfSHNtStS6J8=;
        b=VcrGNYF08fAE5dcNR5CJSamfkiS2y96IIoOlcjrPQuEPb7qCSoPYrUkmr+XQuWJKMm
         tZ22DWp2f6iO5lunFf9ISvQnY7gr4+RtZ9ZGl6Nm3SIm9kEKsxdt1YypXVewP8t+yRkM
         Z7Y8VfEdPj7qW8JVQc8ps8K4z+SQ2gHxZXKhZg3DD5BHHrofFaQT4GE/5+fw/9ikw6t5
         PBQI2vHRTKHQ/C8eajUXmjik5IiCOE1mNhfYLEZKYQ9ORtgCe0oowoI/G8fPqnFGvX8V
         WVq18ocrAvccU7eznnZQgyIp0dL6HIv1YKtEJAgh8SHqU6+/Y/CNwRWLpTmeQm0KumcC
         yUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lsTsqn3D0NKROQLlHD32fzerUpnwo5wDfSHNtStS6J8=;
        b=0FLCwuvrUpWJXFEnwxqysy1BS2Dvp/BHfy9izhIy8s4oKuqtmcCHZokrTg/55hY0ka
         jxkQ3Idilk3WzNjurMp/0KRyhA9vyAjrpdgKhmAJHg0doabfEEz83+z0Gojf5soiXT3X
         Y6D5DKILqjqUh93RUacIp7CaexTkHQK4pCgtGTicnz7BqyXZty6lPDcokiqosdTBfjdO
         mpGvy+FQvpB33//jWlZd7CpgirU1h6E5MKO2M/BdXwb148N6BUJzmfyLgBFikHjfajog
         VimAWNtLeF+ViRfwyWYxzJXkVcVQNpMAzsiKMNXwyVpWsdIvVC1UrSEDCOMmElS3Zjqj
         hyUQ==
X-Gm-Message-State: AJIora9zQ9iAhzuDoT5Rp5UjdTyXRJSJjz4CNpc1ZESFODUAa1Hbzl4m
	37s6u3r7hRbATmH4OkSHQfiaIgFCUlq9OH0KVrc=
X-Google-Smtp-Source: 
 AGRyM1up1WooIqo5BIzw1N/CZv4Xhvu5f/yLFm74+9+3dS1fPisaidA8+VhwdiAdXXeBgjCjXLsn3f8A6Wvd8JvdpY8=
X-Received: by 2002:a05:6512:2350:b0:48a:794b:382 with SMTP id
 p16-20020a056512235000b0048a794b0382mr7870639lfu.185.1658932354225; Wed, 27
 Jul 2022 07:32:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220726211328.2122681-1-rustyhowell@gmail.com>
 <20220727125339.70e1886c@booty>
 <CANNYZj-FJHUQgVb3GXWjEd6mkQE2-wkX2vUky3pJXQLdq6LPVQ@mail.gmail.com>
 <9DF62C6C-0996-4520-B4AD-F8E579C8931A@arm.com>
 <22FA8BA8-2F9D-4914-9C05-5385EBA4D90A@arm.com>
 <7536019F-34C9-44D8-9380-425C4FE67207@arm.com>
In-Reply-To: <7536019F-34C9-44D8-9380-425C4FE67207@arm.com>
From: Rusty Howell <rustyhowell@gmail.com>
Date: Wed, 27 Jul 2022 08:32:17 -0600
Message-ID: 
 <CAE+BM3m3CvX=86M8FqodzNDS-5VoAVghMVYxeQovLvgxiJ3d1Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] debian packaging: set md5sums for conffiles
To: Ross Burton <ross.burton@arm.com>
Cc: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ae1b4d05e4ca4941"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 14:32:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168564

--000000000000ae1b4d05e4ca4941
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the quick responses.   It took us a while to figure out why we
were seeing weird behaviour with our products, and we ultimately figured
out the conffiles are being replaced during the update.   I am working off
of Hardknott currently, so that's my mistake not switching to master.  And
I guess I misunderstood who is allowed to "sign off" on patches. I assumed
I couldn't since I'm not a regular. But in any case, it looks like Ross
Burton may be on to a better solution than what I have to fix the issue.

Rusty

On Wed, Jul 27, 2022 at 8:09 AM Ross Burton <ross.burton@arm.com> wrote:

> > So we=E2=80=99re definitely not generating the DEBIAN/md5sums files tha=
t
> dpkg-deb likes to have. However, this file in proper Debian packages
> doesn=E2=80=99t contain hashes for the conffiles, so I can only imagine t=
hat dpkg
> generates them on install, which leads to the question of where that is
> meant to happen.
>
> dpkg =E2=80=94configure does this, but we=E2=80=99re neutering it by rena=
ming all
> foo.dpkg-new files to foo in the deb install() function.
>
> If we=E2=80=99re going to rename foo.dpkg-new to foo, then that is where =
we go and
> update the status file.
>
> Alternatively, we don=E2=80=99t do that, and every package needs to run i=
ts
> configure step on first boot.
>
> Ross
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168563):
> https://lists.openembedded.org/g/openembedded-core/message/168563
> Mute This Topic: https://lists.openembedded.org/mt/92637328/4800265
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> rustyhowell@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000ae1b4d05e4ca4941
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks for the quick responses.=C2=A0=C2=A0 It took u=
s a while to figure out why we were seeing weird behaviour with our product=
s, and we ultimately figured out the conffiles are being replaced during th=
e update. =C2=A0 I am working off of Hardknott currently, so that&#39;s my =
mistake not switching to master.=C2=A0 And I guess I misunderstood who is a=
llowed to &quot;sign off&quot; on patches. I assumed I couldn&#39;t since I=
&#39;m not a regular. But in any case, it looks like Ross Burton may be on =
to a better solution than what I have to fix the issue.=C2=A0 <br></div><di=
v><br></div><div>Rusty<br></div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 27, 2022 at 8:09 AM Ross Burton=
 &lt;<a href=3D"mailto:ross.burton@arm.com">ross.burton@arm.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; So we=
=E2=80=99re definitely not generating the DEBIAN/md5sums files that dpkg-de=
b likes to have. However, this file in proper Debian packages doesn=E2=80=
=99t contain hashes for the conffiles, so I can only imagine that dpkg gene=
rates them on install, which leads to the question of where that is meant t=
o happen.<br>
<br>
dpkg =E2=80=94configure does this, but we=E2=80=99re neutering it by renami=
ng all foo.dpkg-new files to foo in the deb install() function.<br>
<br>
If we=E2=80=99re going to rename foo.dpkg-new to foo, then that is where we=
 go and update the status file.<br>
<br>
Alternatively, we don=E2=80=99t do that, and every package needs to run its=
 configure step on first boot.<br>
<br>
Ross<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#168563): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/168563" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/168563</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92637328/4800=
265" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92637328/4800265</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:rustyhowell@gmail.com" tar=
get=3D"_blank">rustyhowell@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000ae1b4d05e4ca4941--

