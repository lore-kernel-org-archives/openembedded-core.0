Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web09.1798.1618340283213926537
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Apr 2021 11:58:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=TwEWrh+9;
 spf=pass (domain: google.com, ip: 209.85.166.51, mailfrom: krellan@google.com)
Received: by mail-io1-f51.google.com with SMTP id k25so18155913iob.6
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Apr 2021 11:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/t8ourNnXKPUM0+16B9RqVB8z1nTrz3EweZb/cajASw=;
        b=TwEWrh+9mlXKZctUMpYO8aTk3QgsMdeVOj7kgC/+9TLXk+KV4ugkNvfU5pOEXqIYRf
         n1Lo0aDPYU5tB0dRkw2tCBpGHMOAYo7v0D/P+Zkj1Su9n8xVDbDtVfI/2jsl3UbMJcVr
         zE8Mb3uroulomMvvGQJVqFmQFI/1Ums8sghfb21l9QBFAR7wbpEw9IABauZhfEvhWaqo
         zMJiFcCSR6gdFUpkMqG+0y14lzJGF3cJtCUKP97Xt6IAzSbVJ2ZaUaJpx7MEYVosQ0jQ
         /ara/NS+GO73XOvmvU1MnfMWs7X/HYoKR02u4cbPfmmIIwomFWnznoRy9KtlLXLTY8t6
         dcag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/t8ourNnXKPUM0+16B9RqVB8z1nTrz3EweZb/cajASw=;
        b=X4AJXydzqrMToM+438E0ef9W7KOqJ+HO/B1vW9NIRshp9RZngHvysbhv1fsFVnGUcT
         S7PpMzhRP4Wl8wJ+Q8cNkSnRXH3YvNeVsL7yuyCW42YMS5e/UycG7cw44r5NWkpLYLM8
         u2y0Lx764/+dLuFBtc9qQVBTDf/0lnRl9oTPPojrOUwiLiAd9H7KcfL0gXKN2kgBMKeL
         1o3IQXYEaT+4CJNCHXeK4eJZLU/+R2mSO43BBtnXJ+QOgfWKAW5dfOiGlu8/S7bqKsz9
         zsQV3oHHtUvU1fNh3WBblUqxH2JtFj6vTgcNFZK5WQVgz10o1qPZE0znyKXU4Cl11n4I
         3H0w==
X-Gm-Message-State: AOAM533JjzFLP4HApudUJyuHXWSwsWB80bz+4lS1xUH2nOObxVJQJFQN
	Ex9eOdxzM3xcLmbBfKaEU/76YW5rUDmVXYCE1nHZyw==
X-Google-Smtp-Source: ABdhPJxVIOWvV4XBJJ3jJGDavwO+VGjARsZNnuiGpURC7Ia13APG/jDaMCtfc2P31Bai1iK3JgPTh/QuOY3mM8iBhwE=
X-Received: by 2002:a6b:5819:: with SMTP id m25mr10529861iob.99.1618340282302;
 Tue, 13 Apr 2021 11:58:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210413092432.3688149-1-krellan@google.com> <a15e36dd1ef45bba25c2f7ca78ce17110d767723.camel@linuxfoundation.org>
In-Reply-To: <a15e36dd1ef45bba25c2f7ca78ce17110d767723.camel@linuxfoundation.org>
From: "Josh Lehan" <krellan@google.com>
Date: Tue, 13 Apr 2021 11:57:35 -0700
Message-ID: <CANPkJS9XmUp1FqKLJDXT8gdJBWPM13k-Rx0vn+bf4B9ijw--Yg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libxcb: Add inherit python3native
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, Ross Burton <ross@burtonini.com>
Content-Type: multipart/alternative; boundary="000000000000a7787805bfdf3514"

--000000000000a7787805bfdf3514
Content-Type: text/plain; charset="UTF-8"

Hi there, thanks. I'm not entirely sure what "python3native" does exactly,
but this is my observation. The problem we are seeing is that, without
"inherit python3native", the build machine's local Python version (whatever
it happens to be) takes precedence over the Yocto-included Python version.
In our case, the build machine is running Python 3.9, and evidently
something changed between Python 3.8 and Python 3.9 to be incompatible with
libxcb. Here's the error message:

Failed to load the xcbgen Python package!
Make sure that xcb/proto installed it on your Python path.
If not, you will need to create a .pth file or define $PYTHONPATH
to extend the path.
Refer to the README file in xcb/proto for more info.

Traceback (most recent call last):
  File
"/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0/build/src/../../libxcb-1.14/src/c_client.py",
line 3338, in <module>
    from xcbgen.state import Module
  File
"/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/python3.8/site-packages/xcbgen/state.py",
line 7, in <module>
    from xcbgen import matcher
  File
"/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/python3.8/site-packages/xcbgen/matcher.py",
line 12, in <module>
    from xcbgen.xtypes import *
  File
"/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/python3.8/site-packages/xcbgen/xtypes.py",
line 5, in <module>
    from xcbgen.align import Alignment, AlignmentLog
  File
"/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/python3.8/site-packages/xcbgen/align.py",
line 5, in <module>
    from fractions import gcd
ImportError: cannot import name 'gcd' from 'fractions'
(/usr/lib/python3.9/fractions.py)

The above error text repeats for many of the files it tries to compile
within libxcb.

In general, it seems the safest approach is to standardize on a Python
version that's known to work, without depending on whatever version of
Python the developer has installed locally on their build machine (which
can vary due to distribution, developer's preference, and so on).

Josh

Josh Lehan | Software Engineer | krellan@google.com | +1 650-733-8941
<(650)%20733-8941>



On Tue, Apr 13, 2021 at 2:45 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2021-04-13 at 02:24 -0700, Josh Lehan via lists.openembedded.org
> wrote:
> > During compilation, the local Python environment leaks into
> > the Bitbake build. Adding "inherit python3native" fixes this.
> >
> > Signed-off-by: Josh Lehan <krellan@google.com>
> > ---
> >  meta/recipes-graphics/xorg-lib/libxcb_1.14.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
> b/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
> > index f0a223a19c..40c7b1cc3c 100644
> > --- a/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
> > +++ b/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
> > @@ -24,6 +24,7 @@ PACKAGES_DYNAMIC = "^${PN}-.*"
> >  FILES_${PN} = "${libdir}/libxcb.so.*"
> >
> >  inherit autotools pkgconfig features_check
> > +inherit python3native
> >
>
>
> Could you provide a little more information about how this is breaking
> things?
>
> Whilst python is used by the libxcb build, I believe it shouldn't change
> the
> output, it doesn't in our reproducibity tests.
>
> Adding a python-native dependency does slow the build down a bit so if we
> don't need it, it would be good to avoid it.
>
> Cheers,
>
> Richard
>
>
>
>
>
>

--000000000000a7787805bfdf3514
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi there, thanks. I&#39;m not entirely sure what &quot;pyt=
hon3native&quot; does exactly, but this is my observation. The problem we a=
re seeing is that, without &quot;inherit python3native&quot;, the build mac=
hine&#39;s local Python version (whatever it happens to be) takes precedenc=
e over the Yocto-included Python version. In our case, the build machine is=
 running Python 3.9, and evidently something changed between Python 3.8 and=
 Python 3.9 to be incompatible with libxcb. Here&#39;s the error message:<d=
iv><br></div><div>Failed to load the xcbgen Python package!<br>Make sure th=
at xcb/proto installed it on your Python path.<br>If not, you will need to =
create a .pth file or define $PYTHONPATH<br>to extend the path.<br>Refer to=
 the README file in xcb/proto for more info.<br><br>Traceback (most recent =
call last):<br>=C2=A0 File &quot;/OpenBMC/build/tmp/work/x86_64-linux/libxc=
b-native/1.14-r0/build/src/../../libxcb-1.14/src/c_client.py&quot;, line 33=
38, in &lt;module&gt;<br>=C2=A0 =C2=A0 from xcbgen.state import Module<br>=
=C2=A0 File &quot;/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r=
0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/python3.8/site-p=
ackages/xcbgen/state.py&quot;, line 7, in &lt;module&gt;<br>=C2=A0 =C2=A0 f=
rom xcbgen import matcher<br>=C2=A0 File &quot;/OpenBMC/build/tmp/work/x86_=
64-linux/libxcb-native/1.14-r0/recipe-sysroot-native/usr/lib/pkgconfig/../.=
./../usr/lib/python3.8/site-packages/xcbgen/matcher.py&quot;, line 12, in &=
lt;module&gt;<br>=C2=A0 =C2=A0 from xcbgen.xtypes import *<br>=C2=A0 File &=
quot;/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0/recipe-sysr=
oot-native/usr/lib/pkgconfig/../../../usr/lib/python3.8/site-packages/xcbge=
n/xtypes.py&quot;, line 5, in &lt;module&gt;<br>=C2=A0 =C2=A0 from xcbgen.a=
lign import Alignment, AlignmentLog<br>=C2=A0 File &quot;/OpenBMC/build/tmp=
/work/x86_64-linux/libxcb-native/1.14-r0/recipe-sysroot-native/usr/lib/pkgc=
onfig/../../../usr/lib/python3.8/site-packages/xcbgen/align.py&quot;, line =
5, in &lt;module&gt;<br>=C2=A0 =C2=A0 from fractions import gcd<br>ImportEr=
ror: cannot import name &#39;gcd&#39; from &#39;fractions&#39; (/usr/lib/py=
thon3.9/fractions.py)<br></div><div><br></div><div>The above error text rep=
eats for many of the files it tries to compile within libxcb.</div><div><br=
></div><div>In general, it seems the safest approach is to standardize on a=
 Python version that&#39;s known to work, without depending on whatever ver=
sion of Python the developer has installed locally on their build machine (=
which can vary due to distribution, developer&#39;s preference, and so on).=
</div><div><div><br></div><div>Josh</div><div><br clear=3D"all"><div><div d=
ir=3D"ltr" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div di=
r=3D"ltr"><div style=3D"line-height:1.5em;padding-top:10px;margin-top:10px;=
color:rgb(85,85,85);font-family:sans-serif"><span style=3D"border-width:2px=
 0px 0px;border-style:solid;border-color:rgb(213,15,37);padding-top:2px;mar=
gin-top:2px">Josh Lehan=C2=A0|</span><span style=3D"border-width:2px 0px 0p=
x;border-style:solid;border-color:rgb(51,105,232);padding-top:2px;margin-to=
p:2px">=C2=A0Software Engineer=C2=A0|</span><span style=3D"border-width:2px=
 0px 0px;border-style:solid;border-color:rgb(0,153,57);padding-top:2px;marg=
in-top:2px">=C2=A0<a href=3D"mailto:krellan@google.com" target=3D"_blank">k=
rellan@google.com</a>=C2=A0|</span><span style=3D"border-width:2px 0px 0px;=
border-style:solid;border-color:rgb(238,178,17);padding-top:2px;margin-top:=
2px">=C2=A0<a href=3D"tel:(650)%20733-8941" value=3D"+16507338941" target=
=3D"_blank">+1 650-733-8941</a></span></div><br></div></div></div></div></d=
iv><br></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Tue, Apr 13, 2021 at 2:45 AM Richard Purdie &lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.=
purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On Tue, 2021-04-13 at 02:24 -0700, Josh Lehan via=
 <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bl=
ank">lists.openembedded.org</a> wrote:<br>
&gt; During compilation, the local Python environment leaks into<br>
&gt; the Bitbake build. Adding &quot;inherit python3native&quot; fixes this=
.<br>
&gt; <br>
&gt; Signed-off-by: Josh Lehan &lt;<a href=3D"mailto:krellan@google.com" ta=
rget=3D"_blank">krellan@google.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/recipes-graphics/xorg-lib/<a href=3D"http://libxcb_1.14.bb"=
 rel=3D"noreferrer" target=3D"_blank">libxcb_1.14.bb</a> | 1 +<br>
&gt; =C2=A01 file changed, 1 insertion(+)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-graphics/xorg-lib/<a href=3D"http://libxcb_1=
.14.bb" rel=3D"noreferrer" target=3D"_blank">libxcb_1.14.bb</a> b/meta/reci=
pes-graphics/xorg-lib/<a href=3D"http://libxcb_1.14.bb" rel=3D"noreferrer" =
target=3D"_blank">libxcb_1.14.bb</a><br>
&gt; index f0a223a19c..40c7b1cc3c 100644<br>
&gt; --- a/meta/recipes-graphics/xorg-lib/<a href=3D"http://libxcb_1.14.bb"=
 rel=3D"noreferrer" target=3D"_blank">libxcb_1.14.bb</a><br>
&gt; +++ b/meta/recipes-graphics/xorg-lib/<a href=3D"http://libxcb_1.14.bb"=
 rel=3D"noreferrer" target=3D"_blank">libxcb_1.14.bb</a><br>
&gt; @@ -24,6 +24,7 @@ PACKAGES_DYNAMIC =3D &quot;^${PN}-.*&quot;<br>
&gt; =C2=A0FILES_${PN} =3D &quot;${libdir}/libxcb.so.*&quot;<br>
&gt; <br>
&gt; =C2=A0inherit autotools pkgconfig features_check<br>
&gt; +inherit python3native<br>
&gt; =C2=A0<br>
<br>
<br>
Could you provide a little more information about how this is breaking thin=
gs?<br>
<br>
Whilst python is used by the libxcb build, I believe it shouldn&#39;t chang=
e the=C2=A0<br>
output, it doesn&#39;t in our reproducibity tests.<br>
<br>
Adding a python-native dependency does slow the build down a bit so if we=
=C2=A0<br>
don&#39;t need it, it would be good to avoid it.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000a7787805bfdf3514--
