Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
 by mx.groups.io with SMTP id smtpd.web08.10168.1629640321013332866
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 06:52:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kiBGtdrS;
 spf=pass (domain: gmail.com, ip: 209.85.222.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f44.google.com with SMTP id t26so6552894uao.12
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 06:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mB6GZjnBuDYjFPprahFP1qzyfJbXc0WcKZwKda9cjiU=;
        b=kiBGtdrSabVgRisAWtrS+9wc4d18RaylW72bdTHTB18baz8TJSJo/xR8EdcL2tnGwI
         SgkKzx5c/u1tHzB6+39AeVI9tt/62i74JHhp7IAokC8Mm9LrdaUjd5I0tMrK8kpCdrn6
         HlSFoNTsT/FKuwJlfjVdRi3S+OpE9U1mueDhb1044SZjqnbAdC6F83oR7XMPJ/T+paVg
         WsODZXJvAk3tJLTgrRDXQkgQhD7/zG8l8vKgxj033hQFh6a/staKjYGnsAxJ1jTlt2F3
         hbG1zT1u3L/s5KbvzJHmim2PDkAWQwfUuse1fQ9Ze9pYpIqt4AIhgArUq+nQWRctKhjm
         aZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mB6GZjnBuDYjFPprahFP1qzyfJbXc0WcKZwKda9cjiU=;
        b=VkaFArMmYHNesoSfYGrrHiRmRnrFQFUliOo8cKmY0Zx1rodUskXJxhPlJITlACEbfS
         229oLEYhcp7px1/87Szo/+IzgBWfA7CjK0+nz//xBVXjgEnxh8I2RiMOE+OPVKF/SQVb
         9o2nB0sSxf3GPBS3WUOGug9SVMOJCWx10ckTVphnOWrsTDlDONwMGsxjz6oicPSKWkZL
         FaRtZ6PQSWtVWg7edwwTHwwPv08uoVQZxxCwlN1Ifg2QMmVt1A0fMUM6IA9KkRny23w6
         /GD5mZi6bahjnIf+tfvzatNK9L5Q2NLjy69ZJgOt6D6oP8OBD1+rNNtSROczR6jAlHwK
         jPjA==
X-Gm-Message-State: AOAM531J6Pfn2iOUH1jmJJMJV+ryoOkoTDwz3CCY3bNncFck4CM02Ob0
	a0rUjFQggVfP4aTIHYmNf2dFIU2YZ0cjXtcf6rM=
X-Google-Smtp-Source: ABdhPJwuwiyU9DLNH8ukyFweKWfHjYYCgwwPMxC1BZEtfmEYEHPWv2HZuk4cNlUYpS44a36meEOif8IfRCg1fquWCSc=
X-Received: by 2002:ab0:3314:: with SMTP id r20mr19993875uao.89.1629640320212;
 Sun, 22 Aug 2021 06:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
 <20210822125103.310416-2-alex.kanavin@gmail.com> <c053b701b5a7d88cfc871cd461a8482349f0c809.camel@linuxfoundation.org>
In-Reply-To: <c053b701b5a7d88cfc871cd461a8482349f0c809.camel@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sun, 22 Aug 2021 15:51:48 +0200
Message-ID: <CANNYZj_e8S-KarJyRvjXXZ3zMnVkv_dYJXTBu4mZu+_4aLNzEg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/55] binutils: do not build-depend on target flex/bison/zlib.
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000065e2d405ca2634ef"

--00000000000065e2d405ca2634ef
Content-Type: text/plain; charset="UTF-8"

On Sun, 22 Aug 2021 at 15:06, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> > -DEPENDS += "flex bison zlib"
> > -
>
> This is something which has caused a lot of problems in the past. In
> particular,
> if something touches (patches( one of the pre-generated files or we use a
> git
> version of binutils this breaks. It also seemed to depend on the host
> version of
> patch used.
>
> For zlib, is the recipe using the binary only or the library? If the
> latter,
> that also proves problematic.
>
> I appreciate it may have passed autobuilder testing but I suspect that
> isn't
> enough for real work use.
>
> Also, the target version would still need these?
>
> I like the idea of streamlining dependencies but this one needs some
> further
> checks...
>

All three are already explicitly included as native dependencies for all
binutils variants and that has not changed:
binutils.inc:DEPENDS = "flex-native bison-native zlib-native
gnu-config-native autoconf-native"

For the target dependencies, flex installs:
akanavin@ubuntu1804-ty:~/poky/build/tmp/work/core2-64-poky-linux/flex/2.6.4-r0$
find sysroot-destdir/
sysroot-destdir/
sysroot-destdir/usr
sysroot-destdir/usr/lib
sysroot-destdir/usr/lib/libfl.so
sysroot-destdir/usr/lib/libfl.so.2
sysroot-destdir/usr/lib/flex
sysroot-destdir/usr/lib/libfl.so.2.0.0
sysroot-destdir/usr/include
sysroot-destdir/usr/include/FlexLexer.h
sysroot-destdir/usr/share
sysroot-destdir/sysroot-providers
sysroot-destdir/sysroot-providers/flex

Binutils source does not mention FlexLexer.h anywhere.

Bison installs:
akanavin@ubuntu1804-ty:~/poky/build/tmp/work/core2-64-poky-linux/bison/3.7.6-r0/sysroot-destdir$
find
.
./usr
./usr/lib
./usr/lib/liby.a
./usr/share
./usr/share/aclocal
./usr/share/aclocal/bison-i18n.m4
./usr/share/bison
./usr/share/bison/xslt
./usr/share/bison/xslt/bison.xsl
./usr/share/bison/xslt/xml2text.xsl
./usr/share/bison/xslt/xml2dot.xsl
./usr/share/bison/xslt/xml2xhtml.xsl
./usr/share/bison/m4sugar
./usr/share/bison/m4sugar/m4sugar.m4
./usr/share/bison/m4sugar/foreach.m4
./usr/share/bison/skeletons
./usr/share/bison/skeletons/variant.hh
./usr/share/bison/skeletons/stack.hh
./usr/share/bison/skeletons/traceon.m4
./usr/share/bison/skeletons/c++.m4
./usr/share/bison/skeletons/bison.m4
./usr/share/bison/skeletons/yacc.c
./usr/share/bison/skeletons/c++-skel.m4
./usr/share/bison/skeletons/d-skel.m4
./usr/share/bison/skeletons/README-D.txt
./usr/share/bison/skeletons/location.cc
./usr/share/bison/skeletons/java.m4
./usr/share/bison/skeletons/lalr1.cc
./usr/share/bison/skeletons/d.m4
./usr/share/bison/skeletons/c-like.m4
./usr/share/bison/skeletons/lalr1.java
./usr/share/bison/skeletons/lalr1.d
./usr/share/bison/skeletons/c-skel.m4
./usr/share/bison/skeletons/glr.c
./usr/share/bison/skeletons/c.m4
./usr/share/bison/skeletons/glr.cc
./usr/share/bison/skeletons/java-skel.m4
./usr/share/bison/README.md
./usr/share/bison/bison-default.css

And similarly, none of this is mentioned in the source.

Zlib however was dropped incorrectly (there's --with-system-zlib), I will
amend that, and write a better commit message.

Alex

--00000000000065e2d405ca2634ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sun, 22 Aug 2021 at 15:06, Richard Purdie &lt;<a href=3D"mailto:r=
ichard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&g=
t; wrote:=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; -DEPENDS +=3D &quot;flex bison zlib&quot;<br>
&gt; -<br>
<br>
This is something which has caused a lot of problems in the past. In partic=
ular,<br>
if something touches (patches( one of the pre-generated files or we use a g=
it<br>
version of binutils this breaks. It also seemed to depend on the host versi=
on of<br>
patch used.<br>
<br>
For zlib, is the recipe using the binary only or the library? If the latter=
,<br>
that also proves problematic.<br>
<br>
I appreciate it may have passed autobuilder testing but I suspect that isn&=
#39;t<br>
enough for real work use.<br>
<br>
Also, the target version would still need these?<br>
<br>
I like the idea of streamlining dependencies but this one needs some furthe=
r<br>
checks...<br></blockquote></div><div class=3D"gmail_quote"><br></div><div c=
lass=3D"gmail_quote">All three are already explicitly included as native de=
pendencies for all binutils variants and that has not changed:</div><div cl=
ass=3D"gmail_quote">binutils.inc:DEPENDS =3D &quot;flex-native bison-native=
 zlib-native gnu-config-native autoconf-native&quot;</div><div class=3D"gma=
il_quote"><br></div><div class=3D"gmail_quote">For the target dependencies,=
 flex installs:</div><div class=3D"gmail_quote">akanavin@ubuntu1804-ty:~/po=
ky/build/tmp/work/core2-64-poky-linux/flex/2.6.4-r0$ find sysroot-destdir/<=
br>sysroot-destdir/<br>sysroot-destdir/usr<br>sysroot-destdir/usr/lib<br>sy=
sroot-destdir/usr/lib/libfl.so<br>sysroot-destdir/usr/lib/libfl.so.2<br>sys=
root-destdir/usr/lib/flex<br>sysroot-destdir/usr/lib/libfl.so.2.0.0<br>sysr=
oot-destdir/usr/include<br>sysroot-destdir/usr/include/FlexLexer.h<br>sysro=
ot-destdir/usr/share<br>sysroot-destdir/sysroot-providers<br>sysroot-destdi=
r/sysroot-providers/flex</div><div class=3D"gmail_quote"><br></div><div cla=
ss=3D"gmail_quote">Binutils source does not mention FlexLexer.h anywhere.</=
div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Bison i=
nstalls:</div><div class=3D"gmail_quote">akanavin@ubuntu1804-ty:~/poky/buil=
d/tmp/work/core2-64-poky-linux/bison/3.7.6-r0/sysroot-destdir$ find<br>.<br=
>./usr<br>./usr/lib<br>./usr/lib/liby.a<br>./usr/share<br>./usr/share/acloc=
al<br>./usr/share/aclocal/bison-i18n.m4<br>./usr/share/bison<br>./usr/share=
/bison/xslt<br>./usr/share/bison/xslt/bison.xsl<br>./usr/share/bison/xslt/x=
ml2text.xsl<br>./usr/share/bison/xslt/xml2dot.xsl<br>./usr/share/bison/xslt=
/xml2xhtml.xsl<br>./usr/share/bison/m4sugar<br>./usr/share/bison/m4sugar/m4=
sugar.m4<br>./usr/share/bison/m4sugar/foreach.m4<br>./usr/share/bison/skele=
tons<br>./usr/share/bison/skeletons/variant.hh<br>./usr/share/bison/skeleto=
ns/stack.hh<br>./usr/share/bison/skeletons/traceon.m4<br>./usr/share/bison/=
skeletons/c++.m4<br>./usr/share/bison/skeletons/bison.m4<br>./usr/share/bis=
on/skeletons/yacc.c<br>./usr/share/bison/skeletons/c++-skel.m4<br>./usr/sha=
re/bison/skeletons/d-skel.m4<br>./usr/share/bison/skeletons/README-D.txt<br=
>./usr/share/bison/skeletons/location.cc<br>./usr/share/bison/skeletons/jav=
a.m4<br>./usr/share/bison/skeletons/lalr1.cc<br>./usr/share/bison/skeletons=
/d.m4<br>./usr/share/bison/skeletons/c-like.m4<br>./usr/share/bison/skeleto=
ns/lalr1.java<br>./usr/share/bison/skeletons/lalr1.d<br>./usr/share/bison/s=
keletons/c-skel.m4<br>./usr/share/bison/skeletons/glr.c<br>./usr/share/biso=
n/skeletons/c.m4<br>./usr/share/bison/skeletons/glr.cc<br>./usr/share/bison=
/skeletons/java-skel.m4<br>./usr/share/bison/README.md<br>./usr/share/bison=
/bison-default.css<br></div><div class=3D"gmail_quote"><br></div><div class=
=3D"gmail_quote">And similarly, none of this is mentioned in the source.</d=
iv><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Zlib how=
ever was dropped incorrectly (there&#39;s --with-system-zlib), I will amend=
 that, and write a better commit message.<br></div><div class=3D"gmail_quot=
e"><br></div><div class=3D"gmail_quote">Alex<br></div><div class=3D"gmail_q=
uote"><br></div></div>

--00000000000065e2d405ca2634ef--
