Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web10.362.1616517752779012844
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 09:42:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nVXk/HKP;
 spf=pass (domain: gmail.com, ip: 209.85.217.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f46.google.com with SMTP id e13so9725967vsl.5
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Mar 2021 09:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fap79bDJaPJ2/95vjuXGlxEvm183Lihz+TJ2u9SVfCM=;
        b=nVXk/HKPTrk5LLwsQCz9pQIhVV0fWjTSFy1k0ULhPojrou1KM4RWFsJqM4zusVDlCZ
         CaKzUObKAX4wCm5l6aoAhjrzqQe/9rVucmuOQvFNTAIkKgGH9qpcQdLxQq0gp9eFnb7a
         Ueb4E2wVjCyIMKAXKxzP5uhNS5wAxuAzHiq2R6yZgupp4tH4LBkbIiKWF9HL6TYb2773
         DnFmwHar7Pe2PRedK8zscWNl80WPpr5E/gUK/6IpBTF1nYJMLV3HVm0deznZ+QZ0pm9S
         I77yKIO/btm5PUWvQJeN8lLYr1KsCpOpK0NgllPMWMXy3ibl9rVpTOp4n+YIcM7Y+5T3
         u2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fap79bDJaPJ2/95vjuXGlxEvm183Lihz+TJ2u9SVfCM=;
        b=OTSHEcphXpetFOSh6UcbdHSkmpS2LQ2J+KXc8e3jnpyrju3PE+rtAKlfua4HIgqi3s
         ai5s05Hw5J653qVuEwJukM72ZqYyt5j//pEOSepRN+BmRp14XmtToTLnW5pgty/opAqu
         FLKytTZleID8+PpMofTMCOfqUu4CYIDKtW+GbpDeZbNPkP7zhP8XJc72mjUnrGN/kQRR
         T+KEFB2v5rp4bql5RSAakGtBf9e69ba1GFApfwuorhIEcLDaFj8UFIjYDVN4DBwejVuq
         BbeCvVKYHJq5XHr8/K8SkWnJ1lFXtxB46jqeZ9dLUhStK0pFzGHgzEgaONgFagxN/4i4
         sgLA==
X-Gm-Message-State: AOAM530EpWFBFkp91SXCVSARRmJODkx8bxCDAmVsSUeqwbQloIAAUYFh
	3Ky9B6e6GFm/CtRUWYmiktfSucsT5TJBjDr85qY=
X-Google-Smtp-Source: ABdhPJwJjfGE23n3YTprFMf4LVdbV9bB9IB0kpA35hukDqPdLw7p7FA34WRaNpw7kp9ZxlQSQOUnyqdCGx1vgLrc9NA=
X-Received: by 2002:a67:f244:: with SMTP id y4mr4077573vsm.41.1616517751838;
 Tue, 23 Mar 2021 09:42:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210323163742.810094-1-yann@blade-group.com>
In-Reply-To: <20210323163742.810094-1-yann@blade-group.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 23 Mar 2021 17:42:20 +0100
Message-ID: <CANNYZj8fm0vTpB-p0PFJNmF4S8oOBmKGhK+R7PBhOdKZXy4R7A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] [RFC] ffmpeg: make LICENSE_FLAGS fine-grained
To: Yann Dirson <yann.dirson@blade-group.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>
Content-Type: multipart/alternative; boundary="0000000000005f1b0105be36de18"

--0000000000005f1b0105be36de18
Content-Type: text/plain; charset="UTF-8"

Is it possible to further split the NONCOMMERCIAL_PACKAGECONFIGS into ones
that are enabled and disabled, and use the former in PACKAGECONFIG itself?

Alex

On Tue, 23 Mar 2021 at 17:38, Yann Dirson <yann.dirson@blade-group.com>
wrote:

> From: Yann Dirson <yann@blade-group.com>
>
> The rationale here is that if the user can only whitelist "commercial"
> to use any part of ffmpeg, even it the list of features is carefully
> reviewed when switching the whitelisting on, there was nothing to
> guard from inadvertently activating a new feature that would not have
> been reviewed.
>
> This patch adds one LICENSE_FLAGS value for each feature, except for
> those that bring no codec, trying to be on the same level of legal
> safety - but then I may miss something.
>
> I tried to leave out of the safe NONCOMMERCIAL_PACKAGECONFIGS list
> anything that brings a codec, notably libavcodec.  I also did not look
> at non-default features yet.
>
> There may still be a problem if any feature in ffmpeg gets activated
> by default upstream and not registed as a PACKAGECONFIG feature.  At
> least any of those that depend on another lib would not be enabled,
> that could be seen as a sufficient safeguard.
> ---
>  meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
> b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
> index 08be38ca50..3a36c95151 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
> @@ -16,7 +16,17 @@ LICENSE_libavutil =
> "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LGP
>  LICENSE_libpostproc = "GPLv2+"
>  LICENSE_libswresample = "${@bb.utils.contains('PACKAGECONFIG', 'gpl',
> 'GPLv2+', 'LGPLv2.1+', d)}"
>  LICENSE_libswscale = "${@bb.utils.contains('PACKAGECONFIG', 'gpl',
> 'GPLv2+', 'LGPLv2.1+', d)}"
> -LICENSE_FLAGS = "commercial"
> +
> +# PACKAGECONFIG features that do not pull codecs
> +NONCOMMERCIAL_PACKAGECONFIGS = " \
> + alsa bzlib drm gpl lzma zlib xcb xv \
> + avdevice avfilter avformat swresample swscale postproc avresample \
> +"
> +# An ffmpeg feature not in NONCOMMERCIAL_PACKAGECONFIGS should be
> explicitly whitelisted.
> +# See https://ffmpeg.org/legal.html
> +LICENSE_FLAGS = "${@' '.join('commercial_' + cfg \
> +                             for cfg in '${PACKAGECONFIG}'.split() \
> +                             if cfg not in
> '${NONCOMMERCIAL_PACKAGECONFIGS}'.split())}"
>
>  LIC_FILES_CHKSUM =
> "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>
>  file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
> --
> 2.30.2
>
>
> 
>
>

--0000000000005f1b0105be36de18
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Is it possible to further split the NONCOMMERCIAL_PAC=
KAGECONFIGS into ones that are enabled and disabled, and use the former in =
PACKAGECONFIG itself?</div><div><br></div><div>Alex<br></div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 23 Mar=
 2021 at 17:38, Yann Dirson &lt;<a href=3D"mailto:yann.dirson@blade-group.c=
om">yann.dirson@blade-group.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">From: Yann Dirson &lt;<a href=3D"mailto:y=
ann@blade-group.com" target=3D"_blank">yann@blade-group.com</a>&gt;<br>
<br>
The rationale here is that if the user can only whitelist &quot;commercial=
&quot;<br>
to use any part of ffmpeg, even it the list of features is carefully<br>
reviewed when switching the whitelisting on, there was nothing to<br>
guard from inadvertently activating a new feature that would not have<br>
been reviewed.<br>
<br>
This patch adds one LICENSE_FLAGS value for each feature, except for<br>
those that bring no codec, trying to be on the same level of legal<br>
safety - but then I may miss something.<br>
<br>
I tried to leave out of the safe NONCOMMERCIAL_PACKAGECONFIGS list<br>
anything that brings a codec, notably libavcodec.=C2=A0 I also did not loo=
k<br>
at non-default features yet.<br>
<br>
There may still be a problem if any feature in ffmpeg gets activated<br>
by default upstream and not registed as a PACKAGECONFIG feature.=C2=A0 At<=
br>
least any of those that depend on another lib would not be enabled,<br>
that could be seen as a sufficient safeguard.<br>
---<br>
=C2=A0meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_4.3.2.bb" re=
l=3D"noreferrer" target=3D"_blank">ffmpeg_4.3.2.bb</a> | 12 +++++++++++-<br=
>
=C2=A01 file changed, 11 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_4.3.2=
.bb" rel=3D"noreferrer" target=3D"_blank">ffmpeg_4.3.2.bb</a> b/meta/recipe=
s-multimedia/ffmpeg/<a href=3D"http://ffmpeg_4.3.2.bb" rel=3D"noreferrer" t=
arget=3D"_blank">ffmpeg_4.3.2.bb</a><br>
index 08be38ca50..3a36c95151 100644<br>
--- a/meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_4.3.2.bb" re=
l=3D"noreferrer" target=3D"_blank">ffmpeg_4.3.2.bb</a><br>
+++ b/meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_4.3.2.bb" re=
l=3D"noreferrer" target=3D"_blank">ffmpeg_4.3.2.bb</a><br>
@@ -16,7 +16,17 @@ LICENSE_libavutil =3D &quot;${@bb.utils.contains(&#39;P=
ACKAGECONFIG&#39;, &#39;gpl&#39;, &#39;GPLv2+&#39;, &#39;LGP<br>
=C2=A0LICENSE_libpostproc =3D &quot;GPLv2+&quot;<br>
=C2=A0LICENSE_libswresample =3D &quot;${@bb.utils.contains(&#39;PACKAGECON=
FIG&#39;, &#39;gpl&#39;, &#39;GPLv2+&#39;, &#39;LGPLv2.1+&#39;, d)}&quot;<b=
r>
=C2=A0LICENSE_libswscale =3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG=
&#39;, &#39;gpl&#39;, &#39;GPLv2+&#39;, &#39;LGPLv2.1+&#39;, d)}&quot;<br>
-LICENSE_FLAGS =3D &quot;commercial&quot;<br>
+<br>
+# PACKAGECONFIG features that do not pull codecs<br>
+NONCOMMERCIAL_PACKAGECONFIGS =3D &quot; \<br>
+ alsa bzlib drm gpl lzma zlib xcb xv \<br>
+ avdevice avfilter avformat swresample swscale postproc avresample \<br>
+&quot;<br>
+# An ffmpeg feature not in NONCOMMERCIAL_PACKAGECONFIGS should be explici=
tly whitelisted.<br>
+# See <a href=3D"https://ffmpeg.org/legal.html" rel=3D"noreferrer" target=
=
=3D"_blank">https://ffmpeg.org/legal.html</a><br>
+LICENSE_FLAGS =3D &quot;${@&#39; &#39;.join(&#39;commercial_&#39; + cfg \=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for cfg in &#39;${PACKAGECONFIG}&#39;.split=
() \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if cfg not in &#39;${NONCOMMERCIAL_PACKAGEC=
ONFIGS}&#39;.split())}&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING.GPLv2;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://COPYING.GPLv3;md5=3Dd32239bcb673463ab874e80d47fae504 \<br>
-- <br>
2.30.2<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000005f1b0105be36de18--
