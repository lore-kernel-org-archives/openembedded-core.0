Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F30CF6AB7
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 09:40:01 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3180.1767865199333299805
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 01:39:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=CBjvHIiN;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so24593035e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 01:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1767865197; x=1768469997; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/lmqAQhUIgrO97q3gGRCvWIM+qp5U7NH7iGPNGQ2tl8=;
        b=CBjvHIiNYwkDKBJq4b3uDPpIOkK0b+kueq0MkWlP8VsvVQ8LG+5eJbYFKJTFc1bpzC
         UspvC6dynrJEZArmKvqMlASjfDO0LEIkGfQbM0GUxkfkYH1haGaomgZ3klZGPjqoJ4et
         bM03Xz2yDPUKUVc1QTfjlru1JPtsoITPvkgSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767865197; x=1768469997;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/lmqAQhUIgrO97q3gGRCvWIM+qp5U7NH7iGPNGQ2tl8=;
        b=jYAog8WGFbTwrmXeW4k46Zi59B5XNECBjTL4fFn42ZSyg2MdwSLKP1itSW31OByHdR
         EeSGXszsebX54R4YKjDvty0gr+GCRr+gnTvU/76i346Q1wNJ1a9MfDrf8AGdiKKvCVaS
         fQEecSmvcfjwBw/rexq/smg8Ym7LUmgKPvS7NG62YHF4bi/iLkpUWyVQimgYEAPfSvgn
         LMvy6Qj8BXbDCWMT3ZsZJHvYLh4yXerqK8/TgQZ/FES9t8JhJ1HaZVaEAdikj6ptbyDr
         BAYtrasaAyN+L0ZCG2rt7rvhFxlda17d3JqvWkm+VXv32Nq+BBHmsVAWfrDiz7nFr5ob
         ecGg==
X-Forwarded-Encrypted: i=1; AJvYcCVl66k9Luj0j4aoTjdZjzV0Qq2ccEhAif0coKf7vRxPWUw80u5UHkJv0END0shTc4qV/YQrbyW2gSRqwBeLscpCWA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzu4B0+V7qemRFSVMy7TFiYYujiSR1GjrTth3/XpLw56K6gaWml
	erS96u+KPFpNELzf9IMempfUe9EGEAC2SJU9aPzC4Rz9FIxYCpAkpRG+THA7o2COEhpf07vqCjd
	epFmy3WjVFW9JhaybaanvIES5iLQZshIBh2TNkEQiXA==
X-Gm-Gg: AY/fxX6khZLyZ2gPeZZBmQDckpVNrdYCZv6rRmGSw5KSu72+uZRiX8WP1FKY0oLBQiN
	I+obWn4/ndHIR+7xPtM4oqGrNaH7GN3OsD031wmtwL88hl/EH7SckELOmah5JyodkO1OxKa3AH2
	uY9lF4PVR0eoi8KppENWGlC5EaVopqIpHIgayHb/8eegQ1k1oxD5uQ0VCYk0I+fa37pU1VsUhYu
	Ndqpkc9mZi4i1BaNR3jC3DB1u+Ibgqt0aeTeEENdwwqr8O68sp3/9rNW211xW+7BjXpA8GoRCHG
	UXnL6ZnH9Y1pLOaiA5RccyvNmkli
X-Google-Smtp-Source: AGHT+IG/OcdsPoIoTBeDCNm3dBPfkSdxhMsmBNwBB6t3QR7sM8n5XYBV+EOZv5eXrNrjGLy6KV9XL9AuKauxvyXkgl0=
X-Received: by 2002:a05:600c:4fd0:b0:477:5c58:3d42 with SMTP id
 5b1f17b1804b1-47d84b1f7efmr64380155e9.10.1767865197558; Thu, 08 Jan 2026
 01:39:57 -0800 (PST)
MIME-Version: 1.0
References: <20251230141540.1974380-1-Harish.Sadineni@windriver.com>
 <20251230141540.1974380-11-Harish.Sadineni@windriver.com> <DFGJV6ZAEFO9.46GUIB6FK2KV@bootlin.com>
In-Reply-To: <DFGJV6ZAEFO9.46GUIB6FK2KV@bootlin.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 8 Jan 2026 10:39:31 +0100
X-Gm-Features: AQt7F2q14lBjCHd0g2elRqlhG0dR82mzqhiBIaB6cxfmbaKRnAlQGoE-mwTHY_o
Message-ID: <CAMSfU+61QTSqDdxj71qBaiOA4GcPM1D=u=mPDY0RrjUFr9gMCg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 10/15] selftest/cases/runtime_test: Add test
 for Linux Rust sample
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org, 
	Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com, 
	bruce.ashfield@gmail.com, elmehdi.younes@smile.fr
Content-Type: multipart/alternative; boundary="0000000000001c86250647dd31a5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 09:40:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229047

--0000000000001c86250647dd31a5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 5 janv. 2026 =C3=A0 10:32, Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> a =C3=A9crit :

> On Tue Dec 30, 2025 at 3:15 PM CET, Harish via lists.openembedded.org
> Sadineni wrote:
> > From: Yoann Congal <yoann.congal@smile.fr>
> >
> > This new case tests that the rust_mininal sample inside the kernel sour=
ce
> > tree is buildable and works properly: check that the module can be
> > loaded and that it prints correctly.
> >
> > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> > Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> > ---
>
> Hi Yoann, Harish,
>
> Thanks for your patch.
>
> It looks like we got a few intermittent failures here:
>
> 2026-01-02 19:40:58,816 - oe-selftest - INFO - FAIL:
> runtime_test.RustKernel.test_kernel_rust_sample (subunit.RemotedTestCase)
> 2026-01-02 19:40:58,816 - oe-selftest - INFO -
> ----------------------------------------------------------------------
> 2026-01-02 19:40:58,816 - oe-selftest - INFO -
> testtools.testresult.real._StringException: Traceback (most recent call
> last):
>   File
> "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openembedde=
d-core/meta/lib/oeqa/selftest/cases/runtime_test.py",
> line 514, in test_kernel_rust_sample
>     self.assertEqual(status, 1, "Loading rust_out_of_tree module failed!"=
)
>   File "/usr/lib/python3.10/unittest/case.py", line 845, in assertEqual
>     assertion_func(first, second, msg=3Dmsg)
>   File "/usr/lib/python3.10/unittest/case.py", line 838, in
> _baseAssertEqual
>     raise self.failureException(msg)
> AssertionError: 0 !=3D 1 : Loading rust_out_of_tree module failed!
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3082
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3095

Those are both from ARM hosts and, sadly, there are no logs to explain why
it failed :(
Harish, is this something you can test on your side?


> I only saw two occurrences so far, on at least 10 builds, but maybe you
> can check for obvious reasons before the series get merged.
>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--=20
Yoann Congal
Smile ECS

--0000000000001c86250647dd31a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 5 =
janv. 2026 =C3=A0=C2=A010:32, Mathieu Dubois-Briand &lt;<a href=3D"mailto:m=
athieu.dubois-briand@bootlin.com">mathieu.dubois-briand@bootlin.com</a>&gt;=
 a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On Tue Dec 30, 2025 at 3:15 PM CET, Harish via <a href=3D"http://lists=
.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.=
org</a> Sadineni wrote:<br>
&gt; From: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" target=
=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt;<br>
&gt; This new case tests that the rust_mininal sample inside the kernel sou=
rce<br>
&gt; tree is buildable and works properly: check that the module can be<br>
&gt; loaded and that it prints correctly.<br>
&gt;<br>
&gt; Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.f=
r" target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt; Signed-off-by: Harish Sadineni &lt;<a href=3D"mailto:Harish.Sadineni@w=
indriver.com" target=3D"_blank">Harish.Sadineni@windriver.com</a>&gt;<br>
&gt; ---<br>
<br>
Hi Yoann, Harish,<br>
<br>
Thanks for your patch.<br>
<br>
It looks like we got a few intermittent failures here:<br>
<br>
2026-01-02 19:40:58,816 - oe-selftest - INFO - FAIL: runtime_test.RustKerne=
l.test_kernel_rust_sample (subunit.RemotedTestCase)<br>
2026-01-02 19:40:58,816 - oe-selftest - INFO - ----------------------------=
------------------------------------------<br>
2026-01-02 19:40:58,816 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):<br>
=C2=A0 File &quot;/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/lay=
ers/openembedded-core/meta/lib/oeqa/selftest/cases/runtime_test.py&quot;, l=
ine 514, in test_kernel_rust_sample<br>
=C2=A0 =C2=A0 self.assertEqual(status, 1, &quot;Loading rust_out_of_tree mo=
dule failed!&quot;)<br>
=C2=A0 File &quot;/usr/lib/python3.10/unittest/case.py&quot;, line 845, in =
assertEqual<br>
=C2=A0 =C2=A0 assertion_func(first, second, msg=3Dmsg)<br>
=C2=A0 File &quot;/usr/lib/python3.10/unittest/case.py&quot;, line 838, in =
_baseAssertEqual<br>
=C2=A0 =C2=A0 raise self.failureException(msg)<br>
AssertionError: 0 !=3D 1 : Loading rust_out_of_tree module failed!<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/buil=
ds/3082" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/23/builds/3082</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/buil=
ds/3095" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/23/builds/3095</a></blockquote><div>Those are b=
oth from ARM hosts and, sadly, there are no logs to explain why it failed :=
(</div><div>Harish, is this something you can test on your side?</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
I only saw two occurrences so far, on at least 10 builds, but maybe you<br>
can check for obvious reasons before the series get merged.<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000001c86250647dd31a5--

