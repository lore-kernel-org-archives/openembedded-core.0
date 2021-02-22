Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web09.36929.1614008233721881333
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 07:37:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rOZg8IWR;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: jatedev@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 75so10418747pgf.13
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 07:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4tCh9RL+AdeJ4XXPMMDemJKhJ378tBsmwMYR7TuKYMg=;
        b=rOZg8IWR8B4/Ym7Wbauw9sU7xdFQ4Bqe4WGduiaR3exCHLSoJNv0ZmxoB0XEcOgbT0
         /Cf4LwAb7xLww8Bx4s4OP2rdI84HiQurtvIRaaw5nqHDLOkXO9+uFCNNv6Qnhs6sTvrf
         lmerokdlcXDTfJvAhayMpf9EuUQ+Sw57si68wK8oSm+Bus0DdY2tkMVJwVhktu4cOr0N
         vx+AYVLopeZA1a6ka39S4mAztKYpXyg0kVwXxDYlUtDVwpRuVHUWPpXRd6tXhXaFNliY
         KnWEv5P0fKhUBpWXklL2H82F5SnrWXsFJseIx481m/j343LiyvXqCaDLhyZ1sxoTIPom
         aHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4tCh9RL+AdeJ4XXPMMDemJKhJ378tBsmwMYR7TuKYMg=;
        b=t/FvHmltxYyB/skWpyIuLbW7qvw4CIheOsuHNsZIgAlrMFM4KH3hzYe9mi5EaORjUD
         glCD3oOYG4bBRHgjvbCSBqIbqSBfpZGbT1X07Ageb+XczZ8A99XNZLkCQHC8Ftq/l/zS
         oCVt2/GzP3a4hl8rlXyUIHqWIlE5cWr+Ya/E4HDWwlq+M2zacXzK0VEh2//r68Z0e3lx
         4hb0uQXpsPHR+6kq45ejZbV0PpZC4Sb+BXKRHvSCxGMmDKHJBx5iKJo02TJgqYKx8W0i
         qn4DXL4HLuRvwxKORFxpfq2qPbjwf3kWfPXy2RBONkJlfw6JCtMVMdyY8DLihuRmDWqS
         gVpg==
X-Gm-Message-State: AOAM532+VcllSu5d2QhlrdXlvPFqRK7iJTe0QOMdMajvE/Ru7F0WyrVL
	XUOeyR6PiPKaowKhQ29WemGbRTZP1ILPpcamquI=
X-Google-Smtp-Source: ABdhPJzWGb3z6bIVyyBPra+b+ruMTexJKbldlcEB25k2qOOWiCwUPliOOeyEauGAafKiykOlCyuPShAbk+tGicpVx88=
X-Received: by 2002:a63:c60b:: with SMTP id w11mr20020788pgg.215.1614008233228;
 Mon, 22 Feb 2021 07:37:13 -0800 (PST)
MIME-Version: 1.0
References: <20210219175307.46218-1-jatedev@gmail.com> <20210219175307.46218-2-jatedev@gmail.com>
 <d03dd49676e706f3806dfa902ede127541c5a757.camel@linuxfoundation.org>
In-Reply-To: <d03dd49676e706f3806dfa902ede127541c5a757.camel@linuxfoundation.org>
From: "Jate Sujjavanich" <jatedev@gmail.com>
Date: Mon, 22 Feb 2021 10:37:01 -0500
Message-ID: <CAPphmgbMCQFgsFP2A8bTSF_6ZPg=0zJwrsOdM49M0VprX0xuaA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] iputils: Fix setcap/setuid of executables
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>, Jose Quaresma <quaresma.jose@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000067fb2505bbee9365"

--00000000000067fb2505bbee9365
Content-Type: text/plain; charset="UTF-8"

I have submitted to the upstream which I believe is the github
iputils/iputils project.

My previous thread had the wrong mailing list address, so I am replying to
this question here:
>Thinking further, how about changing the PACKAGECONFIG to:
>
>PACKAGECONFIG[libcap] = "-DUSE_CAP=true, -DUSE_CAP=false
-DNO_SETCAP_OR_SUID=true, libcap libcap-native"
>
>?
>
>Cheers,
>
>Richard

This would disable the fallback to setuid if PACKAGECONFIG libcap was
disabled.

- Jate



On Fri, Feb 19, 2021 at 12:57 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2021-02-19 at 17:53 +0000, Jate Sujjavanich wrote:
> > Limit setcap search to PATH for cross builds preventing host
> > contamination. Add DEPENDS for libcap-native to supply this for
> > PACKAGECONFIG libcap.
> >
> > The previous setting of NO_SETCAP_OR_SUID broke setuid or setcap of
> > /bin/ping and other executables.
> >
> > Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
> > ---
> >  ...tcap-search-to-PATH-for-cross-builds.patch | 33 +++++++++++++++++++
> >  .../iputils/iputils_s20200821.bb              |  3 +-
> >  2 files changed, 35 insertions(+), 1 deletion(-)
> >  create mode 100644
> meta/recipes-extended/iputils/iputils/0001-Limit-setcap-search-to-PATH-for-cross-builds.patch
> >
> > diff --git
> a/meta/recipes-extended/iputils/iputils/0001-Limit-setcap-search-to-PATH-for-cross-builds.patch
> b/meta/recipes-extended/iputils/iputils/0001-Limit-setcap-search-to-PATH-for-cross-builds.patch
> > new file mode 100644
> > index 0000000000..b09cdb5f13
> > --- /dev/null
> > +++
> b/meta/recipes-extended/iputils/iputils/0001-Limit-setcap-search-to-PATH-for-cross-builds.patch
> > @@ -0,0 +1,33 @@
> > +From aedb7811d1e9b0eae5d33b5bed39f6219a06a8dc Mon Sep 17 00:00:00 2001
> > +From: Jate Sujjavanich <jatedev@gmail.com>
> > +Date: Thu, 18 Feb 2021 21:35:03 -0500
> > +Subject: [PATCH] Limit setcap search to PATH for cross builds
> > +
> > +Upstream-Status: Pending
> > +---
> > + meson.build | 9 ++++++++-
> > + 1 file changed, 8 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/meson.build b/meson.build
> > +index aff75a2..16bbfb6 100644
> > +--- a/meson.build
> > ++++ b/meson.build
> > +@@ -215,7 +215,14 @@ config_h = configure_file(
> > +     output : 'config.h',
> > +     configuration : conf)
> > +
> > +-setcap = find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap',
> required : false)
> > ++if meson.is_cross_build()
> > ++    message('limit setcap search to PATH')
> > ++    path_setcap = ['setcap']
> > ++else
> > ++    message('search for setcap in PATH and admin dirs')
> > ++    path_setcap = ['setcap', '/usr/sbin/setcap', '/sbin/setcap']
> > ++endif
> > ++setcap = find_program(path_setcap, required : false)
> > + if cap_dep.found() and setcap.found()
> > +     perm_type = 'caps'
> > +     setcap_path = setcap.path()
> > +--
> >
>
>
> This does look like ultimately the better solution, could you send it to
> iputils and see what they make of it? I'm keen to try and reduce the number
> of patches we carry and this one looks like a good candiate for them
> covering
> the key edge cases as far as I can tell!
>
> Cheers,
>
> Richard
>
>

--00000000000067fb2505bbee9365
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I have submitted to the upstream which I believe is t=
he github iputils/iputils project.<br></div><div><br></div><div>My previous=
 thread had the wrong mailing list address, so I am replying to this questi=
on here:</div><div>&gt;Thinking further, how about changing the=C2=A0PACKAG=
ECONFIG to:<br>
&gt;<br>
&gt;PACKAGECONFIG[libcap] =3D &quot;-DUSE_CAP=3Dtrue, -DUSE_CAP=3Dfalse -DN=
O_SETCAP_OR_SUID=3Dtrue, libcap libcap-native&quot;<br>
&gt;<br>
&gt;?<br>
&gt;<br>
&gt;Cheers,<br>
&gt;<br>
&gt;Richard</div><div><br></div><div>This would disable the fallback to set=
uid if PACKAGECONFIG libcap was disabled.</div><div><br></div><div>- Jate<b=
r></div><div><div class=3D"gmail-adL"><br><br></div></div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 19, 2=
021 at 12:57 PM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Fri, 2021-02-19 at 17:53=
 +0000, Jate Sujjavanich wrote:<br>
&gt; Limit setcap search to PATH for cross builds preventing host<br>
&gt; contamination. Add DEPENDS for libcap-native to supply this for<br>
&gt; PACKAGECONFIG libcap.<br>
&gt; <br>
&gt; The previous setting of NO_SETCAP_OR_SUID broke setuid or setcap of<br=
>
&gt; /bin/ping and other executables.<br>
&gt; <br>
&gt; Signed-off-by: Jate Sujjavanich &lt;<a href=3D"mailto:jatedev@gmail.co=
m" target=3D"_blank">jatedev@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0...tcap-search-to-PATH-for-cross-builds.patch | 33 +++++++++++++=
++++++<br>
&gt; =C2=A0.../iputils/<a href=3D"http://iputils_s20200821.bb" rel=3D"noref=
errer" target=3D"_blank">iputils_s20200821.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +-<br>
&gt; =C2=A02 files changed, 35 insertions(+), 1 deletion(-)<br>
&gt; =C2=A0create mode 100644 meta/recipes-extended/iputils/iputils/0001-Li=
mit-setcap-search-to-PATH-for-cross-builds.patch<br>
&gt; <br>
&gt; diff --git a/meta/recipes-extended/iputils/iputils/0001-Limit-setcap-s=
earch-to-PATH-for-cross-builds.patch b/meta/recipes-extended/iputils/iputil=
s/0001-Limit-setcap-search-to-PATH-for-cross-builds.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..b09cdb5f13<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-extended/iputils/iputils/0001-Limit-setcap-search-t=
o-PATH-for-cross-builds.patch<br>
&gt; @@ -0,0 +1,33 @@<br>
&gt; +From aedb7811d1e9b0eae5d33b5bed39f6219a06a8dc Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Jate Sujjavanich &lt;<a href=3D"mailto:jatedev@gmail.com" targe=
t=3D"_blank">jatedev@gmail.com</a>&gt;<br>
&gt; +Date: Thu, 18 Feb 2021 21:35:03 -0500<br>
&gt; +Subject: [PATCH] Limit setcap search to PATH for cross builds<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +---<br>
&gt; + meson.build | 9 ++++++++-<br>
&gt; + 1 file changed, 8 insertions(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/meson.build b/meson.build<br>
&gt; +index aff75a2..16bbfb6 100644<br>
&gt; +--- a/meson.build<br>
&gt; ++++ b/meson.build<br>
&gt; +@@ -215,7 +215,14 @@ config_h =3D configure_file(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0output : &#39;config.h&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0configuration : conf)<br>
&gt; + <br>
&gt; +-setcap =3D find_program(&#39;setcap&#39;, &#39;/usr/sbin/setcap&#39;=
, &#39;/sbin/setcap&#39;, required : false)<br>
&gt; ++if meson.is_cross_build()<br>
&gt; ++=C2=A0 =C2=A0 message(&#39;limit setcap search to PATH&#39;)<br>
&gt; ++=C2=A0 =C2=A0 path_setcap =3D [&#39;setcap&#39;]<br>
&gt; ++else<br>
&gt; ++=C2=A0 =C2=A0 message(&#39;search for setcap in PATH and admin dirs&=
#39;)<br>
&gt; ++=C2=A0 =C2=A0 path_setcap =3D [&#39;setcap&#39;, &#39;/usr/sbin/setc=
ap&#39;, &#39;/sbin/setcap&#39;]<br>
&gt; ++endif<br>
&gt; ++setcap =3D find_program(path_setcap, required : false)<br>
&gt; + if cap_dep.found() and setcap.found()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0perm_type =3D &#39;caps&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0setcap_path =3D setcap.path()<br>
&gt; +-- <br>
&gt; <br>
<br>
<br>
This does look like ultimately the better solution, could you send it to=C2=
=A0<br>
iputils and see what they make of it? I&#39;m keen to try and reduce the nu=
mber<br>
of patches we carry and this one looks like a good candiate for them coveri=
ng<br>
the key edge cases as far as I can tell!<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>

--00000000000067fb2505bbee9365--
