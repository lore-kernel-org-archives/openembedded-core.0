Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com [209.85.217.68])
 by mx.groups.io with SMTP id smtpd.web10.25346.1593337221657911774
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jun 2020 02:40:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bh/7Impx;
 spf=pass (domain: gmail.com, ip: 209.85.217.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f68.google.com with SMTP id f24so7723247vsg.1
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2020 02:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P2ypHwYna2T0lXzDnTowScycsAePqvhfb5pqUMseQlc=;
        b=bh/7ImpxpDEca8XPASwBYGsntu/sFBrATpIXFic13NGfrYTpPkmbwkoYIa5k1So05K
         luOIbpvks7AifNoqt4o3G/a52iM2aRZHH5R1Jw/PkJcvj3asWai1/Lfx59/NzL6D0rY6
         a+4XDrK1DLDZKBpyRngOzgvX0sIIY7jFVBwonnflnCBu+DwCrGf0b5PszYNISPcrjieX
         +A9Bpg7A0Jwnr4c80+ktoBQRqqMK0GCFi//VsjONID6TPwW028iYJJppBvnxe+Mk2H6w
         Hk77SmLzD2gVwLjJ98Lze851DrwjMXN7tcKkpBCy6cw06sZs/uaYijb+YxGIDOTegJAf
         NTlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P2ypHwYna2T0lXzDnTowScycsAePqvhfb5pqUMseQlc=;
        b=UP+4G1srgYkAY7QlL8PLZi8gEsSQKrMwVJs53R3CzGxr1hdJY1lJ0aC9jp91qYHLqL
         Lbzs51bfrOPiX/RUtN+j9/sW6qLiOLHKdNGRNI108dPPjApKpsJhJAm4BH5PZIC5HNR0
         UPuL2o/IHVNSBqYEZFbHfOh2ztYImzj8FY4QPCpZjZSuzW0y1RiGmHXvCHHQ5d+cw9Dv
         BFs2hTNxW8njeiPuHoArpKj6ulcm6q0pAWhzWpqimTF2zYZYOAiFDxE2zGODzJmVHfco
         sDfSZnniWko2kIX3opq3NP8inK5dLSvKWcMZ0lDQ2+v6TTPyfJPPtUCZHBOkEOt4wTMc
         e+rg==
X-Gm-Message-State: AOAM532Af/hrE88taIdcIAnqpMBBzezyHsrQtPgIchgag0/UPUkb9c/b
	lB+Zw/pxxPYfJT2VA/sgVg+bNm/jzLzH/hmctM4=
X-Google-Smtp-Source: ABdhPJxi0Iz/M+n1hTvPb710+15NajBqd7+hWraL2kPTEeS/1vnKUJcX9/sMwyzVWYkzn9kztQMUvaVGCvCcMGPk/1Q=
X-Received: by 2002:a67:db0b:: with SMTP id z11mr7441326vsj.25.1593337220753;
 Sun, 28 Jun 2020 02:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200628053943.906548-1-maochenxi@eswin.com> <20200628053943.906548-2-maochenxi@eswin.com>
 <27f412b9914cfc57e36f34fd6e4e7d3119db4b76.camel@linuxfoundation.org> <79dd22e5-fd7b-c878-8598-a4064b818eaf@eswin.com>
In-Reply-To: <79dd22e5-fd7b-c878-8598-a4064b818eaf@eswin.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sun, 28 Jun 2020 11:40:09 +0200
Message-ID: <CANNYZj8Vq0ZcDtufrGyjrY6cRfsMb1HbuFWJYqhWHtRrGtiACQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] gstreamer1.0-plugins-bad: don't select vulkan if directfb enabled.
To: Chenxi Mao <maochenxi@eswin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, chenxi.mao2013@gmail.com
Content-Type: multipart/alternative; boundary="0000000000000ced1705a921bbfb"

--0000000000000ced1705a921bbfb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

bb.utils.filter() makes sets out of DISTRO_FEATURES and the second
argument, and returns an intersection of the two. So the line shouldn't
need any fixing.

Are you sure you do not have vulkan in your DISTRO_FEATURES? How are you
setting it? What does 'bitbake -e gstreamer1.0-plugins-bad' say?

Alex

On Sun, 28 Jun 2020 at 10:39, Chenxi Mao <maochenxi@eswin.com> wrote:

> Hi Richard:
>
> If I set directfb only in DISTRO_FEATURES, the vulkan will be enabled
> in gstreamer, that will cause the build break.
> The root cause is the vulkan didn't support directfb.
> So I remove this vulkan if directfb enabled.
>
> Another solution is separate the directfb with directfb. Like below:
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'vulkan', d)} \
>
> Chenxi
>
> On 2020/6/28 =E4=B8=8B=E5=8D=883:54, Richard Purdie wrote:
> > On Sun, 2020-06-28 at 13:39 +0800, Chenxi Mao wrote:
> >> vulkan didn't support directfb at all.
> >> So remove this configuration if directfb enabled.
> >>
> >> Change-Id: Ia0af5d944e858fbb99a07fcd5f10ab831a93b2d0
> >> Signed-off-by: Chenxi Mao <maochenxi@eswin.com>
> >> ---
> >>  .../gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb                | 2 =
+-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-bad_1.16.2.bb b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-bad_1.16.2.bb
> >> index 7a227fed51..aee001e641 100644
> >> --- a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-bad_1.16.2.bb
> >> +++ b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-bad_1.16.2.bb
> >> @@ -24,7 +24,7 @@ inherit gobject-introspection
> >>  PACKAGECONFIG ??=3D " \
> >>      ${GSTREAMER_ORC} \
> >>      ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', ''=
,
> d)} \
> >> -    ${@bb.utils.filter('DISTRO_FEATURES', 'directfb vulkan', d)} \
> >> +    ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
> >>      ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', ''=
,
> d)} \
> >>      ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)} =
\
> >>      bz2 closedcaption curl dash dtls hls rsvg sbc smoothstreaming
> sndfile \
> > This doesn't look right since what if DISTRO_FEATURES contains just
> > vulkan? This patch would stop vulkan being enabled when directfb isn't
> > enabled if I read it correctly?
> >
> > Cheers,
> >
> > Richard
> >
> >
> >
>=20
>

--0000000000000ced1705a921bbfb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>bb.utils.filter() makes sets out of DISTRO_FEATURES a=
nd the second argument, and returns an intersection of the two. So the line=
 shouldn&#39;t need any fixing.<br></div><div><br></div><div>Are you sure y=
ou do not have vulkan in your DISTRO_FEATURES? How are you setting it? What=
 does &#39;bitbake -e gstreamer1.0-plugins-bad&#39; say?<br></div><div><br>=
</div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Sun, 28 Jun 2020 at 10:39, Chenxi Mao &lt;<a hr=
ef=3D"mailto:maochenxi@eswin.com">maochenxi@eswin.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Richard:<br>
<br>
If I set directfb only in DISTRO_FEATURES, the vulkan will be enabled<br>
in gstreamer, that will cause the build break.<br>
The root cause is the vulkan didn&#39;t support directfb.<br>
So I remove this vulkan if directfb enabled.<br>
<br>
Another solution is separate the directfb with directfb. Like below:<br>
+=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;directfb=
&#39;, d)} \<br>
+=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;vulkan&#=
39;, d)} \<br>
<br>
Chenxi<br>
<br>
On 2020/6/28 =E4=B8=8B=E5=8D=883:54, Richard Purdie wrote:<br>
&gt; On Sun, 2020-06-28 at 13:39 +0800, Chenxi Mao wrote:<br>
&gt;&gt; vulkan didn&#39;t support directfb at all.<br>
&gt;&gt; So remove this configuration if directfb enabled.<br>
&gt;&gt;<br>
&gt;&gt; Change-Id: Ia0af5d944e858fbb99a07fcd5f10ab831a93b2d0<br>
&gt;&gt; Signed-off-by: Chenxi Mao &lt;<a href=3D"mailto:maochenxi@eswin.c=
om" target=3D"_blank">maochenxi@eswin.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 .../gstreamer/<a href=3D"http://gstreamer1.0-plugins-bad_1.=
16.2.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-bad_1.16=
.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://=
gstreamer1.0-plugins-bad_1.16.2.bb" rel=3D"noreferrer" target=3D"_blank">gs=
treamer1.0-plugins-bad_1.16.2.bb</a> b/meta/recipes-multimedia/gstreamer/<a=
 href=3D"http://gstreamer1.0-plugins-bad_1.16.2.bb" rel=3D"noreferrer" targ=
et=3D"_blank">gstreamer1.0-plugins-bad_1.16.2.bb</a><br>
&gt;&gt; index 7a227fed51..aee001e641 100644<br>
&gt;&gt; --- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstream=
er1.0-plugins-bad_1.16.2.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer=
1.0-plugins-bad_1.16.2.bb</a><br>
&gt;&gt; +++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstream=
er1.0-plugins-bad_1.16.2.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer=
1.0-plugins-bad_1.16.2.bb</a><br>
&gt;&gt; @@ -24,7 +24,7 @@ inherit gobject-introspection<br>
&gt;&gt;=C2=A0 PACKAGECONFIG ??=3D &quot; \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 ${GSTREAMER_ORC} \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39=
;, &#39;bluetooth&#39;, &#39;bluez&#39;, &#39;&#39;, d)} \<br>
&gt;&gt; -=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39=
;directfb vulkan&#39;, d)} \<br>
&gt;&gt; +=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39=
;directfb&#39;, d)} \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39=
;, &#39;wayland&#39;, &#39;wayland&#39;, &#39;&#39;, d)} \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39=
;, &#39;opengl&#39;, &#39;gl&#39;, &#39;&#39;, d)} \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 bz2 closedcaption curl dash dtls hls rsvg sbc=
 smoothstreaming sndfile \<br>
&gt; This doesn&#39;t look right since what if DISTRO_FEATURES contains ju=
st<br>
&gt; vulkan? This patch would stop vulkan being enabled when directfb isn&=
#39;t<br>
&gt; enabled if I read it correctly?<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
&gt;<br>
&gt;<br>
&gt; <br>
<br>
</blockquote></div>

--0000000000000ced1705a921bbfb--
