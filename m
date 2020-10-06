Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web11.639.1602008173663799452
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2020 11:16:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=q9t5O/4E;
 spf=pass (domain: blade-group.com, ip: 209.85.210.42, mailfrom: yann.dirson@blade-group.com)
Received: by mail-ot1-f42.google.com with SMTP id s66so13169251otb.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2020 11:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2aj+VTQxzX4j9YGUAklFu5TJvfwfEtZJNgltn5onU58=;
        b=q9t5O/4EUK19vqYdMvolR2Kc/ndT0nnNZadsfF9j4Tsv27cRC0Ou1npvEPcrNvINcI
         tm78SXsxHWN+cNcWzxg0DsBXSJFn6BZEsKKVPLucZY70Qmq43yDx/uLl3E94JWagSnJe
         842v/zFzNbYQ1toLWZ+Yp3mLOU1i/t0ve1NTJuLKZhBFAAWNHguSFBXC70vzLkjtIW3P
         5PUJFw2H9eiK9bJOXxRcd0cgKlo1UKzgT/PWTuTKJU2fTtRxw/04fAKkP8M9rVnba/ld
         73l3BlWrhsW5gcpCaKJ20l+cUk54E1yo6G6DFHuIF+JdNzmXU+nm0gUWV9ToQxE1pCHl
         QgJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2aj+VTQxzX4j9YGUAklFu5TJvfwfEtZJNgltn5onU58=;
        b=hO5x+XYpt5UDhwqnbSP3LgX4C52sflf7kcWtukufHCzNYUNRrqtInED4GyaDrSJfM5
         atgBlx7lX0XBZCaxeAIQBsFdiSjh3qCJf5u/oL7ih8/qsge+gGTvw/I0wJIyUyd1L1HB
         qcOSc8o2FvMxXAwKfEIGhjxt2JstDlaTSxGSI5bi49l+A6gOTsS7z0nObjBAPnEtRSDx
         TRqGlthuWSutCi3IV8s9LKCy0/BZ9hVofcHes+9yJjUSaLxBwzI3vgUMLE+v1h9QgFFA
         xvk2BeMwRHZK2/nS4Ho884t3M4jhJUUfCUD1mqDsVL2G/kgbN3I6fdfdPD+HLeGt83xA
         m2+Q==
X-Gm-Message-State: AOAM532m66aFJJuRhyk2GxmIKqpBwrq5LHKRgTbYx1kh3fU1gFhH4KHy
	qqAtIyI2n8voWN4ou6S7cFGcZSHVzhXJ1sKdy8q8lA==
X-Google-Smtp-Source: ABdhPJwLCSEAr1j5Z7elDBgz9jIhavI2K8CpIJVyyGMjeO6mDvlyJqoUNWQ6rN/FQB1tY5kYBLnHUrDQIuFWY8A30Y0=
X-Received: by 2002:a05:6830:1aca:: with SMTP id r10mr3658992otc.336.1602008172960;
 Tue, 06 Oct 2020 11:16:12 -0700 (PDT)
MIME-Version: 1.0
References: <20201006104034.800021-1-yann@blade-group.com> <CAMKF1soZ3kKOaj0C8iOgjApCC6ijNwMSYJCXixxksK2hrEnNuQ@mail.gmail.com>
In-Reply-To: <CAMKF1soZ3kKOaj0C8iOgjApCC6ijNwMSYJCXixxksK2hrEnNuQ@mail.gmail.com>
From: "Yann Dirson" <yann.dirson@blade-group.com>
Date: Tue, 6 Oct 2020 20:16:01 +0200
Message-ID: <CA+4=imZDrrZ_SmiSYm4RetV7smrAKmrBO=nGfKmCe6nfqCnxEQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] llvm: fix llvm-config to work again with multilib
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>
Content-Type: multipart/alternative; boundary="00000000000013b18905b10498a4"

--00000000000013b18905b10498a4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Oh right that one is targeting dunfell and I did not check, will reroll

Le mar. 6 oct. 2020 =C3=A0 18:07, Khem Raj <raj.khem@gmail.com> a =C3=A9cr=
it :

> in master we have llvm 10 but the patch seems to be accessing
> llvm9.0.1 dir, that seems incorrect to me.
>
> On Tue, Oct 6, 2020 at 3:41 AM Yann Dirson <yann.dirson@blade-group.com>
> wrote:
> >
> > From: Yann Dirson <yann@blade-group.com>
> >
> > Newer llvm versions have changed the logic for finding libraries,
> > which prevents Mesa from building with PACKAGECONFIG[gallium-llvm]:
> >
> > See https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13937
> >
> > This patch comes from meta-amd, which exhibits one such situation.
> >
> > Signed-off-by: Yann Dirson <yann@blade-group.com>
> > ---
> >  ...-llvm-allow-env-override-of-exe-path.patch | 96 +++++++++++++++++-=
-
> >  1 file changed, 87 insertions(+), 9 deletions(-)
> >
> >
> > Note that I took the updated patch from meta-amd without a change, and
> > I'm dubious about the [OE-Specific] tag in patch metadata.
> >
> >
> > diff --git
> a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-pa=
th.patch
> b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-pa=
th.patch
> > index b01b8647c9..417eaf0aa1 100644
> > ---
> a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-pa=
th.patch
> > +++
> b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-pa=
th.patch
> > @@ -1,27 +1,30 @@
> > -Upstream-Status: Pending
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > -
> > -From 61b00e1e051e367f5483d7b5253b6c85a9e8a90f Mon Sep 17 00:00:00 200=
1
> > +From 0570fe02c07244a8724c1e6c0437f893c8aa8e93 Mon Sep 17 00:00:00 200=
1
> >  From: Martin Kelly <mkelly@xevo.com>
> >  Date: Fri, 19 May 2017 00:22:57 -0700
> > -Subject: [PATCH] llvm: allow env override of exe path
> > +Subject: [PATCH 2/2] llvm: allow env override of exe path
> >
> >  When using a native llvm-config from inside a sysroot, we need
> llvm-config to
> >  return the libraries, include directories, etc. from inside the sysro=
ot
> rather
> >  than from the native sysroot. Thus provide an env override for callin=
g
> >  llvm-config from a target sysroot.
> >
> > +To let it work in multilib environment, we need to provide a knob to
> supply
> > +multilib dirname as well
> > +
> > +Upstream-Status: Inappropriate [OE-Specific]
> > +
> >  Signed-off-by: Martin Kelly <mkelly@xevo.com>
> >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +Signed-off-by: Arsalan H. Awan <Arsalan_Awan@mentor.com>
> >  ---
> > - llvm/tools/llvm-config/llvm-config.cpp | 7 +++++++
> > - 1 file changed, 7 insertions(+)
> > + llvm/tools/llvm-config/llvm-config.cpp | 35
> ++++++++++++++++++++++---------
> > + 1 file changed, 25 insertions(+), 10 deletions(-)
> >
> >  diff --git a/llvm/tools/llvm-config/llvm-config.cpp
> b/llvm/tools/llvm-config/llvm-config.cpp
> > -index 7ef7c46a262..a4f7ed82c7b 100644
> > +index bec89fef98c..91b4d6e4c43 100644
> >  --- a/llvm/tools/llvm-config/llvm-config.cpp
> >  +++ b/llvm/tools/llvm-config/llvm-config.cpp
> > -@@ -225,6 +225,13 @@ Typical components:\n\
> > +@@ -226,6 +226,13 @@ Typical components:\n\
> >
> >   /// Compute the path to the main executable.
> >   std::string GetExecutablePath(const char *Argv0) {
> > @@ -35,3 +38,78 @@ index 7ef7c46a262..a4f7ed82c7b 100644
> >     // This just needs to be some symbol in the binary; C++ doesn't
> >     // allow taking the address of ::main however.
> >     void *P =3D (void *)(intptr_t)GetExecutablePath;
> > +@@ -284,7 +291,7 @@ int main(int argc, char **argv) {
> > +   // bin dir).
> > +   sys::fs::make_absolute(CurrentPath);
> > +   CurrentExecPrefix =3D
> > +-
> sys::path::parent_path(sys::path::parent_path(CurrentPath)).str();
> > ++
> sys::path::parent_path(sys::path::parent_path(sys::path::parent_path(Cur=
rentPath))).str();
> > +
> > +   // Check to see if we are inside a development tree by comparing t=
o
> possible
> > +   // locations (prefix style or CMake style).
> > +@@ -293,7 +300,7 @@ int main(int argc, char **argv) {
> > +     DevelopmentTreeLayout =3D CMakeStyle;
> > +     ActiveObjRoot =3D LLVM_OBJ_ROOT;
> > +   } else if (sys::fs::equivalent(CurrentExecPrefix,
> > +-                                 Twine(LLVM_OBJ_ROOT) + "/bin")) {
> > ++                                 Twine(LLVM_OBJ_ROOT) +
> "/bin/llvm9.0.1")) {
> > +     IsInDevelopmentTree =3D true;
> > +     DevelopmentTreeLayout =3D CMakeBuildModeStyle;
> > +     ActiveObjRoot =3D LLVM_OBJ_ROOT;
> > +@@ -307,37 +314,45 @@ int main(int argc, char **argv) {
> > +   std::string ActivePrefix, ActiveBinDir, ActiveIncludeDir,
> ActiveLibDir,
> > +               ActiveCMakeDir;
> > +   std::string ActiveIncludeOption;
> > ++  // Hack for Yocto: we need to override the multilib path when we a=
re
> using
> > ++  // llvm-config from within a target sysroot.
> > ++  std::string Multilibdir =3D
> std::getenv("YOCTO_ALTERNATE_MULTILIB_NAME");
> > ++  if (Multilibdir.empty()) {
> > ++    Multilibdir =3D "/lib/llvm9.0.1" LLVM_LIBDIR_SUFFIX;
> > ++  }
> > ++
> > +   if (IsInDevelopmentTree) {
> > +-    ActiveIncludeDir =3D std::string(LLVM_SRC_ROOT) + "/include";
> > ++    ActiveIncludeDir =3D std::string(LLVM_SRC_ROOT) +
> "/include/llvm9.0.1";
> > +     ActivePrefix =3D CurrentExecPrefix;
> > +
> > +     // CMake organizes the products differently than a normal prefix
> style
> > +     // layout.
> > ++
> > +     switch (DevelopmentTreeLayout) {
> > +     case CMakeStyle:
> > +-      ActiveBinDir =3D ActiveObjRoot + "/bin";
> > +-      ActiveLibDir =3D ActiveObjRoot + "/lib" + LLVM_LIBDIR_SUFFIX;
> > ++      ActiveBinDir =3D ActiveObjRoot + "/bin/llvm9.0.1";
> > ++      ActiveLibDir =3D ActiveObjRoot + "/lib/llvm9.0.1" +
> LLVM_LIBDIR_SUFFIX;
> > +       ActiveCMakeDir =3D ActiveLibDir + "/cmake/llvm";
> > +       break;
> > +     case CMakeBuildModeStyle:
> > +       ActivePrefix =3D ActiveObjRoot;
> > +-      ActiveBinDir =3D ActiveObjRoot + "/bin/" + build_mode;
> > ++      ActiveBinDir =3D ActiveObjRoot + "/bin/llvm9.0.1/" + build_mod=
e;
> > +       ActiveLibDir =3D
> > +-          ActiveObjRoot + "/lib" + LLVM_LIBDIR_SUFFIX + "/" +
> build_mode;
> > ++          ActiveObjRoot + "/lib/llvm9.0.1" + LLVM_LIBDIR_SUFFIX + "/=
"
> + build_mode;
> > +       ActiveCMakeDir =3D ActiveLibDir + "/cmake/llvm";
> > +       break;
> > +     }
> > +
> > +     // We need to include files from both the source and object tree=
s.
> > +     ActiveIncludeOption =3D
> > +-        ("-I" + ActiveIncludeDir + " " + "-I" + ActiveObjRoot +
> "/include");
> > ++        ("-I" + ActiveIncludeDir + " " + "-I" + ActiveObjRoot +
> "/include/llvm9.0.1");
> > +   } else {
> > +     ActivePrefix =3D CurrentExecPrefix;
> > +-    ActiveIncludeDir =3D ActivePrefix + "/include";
> > ++    ActiveIncludeDir =3D ActivePrefix + "/include/llvm9.0.1";
> > +     SmallString<256> path(StringRef(LLVM_TOOLS_INSTALL_DIR));
> > +     sys::fs::make_absolute(ActivePrefix, path);
> > +     ActiveBinDir =3D path.str();
> > +-    ActiveLibDir =3D ActivePrefix + "/lib" + LLVM_LIBDIR_SUFFIX;
> > ++    ActiveLibDir =3D ActivePrefix + Multilibdir;
> > +     ActiveCMakeDir =3D ActiveLibDir + "/cmake/llvm";
> > +     ActiveIncludeOption =3D "-I" + ActiveIncludeDir;
> > +   }
> > +--
> > +2.20.1
> > +
> > --
> > 2.28.0
> >
> >
> >=20
> >
>


--=20
Yann Dirson <yann@blade-group.com>
Blade / Shadow -- http://shadow.tech

--00000000000013b18905b10498a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Oh right that one is targeting dunfell and I did not check=
, will reroll<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">Le=C2=A0mar. 6 oct. 2020 =C3=A0=C2=A018:07, Khem Raj &lt;<=
a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; a =C3=A9cri=
t=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">in mast=
er we have llvm 10 but the patch seems to be accessing<br>
llvm9.0.1 dir, that seems incorrect to me.<br>
<br>
On Tue, Oct 6, 2020 at 3:41 AM Yann Dirson &lt;<a href=3D"mailto:yann.dirs=
on@blade-group.com" target=3D"_blank">yann.dirson@blade-group.com</a>&gt; w=
rote:<br>
&gt;<br>
&gt; From: Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com" target=
=3D"_blank">yann@blade-group.com</a>&gt;<br>
&gt;<br>
&gt; Newer llvm versions have changed the logic for finding libraries,<br>
&gt; which prevents Mesa from building with PACKAGECONFIG[gallium-llvm]:<b=
r>
&gt;<br>
&gt; See <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13=
937" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org=
/show_bug.cgi?id=3D13937</a><br>
&gt;<br>
&gt; This patch comes from meta-amd, which exhibits one such situation.<br=
>
&gt;<br>
&gt; Signed-off-by: Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com=
" target=3D"_blank">yann@blade-group.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...-llvm-allow-env-override-of-exe-path.patch | 96 ++++++++++++=
+++++--<br>
&gt;=C2=A0 1 file changed, 87 insertions(+), 9 deletions(-)<br>
&gt;<br>
&gt;<br>
&gt; Note that I took the updated patch from meta-amd without a change, an=
d<br>
&gt; I&#39;m dubious about the [OE-Specific] tag in patch metadata.<br>
&gt;<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-over=
ride-of-exe-path.patch b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-en=
v-override-of-exe-path.patch<br>
&gt; index b01b8647c9..417eaf0aa1 100644<br>
&gt; --- a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of=
-exe-path.patch<br>
&gt; +++ b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of=
-exe-path.patch<br>
&gt; @@ -1,27 +1,30 @@<br>
&gt; -Upstream-Status: Pending<br>
&gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" ta=
rget=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; -<br>
&gt; -From 61b00e1e051e367f5483d7b5253b6c85a9e8a90f Mon Sep 17 00:00:00 20=
01<br>
&gt; +From 0570fe02c07244a8724c1e6c0437f893c8aa8e93 Mon Sep 17 00:00:00 20=
01<br>
&gt;=C2=A0 From: Martin Kelly &lt;<a href=3D"mailto:mkelly@xevo.com" targe=
t=3D"_blank">mkelly@xevo.com</a>&gt;<br>
&gt;=C2=A0 Date: Fri, 19 May 2017 00:22:57 -0700<br>
&gt; -Subject: [PATCH] llvm: allow env override of exe path<br>
&gt; +Subject: [PATCH 2/2] llvm: allow env override of exe path<br>
&gt;<br>
&gt;=C2=A0 When using a native llvm-config from inside a sysroot, we need =
llvm-config to<br>
&gt;=C2=A0 return the libraries, include directories, etc. from inside the=
 sysroot rather<br>
&gt;=C2=A0 than from the native sysroot. Thus provide an env override for =
calling<br>
&gt;=C2=A0 llvm-config from a target sysroot.<br>
&gt;<br>
&gt; +To let it work in multilib environment, we need to provide a knob to=
 supply<br>
&gt; +multilib dirname as well<br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate [OE-Specific]<br>
&gt; +<br>
&gt;=C2=A0 Signed-off-by: Martin Kelly &lt;<a href=3D"mailto:mkelly@xevo.c=
om" target=3D"_blank">mkelly@xevo.com</a>&gt;<br>
&gt;=C2=A0 Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.co=
m" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +Signed-off-by: Arsalan H. Awan &lt;<a href=3D"mailto:Arsalan_Awan@me=
ntor.com" target=3D"_blank">Arsalan_Awan@mentor.com</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt; - llvm/tools/llvm-config/llvm-config.cpp | 7 +++++++<br>
&gt; - 1 file changed, 7 insertions(+)<br>
&gt; + llvm/tools/llvm-config/llvm-config.cpp | 35 ++++++++++++++++++++++-=
--------<br>
&gt; + 1 file changed, 25 insertions(+), 10 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/llvm/tools/llvm-config/llvm-config.cpp b/llvm/tool=
s/llvm-config/llvm-config.cpp<br>
&gt; -index 7ef7c46a262..a4f7ed82c7b 100644<br>
&gt; +index bec89fef98c..91b4d6e4c43 100644<br>
&gt;=C2=A0 --- a/llvm/tools/llvm-config/llvm-config.cpp<br>
&gt;=C2=A0 +++ b/llvm/tools/llvm-config/llvm-config.cpp<br>
&gt; -@@ -225,6 +225,13 @@ Typical components:\n\<br>
&gt; +@@ -226,6 +226,13 @@ Typical components:\n\<br>
&gt;<br>
&gt;=C2=A0 =C2=A0/// Compute the path to the main executable.<br>
&gt;=C2=A0 =C2=A0std::string GetExecutablePath(const char *Argv0) {<br>
&gt; @@ -35,3 +38,78 @@ index 7ef7c46a262..a4f7ed82c7b 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0// This just needs to be some symbol in the binary=
; C++ doesn&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0// allow taking the address of ::main however.<br>
&gt;=C2=A0 =C2=A0 =C2=A0void *P =3D (void *)(intptr_t)GetExecutablePath;<b=
r>
&gt; +@@ -284,7 +291,7 @@ int main(int argc, char **argv) {<br>
&gt; +=C2=A0 =C2=A0// bin dir).<br>
&gt; +=C2=A0 =C2=A0sys::fs::make_absolute(CurrentPath);<br>
&gt; +=C2=A0 =C2=A0CurrentExecPrefix =3D<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 sys::path::parent_path(sys::path::parent_path(=
CurrentPath)).str();<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 sys::path::parent_path(sys::path::parent_path(=
sys::path::parent_path(CurrentPath))).str();<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0// Check to see if we are inside a development tree by =
comparing to possible<br>
&gt; +=C2=A0 =C2=A0// locations (prefix style or CMake style).<br>
&gt; +@@ -293,7 +300,7 @@ int main(int argc, char **argv) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DevelopmentTreeLayout =3D CMakeStyle;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ActiveObjRoot =3D LLVM_OBJ_ROOT;<br>
&gt; +=C2=A0 =C2=A0} else if (sys::fs::equivalent(CurrentExecPrefix,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Twine(LLVM_OBJ_ROOT) +=
 &quot;/bin&quot;)) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Twine(LLVM_OBJ_ROOT) +=
 &quot;/bin/llvm9.0.1&quot;)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0IsInDevelopmentTree =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DevelopmentTreeLayout =3D CMakeBuildModeStyle;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0ActiveObjRoot =3D LLVM_OBJ_ROOT;<br>
&gt; +@@ -307,37 +314,45 @@ int main(int argc, char **argv) {<br>
&gt; +=C2=A0 =C2=A0std::string ActivePrefix, ActiveBinDir, ActiveIncludeDi=
r, ActiveLibDir,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ActiveCMakeDi=
r;<br>
&gt; +=C2=A0 =C2=A0std::string ActiveIncludeOption;<br>
&gt; ++=C2=A0 // Hack for Yocto: we need to override the multilib path whe=
n we are using<br>
&gt; ++=C2=A0 // llvm-config from within a target sysroot.<br>
&gt; ++=C2=A0 std::string Multilibdir =3D std::getenv(&quot;YOCTO_ALTERNAT=
E_MULTILIB_NAME&quot;);<br>
&gt; ++=C2=A0 if (Multilibdir.empty()) {<br>
&gt; ++=C2=A0 =C2=A0 Multilibdir =3D &quot;/lib/llvm9.0.1&quot; LLVM_LIBDI=
R_SUFFIX;<br>
&gt; ++=C2=A0 }<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0if (IsInDevelopmentTree) {<br>
&gt; +-=C2=A0 =C2=A0 ActiveIncludeDir =3D std::string(LLVM_SRC_ROOT) + &qu=
ot;/include&quot;;<br>
&gt; ++=C2=A0 =C2=A0 ActiveIncludeDir =3D std::string(LLVM_SRC_ROOT) + &qu=
ot;/include/llvm9.0.1&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ActivePrefix =3D CurrentExecPrefix;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0// CMake organizes the products differently than=
 a normal prefix style<br>
&gt; +=C2=A0 =C2=A0 =C2=A0// layout.<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (DevelopmentTreeLayout) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case CMakeStyle:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 ActiveBinDir =3D ActiveObjRoot + &quot;/bin&qu=
ot;;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 ActiveLibDir =3D ActiveObjRoot + &quot;/lib&qu=
ot; + LLVM_LIBDIR_SUFFIX;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ActiveBinDir =3D ActiveObjRoot + &quot;/bin/ll=
vm9.0.1&quot;;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ActiveLibDir =3D ActiveObjRoot + &quot;/lib/ll=
vm9.0.1&quot; + LLVM_LIBDIR_SUFFIX;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ActiveCMakeDir =3D ActiveLibDir + &quot;/=
cmake/llvm&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case CMakeBuildModeStyle:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ActivePrefix =3D ActiveObjRoot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 ActiveBinDir =3D ActiveObjRoot + &quot;/bin/&q=
uot; + build_mode;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ActiveBinDir =3D ActiveObjRoot + &quot;/bin/ll=
vm9.0.1/&quot; + build_mode;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ActiveLibDir =3D<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ActiveObjRoot + &quot;/lib&quot;=
 + LLVM_LIBDIR_SUFFIX + &quot;/&quot; + build_mode;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ActiveObjRoot + &quot;/lib/llvm9=
.0.1&quot; + LLVM_LIBDIR_SUFFIX + &quot;/&quot; + build_mode;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ActiveCMakeDir =3D ActiveLibDir + &quot;/=
cmake/llvm&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0// We need to include files from both the source=
 and object trees.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ActiveIncludeOption =3D<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;-I&quot; + ActiveIncludeDir + &q=
uot; &quot; + &quot;-I&quot; + ActiveObjRoot + &quot;/include&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;-I&quot; + ActiveIncludeDir + &q=
uot; &quot; + &quot;-I&quot; + ActiveObjRoot + &quot;/include/llvm9.0.1&quo=
t;);<br>
&gt; +=C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ActivePrefix =3D CurrentExecPrefix;<br>
&gt; +-=C2=A0 =C2=A0 ActiveIncludeDir =3D ActivePrefix + &quot;/include&qu=
ot;;<br>
&gt; ++=C2=A0 =C2=A0 ActiveIncludeDir =3D ActivePrefix + &quot;/include/ll=
vm9.0.1&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SmallString&lt;256&gt; path(StringRef(LLVM_TOOLS=
_INSTALL_DIR));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sys::fs::make_absolute(ActivePrefix, path);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ActiveBinDir =3D path.str();<br>
&gt; +-=C2=A0 =C2=A0 ActiveLibDir =3D ActivePrefix + &quot;/lib&quot; + LL=
VM_LIBDIR_SUFFIX;<br>
&gt; ++=C2=A0 =C2=A0 ActiveLibDir =3D ActivePrefix + Multilibdir;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ActiveCMakeDir =3D ActiveLibDir + &quot;/cmake/l=
lvm&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ActiveIncludeOption =3D &quot;-I&quot; + ActiveI=
ncludeDir;<br>
&gt; +=C2=A0 =C2=A0}<br>
&gt; +--<br>
&gt; +2.20.1<br>
&gt; +<br>
&gt; --<br>
&gt; 2.28.0<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature">Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com" ta=
rget=3D"_blank">yann@blade-group.com</a>&gt;<br>Blade / Shadow -- <a href=
=3D"http://shadow.tech" target=3D"_blank">http://shadow.tech</a><br><br></=
div>

--00000000000013b18905b10498a4--
