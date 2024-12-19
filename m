Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D8DE7718A
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 04:04:20 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.122554.1734581056143864181
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Dec 2024 20:04:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZXoNqwcI;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7f71f2b1370so157110a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 20:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734581055; x=1735185855; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JoXOaEogfA5G99MckM4+XZZF53HuqsRU2xx+th12EYM=;
        b=ZXoNqwcIgyuDp9/e/AsciYwbtfCNiJeT8M9eNVU3On1n0lt54zcnToO3HifIMs3Fws
         eJbavys2Pg/uhIKrMql0f0ncEq3iMsCBmOvtEM5JBO+mK9c0QeYbxRyBiZ32lmD/0uBB
         v01Ggn1o8hjuddNAZ/4h9Nr1v0j+RRUj4mM7avmRTvO5qp6N/jHReKUxiIoJ535IsphR
         /afMX24x86v/Az9NN2R96cfopOIGySxah9WKjfh3O8nYyghGckS0maPkJuSoXylrRnt3
         rf7bKc13hjPUncCSARPzh/vu38Ni+d621ygOLMj4qSdUZ24jSEm5dYoWdZmavGvOR4aW
         /Jqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734581055; x=1735185855;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JoXOaEogfA5G99MckM4+XZZF53HuqsRU2xx+th12EYM=;
        b=s4UdWaIfr0lE1qviOOeZIo3lqF3IEpR+ixszHmOQ50iwT8XmZYVGKXV/FiNjnFWr1y
         2OBhuR/IR+95wb5Nsh9IJvTfLto0Ljo6uZm3z/ecVsnw0ydEyWP/h21OgG5vjIIqbzWH
         adcfWI1LDI1PGyP0IOMcsbFi7OdZiQo+U6RNc5DRiEyPH20Af6bRvoTBJli1/bgOtTPS
         sJfzIxgflZoTkhXtNKgAcCJ3B44hJkE4g0z/KWrv1OXMO5BNRQTpHnO7z+w/aUyWWE53
         7dUujNOl9aO5huF6sfTkv09uf7X3o/he7FggUGi9DqITtswfni+A4v9Z5VBSsrynTiOk
         sTdw==
X-Gm-Message-State: AOJu0YwWpAI7+7gM9Hbq7+n2NYuLgEztM4YmuJI7pMz4MPCPPxEsXHIX
	FV3z2vvjwaHQrnt9pzc9ll1AHYrM2/iBiMGDvBjnczosFLicZgaFEGCg90KwS+TaNgkskRk6nH0
	81YctV0whaNXNxFM8DJD4F28FtnFLbwEH
X-Gm-Gg: ASbGncsRH9IW8UUq98ORZJWUPaCjGiT93lzHt5Zt7Zir9kikKAHCLWX8uVfxMYGSBwh
	OdH0GLV0zu/UgIq99h2W7K647DBYaNsdNqAvrtg==
X-Google-Smtp-Source: AGHT+IFVbe2K9LeElPI6g63hWaWT7FkPS1KdF+4DmY7j/VX6sOPq2vYU/yA19fRlHVMXP2k0DO7Tpd2dUhrTK27251s=
X-Received: by 2002:a17:90b:51c6:b0:2ee:3cc1:793b with SMTP id
 98e67ed59e1d1-2f2e9388a51mr6965406a91.26.1734581055226; Wed, 18 Dec 2024
 20:04:15 -0800 (PST)
MIME-Version: 1.0
References: <cover.1734553652.git.steve@sakoman.com> <fb0653a8b95be95eb2553b7c939444683cb11eed.1734553652.git.steve@sakoman.com>
In-Reply-To: <fb0653a8b95be95eb2553b7c939444683cb11eed.1734553652.git.steve@sakoman.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 18 Dec 2024 23:04:02 -0500
Message-ID: <CADkTA4NqRrK9Myu+Xt1e+87jDcAsNO_y68i=KHLjC5oWbJHzuA@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 09/10] kern-tools-native: fix SyntaxWarning
 for RegEx calls on Python 3.12
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a18b8c0629979f33"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 04:04:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208896

--000000000000a18b8c0629979f33
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please don't take this patch in this format.

Once I've approved and merged the changes into the kern-tools, there will
be a SRCREV update.

So this is a NACK/

Bruce

On Wed, Dec 18, 2024 at 5:02=E2=80=AFPM Steve Sakoman via lists.openembedde=
d.org
<steve=3Dsakoman.com@lists.openembedded.org> wrote:

> From: Hongxu Jia <hongxu.jia@windriver.com>
>
> Python 3.12 emmits a SyntaxWarning when using unescaped
> character inside a RegEx string.
> '''
> recipe-sysroot-native/usr/bin/symbol_why.py:161: SyntaxWarning: invalid
> escape sequence '\.'
>   if re.match( ".*\.config", opt ):
> recipe-sysroot-native/usr/bin/symbol_why.py:216: SyntaxWarning: invalid
> escape sequence '\w'
>   x =3D re.match( "^# .*Linux/\w*\s*([0-9]*\.[0-9]*\.[0-9]*).*Kernel
> Configuration", line )
> recipe-sysroot-native/usr/bin/symbol_why.py:495: SyntaxWarning: invalid
> escape sequence '\s'
>   if re.search( "^#\s*CONFIG_", option ):
> '''
>
> According to [1], use raw strings for regular expression
>
> [1] https://docs.python.org/dev/whatsnew/3.12.html#other-language-changes
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  ...yntaxWarning-for-RegEx-calls-on-Pyth.patch | 60 +++++++++++++++++++
>  .../kern-tools/kern-tools-native_git.bb       |  4 +-
>  2 files changed, 63 insertions(+), 1 deletion(-)
>  create mode 100644
> meta/recipes-kernel/kern-tools/files/0001-symbol_why-fix-SyntaxWarning-fo=
r-RegEx-calls-on-Pyth.patch
>
> diff --git
> a/meta/recipes-kernel/kern-tools/files/0001-symbol_why-fix-SyntaxWarning-=
for-RegEx-calls-on-Pyth.patch
> b/meta/recipes-kernel/kern-tools/files/0001-symbol_why-fix-SyntaxWarning-=
for-RegEx-calls-on-Pyth.patch
> new file mode 100644
> index 0000000000..e87067c8ac
> --- /dev/null
> +++
> b/meta/recipes-kernel/kern-tools/files/0001-symbol_why-fix-SyntaxWarning-=
for-RegEx-calls-on-Pyth.patch
> @@ -0,0 +1,60 @@
> +From 1f64368e4e82e47cd0e0dfe37b0e1b8958566d21 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Tue, 17 Dec 2024 01:25:29 -0800
> +Subject: [PATCH] symbol_why: fix SyntaxWarning for RegEx calls on Python
> 3.12
> +
> +Python 3.12 emmits a SyntaxWarning when using unescaped
> +character inside a RegEx string.
> +'''
> +recipe-sysroot-native/usr/bin/symbol_why.py:161: SyntaxWarning: invalid
> escape sequence '\.'
> +  if re.match( ".*\.config", opt ):
> +recipe-sysroot-native/usr/bin/symbol_why.py:216: SyntaxWarning: invalid
> escape sequence '\w'
> +  x =3D re.match( "^# .*Linux/\w*\s*([0-9]*\.[0-9]*\.[0-9]*).*Kernel
> Configuration", line )
> +recipe-sysroot-native/usr/bin/symbol_why.py:495: SyntaxWarning: invalid
> escape sequence '\s'
> +  if re.search( "^#\s*CONFIG_", option ):
> +'''
> +
> +According to [1], use raw strings for regular expression
> +
> +[1] https://docs.python.org/dev/whatsnew/3.12.html#other-language-change=
s
> +
> +Upstream-Status: Submitted [linux-yocto@lists.yoctoproject.org]
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + tools/symbol_why.py | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/tools/symbol_why.py b/tools/symbol_why.py
> +index 326e84f..4864378 100755
> +--- a/tools/symbol_why.py
> ++++ b/tools/symbol_why.py
> +@@ -158,7 +158,7 @@ for opt in args.args:
> +     elif re.match( "--ksrc=3D*", opt):
> +         temp, ksrc =3D opt.split('=3D', 2)
> +     else:
> +-        if re.match( ".*\.config", opt ):
> ++        if re.match( r".*\.config", opt ):
> +             dotconfig=3Dopt
> +         elif not ksrc:
> +             ksrc=3Dopt
> +@@ -213,7 +213,7 @@ if not os.getenv("KERNELVERSION"):
> +     hconfig =3D open( dotconfig )
> +     for line in hconfig:
> +         line =3D line.rstrip()
> +-        x =3D re.match( "^# .*Linux/\w*\s*([0-9]*\.[0-9]*\.[0-9]*).*Ker=
nel
> Configuration", line )
> ++        x =3D re.match( r"^#
> .*Linux/\w*\s*([0-9]*\.[0-9]*\.[0-9]*).*Kernel Configuration", line )
> +         if x:
> +             os.environ["KERNELVERSION"] =3D x.group(1)
> +             if verbose:
> +@@ -492,7 +492,7 @@ def split_option( config_option_str ):
> +         opt =3D m.group(1)
> +         val =3D m.group(2)
> +     except:
> +-        if re.search( "^#\s*CONFIG_", option ):
> ++        if re.search( r"^#\s*CONFIG_", option ):
> +             # print( "option is a is not set!!! %s" % option )
> +             m =3D re.match(r"# (CONFIG_[^ ]+) is not set", option )
> +             if m:
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> index 8eff00821a..7d11889eda 100644
> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> @@ -16,7 +16,9 @@ PV =3D "0.3+git"
>
>  inherit native
>
> -SRC_URI =3D "git://
> git.yoctoproject.org/yocto-kernel-tools.git;branch=3Dmaster;protocol=3Dht=
tps"
> +SRC_URI =3D "git://
> git.yoctoproject.org/yocto-kernel-tools.git;branch=3Dmaster;protocol=3Dht=
tps \
> +
>  file://0001-symbol_why-fix-SyntaxWarning-for-RegEx-calls-on-Pyth.patch \
> +"
>  S =3D "${WORKDIR}/git"
>
>  do_configure() {
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208889):
> https://lists.openembedded.org/g/openembedded-core/message/208889
> Mute This Topic: https://lists.openembedded.org/mt/110188794/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000a18b8c0629979f33
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Please don&#39;t take this patch in this format.</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gma=
il_default" style=3D"font-size:small">Once I&#39;ve approved and merged the=
 changes into the kern-tools, there will</div><div class=3D"gmail_default" =
style=3D"font-size:small">be a SRCREV update.</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">So this is a NACK/</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">Bruce</div></div><br><div class=3D"gmail_quote gmail_quote_c=
ontainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 18, 2024 at 5:0=
2=E2=80=AFPM Steve Sakoman via <a href=3D"http://lists.openembedded.org">li=
sts.openembedded.org</a> &lt;steve=3D<a href=3D"mailto:sakoman.com@lists.op=
enembedded.org">sakoman.com@lists.openembedded.org</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">From: Hongxu Jia &lt;<a h=
ref=3D"mailto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windri=
ver.com</a>&gt;<br>
<br>
Python 3.12 emmits a SyntaxWarning when using unescaped<br>
character inside a RegEx string.<br>
&#39;&#39;&#39;<br>
recipe-sysroot-native/usr/bin/symbol_why.py:161: SyntaxWarning: invalid esc=
ape sequence &#39;\.&#39;<br>
=C2=A0 if re.match( &quot;.*\.config&quot;, opt ):<br>
recipe-sysroot-native/usr/bin/symbol_why.py:216: SyntaxWarning: invalid esc=
ape sequence &#39;\w&#39;<br>
=C2=A0 x =3D re.match( &quot;^# .*Linux/\w*\s*([0-9]*\.[0-9]*\.[0-9]*).*Ker=
nel Configuration&quot;, line )<br>
recipe-sysroot-native/usr/bin/symbol_why.py:495: SyntaxWarning: invalid esc=
ape sequence &#39;\s&#39;<br>
=C2=A0 if re.search( &quot;^#\s*CONFIG_&quot;, option ):<br>
&#39;&#39;&#39;<br>
<br>
According to [1], use raw strings for regular expression<br>
<br>
[1] <a href=3D"https://docs.python.org/dev/whatsnew/3.12.html#other-languag=
e-changes" rel=3D"noreferrer" target=3D"_blank">https://docs.python.org/dev=
/whatsnew/3.12.html#other-language-changes</a><br>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" t=
arget=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
Signed-off-by: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" targe=
t=3D"_blank">steve@sakoman.com</a>&gt;<br>
---<br>
=C2=A0...yntaxWarning-for-RegEx-calls-on-Pyth.patch | 60 ++++++++++++++++++=
+<br>
=C2=A0.../kern-tools/<a href=3D"http://kern-tools-native_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">kern-tools-native_git.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 4 +-<br>
=C2=A02 files changed, 63 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-kernel/kern-tools/files/0001-symbol_w=
hy-fix-SyntaxWarning-for-RegEx-calls-on-Pyth.patch<br>
<br>
diff --git a/meta/recipes-kernel/kern-tools/files/0001-symbol_why-fix-Synta=
xWarning-for-RegEx-calls-on-Pyth.patch b/meta/recipes-kernel/kern-tools/fil=
es/0001-symbol_why-fix-SyntaxWarning-for-RegEx-calls-on-Pyth.patch<br>
new file mode 100644<br>
index 0000000000..e87067c8ac<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/kern-tools/files/0001-symbol_why-fix-SyntaxWarnin=
g-for-RegEx-calls-on-Pyth.patch<br>
@@ -0,0 +1,60 @@<br>
+From 1f64368e4e82e47cd0e0dfe37b0e1b8958566d21 Mon Sep 17 00:00:00 2001<br>
+From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" target=3D=
"_blank">hongxu.jia@windriver.com</a>&gt;<br>
+Date: Tue, 17 Dec 2024 01:25:29 -0800<br>
+Subject: [PATCH] symbol_why: fix SyntaxWarning for RegEx calls on Python 3=
.12<br>
+<br>
+Python 3.12 emmits a SyntaxWarning when using unescaped<br>
+character inside a RegEx string.<br>
+&#39;&#39;&#39;<br>
+recipe-sysroot-native/usr/bin/symbol_why.py:161: SyntaxWarning: invalid es=
cape sequence &#39;\.&#39;<br>
+=C2=A0 if re.match( &quot;.*\.config&quot;, opt ):<br>
+recipe-sysroot-native/usr/bin/symbol_why.py:216: SyntaxWarning: invalid es=
cape sequence &#39;\w&#39;<br>
+=C2=A0 x =3D re.match( &quot;^# .*Linux/\w*\s*([0-9]*\.[0-9]*\.[0-9]*).*Ke=
rnel Configuration&quot;, line )<br>
+recipe-sysroot-native/usr/bin/symbol_why.py:495: SyntaxWarning: invalid es=
cape sequence &#39;\s&#39;<br>
+=C2=A0 if re.search( &quot;^#\s*CONFIG_&quot;, option ):<br>
+&#39;&#39;&#39;<br>
+<br>
+According to [1], use raw strings for regular expression<br>
+<br>
+[1] <a href=3D"https://docs.python.org/dev/whatsnew/3.12.html#other-langua=
ge-changes" rel=3D"noreferrer" target=3D"_blank">https://docs.python.org/de=
v/whatsnew/3.12.html#other-language-changes</a><br>
+<br>
+Upstream-Status: Submitted [<a href=3D"mailto:linux-yocto@lists.yoctoproje=
ct.org" target=3D"_blank">linux-yocto@lists.yoctoproject.org</a>]<br>
+Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" =
target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
+---<br>
+ tools/symbol_why.py | 6 +++---<br>
+ 1 file changed, 3 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/tools/symbol_why.py b/tools/symbol_why.py<br>
+index 326e84f..4864378 100755<br>
+--- a/tools/symbol_why.py<br>
++++ b/tools/symbol_why.py<br>
+@@ -158,7 +158,7 @@ for opt in args.args:<br>
+=C2=A0 =C2=A0 =C2=A0elif re.match( &quot;--ksrc=3D*&quot;, opt):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0temp, ksrc =3D opt.split(&#39;=3D&#39;, =
2)<br>
+=C2=A0 =C2=A0 =C2=A0else:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if re.match( &quot;.*\.config&quot;, opt ):<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if re.match( r&quot;.*\.config&quot;, opt ):<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dotconfig=3Dopt<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif not ksrc:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ksrc=3Dopt<br>
+@@ -213,7 +213,7 @@ if not os.getenv(&quot;KERNELVERSION&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0hconfig =3D open( dotconfig )<br>
+=C2=A0 =C2=A0 =C2=A0for line in hconfig:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0line =3D line.rstrip()<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 x =3D re.match( &quot;^# .*Linux/\w*\s*([0-9]=
*\.[0-9]*\.[0-9]*).*Kernel Configuration&quot;, line )<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 x =3D re.match( r&quot;^# .*Linux/\w*\s*([0-9=
]*\.[0-9]*\.[0-9]*).*Kernel Configuration&quot;, line )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if x:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.environ[&quot;KERNELVER=
SION&quot;] =3D x.group(1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if verbose:<br>
+@@ -492,7 +492,7 @@ def split_option( config_option_str ):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opt =3D m.group(1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D m.group(2)<br>
+=C2=A0 =C2=A0 =C2=A0except:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if re.search( &quot;^#\s*CONFIG_&quot;, optio=
n ):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if re.search( r&quot;^#\s*CONFIG_&quot;, opti=
on ):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# print( &quot;option is a=
 is not set!!! %s&quot; % option )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m =3D re.match(r&quot;# (C=
ONFIG_[^ ]+) is not set&quot;, option )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if m:<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-kernel/kern-tools/<a href=3D"http://kern-tools-na=
tive_git.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.bb<=
/a> b/meta/recipes-kernel/kern-tools/<a href=3D"http://kern-tools-native_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.bb</a><br>
index 8eff00821a..7d11889eda 100644<br>
--- a/meta/recipes-kernel/kern-tools/<a href=3D"http://kern-tools-native_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.bb</a><br>
+++ b/meta/recipes-kernel/kern-tools/<a href=3D"http://kern-tools-native_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.bb</a><br>
@@ -16,7 +16,9 @@ PV =3D &quot;0.3+git&quot;<br>
<br>
=C2=A0inherit native<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/yocto-kerne=
l-tools.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"=
_blank">git.yoctoproject.org/yocto-kernel-tools.git;branch=3Dmaster;protoco=
l=3Dhttps</a>&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/yocto-kerne=
l-tools.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"=
_blank">git.yoctoproject.org/yocto-kernel-tools.git;branch=3Dmaster;protoco=
l=3Dhttps</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-symbol_why-fix-Syntax=
Warning-for-RegEx-calls-on-Pyth.patch \<br>
+&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0do_configure() {<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#208889): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/208889" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/208889</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/110188794/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/110188794/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000a18b8c0629979f33--

