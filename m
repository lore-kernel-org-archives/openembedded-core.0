Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD135CDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 08:59:40 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.6963.1697101172085221714
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Oct 2023 01:59:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VLkLjBHy;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-77574c6cab0so48308485a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 01:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697101171; x=1697705971; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fap50wTNOkR6KSClI0X84wSyzho6BCN1RzkB3IIRLwY=;
        b=VLkLjBHyTmG6Q2T4CoeMBlwWWQexfcgvCWyMoxWHRjKe24BLq/RFoo2YpCAu2Dx/Jv
         m5iXb6okebzVmVyWYiaNyg8OrAu8g3imXhYL7Y0PAKNtln+V+keJTH/crLIhrjQxTAyP
         oQUEiPNQQ4apu8yVJf7Q56GsCTQ+fwmjlgRsfEe8l5z0DIc3CsAPr1grZRP9eFRm4NDW
         jYhJH2aGo6+eQ5bU3WXNjhU24Zq036KYh/7rLY4kzlgG36FDNuWC9UWwRrUi4g3ri1qL
         Suiyibzv75sfJJt/6h+ZjgDf4sAa9CuS1KkHmI6hLOuCrsHFSAISGNQkwW18EBqRWVjS
         LtBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697101171; x=1697705971;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fap50wTNOkR6KSClI0X84wSyzho6BCN1RzkB3IIRLwY=;
        b=qfy2AG0IsAUIshW+p/6s6tpU5keWIlZeNApbM9hoBw5ZJ6+/EkP+iv0KsjgM8n1ZRo
         268br2cCNDoACdwN/4YX23+VowbuJtQvpBGAPxJ9jqFJw2AzIyBv0yv+P4jyIavRiuf0
         5pknxy2t5bomalcjWnIhoJLpelcxg+mzg6eYFEIUf8M5/t7TgLEjbTtLbFaC65GfoAdn
         zllecaN4TWbDwhHN2I24dVDj0KD2hXls8bdnhBpBi6wSua9NsyL4v8U3NDzCxowbu/lV
         SS/rkCLAAnBrUj5/vMgFBASXQrV1nK94EcBUL35psivRYXPCz7BCg6YWbtwFPwOkQzf8
         +XsA==
X-Gm-Message-State: AOJu0YxPFPO1FVZU/+z63wwDrVQH2ZDghB9RF/e1DCyidB30h8zWMzKa
	xDAXdwERJSFCECsSqIef+G/l1PAYG9997Qt/4/s=
X-Google-Smtp-Source: AGHT+IHOcS0XIM9TwcsBCJucO9Nva9+qhixkMKbMZVYbjqAdrGG3WEPCLZASQgrCbuD6inLSKa7frNHwSeDOxqaawBc=
X-Received: by 2002:a0c:e9ce:0:b0:641:8df1:79e3 with SMTP id
 q14-20020a0ce9ce000000b006418df179e3mr24539274qvo.29.1697101170952; Thu, 12
 Oct 2023 01:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <20231011040550.1392831-1-sundeep.kokkonda@windriver.com> <e2333d489d4c3ae944331ab813a1b2514c776bc3.camel@linuxfoundation.org>
In-Reply-To: <e2333d489d4c3ae944331ab813a1b2514c776bc3.camel@linuxfoundation.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Thu, 12 Oct 2023 10:59:19 +0200
Message-ID: <CA+cAker_38DJQiX2aEpW54F1AwseQ0vwT6uHB4nfEErRVcoE4A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: reproducibility issue fix
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: sundeep.kokkonda@windriver.com, openembedded-core@lists.openembedded.org, 
	randy.macleod@windriver.com, naveen.gowda@windriver.com, 
	shivaprasad.moodalappa@windriver.com, yash.shinde@windriver.com, 
	deepthi.hemraj@windriver.com, umesh.kallapa@windriver.com
Content-Type: multipart/alternative; boundary="000000000000714f020607812827"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 08:59:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188991

--000000000000714f020607812827
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Oct 2023 at 08:37, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2023-10-10 at 21:05 -0700, Sundeep KOKKONDA via
> lists.openembedded.org wrote:
> > [Yocto#14875]
> > The '--remap-path-prefix' option removes all references to build
> directory structure in the debug information within the compiled output for
> Cargo dependencies and the project's binary.
> > However, some references to build directories remains in the final
> binary in .rustc section in the form of compressed metadata and this makes
> the build output dependent on the folder structure of the computer it's
> compiled on.
> > So, for reproducible builds, use the configuration option
> 'remap-debuginfo = true' along with the '--remap-path-prefix'.
> >
> > Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
> > ---
> >  meta/lib/oeqa/selftest/cases/reproducible.py | 2 --
> >  meta/recipes-devtools/rust/rust_1.70.0.bb    | 1 +
> >  2 files changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py
> b/meta/lib/oeqa/selftest/cases/reproducible.py
> > index 84c6c3a05f..9b4a0887dd 100644
> > --- a/meta/lib/oeqa/selftest/cases/reproducible.py
> > +++ b/meta/lib/oeqa/selftest/cases/reproducible.py
> > @@ -16,8 +16,6 @@ import os
> >  import datetime
> >
> >  exclude_packages = [
> > -     'rust',
> > -     'rust-dbg'
> >       ]
> >
> >  def is_excluded(package):
> > diff --git a/meta/recipes-devtools/rust/rust_1.70.0.bb
> b/meta/recipes-devtools/rust/rust_1.70.0.bb
> > index 3b9c05a19f..16d433910f 100644
> > --- a/meta/recipes-devtools/rust/rust_1.70.0.bb
> > +++ b/meta/recipes-devtools/rust/rust_1.70.0.bb
> > @@ -130,6 +130,7 @@ python do_configure() {
> >      # [rust]
> >      config.add_section("rust")
> >      config.set("rust", "rpath", e(True))
> > +    config.set("rust", "remap-debuginfo", e(True))
> >      config.set("rust", "channel", e(d.expand("${RUST_CHANNEL}")))
> >
> >      # Whether or not to optimize the compiler and standard library
>
> Unfortunately I have some less good news, the rust reproducibility
> tests do still have some kind of failure:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/3736/steps/12/logs/stdio
>
>
> http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20231011-7wbq1syl/packages/diff-html/
>
> This is a bit different to the previous issue since the rlib files are
> not changing and this is rustdoc. At a quick glance, it looks like the
> symbols are changing order in the file, which can sometimes be caused
> by the link command not being in the same order on all builds. This
> could be for example something doing:
>
> $LD *.so
>
> and hence the order of the linked objects depends on the order of the
> files on disk and which order glob found them in. It could also be
> something else.
>
> So we've made great progress and this will help our SPDX issues as the
> filenames are now consistent but we're not quite there yet I'm afraid.
> Unless we can find it quickly we'll have to put rust back on the
> exclusion list for the release.
>
> Cheers,
>
> Richard
>
>
Hello, just to confirm that I still diff for zvariant package , I tested
with the followin setup on poky master:

local;conf:

SANITY_TESTED_DISTROS = ""
OEQA_REPRODUCIBLE_TEST_TARGET = "zvariant"
OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS = "rust-native cargo-native"

and

OEQA_DEBUGGING_SAVED_OUTPUT=/home/jenkins/yocto-poky-master/reproducible_saved_output
oe-selftest -r reproducible.ReproducibleTests.test_reproducible_builds


> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188988):
> https://lists.openembedded.org/g/openembedded-core/message/188988
> Mute This Topic: https://lists.openembedded.org/mt/101890610/6213388
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> frederic.martinsons@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000714f020607812827
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, 12 Oct 2023 at 08:37, Richard=
 Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.p=
urdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Tue, 2023-10-10 at 21:05 -0700, Sundeep KOKKOND=
A via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; [Yocto#14875]<br>
&gt; The &#39;--remap-path-prefix&#39; option removes all references to bui=
ld directory structure in the debug information within the compiled output =
for Cargo dependencies and the project&#39;s binary.<br>
&gt; However, some references to build directories remains in the final bin=
ary in .rustc section in the form of compressed metadata and this makes the=
 build output dependent on the folder structure of the computer it&#39;s co=
mpiled on.<br>
&gt; So, for reproducible builds, use the configuration option &#39;remap-d=
ebuginfo =3D true&#39; along with the &#39;--remap-path-prefix&#39;.<br>
&gt; <br>
&gt; Signed-off-by: Sundeep KOKKONDA &lt;<a href=3D"mailto:sundeep.kokkonda=
@windriver.com" target=3D"_blank">sundeep.kokkonda@windriver.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 meta/lib/oeqa/selftest/cases/reproducible.py | 2 --<br>
&gt;=C2=A0 meta/recipes-devtools/rust/<a href=3D"http://rust_1.70.0.bb" rel=
=3D"noreferrer" target=3D"_blank">rust_1.70.0.bb</a>=C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 2 files changed, 1 insertion(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/o=
eqa/selftest/cases/reproducible.py<br>
&gt; index 84c6c3a05f..9b4a0887dd 100644<br>
&gt; --- a/meta/lib/oeqa/selftest/cases/reproducible.py<br>
&gt; +++ b/meta/lib/oeqa/selftest/cases/reproducible.py<br>
&gt; @@ -16,8 +16,6 @@ import os<br>
&gt;=C2=A0 import datetime<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 exclude_packages =3D [<br>
&gt; -=C2=A0 =C2=A0 =C2=A0&#39;rust&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0&#39;rust-dbg&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0]<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 def is_excluded(package):<br>
&gt; diff --git a/meta/recipes-devtools/rust/<a href=3D"http://rust_1.70.0.=
bb" rel=3D"noreferrer" target=3D"_blank">rust_1.70.0.bb</a> b/meta/recipes-=
devtools/rust/<a href=3D"http://rust_1.70.0.bb" rel=3D"noreferrer" target=
=3D"_blank">rust_1.70.0.bb</a><br>
&gt; index 3b9c05a19f..16d433910f 100644<br>
&gt; --- a/meta/recipes-devtools/rust/<a href=3D"http://rust_1.70.0.bb" rel=
=3D"noreferrer" target=3D"_blank">rust_1.70.0.bb</a><br>
&gt; +++ b/meta/recipes-devtools/rust/<a href=3D"http://rust_1.70.0.bb" rel=
=3D"noreferrer" target=3D"_blank">rust_1.70.0.bb</a><br>
&gt; @@ -130,6 +130,7 @@ python do_configure() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # [rust]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 config.add_section(&quot;rust&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 config.set(&quot;rust&quot;, &quot;rpath&quot;, e(=
True))<br>
&gt; +=C2=A0 =C2=A0 config.set(&quot;rust&quot;, &quot;remap-debuginfo&quot=
;, e(True))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 config.set(&quot;rust&quot;, &quot;channel&quot;, =
e(d.expand(&quot;${RUST_CHANNEL}&quot;)))<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Whether or not to optimize the compiler and stan=
dard library<br>
<br>
Unfortunately I have some less good news, the rust reproducibility<br>
tests do still have some kind of failure:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/117/buil=
ds/3736/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://a=
utobuilder.yoctoproject.org/typhoon/#/builders/117/builds/3736/steps/12/log=
s/stdio</a><br>
<br>
<a href=3D"http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20231=
011-7wbq1syl/packages/diff-html/" rel=3D"noreferrer" target=3D"_blank">http=
://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20231011-7wbq1syl/pa=
ckages/diff-html/</a><br>
<br>
This is a bit different to the previous issue since the rlib files are<br>
not changing and this is rustdoc. At a quick glance, it looks like the<br>
symbols are changing order in the file, which can sometimes be caused<br>
by the link command not being in the same order on all builds. This<br>
could be for example something doing:<br>
<br>
$LD *.so<br>
<br>
and hence the order of the linked objects depends on the order of the<br>
files on disk and which order glob found them in. It could also be<br>
something else.<br>
<br>
So we&#39;ve made great progress and this will help our SPDX issues as the<=
br>
filenames are now consistent but we&#39;re not quite there yet I&#39;m afra=
id.<br>
Unless we can find it quickly we&#39;ll have to put rust back on the<br>
exclusion list for the release.<br>
<br>
Cheers,<br>
<br>
Richard<br><br></blockquote><div>=C2=A0</div><div>Hello, just to confirm th=
at I still diff for zvariant package , I tested with the followin setup on =
poky master:</div><div><br></div><div>local;conf:</div><div><br></div><div>=
SANITY_TESTED_DISTROS =3D &quot;&quot;<br>OEQA_REPRODUCIBLE_TEST_TARGET =3D=
 &quot;zvariant&quot;<br>OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS =3D &quot;ru=
st-native cargo-native&quot;<br></div><div><br></div><div>and</div><div><br=
></div><div>OEQA_DEBUGGING_SAVED_OUTPUT=3D/home/jenkins/yocto-poky-master/r=
eproducible_saved_output oe-selftest -r reproducible.ReproducibleTests.test=
_reproducible_builds<br></div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#188988): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/188988" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/188988</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101890610/621=
3388" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101890610/6213388</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:frederic.martinsons@gmail.=
com" target=3D"_blank">frederic.martinsons@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000714f020607812827--

