Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 484E1CA0FED
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 14:31:32 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.19781.1757514682217920910
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 07:31:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=htyj/rV7;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-7211b09f649so59353916d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 07:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757514681; x=1758119481; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yN/I+zMYzOU/9wrgtg3/BFwYXCcEz1SsEAspKHpQPLM=;
        b=htyj/rV7Tzj2LhKsVvdRESRfoGZz21fWFBrN3DltnXEQf9ztg/YjHC0gOD3IKxk5ao
         rV+bKhw3tiVD3psAM11qq5+FaVb69zV/Hv8PngqG1yM1yFq7VBxb//A3/7cIFg0Dnmyv
         cxOTuc+4t0rY+BY0XOLCux2tuWTz2iWR/Szl8VobpQX8NPkhPQBgIglyCoiQWx/+0Zli
         I+cOgS5pxL4/GZzSw/3LenQIsHTFnhk6F/Q0B7abFnoLgqgU9GvkaY6rU0wzp9KTcVgr
         EO9T/oZb5nz2lsgJYM/35I5jRw0HfP7q7EWGpDUYs0BxvPgxC/RMO7lb4tmaFzDEMbXx
         55bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757514681; x=1758119481;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yN/I+zMYzOU/9wrgtg3/BFwYXCcEz1SsEAspKHpQPLM=;
        b=KKb1QvPSZDLnK9DRtqqYqE7DouelRgaUK7tmFw6fFXbZrQ5LKjt21a5nC2HmES+1nO
         ouhb7ioPUFSw0JOMB8CCKs/RqdiE5tZ2W+fszQ6D8XI07Zj/jwhQN12kfYoB487Ux3qB
         pdZwrhy2RWM4F/fZtrFQBBzN0x7q8Z4Dq6StI1/Tj2ieMup428TGl8qRrwg/oAfvPocy
         OZHlB3o1UbwGLu0kITKDZ1GfVQWs8z6IPptxP98607yyE68uOJDqHjUpXVGqv6Cyr0hS
         xZpDiJxEtkbDfwbJdo9yqLCRNjn3tFCQ2OE3g2a2jy/0F9AEboNc/pXSxJCtADf3663i
         cERQ==
X-Gm-Message-State: AOJu0Ywe4au9K9h4DZsiDWfI9pr30xkj5pb2AZGptNBc98+aUstgXCxM
	yORNdMz1OmRrUt8a4d6HzxvUES8GL09LWh20zrbGkzviISmNjMPMdRgQvB8IdVsLOFvwoD9MigQ
	wqHm11t90InJTl+fzmkQoiFIDpgPHF/g=
X-Gm-Gg: ASbGnctWP83OIxm/VZwlhKxfzJSS2u1YL/aKDItdEpkeqzFHbJpPYOwNjPemAiCgGB9
	rqEAwBCHCOPigxh5UEmdaFqCXGtM9lbjf17+HCIWLLOuH+6VsZxjK8cKsmYwzWE8Ebty27lf3Sj
	JOER8isRLa+cEhrPTCDwogzP4T4Kd7BJlnDNs5OVu6OQm0MLDzOyYeISpV+XSc5Y+/gTTAnuqo1
	Pczo0KrZNrBEUiOSpBF5VtHMBAfc236x9rM1DfuH6BIhWXUjMDZgXGK8jVhVZl/hafGzO41BJjc
	56KP/+W00o7/AAIWwSfc4UjDU3Pev5Lqw1+819KiRXSkkpA04zs=
X-Google-Smtp-Source: AGHT+IF/ZmX1FkDcWx4mwOpwW1091Y9S0r8iRNdXO7qR73QHhsu5M46Seu0QNIbemF28FNNE2YCLHRrvzgGRV/dX+b8=
X-Received: by 2002:a05:6214:f6e:b0:70d:bdee:ce27 with SMTP id
 6a1803df08f44-739435cf27bmr159534186d6.46.1757514680836; Wed, 10 Sep 2025
 07:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250910135508.2383081-1-ross.burton@arm.com>
In-Reply-To: <20250910135508.2383081-1-ross.burton@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 10 Sep 2025 16:31:09 +0200
X-Gm-Features: AS18NWA5eSjEbs4PX2zBs7rJYWU_2xPgK41mkdzmMQAMSMt3VmlaWk3s2GEVi40
Message-ID: <CANNYZj9FehWY8Y74sT1XNhZ=Q6H1SmV=7stdHgo5sMQGX8Bh_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] wic: add --extra-space back for compatibility
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003d2c61063e734609"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 14:31:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223219

--0000000000003d2c61063e734609
Content-Type: text/plain; charset="UTF-8"

Why not fix the files? When can this be removed?

Alex

On Wed 10. Sep 2025 at 15.55, Ross Burton via lists.openembedded.org
<ross.burton=arm.com@lists.openembedded.org> wrote:

> The --extra-space argument was renamed to --extra-filesystem-space to
> be clear what space is being added to, but this breaks existing wic
> files.
>
> Add back --extra-space as an alias for --extra-file-system-space so that
> existing wks files don't fail.
>
> [1] oe-core 39d10137b86 ("wic: rename wks flag --extra-space to
> --extra-filesystem-space")
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  scripts/lib/wic/ksparser.py | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> index 705f9897508..8ca5f77ff53 100644
> --- a/scripts/lib/wic/ksparser.py
> +++ b/scripts/lib/wic/ksparser.py
> @@ -155,6 +155,8 @@ class KickStart():
>          part.add_argument('--change-directory')
>          part.add_argument('--extra-filesystem-space', type=sizetype("M"))
>          part.add_argument('--extra-partition-space', type=sizetype("M"))
> +        # Deprecated, just for compatibility
> +        part.add_argument("--extra-space", dest='extra_filesystem_space',
> type=sizetype("M"))
>          part.add_argument('--fsoptions', dest='fsopts')
>          part.add_argument('--fspassno', dest='fspassno')
>          part.add_argument('--fstype', default='vfat',
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223217):
> https://lists.openembedded.org/g/openembedded-core/message/223217
> Mute This Topic: https://lists.openembedded.org/mt/115169720/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000003d2c61063e734609
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Why not fix the files? When can this be removed?</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Alex=C2=A0</div><div><br><div cl=
ass=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Wed 10. Sep 2025 at 15.55, Ross Burton via <a href=3D"http://lists.=
openembedded.org">lists.openembedded.org</a> &lt;ross.burton=3D<a href=3D"m=
ailto:arm.com@lists.openembedded.org">arm.com@lists.openembedded.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;b=
order-left-color:rgb(204,204,204)">The --extra-space argument was renamed t=
o --extra-filesystem-space to<br>
be clear what space is being added to, but this breaks existing wic<br>
files.<br>
<br>
Add back --extra-space as an alias for --extra-file-system-space so that<br=
>
existing wks files don&#39;t fail.<br>
<br>
[1] oe-core 39d10137b86 (&quot;wic: rename wks flag --extra-space to --extr=
a-filesystem-space&quot;)<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0scripts/lib/wic/ksparser.py | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py<br>
index 705f9897508..8ca5f77ff53 100644<br>
--- a/scripts/lib/wic/ksparser.py<br>
+++ b/scripts/lib/wic/ksparser.py<br>
@@ -155,6 +155,8 @@ class KickStart():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0part.add_argument(&#39;--change-directory=
&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0part.add_argument(&#39;--extra-filesystem=
-space&#39;, type=3Dsizetype(&quot;M&quot;))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0part.add_argument(&#39;--extra-partition-=
space&#39;, type=3Dsizetype(&quot;M&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Deprecated, just for compatibility<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 part.add_argument(&quot;--extra-space&quot;, d=
est=3D&#39;extra_filesystem_space&#39;, type=3Dsizetype(&quot;M&quot;))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0part.add_argument(&#39;--fsoptions&#39;, =
dest=3D&#39;fsopts&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0part.add_argument(&#39;--fspassno&#39;, d=
est=3D&#39;fspassno&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0part.add_argument(&#39;--fstype&#39;, def=
ault=3D&#39;vfat&#39;,<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#223217): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/223217" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/223217</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115169720/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/115169720/1686489</a><br>
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

--0000000000003d2c61063e734609--

