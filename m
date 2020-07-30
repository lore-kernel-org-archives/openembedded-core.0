Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.2752.1596089576787342519
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2020 23:12:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@babayev.com header.s=google header.b=JtqU51Mc;
 spf=pass (domain: babayev.com, ip: 209.85.221.65, mailfrom: ruslan@babayev.com)
Received: by mail-wr1-f65.google.com with SMTP id a5so13732131wrm.6
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2020 23:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=babayev.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ifPUGPslYCnVq4W3h8iuNZVAP8HV8LK+Y4juZfDRB/o=;
        b=JtqU51Mckv+VIOPJnxHNwL8axULOPzNpUQqQu3+qZw9lX4KKGzzJxF/QhGRe+8sd2G
         EWCeSMcf9Lxcgu2+5P9y1ZaYU6sv3IO5KpCBIj4AyBjr+5jcSF+0dPk80hw2v5SKmGXn
         nZTEWEYI1kFjg29YKv2ECCASxrYHxgMQ/V4Q0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ifPUGPslYCnVq4W3h8iuNZVAP8HV8LK+Y4juZfDRB/o=;
        b=VlfAGgbC+Y64FJHQsSbTAkY7/ISJpHOauNRitdoP5otR5D779yioYEhCL97gqWlHJH
         OmSXVqknS1FGLrXcIylfDrxe4o4kMnf7R6F9lBwKvIuMX6ZnlVasFGq4h8f6WPGE7kAh
         ssRgS2u69dKwQYt6FuJKld4xpUIYW+M75YDjBC+e5X0zxsCsKElUftzIUfzM5k/Yse8G
         BS6xG47CpOqho1Jh4VWHUSx07cez9gGZo5PBbVC9U4fBPvJixzAb/XpYZFRVigdeFBDD
         g6r0uDo64ycWTCSDwI0/c6rBQWQ8kdWtOEwPKx7CIEpKyK1vhHBbRGaXs78EJz6NiDL8
         SfoA==
X-Gm-Message-State: AOAM533fAlkd6ETtoEEh5aSXgQBAaPDq150Q3ubkDiC/sedSp3VtTWe6
	Da9idG7e3c9ZnqBu0jnAMz01IGUZUWf27lC2/Yzn+Q==
X-Google-Smtp-Source: ABdhPJwFAzmPXvcvYIZQyhskLQvvG9YGiloY8gMcg9fausHRnc+NapeDMmdZtrCryjLPb/EJ6odjKUwJWqFVWCdk9I0=
X-Received: by 2002:adf:eccc:: with SMTP id s12mr36504872wro.157.1596089575211;
 Wed, 29 Jul 2020 23:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200726015614.2875-1-ruslan@babayev.com> <bcdf3a3c-eda4-1c29-aad4-624fbba95a8e@gmail.com>
In-Reply-To: <bcdf3a3c-eda4-1c29-aad4-624fbba95a8e@gmail.com>
From: "Ruslan Babayev" <ruslan@babayev.com>
Date: Wed, 29 Jul 2020 23:12:44 -0700
Message-ID: <CAOpYhv9MRpHQNbv7Xd9wk2rPobj3=-897b0kLMw7Kq7PSs25KA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] meson: use the more specific cpu arch in cross file
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002918de05aba290b4"

--0000000000002918de05aba290b4
Content-Type: text/plain; charset="UTF-8"

Currently we have both cpu_family and cpu set to TARGET_ARCH which is
wrong. As mentioned before cpu is more specific. E.g where
cpu_family='x86-64' cpu='nehalem'.

Projects using Meson can query for the host_machine.cpu() and expect a more
specific CPU type.
Here's one example:
https://github.com/DPDK/dpdk/blob/74f4d6424da1297bd6e83dcb7bd84444ca8c59dd/config/meson.build#L69




On Wed, Jul 29, 2020 at 9:55 PM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 7/25/20 6:56 PM, Ruslan Babayev wrote:
> > 'cpu' unlike 'cpu_family' must be a more specific subtype for the CPU.
> >
>
> since mcpu/march should provide the right values already, do we need
> this additional logic in meson? dont we get needed settings to meson
> already?
>
> perhaps you can describe some missing cases this would address will help
> understand the usecase
>
> > Signed-off-by: Ruslan Babayev <ruslan@babayev.com>
> > ---
> >   meta/classes/meson.bbclass                         | 14 ++++++++++++--
> >   .../meson/nativesdk-meson_0.53.2.bb                | 12 +++++++++++-
> >   2 files changed, 23 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
> > index ff52d20e56..0caa7a37c2 100644
> > --- a/meta/classes/meson.bbclass
> > +++ b/meta/classes/meson.bbclass
> > @@ -62,6 +62,16 @@ def meson_cpu_family(var, d):
> >       else:
> >           return arch
> >
> > +def meson_cpu(prefix, d):
> > +    import re
> > +    arch = d.getVar(prefix + "_ARCH")
> > +    tune_ccargs = d.getVar("TUNE_CCARGS")
> > +    m = re.search(r"(?<=-march=)\w+|(?<=-mcpu=)\w+", tune_ccargs)
> > +    if m:
> > +        return m.group(0)
> > +    else:
> > +        return arch
> > +
> >   # Map our OS values to what Meson expects:
> >   # https://mesonbuild.com/Reference-tables.html#operating-system-names
> >   def meson_operating_system(var, d):
> > @@ -110,13 +120,13 @@ gtkdoc_exe_wrapper = '${B}/gtkdoc-qemuwrapper'
> >   [host_machine]
> >   system = '${@meson_operating_system('HOST_OS', d)}'
> >   cpu_family = '${@meson_cpu_family('HOST_ARCH', d)}'
> > -cpu = '${HOST_ARCH}'
> > +cpu = '${@meson_cpu('HOST', d)}'
> >   endian = '${@meson_endian('HOST', d)}'
> >
> >   [target_machine]
> >   system = '${@meson_operating_system('TARGET_OS', d)}'
> >   cpu_family = '${@meson_cpu_family('TARGET_ARCH', d)}'
> > -cpu = '${TARGET_ARCH}'
> > +cpu = '${@meson_cpu('TARGET', d)}'
> >   endian = '${@meson_endian('TARGET', d)}'
> >   EOF
> >   }
> > diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.53.2.bb
> b/meta/recipes-devtools/meson/nativesdk-meson_0.53.2.bb
> > index 67add2c25e..021bff0992 100644
> > --- a/meta/recipes-devtools/meson/nativesdk-meson_0.53.2.bb
> > +++ b/meta/recipes-devtools/meson/nativesdk-meson_0.53.2.bb
> > @@ -6,6 +6,16 @@ inherit siteinfo
> >   SRC_URI += "file://meson-setup.py \
> >               file://meson-wrapper"
> >
> > +def meson_cpu(var, d):
> > +    import re
> > +    arch = d.getVar(var)
> > +    tune_ccargs = d.getVar("TUNE_CCARGS")
> > +    m = re.search(r"(?<=-march=)\w+|(?<=-mcpu=)\w+", tune_ccargs)
> > +    if m:
> > +        return m.group(0)
> > +    else:
> > +        return arch
> > +
> >   def meson_endian(prefix, d):
> >       arch, os = d.getVar(prefix + "_ARCH"), d.getVar(prefix + "_OS")
> >       sitedata = siteinfo_data_for_machine(arch, os, d)
> > @@ -44,7 +54,7 @@ cpp_link_args = @LDFLAGS
> >   [host_machine]
> >   system = '${SDK_OS}'
> >   cpu_family = '${SDK_ARCH}'
> > -cpu = '${SDK_ARCH}'
> > +cpu = '${@meson_cpu("SDK_ARCH", d)}'
> >   endian = '${@meson_endian("SDK", d)}'
> >   EOF
> >
> >
> >
> > 
> >
>

--0000000000002918de05aba290b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e;font-size:large">Currently we have both cpu_family and cpu set to TARGET_=
ARCH which is wrong. As mentioned before cpu is more specific. E.g where cp=
u_family=3D&#39;x86-64&#39; cpu=3D&#39;nehalem&#39;.</div><div class=3D"gma=
il_default" style=3D"font-family:monospace;font-size:large">=C2=A0=C2=A0<br=
></div><div class=3D"gmail_default" style=3D"font-family:monospace;font-siz=
e:large">Projects using Meson can query for the host_machine.cpu() and expe=
ct a more specific CPU type.</div><div class=3D"gmail_default" style=3D"fon=
t-family:monospace;font-size:large">Here&#39;s one example:</div><div class=
=
=3D"gmail_default" style=3D"font-family:monospace;font-size:large"><a href=
=
=3D"https://github.com/DPDK/dpdk/blob/74f4d6424da1297bd6e83dcb7bd84444ca8c=
59dd/config/meson.build#L69">https://github.com/DPDK/dpdk/blob/74f4d6424da1=
297bd6e83dcb7bd84444ca8c59dd/config/meson.build#L69</a>=C2=A0</div><div cla=
ss=3D"gmail_default" style=3D"font-family:monospace;font-size:large"><br></=
div><div class=3D"gmail_default" style=3D"font-family:monospace;font-size:l=
arge"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=
=3D"gmail_attr">On Wed, Jul 29, 2020 at 9:55 PM Khem Raj &lt;<a href=3D"ma=
ilto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 7/25/20 6:56 PM, Ruslan Babayev wrote:<br>
&gt; &#39;cpu&#39; unlike &#39;cpu_family&#39; must be a more specific sub=
type for the CPU.<br>
&gt; <br>
<br>
since mcpu/march should provide the right values already, do we need <br>
this additional logic in meson? dont we get needed settings to meson<br>
already?<br>
<br>
perhaps you can describe some missing cases this would address will help <=
br>
understand the usecase<br>
<br>
&gt; Signed-off-by: Ruslan Babayev &lt;<a href=3D"mailto:ruslan@babayev.co=
m" target=3D"_blank">ruslan@babayev.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/classes/meson.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 ++++++++++=
++--<br>
&gt;=C2=A0 =C2=A0.../meson/<a href=3D"http://nativesdk-meson_0.53.2.bb" re=
l=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.53.2.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12 +++++++++++-<br>
&gt;=C2=A0 =C2=A02 files changed, 23 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass<=
br>
&gt; index ff52d20e56..0caa7a37c2 100644<br>
&gt; --- a/meta/classes/meson.bbclass<br>
&gt; +++ b/meta/classes/meson.bbclass<br>
&gt; @@ -62,6 +62,16 @@ def meson_cpu_family(var, d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return arch<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +def meson_cpu(prefix, d):<br>
&gt; +=C2=A0 =C2=A0 import re<br>
&gt; +=C2=A0 =C2=A0 arch =3D d.getVar(prefix + &quot;_ARCH&quot;)<br>
&gt; +=C2=A0 =C2=A0 tune_ccargs =3D d.getVar(&quot;TUNE_CCARGS&quot;)<br>
&gt; +=C2=A0 =C2=A0 m =3D re.search(r&quot;(?&lt;=3D-march=3D)\w+|(?&lt;=
=3D-mcpu=3D)\w+&quot;, tune_ccargs)<br>
&gt; +=C2=A0 =C2=A0 if m:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return m.group(0)<br>
&gt; +=C2=A0 =C2=A0 else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return arch<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0# Map our OS values to what Meson expects:<br>
&gt;=C2=A0 =C2=A0# <a href=3D"https://mesonbuild.com/Reference-tables.html=
#operating-system-names" rel=3D"noreferrer" target=3D"_blank">https://meson=
build.com/Reference-tables.html#operating-system-names</a><br>
&gt;=C2=A0 =C2=A0def meson_operating_system(var, d):<br>
&gt; @@ -110,13 +120,13 @@ gtkdoc_exe_wrapper =3D &#39;${B}/gtkdoc-qemuwra=
pper&#39;<br>
&gt;=C2=A0 =C2=A0[host_machine]<br>
&gt;=C2=A0 =C2=A0system =3D &#39;${@meson_operating_system(&#39;HOST_OS&#3=
9;, d)}&#39;<br>
&gt;=C2=A0 =C2=A0cpu_family =3D &#39;${@meson_cpu_family(&#39;HOST_ARCH&#3=
9;, d)}&#39;<br>
&gt; -cpu =3D &#39;${HOST_ARCH}&#39;<br>
&gt; +cpu =3D &#39;${@meson_cpu(&#39;HOST&#39;, d)}&#39;<br>
&gt;=C2=A0 =C2=A0endian =3D &#39;${@meson_endian(&#39;HOST&#39;, d)}&#39;<=
br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0[target_machine]<br>
&gt;=C2=A0 =C2=A0system =3D &#39;${@meson_operating_system(&#39;TARGET_OS&=
#39;, d)}&#39;<br>
&gt;=C2=A0 =C2=A0cpu_family =3D &#39;${@meson_cpu_family(&#39;TARGET_ARCH&=
#39;, d)}&#39;<br>
&gt; -cpu =3D &#39;${TARGET_ARCH}&#39;<br>
&gt; +cpu =3D &#39;${@meson_cpu(&#39;TARGET&#39;, d)}&#39;<br>
&gt;=C2=A0 =C2=A0endian =3D &#39;${@meson_endian(&#39;TARGET&#39;, d)}&#39=
;<br>
&gt;=C2=A0 =C2=A0EOF<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; diff --git a/meta/recipes-devtools/meson/<a href=3D"http://nativesdk-=
meson_0.53.2.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.53.=
2.bb</a> b/meta/recipes-devtools/meson/<a href=3D"http://nativesdk-meson_0.=
53.2.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.53.2.bb</a>=
<br>
&gt; index 67add2c25e..021bff0992 100644<br>
&gt; --- a/meta/recipes-devtools/meson/<a href=3D"http://nativesdk-meson_0=
.53.2.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.53.2.bb</a=
><br>
&gt; +++ b/meta/recipes-devtools/meson/<a href=3D"http://nativesdk-meson_0=
.53.2.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.53.2.bb</a=
><br>
&gt; @@ -6,6 +6,16 @@ inherit siteinfo<br>
&gt;=C2=A0 =C2=A0SRC_URI +=3D &quot;file://meson-setup.py \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://meson-wr=
apper&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +def meson_cpu(var, d):<br>
&gt; +=C2=A0 =C2=A0 import re<br>
&gt; +=C2=A0 =C2=A0 arch =3D d.getVar(var)<br>
&gt; +=C2=A0 =C2=A0 tune_ccargs =3D d.getVar(&quot;TUNE_CCARGS&quot;)<br>
&gt; +=C2=A0 =C2=A0 m =3D re.search(r&quot;(?&lt;=3D-march=3D)\w+|(?&lt;=
=3D-mcpu=3D)\w+&quot;, tune_ccargs)<br>
&gt; +=C2=A0 =C2=A0 if m:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return m.group(0)<br>
&gt; +=C2=A0 =C2=A0 else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return arch<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0def meson_endian(prefix, d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0arch, os =3D d.getVar(prefix + &quot;_ARCH&=
quot;), d.getVar(prefix + &quot;_OS&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sitedata =3D siteinfo_data_for_machine(arch=
, os, d)<br>
&gt; @@ -44,7 +54,7 @@ cpp_link_args =3D @LDFLAGS<br>
&gt;=C2=A0 =C2=A0[host_machine]<br>
&gt;=C2=A0 =C2=A0system =3D &#39;${SDK_OS}&#39;<br>
&gt;=C2=A0 =C2=A0cpu_family =3D &#39;${SDK_ARCH}&#39;<br>
&gt; -cpu =3D &#39;${SDK_ARCH}&#39;<br>
&gt; +cpu =3D &#39;${@meson_cpu(&quot;SDK_ARCH&quot;, d)}&#39;<br>
&gt;=C2=A0 =C2=A0endian =3D &#39;${@meson_endian(&quot;SDK&quot;, d)}&#39;=
<br>
&gt;=C2=A0 =C2=A0EOF<br>
&gt;=C2=A0 =C2=A0<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
</blockquote></div>

--0000000000002918de05aba290b4--
