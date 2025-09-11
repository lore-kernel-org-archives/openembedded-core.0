Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D02CCAC587
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 13:01:20 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.46134.1757595675103245651
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 06:01:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EDnoHFtc;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b520c9c291dso671878a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 06:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757595674; x=1758200474; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HdYSgwnyybH9zYUW/1E6MvLLv9Bs/29LvGFy0JTh4KU=;
        b=EDnoHFtc1U3/F+tJO3qHda9LSbSHLn5UIg0oD+bbm67cbKlDBaGvGZAeYLtg6/wwtH
         sDr3+PYF7TnLSDngFQAoFA+MjZ2k1d9sFDuM7akQwL9RpwW0wk+pwWM44mY9JfbdC4z3
         Be3pKEqVqggRdsvPTQ80JteIYTVRU7k5XLC82vpARYH7RoDMhqdsqMCanPyJ+bmAyphS
         uiXvRJul/e7hVAj2QTM1WmMf0GixE2X0nDjfi7JSBR9h5sWQzuD4S4yxz8An9eaWT/O+
         x1CcMOTS0uFs0kJjqRjAu9XED9hjvh9iSDYOxtl/UzAR8qbJ/THvKF7q1Dyvn0hc9Ugp
         tMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757595674; x=1758200474;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HdYSgwnyybH9zYUW/1E6MvLLv9Bs/29LvGFy0JTh4KU=;
        b=ReqitiQUkEhROchzX1xT0+ggSWTzGYOPoXwTDz0IXyrOFMeTqYPaF04QP4o+ggGWjO
         FTlPTCRZClJfbSOvH/DlZep3EHZuAuEdyW/DArs6aSbbZpjwC2c/NS0JT4fa5sInWMv+
         /V7Q1IMZsjedRtDeFkNn5gSdQo3unyTRcP3UP2h3y0E1mrTbYEE+w8jErpOKB6QchPFq
         gfx/ZPtfvSiUPedXicD2qoWEwLHsGiN6FOXjbrtlbVbvo3X4WYRwnCH7y36KHq5iPt6b
         nJ4AVE+Z6RPZmL61mfXzOyDmzIfiYuGAQwiescbtVzwedaMpzAlJad17Hjx531ZqZvS2
         4arw==
X-Gm-Message-State: AOJu0YzP3TqiTOrpSrjMlRlrG80V1//Ct/+vJbU3krX9tttAZoIcWIGb
	KgqiXSiGxfRHu602g+JR6VncIFaNJlmAlbRaoGCPU98WjsFzApGaBHmOSE6aR0jx+UqdBQ/cw/Y
	ly+xaZ8x+TAYmL0UJos9mJQaaM4KfDJY=
X-Gm-Gg: ASbGncsvfHmD98j94FHgc7MXkSYw9+py+karYC6adYR/0qD1RsfBh9XB60Xvph7mDEu
	/9paQFGgf56aBX+emhSqjIWdaZOrnJRDcwaZrdxBTmg4gP0/bdwNnPiqA1n5KhL0nm1caFCo1tl
	ZWSIX/F/FH0dR3WnGTEbVs9RssP7+F4qn/nbIPvNiidkJI682zndalcVv5IVU5eAQ/QSpAqY8po
	o+pcm0HcKPAR+owwqVP5eo0B/9lhySwvdP2hMzh
X-Google-Smtp-Source: AGHT+IHZClzLcQNoSUx7hbwdj4h3ceZ8KcMYUiJNKeY529bUekKK22NX9XlXGJOZ4yjYsRCLfpcnNnyIBWseK+StVkM=
X-Received: by 2002:a17:90b:554d:b0:32d:dc3e:559a with SMTP id
 98e67ed59e1d1-32ddc3e9996mr1603623a91.10.1757595672255; Thu, 11 Sep 2025
 06:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250911113830.1488467-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20250911113830.1488467-1-richard.purdie@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 11 Sep 2025 09:01:00 -0400
X-Gm-Features: Ac12FXwa3tDThVWrHGiIsCZnCeDpr8V9rbMi6TU2HjSS7So2IR-l7j-3FmQfJwo
Message-ID: <CADkTA4Mueax30cT8pNcUe=MKkNFXBHaYJLRbirKkJUfGh-s6vw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] perf: Fix reproducibility issue
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b42b22063e8621ad"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 13:01:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223276

--000000000000b42b22063e8621ad
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 7:38=E2=80=AFAM Richard Purdie via lists.openembedd=
ed.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:

> Perf's build process generates two copies of its internal headers,
> one at tools/lib/perf/include/internal and one at libperf/include/interna=
l
> with files like xyarray.h. Although the files are identical, the binaries
> including
> them would see them at different paths and have different debuginfo data.
>
> To avoid this, build libperf.a first, which will ensure the libperf
> headers directory exists. This is used in preference to the other by
> the build process and results in consistent binaries.
>

That explains the race.  I was looking at the Makefile's yesterday
and hadn't quite put my finger on what it was yet.

I've fought with the copies of those headers for years as well. It
was worse before we started copying the perf source code out
the way we do now.

I don't see any issues with the approach, I've done the same in
the past. It is better than options like moving them, removing them
or messing with -j1 builds, or new Makefile targets, etc.

With your comment explaining the situation in the code, we won't
even undo it by mistake :)

Acked-by: Bruce Ashfield <bruce.ashfield@gmail.com>


>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-kernel/perf/perf.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/
> perf.bb
> index b142b090b55..e1915207eed 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -171,6 +171,10 @@ do_compile() {
>              sed -i -e
> 's|\$(libdir)/traceevent/plugins|\$(libdir)/traceevent_${KERNEL_VERSION}/=
plugins|g'
> ${S}/tools/lib/traceevent/plugins/Makefile
>         test -e ${S}/tools/perf/Makefile.config && \
>              sed -i -e
> 's|\$(libdir)/traceevent/plugins|\$(libdir)/traceevent_${KERNEL_VERSION}/=
plugins|g'
> ${S}/tools/perf/Makefile.config
> +       # There are two copies of internal headers such as:
> +       # libperf/include/internal/xyarray.h and
> tools/lib/perf/include/internal/xyarray.h
> +       # For reproducibile binaries, we need to find one copy, hence
> force libperf to be created first
> +       oe_runmake ${B}/libperf/libperf.a
>         oe_runmake all
>  }
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223269):
> https://lists.openembedded.org/g/openembedded-core/message/223269
> Mute This Topic: https://lists.openembedded.org/mt/115186108/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000b42b22063e8621ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 11, 2025 at 7:38=
=E2=80=AFAM Richard Purdie via <a href=3D"http://lists.openembedded.org">li=
sts.openembedded.org</a> &lt;richard.purdie=3D<a href=3D"mailto:linuxfounda=
tion.org@lists.openembedded.org">linuxfoundation.org@lists.openembedded.org=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Perf&#39;s build process generates two copies of its internal headers,<br>
one at tools/lib/perf/include/internal and one at libperf/include/internal<=
br>
with files like xyarray.h. Although the files are identical, the binaries i=
ncluding<br>
them would see them at different paths and have different debuginfo data.<b=
r>
<br>
To avoid this, build libperf.a first, which will ensure the libperf<br>
headers directory exists. This is used in preference to the other by<br>
the build process and results in consistent binaries.<br></blockquote><div>=
<br></div><div><div class=3D"gmail_default" style=3D"font-size:small">That =
explains the race.=C2=A0 I was looking at the Makefile&#39;s=C2=A0yesterday=
</div><div class=3D"gmail_default" style=3D"font-size:small">and hadn&#39;t=
 quite put my finger on what it was yet.</div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"f=
ont-size:small">I&#39;ve fought with the copies of those headers for years =
as well. It</div><div class=3D"gmail_default" style=3D"font-size:small">was=
 worse before we started copying the perf source code out</div><div class=
=3D"gmail_default" style=3D"font-size:small">the way we do now.</div><br></=
div><div><div class=3D"gmail_default" style=3D"font-size:small">I don&#39;t=
 see any issues with the approach, I&#39;ve done the same in</div><div clas=
s=3D"gmail_default" style=3D"font-size:small">the past. It is better than o=
ptions like moving them, removing them</div><div class=3D"gmail_default" st=
yle=3D"font-size:small">or messing with -j1 builds, or new Makefile targets=
, etc.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small">With your comment =
explaining the situation in the code, we won&#39;t</div><div class=3D"gmail=
_default" style=3D"font-size:small">even undo it by mistake :)</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gma=
il_default" style=3D"font-size:small">Acked-by: Bruce Ashfield &lt;<a href=
=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt;</div>=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a> | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"nor=
eferrer" target=3D"_blank">perf.bb</a> b/meta/recipes-kernel/perf/<a href=
=3D"http://perf.bb" rel=3D"noreferrer" target=3D"_blank">perf.bb</a><br>
index b142b090b55..e1915207eed 100644<br>
--- a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a><br>
+++ b/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a><br>
@@ -171,6 +171,10 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s|\$(libdir)=
/traceevent/plugins|\$(libdir)/traceevent_${KERNEL_VERSION}/plugins|g&#39; =
${S}/tools/lib/traceevent/plugins/Makefile<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 test -e ${S}/tools/perf/Makefile.config &amp;&a=
mp; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s|\$(libdir)=
/traceevent/plugins|\$(libdir)/traceevent_${KERNEL_VERSION}/plugins|g&#39; =
${S}/tools/perf/Makefile.config<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# There are two copies of internal headers such=
 as:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# libperf/include/internal/xyarray.h and tools/=
lib/perf/include/internal/xyarray.h<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# For reproducibile binaries, we need to find o=
ne copy, hence force libperf to be created first<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake ${B}/libperf/libperf.a<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake all<br>
=C2=A0}<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#223269): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/223269" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/223269</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115186108/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/115186108/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000b42b22063e8621ad--

