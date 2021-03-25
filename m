Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web10.1195.1616696112667871606
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 11:15:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IVPaJR3F;
 spf=pass (domain: gmail.com, ip: 209.85.217.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id e5so1394063vse.4
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Mar 2021 11:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rdFVn3aJBI5sRE7+6mPtzcSGF4tWP5XTR3Ws+wfHqHg=;
        b=IVPaJR3FvYeCY++93vGwR6GMrs7WzCxracG3TWe0GewqeCDWxrHaYWdcOTtC4f78xc
         1MHj21qnM95nh5FFsZdmBR1lPBMuEDpMO7eBJU0OJfcKnHpkskJxHFBOhqEglYag+FM3
         aGztpviQGtvRz2YxTJMYNtNXterPHfyptzISS5fsnZ+dyuAbCxbOhihmHa5PXKOpD6OQ
         4OrM7o7rJjahP5rxemuEH6tn8FdTxb5C+ojrmuZCuHc/9cPAf6MiyPVXk0qooQingK75
         kfQ6mNGGzeTxqswaXnZTSpBLk+93fIog9Ak55VA4IsX/Nh2pW6hOOCe3DxUF16NoUzj9
         M4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rdFVn3aJBI5sRE7+6mPtzcSGF4tWP5XTR3Ws+wfHqHg=;
        b=j1KsBSuAD/Qlo9vNycQHvUXHTw5xwNfmD0fRJICOvhqwMgo2U21D1tQ0laCoxmlZNp
         rBsZNoCRHNg+n7Pkk9cheHpyFbQng6DIP0eyPHu2mG9UHDt32MY0rPHDvT6algr/xPcO
         5v3N0aRkJ/+WxkfcpjdFReheav5WkmZQNknuggW45xxT9XUaqIKyzwRQME6J052Hcu8y
         heQywQ7+WFTpyijz+x16Q7PYTxd49lLp4N9HfsR+MzO6hwSwEB0MPPAu0oBO3V2SZ+Vf
         MNmWWBoizsF0yDbki+nmGvxT+dURtX9y20HAY0eeCC+tBCCXmyjKVyKj3iHc5PXoOxQF
         qAfA==
X-Gm-Message-State: AOAM531mWdJiQyEbEZAOfcpyyLK+adtGjfO8feDX2MlUYHT+CnlGs9sj
	fOArXL4As2lp5rr9eYW/uqre5e0VYO2IxYX3IVY=
X-Google-Smtp-Source: ABdhPJyapfArAr80FkjEGg3xqo9NFGdxL1c3mTfNPpVhRDd7tHC0wmUC6szKAquHs0CFMW5YzKKYJIXzNT40RpAjFDg=
X-Received: by 2002:a67:bc11:: with SMTP id t17mr6207012vsn.51.1616696111813;
 Thu, 25 Mar 2021 11:15:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210325173901.3057180-1-ross.burton@arm.com>
In-Reply-To: <20210325173901.3057180-1-ross.burton@arm.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 25 Mar 2021 19:15:00 +0100
Message-ID: <CANNYZj_mMCVjamiimbWki=r4GFAOXkRPjH6xm3rcSbYkmpewWw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/3] meson: fix native/host confusion in gobject-introspection
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000074574205be606514"

--00000000000074574205be606514
Content-Type: text/plain; charset="UTF-8"

I don't think I fully understand this. Is g-i in meson projects already
broken for a while (there was a bit of refactor in the latest meson
version, which I tested, but perhaps not well enough), or is this necessary
for the other patches in your set?

Alex

On Thu, 25 Mar 2021 at 18:39, Ross Burton <ross@burtonini.com> wrote:

> When building G-I we want to use *native* binaries (as they need to be
> executed) but the *cross* libraries, as otherwise when using the correct
> pkg-config binary in native lookups Meson will end up linking native and
> cross libraries together.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-devtools/meson/meson.inc         |  1 +
>  .../meson/meson/gi-target-dep.patch           | 41 +++++++++++++++++++
>  2 files changed, 42 insertions(+)
>  create mode 100644 meta/recipes-devtools/meson/meson/gi-target-dep.patch
>
> diff --git a/meta/recipes-devtools/meson/meson.inc
> b/meta/recipes-devtools/meson/meson.inc
> index fc3ca85fae..e186dede92 100644
> --- a/meta/recipes-devtools/meson/meson.inc
> +++ b/meta/recipes-devtools/meson/meson.inc
> @@ -15,6 +15,7 @@ SRC_URI = "
> https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
>             file://cross-prop-default.patch \
>
> file://0001-modules-python.py-do-not-substitute-python-s-install.patch \
>
> file://0001-minstall-Correctly-set-uid-gid-of-installed-files.patch \
> +           file://gi-target-dep.patch \
>             "
>  SRC_URI[sha256sum] =
> "72e1c782ba9bda204f4a1ed57f98d027d7b6eb9414c723eebbd6ec7f1955c8a6"
>
> diff --git a/meta/recipes-devtools/meson/meson/gi-target-dep.patch
> b/meta/recipes-devtools/meson/meson/gi-target-dep.patch
> new file mode 100644
> index 0000000000..25b30ca27a
> --- /dev/null
> +++ b/meta/recipes-devtools/meson/meson/gi-target-dep.patch
> @@ -0,0 +1,41 @@
> +When building gobject-introspection we want the *native* binaries (as
> they need
> +to be executed) but *host* gobject-introspection libraries, as otherwise
> the
> +native pkg-config can be used and the build will try to link native and
> host
> +binaries together.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
> +diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
> +index f9660838e..2eefc3fc7 100644
> +--- a/mesonbuild/modules/gnome.py
> ++++ b/mesonbuild/modules/gnome.py
> +@@ -84,8 +84,8 @@ class GnomeModule(ExtensionModule):
> +                      mlog.bold('
> https://github.com/mesonbuild/meson/issues/1387'),
> +                      once=True)
> +
> +-    def _get_native_dep(self, state, depname, required=True):
> +-        kwargs = {'native': True, 'required': required}
> ++    def _get_dep(self, state, depname, native=False, required=True):
> ++        kwargs = {'native': native, 'required': required}
> +         holder = self.interpreter.func_dependency(state.current_node,
> [depname], kwargs)
> +         return holder.held_object
> +
> +@@ -101,7 +101,7 @@ class GnomeModule(ExtensionModule):
> +             return ExternalProgram.from_entry(name, prog)
> +
> +         # Check if pkgconfig has a variable
> +-        dep = self._get_native_dep(state, depname, required=False)
> ++        dep = self._get_dep(state, depname, native=True, required=False)
> +         if dep.found() and dep.type_name == 'pkgconfig':
> +             value = dep.get_pkgconfig_variable(varname, {})
> +             if value:
> +@@ -481,7 +481,7 @@ class GnomeModule(ExtensionModule):
> +
> +     def _get_gir_dep(self, state):
> +         if not self.gir_dep:
> +-            self.gir_dep = self._get_native_dep(state,
> 'gobject-introspection-1.0')
> ++            self.gir_dep = self._get_dep(state,
> 'gobject-introspection-1.0')
> +             self.giscanner = self._get_native_binary(state,
> 'g-ir-scanner', 'gobject-introspection-1.0', 'g_ir_scanner')
> +             self.gicompiler = self._get_native_binary(state,
> 'g-ir-compiler', 'gobject-introspection-1.0', 'g_ir_compiler')
> +         return self.gir_dep, self.giscanner, self.gicompiler
> --
> 2.25.1
>
>
> 
>
>

--00000000000074574205be606514
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I don&#39;t think I fully understand this. Is g-i in =
meson projects already broken for a while (there was a bit of refactor in t=
he latest meson version, which I tested, but perhaps not well enough), or i=
s this necessary for the other patches in your set?</div><div><br></div><di=
v>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=
=3D"gmail_attr">On Thu, 25 Mar 2021 at 18:39, Ross Burton &lt;<a href=3D"m=
ailto:ross@burtonini.com">ross@burtonini.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">When building G-I we want to us=
e *native* binaries (as they need to be<br>
executed) but the *cross* libraries, as otherwise when using the correct<b=
r>
pkg-config binary in native lookups Meson will end up linking native and<b=
r>
cross libraries together.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targ=
et=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/meson/meson.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0|=C2=A0 1 +<br>
=C2=A0.../meson/meson/gi-target-dep.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 41 +++++++++++++++++++<br>
=C2=A02 files changed, 42 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/meson/meson/gi-target-dep.p=
atch<br>
<br>
diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools=
/meson/meson.inc<br>
index fc3ca85fae..e186dede92 100644<br>
--- a/meta/recipes-devtools/meson/meson.inc<br>
+++ b/meta/recipes-devtools/meson/meson.inc<br>
@@ -15,6 +15,7 @@ SRC_URI =3D &quot;<a href=3D"https://github.com/mesonbui=
ld/meson/releases/download/$%7BPV%7D/meson-$%7BP" rel=3D"noreferrer" target=
=
=3D"_blank">https://github.com/mesonbuild/meson/releases/download/${PV}/me=
son-${P</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://cross-prop-default.patch =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-modules-python.py-do=
-not-substitute-python-s-install.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-minstall-Correctly-s=
et-uid-gid-of-installed-files.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://gi-target-dep.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;72e1c782ba9bda204f4a1ed57f98d027d7b6eb9=
414c723eebbd6ec7f1955c8a6&quot;<br>
<br>
diff --git a/meta/recipes-devtools/meson/meson/gi-target-dep.patch b/meta/=
recipes-devtools/meson/meson/gi-target-dep.patch<br>
new file mode 100644<br>
index 0000000000..25b30ca27a<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/meson/meson/gi-target-dep.patch<br>
@@ -0,0 +1,41 @@<br>
+When building gobject-introspection we want the *native* binaries (as the=
y need<br>
+to be executed) but *host* gobject-introspection libraries, as otherwise =
the<br>
+native pkg-config can be used and the build will try to link native and h=
ost<br>
+binaries together.<br>
+<br>
+Upstream-Status: Pending<br>
+Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" tar=
get=3D"_blank">ross.burton@arm.com</a>&gt;<br>
+<br>
+diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py<br=
>
+index f9660838e..2eefc3fc7 100644<br>
+--- a/mesonbuild/modules/gnome.py<br>
++++ b/mesonbuild/modules/gnome.py<br>
+@@ -84,8 +84,8 @@ class GnomeModule(ExtensionModule):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 mlog.bold(&#39;<a href=3D"https://github.com/mesonbuild/meson/issues/1=
387&#39;" rel=3D"noreferrer" target=3D"_blank">https://github.com/mesonbuil=
d/meson/issues/1387&#39;</a>),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 once=3DTrue)<br>
+ <br>
+-=C2=A0 =C2=A0 def _get_native_dep(self, state, depname, required=3DTrue)=
:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 kwargs =3D {&#39;native&#39;: True, &#39;req=
uired&#39;: required}<br>
++=C2=A0 =C2=A0 def _get_dep(self, state, depname, native=3DFalse, require=
d=3DTrue):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 kwargs =3D {&#39;native&#39;: native, &#39;r=
equired&#39;: required}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0holder =3D self.interpreter.func_depend=
ency(state.current_node, [depname], kwargs)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return holder.held_object<br>
+ <br>
+@@ -101,7 +101,7 @@ class GnomeModule(ExtensionModule):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ExternalProgram.fr=
om_entry(name, prog)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Check if pkgconfig has a variable<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dep =3D self._get_native_dep(state, depname,=
 required=3DFalse)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 dep =3D self._get_dep(state, depname, native=
=
=3DTrue, required=3DFalse)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if dep.found() and dep.type_name =3D=3D=
 &#39;pkgconfig&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0value =3D dep.get_pkgconf=
ig_variable(varname, {})<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if value:<br>
+@@ -481,7 +481,7 @@ class GnomeModule(ExtensionModule):<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0def _get_gir_dep(self, state):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not self.gir_dep:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.gir_dep =3D self._get_nat=
ive_dep(state, &#39;gobject-introspection-1.0&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.gir_dep =3D self._get_dep=
(state, &#39;gobject-introspection-1.0&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.giscanner =3D self._=
get_native_binary(state, &#39;g-ir-scanner&#39;, &#39;gobject-introspection=
-1.0&#39;, &#39;g_ir_scanner&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.gicompiler =3D self.=
_get_native_binary(state, &#39;g-ir-compiler&#39;, &#39;gobject-introspecti=
on-1.0&#39;, &#39;g_ir_compiler&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return self.gir_dep, self.giscanner, se=
lf.gicompiler<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000074574205be606514--
