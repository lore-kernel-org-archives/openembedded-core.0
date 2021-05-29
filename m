Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.20564.1622293755215222135
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 May 2021 06:09:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=r9lmwlp7;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id b17so8037734ede.0
        for <openembedded-core@lists.openembedded.org>; Sat, 29 May 2021 06:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oKtDXZ/pze2yvjRpZ31prm1R5wTV3b3nbvLCM4o7YYw=;
        b=r9lmwlp71NEJyXjqlNqDVnt9YLgRp9QkqoBVISXcJq9h8rU1zZpZ4Y0FmgZWT2+md0
         zGW91OnW6Kbgaw6KiEK8+e+bOsT/v71mQGibDWxU9lSfGRMMjyaA5BUMyLHa1MthZeek
         sIMSqX11WYn3z9LUnRSLbe6xooiyGuL4Ue0yYK71oSYDK6473d1Y5xOuBPoP8ZQx7VtU
         F84rA4SkncaOn8QvfdxWWxbTfEpOPewBM7X3tGz1J0pxBFCBQQvNVtYT7idlNom7e/3P
         /Zyaf8s4Pr5cUDWNmkScyc2D6EAp/9lUTEdDwLDZ9pDCT+thCGD+QgAe5nKF3FJ6i5hu
         RdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oKtDXZ/pze2yvjRpZ31prm1R5wTV3b3nbvLCM4o7YYw=;
        b=GsLOufizdmV9GUlDXHhI3AAz83Yq9FMbrMZFrruJPsxnU9/TmTIhDKZ68pMc4mKay+
         oVJKkMBAgJ85oRnSOX7D0uYiFlKL464igNJcj10ZHN+PByPhViree17kL2IpM6BFnf6X
         4MYBnrGjB3RLbXheG6MBrDblQWF9XTh9tbiaOKSPrfoRuBOfS7WOgBdsy4uEpND91sad
         ZWS/hiUQX6v113pHN+QoR+MTJh1cBaia4WasaND0jJnph+bb+KiHj05BtfGOStfZH4/7
         PsJgE7u6OIwHMsqGzyb2fQp2dOV0yLstNDKFw8IEXCzxtz8wtthI8FIV6cROB0Ynbftp
         Ywtw==
X-Gm-Message-State: AOAM5333URUfX7keBUi6PIIT+Fg0G/0olj9pKmOgd8D7ZW4EvrximsCF
	lHzxw38oAp0jFRG9bIiLr51Z4ZGhPtopE+Uj0QA=
X-Google-Smtp-Source: ABdhPJwTKIhX4+zKrNAysbGAO74Wn+kkJscdLixUkSmo/WYIrRcfH4Dnr92059ucXP+irVnIiFeDAIOD6sezgeTC3zA=
X-Received: by 2002:a05:6402:1582:: with SMTP id c2mr15502979edv.388.1622293753470;
 Sat, 29 May 2021 06:09:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210524152106.4160032-1-raj.khem@gmail.com> <CAAnfSTvgOiJ5hvG41fTqW3XD73bBB5nJOG7FaySPzspcGOj1bg@mail.gmail.com>
 <CAMKF1soOUcqa6huRjbn5QgP0hkBaFafS2PkgWHbVazW4R0NRnQ@mail.gmail.com>
 <1682A83F9B9CCAC9.4904@lists.openembedded.org> <1682ACF8BD246772.22476@lists.openembedded.org>
In-Reply-To: <1682ACF8BD246772.22476@lists.openembedded.org>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Sat, 29 May 2021 15:09:02 +0200
Message-ID: <CA+chaQcM29+vxUJnydStiWLTKbTkOW=2z70eNESGM4_boEG=ww@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] gcc: Update to latest on release/gcc-11 branch
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Ross Burton <ross@burtonini.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e5a3e405c377b263"

--000000000000e5a3e405c377b263
Content-Type: text/plain; charset="UTF-8"

It's not directly caused by this upgrade, but it revealed interesting issue
in incremental builds.

This is just to document some reproducible cases of "random build issues
which magically disappeared after -c clean".

Building in the same TMPDIR with this gcc upgrade resulted in syslinux and
libvpx failing with couple errors like:

make[4]: Leaving directory
'/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslinux/6.04-pre2-r1/syslinux-6.04-pre2/bios/com32/tools'
make[4]: *** No rule to make target
'/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslinux/6.04-pre2-r1/recipe-sysroot-native/usr/lib/x86_64-webos-linux/gcc/x86_64-webos-linux/11.1.0/include/stdarg.h',
needed by 'zlib/adler32.o'.  Stop.
make[4]: *** Waiting for unfinished jobs....
make[4]: Leaving directory
'/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslinux/6.04-pre2-r1/syslinux-6.04-pre2/bios/com32/lib'
make[3]: ***
[/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslinux/6.04-pre2-r1/syslinux-6.04-pre2/com32/Makefile:7:
lib] Error 2
make[3]: Leaving directory
'/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslinux/6.04-pre2-r1/syslinux-6.04-pre2/bios/com32'
make[2]: ***
[/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslinux/6.04-pre2-r1/syslinux-6.04-pre2/Makefile:347:
install] Error 2
make[2]: Leaving directory
'/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslinux/6.04-pre2-r1/syslinux-6.04-pre2/bios'
make[1]: ***
[/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslinux/6.04-pre2-r1/syslinux-6.04-pre2/Makefile:257:
bios] Error 2
make[1]: Leaving directory
'/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslinux/6.04-pre2-r1/syslinux-6.04-pre2'
make: *** [Makefile:102: install] Error 2
ERROR: oe_runmake failed

Rebuilding from scratch fixes the issue and the 11.1.0 directory was
referenced in many *.o.d files:

---
6.04-pre2-r1-broken/syslinux-6.04-pre2/bios/com32/libupload/.upload_srec.o.d
       2021-05-24 09:56:57.390268171 +0200
+++ 6.04-pre2-r1/syslinux-6.04-pre2/bios/com32/libupload/.upload_srec.o.d
    2021-05-29 14:12:45.670506782 +0200
@@ -7,7 +7,7 @@

/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslinux/6.04-pre2-r1/syslinux-6.04-pre2/com32/include/bitsize32/stddef.h
\

/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslinux/6.04-pre2-r1/syslinux-6.04-pre2/com32/include/stdio.h
\

/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslinux/6.04-pre2-r1/syslinux-6.04-pre2/com32/include/stdarg.h
\
-
/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslinux/6.04-pre2-r1/recipe-sysroot-native/usr/lib/x86_64-webos-linux/gcc/x86_64-webos-linux/11.1.0/include/stdarg.h
\
+
/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslinux/6.04-pre2-r1/recipe-sysroot-native/usr/lib/x86_64-webos-linux/gcc/x86_64-webos-linux/11.1.1/include/stdarg.h
\

/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslinux/6.04-pre2-r1/syslinux-6.04-pre2/com32/include/inttypes.h
\

/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslinux/6.04-pre2-r1/syslinux-6.04-pre2/com32/include/stdint.h
\

/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslinux/6.04-pre2-r1/syslinux-6.04-pre2/com32/include/bitsize/stdint.h
\

I don't see any easy way how to force them to be regenerated when gcc was
upgraded.

syslinux uses plain Makefiles and do_configure tries to clean with;
oe_runmake firmware="bios" clean

Similarly libvpx doesn't use autotools bbclass, but calls configure/make
manually so also doesn't take advantage of separate B directory and
removing it before re-executing do_configure.

-- 1.8.2-r0-broken/git/vpx_scale/generic/vpx_scale.c.d 2021-05-24
09:29:44.916405487 +0200
+++ 1.8.2-r0/git/vpx_scale/generic/vpx_scale.c.d        2021-05-29
14:12:39.234539166 +0200
@@ -10,7 +10,7 @@

/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/libvpx/1.8.2-r0/recipe-sysroot/usr/include/bits/long-double-64.h
\

/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/libvpx/1.8.2-r0/recipe-sysroot/usr/include/gnu/stubs.h
\

/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/libvpx/1.8.2-r0/recipe-sysroot/usr/include/gnu/stubs-64.h
\
-
/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/libvpx/1.8.2-r0/recipe-sysroot-native/usr/lib/x86_64-webos-linux/gcc/x86_64-webos-linux/11.1.0/include/stddef.h
\
+
/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/libvpx/1.8.2-r0/recipe-sysroot-native/usr/lib/x86_64-webos-linux/gcc/x86_64-webos-linux/11.1.1/include/stddef.h
\

/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/libvpx/1.8.2-r0/recipe-sysroot/usr/include/bits/waitflags.h
\

/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/libvpx/1.8.2-r0/recipe-sysroot/usr/include/bits/waitstatus.h
\

/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/libvpx/1.8.2-r0/recipe-sysroot/usr/include/bits/floatn.h
\
@@ -49,7 +49,7 @@

/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/libvpx/1.8.2-r0/recipe-sysroot/usr/include/bits/stdlib-float.h
\
  vpx/vpx_integer.h \

/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/libvpx/1.8.2-r0/recipe-sysroot/usr/include/inttypes.h
\
-
/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/libvpx/1.8.2-r0/recipe-sysroot-native/usr/lib/x86_64-webos-linux/gcc/x86_64-webos-linux/11.1.0/include/stdint.h
\
+
/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/libvpx/1.8.2-r0/recipe-sysroot-native/usr/lib/x86_64-webos-linux/gcc/x86_64-webos-linux/11.1.1/include/stdint.h
\

/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/libvpx/1.8.2-r0/recipe-sysroot/usr/include/stdint.h
\

/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/libvpx/1.8.2-r0/recipe-sysroot/usr/include/bits/wchar.h
\

/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/libvpx/1.8.2-r0/recipe-sysroot/usr/include/bits/stdint-uintn.h
\

Any ideas how to detect and prevent this kind of issues in some generic way
so that we don't need to explicitly fix the recipes?
Bumping tmp-glibc/abi_version on every minor gcc upgrade also seems a bit
overkill (as gcc upgrades might not be the only source of these kind of
issues anyway).

Regards,

On Wed, May 26, 2021 at 7:10 PM Martin Jansa via lists.openembedded.org
<Martin.Jansa=gmail.com@lists.openembedded.org> wrote:

> On Wed, May 26, 2021 at 5:43 PM Martin Jansa via lists.openembedded.org
> <Martin.Jansa=gmail.com@lists.openembedded.org> wrote
>
>> I'm seeing different error with gcc-sanitizers and this new revision:
>>
>> work-shared/gcc-11.1.0-r0/gcc-11.1.0/libsanitizer/lsan/lsan_common_linux.cpp:164:25:
>> error: invalid conversion from 'void (*)(void*)' to 'void* (*)(void*)'
>> [-fpermissive]
>>
>> will double-check if it was introduced by this upgrade or something else
>> in oe-core master update today and also if there is a fix in even newer gcc
>> already.
>>
>
> Sorry for noise, this line of code comes from our local patch and the
> upgrade just started triggering this issue in it.
>
> 
>
>

--000000000000e5a3e405c377b263
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It&#39;s not directly caused by this upgrade, but it revea=
led interesting issue in incremental builds.<div><br></div><div>This is jus=
t to document some reproducible cases of &quot;random build issues which ma=
gically disappeared after -c clean&quot;.<br><div><br></div><div>Building i=
n the same TMPDIR with this gcc upgrade resulted in syslinux and libvpx fai=
ling with couple errors like:</div><div><br></div><div>make[4]: Leaving dir=
ectory &#39;/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-w=
ebos-linux/syslinux/6.04-pre2-r1/syslinux-6.04-pre2/bios/com32/tools&#39;<b=
r>make[4]: *** No rule to make target &#39;/OE/build/luneos-honister/webos-=
ports/tmp-glibc/work/core2-64-webos-linux/syslinux/6.04-pre2-r1/recipe-sysr=
oot-native/usr/lib/x86_64-webos-linux/gcc/x86_64-webos-linux/11.1.0/include=
/stdarg.h&#39;, needed by &#39;zlib/adler32.o&#39;.=C2=A0 Stop.<br>make[4]:=
 *** Waiting for unfinished jobs....<br>make[4]: Leaving directory &#39;/OE=
/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/sysl=
inux/6.04-pre2-r1/syslinux-6.04-pre2/bios/com32/lib&#39;<br>make[3]: *** [/=
OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/sy=
slinux/6.04-pre2-r1/syslinux-6.04-pre2/com32/Makefile:7: lib] Error 2<br>ma=
ke[3]: Leaving directory &#39;/OE/build/luneos-honister/webos-ports/tmp-gli=
bc/work/core2-64-webos-linux/syslinux/6.04-pre2-r1/syslinux-6.04-pre2/bios/=
com32&#39;<br>make[2]: *** [/OE/build/luneos-honister/webos-ports/tmp-glibc=
/work/core2-64-webos-linux/syslinux/6.04-pre2-r1/syslinux-6.04-pre2/Makefil=
e:347: install] Error 2<br>make[2]: Leaving directory &#39;/OE/build/luneos=
-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslinux/6.04-pre=
2-r1/syslinux-6.04-pre2/bios&#39;<br>make[1]: *** [/OE/build/luneos-honiste=
r/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslinux/6.04-pre2-r1/sys=
linux-6.04-pre2/Makefile:257: bios] Error 2<br>make[1]: Leaving directory &=
#39;/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-lin=
ux/syslinux/6.04-pre2-r1/syslinux-6.04-pre2&#39;<br>make: *** [Makefile:102=
: install] Error 2<br>ERROR: oe_runmake failed<br></div><div><br></div><div=
>Rebuilding from scratch fixes the issue and the 11.1.0 directory was refer=
enced in many *.o.d files:</div><div><br></div><div>--- 6.04-pre2-r1-broken=
/syslinux-6.04-pre2/bios/com32/libupload/.upload_srec.o.d =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A02021-05-24 09:56:57.390268171 +0200<br>+++ 6.04-pre2-r1/syslinux=
-6.04-pre2/bios/com32/libupload/.upload_srec.o.d =C2=A0 =C2=A0 =C2=A0 2021-=
05-29 14:12:45.670506782 +0200<br>@@ -7,7 +7,7 @@<br>=C2=A0 /OE/build/luneo=
s-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslinux/6.04-pr=
e2-r1/syslinux-6.04-pre2/com32/include/bitsize32/stddef.h \<br>=C2=A0 /OE/b=
uild/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslin=
ux/6.04-pre2-r1/syslinux-6.04-pre2/com32/include/stdio.h \<br>=C2=A0 /OE/bu=
ild/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslinu=
x/6.04-pre2-r1/syslinux-6.04-pre2/com32/include/stdarg.h \<br>- /OE/build/l=
uneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/syslinux/6.0=
4-pre2-r1/recipe-sysroot-native/usr/lib/x86_64-webos-linux/gcc/x86_64-webos=
-linux/11.1.0/include/stdarg.h \<br>+ /OE/build/luneos-honister/webos-ports=
/tmp-glibc/work/core2-64-webos-linux/syslinux/6.04-pre2-r1/recipe-sysroot-n=
ative/usr/lib/x86_64-webos-linux/gcc/x86_64-webos-linux/11.1.1/include/stda=
rg.h \<br>=C2=A0 /OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2=
-64-webos-linux/syslinux/6.04-pre2-r1/syslinux-6.04-pre2/com32/include/intt=
ypes.h \<br>=C2=A0 /OE/build/luneos-honister/webos-ports/tmp-glibc/work/cor=
e2-64-webos-linux/syslinux/6.04-pre2-r1/syslinux-6.04-pre2/com32/include/st=
dint.h \<br>=C2=A0 /OE/build/luneos-honister/webos-ports/tmp-glibc/work/cor=
e2-64-webos-linux/syslinux/6.04-pre2-r1/syslinux-6.04-pre2/com32/include/bi=
tsize/stdint.h \<br></div><div><br></div><div>I don&#39;t see any easy way =
how to force them to be regenerated when gcc was upgraded.</div><div><br></=
div><div>syslinux uses plain Makefiles and do_configure tries to clean with=
;</div><div>oe_runmake firmware=3D&quot;bios&quot; clean<br></div><div><br>=
</div><div>Similarly libvpx doesn&#39;t use autotools bbclass, but calls co=
nfigure/make manually so also doesn&#39;t take advantage of separate B dire=
ctory and removing it before re-executing do_configure.</div><div><br></div=
><div>-- 1.8.2-r0-broken/git/vpx_scale/generic/vpx_scale.c.d 2021-05-24 09:=
29:44.916405487 +0200<br>+++ 1.8.2-r0/git/vpx_scale/generic/vpx_scale.c.d =
=C2=A0 =C2=A0 =C2=A0 =C2=A02021-05-29 14:12:39.234539166 +0200<br>@@ -10,7=
 +10,7 @@<br>=C2=A0 /OE/build/luneos-honister/webos-ports/tmp-glibc/work/co=
re2-64-webos-linux/libvpx/1.8.2-r0/recipe-sysroot/usr/include/bits/long-dou=
ble-64.h \<br>=C2=A0 /OE/build/luneos-honister/webos-ports/tmp-glibc/work/c=
ore2-64-webos-linux/libvpx/1.8.2-r0/recipe-sysroot/usr/include/gnu/stubs.h =
\<br>=C2=A0 /OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-w=
ebos-linux/libvpx/1.8.2-r0/recipe-sysroot/usr/include/gnu/stubs-64.h \<br>-=
 /OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/=
libvpx/1.8.2-r0/recipe-sysroot-native/usr/lib/x86_64-webos-linux/gcc/x86_64=
-webos-linux/11.1.0/include/stddef.h \<br>+ /OE/build/luneos-honister/webos=
-ports/tmp-glibc/work/core2-64-webos-linux/libvpx/1.8.2-r0/recipe-sysroot-n=
ative/usr/lib/x86_64-webos-linux/gcc/x86_64-webos-linux/11.1.1/include/stdd=
ef.h \<br>=C2=A0 /OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2=
-64-webos-linux/libvpx/1.8.2-r0/recipe-sysroot/usr/include/bits/waitflags.h=
 \<br>=C2=A0 /OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-=
webos-linux/libvpx/1.8.2-r0/recipe-sysroot/usr/include/bits/waitstatus.h \<=
br>=C2=A0 /OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-web=
os-linux/libvpx/1.8.2-r0/recipe-sysroot/usr/include/bits/floatn.h \<br>@@ -=
49,7 +49,7 @@<br>=C2=A0 /OE/build/luneos-honister/webos-ports/tmp-glibc/wor=
k/core2-64-webos-linux/libvpx/1.8.2-r0/recipe-sysroot/usr/include/bits/stdl=
ib-float.h \<br>=C2=A0 vpx/vpx_integer.h \<br>=C2=A0 /OE/build/luneos-honis=
ter/webos-ports/tmp-glibc/work/core2-64-webos-linux/libvpx/1.8.2-r0/recipe-=
sysroot/usr/include/inttypes.h \<br>- /OE/build/luneos-honister/webos-ports=
/tmp-glibc/work/core2-64-webos-linux/libvpx/1.8.2-r0/recipe-sysroot-native/=
usr/lib/x86_64-webos-linux/gcc/x86_64-webos-linux/11.1.0/include/stdint.h \=
<br>+ /OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-l=
inux/libvpx/1.8.2-r0/recipe-sysroot-native/usr/lib/x86_64-webos-linux/gcc/x=
86_64-webos-linux/11.1.1/include/stdint.h \<br>=C2=A0 /OE/build/luneos-honi=
ster/webos-ports/tmp-glibc/work/core2-64-webos-linux/libvpx/1.8.2-r0/recipe=
-sysroot/usr/include/stdint.h \<br>=C2=A0 /OE/build/luneos-honister/webos-p=
orts/tmp-glibc/work/core2-64-webos-linux/libvpx/1.8.2-r0/recipe-sysroot/usr=
/include/bits/wchar.h \<br>=C2=A0 /OE/build/luneos-honister/webos-ports/tmp=
-glibc/work/core2-64-webos-linux/libvpx/1.8.2-r0/recipe-sysroot/usr/include=
/bits/stdint-uintn.h \</div></div><div><br></div><div>Any ideas how to dete=
ct and prevent this kind of issues in some generic way so that we don&#39;t=
 need to explicitly fix the recipes? Bumping=C2=A0tmp-glibc/abi_version on =
every minor gcc upgrade also seems a bit overkill (as gcc upgrades might no=
t be the only source of these kind of issues anyway).</div><div><br></div><=
div>Regards,</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Wed, May 26, 2021 at 7:10 PM Martin Jansa via <a href=
=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembedded.or=
g</a> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.org=
" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div d=
ir=3D"ltr">On Wed, May 26, 2021 at 5:43 PM Martin Jansa via <a href=3D"http=
://lists.openembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt=
;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote<br></div><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><div>I&#39;m seeing different error with gcc-sanitizers and th=
is new revision:</div><div><br></div>work-shared/gcc-11.1.0-r0/gcc-11.1.0/l=
ibsanitizer/lsan/lsan_common_linux.cpp:164:25: error: invalid conversion fr=
om &#39;void (*)(void*)&#39; to &#39;void* (*)(void*)&#39; [-fpermissive]<b=
r><div><br></div><div>will double-check if it was introduced by this upgrad=
e or something else in oe-core master update today and also if there is a f=
ix in even newer gcc already.</div></div></blockquote><div><br></div><div>S=
orry for noise, this line of code comes from our local patch and the upgrad=
e just started triggering this issue in it.</div></div></div>
<br>
<br>
<br>
</blockquote></div>

--000000000000e5a3e405c377b263--
