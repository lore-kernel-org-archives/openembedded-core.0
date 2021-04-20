Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.web11.129.1618940068553965773
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 10:34:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b2xZBbnd;
 spf=pass (domain: gmail.com, ip: 209.85.222.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f43.google.com with SMTP id 23so2951151uac.9
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Apr 2021 10:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8ZQvloOfpgVGaBQ1aD103yTAQckENnfS+GqJQd7rqO0=;
        b=b2xZBbndyzKgpHVjE3uBdgapohkADBSqyYup8EJOYiWRnypUXY/v/ZadJvAsFsHH+2
         qeOPRx+oWHLyihZwQYlJZJIWRF6nNjGmahZ3IpKwgAiySYDL5PCJpN1deHfzx3QAHvWk
         uaJioYFAcovKb7jCNR51EiS0EOIBTGqSH+AONLL6HoCX+GxvrV88qlOHwwYZagqG/eZl
         OtXHbA1RueGp5FWDY3E9loOJ7k6ckzo442sX+ZnGVMYN/bMfVpibX66UBFrZCbNSfJbZ
         b0qqEc5VfK/UW8RL0ykw0NCE845Vj//nyJm9PSlXrn1EM/UppsLAawMk5A2Ou7rKKC3Z
         O30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8ZQvloOfpgVGaBQ1aD103yTAQckENnfS+GqJQd7rqO0=;
        b=IcaWHwjARpy6zikpZoAD/ktOLpmGXAp1YA+l1jpE2jNqppFTzqDfUrcjeboAFeReKN
         otyXionERmzsClhBahUCDHtbYJ24AwNHcO6gf7G4MR/WpnQC4wTiF81i9hu821ogS1Dk
         FUAEdHye7UpsqaT5cYAA6EnoRAVCyxKhZ1SjcnM9PAwVukUFgW5S79B9zZu31d9pqHyh
         e4iRGLBatvXG9Mh9V0Vp+j3vaC2Geeu+e4yuF/KN1ghJYdfGtXNDh7TYocowjjqaUUjs
         oYFhj8Ib1vfiL7A01qmaqFdVqyRaifO1JMpFT/LeCizsRqqyKhi5+QkPZ6W5VpJrdsck
         d1Kw==
X-Gm-Message-State: AOAM530MY6K3gMtE1hzYzUoOzRhdUcg7m7UMfWp3Ort3Izwm9padNoWP
	PywsLs6YTzBaDsWjpiz37UUvhyeFPKGvUcGuMw4=
X-Google-Smtp-Source: ABdhPJxgIjTXpntmixXOfFc+Ty3oF/3pwirkqurtY3H/AR42OldkQ3mXq3h7c/QMBE97ovkCZ6s1fiQ27tGZfa09xb0=
X-Received: by 2002:a9f:3728:: with SMTP id z37mr13534963uad.89.1618940067678;
 Tue, 20 Apr 2021 10:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210420120549.608450-1-alex.kanavin@gmail.com> <b79886e0-9872-b957-21b4-587b1858f9b7@gmail.com>
In-Reply-To: <b79886e0-9872-b957-21b4-587b1858f9b7@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 20 Apr 2021 19:34:16 +0200
Message-ID: <CANNYZj9nsis3ZWC3=A+1jmxzaGZ73f5cs0Jje3sEQ-620ffG5g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] elfutils: correct debuginfod builds on x32
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a5901f05c06adb28"

--000000000000a5901f05c06adb28
Content-Type: text/plain; charset="UTF-8"

Then the patch needs to guard %lld only for those architectures, and I am
not sure how to do that.

Alex

On Tue, 20 Apr 2021 at 17:59, Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 4/20/21 5:05 AM, Alexander Kanavin wrote:
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >   .../elfutils/elfutils_0.183.bb                |  3 +
> >   ...infod-client.c-correct-string-format.patch | 60 +++++++++++++++++++
> >   2 files changed, 63 insertions(+)
> >   create mode 100644
> meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
> >
> > diff --git a/meta/recipes-devtools/elfutils/elfutils_0.183.bb
> b/meta/recipes-devtools/elfutils/elfutils_0.183.bb
> > index 8b1dece200..a4ea8da32e 100644
> > --- a/meta/recipes-devtools/elfutils/elfutils_0.183.bb
> > +++ b/meta/recipes-devtools/elfutils/elfutils_0.183.bb
> > @@ -29,6 +29,9 @@ SRC_URI_append_libc-musl = " \
> >              file://0004-Fix-error-on-musl.patch \
> >              file://0015-config-eu.am-do-not-use-Werror.patch \
> >              "
> > +SRC_URI_append_x86-x32 = " \
> > +
>  file://0001-debuginfod-debuginfod-client.c-correct-string-format.patch \
> > +           "
> >   SRC_URI[sha256sum] =
> "c3637c208d309d58714a51e61e63f1958808fead882e9b607506a29e5474f2c5"
> >
> >   inherit autotools gettext ptest pkgconfig
> > diff --git
> a/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
> b/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
> > new file mode 100644
> > index 0000000000..a2737b9fe6
> > --- /dev/null
> > +++
> b/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
> > @@ -0,0 +1,60 @@
> > +From f4231bfbb61cd4962638766a7072f4295ed39150 Mon Sep 17 00:00:00 2001
> > +From: Alexander Kanavin <alex.kanavin@gmail.com>
> > +Date: Mon, 19 Apr 2021 23:29:10 +0200
> > +Subject: [PATCH] debuginfod/debuginfod-client.c: correct string format
> on x32
> > +
> > +Upstream-Status: Inappropriate [x32-specific; few, if any people care
> about it anymore]
>
> This is worth upstreaming, since 32 bit architectures with 64bit time_t
> will need.
>
> > +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > +---
> > + debuginfod/debuginfod-client.c | 10 +++++-----
> > + 1 file changed, 5 insertions(+), 5 deletions(-)
> > +
> > +diff --git a/debuginfod/debuginfod-client.c
> b/debuginfod/debuginfod-client.c
> > +index de26af5..a840f23 100644
> > +--- a/debuginfod/debuginfod-client.c
> > ++++ b/debuginfod/debuginfod-client.c
> > +@@ -229,7 +229,7 @@ debuginfod_init_cache (char *cache_path, char
> *interval_path, char *maxage_path)
> > +   if (fd < 0)
> > +     return -errno;
> > +
> > +-  if (dprintf(fd, "%ld", cache_clean_default_interval_s) < 0)
> > ++  if (dprintf(fd, "%lld", cache_clean_default_interval_s) < 0)
> > +     return -errno;
> > +
> > +   /* init max age config file.  */
> > +@@ -237,7 +237,7 @@ debuginfod_init_cache (char *cache_path, char
> *interval_path, char *maxage_path)
> > +       && (fd = open(maxage_path, O_CREAT | O_RDWR, DEFFILEMODE)) < 0)
> > +     return -errno;
> > +
> > +-  if (dprintf(fd, "%ld", cache_default_max_unused_age_s) < 0)
> > ++  if (dprintf(fd, "%lld", cache_default_max_unused_age_s) < 0)
> > +     return -errno;
> > +
> > +   return 0;
> > +@@ -263,7 +263,7 @@ debuginfod_clean_cache(debuginfod_client *c,
> > +       if (interval_file == NULL)
> > +         return -errno;
> > +
> > +-      int rc = fprintf(interval_file, "%ld",
> cache_clean_default_interval_s);
> > ++      int rc = fprintf(interval_file, "%lld",
> cache_clean_default_interval_s);
> > +       fclose(interval_file);
> > +
> > +       if (rc < 0)
> > +@@ -275,7 +275,7 @@ debuginfod_clean_cache(debuginfod_client *c,
> > +   interval_file = fopen(interval_path, "r");
> > +   if (interval_file)
> > +     {
> > +-      if (fscanf(interval_file, "%ld", &clean_interval) != 1)
> > ++      if (fscanf(interval_file, "%lld", &clean_interval) != 1)
> > +         clean_interval = cache_clean_default_interval_s;
> > +       fclose(interval_file);
> > +     }
> > +@@ -291,7 +291,7 @@ debuginfod_clean_cache(debuginfod_client *c,
> > +   max_unused_file = fopen(max_unused_path, "r");
> > +   if (max_unused_file)
> > +     {
> > +-      if (fscanf(max_unused_file, "%ld", &max_unused_age) != 1)
> > ++      if (fscanf(max_unused_file, "%lld", &max_unused_age) != 1)
> > +         max_unused_age = cache_default_max_unused_age_s;
> > +       fclose(max_unused_file);
> > +     }
> >
> >
> >
> > 
> >
>

--000000000000a5901f05c06adb28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Then the patch needs to guard %lld only for those arc=
hitectures, and I am not sure how to do that.</div><div><br></div><div>Alex=
<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Tue, 20 Apr 2021 at 17:59, Khem Raj &lt;<a href=3D"mailto:raj.=
khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><br>
<br>
On 4/20/21 5:05 AM, Alexander Kanavin wrote:<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.../elfutils/<a href=3D"http://elfutils_0.183.bb" rel=3D"=
noreferrer" target=3D"_blank">elfutils_0.183.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +<br>
&gt;=C2=A0 =C2=A0...infod-client.c-correct-string-format.patch | 60 ++++++=
+++++++++++++<br>
&gt;=C2=A0 =C2=A02 files changed, 63 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-devtools/elfutils/files/0=
001-debuginfod-debuginfod-client.c-correct-string-format.patch<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/elfutils/<a href=3D"http://elfutil=
s_0.183.bb" rel=3D"noreferrer" target=3D"_blank">elfutils_0.183.bb</a> b/me=
ta/recipes-devtools/elfutils/<a href=3D"http://elfutils_0.183.bb" rel=3D"no=
referrer" target=3D"_blank">elfutils_0.183.bb</a><br>
&gt; index 8b1dece200..a4ea8da32e 100644<br>
&gt; --- a/meta/recipes-devtools/elfutils/<a href=3D"http://elfutils_0.183=
.bb" rel=3D"noreferrer" target=3D"_blank">elfutils_0.183.bb</a><br>
&gt; +++ b/meta/recipes-devtools/elfutils/<a href=3D"http://elfutils_0.183=
.bb" rel=3D"noreferrer" target=3D"_blank">elfutils_0.183.bb</a><br>
&gt; @@ -29,6 +29,9 @@ SRC_URI_append_libc-musl =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0004-Fix-error=
-on-musl.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0015-config-eu=
.am-do-not-use-Werror.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; +SRC_URI_append_x86-x32 =3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-debuginfod-debu=
ginfod-client.c-correct-string-format.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0SRC_URI[sha256sum] =3D &quot;c3637c208d309d58714a51e61e63=
f1958808fead882e9b607506a29e5474f2c5&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0inherit autotools gettext ptest pkgconfig<br>
&gt; diff --git a/meta/recipes-devtools/elfutils/files/0001-debuginfod-deb=
uginfod-client.c-correct-string-format.patch b/meta/recipes-devtools/elfuti=
ls/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch<br=
>
&gt; new file mode 100644<br>
&gt; index 0000000000..a2737b9fe6<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod=
-client.c-correct-string-format.patch<br>
&gt; @@ -0,0 +1,60 @@<br>
&gt; +From f4231bfbb61cd4962638766a7072f4295ed39150 Mon Sep 17 00:00:00 20=
01<br>
&gt; +From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com=
" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; +Date: Mon, 19 Apr 2021 23:29:10 +0200<br>
&gt; +Subject: [PATCH] debuginfod/debuginfod-client.c: correct string form=
at on x32<br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate [x32-specific; few, if any people car=
e about it anymore]<br>
<br>
This is worth upstreaming, since 32 bit architectures with 64bit time_t <b=
r>
will need.<br>
<br>
&gt; +Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@=
gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + debuginfod/debuginfod-client.c | 10 +++++-----<br>
&gt; + 1 file changed, 5 insertions(+), 5 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/debuginfod/debuginfod-client.c b/debuginfod/debuginfod-=
client.c<br>
&gt; +index de26af5..a840f23 100644<br>
&gt; +--- a/debuginfod/debuginfod-client.c<br>
&gt; ++++ b/debuginfod/debuginfod-client.c<br>
&gt; +@@ -229,7 +229,7 @@ debuginfod_init_cache (char *cache_path, char *i=
nterval_path, char *maxage_path)<br>
&gt; +=C2=A0 =C2=A0if (fd &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return -errno;<br>
&gt; +<br>
&gt; +-=C2=A0 if (dprintf(fd, &quot;%ld&quot;, cache_clean_default_interva=
l_s) &lt; 0)<br>
&gt; ++=C2=A0 if (dprintf(fd, &quot;%lld&quot;, cache_clean_default_interv=
al_s) &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return -errno;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0/* init max age config file.=C2=A0 */<br>
&gt; +@@ -237,7 +237,7 @@ debuginfod_init_cache (char *cache_path, char *i=
nterval_path, char *maxage_path)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; (fd =3D open(maxage_path, O_CR=
EAT | O_RDWR, DEFFILEMODE)) &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return -errno;<br>
&gt; +<br>
&gt; +-=C2=A0 if (dprintf(fd, &quot;%ld&quot;, cache_default_max_unused_ag=
e_s) &lt; 0)<br>
&gt; ++=C2=A0 if (dprintf(fd, &quot;%lld&quot;, cache_default_max_unused_a=
ge_s) &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return -errno;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0return 0;<br>
&gt; +@@ -263,7 +263,7 @@ debuginfod_clean_cache(debuginfod_client *c,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (interval_file =3D=3D NULL)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -errno;<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 int rc =3D fprintf(interval_file, &quot;%ld&qu=
ot;, cache_clean_default_interval_s);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int rc =3D fprintf(interval_file, &quot;%lld&q=
uot;, cache_clean_default_interval_s);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fclose(interval_file);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rc &lt; 0)<br>
&gt; +@@ -275,7 +275,7 @@ debuginfod_clean_cache(debuginfod_client *c,<br>
&gt; +=C2=A0 =C2=A0interval_file =3D fopen(interval_path, &quot;r&quot;);<=
br>
&gt; +=C2=A0 =C2=A0if (interval_file)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if (fscanf(interval_file, &quot;%ld&quot;, &am=
p;clean_interval) !=3D 1)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (fscanf(interval_file, &quot;%lld&quot;, &a=
mp;clean_interval) !=3D 1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clean_interval =3D cache_clean_def=
ault_interval_s;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fclose(interval_file);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +@@ -291,7 +291,7 @@ debuginfod_clean_cache(debuginfod_client *c,<br>
&gt; +=C2=A0 =C2=A0max_unused_file =3D fopen(max_unused_path, &quot;r&quot=
;);<br>
&gt; +=C2=A0 =C2=A0if (max_unused_file)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if (fscanf(max_unused_file, &quot;%ld&quot;, &=
amp;max_unused_age) !=3D 1)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (fscanf(max_unused_file, &quot;%lld&quot;, =
&amp;max_unused_age) !=3D 1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max_unused_age =3D cache_default_m=
ax_unused_age_s;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fclose(max_unused_file);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
</blockquote></div>

--000000000000a5901f05c06adb28--
