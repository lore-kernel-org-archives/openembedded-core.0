Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BE8EF8D74D
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 14:05:35 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15040.1776348327787483008
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 07:05:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=MUz5hH/e;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4887fd35e60so55627645e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 07:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776348326; x=1776953126; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lxt3jbcmtBMd1q1Kmw4iv9q8S5afkBck3JCiYF0bKVQ=;
        b=MUz5hH/eIgJZgV46URAIxD/uGaIgCxk/BlStVO+2Ie4Gs6l6+MbxXVpV0x8nuSQxzo
         sNRY6POmHfKKtYtNSnj8onvuGqdts0j2b7rUjaMhexV4axILa15Ct+tlHbrldiOlsZ3q
         gI2MneDspwOdVOi4VERDoG2tb9zeLVepdZ8mo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776348326; x=1776953126;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lxt3jbcmtBMd1q1Kmw4iv9q8S5afkBck3JCiYF0bKVQ=;
        b=o26IvE+081U2CTug9E0OuBOv4F3KNx19ANXYtVAawAN2PLmYDUNuAiCByOzPFTY6oN
         TEiQEdGxaG3c361EXukeu/ff2ao/jrnSmZhusTRsFT4OGjm84zyZXSlec5WK7kT6lNQo
         xs24x4jKsAEN31oNSj4qzK5LlQ6I75MexW9BU29SQCu2oF9aYkzcvqTSJaQwdal+YWKO
         v1Mou1+BLf84lCqBAzeUkqqIsrRPKaNoB+GSENFMj9G9lWmWsSa0gJYpYAL6APv7oSVW
         KGRVezh31s1wcAx18kugaAMnO8Q2iq/zCbI0zizoPo4KsPFzK4A/mzwHmOnk/IEYhM3s
         bd0g==
X-Forwarded-Encrypted: i=1; AFNElJ/qeO6Y2SOv7/FsVIzMwdV8mH7zfm4WdtwFX5Xf3fwAoavgY+AL9qJ5V89qv2pomZtYnaHHS/DDhpPMmX1oT5fJJg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxsR8G/+8EkOQVX5iFzEuhE2xUH5fVgt6QuO4K/uf579ddk7JNU
	fTHpGeM4PuMBdv/MQHXlfnwlCA1Hbadtc8/mn8GPNWiFVpLXdFxn7z4G8s8+UcI3PPI=
X-Gm-Gg: AeBDiesItNA7KOAjH+4V0DDxYWTG2XHzMkMJQGCrRsxgNPsYXmtEUDRhgs9AceVZF0m
	2aBsOGMOolrPv20Nf0icVHDvNWAoaQMxXyznvAOlrBREnvOO79WnSphn68DkAzizje4iQRkFC8v
	5kZBw3kgeAYb31MQ0eV5egRHyXn+6mrsR/PVctPoMdIvLLxtYBNnIN4kPfqL0AbKQ2XoR0CHu/a
	WGa/aXbAcR4ryko0V6w+LJIVrhW5r+33clWq/VTwfs6cQ0NTRGqbYCfKwwm4p/4oDVGWwBy42I7
	yZOnSd/mf5aOlN3ktnbNyMHS3angLWtDqg5vXi7tg1HD+W43cevAHHDESJUD4ui5MOcRMcNSk18
	noyZDG3cD8+qjhHTcpkmXe9iUl4FIcdI4QSZt9u5Un5G9HvHRXS5EANr3t/OkeI+qJDicTB8MwQ
	g2dDU7stGDdjmKahYK8aZKCGSzA4dp/LgCIXykiLAF75UveVu1cXeDeWR5jVuasDwyfhWWe03qz
	R2Zi93e36QyWQJVH40QdR18UA==
X-Received: by 2002:a05:600c:34cc:b0:485:557d:9fe with SMTP id 5b1f17b1804b1-488d67e65e7mr349019105e9.12.1776348326032;
        Thu, 16 Apr 2026 07:05:26 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f585cefdsm57409695e9.14.2026.04.16.07.05.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 07:05:25 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Apr 2026 16:05:24 +0200
Message-Id: <DHUMXEPGG76W.1VOQNZG8BJJQ@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Martin Jansa" <martin.jansa@gmail.com>
To: <zboszor@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [whinlatter][PATCH v2 2/2] gcc: Backport a patch to
 fix build with GLIBC 2.43 on the host
X-Mailer: aerc 0.20.0
References: <20260407133521.840916-1-zboszor@gmail.com>
 <20260407133521.840916-2-zboszor@gmail.com>
In-Reply-To: <20260407133521.840916-2-zboszor@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 14:05:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235407

On Tue Apr 7, 2026 at 3:35 PM CEST, Zoltan Boszormenyi via lists.openembedd=
ed.org wrote:
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
>  	   file://0026-fix-pr90579-testcases.patch \
> +	   file://0001-libcody-Make-it-buildable-by-C-11-to-C-26.patch \
>  "
> =20
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
> +	* cody.hh (S2C): For __cpp_char8_t >=3D 201811 use char8_t instead of
> +	char in argument type.
> +	(MessageBuffer::Space): Revert 2025-11-15 change.
> +	(MessageBuffer::Append): For __cpp_char8_t >=3D 201811 add overload
> +	with char8_t const * type of first argument.
> +	(Packet::Packet): Similarly for first argument.
> +	* client.cc (CommunicationError, Client::ProcessResponse,
> +	Client::Connect, ConnectResponse, PathnameResponse, OKResponse,
> +	IncludeTranslateResponse): Cast u8 string literals to (const char *)
> +	where needed.
> +	* server.cc (Server::ProcessRequests, ConnectRequest): Likewise.
> +
> +(cherry picked from commit 07a767c7a50d1daae8ef7d4aba73fe53ad40c0b7)
> +
> +Signed-off-by: Jakub Jelinek <jakub@redhat.com>
> +Upstream-Status: Backport

Hello,

That patch lacked a reference for the backport and your signed-off-by.
Thanksfully, Martin sent an equivalent that I took:
https://lore.kernel.org/all/20260409152839.2894434-8-martin.jansa@gmail.com=
/

Thanks!


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
> +=20
> + static Packet CommunicationError (int err)
> + {
> +-  std::string e {u8"communication error:"};
> ++  std::string e {(const char *) u8"communication error:"};
> +   e.append (strerror (err));
> +=20
> +   return Packet (Client::PC_ERROR, std::move (e));
> +@@ -110,33 +110,34 @@ Packet Client::ProcessResponse (std::vector<std::s=
tring> &words,
> +     {
> +       if (e =3D=3D EINVAL)
> + 	{
> +-	  std::string msg (u8"malformed string '");
> ++	  std::string msg ((const char *) u8"malformed string '");
> + 	  msg.append (words[0]);
> +-	  msg.append (u8"'");
> ++	  msg.append ((const char *) u8"'");
> + 	  return Packet (Client::PC_ERROR, std::move (msg));
> + 	}
> +       else
> +-	return Packet (Client::PC_ERROR, u8"missing response");
> ++	return Packet (Client::PC_ERROR, (const char *) u8"missing response");
> +     }
> +=20
> +   Assert (!words.empty ());
> +-  if (words[0] =3D=3D u8"ERROR")
> ++  if (words[0] =3D=3D (const char *) u8"ERROR")
> +     return Packet (Client::PC_ERROR,
> +-		   words.size () =3D=3D 2 ? words[1]: u8"malformed error response");
> ++		   words.size () =3D=3D 2 ? words[1]
> ++		   : (const char *) u8"malformed error response");
> +=20
> +   if (isLast && !read.IsAtEnd ())
> +     return Packet (Client::PC_ERROR,
> +-		   std::string (u8"unexpected extra response"));
> ++		   std::string ((const char *) u8"unexpected extra response"));
> +=20
> +   Assert (code < Detail::RC_HWM);
> +   Packet result (responseTable[code] (words));
> +   result.SetRequest (code);
> +   if (result.GetCode () =3D=3D Client::PC_ERROR && result.GetString ().=
empty ())
> +     {
> +-      std::string msg {u8"malformed response '"};
> ++      std::string msg {(const char *) u8"malformed response '"};
> +=20
> +       read.LexedLine (msg);
> +-      msg.append (u8"'");
> ++      msg.append ((const char *) u8"'");
> +       result.GetString () =3D std::move (msg);
> +     }
> +   else if (result.GetCode () =3D=3D Client::PC_CONNECT)
> +@@ -199,7 +200,7 @@ Packet Client::Connect (char const *agent, char cons=
t *ident,
> + 			  size_t alen, size_t ilen)
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
> +=20
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
> +-	return Packet (Client::PC_BOOL, 0);
> +-      else if (words[1] =3D=3D u8"TRUE")
> ++      if (words[1] =3D=3D (const char *) u8"FALSE")
> ++	return Packet (Client::PC_BOOL);
> ++      else if (words[1] =3D=3D (const char *) u8"TRUE")
> + 	return Packet (Client::PC_BOOL, 1);
> +       else
> + 	return Packet (Client::PC_ERROR, u8"");
> +diff --git a/libcody/cody.hh b/libcody/cody.hh
> +index 789ce9e70b7..93bce93aa94 100644
> +--- a/libcody/cody.hh
> ++++ b/libcody/cody.hh
> +@@ -47,12 +47,21 @@ namespace Detail  {
> +=20
> + // C++11 doesn't have utf8 character literals :(
> +=20
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
> +=20
> + /// Internal buffering class.  Used to concatenate outgoing messages
> + /// and Lex incoming ones.
> +@@ -123,6 +132,13 @@ public:
> +       Space ();
> +     Append (str, maybe_quote, len);
> +   }
> ++#if __cpp_char8_t >=3D 201811
> ++  void AppendWord (char8_t const *str, bool maybe_quote =3D false,
> ++		   size_t len =3D ~size_t (0))
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
> +=20
> +@@ -135,21 +135,21 @@ void Server::ProcessRequests (void)
> + 	  std::string msg;
> +=20
> + 	  if (err > 0)
> +-	    msg =3D u8"error processing '";
> ++	    msg =3D (const char *) u8"error processing '";
> + 	  else if (ix >=3D Detail::RC_HWM)
> +-	    msg =3D u8"unrecognized '";
> ++	    msg =3D (const char *) u8"unrecognized '";
> + 	  else if (IsConnected () && ix =3D=3D Detail::RC_CONNECT)
> +-	    msg =3D u8"already connected '";
> ++	    msg =3D (const char *) u8"already connected '";
> + 	  else if (!IsConnected () && ix !=3D Detail::RC_CONNECT)
> +-	    msg =3D u8"not connected '";
> ++	    msg =3D (const char *) u8"not connected '";
> + 	  else
> +-	    msg =3D u8"malformed '";
> ++	    msg =3D (const char *) u8"malformed '";
> +=20
> + 	  read.LexedLine (msg);
> +-	  msg.append (u8"'");
> ++	  msg.append ((const char *) u8"'");
> + 	  if (err > 0)
> + 	    {
> +-	      msg.append (u8" ");
> ++	      msg.append ((const char *) u8" ");
> + 	      msg.append (strerror (err));
> + 	    }
> + 	  resolver->ErrorResponse (this, std::move (msg));
> +@@ -176,7 +176,7 @@ Resolver *ConnectRequest (Server *s, Resolver *r,
> +     return nullptr;
> +=20
> +   if (words.size () =3D=3D 3)
> +-    words.emplace_back (u8"");
> ++    words.emplace_back ((const char *) u8"");
> +   unsigned version =3D ParseUnsigned (words[1]);
> +   if (version =3D=3D ~0u)
> +     return nullptr;
> +--=20
> +2.53.0
> +


--=20
Yoann Congal
Smile ECS


