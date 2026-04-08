Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0D891073C8A
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 10:02:43 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.102519.1775642554489650190
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 03:02:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BGacy6Cv;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38e0ef48ac0so22537491fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 03:02:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775642553; cv=none;
        d=google.com; s=arc-20240605;
        b=AFjrW/Zbi9s1R628fbIPyhjN4hqEOYnCPHlenYN8JBXFwQ6pzHXDTTe2X7lMgFIsOa
         96AzggqmpD5vWesYOpRJ3YVC3cN/Tq2QHY48GWrTNUC0ZqkQ7AAx/tBD5dXWSmsRAHTz
         ZHc1HnlNWq4j1fCrjFKxm/5E1zEvgLomjq+dm3O2kVqSyBX1QmunWWrtLMbv3Njzq2gI
         fkq4hWCdD9dCGmYxna/jk30IDXVakZiybtVpi6yLEP05+AwgLK8KcUp6Wt2lqO8jHVMu
         ZiAlTw7TkLGVKlRHP3Irwwt0yf10Dzc7TFzWBV982vuU0Gd6Hw+MFHaaJC9CElwa/kYi
         czHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gqru4AIpuYTp2hAK1yR/JX6jLd6wF+DJmGQlIOkwJQU=;
        fh=OwEGsuUTqZbR3bu1Dsw0Gs2ZTr4+cbCmfklWGCyCgU0=;
        b=DMUBCCkkz11kvKbSOG0+MrfbzzQPPzq4WJqvOzLvTen0KJTgAS46ctsJEj6uuySGqF
         2GXg0ahzXfjUYgG4HGFVaLCODPTQpoT718Mg+lVbMQ2Orm1hQ8gLLCy6xcmpTlv1upYP
         dn1hFro+lh8BcDfnUxLO6eYbf1cPspqayejLc26JEymGVDmZZ0Q+wXoz73CanUzdka92
         dr85gAqJ0erRNGtOXaTyIZ7/i4WQt0lEHviruh+WgUxEbtOHi0d2Qfr6lCq9U0l1Q9eU
         IEQXn6r4BaYbv+nqGTVRmKtTMIzz3NtNRfpa68iHPE5wrzRGlrac8sghCYM8n8iFkd9z
         Uxng==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775642553; x=1776247353; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gqru4AIpuYTp2hAK1yR/JX6jLd6wF+DJmGQlIOkwJQU=;
        b=BGacy6Cv130FaIEHq9OizBq2DJHnLpEgt44qvSJ7vaDuoi2fa0nx29sH3rF5Y+n7s2
         zgBdisPwqUkfANvxWo9vHkOAfYwSez4hmqi9YOxhVtPCQwkMLpcjDinDfsYo3svNeVeK
         lPMic3b6YExkW+7ehnJFxL0kiwr176QvK7gKpGZRpDXkm2ES3HWBsQZs2NWSccadDYBE
         XvWSUvOngSxg8Bkve5Bp7SV6Ubw9kXlC6jykV9kHBsTDFJEGjncFc4EzAMMeQX7XvWIn
         4MBpDCdNcwt2Be4CUDIS3AAX1CyCAMxIXC2k+DwUzjAMAzazjj/xUCbxiAP8hTE6RzCU
         gI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775642553; x=1776247353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gqru4AIpuYTp2hAK1yR/JX6jLd6wF+DJmGQlIOkwJQU=;
        b=HwXY454cED3r582+WltzTq6CPqLEkS0hiRUA5CDiLUmmdOk4T1ZZ0DaJ7XPcgwqGZw
         No6+pV0NrBYmWSsfpbEuHOB0UTWE3BeHWnGbc7GlSAlBoyOI1nruXbMa8iZaqHZyBHLt
         R5F8KwD4n7+dWtBDj05tabX1bMzWDqCGyCADjmaCnAT59G7bbKxw44Y+fRTtyL8eYxHX
         o+WeSbmbB0KdeWsP8f7l3RbudILQwcSbvj/WBiq3hryoVNNtEZx2CZPJueIFMQZrPtre
         Vg+grNhkNPZr7Q15sDSA48jcfqE5gqlZ8JXfdXZaVCH1MZ48sbQqTwQKYkY+tu27QFhK
         rBBQ==
X-Gm-Message-State: AOJu0Yyrp19wZodxiQU8dBxbwUzWj+5yXvoUPB9RVzROo+Wo4gpHYfGT
	WQArAbCDO6JxVd8lPkHd7BNb/0pr2/Fw16Yykrj9RJObnrKZyXu5dr0Om09DAL/itDNlCBvqd7G
	aVa0faWfzYUViq/WsnUAMoo9z3Or0ppg=
X-Gm-Gg: AeBDiet+QEgRvuXRqRhULtjWMn76ITQr4KHUkACl2FJhgqrxmsDX2B4fW9MsmeNIFm6
	CJzbfEO5yZhAiWyxQL5XcMtlJm/jlczjJGBrgJfvDi8rZhNCtdSKMNxzxUaYSbuKnPIZuBh/HEp
	e4J+FmRRGUJfQrWLCHoWouceBh6orc0FuSRnyqgUZC5MsmJVAP8r29V9T/m5zyhRTgB+IETWyjd
	Shr2RDURMdIinFCc2ITdzVyDreUckPNTpyfOlTYSwKKbXlA7/5Cy7iGY8F6KJrOFeIfIeGxSuwd
	gFtiKM5ekA==
X-Received: by 2002:a05:6512:108e:b0:5a2:7845:edf0 with SMTP id
 2adb3069b0e04-5a3375530abmr5924343e87.9.1775642552063; Wed, 08 Apr 2026
 03:02:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260407133521.840916-1-zboszor@gmail.com> <20260407133521.840916-2-zboszor@gmail.com>
In-Reply-To: <20260407133521.840916-2-zboszor@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 8 Apr 2026 12:02:19 +0200
X-Gm-Features: AQROBzDVYCs6nHzGcIEqvt7LAVaqKFyIwf_1a9UCgZeO4G107WogGisqwIZmcUs
Message-ID: <CA+chaQcJYjL+XkAtL=+Hr25cYV8kUOfT5-gWyxYRCYr6rA0LVg@mail.gmail.com>
Subject: Re: [whinlatter][PATCH v2 2/2] gcc: Backport a patch to fix build
 with GLIBC 2.43 on the host
To: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 10:02:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234826

I think this isn't caused by glibc-2.43, but gcc-16 on host, you should bac=
kport
https://git.openembedded.org/openembedded-core/commit/?id=3D9eabea38f0c17d4=
1d97284d63a25e45da3c9bbcc
from master (so it's clear it's the same commit).

ubuntu-26.04 has glibc-2.43 but uses gcc-15 by default, that's why I
haven't seen this one in whinlatter nor scarthgap builds with it yet.

Not sure why I cannot reproduce the binutils one in whinlatter, I've
just rebuilt both binutils-native as well as target binutils without
an issue, probably because of:
meta/recipes-devtools/binutils/binutils_2.45.bb:EXTRA_OECONF:append:toolcha=
in-clang
=3D " --disable-gprofng"
but that is also in scarthgap (and bitbake-getvar confirmed it in both
builds). Was it with target binutils or binutils-native?

On Tue, Apr 7, 2026 at 3:35=E2=80=AFPM Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9n=
yi <zboszor@gmail.com> wrote:
>
> Added a patch to fix gcc-cross-<arch> built against GLIBC 2.43
> on Fedora 44.
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-15.2.inc        |   1 +
>  ...dy-Make-it-buildable-by-C-11-to-C-26.patch | 262 ++++++++++++++++++
>  2 files changed, 263 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc/0001-libcody-Make-it-bu=
ildable-by-C-11-to-C-26.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-15.2.inc b/meta/recipes-devtoo=
ls/gcc/gcc-15.2.inc
> index d178b25487..aef22f8347 100644
> --- a/meta/recipes-devtools/gcc/gcc-15.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-15.2.inc
> @@ -73,6 +73,7 @@ SRC_URI =3D "${BASEURI} \
>             file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch=
 \
>             file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
>            file://0026-fix-pr90579-testcases.patch \
> +          file://0001-libcody-Make-it-buildable-by-C-11-to-C-26.patch \
>  "
>
>  UNPACKDIR =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
> diff --git a/meta/recipes-devtools/gcc/gcc/0001-libcody-Make-it-buildable=
-by-C-11-to-C-26.patch b/meta/recipes-devtools/gcc/gcc/0001-libcody-Make-it=
-buildable-by-C-11-to-C-26.patch
> new file mode 100644
> index 0000000000..676f1500e7
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc/0001-libcody-Make-it-buildable-by-C-1=
1-to-C-26.patch
> @@ -0,0 +1,262 @@
> +From 1f0224e8ddb3d3d0bf4c7a11769b193a4df5cc37 Mon Sep 17 00:00:00 2001
> +From: Jakub Jelinek <jakub@redhat.com>
> +Date: Fri, 21 Nov 2025 16:25:58 +0100
> +Subject: [PATCH] libcody: Make it buildable by C++11 to C++26
> +
> +The following builds with -std=3Dc++11 and c++14 and c++17 and c++20 and=
 c++23
> +and c++26.
> +
> +I see the u8 string literals are mixed e.g. with strerror, so in
> +-fexec-charset=3DIBM1047 there will still be garbage, so am not 100% sur=
e if
> +the u8 literals everywhere are worth it either.
> +
> +2025-11-21  Jakub Jelinek  <jakub@redhat.com>
> +
> +       * cody.hh (S2C): For __cpp_char8_t >=3D 201811 use char8_t instea=
d of
> +       char in argument type.
> +       (MessageBuffer::Space): Revert 2025-11-15 change.
> +       (MessageBuffer::Append): For __cpp_char8_t >=3D 201811 add overlo=
ad
> +       with char8_t const * type of first argument.
> +       (Packet::Packet): Similarly for first argument.
> +       * client.cc (CommunicationError, Client::ProcessResponse,
> +       Client::Connect, ConnectResponse, PathnameResponse, OKResponse,
> +       IncludeTranslateResponse): Cast u8 string literals to (const char=
 *)
> +       where needed.
> +       * server.cc (Server::ProcessRequests, ConnectRequest): Likewise.
> +
> +(cherry picked from commit 07a767c7a50d1daae8ef7d4aba73fe53ad40c0b7)
> +
> +Signed-off-by: Jakub Jelinek <jakub@redhat.com>
> +Upstream-Status: Backport
> +---
> + libcody/client.cc | 36 +++++++++++++++++++-----------------
> + libcody/cody.hh   | 22 ++++++++++++++++++++++
> + libcody/server.cc | 28 ++++++++++++++--------------
> + 3 files changed, 55 insertions(+), 31 deletions(-)
> +
> +diff --git a/libcody/client.cc b/libcody/client.cc
> +index ae69d190cb7..147fecdbe50 100644
> +--- a/libcody/client.cc
> ++++ b/libcody/client.cc
> +@@ -97,7 +97,7 @@ int Client::CommunicateWithServer ()
> +
> + static Packet CommunicationError (int err)
> + {
> +-  std::string e {u8"communication error:"};
> ++  std::string e {(const char *) u8"communication error:"};
> +   e.append (strerror (err));
> +
> +   return Packet (Client::PC_ERROR, std::move (e));
> +@@ -110,33 +110,34 @@ Packet Client::ProcessResponse (std::vector<std::s=
tring> &words,
> +     {
> +       if (e =3D=3D EINVAL)
> +       {
> +-        std::string msg (u8"malformed string '");
> ++        std::string msg ((const char *) u8"malformed string '");
> +         msg.append (words[0]);
> +-        msg.append (u8"'");
> ++        msg.append ((const char *) u8"'");
> +         return Packet (Client::PC_ERROR, std::move (msg));
> +       }
> +       else
> +-      return Packet (Client::PC_ERROR, u8"missing response");
> ++      return Packet (Client::PC_ERROR, (const char *) u8"missing respon=
se");
> +     }
> +
> +   Assert (!words.empty ());
> +-  if (words[0] =3D=3D u8"ERROR")
> ++  if (words[0] =3D=3D (const char *) u8"ERROR")
> +     return Packet (Client::PC_ERROR,
> +-                 words.size () =3D=3D 2 ? words[1]: u8"malformed error =
response");
> ++                 words.size () =3D=3D 2 ? words[1]
> ++                 : (const char *) u8"malformed error response");
> +
> +   if (isLast && !read.IsAtEnd ())
> +     return Packet (Client::PC_ERROR,
> +-                 std::string (u8"unexpected extra response"));
> ++                 std::string ((const char *) u8"unexpected extra respon=
se"));
> +
> +   Assert (code < Detail::RC_HWM);
> +   Packet result (responseTable[code] (words));
> +   result.SetRequest (code);
> +   if (result.GetCode () =3D=3D Client::PC_ERROR && result.GetString ().=
empty ())
> +     {
> +-      std::string msg {u8"malformed response '"};
> ++      std::string msg {(const char *) u8"malformed response '"};
> +
> +       read.LexedLine (msg);
> +-      msg.append (u8"'");
> ++      msg.append ((const char *) u8"'");
> +       result.GetString () =3D std::move (msg);
> +     }
> +   else if (result.GetCode () =3D=3D Client::PC_CONNECT)
> +@@ -199,7 +200,7 @@ Packet Client::Connect (char const *agent, char cons=
t *ident,
> +                         size_t alen, size_t ilen)
> + {
> +   write.BeginLine ();
> +-  write.AppendWord (u8"HELLO");
> ++  write.AppendWord ((const char *) u8"HELLO");
> +   write.AppendInteger (Version);
> +   write.AppendWord (agent, true, alen);
> +   write.AppendWord (ident, true, ilen);
> +@@ -211,7 +212,8 @@ Packet Client::Connect (char const *agent, char cons=
t *ident,
> + // HELLO $version $agent [$flags]
> + Packet ConnectResponse (std::vector<std::string> &words)
> + {
> +-  if (words[0] =3D=3D u8"HELLO" && (words.size () =3D=3D 3 || words.siz=
e () =3D=3D 4))
> ++  if (words[0] =3D=3D (const char *) u8"HELLO"
> ++      && (words.size () =3D=3D 3 || words.size () =3D=3D 4))
> +     {
> +       char *eptr;
> +       unsigned long val =3D strtoul (words[1].c_str (), &eptr, 10);
> +@@ -247,7 +249,7 @@ Packet Client::ModuleRepo ()
> + // PATHNAME $dir | ERROR
> + Packet PathnameResponse (std::vector<std::string> &words)
> + {
> +-  if (words[0] =3D=3D u8"PATHNAME" && words.size () =3D=3D 2)
> ++  if (words[0] =3D=3D (const char *) u8"PATHNAME" && words.size () =3D=
=3D 2)
> +     return Packet (Client::PC_PATHNAME, std::move (words[1]));
> +
> +   return Packet (Client::PC_ERROR, u8"");
> +@@ -256,7 +258,7 @@ Packet PathnameResponse (std::vector<std::string> &w=
ords)
> + // OK or ERROR
> + Packet OKResponse (std::vector<std::string> &words)
> + {
> +-  if (words[0] =3D=3D u8"OK")
> ++  if (words[0] =3D=3D (const char *) u8"OK")
> +     return Packet (Client::PC_OK);
> +   else
> +     return Packet (Client::PC_ERROR,
> +@@ -319,11 +321,11 @@ Packet Client::IncludeTranslate (char const *inclu=
de, Flags flags, size_t ilen)
> + // PATHNAME $cmifile
> + Packet IncludeTranslateResponse (std::vector<std::string> &words)
> + {
> +-  if (words[0] =3D=3D u8"BOOL" && words.size () =3D=3D 2)
> ++  if (words[0] =3D=3D (const char *) u8"BOOL" && words.size () =3D=3D 2=
)
> +     {
> +-      if (words[1] =3D=3D u8"FALSE")
> +-      return Packet (Client::PC_BOOL, 0);
> +-      else if (words[1] =3D=3D u8"TRUE")
> ++      if (words[1] =3D=3D (const char *) u8"FALSE")
> ++      return Packet (Client::PC_BOOL);
> ++      else if (words[1] =3D=3D (const char *) u8"TRUE")
> +       return Packet (Client::PC_BOOL, 1);
> +       else
> +       return Packet (Client::PC_ERROR, u8"");
> +diff --git a/libcody/cody.hh b/libcody/cody.hh
> +index 789ce9e70b7..93bce93aa94 100644
> +--- a/libcody/cody.hh
> ++++ b/libcody/cody.hh
> +@@ -47,12 +47,21 @@ namespace Detail  {
> +
> + // C++11 doesn't have utf8 character literals :(
> +
> ++#if __cpp_char8_t >=3D 201811
> ++template<unsigned I>
> ++constexpr char S2C (char8_t const (&s)[I])
> ++{
> ++  static_assert (I =3D=3D 2, "only single octet strings may be converte=
d");
> ++  return s[0];
> ++}
> ++#else
> + template<unsigned I>
> + constexpr char S2C (char const (&s)[I])
> + {
> +   static_assert (I =3D=3D 2, "only single octet strings may be converte=
d");
> +   return s[0];
> + }
> ++#endif
> +
> + /// Internal buffering class.  Used to concatenate outgoing messages
> + /// and Lex incoming ones.
> +@@ -123,6 +132,13 @@ public:
> +       Space ();
> +     Append (str, maybe_quote, len);
> +   }
> ++#if __cpp_char8_t >=3D 201811
> ++  void AppendWord (char8_t const *str, bool maybe_quote =3D false,
> ++                 size_t len =3D ~size_t (0))
> ++  {
> ++    AppendWord ((const char *) str, maybe_quote, len);
> ++  }
> ++#endif
> +   /// Add a word as with AppendWord
> +   /// @param str the string to append
> +   /// @param maybe_quote string might need quoting, as for Append
> +@@ -264,6 +280,12 @@ public:
> +     : string (s), cat (STRING), code (c)
> +   {
> +   }
> ++#if __cpp_char8_t >=3D 201811
> ++  Packet (unsigned c, const char8_t *s)
> ++    : string ((const char *) s), cat (STRING), code (c)
> ++  {
> ++  }
> ++#endif
> +   Packet (unsigned c, std::vector<std::string> &&v)
> +     : vector (std::move (v)), cat (VECTOR), code (c)
> +   {
> +diff --git a/libcody/server.cc b/libcody/server.cc
> +index e2fa069bb93..c18469fae84 100644
> +--- a/libcody/server.cc
> ++++ b/libcody/server.cc
> +@@ -36,12 +36,12 @@ static RequestPair
> +   const requestTable[Detail::RC_HWM] =3D
> +   {
> +     // Same order as enum RequestCode
> +-    RequestPair {u8"HELLO", nullptr},
> +-    RequestPair {u8"MODULE-REPO", ModuleRepoRequest},
> +-    RequestPair {u8"MODULE-EXPORT", ModuleExportRequest},
> +-    RequestPair {u8"MODULE-IMPORT", ModuleImportRequest},
> +-    RequestPair {u8"MODULE-COMPILED", ModuleCompiledRequest},
> +-    RequestPair {u8"INCLUDE-TRANSLATE", IncludeTranslateRequest},
> ++    RequestPair {(const char *) u8"HELLO", nullptr},
> ++    RequestPair {(const char *) u8"MODULE-REPO", ModuleRepoRequest},
> ++    RequestPair {(const char *) u8"MODULE-EXPORT", ModuleExportRequest}=
,
> ++    RequestPair {(const char *) u8"MODULE-IMPORT", ModuleImportRequest}=
,
> ++    RequestPair {(const char *) u8"MODULE-COMPILED", ModuleCompiledRequ=
est},
> ++    RequestPair {(const char *) u8"INCLUDE-TRANSLATE", IncludeTranslate=
Request},
> +   };
> + }
> +
> +@@ -135,21 +135,21 @@ void Server::ProcessRequests (void)
> +         std::string msg;
> +
> +         if (err > 0)
> +-          msg =3D u8"error processing '";
> ++          msg =3D (const char *) u8"error processing '";
> +         else if (ix >=3D Detail::RC_HWM)
> +-          msg =3D u8"unrecognized '";
> ++          msg =3D (const char *) u8"unrecognized '";
> +         else if (IsConnected () && ix =3D=3D Detail::RC_CONNECT)
> +-          msg =3D u8"already connected '";
> ++          msg =3D (const char *) u8"already connected '";
> +         else if (!IsConnected () && ix !=3D Detail::RC_CONNECT)
> +-          msg =3D u8"not connected '";
> ++          msg =3D (const char *) u8"not connected '";
> +         else
> +-          msg =3D u8"malformed '";
> ++          msg =3D (const char *) u8"malformed '";
> +
> +         read.LexedLine (msg);
> +-        msg.append (u8"'");
> ++        msg.append ((const char *) u8"'");
> +         if (err > 0)
> +           {
> +-            msg.append (u8" ");
> ++            msg.append ((const char *) u8" ");
> +             msg.append (strerror (err));
> +           }
> +         resolver->ErrorResponse (this, std::move (msg));
> +@@ -176,7 +176,7 @@ Resolver *ConnectRequest (Server *s, Resolver *r,
> +     return nullptr;
> +
> +   if (words.size () =3D=3D 3)
> +-    words.emplace_back (u8"");
> ++    words.emplace_back ((const char *) u8"");
> +   unsigned version =3D ParseUnsigned (words[1]);
> +   if (version =3D=3D ~0u)
> +     return nullptr;
> +--
> +2.53.0
> +
> --
> 2.53.0
>

