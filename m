Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web11.14870.1602253159141963554
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 07:19:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=DNflKyLM;
 spf=pass (domain: blade-group.com, ip: 209.85.210.41, mailfrom: yann.dirson@blade-group.com)
Received: by mail-ot1-f41.google.com with SMTP id 60so9137024otw.3
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2020 07:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wr4P3I07vCf5wAu0nACOf45K0rbxZ4mEDaSK7U17yF8=;
        b=DNflKyLMEZ62ygfCmmQRKT5/xLbOP7GOZk3sB+BPs4iTSlih9JNSUu7zxiM+mjAgUa
         CKf9geNeC2HVpM8oqAQbx7SydRyxotouRpRYYYf0Kg8J0tTx14zLtJj8wn06HUrZOBm7
         YKifwYmE3b0h8VQkAwDUIl7BGL9I7yBN4oRkaDpfohWM8HLpMT+WK5Rx295OqSoJEYEm
         rMvF8PeFJMeskZChUg6Hx5mgDY6bl5zsubpTCrRi3FxLbtd4+wZF649sTei54j1L+Gwy
         LrGxa7kQJEpZWn5FfB/uSuxh3Bzay4W1g/q7gAN6DIkqi1W/XypwoGOHvb3og62gijWs
         zU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wr4P3I07vCf5wAu0nACOf45K0rbxZ4mEDaSK7U17yF8=;
        b=gH62xh4nGT6GZ9cdCZUVl30eVEvcvg5vUjzzZl81rxkkgjmJ1Mbq8z/G2MDbafIAsM
         B0pKBZQefPrIGl5eO2oqvNIZ8BRoCNhTj5/lKi+BkyRcBdzjkSJ8uaZGByg5nPUHFqgT
         GBEmEE2d2yMiDltZmwRDxgEr6OALQ8ePpsAZ3qn82/s5l68Ya5KU2IdYaDHHRL8QtSRj
         j+eA1QuiNsWNjS6xlW/GjiRMMuX8Rx7ifI0Gn9nd8S6kboy1/L79R/M4iAOa3WD5xOGw
         +LhanSQq2mTlXu0bgYLYKkbLfrMaCZYNbVTVpMj4Bx+hpyA6W2EGXcVk3IM+VcJQcXVZ
         ziKQ==
X-Gm-Message-State: AOAM530QD3shdioSYkCoj5vGZBASUPyYsbTcvvncZqIkSEzTN4DtUxlB
	AGa0Rsq06u5OmbaiL3JgP/eid26DWJpvjqLBzpoHlw==
X-Google-Smtp-Source: ABdhPJwIAfyHm7hKPq9ewvAESu94qpqXp9qv+5K/5vBQZkm2X77Flkd/JvINRjj06NaKC+jfbLb8grIPrxBfsSLCtzw=
X-Received: by 2002:a9d:7384:: with SMTP id j4mr9299875otk.191.1602253158409;
 Fri, 09 Oct 2020 07:19:18 -0700 (PDT)
MIME-Version: 1.0
References: <20201009085527.1993257-1-yann@blade-group.com> <9993e144fbf35c6b3231108bc7b23f8ff92b5246.camel@linuxfoundation.org>
In-Reply-To: <9993e144fbf35c6b3231108bc7b23f8ff92b5246.camel@linuxfoundation.org>
From: "Yann Dirson" <yann.dirson@blade-group.com>
Date: Fri, 9 Oct 2020 16:19:06 +0200
Message-ID: <CA+4=imaZG5EtbwVbei9yCmELA4jDHhJ_DeNAfALKdTbbchOCkg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rngd: fix --debug to also filter syslog() calls
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>
Content-Type: multipart/alternative; boundary="000000000000590e0305b13da29a"

--000000000000590e0305b13da29a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 9 oct. 2020 =C3=A0 15:00, Richard Purdie <
richard.purdie@linuxfoundation.org> a =C3=A9crit :

> On Fri, 2020-10-09 at 10:55 +0200, Yann Dirson wrote:
> > From: Yann Dirson <yann@blade-group.com>
> >
> > Debug logs were only controlled by --debug flag while in --foreground
> mode.
> > In --daemon mode (the default for us) /var/log/message got stuffed wit=
h
> > details of entropy pool refilling, which is useless in production, and
> > hamful when log rotation then gets rid of the more useful logs.
> >
> > This change makes the two modes consistently only produce debug logs w=
hen
> > --debug is specified.
> >
> > Signed-off-by: Yann Dirson <yann@blade-group.com>
> > ---
> >  .../rng-tools/rngd-debug-filter.patch         | 22 ++++++++++++++++++=
+
> >  .../rng-tools/rng-tools_6.10.bb               |  1 +
> >  2 files changed, 23 insertions(+)
> >  create mode 100644
> meta/recipes-support/rng-tools/rng-tools/rngd-debug-filter.patch
> >
> > diff --git
> a/meta/recipes-support/rng-tools/rng-tools/rngd-debug-filter.patch
> b/meta/recipes-support/rng-tools/rng-tools/rngd-debug-filter.patch
> > new file mode 100644
> > index 0000000000..320f0257e6
> > --- /dev/null
>
>
> This patch has no description, author or Upstream-Status: information
> in it. It needs such information to be considered. It would be helpful
> if the change was submitted upstream too, not sure if you've looked at
> that? We try not to carry patches if we can.
>

Lignthnig-speed upstream merged the patch after I re-rolled, is it worth a
v3 tagged "accepted" ?


> Cheers,
>
> Richard
>
> > +++ b/meta/recipes-support/rng-tools/rng-tools/rngd-debug-filter.patch
> > @@ -0,0 +1,22 @@
> > +Index: git/rngd.h
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- git.orig/rngd.h
> > ++++ git/rngd.h
> > +@@ -145,13 +145,13 @@ extern bool quiet;
> > + #define message(priority,fmt,args...) do { \
> > +     if (quiet) \
> > +             break;\
> > ++    if (arguments->debug =3D=3D false && LOG_PRI(priority) =3D=3D LO=
G_DEBUG) \
> > ++            break;\
> > +     if (am_daemon) { \
> > +             syslog((priority), fmt, ##args); \
> > +     } else if (!msg_squash) { \
> > +-            if ((LOG_PRI(priority) !=3D LOG_DEBUG) || (arguments->de=
bug
> =3D=3D true)) {\
> > +-                    fprintf(stderr, fmt, ##args); \
> > +-                    fflush(stderr); \
> > +-            } \
> > ++            fprintf(stderr, fmt, ##args); \
> > ++            fflush(stderr); \
> > +     } \
> > + } while (0)
> > +
> > diff --git a/meta/recipes-support/rng-tools/rng-tools_6.10.bb
> b/meta/recipes-support/rng-tools/rng-tools_6.10.bb
> > index 3f9720e406..98fb7aa775 100644
> > --- a/meta/recipes-support/rng-tools/rng-tools_6.10.bb
> > +++ b/meta/recipes-support/rng-tools/rng-tools_6.10.bb
> > @@ -12,6 +12,7 @@ SRC_URI =3D "\
> >      git://github.com/nhorman/rng-tools.git \
> >      file://a4b6d9ce64f132e463b9091d0536913ddaf11516.patch \
> >      file://dab16a5fd4efde8ef569b358e19b1fcbc7d0d938.patch \
> > +    file://rngd-debug-filter.patch \
> >      file://init \
> >      file://default \
> >      file://rngd.service \
> >=20
> >
>
>

--=20
Yann Dirson <yann@blade-group.com>
Blade / Shadow -- http://shadow.tech

--000000000000590e0305b13da29a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 9 oct. 2020 =C3=A0=C2=A0=
15:00, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.=
org">richard.purdie@linuxfoundation.org</a>&gt; a =C3=A9crit=C2=A0:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, 2020-10-09 at 1=
0:55 +0200, Yann Dirson wrote:<br>
&gt; From: Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com" target=
=3D"_blank">yann@blade-group.com</a>&gt;<br>
&gt; <br>
&gt; Debug logs were only controlled by --debug flag while in --foreground=
 mode.<br>
&gt; In --daemon mode (the default for us) /var/log/message got stuffed wi=
th<br>
&gt; details of entropy pool refilling, which is useless in production, an=
d<br>
&gt; hamful when log rotation then gets rid of the more useful logs.<br>
&gt; <br>
&gt; This change makes the two modes consistently only produce debug logs =
when<br>
&gt; --debug is specified.<br>
&gt; <br>
&gt; Signed-off-by: Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com=
" target=3D"_blank">yann@blade-group.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../rng-tools/rngd-debug-filter.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 22 +++++++++++++++++++<br>
&gt;=C2=A0 .../rng-tools/<a href=3D"http://rng-tools_6.10.bb" rel=3D"noref=
errer" target=3D"_blank">rng-tools_6.10.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 23 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/rng-tools/rng-tools/rng=
d-debug-filter.patch<br>
&gt; <br>
&gt; diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd-debug-filt=
er.patch b/meta/recipes-support/rng-tools/rng-tools/rngd-debug-filter.patch=
<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..320f0257e6<br>
&gt; --- /dev/null<br>
<br>
<br>
This patch has no description, author or Upstream-Status: information<br>
in it. It needs such information to be considered. It would be helpful<br>
if the change was submitted upstream too, not sure if you&#39;ve looked at=
<br>
that? We try not to carry patches if we can.<br></blockquote><div><br></di=
v><div>Lignthnig-speed upstream merged the patch after I re-rolled, is it w=
orth a v3 tagged &quot;accepted&quot; ?</div><div><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
&gt; +++ b/meta/recipes-support/rng-tools/rng-tools/rngd-debug-filter.patc=
h<br>
&gt; @@ -0,0 +1,22 @@<br>
&gt; +Index: git/rngd.h<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- git.orig/rngd.h<br>
&gt; ++++ git/rngd.h<br>
&gt; +@@ -145,13 +145,13 @@ extern bool quiet;<br>
&gt; + #define message(priority,fmt,args...) do { \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (quiet) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;\<br>
&gt; ++=C2=A0 =C2=A0 if (arguments-&gt;debug =3D=3D false &amp;&amp; LOG_P=
RI(priority) =3D=3D LOG_DEBUG) \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (am_daemon) { \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0syslog((priority), f=
mt, ##args); \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else if (!msg_squash) { \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((LOG_PRI(priority) !=
=3D LOG_DEBUG) || (arguments-&gt;debug =3D=3D true)) {\<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fprintf(stderr, fmt, ##args); \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fflush(stderr); \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, fmt, ##ar=
gs); \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fflush(stderr); \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} \<br>
&gt; + } while (0)<br>
&gt; + <br>
&gt; diff --git a/meta/recipes-support/rng-tools/<a href=3D"http://rng-too=
ls_6.10.bb" rel=3D"noreferrer" target=3D"_blank">rng-tools_6.10.bb</a> b/me=
ta/recipes-support/rng-tools/<a href=3D"http://rng-tools_6.10.bb" rel=3D"no=
referrer" target=3D"_blank">rng-tools_6.10.bb</a><br>
&gt; index 3f9720e406..98fb7aa775 100644<br>
&gt; --- a/meta/recipes-support/rng-tools/<a href=3D"http://rng-tools_6.10=
.bb" rel=3D"noreferrer" target=3D"_blank">rng-tools_6.10.bb</a><br>
&gt; +++ b/meta/recipes-support/rng-tools/<a href=3D"http://rng-tools_6.10=
.bb" rel=3D"noreferrer" target=3D"_blank">rng-tools_6.10.bb</a><br>
&gt; @@ -12,6 +12,7 @@ SRC_URI =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.com/nhorman/rng-to=
ols.git" rel=3D"noreferrer" target=3D"_blank">github.com/nhorman/rng-tools.=
git</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://a4b6d9ce64f132e463b9091d0536913ddaf11516.p=
atch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://dab16a5fd4efde8ef569b358e19b1fcbc7d0d938.p=
atch \<br>
&gt; +=C2=A0 =C2=A0 file://rngd-debug-filter.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://init \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://default \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://rngd.service \<br>
&gt; <br>
&gt; <br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature">Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com" ta=
rget=3D"_blank">yann@blade-group.com</a>&gt;<br>Blade / Shadow -- <a href=
=3D"http://shadow.tech" target=3D"_blank">http://shadow.tech</a><br><br></=
div></div>

--000000000000590e0305b13da29a--
