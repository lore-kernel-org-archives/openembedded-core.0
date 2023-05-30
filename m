Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4EFBC7EE23
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 14:35:47 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.657.1685457337464595680
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 07:35:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=C5jHd/V8;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2afb2875491so47925761fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 07:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685457336; x=1688049336;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LjOEVtDfNsLbcQOjVGi9+L2JiN/3yjJwQlDlJ42zFU8=;
        b=C5jHd/V8DOk7gPi1vM3byipy68Eck0Ekw5+4PN9CL6fKKgNlw06XwQfO/yoxSgBA1U
         dwv8nxsI/Dt10C4MSgjcC9IU+otvY+3tz8NlM8kIi3z/sQJeZP+tkjKSZ0PktC0ESgnb
         b2Ssip+MWZzgYuIFUmMCCL+4l5VfRrKNgGArMQ7JdomMkvSx+/1KZd4bQ7wAzOWcAIDf
         qbXGSWjp2XoHZuIvFgadCCTOkknb2fCdqK/N3RcKURP+3nkea9mBDd2mu9TLzRarhP9t
         NIgsplKV/G2/rKpplnf72hCXvetJDWt3XsibgriRggM/HawVMp4bXDwT3002QbNbn49F
         ZsvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685457336; x=1688049336;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LjOEVtDfNsLbcQOjVGi9+L2JiN/3yjJwQlDlJ42zFU8=;
        b=UWbyikciSRXH+b8zOV3e5mrm2hsKUSacSPKsvRfjnJht1IOqlS1zKiuU99HXcmXSOY
         22trjDbPjGRL2Rl4Sw4afmov3vXVZteUqLyIOTr9MEP1XDUwHfisXZOH6MtSNE6jpyZX
         WT83beEdVMJkTrLh81cOhRcjfGT3yfhe+xSh1jfilhv9Oz4SMesWxjTR5xd4p95H/nQW
         UCubCu6aWd4yTNQu9L3CMi7S7RnYe/guVvV67HZ8yNgtKHXrFJ6x3IUFqW01ji61iwxy
         TOG4/ifuHWiGLOh4u1KdELYsxKGzkDrGJc+5ZOgLnrAJyBkSoLx7cxn/XMslcuZC+Arf
         T+Ag==
X-Gm-Message-State: AC+VfDyUo4z4xGanJCKNduNOtX5kpM+wCsvkVLx+dccQ+Gw7lUiY/BhD
	j+Wki16VNYU0FjFWHIyOTj8qkGbJ5KXrar0mWwI=
X-Google-Smtp-Source: ACHHUZ5hUOpsnqqUsGU7A7cB+yPQAdSydvEAwMcJhDlrYb1abAh8m3mb2sSRTwxb9NuDm7K59fHjMx+MhHq5i4EUTUQ=
X-Received: by 2002:a2e:8344:0:b0:2a9:fa39:236c with SMTP id
 l4-20020a2e8344000000b002a9fa39236cmr1093070ljh.9.1685457335336; Tue, 30 May
 2023 07:35:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230530105125.445622-1-yashinde145@gmail.com> <7c9a0a78204958d84c4a3779da7c0f1b0e66dda8.camel@linuxfoundation.org>
In-Reply-To: <7c9a0a78204958d84c4a3779da7c0f1b0e66dda8.camel@linuxfoundation.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Tue, 30 May 2023 16:35:23 +0200
Message-ID: <CA+cAkeoEfQWbQkwYMhAUqQKQXyXcyCYJdoFewWkDKsVW=Mpyeg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v14] Rust Oe-Selftest implementation
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yash Shinde <yashinde145@gmail.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, Randy.MacLeod@windriver.com, 
	Umesh.Kallapa@windriver.com, Naveen.Gowda@windriver.com, 
	Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com, 
	Yash.Shinde@windriver.com
Content-Type: multipart/alternative; boundary="000000000000c1c0e605fcea1d6c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 14:35:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181928

--000000000000c1c0e605fcea1d6c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Beside the errors pointed by Richard, I'm wondering how it behave with the
ptest-cargo class? Does this class still useful with this work? Is it some
kind of complementary or did it concern a totally different matter/use case
?

Le mar. 30 mai 2023, 15:59, Richard Purdie <
richard.purdie@linuxfoundation.org> a =C3=A9crit :

> On Tue, 2023-05-30 at 16:21 +0530, Yash Shinde wrote:
> > The patch implements Rust testing framework similar to other selftest,
> > specifically the gcc selftest in OE. It uses the client and server
> > based method to test the binaries for cross-target on the image.
> > The test framework is a wrapper around the Rust build system as ./x.py
> > test. It tests many functionalities of Rust distribution like tools,
> > documentation, libraries, packages, tools, Cargo, Crater etc.
> > Please refer the following link for detailed description of Rust
> > testing:-
> > https://rustc-dev-guide.rust-lang.org/tests/intro.html#tool-tests
> >
> > To support the rust tests in oe-core, the following functions were
> > added:-
> > setup_cargo_environment(): Build bootstrap and some early stage tools.
> > do_rust_setup_snapshot(): Install the snapshot version of rust binaries=
.
> > do_configure(): To generate config.toml
> > do_compile(): To build "remote-test-server" for qemu target image.
> >
> > Approximate Number of Tests Run in the Rust Testsuite :- 18000
> > Approximate Number of Tests that FAIL in bitbake environment :- 100-150
> > Normally majority of the testcases are present in major folder "test/"
> > It contributes to more than 80% of the testcases present in Rust test
> > framework. These tests pass as expected on any Rust versions without
> > much fuss. The tests that fail are of less important and contribute to
> > less than 2% of the total testcases. These minor tests are observed to
> > work on some versions and fail on others. They have to be added, ignore=
d
> > or excluded for different versions as per the behavior.
> > These tests have been ignored or excluded in the Rust selftest
> > environment to generate success of completing the testsuite.
> >
> > These tests work in parallel mode even in the skipped test mode as
> > expected. Although the patch to disable tests is large, it is very simp=
le
> > in that it only disables tests. When updating to a newer version of Rus=
t,
> > the patch can usually be ported in a day.
> >
> > Tested for X86, X86-64, ARM, ARM64 and MIPS64 on CentOS release 6.10
> >
> > Signed-off-by: pgowda <pgowda.cve@gmail.com>
> > Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> > Signed-off-by: Yash Shinde <yashinde145@gmail.com>
> > ---
> >  meta/lib/oeqa/selftest/cases/rust.py          |   86 +
> >  .../rust/files/rust-oe-selftest.patch         | 2120 +++++++++++++++++
> >  meta/recipes-devtools/rust/rust-source.inc    |    1 +
> >  meta/recipes-devtools/rust/rust_1.69.0.bb     |    7 +
> >  4 files changed, 2214 insertions(+)
> >  create mode 100644 meta/lib/oeqa/selftest/cases/rust.py
> >  create mode 100644
> meta/recipes-devtools/rust/files/rust-oe-selftest.patch
>
> I did put this into a build for testing on the autobuilder. It hasn't
> been running long and I can already see build failures such as:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/103/builds/6077
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/7200
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/7190
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/2923
> https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/7200
> https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/7217
> https://autobuilder.yoctoproject.org/typhoon/#/builders/104/builds/6080
> https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/7146
> https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/7184
>
> and there will likely be more.
>
> I'm finding this rather frustrating and am not sure how this was
> tested.
>
> Cheers,
>
> Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181925):
> https://lists.openembedded.org/g/openembedded-core/message/181925
> Mute This Topic: https://lists.openembedded.org/mt/99216990/6213388
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> frederic.martinsons@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c1c0e605fcea1d6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Beside the errors pointed by Richard, I&#39;m wondering h=
ow it behave with the ptest-cargo class? Does this class still useful with =
this work? Is it some kind of complementary or did it concern a totally dif=
ferent matter/use case ?=C2=A0</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Le mar. 30 mai 2023, 15:59, Richard Purdie &l=
t;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linu=
xfoundation.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">On Tue, 2023-05-30 at 16:21 +0530, Yash Shinde wrote:<br>
&gt; The patch implements Rust testing framework similar to other selftest,=
<br>
&gt; specifically the gcc selftest in OE. It uses the client and server<br>
&gt; based method to test the binaries for cross-target on the image.<br>
&gt; The test framework is a wrapper around the Rust build system as ./x.py=
<br>
&gt; test. It tests many functionalities of Rust distribution like tools,<b=
r>
&gt; documentation, libraries, packages, tools, Cargo, Crater etc.<br>
&gt; Please refer the following link for detailed description of Rust<br>
&gt; testing:-<br>
&gt; <a href=3D"https://rustc-dev-guide.rust-lang.org/tests/intro.html#tool=
-tests" rel=3D"noreferrer noreferrer" target=3D"_blank">https://rustc-dev-g=
uide.rust-lang.org/tests/intro.html#tool-tests</a><br>
&gt; <br>
&gt; To support the rust tests in oe-core, the following functions were<br>
&gt; added:-<br>
&gt; setup_cargo_environment(): Build bootstrap and some early stage tools.=
<br>
&gt; do_rust_setup_snapshot(): Install the snapshot version of rust binarie=
s.<br>
&gt; do_configure(): To generate config.toml<br>
&gt; do_compile(): To build &quot;remote-test-server&quot; for qemu target =
image.<br>
&gt; <br>
&gt; Approximate Number of Tests Run in the Rust Testsuite :- 18000<br>
&gt; Approximate Number of Tests that FAIL in bitbake environment :- 100-15=
0<br>
&gt; Normally majority of the testcases are present in major folder &quot;t=
est/&quot;<br>
&gt; It contributes to more than 80% of the testcases present in Rust test<=
br>
&gt; framework. These tests pass as expected on any Rust versions without<b=
r>
&gt; much fuss. The tests that fail are of less important and contribute to=
<br>
&gt; less than 2% of the total testcases. These minor tests are observed to=
<br>
&gt; work on some versions and fail on others. They have to be added, ignor=
ed<br>
&gt; or excluded for different versions as per the behavior.<br>
&gt; These tests have been ignored or excluded in the Rust selftest<br>
&gt; environment to generate success of completing the testsuite.<br>
&gt; <br>
&gt; These tests work in parallel mode even in the skipped test mode as<br>
&gt; expected. Although the patch to disable tests is large, it is very sim=
ple<br>
&gt; in that it only disables tests. When updating to a newer version of Ru=
st,<br>
&gt; the patch can usually be ported in a day.<br>
&gt; <br>
&gt; Tested for X86, X86-64, ARM, ARM64 and MIPS64 on CentOS release 6.10<b=
r>
&gt; <br>
&gt; Signed-off-by: pgowda &lt;<a href=3D"mailto:pgowda.cve@gmail.com" targ=
et=3D"_blank" rel=3D"noreferrer">pgowda.cve@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Vinay Kumar &lt;<a href=3D"mailto:vinay.m.engg@gmail.co=
m" target=3D"_blank" rel=3D"noreferrer">vinay.m.engg@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Yash Shinde &lt;<a href=3D"mailto:yashinde145@gmail.com=
" target=3D"_blank" rel=3D"noreferrer">yashinde145@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/lib/oeqa/selftest/cases/rust.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A086 +<br>
&gt;=C2=A0 .../rust/files/rust-oe-selftest.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 2120 +++++++++++++++++<br>
&gt;=C2=A0 meta/recipes-devtools/rust/rust-source.inc=C2=A0 =C2=A0 |=C2=A0 =
=C2=A0 1 +<br>
&gt;=C2=A0 meta/recipes-devtools/rust/<a href=3D"http://rust_1.69.0.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">rust_1.69.0.bb</a>=C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A0 7 +<br>
&gt;=C2=A0 4 files changed, 2214 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/lib/oeqa/selftest/cases/rust.py<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/rust/files/rust-oe-self=
test.patch<br>
<br>
I did put this into a build for testing on the autobuilder. It hasn&#39;t<b=
r>
been running long and I can already see build failures such as:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/103/buil=
ds/6077" rel=3D"noreferrer noreferrer" target=3D"_blank">https://autobuilde=
r.yoctoproject.org/typhoon/#/builders/103/builds/6077</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/45/build=
s/7200" rel=3D"noreferrer noreferrer" target=3D"_blank">https://autobuilder=
.yoctoproject.org/typhoon/#/builders/45/builds/7200</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/40/build=
s/7190" rel=3D"noreferrer noreferrer" target=3D"_blank">https://autobuilder=
.yoctoproject.org/typhoon/#/builders/40/builds/7190</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/117/buil=
ds/2923" rel=3D"noreferrer noreferrer" target=3D"_blank">https://autobuilde=
r.yoctoproject.org/typhoon/#/builders/117/builds/2923</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/37/build=
s/7200" rel=3D"noreferrer noreferrer" target=3D"_blank">https://autobuilder=
.yoctoproject.org/typhoon/#/builders/37/builds/7200</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/48/build=
s/7217" rel=3D"noreferrer noreferrer" target=3D"_blank">https://autobuilder=
.yoctoproject.org/typhoon/#/builders/48/builds/7217</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/104/buil=
ds/6080" rel=3D"noreferrer noreferrer" target=3D"_blank">https://autobuilde=
r.yoctoproject.org/typhoon/#/builders/104/builds/6080</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/76/build=
s/7146" rel=3D"noreferrer noreferrer" target=3D"_blank">https://autobuilder=
.yoctoproject.org/typhoon/#/builders/76/builds/7146</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/61/build=
s/7184" rel=3D"noreferrer noreferrer" target=3D"_blank">https://autobuilder=
.yoctoproject.org/typhoon/#/builders/61/builds/7184</a><br>
<br>
and there will likely be more.<br>
<br>
I&#39;m finding this rather frustrating and am not sure how this was<br>
tested.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#181925): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/181925" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/181925</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99216990/6213=
388" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/99216990/6213388</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:frederic.martin=
sons@gmail.com" target=3D"_blank" rel=3D"noreferrer">frederic.martinsons@gm=
ail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000c1c0e605fcea1d6c--

