Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A48BC3600B
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 16:14:14 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web11.995.1743437645002019056
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 09:14:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L9KQu6cv;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-602513d2253so2779545eaf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 09:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743437644; x=1744042444; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uhSTofwdKlS9KyETSc16fmw1Zqr1FJ3+ZLTicbMVAxY=;
        b=L9KQu6cvBYzhEIQ20gu3IeJCha4WqmlXWZCLzHAAzJ2sXOgmmMFIhd4cWFmThajXJy
         j31mUnXfgnf8cd08dRDlv3R4NnuzbPry3AbvxZQ1IgbSa+oPdE6ddFNuSmB/4U59/uuc
         tVBYMwF0qXdJiIbyKxDfD8jhfoxJVioioUXqiThTAzynK5nJbund1JKRlCs63wCyZiZk
         0cYyhXl64N3LHPxx6LL2PQA+2PiQY2QX90Hp+6vnZ05vyyMmBqRLgEVCI9F4RpbV9l92
         uEyp2v4VokxprjIc8vvwLDuQXXSjI3sbskkjK93LhJGftlmCmTTm+4JHil9uZdI3120O
         H9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743437644; x=1744042444;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uhSTofwdKlS9KyETSc16fmw1Zqr1FJ3+ZLTicbMVAxY=;
        b=hKRYTG/LctvYlq1OqJA/zYVQ/0H1v7ybjJa/1e9VIx49gRZZB6eh6lrfCh/OpjPI9s
         AT/XmBvNE7kkPjtGOzvlxCmt1EX5YB51AnbSVXW2fsrO9ss1Z7QGsGJdYGF2l0z3EWEt
         sZmvqWun5w9dWnHy6On5alPGUSKKhfzoHK+d3kBbRi0JeFJCUgFoaF5UzMDm9+9x3ytL
         qITnPgYIzy/E1sbg+n41iOLkJhq1AqF0KUfSEhjTaQ51+arP9UvtYjxnXPeXA8reO/xs
         kOdAqN7cQsG/VBJbr7RUnX5uvbyy4kzlUEvkgegWTez/XswMz/0fat+kskyRSIX/b3Eh
         dWYg==
X-Gm-Message-State: AOJu0YwcCq0P5TCEZTFim8KtG851Jv1+fw9edJU/WArPQpht5T9EWAKD
	zl0eBnEThZa7V/vAqgEOHgw3OU0dzC8+qdZSEvQvD8dFAN7cw3s9hfWj7uRs8VCSRPCdGU6K/Lz
	8n5jIBM+o3GbNq+VrLMI7Q/DYCUvz1pKk
X-Gm-Gg: ASbGnctWtg7DpfoPIVMrBCXMA6HKCIoDRgB6seXCQbML5x549X8NJICpJ1TWE7GvcFq
	ZGoKuOq4HtEr/HRgJnxrCFFpifBAepEhk0v+/w71198mRp21jNtjksoXJX5i/CUFm2N4G6TsmFQ
	fU3rHwh7lLsqS0b7CLEaoLMrqiY+jpPMODrHOY3VzyXf1IseuhPZIV9wIXNow=
X-Google-Smtp-Source: AGHT+IF3v0Dtbg6ycyPuDnBChYFztXqeOdpB7J+DqMkTCGPwnXi0A2FTxY8/d4ivhVAJMJGK9BfIQUbewL3fuW9dlJQ=
X-Received: by 2002:a05:6808:2021:b0:3f7:de07:6e1c with SMTP id
 5614622812f47-3ff0f5cdb7bmr5484790b6e.35.1743437644203; Mon, 31 Mar 2025
 09:14:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250331133044.1944108-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20250331133044.1944108-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 31 Mar 2025 09:13:53 -0700
X-Gm-Features: AQ5f1JoxgY7tuCEK5c0aPg42R9dzbPIKLXLQLQjXO5OdgZKfCaeqXi6JuOBZxFs
Message-ID: <CAMKF1sr8AqkmjQca6fYe90oOU3h=++A2=7RpaWkRFEuS38oyHg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust-llvm: Compile llvm to use dynamic libraries
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000788c8d0631a5b549"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 16:14:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213987

--000000000000788c8d0631a5b549
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 6:30=E2=80=AFAM Richard Purdie via lists.openembedd=
ed.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:

> Our main llvm recipe uses dynamic linking already but rust-llvm does not.
> Enabling this significanly reduces the size of llvm-rust to about a third
> of what it was, which is a bettter configuration for us leading to smalle=
r
> TMPDIR and sstate objects


It will slow down the compiler execution and sometimes its could be
significant as well we have seen this with clang so it would be good to
have some idea around that least we provide a slow compiler compared to
other distro infrastructures

>
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/rust/rust-llvm_1.85.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/rust/rust-llvm_1.85.1.bb
> b/meta/recipes-devtools/rust/rust-llvm_1.85.1.bb
> index 6a4d2957288..566348c617d 100644
> --- a/meta/recipes-devtools/rust/rust-llvm_1.85.1.bb
> +++ b/meta/recipes-devtools/rust/rust-llvm_1.85.1.bb
> @@ -44,6 +44,8 @@ EXTRA_OECMAKE =3D " \
>      -DLLVM_ENABLE_FFI=3DOFF \
>      -DLLVM_INSTALL_UTILS=3DON \
>      -DLLVM_BUILD_EXAMPLES=3DOFF \
> +    -DLLVM_BUILD_LLVM_DYLIB=3DON \
> +    -DLLVM_LINK_LLVM_DYLIB=3DON \
>      -DLLVM_INCLUDE_EXAMPLES=3DOFF \
>      -DLLVM_BUILD_TESTS=3DOFF \
>      -DLLVM_INCLUDE_TESTS=3DOFF \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213979):
> https://lists.openembedded.org/g/openembedded-core/message/213979
> Mute This Topic: https://lists.openembedded.org/mt/112003864/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000788c8d0631a5b549
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 31, 2025 at 6:30=E2=80=AFAM=
 Richard Purdie via <a href=3D"http://lists.openembedded.org">lists.openemb=
edded.org</a> &lt;richard.purdie=3D<a href=3D"mailto:linuxfoundation.org@li=
sts.openembedded.org">linuxfoundation.org@lists.openembedded.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto">Our main llvm rec=
ipe uses dynamic linking already but rust-llvm does not.<br>
Enabling this significanly reduces the size of llvm-rust to about a third<b=
r>
of what it was, which is a bettter configuration for us leading to smaller<=
br>
TMPDIR and sstate objects</blockquote><div dir=3D"auto"><br></div><div dir=
=3D"auto">It will slow down the compiler execution and sometimes its could =
be significant as well we have seen this with clang so it would be good to =
have some idea around that least we provide a slow compiler compared to oth=
er distro infrastructures=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"=
auto"><br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0meta/recipes-devtools/rust/<a href=3D"http://rust-llvm_1.85.1.bb" rel=
=3D"noreferrer" target=3D"_blank">rust-llvm_1.85.1.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/rust/<a href=3D"http://rust-llvm_1.85.1.=
bb" rel=3D"noreferrer" target=3D"_blank">rust-llvm_1.85.1.bb</a> b/meta/rec=
ipes-devtools/rust/<a href=3D"http://rust-llvm_1.85.1.bb" rel=3D"noreferrer=
" target=3D"_blank">rust-llvm_1.85.1.bb</a><br>
index 6a4d2957288..566348c617d 100644<br>
--- a/meta/recipes-devtools/rust/<a href=3D"http://rust-llvm_1.85.1.bb" rel=
=3D"noreferrer" target=3D"_blank">rust-llvm_1.85.1.bb</a><br>
+++ b/meta/recipes-devtools/rust/<a href=3D"http://rust-llvm_1.85.1.bb" rel=
=3D"noreferrer" target=3D"_blank">rust-llvm_1.85.1.bb</a><br>
@@ -44,6 +44,8 @@ EXTRA_OECMAKE =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0-DLLVM_ENABLE_FFI=3DOFF \<br>
=C2=A0 =C2=A0 =C2=A0-DLLVM_INSTALL_UTILS=3DON \<br>
=C2=A0 =C2=A0 =C2=A0-DLLVM_BUILD_EXAMPLES=3DOFF \<br>
+=C2=A0 =C2=A0 -DLLVM_BUILD_LLVM_DYLIB=3DON \<br>
+=C2=A0 =C2=A0 -DLLVM_LINK_LLVM_DYLIB=3DON \<br>
=C2=A0 =C2=A0 =C2=A0-DLLVM_INCLUDE_EXAMPLES=3DOFF \<br>
=C2=A0 =C2=A0 =C2=A0-DLLVM_BUILD_TESTS=3DOFF \<br>
=C2=A0 =C2=A0 =C2=A0-DLLVM_INCLUDE_TESTS=3DOFF \<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#213979): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/213979" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/213979</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112003864/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/112003864/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000788c8d0631a5b549--

