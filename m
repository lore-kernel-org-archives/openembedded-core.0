Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E46EDC43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 16:35:39 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1068.1783614937276418018
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 09:35:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DyreIYL7;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-664bb15d05dso2879714d50.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 09:35:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783614936; cv=none;
        d=google.com; s=arc-20260327;
        b=Iyoz6q+pRehMFWpfYTtTk3lwz7xKLhj+YcrdiuwslI/dJvl3/lBmbpbrlVBXEQL9Vg
         vuNxHC6kghr76+nrvrs8fMEMDz12uMGL5NvHVFaJMZnyBcBwh2Z3A7J/m1+nhxUwJaEm
         cLd6LKLMSqfSg8l6sXpNRPtmPsh5jhZbRCYz9o3U7b5Q/o9C4zIS7UZ15fQVY7+8Dxf+
         SXH1lwdqoH7VB+MQ/NTxqSnULfuyf9CNwSJI7xuxfVJ0LQUXWxIfV8Rtfd/tcieldsl8
         C43/Y4cpppPp0tRBuG8eFnGeAZCXQKY/wEzHeXnO31atKLxVFqk0GQ/aOelc4GeY7YRK
         LJyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mEWJnde4zr+IzyQJA27VToDmw2LgTAHl5YqxnxdQqYU=;
        fh=8P6pgecEmxdRAMFrp7Ocjxw3uqQw4F9IqG5YpNgZhvM=;
        b=ZXbGsx9HbB4PSaowDqBZJ0So0A/SjwTFWc3CazzdS9ngi9BTVUuh3ILn7azsoFi+9A
         TKZz6aw/G88qmHPT4pQ7ssnwU2L/rRSMtQX8IskoqeEd+KCItmZsOMIJjxS1/qbJxQFk
         oE4XFCD16hd5aAVsjsZLfmbYuVbkSwydY58eudT3COQj80PloP37OhbpfJ8ifi84SmUP
         BFEGJx0QVhO7E1VJpeGceGkuwHIt9vQPFORyvmLgMO3gI/bs2z5gVI3pFGVLpQ9x4d6d
         dIHq9nMBrk6Xw0IyW4RyWlyOLUP8/ZXEENO3AXC9amV8oqxFFVp5ICwhy9nJSxzvhowI
         6ipg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783614936; x=1784219736; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mEWJnde4zr+IzyQJA27VToDmw2LgTAHl5YqxnxdQqYU=;
        b=DyreIYL7ZZ+I6qpDxfxU/Zmv9xtBMqEf2mCC+HobF6eKEAXrTu+mJw0dXYR50OxfzA
         jMCLLEYzEGQjwLa6fsIf7Kb1o0lfbS0kktkIMdWYN81CX2TzHGIhFSTXvfJYCDCrZyji
         RAegM2tvOe++mhPD2j+dJ0wbFhA1dyGRarEwCuaapiQ0e/qH3Jm2Qf3VMrQFgMUBoZlF
         GcPArAEUWoN0abWUvPqNdjrxuEZxstn6/Pt46vMpZpUWNZ9Gb3vqJmjuZa0NNzXdl5cT
         zIc4jvD9KdcCvky1G69m3yUAAGortcs/1cDxzPpTma8o75oToqVI6yuDlxSRkTniemIg
         byYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783614936; x=1784219736;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mEWJnde4zr+IzyQJA27VToDmw2LgTAHl5YqxnxdQqYU=;
        b=FkgncHXjOxJvRbM09mB430DFOzUYgYO49dSvZxaUU+2cwXQd+BUhtxYvB+AcESISw8
         rIz2DEUXfFKwEizU8mEVdTdDXuGAXCmHEfWvm/nZgXXEYEKUBHDG8gnb/iNBpogn3dw6
         4Hjwgc4JeWomwuyrzdD79aPgVRDNEHEWuRCEwH1+rbdDDMlzGgdvyBAWoQwqSe9YpTOt
         O5u/tn8YDfYN5qR/7MjT6+Jga0hdIJzPZw9jEvYtSLFtDRxHDsrJp8e47RhXwnEfV9s+
         2D5nask34yJ2Ca2+cJA4Mfplfqt7hQNlNjqDWeELbZgexim9F5+rqQX4kOuiczl6mOXm
         9Qog==
X-Gm-Message-State: AOJu0YzKDJ/khw/crcChXO33nY2GDkPUYxIp+yo2TYGTV/CS+ftK9jDF
	lyCERKrFUGGM/iVqYDpYDMF5Bt5/IvlwpNY+CJR0PyJir6MJZGHzOGzJHOd0SFLKn1Qqzuv2au9
	ZZzzv8/oWTBK8QNIdywl0NncLOAHmr4g=
X-Gm-Gg: AfdE7cm3hp7xAxFzp8aqrClYcJI6IPu0gpvHrWcIB+mlk6ErCpOV/O30rC/5dQM5gM4
	N6wAiOuQoRXNHv7VbZUwi32ZDLLgmAIEKufuUDM/AiM0KejAzu01rIFhLNOexJ3iqsj6VOzCC7o
	6lYb5JPy2Wbc2AFBsBqjP/uLBnGpQaDAqN4BHVvZc3kHls1ptJmOOXdFDgeBZLHtx0GiP5bO9n9
	UyU/7jEWcfL0XAVI63OkP+mu6peEtddSaXyBm4qZte9XFi8wmQlsob3IgM7uQs9GQP/JNltrLgW
	vo6C7H2iA6RNb/kWyltHxXiPaXj7q94lU0oDQUxifrkOTPTcuywo/ZxGFsF72ipp3wuAW9cVp3i
	Ex7d3/vQtJSvYFJfZn05k5suwrmWcqAUi59Mt3NRZmXLC/xwHJt63fWYrTKWo8QBbyOxNYxI=
X-Received: by 2002:a05:690e:4812:b0:664:cf93:40d5 with SMTP id
 956f58d0204a3-6679f1072f8mr4841801d50.31.1783614936102; Thu, 09 Jul 2026
 09:35:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260706171701.70536-1-alex.kanavin@gmail.com> <20260706171701.70536-10-alex.kanavin@gmail.com>
In-Reply-To: <20260706171701.70536-10-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Jul 2026 09:35:09 -0700
X-Gm-Features: AUfX_mz9Z4x0pIcMGWd9S8hllHpnOKA8yMkftcWV06o5T9ug5gu6_xEkSmogJSI
Message-ID: <CAMKF1srG8wg6uMkmkqrHm=hWBqShakLBGD8z3uyg8+M8DFmdYg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 10/45] fmt: upgrade 12.1.0 -> 12.2.0
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000aebbf006563036e6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 16:35:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240588

--000000000000aebbf006563036e6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This has several packages broken currently left with
https://errors.yoctoproject.org/Errors/Build/242285/
but I wonder if common fmt is a recommended way or should we let vendored
versions be used.

On Mon, Jul 6, 2026 at 10:17=E2=80=AFAM Alexander Kanavin via lists.openemb=
edded.org
<alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:

> From: Alexander Kanavin <alex@linutronix.de>
>
> License-Update: clarify presence of fmt exception:
>
> https://github.com/fmtlib/fmt/commit/91d1aced0a846161135310249664506b4a56=
e196
>
> Backport a patch to address 32 bit x86 fails (which do not have a native
> int128 type).
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...ix-fallback-uint128-bitwise-not-4813.patch | 42 +++++++++++++++++++
>  ...01-Workaround-an-ABI-issue-in-spdlog.patch |  8 ++--
>  .../fmt/{fmt_12.1.0.bb =3D> fmt_12.2.0.bb}      | 10 +++--
>  3 files changed, 52 insertions(+), 8 deletions(-)
>  create mode 100644
> meta/recipes-devtools/fmt/fmt/0001-Fix-fallback-uint128-bitwise-not-4813.=
patch
>  rename meta/recipes-devtools/fmt/{fmt_12.1.0.bb =3D> fmt_12.2.0.bb} (60%=
)
>
> diff --git
> a/meta/recipes-devtools/fmt/fmt/0001-Fix-fallback-uint128-bitwise-not-481=
3.patch
> b/meta/recipes-devtools/fmt/fmt/0001-Fix-fallback-uint128-bitwise-not-481=
3.patch
> new file mode 100644
> index 0000000000..ef5c6e9f82
> --- /dev/null
> +++
> b/meta/recipes-devtools/fmt/fmt/0001-Fix-fallback-uint128-bitwise-not-481=
3.patch
> @@ -0,0 +1,42 @@
> +From d838c8c7923730afb751350ecac2b169256f1445 Mon Sep 17 00:00:00 2001
> +From: Vinay Kumar <vkslog69@gmail.com>
> +Date: Thu, 18 Jun 2026 12:22:12 +0530
> +Subject: [PATCH] Fix fallback uint128 bitwise not (#4813)
> +
> +Upstream-Status: Backport [
> https://github.com/fmtlib/fmt/commit/588b3a0f8f6a8bcf2a959cae882d5b2703e8=
6737
> ]
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +---
> + include/fmt/format.h | 3 +++
> + test/format-test.cc  | 5 +++++
> + 2 files changed, 8 insertions(+)
> +
> +diff --git a/include/fmt/format.h b/include/fmt/format.h
> +index f33c8b87..ca95f6df 100644
> +--- a/include/fmt/format.h
> ++++ b/include/fmt/format.h
> +@@ -326,6 +326,9 @@ class uint128 {
> +       -> uint128 {
> +     return {lhs.hi_ & rhs.hi_, lhs.lo_ & rhs.lo_};
> +   }
> ++  friend constexpr auto operator~(const uint128& n) -> uint128 {
> ++    return {~n.hi_, ~n.lo_};
> ++  }
> +   friend FMT_CONSTEXPR auto operator+(const uint128& lhs, const uint128=
&
> rhs)
> +       -> uint128 {
> +     auto result =3D uint128(lhs);
> +diff --git a/test/format-test.cc b/test/format-test.cc
> +index 61a53c72..7e48b751 100644
> +--- a/test/format-test.cc
> ++++ b/test/format-test.cc
> +@@ -81,6 +81,11 @@ TEST(uint128_test, minus) {
> +   EXPECT_EQ(n - 2, 40);
> + }
> +
> ++TEST(uint128_test, bitwise_not) {
> ++  auto n =3D ~uint128(0x123456789abcdef0, 0x0fedcba987654321);
> ++  EXPECT_EQ(n, uint128(0xedcba9876543210f, 0xf0123456789abcde));
> ++}
> ++
> + TEST(uint128_test, plus_assign) {
> +   auto n =3D uint128(32);
> +   n +=3D uint128(10);
> diff --git
> a/meta/recipes-devtools/fmt/fmt/0001-Workaround-an-ABI-issue-in-spdlog.pa=
tch
> b/meta/recipes-devtools/fmt/fmt/0001-Workaround-an-ABI-issue-in-spdlog.pa=
tch
> index 442506f834..afae644d49 100644
> ---
> a/meta/recipes-devtools/fmt/fmt/0001-Workaround-an-ABI-issue-in-spdlog.pa=
tch
> +++
> b/meta/recipes-devtools/fmt/fmt/0001-Workaround-an-ABI-issue-in-spdlog.pa=
tch
> @@ -1,4 +1,4 @@
> -From 32f4a4a634c99d4e00cc6149786a9180ad651f76 Mon Sep 17 00:00:00 2001
> +From 6ee6b54766c50ae8df9478efd91075543e89f66e Mon Sep 17 00:00:00 2001
>  From: Victor Zverovich <viz@meta.com>
>  Date: Sat, 22 Mar 2025 06:57:04 -0700
>  Subject: [PATCH] Workaround an ABI issue in spdlog
> @@ -10,10 +10,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
>  diff --git a/include/fmt/format.h b/include/fmt/format.h
> -index 4a653007..82f80efd 100644
> +index 5044befd..f33c8b87 100644
>  --- a/include/fmt/format.h
>  +++ b/include/fmt/format.h
> -@@ -793,7 +793,9 @@ enum { inline_buffer_size =3D 500 };
> +@@ -774,7 +774,9 @@ enum { inline_buffer_size =3D 500 };
>    * converted to `std::string` with `to_string(out)`.
>    */
>   template <typename T, size_t SIZE =3D inline_buffer_size,
> @@ -24,7 +24,7 @@ index 4a653007..82f80efd 100644
>   class basic_memory_buffer : public detail::buffer<T> {
>    private:
>     T store_[SIZE];
> -@@ -2746,7 +2748,7 @@ class bigint {
> +@@ -2769,7 +2771,7 @@ class bigint {
>     }
>
>    public:
> diff --git a/meta/recipes-devtools/fmt/fmt_12.1.0.bb
> b/meta/recipes-devtools/fmt/fmt_12.2.0.bb
> similarity index 60%
> rename from meta/recipes-devtools/fmt/fmt_12.1.0.bb
> rename to meta/recipes-devtools/fmt/fmt_12.2.0.bb
> index 22cab6f138..ca8fcb66ec 100644
> --- a/meta/recipes-devtools/fmt/fmt_12.1.0.bb
> +++ b/meta/recipes-devtools/fmt/fmt_12.2.0.bb
> @@ -1,14 +1,16 @@
>  SUMMARY =3D "open-source formatting library for C++"
>  DESCRIPTION =3D "{fmt} is an open-source formatting library for C++. It =
can
> be used as a safe and fast alternative to (s)printf and iostreams."
>  HOMEPAGE =3D "https://fmt.dev"
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db9257785fc4f3803a4b71b76c1412=
729"
> +LICENSE =3D "MIT-with-fmt-exception"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6ec080902ed8f82f5a97ed13e8042=
634 \
> +
> file://doc/LICENSE-exception;md5=3Db9257785fc4f3803a4b71b76c1412729"
>
> -SRC_URI =3D "git://
> github.com/fmtlib/fmt;branch=3Dmaster;protocol=3Dhttps;tag=3D${PV}
> <http://github.com/fmtlib/fmt;branch=3Dmaster;protocol=3Dhttps;tag=3D$%7B=
PV%7D>
> \
> +SRC_URI =3D "git://
> github.com/fmtlib/fmt;branch=3Dmain;protocol=3Dhttps;tag=3D${PV}
> <http://github.com/fmtlib/fmt;branch=3Dmain;protocol=3Dhttps;tag=3D$%7BPV=
%7D> \
>             file://0001-Workaround-an-ABI-issue-in-spdlog.patch \
>             file://run-ptest \
> +           file://0001-Fix-fallback-uint128-bitwise-not-4813.patch \
>             "
> -SRCREV =3D "407c905e45ad75fc29bf0f9bb7c5c2fd3475976f"
> +SRCREV =3D "1be298e1bd68957e4cd352e1f676f00e07dcfb57"
>
>  inherit cmake ptest
>
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#240296):
> https://lists.openembedded.org/g/openembedded-core/message/240296
> Mute This Topic: https://lists.openembedded.org/mt/120143430/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000aebbf006563036e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This has several packages broken currently left with=C2=A0=
<a href=3D"https://errors.yoctoproject.org/Errors/Build/242285/">https://er=
rors.yoctoproject.org/Errors/Build/242285/</a><div>but I wonder if common f=
mt is a recommended way or should we let vendored versions be used.=C2=A0</=
div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"=
ltr" class=3D"gmail_attr">On Mon, Jul 6, 2026 at 10:17=E2=80=AFAM Alexander=
 Kanavin via <a href=3D"http://lists.openembedded.org">lists.openembedded.o=
rg</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.com@lists.openembedded.or=
g">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">From: Alexander Kanavin &lt;<a href=3D"m=
ailto:alex@linutronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
<br>
License-Update: clarify presence of fmt exception:<br>
<a href=3D"https://github.com/fmtlib/fmt/commit/91d1aced0a84616113531024966=
4506b4a56e196" rel=3D"noreferrer" target=3D"_blank">https://github.com/fmtl=
ib/fmt/commit/91d1aced0a846161135310249664506b4a56e196</a><br>
<br>
Backport a patch to address 32 bit x86 fails (which do not have a native in=
t128 type).<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" =
target=3D"_blank">alex@linutronix.de</a>&gt;<br>
---<br>
=C2=A0...ix-fallback-uint128-bitwise-not-4813.patch | 42 ++++++++++++++++++=
+<br>
=C2=A0...01-Workaround-an-ABI-issue-in-spdlog.patch |=C2=A0 8 ++--<br>
=C2=A0.../fmt/{<a href=3D"http://fmt_12.1.0.bb" rel=3D"noreferrer" target=
=3D"_blank">fmt_12.1.0.bb</a> =3D&gt; <a href=3D"http://fmt_12.2.0.bb" rel=
=3D"noreferrer" target=3D"_blank">fmt_12.2.0.bb</a>}=C2=A0 =C2=A0 =C2=A0 | =
10 +++--<br>
=C2=A03 files changed, 52 insertions(+), 8 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-devtools/fmt/fmt/0001-Fix-fallback-ui=
nt128-bitwise-not-4813.patch<br>
=C2=A0rename meta/recipes-devtools/fmt/{<a href=3D"http://fmt_12.1.0.bb" re=
l=3D"noreferrer" target=3D"_blank">fmt_12.1.0.bb</a> =3D&gt; <a href=3D"htt=
p://fmt_12.2.0.bb" rel=3D"noreferrer" target=3D"_blank">fmt_12.2.0.bb</a>} =
(60%)<br>
<br>
diff --git a/meta/recipes-devtools/fmt/fmt/0001-Fix-fallback-uint128-bitwis=
e-not-4813.patch b/meta/recipes-devtools/fmt/fmt/0001-Fix-fallback-uint128-=
bitwise-not-4813.patch<br>
new file mode 100644<br>
index 0000000000..ef5c6e9f82<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/fmt/fmt/0001-Fix-fallback-uint128-bitwise-not-4=
813.patch<br>
@@ -0,0 +1,42 @@<br>
+From d838c8c7923730afb751350ecac2b169256f1445 Mon Sep 17 00:00:00 2001<br>
+From: Vinay Kumar &lt;<a href=3D"mailto:vkslog69@gmail.com" target=3D"_bla=
nk">vkslog69@gmail.com</a>&gt;<br>
+Date: Thu, 18 Jun 2026 12:22:12 +0530<br>
+Subject: [PATCH] Fix fallback uint128 bitwise not (#4813)<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/fmtlib/fmt/commit=
/588b3a0f8f6a8bcf2a959cae882d5b2703e86737" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/fmtlib/fmt/commit/588b3a0f8f6a8bcf2a959cae882d5b270=
3e86737</a>]<br>
+Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de"=
 target=3D"_blank">alex@linutronix.de</a>&gt;<br>
+---<br>
+ include/fmt/format.h | 3 +++<br>
+ test/format-test.cc=C2=A0 | 5 +++++<br>
+ 2 files changed, 8 insertions(+)<br>
+<br>
+diff --git a/include/fmt/format.h b/include/fmt/format.h<br>
+index f33c8b87..ca95f6df 100644<br>
+--- a/include/fmt/format.h<br>
++++ b/include/fmt/format.h<br>
+@@ -326,6 +326,9 @@ class uint128 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; uint128 {<br>
+=C2=A0 =C2=A0 =C2=A0return {lhs.hi_ &amp; rhs.hi_, lhs.lo_ &amp; rhs.lo_};=
<br>
+=C2=A0 =C2=A0}<br>
++=C2=A0 friend constexpr auto operator~(const uint128&amp; n) -&gt; uint12=
8 {<br>
++=C2=A0 =C2=A0 return {~n.hi_, ~n.lo_};<br>
++=C2=A0 }<br>
+=C2=A0 =C2=A0friend FMT_CONSTEXPR auto operator+(const uint128&amp; lhs, c=
onst uint128&amp; rhs)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; uint128 {<br>
+=C2=A0 =C2=A0 =C2=A0auto result =3D uint128(lhs);<br>
+diff --git a/test/format-test.cc b/test/format-test.cc<br>
+index 61a53c72..7e48b751 100644<br>
+--- a/test/format-test.cc<br>
++++ b/test/format-test.cc<br>
+@@ -81,6 +81,11 @@ TEST(uint128_test, minus) {<br>
+=C2=A0 =C2=A0EXPECT_EQ(n - 2, 40);<br>
+ }<br>
+ <br>
++TEST(uint128_test, bitwise_not) {<br>
++=C2=A0 auto n =3D ~uint128(0x123456789abcdef0, 0x0fedcba987654321);<br>
++=C2=A0 EXPECT_EQ(n, uint128(0xedcba9876543210f, 0xf0123456789abcde));<br>
++}<br>
++<br>
+ TEST(uint128_test, plus_assign) {<br>
+=C2=A0 =C2=A0auto n =3D uint128(32);<br>
+=C2=A0 =C2=A0n +=3D uint128(10);<br>
diff --git a/meta/recipes-devtools/fmt/fmt/0001-Workaround-an-ABI-issue-in-=
spdlog.patch b/meta/recipes-devtools/fmt/fmt/0001-Workaround-an-ABI-issue-i=
n-spdlog.patch<br>
index 442506f834..afae644d49 100644<br>
--- a/meta/recipes-devtools/fmt/fmt/0001-Workaround-an-ABI-issue-in-spdlog.=
patch<br>
+++ b/meta/recipes-devtools/fmt/fmt/0001-Workaround-an-ABI-issue-in-spdlog.=
patch<br>
@@ -1,4 +1,4 @@<br>
-From 32f4a4a634c99d4e00cc6149786a9180ad651f76 Mon Sep 17 00:00:00 2001<br>
+From 6ee6b54766c50ae8df9478efd91075543e89f66e Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Victor Zverovich &lt;<a href=3D"mailto:viz@meta.com" target=3D"=
_blank">viz@meta.com</a>&gt;<br>
=C2=A0Date: Sat, 22 Mar 2025 06:57:04 -0700<br>
=C2=A0Subject: [PATCH] Workaround an ABI issue in spdlog<br>
@@ -10,10 +10,10 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 4 insertions(+), 2 deletions(-)<br>
<br>
=C2=A0diff --git a/include/fmt/format.h b/include/fmt/format.h<br>
-index 4a653007..82f80efd 100644<br>
+index 5044befd..f33c8b87 100644<br>
=C2=A0--- a/include/fmt/format.h<br>
=C2=A0+++ b/include/fmt/format.h<br>
-@@ -793,7 +793,9 @@ enum { inline_buffer_size =3D 500 };<br>
+@@ -774,7 +774,9 @@ enum { inline_buffer_size =3D 500 };<br>
=C2=A0 =C2=A0* converted to `std::string` with `to_string(out)`.<br>
=C2=A0 =C2=A0*/<br>
=C2=A0 template &lt;typename T, size_t SIZE =3D inline_buffer_size,<br>
@@ -24,7 +24,7 @@ index 4a653007..82f80efd 100644<br>
=C2=A0 class basic_memory_buffer : public detail::buffer&lt;T&gt; {<br>
=C2=A0 =C2=A0private:<br>
=C2=A0 =C2=A0 T store_[SIZE];<br>
-@@ -2746,7 +2748,7 @@ class bigint {<br>
+@@ -2769,7 +2771,7 @@ class bigint {<br>
=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0public:<br>
diff --git a/meta/recipes-devtools/fmt/<a href=3D"http://fmt_12.1.0.bb" rel=
=3D"noreferrer" target=3D"_blank">fmt_12.1.0.bb</a> b/meta/recipes-devtools=
/fmt/<a href=3D"http://fmt_12.2.0.bb" rel=3D"noreferrer" target=3D"_blank">=
fmt_12.2.0.bb</a><br>
similarity index 60%<br>
rename from meta/recipes-devtools/fmt/<a href=3D"http://fmt_12.1.0.bb" rel=
=3D"noreferrer" target=3D"_blank">fmt_12.1.0.bb</a><br>
rename to meta/recipes-devtools/fmt/<a href=3D"http://fmt_12.2.0.bb" rel=3D=
"noreferrer" target=3D"_blank">fmt_12.2.0.bb</a><br>
index 22cab6f138..ca8fcb66ec 100644<br>
--- a/meta/recipes-devtools/fmt/<a href=3D"http://fmt_12.1.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">fmt_12.1.0.bb</a><br>
+++ b/meta/recipes-devtools/fmt/<a href=3D"http://fmt_12.2.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">fmt_12.2.0.bb</a><br>
@@ -1,14 +1,16 @@<br>
=C2=A0SUMMARY =3D &quot;open-source formatting library for C++&quot;<br>
=C2=A0DESCRIPTION =3D &quot;{fmt} is an open-source formatting library for =
C++. It can be used as a safe and fast alternative to (s)printf and iostrea=
ms.&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://fmt.dev" rel=3D"noreferrer" tar=
get=3D"_blank">https://fmt.dev</a>&quot;<br>
-LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Db9257785fc4f3803a4b71b76c1=
412729&quot;<br>
+LICENSE =3D &quot;MIT-with-fmt-exception&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D6ec080902ed8f82f5a97ed13e8=
042634 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://doc/LICENSE-exception;md5=3Db9257785fc4f3803a4b71b76c1412729&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/fmtlib/fmt;branch=3Dm=
aster;protocol=3Dhttps;tag=3D$%7BPV%7D" rel=3D"noreferrer" target=3D"_blank=
">github.com/fmtlib/fmt;branch=3Dmaster;protocol=3Dhttps;tag=3D${PV}</a> \<=
br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/fmtlib/fmt;branch=3Dm=
ain;protocol=3Dhttps;tag=3D$%7BPV%7D" rel=3D"noreferrer" target=3D"_blank">=
github.com/fmtlib/fmt;branch=3Dmain;protocol=3Dhttps;tag=3D${PV}</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Workaround-an-ABI-iss=
ue-in-spdlog.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-fallback-uint128-=
bitwise-not-4813.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRCREV =3D &quot;407c905e45ad75fc29bf0f9bb7c5c2fd3475976f&quot;<br>
+SRCREV =3D &quot;1be298e1bd68957e4cd352e1f676f00e07dcfb57&quot;<br>
<br>
=C2=A0inherit cmake ptest<br>
<br>
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#240296): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/240296" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/240296</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120143430/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120143430/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000aebbf006563036e6--

