Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAF241073C8D
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 10:21:13 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.102950.1775643666000353464
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 03:21:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NUp/M17g;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59de8155501so6926164e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 03:21:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775643664; cv=none;
        d=google.com; s=arc-20240605;
        b=kYta4fCPXsZ+DAIwN4iLHdpFYfLiBqqNS99ZqXp0k1opigDEb/Fj9KxnSOJNh/nIKR
         Ll4WtNOC/MZ1y5Ipyuknm7Azm2gFiXsQYhUki88RaOEskKTkJY1fBotTMDXztGVmwjXa
         6AOqI1VlLRNotAHndPjvkNiKEYtKPMLBel/LggTRYANMe3h7U3Gbq1Rup264rEzmQbC8
         XZP37Z8B4Ru60FiI7VRQz0kxJTDteuM3O4YV+WwJ2qlz5QIWZRnhUbPt/kCxdjE0ZK5R
         k0OScb2pJjP47YEdUEUheZb5kRK6kyo+q4GhSAiKqBX/K/p3pfMAkiYZ3Ck3OSNyr13m
         JyMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MGA/v4X8JfJWL7qDkSGgp+02TKtZCGZ7tf7pF4C5iIw=;
        fh=hDv+IDhV5n99P71CDojgS7Qpc9vW/oSEanHgLBrpSXI=;
        b=JFxyfJWdawlnjwrwRuJN6F8eIQlcrOnuG6yE7WZ/8/brjP1Ku46s1hOcx4MfIidUcT
         YTnuis3qtVqC43Hh0gghs01X32BW3TdcagJ0jIH8yI8kkk4Eq6F5ildO7YEjNBZzODd9
         xKy48CiLSIfIm6zjddo1BAhtSbFAiSapsHXvIS7syAPIn33q8keI6NIIw3qjf1NKTdRi
         czN/36pMpfiIwSvXhQoK0ldi+DoSm1cpWJSQuwBOUMTayjfPfnAQKXKQ/hw6t7NihD2o
         i8jGxFWUwN4tjlQM+RGrJEfcmAL02I1wSkULjW44zfMc0OFjaso4+HIW0O++R5tnMl15
         3OHg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775643664; x=1776248464; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGA/v4X8JfJWL7qDkSGgp+02TKtZCGZ7tf7pF4C5iIw=;
        b=NUp/M17ggkoVIOegFybweMcUYEPVxlQFvix0Zo12n3neI/QwEyUMJvpDA5+n8ObZzD
         4qAO/Rzi849ZRmvz97+7QEKGp1jy5z6NIFUtPCDsRq5qlZHDs4yDSMq+lRIO4KwbrAQP
         gc7gd8yY7B5l6eGAKPPohSMKzAQ43qfqEctnnltVGxFc64tioN2ndfkGI7QF20c/6NQ2
         SVnroQNiw3+mVSkIBT5JdxL53tLuwZ48clXzZRakNBmxlgQWSNw8R35hBzBUg93RImUt
         S52aKyJdeSmB6AhcDz8s173cbxWJSeHTOx6vM5dxazzN9Lq1Jo3PybLR7Tdhfd+1dJ+U
         tYBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775643664; x=1776248464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MGA/v4X8JfJWL7qDkSGgp+02TKtZCGZ7tf7pF4C5iIw=;
        b=cfxlzpgZZtpdW4GCNINCJAKclg/N6BVxuj0UC+2V02NoV9GTmbD6Cfc6fprrW2do8R
         /rF6eU6PMr4zkAZnZZl+RQ55pymkFtFBJEcIKpCoQEu6y12o43W3rU4LuUEPn0mc86jm
         n0bpdVNdu459kLva7UCfYgVh4Zr3CRKiWxr9UKQxC+NkqNMoiXcrk+rE1KjWfbH9jvPg
         VtvNpvVdUrLgQndHjPDJDiR3FUskk7YDpN8It1YiRvfAssBnG4rY1dOcSbrIJPo495sD
         uVb96z+q1VxoodEjg1wSnXqy8be4/ba033fVfHqEEhbv+NdH/Foj9pUw7RrEv4Ad5EQa
         QdPA==
X-Forwarded-Encrypted: i=1; AJvYcCXxU794BOBJ2mcgnTFXhU88fmYaLUhYLT2TFCajXCtyMbD03HMUkur9OfLy2KpAUqCwAIvwbbt9ankidn6PNMiP2Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy9vqzUpMOIEZ8Q1yXGjsJbs3zZgLKJraO6EjakDCHJ6CHBDclZ
	y9jjnmRVMADu8+gJObT2PH+PIU+f9RhRp5HUdqGaEGo28P3IeUZJwspenbfoVyTmW1tY9i7QfYa
	cPEyXaZBN/futYCbtp8TVy/B9MShgzgw=
X-Gm-Gg: AeBDiesAA5RWveMQ1KB6qy+x5zdkr2407LpBQ1Y7iOzIat0HFtn1C6kGvuQGBcc9/nd
	zHb3TqcSPjaXeIq2WwvO+I7H9etLBctuz3ny/GwV8NMy/bpN/AJadP1wOmHPnNbPsiCo5dc0w1H
	iREnSid1/9jsks82Su8EPT/E30uDyA9qCTU64LS4BCcKTyF+y2n/FSW3QzcOy2yhVxH5hCmPE/S
	7QHIY+cNdhY0Lm4DGfSHi+smg3CaStQfhrUlPcuBMeIjHfXxC9HmjMcHOxh7+1n/NHvKacnBFoL
	GXzh/XSYxw==
X-Received: by 2002:a05:6512:3503:b0:5a3:d381:2a88 with SMTP id
 2adb3069b0e04-5a3d3812bc4mr5184388e87.37.1775643663477; Wed, 08 Apr 2026
 03:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260407133521.840916-1-zboszor@gmail.com> <20260407133521.840916-2-zboszor@gmail.com>
 <18A4597EF8495640.777565@lists.openembedded.org>
In-Reply-To: <18A4597EF8495640.777565@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 8 Apr 2026 12:20:50 +0200
X-Gm-Features: AQROBzChiXittuYut3WnobDGcLWdONKCR7jcuOs6Mn0oWu6WLLfAY5jAqcH0inI
Message-ID: <CA+chaQcazb03mwLEKw6nLKiAjyxSn0H2OQQNt3TyXRtH2rMkRg@mail.gmail.com>
Subject: Re: [OE-core] [whinlatter][PATCH v2 2/2] gcc: Backport a patch to fix
 build with GLIBC 2.43 on the host
To: martin.jansa@gmail.com
Cc: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 10:21:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234827

On Wed, Apr 8, 2026 at 12:02=E2=80=AFPM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> I think this isn't caused by glibc-2.43, but gcc-16 on host, you should b=
ackport
> https://git.openembedded.org/openembedded-core/commit/?id=3D9eabea38f0c17=
d41d97284d63a25e45da3c9bbcc
> from master (so it's clear it's the same commit).
>
> ubuntu-26.04 has glibc-2.43 but uses gcc-15 by default, that's why I
> haven't seen this one in whinlatter nor scarthgap builds with it yet.
>
> Not sure why I cannot reproduce the binutils one in whinlatter, I've
> just rebuilt both binutils-native as well as target binutils without
> an issue, probably because of:
> meta/recipes-devtools/binutils/binutils_2.45.bb:EXTRA_OECONF:append:toolc=
hain-clang
> =3D " --disable-gprofng"
> but that is also in scarthgap (and bitbake-getvar confirmed it in both
> builds). Was it with target binutils or binutils-native?

I take it back, I've checked --disable-gprofng in target build, but
then reverted my oe-core/scarthgap change to see it failing in
binutils-native and after checking binutils-native I see
--disable-gprofng only in scarthgap and that's indeed from
:append:toolchain-clang which in scarthgap affects both target and
native build while in whinlatter and newer I'm using toolchain-gcc for
native and toolchain-clang only for target.

Removing
meta/recipes-devtools/binutils/binutils_2.45.bb:EXTRA_OECONF:append:toolcha=
in-clang
=3D " --disable-gprofng"
reproduces the issue in whinlatter. And cherry-picking the fix I've
sent for scarthgap fixes it for me as well (your commit backports the
same upstream change, so I believe would work as well).

I have added both into:
https://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/whinl=
atter

Thanks


> > On Tue, Apr 7, 2026 at 3:35=E2=80=AFPM Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=
=A9nyi <zboszor@gmail.com> wrote:
> >
> > Added a patch to fix gcc-cross-<arch> built against GLIBC 2.43
> > on Fedora 44.
> >
> > Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.co=
m>
> > ---
> >  meta/recipes-devtools/gcc/gcc-15.2.inc        |   1 +
> >  ...dy-Make-it-buildable-by-C-11-to-C-26.patch | 262 ++++++++++++++++++
> >  2 files changed, 263 insertions(+)
> >  create mode 100644 meta/recipes-devtools/gcc/gcc/0001-libcody-Make-it-=
buildable-by-C-11-to-C-26.patch
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc-15.2.inc b/meta/recipes-devt=
ools/gcc/gcc-15.2.inc
> > index d178b25487..aef22f8347 100644
> > --- a/meta/recipes-devtools/gcc/gcc-15.2.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-15.2.inc
> > @@ -73,6 +73,7 @@ SRC_URI =3D "${BASEURI} \
> >             file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.pat=
ch \
> >             file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
> >            file://0026-fix-pr90579-testcases.patch \
> > +          file://0001-libcody-Make-it-buildable-by-C-11-to-C-26.patch =
\
> >  "
> >
> >  UNPACKDIR =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
> > diff --git a/meta/recipes-devtools/gcc/gcc/0001-libcody-Make-it-buildab=
le-by-C-11-to-C-26.patch b/meta/recipes-devtools/gcc/gcc/0001-libcody-Make-=
it-buildable-by-C-11-to-C-26.patch
> > new file mode 100644
> > index 0000000000..676f1500e7
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc/0001-libcody-Make-it-buildable-by-C=
-11-to-C-26.patch
> > @@ -0,0 +1,262 @@
> > +From 1f0224e8ddb3d3d0bf4c7a11769b193a4df5cc37 Mon Sep 17 00:00:00 2001
> > +From: Jakub Jelinek <jakub@redhat.com>
> > +Date: Fri, 21 Nov 2025 16:25:58 +0100
> > +Subject: [PATCH] libcody: Make it buildable by C++11 to C++26
> > +
> > +The following builds with -std=3Dc++11 and c++14 and c++17 and c++20 a=
nd c++23
> > +and c++26.
> > +
> > +I see the u8 string literals are mixed e.g. with strerror, so in
> > +-fexec-charset=3DIBM1047 there will still be garbage, so am not 100% s=
ure if
> > +the u8 literals everywhere are worth it either.
> > +
> > +2025-11-21  Jakub Jelinek  <jakub@redhat.com>
> > +
> > +       * cody.hh (S2C): For __cpp_char8_t >=3D 201811 use char8_t inst=
ead of
> > +       char in argument type.
> > +       (MessageBuffer::Space): Revert 2025-11-15 change.
> > +       (MessageBuffer::Append): For __cpp_char8_t >=3D 201811 add over=
load
> > +       with char8_t const * type of first argument.
> > +       (Packet::Packet): Similarly for first argument.
> > +       * client.cc (CommunicationError, Client::ProcessResponse,
> > +       Client::Connect, ConnectResponse, PathnameResponse, OKResponse,
> > +       IncludeTranslateResponse): Cast u8 string literals to (const ch=
ar *)
> > +       where needed.
> > +       * server.cc (Server::ProcessRequests, ConnectRequest): Likewise=
.
> > +
> > +(cherry picked from commit 07a767c7a50d1daae8ef7d4aba73fe53ad40c0b7)
> > +
> > +Signed-off-by: Jakub Jelinek <jakub@redhat.com>
> > +Upstream-Status: Backport
> > +---
> > + libcody/client.cc | 36 +++++++++++++++++++-----------------
> > + libcody/cody.hh   | 22 ++++++++++++++++++++++
> > + libcody/server.cc | 28 ++++++++++++++--------------
> > + 3 files changed, 55 insertions(+), 31 deletions(-)
> > +
> > +diff --git a/libcody/client.cc b/libcody/client.cc
> > +index ae69d190cb7..147fecdbe50 100644
> > +--- a/libcody/client.cc
> > ++++ b/libcody/client.cc
> > +@@ -97,7 +97,7 @@ int Client::CommunicateWithServer ()
> > +
> > + static Packet CommunicationError (int err)
> > + {
> > +-  std::string e {u8"communication error:"};
> > ++  std::string e {(const char *) u8"communication error:"};
> > +   e.append (strerror (err));
> > +
> > +   return Packet (Client::PC_ERROR, std::move (e));
> > +@@ -110,33 +110,34 @@ Packet Client::ProcessResponse (std::vector<std:=
:string> &words,
> > +     {
> > +       if (e =3D=3D EINVAL)
> > +       {
> > +-        std::string msg (u8"malformed string '");
> > ++        std::string msg ((const char *) u8"malformed string '");
> > +         msg.append (words[0]);
> > +-        msg.append (u8"'");
> > ++        msg.append ((const char *) u8"'");
> > +         return Packet (Client::PC_ERROR, std::move (msg));
> > +       }
> > +       else
> > +-      return Packet (Client::PC_ERROR, u8"missing response");
> > ++      return Packet (Client::PC_ERROR, (const char *) u8"missing resp=
onse");
> > +     }
> > +
> > +   Assert (!words.empty ());
> > +-  if (words[0] =3D=3D u8"ERROR")
> > ++  if (words[0] =3D=3D (const char *) u8"ERROR")
> > +     return Packet (Client::PC_ERROR,
> > +-                 words.size () =3D=3D 2 ? words[1]: u8"malformed erro=
r response");
> > ++                 words.size () =3D=3D 2 ? words[1]
> > ++                 : (const char *) u8"malformed error response");
> > +
> > +   if (isLast && !read.IsAtEnd ())
> > +     return Packet (Client::PC_ERROR,
> > +-                 std::string (u8"unexpected extra response"));
> > ++                 std::string ((const char *) u8"unexpected extra resp=
onse"));
> > +
> > +   Assert (code < Detail::RC_HWM);
> > +   Packet result (responseTable[code] (words));
> > +   result.SetRequest (code);
> > +   if (result.GetCode () =3D=3D Client::PC_ERROR && result.GetString (=
).empty ())
> > +     {
> > +-      std::string msg {u8"malformed response '"};
> > ++      std::string msg {(const char *) u8"malformed response '"};
> > +
> > +       read.LexedLine (msg);
> > +-      msg.append (u8"'");
> > ++      msg.append ((const char *) u8"'");
> > +       result.GetString () =3D std::move (msg);
> > +     }
> > +   else if (result.GetCode () =3D=3D Client::PC_CONNECT)
> > +@@ -199,7 +200,7 @@ Packet Client::Connect (char const *agent, char co=
nst *ident,
> > +                         size_t alen, size_t ilen)
> > + {
> > +   write.BeginLine ();
> > +-  write.AppendWord (u8"HELLO");
> > ++  write.AppendWord ((const char *) u8"HELLO");
> > +   write.AppendInteger (Version);
> > +   write.AppendWord (agent, true, alen);
> > +   write.AppendWord (ident, true, ilen);
> > +@@ -211,7 +212,8 @@ Packet Client::Connect (char const *agent, char co=
nst *ident,
> > + // HELLO $version $agent [$flags]
> > + Packet ConnectResponse (std::vector<std::string> &words)
> > + {
> > +-  if (words[0] =3D=3D u8"HELLO" && (words.size () =3D=3D 3 || words.s=
ize () =3D=3D 4))
> > ++  if (words[0] =3D=3D (const char *) u8"HELLO"
> > ++      && (words.size () =3D=3D 3 || words.size () =3D=3D 4))
> > +     {
> > +       char *eptr;
> > +       unsigned long val =3D strtoul (words[1].c_str (), &eptr, 10);
> > +@@ -247,7 +249,7 @@ Packet Client::ModuleRepo ()
> > + // PATHNAME $dir | ERROR
> > + Packet PathnameResponse (std::vector<std::string> &words)
> > + {
> > +-  if (words[0] =3D=3D u8"PATHNAME" && words.size () =3D=3D 2)
> > ++  if (words[0] =3D=3D (const char *) u8"PATHNAME" && words.size () =
=3D=3D 2)
> > +     return Packet (Client::PC_PATHNAME, std::move (words[1]));
> > +
> > +   return Packet (Client::PC_ERROR, u8"");
> > +@@ -256,7 +258,7 @@ Packet PathnameResponse (std::vector<std::string> =
&words)
> > + // OK or ERROR
> > + Packet OKResponse (std::vector<std::string> &words)
> > + {
> > +-  if (words[0] =3D=3D u8"OK")
> > ++  if (words[0] =3D=3D (const char *) u8"OK")
> > +     return Packet (Client::PC_OK);
> > +   else
> > +     return Packet (Client::PC_ERROR,
> > +@@ -319,11 +321,11 @@ Packet Client::IncludeTranslate (char const *inc=
lude, Flags flags, size_t ilen)
> > + // PATHNAME $cmifile
> > + Packet IncludeTranslateResponse (std::vector<std::string> &words)
> > + {
> > +-  if (words[0] =3D=3D u8"BOOL" && words.size () =3D=3D 2)
> > ++  if (words[0] =3D=3D (const char *) u8"BOOL" && words.size () =3D=3D=
 2)
> > +     {
> > +-      if (words[1] =3D=3D u8"FALSE")
> > +-      return Packet (Client::PC_BOOL, 0);
> > +-      else if (words[1] =3D=3D u8"TRUE")
> > ++      if (words[1] =3D=3D (const char *) u8"FALSE")
> > ++      return Packet (Client::PC_BOOL);
> > ++      else if (words[1] =3D=3D (const char *) u8"TRUE")
> > +       return Packet (Client::PC_BOOL, 1);
> > +       else
> > +       return Packet (Client::PC_ERROR, u8"");
> > +diff --git a/libcody/cody.hh b/libcody/cody.hh
> > +index 789ce9e70b7..93bce93aa94 100644
> > +--- a/libcody/cody.hh
> > ++++ b/libcody/cody.hh
> > +@@ -47,12 +47,21 @@ namespace Detail  {
> > +
> > + // C++11 doesn't have utf8 character literals :(
> > +
> > ++#if __cpp_char8_t >=3D 201811
> > ++template<unsigned I>
> > ++constexpr char S2C (char8_t const (&s)[I])
> > ++{
> > ++  static_assert (I =3D=3D 2, "only single octet strings may be conver=
ted");
> > ++  return s[0];
> > ++}
> > ++#else
> > + template<unsigned I>
> > + constexpr char S2C (char const (&s)[I])
> > + {
> > +   static_assert (I =3D=3D 2, "only single octet strings may be conver=
ted");
> > +   return s[0];
> > + }
> > ++#endif
> > +
> > + /// Internal buffering class.  Used to concatenate outgoing messages
> > + /// and Lex incoming ones.
> > +@@ -123,6 +132,13 @@ public:
> > +       Space ();
> > +     Append (str, maybe_quote, len);
> > +   }
> > ++#if __cpp_char8_t >=3D 201811
> > ++  void AppendWord (char8_t const *str, bool maybe_quote =3D false,
> > ++                 size_t len =3D ~size_t (0))
> > ++  {
> > ++    AppendWord ((const char *) str, maybe_quote, len);
> > ++  }
> > ++#endif
> > +   /// Add a word as with AppendWord
> > +   /// @param str the string to append
> > +   /// @param maybe_quote string might need quoting, as for Append
> > +@@ -264,6 +280,12 @@ public:
> > +     : string (s), cat (STRING), code (c)
> > +   {
> > +   }
> > ++#if __cpp_char8_t >=3D 201811
> > ++  Packet (unsigned c, const char8_t *s)
> > ++    : string ((const char *) s), cat (STRING), code (c)
> > ++  {
> > ++  }
> > ++#endif
> > +   Packet (unsigned c, std::vector<std::string> &&v)
> > +     : vector (std::move (v)), cat (VECTOR), code (c)
> > +   {
> > +diff --git a/libcody/server.cc b/libcody/server.cc
> > +index e2fa069bb93..c18469fae84 100644
> > +--- a/libcody/server.cc
> > ++++ b/libcody/server.cc
> > +@@ -36,12 +36,12 @@ static RequestPair
> > +   const requestTable[Detail::RC_HWM] =3D
> > +   {
> > +     // Same order as enum RequestCode
> > +-    RequestPair {u8"HELLO", nullptr},
> > +-    RequestPair {u8"MODULE-REPO", ModuleRepoRequest},
> > +-    RequestPair {u8"MODULE-EXPORT", ModuleExportRequest},
> > +-    RequestPair {u8"MODULE-IMPORT", ModuleImportRequest},
> > +-    RequestPair {u8"MODULE-COMPILED", ModuleCompiledRequest},
> > +-    RequestPair {u8"INCLUDE-TRANSLATE", IncludeTranslateRequest},
> > ++    RequestPair {(const char *) u8"HELLO", nullptr},
> > ++    RequestPair {(const char *) u8"MODULE-REPO", ModuleRepoRequest},
> > ++    RequestPair {(const char *) u8"MODULE-EXPORT", ModuleExportReques=
t},
> > ++    RequestPair {(const char *) u8"MODULE-IMPORT", ModuleImportReques=
t},
> > ++    RequestPair {(const char *) u8"MODULE-COMPILED", ModuleCompiledRe=
quest},
> > ++    RequestPair {(const char *) u8"INCLUDE-TRANSLATE", IncludeTransla=
teRequest},
> > +   };
> > + }
> > +
> > +@@ -135,21 +135,21 @@ void Server::ProcessRequests (void)
> > +         std::string msg;
> > +
> > +         if (err > 0)
> > +-          msg =3D u8"error processing '";
> > ++          msg =3D (const char *) u8"error processing '";
> > +         else if (ix >=3D Detail::RC_HWM)
> > +-          msg =3D u8"unrecognized '";
> > ++          msg =3D (const char *) u8"unrecognized '";
> > +         else if (IsConnected () && ix =3D=3D Detail::RC_CONNECT)
> > +-          msg =3D u8"already connected '";
> > ++          msg =3D (const char *) u8"already connected '";
> > +         else if (!IsConnected () && ix !=3D Detail::RC_CONNECT)
> > +-          msg =3D u8"not connected '";
> > ++          msg =3D (const char *) u8"not connected '";
> > +         else
> > +-          msg =3D u8"malformed '";
> > ++          msg =3D (const char *) u8"malformed '";
> > +
> > +         read.LexedLine (msg);
> > +-        msg.append (u8"'");
> > ++        msg.append ((const char *) u8"'");
> > +         if (err > 0)
> > +           {
> > +-            msg.append (u8" ");
> > ++            msg.append ((const char *) u8" ");
> > +             msg.append (strerror (err));
> > +           }
> > +         resolver->ErrorResponse (this, std::move (msg));
> > +@@ -176,7 +176,7 @@ Resolver *ConnectRequest (Server *s, Resolver *r,
> > +     return nullptr;
> > +
> > +   if (words.size () =3D=3D 3)
> > +-    words.emplace_back (u8"");
> > ++    words.emplace_back ((const char *) u8"");
> > +   unsigned version =3D ParseUnsigned (words[1]);
> > +   if (version =3D=3D ~0u)
> > +     return nullptr;
> > +--
> > +2.53.0
> > +
> > --
> > 2.53.0
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#234826): https://lists.openembedded.org/g/openembedde=
d-core/message/234826
> Mute This Topic: https://lists.openembedded.org/mt/118707561/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

