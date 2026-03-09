Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D21D9F4180F
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 16:29:34 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18909.1773073765160073674
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 09:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bp/R2N4A;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35980423087so4270504a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 09:29:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773073764; cv=none;
        d=google.com; s=arc-20240605;
        b=ii50Z2D0K06jrAQtDUuY+WibdR7DhBTKsBzFpX6lz8Ylw2D4FimL2e6GYtRU1ocxMK
         z0H9ifOsNoE4Oju4KbOBP+iz1lXJxdBsmJ6iSjd2e22NY3lT4xdQVLWnArp+lYlPmyhi
         fDKrnl4of5xmhDh+y+d0fllAtjzeDyCb+lYEp5Y+X556eNZR9Q5yxy595Akdes+Prjxj
         V/PZJJ4G+ys6OfDuoCg6OFsgHNx5UUoOgi6KB30JHQCTrdY4iSaxjVNQN6YIGB3WwIiT
         LELyqCx9vzX6tAtGs+DN1hte0PS6Vuh/Wp0k+L7MwER0SuwCOv4FaC9a2czKNT+6nLIL
         QqOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UFtkC8GuHdyhc+6LSQkzGgmJyF4dro/ZyXEwW6xStyQ=;
        fh=jbolvYjdt/snchFwhNPWym6KtfzUjjaZ5sxx76h/+/w=;
        b=OIiAp4Pjnk6p6wKhTtK55R1HmyJXOriGFsv+gSX/TzgZDdUPdrVnfwnG7dom5X45pB
         FN+D94oMKS94Q5RSholwjn2Nokt6j7ED7/xAXGiroARg3BY+SvcWVxNg11ag1fV+IVO9
         /GdLwcYgm74gw+64TvmDo95WZe5VQ4rr7GyvV4f+APX6fJ6ej/a8yB0szx/qey4uKmF7
         mdD1ybfoAsofzyejPfqMKjLRER2XexAK4nSpdcxuGZLZNMYCNQcO0JC4yI8v/CP1Jfh7
         GSxs1cvFtIp3RSoEkvErRazT0zNKqMJH7KNkGuU61kl5KHStRPqV6fZKkRmupLh4A//N
         knzA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773073764; x=1773678564; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UFtkC8GuHdyhc+6LSQkzGgmJyF4dro/ZyXEwW6xStyQ=;
        b=Bp/R2N4Avhx9dNbMJY7dmDxOp2NyPVSsbajuB97z/A1yeN0WqUKkL+eelU+tKWfTk9
         2zgI9KkAr4We11Fl7C0G4fW2aPHg0MdjVDwr+5Qe4maQN8wlUaKhMGXX302ZZyn4rIjD
         S0kfkguIWyGHXIm3grTpDtZRaylM1f8sfw/rafc2RmO42iE+mL/1k8p2VHImIT+QQDCb
         zhJe97DZqS63iXL2e+vS1nRszbRg/oZqImDJG1FMLleT7WyX8PZWknguVmSsT9ET0P7l
         tN+E/cU6cFptOkN1giGi0+otfU6V2L46Rh1dixPDHjQJVDWLBCNhkOlfPX86G4255Q9l
         PvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773073764; x=1773678564;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFtkC8GuHdyhc+6LSQkzGgmJyF4dro/ZyXEwW6xStyQ=;
        b=wvBrLe9Akwu0rWueZXqVMjZ2O+D3mzF8dDQrEnuy4T2LG5aO0zcZ7Y7kQHsspBN6Uf
         EJNL50Qan6hLUCB/FMPc9lw1CwdmRuiW7jkQIHk5i8V2PdnV/GHYovRFAL0d0Ffzu8ap
         jT23Q4YPuv/NGYZ5U0LYt4X/AYPt1c6xvtSAI31oso/kfJmyAwrp6uQWQxwc3acdCpc8
         vDL/cBNRiSqBb39a5muq7COEyMyPf6C72p26S9bQh3NHWx8J4ExcytufvW7/drB11uWb
         7bPOgGYvckpHmGR/kMf94nQO/awdvXZ/IJQ+DXecbFpacz8qXOLC1O40UYqqBoR62fUh
         X7fw==
X-Forwarded-Encrypted: i=1; AJvYcCXgXRZgfJXKs4vZg7EvU5Ih6ib2/HNNjd2QX0pTZh+ejAUjbg1UsrJYX78NYtFgl25/fv46FsapMROl3/CDgeJ6AQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwB5i9UozMS7q0QO8RNiEVClYkizrJV0vna06BxLMIbmpMek8ff
	mlut1sTJv3bJx5dPRGcnZAYzU01MUeMHbVQ2hiAfV9/qDIM9+lnu8GJ3SEgfxa2Y7xda6Od+QtC
	OxGGLneNvCHjb2wGEuMH+XzSWeeFpWZ0=
X-Gm-Gg: ATEYQzyB1NMsYYhfPf/5tgv8MS1+XA0fdLAyWUhCnGiDNpPy4sJgKnCLxlT+Vq+DYWT
	SExCQ6amKNNSwg44GiVdCgZgEUYCK6Hh0nPFdxD/zi8Lja/ObhiMpZXVFJiLFGXCpyHXTvPOz4S
	O3Q7PP3pqI9RfZiGC9kqFd3dUASuAkI4LFT8mpcj1Vg3SemGzz3ZJxyy5TMUrAW/bOZSMj7ENMK
	/41Jo2dl2eNav0wW2AVGk9I7KkODqgzpPZSi88dCbhSBoQEQ0Jpqv4rGL0Zu+J6qnfbA0YrFnsI
	In2urJx04+d52qsdwXBSiNnvQy3+wZfqRFljvno2
X-Received: by 2002:a17:902:f68a:b0:2ae:59a9:639d with SMTP id
 d9443c01a7336-2ae82367dd4mr125692015ad.4.1773073764150; Mon, 09 Mar 2026
 09:29:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260304174324.1186644-1-Harish.Sadineni@windriver.com>
 <20260304174324.1186644-2-Harish.Sadineni@windriver.com> <da48a9fc8556f2a54e44f7e029be64182b0e8cf9.camel@linuxfoundation.org>
 <22371edb-5575-4636-88cc-462d0b19646c@windriver.com>
In-Reply-To: <22371edb-5575-4636-88cc-462d0b19646c@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 9 Mar 2026 12:29:10 -0400
X-Gm-Features: AaiRm51X_MhdeQh4QCfnwAtb4CnG2sa9sM22ZipeHu_IwYlnTYBVfnujFP73LE4
Message-ID: <CADkTA4P3mPN8COS=Qeqf9Rzu3-E93r4j11x9b2hX5b2etR34zg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v7 01/14] linux-yocto: conditionally add
 clang/rust/bindgen-cli-native to DEPENDS
To: Harish Sadineni <Harish.Sadineni@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Sundeep.Kokkonda@windriver.com, paul@pbarker.dev, yoann.congal@smile.fr
Content-Type: multipart/alternative; boundary="000000000000df735d064c99e723"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 16:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232729

--000000000000df735d064c99e723
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2026 at 12:10=E2=80=AFPM Harish Sadineni <
Harish.Sadineni@windriver.com> wrote:

>
> On 3/9/2026 4:56 PM, Richard Purdie wrote:
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
>
> On Wed, 2026-03-04 at 09:43 -0800, Sadineni, Harish via lists.openembedde=
d.org wrote:
>
> From: Harish Sadineni <Harish.Sadineni@windriver.com> <Harish.Sadineni@wi=
ndriver.com>
>
> Conditionally add 'clang-native', 'rust-native' and 'bindgen-cli-native' =
to 'DEPENDS'
> when Kernel Rust Support is enabled.
>
> These tools are required for building Rust-enabled kernels and for
> generating Rust FFI bindings via bindgen during the kernel build.
>
> This ensures the additional dependencies are only pulled in when
> Rust support is explicitly enabled, avoiding unnecessary native
> dependencies for non-Rust kernel builds.
>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com> <Harish.Sa=
dineni@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-ker=
nel/linux/linux-yocto.inc
> index 4d0a726bb6..b7961bbcdf 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -76,11 +76,14 @@ do_install:append(){
>  KERNEL_FEATURES:append:qemuall =3D " features/kernel-sample/kernel-sampl=
e.scc"
>
>  KERNEL_DEBUG ?=3D ""
> +KERNEL_RUST_SUPPORT ?=3D ""
>  # These used to be version specific, but are now common dependencies.  N=
ew
>  # tools / dependencies will continue to be added in version specific rec=
ipes.
>  DEPENDS +=3D '${@bb.utils.contains_any("ARCH", [ "x86", "arm64", "powerp=
c" ], "elfutils-native", "", d)}'
>  DEPENDS +=3D "openssl-native util-linux-native"
>  DEPENDS +=3D "gmp-native libmpc-native"
> +RUST_KERNEL_DEPENDS ?=3D "${@bb.utils.contains('KERNEL_RUST_SUPPORT', 'T=
rue', 'clang-native rust-native bindgen-cli-native', '', d)}" <$%7B@bb.util=
s.contains('KERNEL_RUST_SUPPORT','True','clang-nativerust-nativebindgen-cli=
-native','',d)%7D>
> +DEPENDS +=3D "${RUST_KERNEL_DEPENDS}"
>
>  # Some options depend on CONFIG_PAHOLE_VERSION, so need to make pahole-n=
ative available before do_kernel_configme
>  do_kernel_configme[depends] +=3D '${@bb.utils.contains("KERNEL_DEBUG", "=
True", "pahole-native:do_populate_sysroot", "", d)}'
>
> I thought we were going to try and use KERNEL_FEATURES for this?
>
> Hi Richard,
>
> I have tried this but i got circular dependency error with
> KERNEL_FEATURES. So, I opted using variable KERNEL_RUST_SUPPORT.
>

I'm curious about that. Can you share the details ? (diff and the bitbake
error)

Bruce



> The implementation of KERNEL_RUST_SUPPORT is problematic as it only
> works for the value of "True", not "true", or "1" or 1 or any other
> thing people might dream up. "Contains" isn't really an appropriate
> mechanism for a boolean either.
>
> You can use bb.utils.to_boolean() as a way to better obtain a boolean
> value from a random variable.
>
> Understood, Earlier i took reference from the code that already present i=
n
> that file.
> I have updated the code we will send v8.
>
> Thanks,
> Harish
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
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000df735d064c99e723
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 9, 2026 at 12:10=
=E2=80=AFPM Harish Sadineni &lt;<a href=3D"mailto:Harish.Sadineni@windriver=
.com">Harish.Sadineni@windriver.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><u></u>

 =20
  <div>
    <p><br>
    </p>
    <div>On 3/9/2026 4:56 PM, Richard Purdie
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Wed, 2026-03-04 at 09:43 -0800, Sadineni, Harish via <a href=3D"http://l=
ists.openembedded.org" target=3D"_blank">lists.openembedded.org</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre>From: Harish Sadineni <a href=3D"mailto:Harish.Sadineni@windri=
ver.com" target=3D"_blank">&lt;Harish.Sadineni@windriver.com&gt;</a>

Conditionally add &#39;clang-native&#39;, &#39;rust-native&#39; and &#39;bi=
ndgen-cli-native&#39; to &#39;DEPENDS&#39;
when Kernel Rust Support is enabled.

These tools are required for building Rust-enabled kernels and for
generating Rust FFI bindings via bindgen during the kernel build.

This ensures the additional dependencies are only pulled in when
Rust support is explicitly enabled, avoiding unnecessary native
dependencies for non-Rust kernel builds.

Signed-off-by: Harish Sadineni <a href=3D"mailto:Harish.Sadineni@windriver.=
com" target=3D"_blank">&lt;Harish.Sadineni@windriver.com&gt;</a>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kerne=
l/linux/linux-yocto.inc
index 4d0a726bb6..b7961bbcdf 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -76,11 +76,14 @@ do_install:append(){
 KERNEL_FEATURES:append:qemuall =3D &quot; features/kernel-sample/kernel-sa=
mple.scc&quot;

 KERNEL_DEBUG ?=3D &quot;&quot;
+KERNEL_RUST_SUPPORT ?=3D &quot;&quot;
 # These used to be version specific, but are now common dependencies.  New
 # tools / dependencies will continue to be added in version specific recip=
es.
 DEPENDS +=3D &#39;${@bb.utils.contains_any(&quot;ARCH&quot;, [ &quot;x86&q=
uot;, &quot;arm64&quot;, &quot;powerpc&quot; ], &quot;elfutils-native&quot;=
, &quot;&quot;, d)}&#39;
 DEPENDS +=3D &quot;openssl-native util-linux-native&quot;
 DEPENDS +=3D &quot;gmp-native libmpc-native&quot;
+RUST_KERNEL_DEPENDS ?=3D <a href=3D"mailto:$%7B@bb.utils.contains(&#39;KER=
NEL_RUST_SUPPORT&#39;,&#39;True&#39;,&#39;clang-nativerust-nativebindgen-cl=
i-native&#39;,&#39;&#39;,d)%7D" target=3D"_blank">&quot;${@bb.utils.contain=
s(&#39;KERNEL_RUST_SUPPORT&#39;, &#39;True&#39;, &#39;clang-native rust-nat=
ive bindgen-cli-native&#39;, &#39;&#39;, d)}&quot;</a>
+DEPENDS +=3D &quot;${RUST_KERNEL_DEPENDS}&quot;

 # Some options depend on CONFIG_PAHOLE_VERSION, so need to make pahole-nat=
ive available before do_kernel_configme
 do_kernel_configme[depends] +=3D &#39;${@bb.utils.contains(&quot;KERNEL_DE=
BUG&quot;, &quot;True&quot;, &quot;pahole-native:do_populate_sysroot&quot;,=
 &quot;&quot;, d)}&#39;
</pre>
      </blockquote>
      <pre>I thought we were going to try and use KERNEL_FEATURES for this?=
</pre>
    </blockquote>
    Hi Richard,<br>
    <br>
    I have tried this but i got circular dependency error with
    KERNEL_FEATURES. So, I opted using variable KERNEL_RUST_SUPPORT.</div><=
/blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-=
size:small">I&#39;m curious about that. Can you share the details ? (diff a=
nd the bitbake error)</div><div class=3D"gmail_default" style=3D"font-size:=
small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bru=
ce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div><span style=3D"white-space:pre-wrap">
</span>
    <blockquote type=3D"cite">
      <pre>The implementation of KERNEL_RUST_SUPPORT is problematic as it o=
nly
works for the value of &quot;True&quot;, not &quot;true&quot;, or &quot;1&q=
uot; or 1 or any other
thing people might dream up. &quot;Contains&quot; isn&#39;t really an appro=
priate
mechanism for a boolean either.

You can use bb.utils.to_boolean() as a way to better obtain a boolean
value from a random variable.</pre>
    </blockquote>
    Understood, Earlier i took reference from the code that already
    present in that file. <br>
    I have updated the code we will send v8.<br>
    <br>
    Thanks,<br>
    Harish<br>
    <blockquote type=3D"cite">
      <pre>Cheers,

Richard





</pre>
    </blockquote>
  </div>

</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000df735d064c99e723--

