Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E119C982FA
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 16:58:32 +0000 (UTC)
Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.827.1790096302319994081
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 09:58:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=I2awz4IY;
 spf=pass (domain: mvista.com, ip: 74.125.224.141, mailfrom: hprajapati@mvista.com)
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-85d4ddd1d91so2546777b3.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 09:58:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790096301; cv=none;
        d=google.com; s=arc-20260327;
        b=Y0tsSkDApwdwFkuPDB1aj0hwf39JFYYanzrMVoVSpo5gBcDXWfv+s9ahAWoT+nCJfT
         7mbV6GCraVnLxf5ggqvg0qpjqrg1VVfsDso4/8BBzn9jdESyi9h3kNXooGBbP1WN40+V
         rJdVyT3pz0lpDkx1q6jEiK3hl0xjSJIw3wC9iVNb6XR1qHTjwe+SdgED2BpHEXawyB0u
         siUsRxaSCyK8YHJD0MKcdIkgWajBE9MWbLqY2TgE8j3adWPbjENF8SE0Q1fRshD7y431
         B1tpa8NBITplK/zSWRP1uaX4W9swclL+//0A8TU4E/Wif83vv1bx/6T+efXbQdW8nDNL
         xfBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0/3xWjKyv61dODW/0bUrxRUsLtonnj0JuFfxB4c3nTk=;
        fh=5VpxgiaFCw99hmUxvV+/er63fRX0UWM338mat0ljUv0=;
        b=FBGAUsDwzAW1uQrH2NCDnUr57BqsbNZ1HBjvoNLkYbPUM492b1ldEHGa8gE37yY8zo
         bgbKzdUnqwhSOpcoaRmidANfBqfvEsl3YSPflxDVpKwkj4Htv0hbq/tBWlgEy1c0Grfm
         mbYkUezSgxEqGIVSc8miB1i2DX4aqTbBcNa2T+l3Q/E8Ffzkrf9KEquyruPU8ZiEFFV3
         sqBXsom97CBxbycenUab5/Umf7iObvf0GdmXQVkZpKfYWGN9Q4HydLNtbjs/xGONQnw3
         aevFSxqSv1JFeGjZPaUcSG1IyPwFq3gjLhz13R69R6sfWnF4gtoE+ejS/cXrgYfx7uut
         d9jA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1790096301; x=1790701101; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0/3xWjKyv61dODW/0bUrxRUsLtonnj0JuFfxB4c3nTk=;
        b=I2awz4IYRnnJWpvYpD14h1Mx95U7hwxNCKR4R5LTQcze/Mhozt5KslhwA2C3KQYrT+
         o3QyVoHKKf7Yyb3GCzP/34wjRCJ2B9rAJJvwAbf0cfahF4vMUXgfpXkbSesQ281Im3/1
         MA1bs2wrwx3Qfj69OHh0+RJ2bzRAxBz7XDZcY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790096301; x=1790701101;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0/3xWjKyv61dODW/0bUrxRUsLtonnj0JuFfxB4c3nTk=;
        b=hu3BewXQRVzC5LdPeUsYkBz1k2bCu8Ji+ri69sYaFTGPODszgbrkprQ6tfW1xTiPvf
         nNaYnytBsDISq0mYVw7SrOzQIuj5YQ7w1j8MWa87BE0h5tPWm/WZsItfEvnsGuQoAD2j
         KzVPACbQ4HURnbe9ybBSPv/q3RtjRxkL0yjsJwD0RPNAIIJpMAxZ9dmpZWQM3Ys9BiML
         0EjZWYc1dHKWQ6qMFrfz6ZIgncO+qkP8KwWgP9zPaezlj8su4jSgQSH734+DeteW0EHk
         Ts+v3l13cFmOeZYs3yp3SvJvxWgIiDssAb9VGkq3lMVWn/MMFI2F/BwE/2taTsWYZj5r
         upAg==
X-Gm-Message-State: AFuF++l8kqOWxUG9q5eX7aN+GWDsvXqOoiRBgw3ZWIUAXk2eBxeHRC5+
	odcf1zY8HBmbZee3bbjBGEcyRlPvC0l531UiAOeR9yIgYq6Ini+5FIpLh1uUzfxx/PwDYDzplqC
	odsLbSQUzHXkVv0UIdtL6qGm1pyhMrG9fvyGi2KGGrg==
X-Gm-Gg: AYBFou3EQfV4UQOYSRYBYZc3vhaPwJRbh4Y72hn5Zof7rVQ4e38WYY9/dnx41BLEqRL
	rPg4d6Z41hun/rexxdNicdQ3UZ7o6M4jCG5SD2wxdofYZJLy9KooqeznONLQlE5+Ly91U2OqveR
	LLvPWIKXhAxQqHlmMogNZKqug8VMG259xAh+s22GCqNn/oGPe3g+8SF8cWcHpL4QKYKcw2V5U83
	oNP6L5goZELnLJO0W8Hx1nOhpcfOnfg8T+1cDa5kFuZ4vN7/zqsNm+f5tg1nYKhgoXLpUZmuvTF
	OxuKEHWNJ2DBmf4X/qyl2pI0GjAy146/Z6traiwo30wxHgd4/fEPpZtODLH6u3RSxco1vLFx
X-Received: by 2002:a05:690c:ec5:b0:89a:63da:cbdf with SMTP id
 00721157ae682-8a45b887e98mr898997b3.37.1790096301309; Tue, 22 Sep 2026
 09:58:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260916084001.193028-1-hprajapati@mvista.com> <DLLZZXCT3K10.1PR6NH5N37YN4@smile.fr>
In-Reply-To: <DLLZZXCT3K10.1PR6NH5N37YN4@smile.fr>
From: Hitendra Prajapati <hprajapati@mvista.com>
Date: Tue, 22 Sep 2026 22:28:10 +0530
X-Gm-Features: AcwNN1XF1_6Nx3KgBvxXN2-MY7Byb4TcuI6FbBnI7C__qo_-bK-LH_jL1HJ3Ues
Message-ID: <CACVbggF=jtyrLZumZrzyKJUTqB_zPOH7T4=vkBqanGZm88LGTQ@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] gstreamer1.0-plugins-good: Fix for
 CVE-2026-3083, CVE-2026-3085
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002752a0065c1546bb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 16:58:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246426

--0000000000002752a0065c1546bb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'll check and if possible to update patch.

On Tue, 22 Sept, 2026, 10:19=E2=80=AFpm Yoann Congal, <yoann.congal@smile.f=
r> wrote:

> On Wed Sep 16, 2026 at 10:40 AM CEST, Hitendra Prajapati via
> lists.openembedded.org wrote:
> > Pick the patch from [1], also referenced in the Debian report [2] & [3]=
.
> >
> > [1]
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/8349cdd35f852=
46e113b18e55fd11abf9cb248bf
> > [2] https://security-tracker.debian.org/tracker/CVE-2026-3083
> > [3] https://security-tracker.debian.org/tracker/CVE-2026-3085
> >
> > Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> > ---
> >  .../CVE-2026-3083-CVE-2026-3085.patch         | 602 ++++++++++++++++++
> >  .../gstreamer1.0-plugins-good_1.22.12.bb      |   1 +
> >  2 files changed, 603 insertions(+)
> >  create mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2026-3083=
-CVE-2026-3085.patch
> >
> > diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2026-30=
83-CVE-2026-3085.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2026-30=
83-CVE-2026-3085.patch
> > new file mode 100644
> > index 0000000000..095b511e2f
> > --- /dev/null
> > +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2026-30=
83-CVE-2026-3085.patch
> > @@ -0,0 +1,602 @@
> > +From 8349cdd35f85246e113b18e55fd11abf9cb248bf Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Tim-Philipp=3D20M=3DC3=3DBCller?=3D <tim@centricular=
.com>
> > +Date: Sun, 8 Feb 2026 16:09:04 +0000
> > +Subject: [PATCH] rtpqdm2depay: remove element
> > +
> > +There is no plausible reason anyone should need this element in 2026
> > +seeing that this was a streaming format produced by Darwin Streaming
> Server
> > +ca 2009 which hasn't been in active use for well over a decade.
> > +
> > +It is a maintenance burden and a security liability and there's no
> > +good reason to keep it around.
> > +
> > +Fixes ZDI-CAN-28850, ZDI-CAN-28851, CVE-2026-3083, CVE-2026-3085,
> GST-SA-2026-0008.
> > +
> > +Part-of: <
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/10886=
>
> > +
> > +CVE: CVE-2026-3083 CVE-2026-3085
> > +Upstream-Status: Backport [import from ubuntu
> gst-plugins-good1.0_1.20.3-0ubuntu1.5.debian.tar.xz
> > +Upstream commit
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/8349cdd35f852=
46e113b18e55fd11abf9cb248bf
> ]
> > +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> > +---
> > + docs/gst_plugins_cache.json |  28 ---
> > + gst/rtp/gstrtp.c            |   1 -
> > + gst/rtp/gstrtpqdmdepay.c    | 411 -----------------------------------=
-
> > + gst/rtp/gstrtpqdmdepay.h    |  83 --------
> > + gst/rtp/meson.build         |   1 -
> > + 5 files changed, 524 deletions(-)
> > + delete mode 100644 gst/rtp/gstrtpqdmdepay.c
> > + delete mode 100644 gst/rtp/gstrtpqdmdepay.h
>
> Hello,
>
> This remove support for a format (this should have been mentionned in
> the commit message!), per stable policy, this is not allowed.
>
> Is there another way to fix these CVEs?
>
> Regards,
> --
> Yoann Congal
> Smile ECS
>
>

--0000000000002752a0065c1546bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I&#39;ll check and=C2=A0if possible to update patch.</div=
><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Tue, 22 Sept, 2026, 10:19=E2=80=AFpm Yoann Congal, &lt;=
<a href=3D"mailto:yoann.congal@smile.fr">yoann.congal@smile.fr</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">On Wed Sep 16, 2026 at 10:40 AM =
CEST, Hitendra Prajapati via <a href=3D"http://lists.openembedded.org" rel=
=3D"noreferrer noreferrer" target=3D"_blank">lists.openembedded.org</a> wro=
te:<br>
&gt; Pick the patch from [1], also referenced in the Debian report [2] &amp=
; [3].<br>
&gt;<br>
&gt; [1] <a href=3D"https://gitlab.freedesktop.org/gstreamer/gstreamer/-/co=
mmit/8349cdd35f85246e113b18e55fd11abf9cb248bf" rel=3D"noreferrer noreferrer=
" target=3D"_blank">https://gitlab.freedesktop.org/gstreamer/gstreamer/-/co=
mmit/8349cdd35f85246e113b18e55fd11abf9cb248bf</a><br>
&gt; [2] <a href=3D"https://security-tracker.debian.org/tracker/CVE-2026-30=
83" rel=3D"noreferrer noreferrer" target=3D"_blank">https://security-tracke=
r.debian.org/tracker/CVE-2026-3083</a><br>
&gt; [3] <a href=3D"https://security-tracker.debian.org/tracker/CVE-2026-30=
85" rel=3D"noreferrer noreferrer" target=3D"_blank">https://security-tracke=
r.debian.org/tracker/CVE-2026-3085</a><br>
&gt;<br>
&gt; Signed-off-by: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapati@mvi=
sta.com" target=3D"_blank" rel=3D"noreferrer">hprajapati@mvista.com</a>&gt;=
<br>
&gt; ---<br>
&gt;=C2=A0 .../CVE-2026-3083-CVE-2026-3085.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 602 ++++++++++++++++++<br>
&gt;=C2=A0 .../<a href=3D"http://gstreamer1.0-plugins-good_1.22.12.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">gstreamer1.0-plugins-good_1.22=
.12.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 2 files changed, 603 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.=
0-plugins-good/CVE-2026-3083-CVE-2026-3085.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-go=
od/CVE-2026-3083-CVE-2026-3085.patch b/meta/recipes-multimedia/gstreamer/gs=
treamer1.0-plugins-good/CVE-2026-3083-CVE-2026-3085.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..095b511e2f<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-=
2026-3083-CVE-2026-3085.patch<br>
&gt; @@ -0,0 +1,602 @@<br>
&gt; +From 8349cdd35f85246e113b18e55fd11abf9cb248bf Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: =3D?UTF-8?q?Tim-Philipp=3D20M=3DC3=3DBCller?=3D &lt;<a href=3D"=
mailto:tim@centricular.com" target=3D"_blank" rel=3D"noreferrer">tim@centri=
cular.com</a>&gt;<br>
&gt; +Date: Sun, 8 Feb 2026 16:09:04 +0000<br>
&gt; +Subject: [PATCH] rtpqdm2depay: remove element<br>
&gt; +<br>
&gt; +There is no plausible reason anyone should need this element in 2026<=
br>
&gt; +seeing that this was a streaming format produced by Darwin Streaming =
Server<br>
&gt; +ca 2009 which hasn&#39;t been in active use for well over a decade.<b=
r>
&gt; +<br>
&gt; +It is a maintenance burden and a security liability and there&#39;s n=
o<br>
&gt; +good reason to keep it around.<br>
&gt; +<br>
&gt; +Fixes ZDI-CAN-28850, ZDI-CAN-28851, CVE-2026-3083, CVE-2026-3085, GST=
-SA-2026-0008.<br>
&gt; +<br>
&gt; +Part-of: &lt;<a href=3D"https://gitlab.freedesktop.org/gstreamer/gstr=
eamer/-/merge_requests/10886" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/1088=
6</a>&gt;<br>
&gt; +<br>
&gt; +CVE: CVE-2026-3083 CVE-2026-3085<br>
&gt; +Upstream-Status: Backport [import from ubuntu gst-plugins-good1.0_1.2=
0.3-0ubuntu1.5.debian.tar.xz<br>
&gt; +Upstream commit <a href=3D"https://gitlab.freedesktop.org/gstreamer/g=
streamer/-/commit/8349cdd35f85246e113b18e55fd11abf9cb248bf" rel=3D"noreferr=
er noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/gstreamer/g=
streamer/-/commit/8349cdd35f85246e113b18e55fd11abf9cb248bf</a>]<br>
&gt; +Signed-off-by: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapati@mv=
ista.com" target=3D"_blank" rel=3D"noreferrer">hprajapati@mvista.com</a>&gt=
;<br>
&gt; +---<br>
&gt; + docs/gst_plugins_cache.json |=C2=A0 28 ---<br>
&gt; + gst/rtp/gstrtp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A01 -<br>
&gt; + gst/rtp/gstrtpqdmdepay.c=C2=A0 =C2=A0 | 411 ------------------------=
------------<br>
&gt; + gst/rtp/gstrtpqdmdepay.h=C2=A0 =C2=A0 |=C2=A0 83 --------<br>
&gt; + gst/rtp/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01=
 -<br>
&gt; + 5 files changed, 524 deletions(-)<br>
&gt; + delete mode 100644 gst/rtp/gstrtpqdmdepay.c<br>
&gt; + delete mode 100644 gst/rtp/gstrtpqdmdepay.h<br>
<br>
Hello,<br>
<br>
This remove support for a format (this should have been mentionned in<br>
the commit message!), per stable policy, this is not allowed.<br>
<br>
Is there another way to fix these CVEs?<br>
<br>
Regards,<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div>

--0000000000002752a0065c1546bb--

