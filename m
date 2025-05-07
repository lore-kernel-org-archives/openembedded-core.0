Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24606C3ABC0
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 22:14:48 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.1960.1746656079722496787
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 15:14:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TiKlFaUd;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso282612f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 15:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1746656078; x=1747260878; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oXKYVAI3EmDFcUB+J0+SoLgNuZBNSyhZH4KMgR8SjFc=;
        b=TiKlFaUd4MyoO1Q58dGCqRGLr+vgY1RZA1Js8O+M7U2KSAyx633yj1iV0ynFd2SJ0E
         mxwsRBWoK/0NKr66PkzPagq1y0W/FZesKEjXT/qWR8AIc7dKPsLypDlWN8X2CIqiczeX
         aVKds6RrW+N41kpLf3yitOptxtiQwlu/z+cQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746656078; x=1747260878;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oXKYVAI3EmDFcUB+J0+SoLgNuZBNSyhZH4KMgR8SjFc=;
        b=Bccz/WESqqHA4buBPp5jB9zuw+zOy23kT81ixopYFeziCWyqfkFu63Pe9NluzJAiQb
         zAGgA3OXfO94bkoKnk/y5dDUcTEgT6OcTP9sYbndrMlqN11V2mz5D/bRw+SvBDDxBlAC
         4rJweR9Of71LlFwOlrxFkVRIOCd6I5kJvGwG/BrUYJTeBkh3Svm6b3hAjG78h95XZAiF
         GHYT37N5/TeFh6VM7gCAa7lxlY1Oo23PlL5+9FnHtuX6mGwhyLdQx5iJhY93fWZVMLPv
         H96JsbxqL7CCo2LY7a7wcfiPBECueMLhkqLcTGyhsX3dc3IVrGHziHyZieyW4SJwgsNl
         IIHg==
X-Forwarded-Encrypted: i=1; AJvYcCVcsnmiNAWLItLHqwBU/rSbW7YKzG69IqmmcWYtuiCahvsaoYRlxZdHanXAcfHjkIle2ww6+6WGPCrmQMiM3H+2IA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzLcHlk0mtjM4M//jvqHc77lx6b97Hb4P5Y6On1u4Y7tU0mKFf0
	/KroliEPKqsotM7o1is9EjeJEeDRfnuEZEfnFzVWrBw8IQe6JQzROGD0Zg+X8i5EKdo8a7HSyR3
	lgUdn2iRD43CGxheyjaFAOQnU2tKIHwuJa3MBHw==
X-Gm-Gg: ASbGnctT1Nr/olzYMmZD4if8xdyBg3Rz/w9fz1aATlA5IbjMrJn/1GSnqWlDDdvLVGl
	penxAwWwPfsdkHq8Rzpg6j2cFiK73zuzlSxJcZefN5VvPisKex5br+3uPMqltKMlU2WW+lP6H54
	N4AyUN20nd/HHFAkP8ekV52HJ9sHIngENeN5jr3PMSefU9+KjioyGRKXdy
X-Google-Smtp-Source: AGHT+IG0Eo0lZK0XacuyAR9TRoPFnv3SRnZuLkZhJxwp1Uf1dUcqvmfwlEWr3RBnXj11cFH5mKJinJEjlz9bMMMtFlM=
X-Received: by 2002:a05:6000:2281:b0:3a0:806d:205 with SMTP id
 ffacd0b85a97d-3a0b4a185d6mr4505564f8f.53.1746656078004; Wed, 07 May 2025
 15:14:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250505101642.9255-2-ines.kchelfi@smile.fr> <D9OVH2DTYGL9.1DVFL0W5QGKWH@bootlin.com>
In-Reply-To: <D9OVH2DTYGL9.1DVFL0W5QGKWH@bootlin.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 8 May 2025 00:14:12 +0200
X-Gm-Features: ATxdqUEzwrwyTzO2aXZD0ylQ2KM2BPxH5i4XMWcV5Y3Y4B3WCIEyE2EPzkZgcBs
Message-ID: <CAMSfU+5x6CkaD3Jw9CT3aF0ZR781WEM2hQkWsQvD5ypfaqTZxg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rpm-sequoia: add ptest
To: mathieu.dubois-briand@bootlin.com
Cc: ines.kchelfi@smile.fr, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001313d60634930f21"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 22:14:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216136

--0000000000001313d60634930f21
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 6 mai 2025 =C3=A0 08:43, Mathieu Dubois-Briand via lists.openembedd=
ed.org
<mathieu.dubois-briand=3Dbootlin.com@lists.openembedded.org> a =C3=A9crit :

> On Mon May 5, 2025 at 12:16 PM CEST, ines.kchelfi via
> lists.openembedded.org wrote:
> > From: Ines KCHELFI <ines.kchelfi@smile.fr>
> >
> > In rpm-sequoia, some default paths in test code (OUT_DIR,
> > CARGO_MANIFEST_DIR) are invalid at runtime and cause test failures.
> >
> > To fix this, patch the test code (symbols.rs) to support overriding
> these
> > paths via optional environment variables: FORCE_RUNTIME_PATH_LIB and
> > FORCE_RUNTIME_PATH_SRC.
> >
> > Also patch the libray name to match what is installed.
> >
> > Tests take less than a second so this is added to PTEST_FAST.
> >
> > ptest result:
> > |root@qemux86-64:~# ptest-runner rpm-sequoia
> > |START: ptest-runner
> > |2025-05-02T15:57
> > |BEGIN: /usr/lib/rpm-sequoia/ptest
> > |
> > |running 1 test
> > |test symbols ... ok
> > |
> > |test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered
> out; finished in 0.00s
> > |
> > |
> > |running 2 tests
> > |test tests::merge_certs_mismatch ... ok
> > |test tests::merge_certs ... ok
> > |
> > |test result: ok. 2 passed; 0 failed; 0 ignored; 0 measured; 0 filtered
> out; finished in 0.01s
> > |
> > |DURATION: 0
> > |END: /usr/lib/rpm-sequoia/ptest
> > |2025-05-02T15:57
> > |STOP: ptest-runner
> > |TOTAL: 1 FAIL: 0
> >
> > Signed-off-by: Ines KCHELFI <ines.kchelfi@smile.fr>
> > ---
>
> Hi Ines,
>
> Thanks for your patch.
>
> It looks like some of these ptests are not running correctly on the
> autobuilder:
>
> WARNING: core-image-ptest-rpm-sequoia-1.0-r0 do_testimage: There were
> failing ptests.
> Traceback (most recent call last):
>   File
> "/srv/pokybuild/yocto-worker/qemuarm64-ptest/build/meta/lib/oeqa/core/dec=
orator/__init__.py",
> line 35, in wrapped_f
>     return func(*args, **kwargs)
>   File
> "/srv/pokybuild/yocto-worker/qemuarm64-ptest/build/meta/lib/oeqa/core/dec=
orator/__init__.py",
> line 35, in wrapped_f
>     return func(*args, **kwargs)
>   File
> "/srv/pokybuild/yocto-worker/qemuarm64-ptest/build/meta/lib/oeqa/core/dec=
orator/__init__.py",
> line 35, in wrapped_f
>     return func(*args, **kwargs)
>   File
> "/srv/pokybuild/yocto-worker/qemuarm64-ptest/build/meta/lib/oeqa/runtime/=
cases/ptest.py",
> line 27, in test_ptestrunner_expectfail
>     self.do_ptestrunner()
>   File
> "/srv/pokybuild/yocto-worker/qemuarm64-ptest/build/meta/lib/oeqa/runtime/=
cases/ptest.py",
> line 120, in do_ptestrunner
>     self.fail(failmsg)
> AssertionError:
> ptests which had no test results:
> ['rpm-sequoia']
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/1434
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/1437
>
> Details about the ptests can be found in:
>
>
> https://valkyrie.yocto.io/pub/non-release/20250505-91/testresults/qemuarm=
64-ptest/core-image-ptest-rpm-sequoia/
>
> https://valkyrie.yocto.io/pub/non-release/20250505-91/testresults/qemux86=
-64-ptest/core-image-ptest-rpm-sequoia/
>
> Can you have a look at the issue please?
>

That looks related to the fact that the ptest-cargo run-ptest does not
print "PASS:", "FAIL:" lines.
I was not aware but rpm-sequoia will be the first ptest-cargo user running
under AB oeqa/testimage.

We will send a v2 series with a fix for ptest-cargo.

Thanks!

--=20
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216032):
> https://lists.openembedded.org/g/openembedded-core/message/216032
> Mute This Topic: https://lists.openembedded.org/mt/112626601/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--0000000000001313d60634930f21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 6 =
mai 2025 =C3=A0=C2=A008:43, Mathieu Dubois-Briand via <a href=3D"http://lis=
ts.openembedded.org">lists.openembedded.org</a> &lt;mathieu.dubois-briand=
=3D<a href=3D"mailto:bootlin.com@lists.openembedded.org">bootlin.com@lists.=
openembedded.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">On Mon May 5, 2025 at 12:16 PM CEST, ines.kche=
lfi via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=
=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; From: Ines KCHELFI &lt;<a href=3D"mailto:ines.kchelfi@smile.fr" target=
=3D"_blank">ines.kchelfi@smile.fr</a>&gt;<br>
&gt;<br>
&gt; In rpm-sequoia, some default paths in test code (OUT_DIR,<br>
&gt; CARGO_MANIFEST_DIR) are invalid at runtime and cause test failures.<br=
>
&gt;<br>
&gt; To fix this, patch the test code (<a href=3D"http://symbols.rs" rel=3D=
"noreferrer" target=3D"_blank">symbols.rs</a>) to support overriding these<=
br>
&gt; paths via optional environment variables: FORCE_RUNTIME_PATH_LIB and<b=
r>
&gt; FORCE_RUNTIME_PATH_SRC.<br>
&gt;<br>
&gt; Also patch the libray name to match what is installed.<br>
&gt;<br>
&gt; Tests take less than a second so this is added to PTEST_FAST.<br>
&gt;<br>
&gt; ptest result:<br>
&gt; |root@qemux86-64:~# ptest-runner rpm-sequoia<br>
&gt; |START: ptest-runner<br>
&gt; |2025-05-02T15:57<br>
&gt; |BEGIN: /usr/lib/rpm-sequoia/ptest<br>
&gt; |<br>
&gt; |running 1 test<br>
&gt; |test symbols ... ok<br>
&gt; |<br>
&gt; |test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtere=
d out; finished in 0.00s<br>
&gt; |<br>
&gt; |<br>
&gt; |running 2 tests<br>
&gt; |test tests::merge_certs_mismatch ... ok<br>
&gt; |test tests::merge_certs ... ok<br>
&gt; |<br>
&gt; |test result: ok. 2 passed; 0 failed; 0 ignored; 0 measured; 0 filtere=
d out; finished in 0.01s<br>
&gt; |<br>
&gt; |DURATION: 0<br>
&gt; |END: /usr/lib/rpm-sequoia/ptest<br>
&gt; |2025-05-02T15:57<br>
&gt; |STOP: ptest-runner<br>
&gt; |TOTAL: 1 FAIL: 0<br>
&gt;<br>
&gt; Signed-off-by: Ines KCHELFI &lt;<a href=3D"mailto:ines.kchelfi@smile.f=
r" target=3D"_blank">ines.kchelfi@smile.fr</a>&gt;<br>
&gt; ---<br>
<br>
Hi Ines,<br>
<br>
Thanks for your patch.<br>
<br>
It looks like some of these ptests are not running correctly on the autobui=
lder:<br>
<br>
WARNING: core-image-ptest-rpm-sequoia-1.0-r0 do_testimage: There were faili=
ng ptests.<br>
Traceback (most recent call last):<br>
=C2=A0 File &quot;/srv/pokybuild/yocto-worker/qemuarm64-ptest/build/meta/li=
b/oeqa/core/decorator/__init__.py&quot;, line 35, in wrapped_f<br>
=C2=A0 =C2=A0 return func(*args, **kwargs)<br>
=C2=A0 File &quot;/srv/pokybuild/yocto-worker/qemuarm64-ptest/build/meta/li=
b/oeqa/core/decorator/__init__.py&quot;, line 35, in wrapped_f<br>
=C2=A0 =C2=A0 return func(*args, **kwargs)<br>
=C2=A0 File &quot;/srv/pokybuild/yocto-worker/qemuarm64-ptest/build/meta/li=
b/oeqa/core/decorator/__init__.py&quot;, line 35, in wrapped_f<br>
=C2=A0 =C2=A0 return func(*args, **kwargs)<br>
=C2=A0 File &quot;/srv/pokybuild/yocto-worker/qemuarm64-ptest/build/meta/li=
b/oeqa/runtime/cases/ptest.py&quot;, line 27, in test_ptestrunner_expectfai=
l<br>
=C2=A0 =C2=A0 self.do_ptestrunner()<br>
=C2=A0 File &quot;/srv/pokybuild/yocto-worker/qemuarm64-ptest/build/meta/li=
b/oeqa/runtime/cases/ptest.py&quot;, line 120, in do_ptestrunner<br>
=C2=A0 =C2=A0 self.fail(failmsg)<br>
AssertionError:<br>
ptests which had no test results:<br>
[&#39;rpm-sequoia&#39;]<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/buil=
ds/1434" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/61/builds/1434</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/buil=
ds/1437" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/73/builds/1437</a><br>
<br>
Details about the ptests can be found in:<br>
<br>
<a href=3D"https://valkyrie.yocto.io/pub/non-release/20250505-91/testresult=
s/qemuarm64-ptest/core-image-ptest-rpm-sequoia/" rel=3D"noreferrer" target=
=3D"_blank">https://valkyrie.yocto.io/pub/non-release/20250505-91/testresul=
ts/qemuarm64-ptest/core-image-ptest-rpm-sequoia/</a><br>
<a href=3D"https://valkyrie.yocto.io/pub/non-release/20250505-91/testresult=
s/qemux86-64-ptest/core-image-ptest-rpm-sequoia/" rel=3D"noreferrer" target=
=3D"_blank">https://valkyrie.yocto.io/pub/non-release/20250505-91/testresul=
ts/qemux86-64-ptest/core-image-ptest-rpm-sequoia/</a><br>
<br>
Can you have a look at the issue please?<br></blockquote><div><br></div><di=
v>That looks related to the fact that the ptest-cargo run-ptest does not pr=
int &quot;PASS:&quot;, &quot;FAIL:&quot; lines.</div><div>I was not aware b=
ut rpm-sequoia will be the first ptest-cargo user running under AB oeqa/tes=
timage.</div><div><br></div><div>We will send a v2 series with a fix for pt=
est-cargo.</div><div><br></div><div>Thanks!</div><div><br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#216032): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/216032" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/216032</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112626601/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/112626601/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000001313d60634930f21--

