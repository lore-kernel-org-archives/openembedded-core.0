Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
 by mx.groups.io with SMTP id smtpd.web11.9055.1602232576694562026
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 01:36:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=JoIxbCKc;
 spf=pass (domain: blade-group.com, ip: 209.85.210.65, mailfrom: yann.dirson@blade-group.com)
Received: by mail-ot1-f65.google.com with SMTP id m13so8266171otl.9
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2020 01:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wvkWcdd7ByHgCWwWj8RCK5lC4SBKU42FaAvBBBRenbY=;
        b=JoIxbCKcK2aCWobms5jpHOsNrp5xe0eZ8RUU4TWqB1EGFdInRMg/1VN8gHRXc9MOeu
         9pUxcMzH+zl/NI0CHjgfAmfKijZ/tZ+h64critmt8KcAbFxKKXEhV4L4ZkRDVzoUv6Nd
         SE8a/u3jw+0jzbH62OCmtAd81KwH0Gi4veXtLcbHrjdpHvBUigJWANIdtYVQRF4lvhEt
         gJ4v5dPWS9kEoG0dtAQTaMNtaHQ6bxHDRLsbs2lRFjtFrtLCV9n6/wBCLNpgmFPipmqd
         wYBV1sLoW/u26lDQZZkgCho2WXwOHtQWoIFjTWZt9OJPUOGBLpacztNENWBX+hUCHTB1
         osPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wvkWcdd7ByHgCWwWj8RCK5lC4SBKU42FaAvBBBRenbY=;
        b=WEBlh1IXo9EGPuLLZnXpylKsSCRC2DRELpk042GlhsWpm1soefSiS9dwQwQ/WZnkal
         Zm0og8gW3PA/Sx5H6ZlTSJsnG1ae0ebfRZOV6V3TwW8V10qnaKhp8rv2sIh6WkTOhDZv
         oUoVPoEgUQigy+ptnavtJx2clHJITN1sNW17kT4OAc5/tsXvL+N4OWG3/Cmwqdvc/YSu
         JSKclc1PBMnZFMsTQInHU2xySarV+mYJa0K/j1eLpslIdsv7MzfcqeyO9dHInR4kay2W
         Mm9Z+UcZoMHERFozCK9+kaVFXNoweKkv+kUAc++erTXOizrsmYcO/2IdGIPt21ioU8zd
         1pCA==
X-Gm-Message-State: AOAM533Uye/7Pi+bO5nfX5/+8beaS5oH8JTPwpwvKGwLWhqn2vdoWS6t
	3t5UIOphhalLr4OeNmXizeUcgNTa4A3vfHPOG5/wyQ==
X-Google-Smtp-Source: ABdhPJxM8+UmwAXuh0qv8ql+yUN0MWVnjgMPNBiptfciaiyjHtDa3Q63kZqxZI8bT75/bxIUqd/iWxZwiXWG/2vkjQI=
X-Received: by 2002:a05:6830:1aca:: with SMTP id r10mr7720275otc.336.1602232575955;
 Fri, 09 Oct 2020 01:36:15 -0700 (PDT)
MIME-Version: 1.0
References: <20201008103852.803147-1-yann@blade-group.com> <CAMKF1so-Aztsdp0z542+ZXk3yN7XZo2ginr5DsRyfaMk-CoGNw@mail.gmail.com>
In-Reply-To: <CAMKF1so-Aztsdp0z542+ZXk3yN7XZo2ginr5DsRyfaMk-CoGNw@mail.gmail.com>
From: "Yann Dirson" <yann.dirson@blade-group.com>
Date: Fri, 9 Oct 2020 10:36:04 +0200
Message-ID: <CA+4=imaGQNakH0eGs9zwLnO=aRqW9sF_bB+WyRmTbkhv+R8dbQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] llvm: fix llvm-config to work again with multilib
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>
Content-Type: multipart/alternative; boundary="00000000000089adf005b138d783"

--00000000000089adf005b138d783
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Good point.

While taking care of this however, I realized they also hardcoded the
result of a s/lib/lib64/.

That's especially puzzling as they also check for
YOCTO_ALTERNATE_MULTILIB_NAME in env,
which seems to solve the problem for mesa only, but adds to the confusion
with the following:

  std::string Multilibdir =3D std::getenv("YOCTO_ALTERNATE_MULTILIB_NAME")=
;
  if (Multilibdir.empty()) {
    Multilibdir =3D "/lib64/llvm" LLVM_VERSION_STRING LLVM_LIBDIR_SUFFIX;
  }

... so for mesa we have Multilibdir =3D "/lib64" and for the rest we have
Multilibdir =3D "/lib64/llvm10.0.1"

I don't think there's any sanity in this either.  What about instead going
with getenv("base_libdir"),
and using Multilibdir all over where they're hardcoding "lib64" ?
What does YOCTO_ALTERNATE_MULTILIB_NAME bring over base_libdir ?

Le jeu. 8 oct. 2020 =C3=A0 18:43, Khem Raj <raj.khem@gmail.com> a =C3=A9cr=
it :

> I do not like the llvm version to the x.y.z accuracy being hardcoded
> in code, this is going to be error prone whenever we update recipe. I
> wonder if we can replace it with LLVM_VERSION_STRING
>
> On Thu, Oct 8, 2020 at 3:39 AM Yann Dirson <yann.dirson@blade-group.com>
> wrote:
> >
> > From: Yann Dirson <yann@blade-group.com>
> >
> > Newer llvm versions have changed the logic for finding libraries,
> > which prevents Mesa from building with PACKAGECONFIG[gallium-llvm]:
> >
> > The problem is visible in mesa/do_configure with this in local.conf:
> >
> >     PACKAGECONFIG_append_pn-mesa +=3D " gallium-llvm"
> >     require conf/multilib.conf
> >     MULTILIBS =3D "multilib:lib32"
> >     DEFAULTTUNE_virtclass-multilib-lib32 =3D "x86"
> >
> > See https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13937
> >
> > This patch comes from meta-amd#dunfell for llvm-9.0.1, adapted for
> llvm-10.0.1.
> >
> > Signed-off-by: Yann Dirson <yann@blade-group.com>
> > ---
> >  ...-llvm-allow-env-override-of-exe-path.patch | 87 +++++++++++++++++-=
-
> >  1 file changed, 78 insertions(+), 9 deletions(-)
> >
> > I'm dubious about the [OE-Specific] tag in patch metadata, although it
> > sure would not be acceptable upstream as-is :)
> >
> > diff --git
> a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-pa=
th.patch
> b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-pa=
th.patch
> > index b01b8647c9..98d85eab5d 100644
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
> > @@ -35,3 +38,69 @@ index 7ef7c46a262..a4f7ed82c7b 100644
> >     // This just needs to be some symbol in the binary; C++ doesn't
> >     // allow taking the address of ::main however.
> >     void *P =3D (void *)(intptr_t)GetExecutablePath;
> > +@@ -306,7 +313,7 @@ int main(int argc, char **argv) {
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
> > +@@ -329,40 +336,47 @@ int main(int argc, char **argv) {
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
> > ++    Multilibdir =3D "/lib/llvm10.0.1" LLVM_LIBDIR_SUFFIX;
> > ++  }
> > ++
> > +   if (IsInDevelopmentTree) {
> > +-    ActiveIncludeDir =3D std::string(LLVM_SRC_ROOT) + "/include";
> > ++    ActiveIncludeDir =3D std::string(LLVM_SRC_ROOT) +
> "/include/llvm10.0.1";
> > +     ActivePrefix =3D CurrentExecPrefix;
> > +
> > +     // CMake organizes the products differently than a normal prefix
> style
> > +     // layout.
> > +     switch (DevelopmentTreeLayout) {
> > +     case CMakeStyle:
> > +-      ActiveBinDir =3D ActiveObjRoot + "/bin";
> > +-      ActiveLibDir =3D ActiveObjRoot + "/lib" + LLVM_LIBDIR_SUFFIX;
> > ++      ActiveBinDir =3D ActiveObjRoot + "/bin/llvm10.0.1";
> > ++      ActiveLibDir =3D ActiveObjRoot + "/lib/llvm10.0.1" +
> LLVM_LIBDIR_SUFFIX;
> > +       ActiveCMakeDir =3D ActiveLibDir + "/cmake/llvm";
> > +       break;
> > +     case CMakeBuildModeStyle:
> > +       // FIXME: Should we consider the build-mode-specific path as t=
he
> prefix?
> > +       ActivePrefix =3D ActiveObjRoot;
> > +-      ActiveBinDir =3D ActiveObjRoot + "/" + build_mode + "/bin";
> > ++      ActiveBinDir =3D ActiveObjRoot + "/" + build_mode +
> "/bin/llvm10.0.1";
> > +       ActiveLibDir =3D
> > +-          ActiveObjRoot + "/" + build_mode + "/lib" +
> LLVM_LIBDIR_SUFFIX;
> > ++          ActiveObjRoot + "/" + build_mode + "/lib/llvm10.0.1" +
> LLVM_LIBDIR_SUFFIX;
> > +       // The CMake directory isn't separated by build mode.
> > +       ActiveCMakeDir =3D
> > +-          ActivePrefix + "/lib" + LLVM_LIBDIR_SUFFIX + "/cmake/llvm"=
;
> > ++          ActivePrefix + "/lib/llvm10.0.1" + LLVM_LIBDIR_SUFFIX +
> "/cmake/llvm";
> > +       break;
> > +     }
> > +
> > +     // We need to include files from both the source and object tree=
s.
> > +     ActiveIncludeOption =3D
> > +-        ("-I" + ActiveIncludeDir + " " + "-I" + ActiveObjRoot +
> "/include");
> > ++        ("-I" + ActiveIncludeDir + " " + "-I" + ActiveObjRoot +
> "/include/llvm10.0.1");
> > +   } else {
> > +     ActivePrefix =3D CurrentExecPrefix;
> > +-    ActiveIncludeDir =3D ActivePrefix + "/include";
> > ++    ActiveIncludeDir =3D ActivePrefix + "/include/llvm10.0.1";
> > +     SmallString<256> path(StringRef(LLVM_TOOLS_INSTALL_DIR));
> > +     sys::fs::make_absolute(ActivePrefix, path);
> > +     ActiveBinDir =3D path.str();
> > +-    ActiveLibDir =3D ActivePrefix + "/lib" + LLVM_LIBDIR_SUFFIX;
> > ++    ActiveLibDir =3D ActivePrefix + Multilibdir;
> > +     ActiveCMakeDir =3D ActiveLibDir + "/cmake/llvm";
> > +     ActiveIncludeOption =3D "-I" + ActiveIncludeDir;
> > +   }
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

--00000000000089adf005b138d783
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Good point. <br></div><div><br></div><div>While takin=
g care of this however, I realized they also hardcoded the result of a s/li=
b/lib64/.</div><div><br></div><div>That&#39;s especially puzzling as they a=
lso check for YOCTO_ALTERNATE_MULTILIB_NAME in env,</div><div>which seems t=
o solve the problem for mesa only, but adds to the confusion with the follo=
wing:</div><div><br></div><div>=C2=A0 std::string Multilibdir =3D std::gete=
nv(&quot;YOCTO_ALTERNATE_MULTILIB_NAME&quot;);<br>=C2=A0 if (Multilibdir.em=
pty()) {<br>=C2=A0 =C2=A0 Multilibdir =3D &quot;/lib64/llvm&quot; LLVM_VERS=
ION_STRING LLVM_LIBDIR_SUFFIX;<br>=C2=A0 }<br><br></div><div>... so for mes=
a we have Multilibdir =3D &quot;/lib64&quot; and for the rest we have Multi=
libdir =3D &quot;/lib64/llvm10.0.1&quot;</div><div><br></div><div>I don&#39=
;t think there&#39;s any sanity in this either.=C2=A0 What about instead go=
ing with getenv(&quot;base_libdir&quot;),</div><div>and using Multilibdir a=
ll over where they&#39;re hardcoding &quot;lib64&quot; ?</div><div>What doe=
s YOCTO_ALTERNATE_MULTILIB_NAME bring over base_libdir ?</div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. =
8 oct. 2020 =C3=A0=C2=A018:43, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmai=
l.com">raj.khem@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">I do not like the llvm version to the=
 x.y.z accuracy being hardcoded<br>
in code, this is going to be error prone whenever we update recipe. I<br>
wonder if we can replace it with LLVM_VERSION_STRING<br>
<br>
On Thu, Oct 8, 2020 at 3:39 AM Yann Dirson &lt;<a href=3D"mailto:yann.dirs=
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
&gt; The problem is visible in mesa/do_configure with this in local.conf:<=
br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0PACKAGECONFIG_append_pn-mesa +=3D &quot; gallium-l=
lvm&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0require conf/multilib.conf<br>
&gt;=C2=A0 =C2=A0 =C2=A0MULTILIBS =3D &quot;multilib:lib32&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0DEFAULTTUNE_virtclass-multilib-lib32 =3D &quot;x86=
&quot;<br>
&gt;<br>
&gt; See <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13=
937" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org=
/show_bug.cgi?id=3D13937</a><br>
&gt;<br>
&gt; This patch comes from meta-amd#dunfell for llvm-9.0.1, adapted for ll=
vm-10.0.1.<br>
&gt;<br>
&gt; Signed-off-by: Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com=
" target=3D"_blank">yann@blade-group.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...-llvm-allow-env-override-of-exe-path.patch | 87 ++++++++++++=
+++++--<br>
&gt;=C2=A0 1 file changed, 78 insertions(+), 9 deletions(-)<br>
&gt;<br>
&gt; I&#39;m dubious about the [OE-Specific] tag in patch metadata, althou=
gh it<br>
&gt; sure would not be acceptable upstream as-is :)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-over=
ride-of-exe-path.patch b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-en=
v-override-of-exe-path.patch<br>
&gt; index b01b8647c9..98d85eab5d 100644<br>
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
&gt; @@ -35,3 +38,69 @@ index 7ef7c46a262..a4f7ed82c7b 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0// This just needs to be some symbol in the binary=
; C++ doesn&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0// allow taking the address of ::main however.<br>
&gt;=C2=A0 =C2=A0 =C2=A0void *P =3D (void *)(intptr_t)GetExecutablePath;<b=
r>
&gt; +@@ -306,7 +313,7 @@ int main(int argc, char **argv) {<br>
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
&gt; +@@ -329,40 +336,47 @@ int main(int argc, char **argv) {<br>
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
&gt; ++=C2=A0 =C2=A0 Multilibdir =3D &quot;/lib/llvm10.0.1&quot; LLVM_LIBD=
IR_SUFFIX;<br>
&gt; ++=C2=A0 }<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0if (IsInDevelopmentTree) {<br>
&gt; +-=C2=A0 =C2=A0 ActiveIncludeDir =3D std::string(LLVM_SRC_ROOT) + &qu=
ot;/include&quot;;<br>
&gt; ++=C2=A0 =C2=A0 ActiveIncludeDir =3D std::string(LLVM_SRC_ROOT) + &qu=
ot;/include/llvm10.0.1&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ActivePrefix =3D CurrentExecPrefix;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0// CMake organizes the products differently than=
 a normal prefix style<br>
&gt; +=C2=A0 =C2=A0 =C2=A0// layout.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (DevelopmentTreeLayout) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case CMakeStyle:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 ActiveBinDir =3D ActiveObjRoot + &quot;/bin&qu=
ot;;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 ActiveLibDir =3D ActiveObjRoot + &quot;/lib&qu=
ot; + LLVM_LIBDIR_SUFFIX;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ActiveBinDir =3D ActiveObjRoot + &quot;/bin/ll=
vm10.0.1&quot;;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ActiveLibDir =3D ActiveObjRoot + &quot;/lib/ll=
vm10.0.1&quot; + LLVM_LIBDIR_SUFFIX;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ActiveCMakeDir =3D ActiveLibDir + &quot;/=
cmake/llvm&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case CMakeBuildModeStyle:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// FIXME: Should we consider the build-mo=
de-specific path as the prefix?<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ActivePrefix =3D ActiveObjRoot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 ActiveBinDir =3D ActiveObjRoot + &quot;/&quot;=
 + build_mode + &quot;/bin&quot;;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ActiveBinDir =3D ActiveObjRoot + &quot;/&quot;=
 + build_mode + &quot;/bin/llvm10.0.1&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ActiveLibDir =3D<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ActiveObjRoot + &quot;/&quot; + =
build_mode + &quot;/lib&quot; + LLVM_LIBDIR_SUFFIX;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ActiveObjRoot + &quot;/&quot; + =
build_mode + &quot;/lib/llvm10.0.1&quot; + LLVM_LIBDIR_SUFFIX;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// The CMake directory isn&#39;t separate=
d by build mode.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ActiveCMakeDir =3D<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ActivePrefix + &quot;/lib&quot; =
+ LLVM_LIBDIR_SUFFIX + &quot;/cmake/llvm&quot;;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ActivePrefix + &quot;/lib/llvm10=
.0.1&quot; + LLVM_LIBDIR_SUFFIX + &quot;/cmake/llvm&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0// We need to include files from both the source=
 and object trees.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ActiveIncludeOption =3D<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;-I&quot; + ActiveIncludeDir + &q=
uot; &quot; + &quot;-I&quot; + ActiveObjRoot + &quot;/include&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;-I&quot; + ActiveIncludeDir + &q=
uot; &quot; + &quot;-I&quot; + ActiveObjRoot + &quot;/include/llvm10.0.1&qu=
ot;);<br>
&gt; +=C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ActivePrefix =3D CurrentExecPrefix;<br>
&gt; +-=C2=A0 =C2=A0 ActiveIncludeDir =3D ActivePrefix + &quot;/include&qu=
ot;;<br>
&gt; ++=C2=A0 =C2=A0 ActiveIncludeDir =3D ActivePrefix + &quot;/include/ll=
vm10.0.1&quot;;<br>
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

--00000000000089adf005b138d783--
