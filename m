Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web12.19294.1627909072701366894
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 05:57:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Pw6PPlu8;
 spf=pass (domain: gmail.com, ip: 209.85.222.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id d6so6951112uav.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Aug 2021 05:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oWlaXfV9NdAsDC1ImHFVKUqURvAwrxIWkDxgvUrdL3s=;
        b=Pw6PPlu8f0zlGYs/NuSKyvd8jz76yUZ9W5FMuXuMbL4tP4HOl4pHB0SAvU1FSEJOWd
         /TKEfzqTAXlToVD09zrn8C9qeCSX2Hs+0GDK8/sE9b73TT8ufi//WcWERG9bWbzHDDYW
         4y5ZANeB6VnVRECgMQSGoiRI4P3yACKa/Yb+XB91h9vNSa8w8uhOlvtfuUE23lyxjlEb
         UWP2Q724iQ9msbpDCNod9DUdcSDs+yGSS6w62PmdJSxRbdpd80ovA4GUba/SSgs40V89
         zXKgEV8CPDI6q/04ZlQrvOQ0YW2ta5cIBKDH95t2H1t1xdBucRH6ED5LLVc5COQE1FZ/
         D1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oWlaXfV9NdAsDC1ImHFVKUqURvAwrxIWkDxgvUrdL3s=;
        b=JU25RHZgQjmxHh7CqbUzWLXyc3yTSerjTTuNJpcMjDmXDE+DpChncxvVuW6mgSPNhh
         EpJ1tLcaOv1ADYA9b12T2kCobX73dE5OjrP5F3TXhQSRMDXYJb6OGFye3/UUiGVw6gU4
         G4vD03JKYDvbJHuPZdBBaO7lukbl5GpP6CSviJ4L9nF6XQju5xJ1UBIWnh1J6CLNSlxN
         uy4pTCNqUwEX+kgSPzFGBsA66E1IN6Z9OQfAFDGkkbLOcoJl8cqYN8HZulxWo7dsaF9T
         agzmEF2idpI70nGcT39SwJkvOpMC845UZ5M7OX9pEoIfDmv5Qku494lOlEJktc5Fen3p
         o1vw==
X-Gm-Message-State: AOAM530pqHjucOWlL0c1QrC4D8dGD2ADnajRqie7sZhTRTpg1zvUFrUp
	VHE3QRd3iEQuf0OJFTsUq3DJtGIQ/RUfKPBGJfSh92xbynWi4BSSmbk=
X-Google-Smtp-Source: ABdhPJxqvnxh3ViS0HpzRKshmqYWkFMp4Ni+N+IijYxP7yBC3eCze01mMvB4R2xBhH59lBjDVHxrGleJDLfyG4c5Ko0=
X-Received: by 2002:ab0:60c9:: with SMTP id g9mr1112958uam.100.1627909071779;
 Mon, 02 Aug 2021 05:57:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210802062543.101415-1-Qi.Chen@windriver.com>
In-Reply-To: <20210802062543.101415-1-Qi.Chen@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 2 Aug 2021 14:57:40 +0200
Message-ID: <CANNYZj_OVpNG31euNAgWYbCQ-PBr1A-wQvJmaJGRVnXxQQ0-Pw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] gobject-introspection: fix default search path for girdir
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f33c4305c8931d55"

--000000000000f33c4305c8931d55
Content-Type: text/plain; charset="UTF-8"

The concerns are the same as the previous time this patch was submitted:

This is not seen in the autobuilder, how can it be reproduced?

Also, please submit upstream first.


Alex

On Mon, 2 Aug 2021 at 08:25, Chen Qi <Qi.Chen@windriver.com> wrote:

> When running g-ir-scanner, we get the following error:
>
>   Couldn't find include 'GObject-2.0.gir' (search path:
>   '['/usr/lib64', 'gir-1.0', '/usr/local/share/gir-1.0',
> '/usr/share/gir-1.0',
>   '/usr/share/gir-1.0', '/usr/share/gir-1.0']')
>
> This is because g-ir-tool-template.in is not setting girdir correctly.
> It's using the prefix instead of the actual girdir.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  ...-ir-tool-template.in-fix-girdir-path.patch | 33 +++++++++++++++++++
>  .../gobject-introspection_1.68.0.bb           |  1 +
>  2 files changed, 34 insertions(+)
>  create mode 100644
> meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-g-ir-tool-template.in-fix-girdir-path.patch
>
> diff --git
> a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-g-ir-tool-template.in-fix-girdir-path.patch
> b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-g-ir-tool-template.in-fix-girdir-path.patch
> new file mode 100644
> index 0000000000..c0d263946b
> --- /dev/null
> +++
> b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-g-ir-tool-template.in-fix-girdir-path.patch
> @@ -0,0 +1,33 @@
> +From b01b448613b76f9acefdfd89ee01686dc7a67df4 Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Tue, 13 Jul 2021 02:05:11 -0700
> +Subject: [PATCH] g-ir-tool-template.in: fix girdir path
> +
> +In case gir_dir_prefix is set, it's possible that g-ir-scanner
> +cannot find the .gir files. This is because that the girdir
> +is set to gir_dir_prefix, which is wrong. It's not a prefix,
> +it the actual gir dir.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + tools/g-ir-tool-template.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tools/g-ir-tool-template.in b/tools/g-ir-tool-template.in
> +index 6e98f52e..62c07c31 100755
> +--- a/tools/g-ir-tool-template.in
> ++++ b/tools/g-ir-tool-template.in
> +@@ -55,7 +55,7 @@ builtins.__dict__['DATADIR'] = datadir
> +
> + # Respect gir_dir_prefix
> + girdir = ''
> +-girdir = os.path.abspath(os.path.join(filedir, '..', '@gir_dir_prefix@
> '))
> ++girdir = os.path.abspath(os.path.join(filedir, '..', '@gir_dir_prefix@',
> 'gir-1.0'))
> + builtins.__dict__['GIRDIR'] = [girdir]
> +
> + # Again, relative paths first so that the installation prefix is
> relocatable
> +--
> +2.30.2
> +
> diff --git a/meta/recipes-gnome/gobject-introspection/
> gobject-introspection_1.68.0.bb
> b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb
> index 048deabe64..647511f7ad 100644
> --- a/meta/recipes-gnome/gobject-introspection/
> gobject-introspection_1.68.0.bb
> +++ b/meta/recipes-gnome/gobject-introspection/
> gobject-introspection_1.68.0.bb
> @@ -15,6 +15,7 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=c434e8128a68bedd59b80b2ac1eb1c4a \
>
>  SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}",
> 2)}/${BPN}-${PV}.tar.xz \
>
> file://0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch \
> +           file://0001-g-ir-tool-template.in-fix-girdir-path.patch \
>             "
>
>  SRC_URI[sha256sum] =
> "d229242481a201b84a0c66716de1752bca41db4133672cfcfb37c93eb6e54a27"
> --
> 2.30.2
>
>
> 
>
>

--000000000000f33c4305c8931d55
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The concerns are the same as the previous time this p=
atch was submitted:</div><div><br></div><div><span class=3D"gmail-im"><div =
dir=3D"auto">This is not seen in the autobuilder, how can it be reproduced?=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">Also, please submit ups=
tream first.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><=
div>Alex<br></div></span></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Mon, 2 Aug 2021 at 08:25, Chen Qi &lt;<a =
href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">When running g-i=
r-scanner, we get the following error:<br>
<br>
=C2=A0 Couldn&#39;t find include &#39;GObject-2.0.gir&#39; (search path:<b=
r>
=C2=A0 &#39;[&#39;/usr/lib64&#39;, &#39;gir-1.0&#39;, &#39;/usr/local/shar=
e/gir-1.0&#39;, &#39;/usr/share/gir-1.0&#39;,<br>
=C2=A0 &#39;/usr/share/gir-1.0&#39;, &#39;/usr/share/gir-1.0&#39;]&#39;)<b=
r>
<br>
This is because <a href=3D"http://g-ir-tool-template.in" rel=3D"noreferrer=
" target=3D"_blank">g-ir-tool-template.in</a> is not setting girdir correct=
ly.<br>
It&#39;s using the prefix instead of the actual girdir.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0...-ir-tool-template.in-fix-girdir-path.patch | 33 +++++++++++++++++=
++<br>
=C2=A0.../<a href=3D"http://gobject-introspection_1.68.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">gobject-introspection_1.68.0.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 34 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-=
introspection/0001-g-ir-tool-template.in-fix-girdir-path.patch<br>
<br>
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspectio=
n/0001-g-ir-tool-template.in-fix-girdir-path.patch b/meta/recipes-gnome/gob=
ject-introspection/gobject-introspection/0001-g-ir-tool-template.in-fix-gir=
dir-path.patch<br>
new file mode 100644<br>
index 0000000000..c0d263946b<br>
--- /dev/null<br>
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-=
g-ir-tool-template.in-fix-girdir-path.patch<br>
@@ -0,0 +1,33 @@<br>
+From b01b448613b76f9acefdfd89ee01686dc7a67df4 Mon Sep 17 00:00:00 2001<br=
>
+From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_bla=
nk">Qi.Chen@windriver.com</a>&gt;<br>
+Date: Tue, 13 Jul 2021 02:05:11 -0700<br>
+Subject: [PATCH] <a href=3D"http://g-ir-tool-template.in" rel=3D"noreferr=
er" target=3D"_blank">g-ir-tool-template.in</a>: fix girdir path<br>
+<br>
+In case gir_dir_prefix is set, it&#39;s possible that g-ir-scanner<br>
+cannot find the .gir files. This is because that the girdir<br>
+is set to gir_dir_prefix, which is wrong. It&#39;s not a prefix,<br>
+it the actual gir dir.<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" targe=
t=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
+---<br>
+ tools/<a href=3D"http://g-ir-tool-template.in" rel=3D"noreferrer" target=
=
=3D"_blank">g-ir-tool-template.in</a> | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/tools/<a href=3D"http://g-ir-tool-template.in" rel=3D"norefe=
rrer" target=3D"_blank">g-ir-tool-template.in</a> b/tools/<a href=3D"http:/=
/g-ir-tool-template.in" rel=3D"noreferrer" target=3D"_blank">g-ir-tool-temp=
late.in</a><br>
+index 6e98f52e..62c07c31 100755<br>
+--- a/tools/<a href=3D"http://g-ir-tool-template.in" rel=3D"noreferrer" t=
arget=3D"_blank">g-ir-tool-template.in</a><br>
++++ b/tools/<a href=3D"http://g-ir-tool-template.in" rel=3D"noreferrer" t=
arget=3D"_blank">g-ir-tool-template.in</a><br>
+@@ -55,7 +55,7 @@ builtins.__dict__[&#39;DATADIR&#39;] =3D datadir<br>
+ <br>
+ # Respect gir_dir_prefix<br>
+ girdir =3D &#39;&#39;<br>
+-girdir =3D os.path.abspath(os.path.join(filedir, &#39;..&#39;, &#39;@gir=
_dir_prefix@&#39;))<br>
++girdir =3D os.path.abspath(os.path.join(filedir, &#39;..&#39;, &#39;@gir=
_dir_prefix@&#39;, &#39;gir-1.0&#39;))<br>
+ builtins.__dict__[&#39;GIRDIR&#39;] =3D [girdir]<br>
+ <br>
+ # Again, relative paths first so that the installation prefix is relocat=
able<br>
+-- <br>
+2.30.2<br>
+<br>
diff --git a/meta/recipes-gnome/gobject-introspection/<a href=3D"http://go=
bject-introspection_1.68.0.bb" rel=3D"noreferrer" target=3D"_blank">gobject=
-introspection_1.68.0.bb</a> b/meta/recipes-gnome/gobject-introspection/<a =
href=3D"http://gobject-introspection_1.68.0.bb" rel=3D"noreferrer" target=
=3D"_blank">gobject-introspection_1.68.0.bb</a><br>
index 048deabe64..647511f7ad 100644<br>
--- a/meta/recipes-gnome/gobject-introspection/<a href=3D"http://gobject-i=
ntrospection_1.68.0.bb" rel=3D"noreferrer" target=3D"_blank">gobject-intros=
pection_1.68.0.bb</a><br>
+++ b/meta/recipes-gnome/gobject-introspection/<a href=3D"http://gobject-i=
ntrospection_1.68.0.bb" rel=3D"noreferrer" target=3D"_blank">gobject-intros=
pection_1.68.0.bb</a><br>
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dc434e812=
8a68bedd59b80b2ac1eb1c4a \<br>
<br>
=C2=A0SRC_URI =3D &quot;${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version(&q=
uot;${PV}&quot;, 2)}/${BPN}-${PV}.tar.xz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-giscanner-ignore-err=
or-return-codes-from-ldd-wrapper.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-g-ir-tool-template.i=
n-fix-girdir-path.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;d229242481a201b84a0c66716de1752bca41db4=
133672cfcfb37c93eb6e54a27&quot;<br>
-- <br>
2.30.2<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000f33c4305c8931d55--
