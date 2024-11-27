Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B928D6ACF5
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 16:43:21 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.76123.1732725800113312201
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 08:43:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CVDIgiI/;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6d41b209858so48158326d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 08:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732725799; x=1733330599; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I8/5R3+/zGNT6VVWYNPJBzuRcCfhqXJAWNe3U2GRZEM=;
        b=CVDIgiI/PNr0QQKZDSMImnifJoeqM6Pou2cbh6fmcFuLPb+CehQo315VHmVwBGgBfU
         FDswYB/GyufA/ZxH59qzB5dSaWJzOS13Z7VvtY3KpuzGE2K2SQRGI7SeEDreoMWTDai6
         v09VUfi1I9o+/2Km39PF2SMeVVHkrCSTs3MFEXpzQ/8Pu/X6kkRkgzmaAHOahu2EGR1C
         3Nyg0cpkIiJNtO6BgJHLhwOoGshx+GmwL8VklhMFWB+6xaq4YMtMnGeYqRLythBqTexG
         w3kjIrF1qa5ESDeYFoulyGvMQTpS2rAeMSev9eiB3MBsvdNCsmCMpNRoZEi7JpNvSrVk
         lKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732725799; x=1733330599;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I8/5R3+/zGNT6VVWYNPJBzuRcCfhqXJAWNe3U2GRZEM=;
        b=iRc6R2bicwIcycNcq3kmgysw/7404wOWjuGoB/1rRW9A3pVuR3ZqFMnKqOUh3VEJRW
         g1fDlN+cv4h9RrCK9U8jUtq4azMLQG7dpHtFmIFOINfSRghyhoJcN1ySclcwK+qeEZyv
         QzmnFPWp9uXrKLmuyiJ3dHGTcjsM8MJ+VdN5+Kt/MeHxVIfeMzFba8adT99WxotwYV+w
         VnEbSL4raW2G1Q16/EOs5Fu3nzxjGy6ICvjQw3+Uuk6vV7flLawNitSV2M54Spj5z18P
         DG+asWFNe89Qr4kI6WxX/zbDu2dpIMoWpz25J+Fg4r2DkIvtfHiOQXiMIfDJgmDZ4X60
         OVOA==
X-Gm-Message-State: AOJu0YxQNOBSnBuikEvyTjrA+RZb/10ZQqpap77/gpR/GYZLJQ8Yu0ho
	aY/dOh1loNJN2hAGjqIWrzfEvJXHzGhk681+S/JxWhw7w0Il2Gv1gDAhQsq7GFHK0t7OFYhw/2Z
	Yxv/MQsjp03Idi5v/NW7GrT0H/GM=
X-Gm-Gg: ASbGncu+CGoxTN5KehLmHYgZiC0RETFcaCzPbNXr32r+h64oXgn6dBTA1GzXMNCgd8/
	JieZzknUBsvD8UcWFbeozebYL+IAla4AfsQrsi+QRHUWP+VzkUK4F0eZ/8AG/
X-Google-Smtp-Source: AGHT+IHeqp9/w1uqzYmsHvsb0wMpFBiq9m9pXTXMVf/e6ydBatsPuzMLnM/V56d1ZvcYgKc2c+ihe78hKv/Zw0zWwa0=
X-Received: by 2002:ad4:4ea5:0:b0:6d4:257a:99 with SMTP id 6a1803df08f44-6d864df656dmr46988566d6.44.1732725798175;
 Wed, 27 Nov 2024 08:43:18 -0800 (PST)
MIME-Version: 1.0
References: <7c42e340baae4038324e250583e9395fb8d90463.1732725209.git.joerg.sommer@navimatix.de>
In-Reply-To: <7c42e340baae4038324e250583e9395fb8d90463.1732725209.git.joerg.sommer@navimatix.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 27 Nov 2024 17:43:07 +0100
Message-ID: <CANNYZj-x3YpWssLwcp5yaxE3hOb8=nyr+v_bOYtwNtYOEq3Czw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] lib/oe/utils.cpu_count: Raise maximum count
 from 64 to 192
To: joerg.sommer@navimatix.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b18cb70627e7a9da"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 16:43:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207937

--000000000000b18cb70627e7a9da
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please read the original rationale for picking 64, and provide benchmarks
that actually show better completion times with the new setting.

Alex

On Wed 27. Nov 2024 at 17.33, J=C3=B6rg Sommer via lists.openembedded.org
<joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:

> From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
>
> We have a system with 96 CPUs and 128 are not uncommon. The border of 64
> limits the number of parallel tasks make or ninja spawns, because the val=
ue
> goes into `PARALLEL_MAKE ?=3D "-j ${@oe.utils.cpu_count()}"`. If only a
> single
> recipe gets build (e.g. rust, due to dependencies) this leaves one third =
of
> our CPUs idle.
>
> Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> ---
>  meta/lib/oe/utils.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> index c9c7a47041..354237b643 100644
> --- a/meta/lib/oe/utils.py
> +++ b/meta/lib/oe/utils.py
> @@ -251,7 +251,7 @@ def trim_version(version, num_parts=3D2):
>      trimmed =3D ".".join(parts[:num_parts])
>      return trimmed
>
> -def cpu_count(at_least=3D1, at_most=3D64):
> +def cpu_count(at_least=3D1, at_most=3D192):
>      cpus =3D len(os.sched_getaffinity(0))
>      return max(min(cpus, at_most), at_least)
>
> --
> 2.45.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207936):
> https://lists.openembedded.org/g/openembedded-core/message/207936
> Mute This Topic: https://lists.openembedded.org/mt/109808873/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b18cb70627e7a9da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Please read the original rationale for picking 64, and pr=
ovide benchmarks that actually show better completion times with the new se=
tting.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed 2=
7. Nov 2024 at 17.33, J=C3=B6rg Sommer via <a href=3D"http://lists.openembe=
dded.org">lists.openembedded.org</a> &lt;joerg.sommer=3D<a href=3D"mailto:n=
avimatix.de@lists.openembedded.org">navimatix.de@lists.openembedded.org</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1e=
x;border-left-color:rgb(204,204,204)">From: J=C3=B6rg Sommer &lt;<a href=3D=
"mailto:joerg.sommer@navimatix.de" target=3D"_blank">joerg.sommer@navimatix=
.de</a>&gt;<br>
<br>
We have a system with 96 CPUs and 128 are not uncommon. The border of 64<br=
>
limits the number of parallel tasks make or ninja spawns, because the value=
<br>
goes into `PARALLEL_MAKE ?=3D &quot;-j ${@oe.utils.cpu_count()}&quot;`. If =
only a single<br>
recipe gets build (e.g. rust, due to dependencies) this leaves one third of=
<br>
our CPUs idle.<br>
<br>
Signed-off-by: J=C3=B6rg Sommer &lt;<a href=3D"mailto:joerg.sommer@navimati=
x.de" target=3D"_blank">joerg.sommer@navimatix.de</a>&gt;<br>
---<br>
=C2=A0meta/lib/oe/utils.py | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py<br>
index c9c7a47041..354237b643 100644<br>
--- a/meta/lib/oe/utils.py<br>
+++ b/meta/lib/oe/utils.py<br>
@@ -251,7 +251,7 @@ def trim_version(version, num_parts=3D2):<br>
=C2=A0 =C2=A0 =C2=A0trimmed =3D &quot;.&quot;.join(parts[:num_parts])<br>
=C2=A0 =C2=A0 =C2=A0return trimmed<br>
<br>
-def cpu_count(at_least=3D1, at_most=3D64):<br>
+def cpu_count(at_least=3D1, at_most=3D192):<br>
=C2=A0 =C2=A0 =C2=A0cpus =3D len(os.sched_getaffinity(0))<br>
=C2=A0 =C2=A0 =C2=A0return max(min(cpus, at_most), at_least)<br>
<br>
-- <br>
2.45.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#207936): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/207936" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/207936</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/109808873/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/109808873/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000b18cb70627e7a9da--

