Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4AD3C77B75
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 04:01:21 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.19567.1683259273605879479
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 21:01:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=kKMuYWR/;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-559eae63801so18704747b3.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 21:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683259273; x=1685851273;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yzIAiX8rIluNDCgLPxG16X64H9WRvZeC+vA4w1NKh/4=;
        b=kKMuYWR/o9dg0inN8BOylWk87M7bVSvCfXv9UVGcvN24yCZbtV3a3agbDpp42EbKlu
         Eow+Cv5NJ83MkefveZmE6VNUYhghUiAUvtA0oEE1dyQnbp08ytYFdCb7h7J5EnRdw0FL
         wzpp4h+GQ+OlgYu6fl3Z5NWBdIXZBdY6OwayW1vkfLMhYWPYlA3XpnNE9vMOlMgbuKGi
         HfUuEItyh42W9mF5Ue7rYohOqLRpjdLHE1TlPfR2WPrUiKzbCvgiSTfIHdK25HGhYvb+
         q1rTQLbmlHdE2qrjOoOwfaH1dh9qVV8XD35kifTo5qVLuzrp7DO4e3fz50ntqUCBkPy1
         7yaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683259273; x=1685851273;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yzIAiX8rIluNDCgLPxG16X64H9WRvZeC+vA4w1NKh/4=;
        b=RTNybbd4yWFBaunW/R6TMx9DN9Xm/C8rMfREQHEKPwithyzHa6SLPwrPpkvQkkyQFm
         0ET6IUp2L7tFbPrN1KiNV79PJJF+uhFeGC+SRmvqz+4kGaL0IPeYEUUdjchkEVxW1nWl
         aI5ukCQX9cSYP3hzrYCoxQe39EEbyn5GaLx77dGUH3aOnRMs6VzvJjDWP3RYl0QPDrXR
         FYiVE0W/G8/QicpwIwoZym6+cP4HP+YzrlKMPXetdjMn4Xhk52vbHEr6F/6vfed9Ceky
         stiuySjeneKkf5Nb9L/2eFpzkeV6NvD5IBsC+Qh1lIcXjw056rHsB/kTAmuxbSEMaiQP
         xhDg==
X-Gm-Message-State: AC+VfDxSDGbo6anqvlu16tZwu5NG2x4Xr2W0qJrQsj7v7NFpNtvtXcf7
	/DCp0//Dap5/Yr05+rB1jOo0Rc3jQY/wG0p2xAw=
X-Google-Smtp-Source: ACHHUZ6JE+MfPigcQpxdWPNKTzb+87eeH5gExKvFVcCi6YGu4OVmgwBGXa4BMNIBYC3Sh533c9pZj6vJyZO7jTY7iIY=
X-Received: by 2002:a0d:d781:0:b0:55a:142e:b178 with SMTP id
 z123-20020a0dd781000000b0055a142eb178mr227172ywd.50.1683259272440; Thu, 04
 May 2023 21:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <CANx9H-B4seY487YwfvgW2ze_n6MWr73kJsOTc8spdou32qubKg@mail.gmail.com>
 <57f1224b-14c5-2ba4-c752-98dba8f57a21@berginkonsult.se> <CANNYZj-uE2WUvfZpjq67wHyeFqQaN1L7HYp54Fm99J5UzS8cdw@mail.gmail.com>
 <98af3b96-9d1c-3d6a-493f-c1d6a422f9e8@berginkonsult.se>
In-Reply-To: <98af3b96-9d1c-3d6a-493f-c1d6a422f9e8@berginkonsult.se>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 4 May 2023 21:01:01 -0700
Message-ID: <CANx9H-Cf6wTwVx40=Su=HSMJoydX4Ppe1CN+jo5fRWpfVaJkVA@mail.gmail.com>
Subject: Re: [OE-core] [RFC] python3-cryptogaphy upgrade to 40.0.2 issues
To: Peter Bergin <peter@berginkonsult.se>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, frederic.martinsons@gmail.com, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ffb08f05faea566b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 04:01:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180900

--000000000000ffb08f05faea566b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 4, 2023 at 5:00=E2=80=AFAM Peter Bergin <peter@berginkonsult.se=
> wrote:

>
> On 2023-05-04 11:00, Alexander Kanavin wrote:
> > On Thu, 4 May 2023 at 10:41, Peter Bergin <peter@berginkonsult.se>
> wrote:
> >
> >> At
> >>
> https://github.com/pyca/cryptography/blob/f816b457494e010b655cd7fdcd30e34=
46f86a703/src/rust/build.rs#L46
> >> the path to python includes is defined by calling 'python3 -c "import
> >> sysconfig; print(sysconfig.get_path('include'))"' (but from inside
> >> rust). With print-debugging this seems to return the bad string
> >> '/usr/include/python3.11' which is then passed to cc::Build
> >>
> >> I executed this in recipe context:
> >>
> >> do_compile:prepend() {
> >>       which python3
> >>       python3 -c "import sysconfig;
> print(sysconfig.get_path('include'))"
> >> }
> >>
> >> and then I got the correct return value:
> >>
> >> |
> >>
> /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/=
40.0.2-r0/recipe-sysroot-native/usr/bin/python3-native/python3
> >> |
> >>
> /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/=
40.0.2-r0/recipe-sysroot-native/usr/include/python3.11
> > This is pointing to the native sysroot in a target build, so it is
> > most likely not actually correct. I believe 'inherit
> > python3targetconfig' may help, as it substitutes most places where
> > native python gets queried by components with target-specific values.
> >
> > Alex
> >
> The bad thing is that the build.rs script is running python script to
> figure out the path to the headers. I'm not sure we can use target
> python exe in the build steps without running qemu instance or something
> which seems overkill in this case. We have the information about python
> include path for the target in the variable PYTHON_INCLUDE_DIR.
>
> With this patch the compilation will find Python.h:
>
> $ git diff src/rust/build.rs
> diff --git a/src/rust/build.rs b/src/rust/build.rs
> index 01177ac..7dc13fe 100644
> --- a/src/rust/build.rs
> +++ b/src/rust/build.rs
> @@ -43,11 +43,8 @@ fn main() {
>       )
>       .unwrap();
>       println!("cargo:rustc-cfg=3Dpython_implementation=3D\"{}\"",
> python_impl);
> -    let python_include =3D run_python_script(
> -        &python,
> -        "import sysconfig; print(sysconfig.get_path('include'), end=3D''=
)",
> -    )
> -    .unwrap();
> +    let python_include =3D env::var("PYTHON_INCLUDE_DIR").unwrap();
> +
>       let openssl_include =3D
>           std::env::var_os("DEP_OPENSSL_INCLUDE").expect("unable to find
> openssl include path");
>       let openssl_c =3D Path::new(&out_dir).join("_openssl.c");
>
>
This patch at least got `python3-cryptography-native` to build to
completion.


>
> But it fails later in the linking step.
>
> .....linux/python3-cryptography/40.0.2-r0/recipe-sysroot/usr/lib/rustlib/=
x86_64-poky-linux-gnu/lib"
>
> "-L"
> "/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography=
/40.0.2-r0/python3-cryptography-40.0.2/target/x86_64-poky-linux-gnu/release=
/build/cryptography-rust-aa00e39a952c07ee/out"
>
> "-L"
> "/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography=
/40.0.2-r0/recipe-sysroot/usr/lib"
>
> "-L"
> "/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography=
/40.0.2-r0/recipe-sysroot-native/usr/lib/rustlib/x86_64-poky-linux-gnu/lib"
>
> "-Wl,-Bstatic" "-l_openssl.a"
> "/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography=
/40.0.2-r0/recipe-sysroot/usr/lib/rustlib/x86_64-poky-linux-gnu/lib/libcomp=
iler_builtins-45df5d471f0d20d0.rlib"
>
> "-Wl,-Bdynamic" "-lssl" "-lcrypto" "-lgcc_s" "-lutil" "-lrt" "-lpthread"
> "-lm" "-ldl" "-lc" "-Wl,--eh-frame-hdr" "-Wl,-znoexecstack" "-L"
> "/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography=
/40.0.2-r0/recipe-sysroot-native/usr/lib/rustlib/x86_64-poky-linux-gnu/lib"
>
> "-o"
> "/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography=
/40.0.2-r0/python3-cryptography-40.0.2/target/x86_64-poky-linux-gnu/release=
/deps/libcryptography_rust.so"
>
> "-Wl,--gc-sections" "-shared" "-Wl,-O1" "-nodefaultlibs"
>    =3D note:
> /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/=
40.0.2-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/x86=
_64-poky-linux/gcc/x86_64-poky-linux/12.2.0/ld:
>
> /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/=
40.0.2-r0/python3-cryptography-40.0.2/target/x86_64-poky-linux-gnu/release/=
build/cryptography-rust-aa00e39a952c07ee/out/lib_openssl.a.a(9bdf47a443b7a0=
7f-_openssl.o):
>
> warning: relocation against `_Py_NoneStruct' in read-only section `.text'
> /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/=
40.0.2-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/x86=
_64-poky-linux/gcc/x86_64-poky-linux/12.2.0/ld:
>
> /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/=
40.0.2-r0/python3-cryptography-40.0.2/target/x86_64-poky-linux-gnu/release/=
build/cryptography-rust-aa00e39a952c07ee/out/lib_openssl.a.a(9bdf47a443b7a0=
7f-_openssl.o):
>
> relocation R_X86_64_PC32 against undefined symbol `_Py_NoneStruct' can
> not be used when making a shared object; recompile with -fPIC
> /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/=
40.0.2-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/x86=
_64-poky-linux/gcc/x86_64-poky-linux/12.2.0/ld:
>
> final link failed: bad value
>            collect2: error: ld returned 1 exit status
>
>
> There are some '-L .../recipe-sysroot-native/usr/lib/rustlib/...' that
> can probably causing this. Don't know if it helps us forward?
>
> /Peter
>
>

--000000000000ffb08f05faea566b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_qu=
ote"></div></div></div><div><div dir=3D"ltr"><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Thu, May 4, 2023 at 5:00=E2=80=AFAM P=
eter Bergin &lt;<a href=3D"mailto:peter@berginkonsult.se" target=3D"_blank"=
>peter@berginkonsult.se</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><br>
On 2023-05-04 11:00, Alexander Kanavin wrote:<br>
&gt; On Thu, 4 May 2023 at 10:41, Peter Bergin &lt;<a href=3D"mailto:peter@=
berginkonsult.se" target=3D"_blank">peter@berginkonsult.se</a>&gt; wrote:<b=
r>
&gt;<br>
&gt;&gt; At<br>
&gt;&gt; <a href=3D"https://github.com/pyca/cryptography/blob/f816b457494e0=
10b655cd7fdcd30e3446f86a703/src/rust/build.rs#L46" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/pyca/cryptography/blob/f816b457494e010b655c=
d7fdcd30e3446f86a703/src/rust/build.rs#L46</a><br>
&gt;&gt; the path to python includes is defined by calling &#39;python3 -c =
&quot;import<br>
&gt;&gt; sysconfig; print(sysconfig.get_path(&#39;include&#39;))&quot;&#39;=
 (but from inside<br>
&gt;&gt; rust). With print-debugging this seems to return the bad string<br=
>
&gt;&gt; &#39;/usr/include/python3.11&#39; which is then passed to cc::Buil=
d<br>
&gt;&gt;<br>
&gt;&gt; I executed this in recipe context:<br>
&gt;&gt;<br>
&gt;&gt; do_compile:prepend() {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0which python3<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0python3 -c &quot;import sysconfig; print=
(sysconfig.get_path(&#39;include&#39;))&quot;<br>
&gt;&gt; }<br>
&gt;&gt;<br>
&gt;&gt; and then I got the correct return value:<br>
&gt;&gt;<br>
&gt;&gt; |<br>
&gt;&gt; /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-crypto=
graphy/40.0.2-r0/recipe-sysroot-native/usr/bin/python3-native/python3<br>
&gt;&gt; |<br>
&gt;&gt; /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-crypto=
graphy/40.0.2-r0/recipe-sysroot-native/usr/include/python3.11<br>
&gt; This is pointing to the native sysroot in a target build, so it is<br>
&gt; most likely not actually correct. I believe &#39;inherit<br>
&gt; python3targetconfig&#39; may help, as it substitutes most places where=
<br>
&gt; native python gets queried by components with target-specific values.<=
br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
The bad thing is that the <a href=3D"http://build.rs" rel=3D"noreferrer" ta=
rget=3D"_blank">build.rs</a> script is running python script to <br>
figure out the path to the headers. I&#39;m not sure we can use target <br>
python exe in the build steps without running qemu instance or something <b=
r>
which seems overkill in this case. We have the information about python <br=
>
include path for the target in the variable PYTHON_INCLUDE_DIR.<br>
<br>
With this patch the compilation will find Python.h:<br>
<br>
$ git diff src/rust/<a href=3D"http://build.rs" rel=3D"noreferrer" target=
=3D"_blank">build.rs</a><br>
diff --git a/src/rust/<a href=3D"http://build.rs" rel=3D"noreferrer" target=
=3D"_blank">build.rs</a> b/src/rust/<a href=3D"http://build.rs" rel=3D"nore=
ferrer" target=3D"_blank">build.rs</a><br>
index 01177ac..7dc13fe 100644<br>
--- a/src/rust/<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_bl=
ank">build.rs</a><br>
+++ b/src/rust/<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_bl=
ank">build.rs</a><br>
@@ -43,11 +43,8 @@ fn main() {<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 )<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .unwrap();<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 println!(&quot;cargo:rustc-cfg=3Dpython_impl=
ementation=3D\&quot;{}\&quot;&quot;, python_impl);<br>
-=C2=A0=C2=A0=C2=A0 let python_include =3D run_python_script(<br>
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &amp;python,<br>
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;import sysconfig; print(s=
ysconfig.get_path(&#39;include&#39;), end=3D&#39;&#39;)&quot;,<br>
-=C2=A0=C2=A0=C2=A0 )<br>
-=C2=A0=C2=A0=C2=A0 .unwrap();<br>
+=C2=A0=C2=A0=C2=A0 let python_include =3D env::var(&quot;PYTHON_INCLUDE_DI=
R&quot;).unwrap();<br>
+<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let openssl_include =3D<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 std::env::var_os(&qu=
ot;DEP_OPENSSL_INCLUDE&quot;).expect(&quot;unable to find <br>
openssl include path&quot;);<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let openssl_c =3D Path::new(&amp;out_dir).jo=
in(&quot;_openssl.c&quot;);<br>
<br></blockquote><div><br></div></div></div></div><div><div dir=3D"ltr"><di=
v class=3D"gmail_quote"><div>This patch at least got `python3-cryptography-=
native` to build to completion.</div></div></div></div><div><div dir=3D"ltr=
"><div class=3D"gmail_quote"><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<br>
But it fails later in the linking step.<br>
<br>
.....linux/python3-cryptography/40.0.2-r0/recipe-sysroot/usr/lib/rustlib/x8=
6_64-poky-linux-gnu/lib&quot; <br>
&quot;-L&quot; <br>
&quot;/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptogra=
phy/40.0.2-r0/python3-cryptography-40.0.2/target/x86_64-poky-linux-gnu/rele=
ase/build/cryptography-rust-aa00e39a952c07ee/out&quot; <br>
&quot;-L&quot; <br>
&quot;/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptogra=
phy/40.0.2-r0/recipe-sysroot/usr/lib&quot; <br>
&quot;-L&quot; <br>
&quot;/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptogra=
phy/40.0.2-r0/recipe-sysroot-native/usr/lib/rustlib/x86_64-poky-linux-gnu/l=
ib&quot; <br>
&quot;-Wl,-Bstatic&quot; &quot;-l_openssl.a&quot; <br>
&quot;/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptogra=
phy/40.0.2-r0/recipe-sysroot/usr/lib/rustlib/x86_64-poky-linux-gnu/lib/libc=
ompiler_builtins-45df5d471f0d20d0.rlib&quot; <br>
&quot;-Wl,-Bdynamic&quot; &quot;-lssl&quot; &quot;-lcrypto&quot; &quot;-lgc=
c_s&quot; &quot;-lutil&quot; &quot;-lrt&quot; &quot;-lpthread&quot; <br>
&quot;-lm&quot; &quot;-ldl&quot; &quot;-lc&quot; &quot;-Wl,--eh-frame-hdr&q=
uot; &quot;-Wl,-znoexecstack&quot; &quot;-L&quot; <br>
&quot;/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptogra=
phy/40.0.2-r0/recipe-sysroot-native/usr/lib/rustlib/x86_64-poky-linux-gnu/l=
ib&quot; <br>
&quot;-o&quot; <br>
&quot;/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptogra=
phy/40.0.2-r0/python3-cryptography-40.0.2/target/x86_64-poky-linux-gnu/rele=
ase/deps/libcryptography_rust.so&quot; <br>
&quot;-Wl,--gc-sections&quot; &quot;-shared&quot; &quot;-Wl,-O1&quot; &quot=
;-nodefaultlibs&quot;<br>
=C2=A0=C2=A0 =3D note: <br>
/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40=
.0.2-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/x86_6=
4-poky-linux/gcc/x86_64-poky-linux/12.2.0/ld: <br>
/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40=
.0.2-r0/python3-cryptography-40.0.2/target/x86_64-poky-linux-gnu/release/bu=
ild/cryptography-rust-aa00e39a952c07ee/out/lib_openssl.a.a(9bdf47a443b7a07f=
-_openssl.o): <br>
warning: relocation against `_Py_NoneStruct&#39; in read-only section `.tex=
t&#39;<br>
/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40=
.0.2-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/x86_6=
4-poky-linux/gcc/x86_64-poky-linux/12.2.0/ld: <br>
/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40=
.0.2-r0/python3-cryptography-40.0.2/target/x86_64-poky-linux-gnu/release/bu=
ild/cryptography-rust-aa00e39a952c07ee/out/lib_openssl.a.a(9bdf47a443b7a07f=
-_openssl.o): <br>
relocation R_X86_64_PC32 against undefined symbol `_Py_NoneStruct&#39; can =
<br>
not be used when making a shared object; recompile with -fPIC<br>
/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40=
.0.2-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/x86_6=
4-poky-linux/gcc/x86_64-poky-linux/12.2.0/ld: <br>
final link failed: bad value<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 collect2: erro=
r: ld returned 1 exit status<br>
<br>
<br>
There are some &#39;-L .../recipe-sysroot-native/usr/lib/rustlib/...&#39; t=
hat <br>
can probably causing this. Don&#39;t know if it helps us forward?<br>
<br>
/Peter<br>
<br>
</blockquote></div></div>
</div>

--000000000000ffb08f05faea566b--

