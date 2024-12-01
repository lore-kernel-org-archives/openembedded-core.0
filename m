Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58FDAD49771
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 13:40:52 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.151335.1733060443105772443
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 05:40:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wJXvOp23;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385e1fcb0e1so705746f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 05:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1733060441; x=1733665241; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AioCN+M7Uy/ghBFXcAFWsvzAheTBccfH0Q65I4qOeJM=;
        b=wJXvOp23K2D4UKpcgKBqQL08den2pzXywLj09HTIqhJqPd0SjefcH8MIHLVqdsxy2z
         NL2EcnABGfxM3b46s5xNMnBYYlEtnfWc/9GELVbuordQWiWQRu3kCUw60UFZfRrB+us+
         QasbF4k8N5OQLVMe1iYsAzv1n3x0qYYfM8vMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733060441; x=1733665241;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AioCN+M7Uy/ghBFXcAFWsvzAheTBccfH0Q65I4qOeJM=;
        b=PP0HFSf4UneLDWXHJd1LhWYoFu86KEYxIFFBJGzGm1mh/rTmlcGNyHbZzgSGUW4Zk6
         xX215aoHQyML/9xkjs5uwWRKmvU0ZSBvQbs+NsHCdbdKhwQ+o661jf4uD68/wKvUdTDg
         /78jVd/Y37szh1MpgNDDjlx81XkcgMjEVF+ORWG6zRBK74HL0yPbRTfr8uIXPU9d5EV1
         ipaou946Lt2+AyKPKGnwiPJYa160DTmO9cvroBCHvYPU4I+eDzfEJNx0q71o4WPB/CDc
         1vNQ53bHlsOaR4/+mlB4dAhYYbxiTCGVT5hfuz1za9vx9m3XA+zbge2TTBaVCfH0J3ZL
         2RgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXP8uz70NrH8W6faMSA5m6xsPJioxT+7IDUCpaWlR3O63N5fYVwCUkUJjF78T9h069ZZmeGo+7t/2jImCj+wU5ICA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwLFhtu4J2HgSjghUqLIsAvI3P9s32Tt6cPnSOE06obL2/Mowze
	Hqkrtm6ns6icCtQu+MgNGHqitf+/Qi2/w4socLCVIhuDbWck7G6tSbLbYPtn69TjhmD9uzBn5HM
	hws2stqIxGM6tC5epvYPHduNIBkVjKf6e9Ah6rQ==
X-Gm-Gg: ASbGncuPCP4qrazZ2LtqnRegmTwuZhGGHCgRk+pGjzTpxVl8xUIWT5nx7CUCfJAYMym
	iz2jxjxc/ICb4SudvTZxYp5X0V/nf
X-Google-Smtp-Source: AGHT+IEvQ1RJg5DIf48lGqEN/RXbkkzAYIZSuLR4wPrB0mpibmwF75hQKe/kDqrnCiqkPWvq9DRIZRXmcG5KsZLA9BQ=
X-Received: by 2002:a5d:6d06:0:b0:385:f17b:de54 with SMTP id
 ffacd0b85a97d-385f17be0bbmr523053f8f.5.1733060441166; Sun, 01 Dec 2024
 05:40:41 -0800 (PST)
MIME-Version: 1.0
References: <cover.1730950520.git.steve@sakoman.com> <57de6545695ac11816d670959d9e63666de08e3d.1730950520.git.steve@sakoman.com>
 <CAB2nKc88-5F1mDe4G7ucA1W7u7rzQkCpuzwmA7Zmd2_n3qyqrA@mail.gmail.com> <CAApg2=SbZL+GBHLW3xVJ-UM+nepEwtcJbO4wEfc5pRay=oTVZg@mail.gmail.com>
In-Reply-To: <CAApg2=SbZL+GBHLW3xVJ-UM+nepEwtcJbO4wEfc5pRay=oTVZg@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Sun, 1 Dec 2024 14:40:14 +0100
Message-ID: <CAMSfU+6JN7gYcTcn9rDjJQ=ERWNNKJeKxsZ4HBQfqqb=vgcpaQ@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 02/10] cve_check: Use a local copy of the
 database during builds
To: rybczynska@gmail.com
Cc: vincent.prince.fr@gmail.com, steve@sakoman.com, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f86c1a062835936e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 13:40:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208115

--000000000000f86c1a062835936e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 28 nov. 2024 =C3=A0 17:09, Marta Rybczynska via lists.openembedded.=
org
<rybczynska=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :

> On Tue, Nov 26, 2024 at 2:05=E2=80=AFPM Vincent Prince via lists.openembe=
dded.org
> <vincent.prince.fr=3Dgmail.com@lists.openembedded.org> wrote:
>
>> Hello,
>>
>> I'm wondering if I'm the only one who couldn't complete do_fetch of
>> cve-update-nvd2-native with maximum retries on CVE API?
>> I tried with or without API Key, from several different machines, I
>> also tried to increase retries number etc, without success.
>>
>> I see on the NVD status page the following warning :
>> "Due to changes described below, a large number of CVE records have
>> recently been updated, resulting in a large increase in API requests.
>> We are aware of the issue and are working to mitigate it. Thank you
>> for your patience."
>>
>> I see the Buildroot switched from NVD to alternative FKIE github
>> database due to that API 2.0 inconsistency :/
>>
>> I'm not sure what are my options here, quite odd that cybersecurity
>> organisation get impacted by DDoS :D
>>
>
> If it doesn't improve in a reasonable time (like until the end of the
> week) I'm for mirroring it. The complete image for now.
>

FYI, this looks like it's fixed now :
https://valkyrie.yoctoproject.org/#/builders/103 has been green for 2 days
and, locally, no HTTP errors.

Regards,

Kind regards,
> Marta
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207995):
> https://lists.openembedded.org/g/openembedded-core/message/207995
> Mute This Topic: https://lists.openembedded.org/mt/109438548/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS - Tech expert

--000000000000f86c1a062835936e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 28 nov. 2024 =C3=A0=C2=
=A017:09, Marta Rybczynska via <a href=3D"http://lists.openembedded.org">li=
sts.openembedded.org</a> &lt;rybczynska=3D<a href=3D"mailto:gmail.com@lists=
.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=
=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D=
"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On T=
ue, Nov 26, 2024 at 2:05=E2=80=AFPM Vincent Prince via <a href=3D"http://li=
sts.openembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;<a h=
ref=3D"http://vincent.prince.fr" target=3D"_blank">vincent.prince.fr</a>=3D=
<a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blank">gmail=
.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">Hello,<br>
<br>
I&#39;m wondering if I&#39;m the only one who couldn&#39;t complete do_fetc=
h of<br>
cve-update-nvd2-native with maximum retries on CVE API?<br>
I tried with or without API Key, from several different machines, I<br>
also tried to increase retries number etc, without success.<br>
<br>
I see on the NVD status page the following warning :<br>
&quot;Due to changes described below, a large number of CVE records have<br=
>
recently been updated, resulting in a large increase in API requests.<br>
We are aware of the issue and are working to mitigate it. Thank you<br>
for your patience.&quot;<br>
<br>
I see the Buildroot switched from NVD to alternative FKIE github<br>
database due to that API 2.0 inconsistency :/<br>
<br>
I&#39;m not sure what are my options here, quite odd that cybersecurity<br>
organisation get impacted by DDoS :D<br></blockquote><div><br></div><div><d=
iv>If it doesn&#39;t improve in a reasonable time (like until the end of th=
e week) I&#39;m for mirroring it. The complete image for now.</div></div></=
div></div></blockquote><div><br></div><div>FYI, this looks like it&#39;s fi=
xed now : <a href=3D"https://valkyrie.yoctoproject.org/#/builders/103">http=
s://valkyrie.yoctoproject.org/#/builders/103</a> has been green for 2 days =
and, locally, no HTTP errors.<br></div><div><br></div><div>Regards,</div><d=
iv><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"=
ltr"><div class=3D"gmail_quote"><div><div></div><div>Kind regards,</div><di=
v>Marta</div></div><div>=C2=A0</div><br></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#207995): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/207995" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/207995</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/109438548/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/109438548/4316185</a><br>
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

--000000000000f86c1a062835936e--

