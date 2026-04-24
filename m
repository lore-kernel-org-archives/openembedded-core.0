Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C5EFF8849
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:02 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32587.1777064216487785683
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:56:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=VomUbtp/;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so59585835e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064215; x=1777669015; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MQDuPc9bhB3dO5utOBrutkoDHvvYRPyPOqFagkaTkEU=;
        b=VomUbtp/pM/Qw5Rz69nwUgff6079hdWU7IIZ7hiw4MTFYrk8eNeGYTWRo3oWnl2RU+
         jEx4hApmoLzv6UIGt0LI7AeyDTWlysH5MjN2GDMaAklBvegFc938KpU8ulsa4NOpSktk
         PvScZ9QQgdYZFYXPG0yO/PtzJvRN3sCp2LnIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064215; x=1777669015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MQDuPc9bhB3dO5utOBrutkoDHvvYRPyPOqFagkaTkEU=;
        b=tM7xtvjW1EdpiMIcndcsyTQiYXwFmhi/WnFUsg1CSc6RHlpU6bXFXzhidZi81Pzjbx
         aGP44uzNJNVfzmKImyude1quoZN/CsbKYOIT8PUR2FXvrY2VsnM/jsb0HeA6TcDlukau
         BfmztXcKc4nUrXHaiiuJriwSKnqrN/cxBO9hMp0RP81r65sPQGxHVXGJG8ytpsZzDdxn
         psHK9WLAE080Pwr0+fGxuttoNEKAu88AnfjilERLYNGeZF0p0T21HbknYEgwm2Rn6el1
         N5JwjA9zVaY3Ppnk+TgegERg+oQyZl726xvRt89YjE/q2ZghrduIj++l1iRpHSbLyuXF
         HhqA==
X-Gm-Message-State: AOJu0YwZ97GK2LRbgNbgDAdpNN9QTgtSNfasXirI9VusX8Qtm7J/5AEE
	CQ5idu+PxdBG1YdiMIzvhpWkauqcu7U4TBB4L4w3JzA5El1PjeQaddvGUqn2JMroKGZ8gipO4Ih
	b+tKrtiRdE6tc
X-Gm-Gg: AeBDievCt921T4HvNrxC7Cy3D03WFKDZuibgCSwE4UE8Swc4QvOt79DaoOL5nfjWEga
	8ddVeKdpDl5BL9lnxe9RoYWB85zWURagCdVpRl/OfHzcUQcgUayHDtes6UVNwHGDgF76eud/H8G
	uIw7Z3DC8rG/RaAZDifm+QxEfVr59GeXERXnlbErJd0sotM3zeB+LLUgVS/l4rEqU3jlkiOtv2f
	EdHX70He3bu6/IvgHfcm8Z052KwYRiE8IGKoprAXGiPU5XF8At8j0Np0+m2I8nLRJufyq0d3faf
	Bynlaj3utZaS1TUnutONl99istDpsomgEMy5+eeEBKJ+tq4U4/ZYjwDgK6CEWN9y6/C+jDeyQ0z
	7QuzBCZajVZCUVDlMPMePn6bHhagJYlT878Cx2kO98TTKql9uReN5Ml4Ncc4sFaYxqhL+wmp40E
	EJccv1Yf7id0njRqZj74zIqMJYMZLNXg6teTtAjqVbp/H/VMztO3wrpkghM+hLn8WexuYa/pr6C
	K0UH5Hq72HOyi0ePPLNPLCMbSXqcxrNAHXAhg==
X-Received: by 2002:a05:600c:8207:b0:485:3193:6ddb with SMTP id 5b1f17b1804b1-488fb73cf74mr520409735e9.3.1777064214566;
        Fri, 24 Apr 2026 13:56:54 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.56.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:56:54 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 31/66] gcc: backport a fix for building with gcc-16
Date: Fri, 24 Apr 2026 22:55:30 +0200
Message-ID: <53f86b988210506e191f28138b9a58a254ec4615.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235904

From: Martin Jansa <martin.jansa@gmail.com>

Fixes:
https://errors.yoctoproject.org/Errors/Details/905192/
when building on host with gcc-16

Compared to 15.2 used in whinlatter this needs 2 additional backports.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9eabea38f0c17d41d97284d63a25e45da3c9bbcc)
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/gcc/gcc-13.4.inc        |   3 +
 ...dy-Make-it-buildable-by-C-11-to-C-26.patch | 257 ++++++++++++++++++
 ...build-Remove-INCLUDE_MEMORY-PR117737.patch |  46 ++++
 ...am-include-above-safe-ctype.h-PR1177.patch |  54 ++++
 4 files changed, 360 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0028-libcody-Make-it-buildable-by-C-11-to-C-26.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0029-build-Remove-INCLUDE_MEMORY-PR117737.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0030-build-Move-sstream-include-above-safe-ctype.h-PR1177.patch

diff --git a/meta/recipes-devtools/gcc/gcc-13.4.inc b/meta/recipes-devtools/gcc/gcc-13.4.inc
index eefae13530e..2017c444986 100644
--- a/meta/recipes-devtools/gcc/gcc-13.4.inc
+++ b/meta/recipes-devtools/gcc/gcc-13.4.inc
@@ -66,6 +66,9 @@ SRC_URI = "${BASEURI} \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
            file://0027-Fix-gcc-vect-module-testcases.patch \
+           file://0028-libcody-Make-it-buildable-by-C-11-to-C-26.patch \
+           file://0029-build-Remove-INCLUDE_MEMORY-PR117737.patch \
+           file://0030-build-Move-sstream-include-above-safe-ctype.h-PR1177.patch \
 "
 SRC_URI[sha256sum] = "9c4ce6dbb040568fdc545588ac03c5cbc95a8dbf0c7aa490170843afb59ca8f5"
 
diff --git a/meta/recipes-devtools/gcc/gcc/0028-libcody-Make-it-buildable-by-C-11-to-C-26.patch b/meta/recipes-devtools/gcc/gcc/0028-libcody-Make-it-buildable-by-C-11-to-C-26.patch
new file mode 100644
index 00000000000..431facb0110
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0028-libcody-Make-it-buildable-by-C-11-to-C-26.patch
@@ -0,0 +1,257 @@
+From 0ffe3c9af4e5d5468df742512b6e930fe7039230 Mon Sep 17 00:00:00 2001
+From: Jakub Jelinek <jakub@redhat.com>
+Date: Fri, 21 Nov 2025 16:25:58 +0100
+Subject: [PATCH] libcody: Make it buildable by C++11 to C++26
+
+The following builds with -std=c++11 and c++14 and c++17 and c++20 and c++23
+and c++26.
+
+I see the u8 string literals are mixed e.g. with strerror, so in
+-fexec-charset=IBM1047 there will still be garbage, so am not 100% sure if
+the u8 literals everywhere are worth it either.
+
+2025-11-21  Jakub Jelinek  <jakub@redhat.com>
+
+	* cody.hh (S2C): For __cpp_char8_t >= 201811 use char8_t instead of
+	char in argument type.
+	(MessageBuffer::Space): Revert 2025-11-15 change.
+	(MessageBuffer::Append): For __cpp_char8_t >= 201811 add overload
+	with char8_t const * type of first argument.
+	(Packet::Packet): Similarly for first argument.
+	* client.cc (CommunicationError, Client::ProcessResponse,
+	Client::Connect, ConnectResponse, PathnameResponse, OKResponse,
+	IncludeTranslateResponse): Cast u8 string literals to (const char *)
+	where needed.
+	* server.cc (Server::ProcessRequests, ConnectRequest): Likewise.
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+Upstream-Status: Backport [07a767c7a50d1daae8ef7d4aba73fe53ad40c0b7]
+---
+ libcody/client.cc | 36 +++++++++++++++++++-----------------
+ libcody/cody.hh   | 22 ++++++++++++++++++++++
+ libcody/server.cc | 28 ++++++++++++++--------------
+ 3 files changed, 55 insertions(+), 31 deletions(-)
+
+diff --git a/libcody/client.cc b/libcody/client.cc
+index ae69d190cb77..147fecdbe500 100644
+--- a/libcody/client.cc
++++ b/libcody/client.cc
+@@ -97,7 +97,7 @@ int Client::CommunicateWithServer ()
+ 
+ static Packet CommunicationError (int err)
+ {
+-  std::string e {u8"communication error:"};
++  std::string e {(const char *) u8"communication error:"};
+   e.append (strerror (err));
+ 
+   return Packet (Client::PC_ERROR, std::move (e));
+@@ -110,33 +110,34 @@ Packet Client::ProcessResponse (std::vector<std::string> &words,
+     {
+       if (e == EINVAL)
+ 	{
+-	  std::string msg (u8"malformed string '");
++	  std::string msg ((const char *) u8"malformed string '");
+ 	  msg.append (words[0]);
+-	  msg.append (u8"'");
++	  msg.append ((const char *) u8"'");
+ 	  return Packet (Client::PC_ERROR, std::move (msg));
+ 	}
+       else
+-	return Packet (Client::PC_ERROR, u8"missing response");
++	return Packet (Client::PC_ERROR, (const char *) u8"missing response");
+     }
+ 
+   Assert (!words.empty ());
+-  if (words[0] == u8"ERROR")
++  if (words[0] == (const char *) u8"ERROR")
+     return Packet (Client::PC_ERROR,
+-		   words.size () == 2 ? words[1]: u8"malformed error response");
++		   words.size () == 2 ? words[1]
++		   : (const char *) u8"malformed error response");
+ 
+   if (isLast && !read.IsAtEnd ())
+     return Packet (Client::PC_ERROR,
+-		   std::string (u8"unexpected extra response"));
++		   std::string ((const char *) u8"unexpected extra response"));
+ 
+   Assert (code < Detail::RC_HWM);
+   Packet result (responseTable[code] (words));
+   result.SetRequest (code);
+   if (result.GetCode () == Client::PC_ERROR && result.GetString ().empty ())
+     {
+-      std::string msg {u8"malformed response '"};
++      std::string msg {(const char *) u8"malformed response '"};
+ 
+       read.LexedLine (msg);
+-      msg.append (u8"'");
++      msg.append ((const char *) u8"'");
+       result.GetString () = std::move (msg);
+     }
+   else if (result.GetCode () == Client::PC_CONNECT)
+@@ -199,7 +200,7 @@ Packet Client::Connect (char const *agent, char const *ident,
+ 			  size_t alen, size_t ilen)
+ {
+   write.BeginLine ();
+-  write.AppendWord (u8"HELLO");
++  write.AppendWord ((const char *) u8"HELLO");
+   write.AppendInteger (Version);
+   write.AppendWord (agent, true, alen);
+   write.AppendWord (ident, true, ilen);
+@@ -211,7 +212,8 @@ Packet Client::Connect (char const *agent, char const *ident,
+ // HELLO $version $agent [$flags]
+ Packet ConnectResponse (std::vector<std::string> &words)
+ {
+-  if (words[0] == u8"HELLO" && (words.size () == 3 || words.size () == 4))
++  if (words[0] == (const char *) u8"HELLO"
++      && (words.size () == 3 || words.size () == 4))
+     {
+       char *eptr;
+       unsigned long val = strtoul (words[1].c_str (), &eptr, 10);
+@@ -247,7 +249,7 @@ Packet Client::ModuleRepo ()
+ // PATHNAME $dir | ERROR
+ Packet PathnameResponse (std::vector<std::string> &words)
+ {
+-  if (words[0] == u8"PATHNAME" && words.size () == 2)
++  if (words[0] == (const char *) u8"PATHNAME" && words.size () == 2)
+     return Packet (Client::PC_PATHNAME, std::move (words[1]));
+ 
+   return Packet (Client::PC_ERROR, u8"");
+@@ -256,7 +258,7 @@ Packet PathnameResponse (std::vector<std::string> &words)
+ // OK or ERROR
+ Packet OKResponse (std::vector<std::string> &words)
+ {
+-  if (words[0] == u8"OK")
++  if (words[0] == (const char *) u8"OK")
+     return Packet (Client::PC_OK);
+   else
+     return Packet (Client::PC_ERROR,
+@@ -319,11 +321,11 @@ Packet Client::IncludeTranslate (char const *include, Flags flags, size_t ilen)
+ // PATHNAME $cmifile
+ Packet IncludeTranslateResponse (std::vector<std::string> &words)
+ {
+-  if (words[0] == u8"BOOL" && words.size () == 2)
++  if (words[0] == (const char *) u8"BOOL" && words.size () == 2)
+     {
+-      if (words[1] == u8"FALSE")
+-	return Packet (Client::PC_BOOL, 0);
+-      else if (words[1] == u8"TRUE")
++      if (words[1] == (const char *) u8"FALSE")
++	return Packet (Client::PC_BOOL);
++      else if (words[1] == (const char *) u8"TRUE")
+ 	return Packet (Client::PC_BOOL, 1);
+       else
+ 	return Packet (Client::PC_ERROR, u8"");
+diff --git a/libcody/cody.hh b/libcody/cody.hh
+index 789ce9e70b75..93bce93aa94d 100644
+--- a/libcody/cody.hh
++++ b/libcody/cody.hh
+@@ -47,12 +47,21 @@ namespace Detail  {
+ 
+ // C++11 doesn't have utf8 character literals :(
+ 
++#if __cpp_char8_t >= 201811
++template<unsigned I>
++constexpr char S2C (char8_t const (&s)[I])
++{
++  static_assert (I == 2, "only single octet strings may be converted");
++  return s[0];
++}
++#else
+ template<unsigned I>
+ constexpr char S2C (char const (&s)[I])
+ {
+   static_assert (I == 2, "only single octet strings may be converted");
+   return s[0];
+ }
++#endif
+ 
+ /// Internal buffering class.  Used to concatenate outgoing messages
+ /// and Lex incoming ones.
+@@ -123,6 +132,13 @@ public:
+       Space ();
+     Append (str, maybe_quote, len);
+   }
++#if __cpp_char8_t >= 201811
++  void AppendWord (char8_t const *str, bool maybe_quote = false,
++		   size_t len = ~size_t (0))
++  {
++    AppendWord ((const char *) str, maybe_quote, len);
++  }
++#endif
+   /// Add a word as with AppendWord
+   /// @param str the string to append
+   /// @param maybe_quote string might need quoting, as for Append
+@@ -264,6 +280,12 @@ public:
+     : string (s), cat (STRING), code (c)
+   {
+   }
++#if __cpp_char8_t >= 201811
++  Packet (unsigned c, const char8_t *s)
++    : string ((const char *) s), cat (STRING), code (c)
++  {
++  }
++#endif
+   Packet (unsigned c, std::vector<std::string> &&v)
+     : vector (std::move (v)), cat (VECTOR), code (c)
+   {
+diff --git a/libcody/server.cc b/libcody/server.cc
+index e2fa069bb933..c18469fae843 100644
+--- a/libcody/server.cc
++++ b/libcody/server.cc
+@@ -36,12 +36,12 @@ static RequestPair
+   const requestTable[Detail::RC_HWM] =
+   {
+     // Same order as enum RequestCode
+-    RequestPair {u8"HELLO", nullptr},
+-    RequestPair {u8"MODULE-REPO", ModuleRepoRequest},
+-    RequestPair {u8"MODULE-EXPORT", ModuleExportRequest},
+-    RequestPair {u8"MODULE-IMPORT", ModuleImportRequest},
+-    RequestPair {u8"MODULE-COMPILED", ModuleCompiledRequest},
+-    RequestPair {u8"INCLUDE-TRANSLATE", IncludeTranslateRequest},
++    RequestPair {(const char *) u8"HELLO", nullptr},
++    RequestPair {(const char *) u8"MODULE-REPO", ModuleRepoRequest},
++    RequestPair {(const char *) u8"MODULE-EXPORT", ModuleExportRequest},
++    RequestPair {(const char *) u8"MODULE-IMPORT", ModuleImportRequest},
++    RequestPair {(const char *) u8"MODULE-COMPILED", ModuleCompiledRequest},
++    RequestPair {(const char *) u8"INCLUDE-TRANSLATE", IncludeTranslateRequest},
+   };
+ }
+ 
+@@ -135,21 +135,21 @@ void Server::ProcessRequests (void)
+ 	  std::string msg;
+ 
+ 	  if (err > 0)
+-	    msg = u8"error processing '";
++	    msg = (const char *) u8"error processing '";
+ 	  else if (ix >= Detail::RC_HWM)
+-	    msg = u8"unrecognized '";
++	    msg = (const char *) u8"unrecognized '";
+ 	  else if (IsConnected () && ix == Detail::RC_CONNECT)
+-	    msg = u8"already connected '";
++	    msg = (const char *) u8"already connected '";
+ 	  else if (!IsConnected () && ix != Detail::RC_CONNECT)
+-	    msg = u8"not connected '";
++	    msg = (const char *) u8"not connected '";
+ 	  else
+-	    msg = u8"malformed '";
++	    msg = (const char *) u8"malformed '";
+ 
+ 	  read.LexedLine (msg);
+-	  msg.append (u8"'");
++	  msg.append ((const char *) u8"'");
+ 	  if (err > 0)
+ 	    {
+-	      msg.append (u8" ");
++	      msg.append ((const char *) u8" ");
+ 	      msg.append (strerror (err));
+ 	    }
+ 	  resolver->ErrorResponse (this, std::move (msg));
+@@ -176,7 +176,7 @@ Resolver *ConnectRequest (Server *s, Resolver *r,
+     return nullptr;
+ 
+   if (words.size () == 3)
+-    words.emplace_back (u8"");
++    words.emplace_back ((const char *) u8"");
+   unsigned version = ParseUnsigned (words[1]);
+   if (version == ~0u)
+     return nullptr;
diff --git a/meta/recipes-devtools/gcc/gcc/0029-build-Remove-INCLUDE_MEMORY-PR117737.patch b/meta/recipes-devtools/gcc/gcc/0029-build-Remove-INCLUDE_MEMORY-PR117737.patch
new file mode 100644
index 00000000000..d784edefd76
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0029-build-Remove-INCLUDE_MEMORY-PR117737.patch
@@ -0,0 +1,46 @@
+From b3f1b9e2aa079f8ec73e3cb48143a16645c49566 Mon Sep 17 00:00:00 2001
+From: Andrew Pinski <quic_apinski@quicinc.com>
+Date: Fri, 22 Nov 2024 09:31:44 -0800
+Subject: [PATCH] build: Remove INCLUDE_MEMORY [PR117737]
+
+Since diagnostic.h is included in over half of the sources, requiring to `#define INCLUDE_MEMORY`
+does not make sense. Instead lets unconditionally include memory in system.h.
+
+The majority of this patch is just removing `#define INCLUDE_MEMORY` from the sources which currently
+have it.
+
+This should also fix the mingw build issue but I have not tried it.
+
+Signed-off-by: Andrew Pinski <quic_apinski@quicinc.com>
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+Upstream-Status: Backport [gcc-15.1.0 b3f1b9e2aa07 partial, only the gcc/system.h change]
+---
+ gcc/system.h | 8 +-------
+ 1 file changed, 1 insertion(+), 7 deletions(-)
+
+diff --git a/gcc/system.h b/gcc/system.h
+index c18c7c5ec58d..c209871df72d 100644
+--- a/gcc/system.h
++++ b/gcc/system.h
+@@ -222,6 +222,7 @@ extern int fprintf_unlocked (FILE *, const char *, ...);
+ #ifdef INCLUDE_FUNCTIONAL
+ # include <functional>
+ #endif
++# include <memory>
+ # include <cstring>
+ # include <initializer_list>
+ # include <new>
+@@ -758,13 +759,6 @@ private:
+ #define LIKELY(x) (__builtin_expect ((x), 1))
+ #define UNLIKELY(x) (__builtin_expect ((x), 0))
+ 
+-/* Some of the headers included by <memory> can use "abort" within a
+-   namespace, e.g. "_VSTD::abort();", which fails after we use the
+-   preprocessor to redefine "abort" as "fancy_abort" below.  */
+-
+-#ifdef INCLUDE_MEMORY
+-# include <memory>
+-#endif
+ 
+ #ifdef INCLUDE_MUTEX
+ # include <mutex>
diff --git a/meta/recipes-devtools/gcc/gcc/0030-build-Move-sstream-include-above-safe-ctype.h-PR1177.patch b/meta/recipes-devtools/gcc/gcc/0030-build-Move-sstream-include-above-safe-ctype.h-PR1177.patch
new file mode 100644
index 00000000000..270c91c345b
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0030-build-Move-sstream-include-above-safe-ctype.h-PR1177.patch
@@ -0,0 +1,54 @@
+From ac90b5c413c1565fb37cf79b92f6859b3852254a Mon Sep 17 00:00:00 2001
+From: Andrew Pinski <quic_apinski@quicinc.com>
+Date: Mon, 25 Nov 2024 14:03:27 -0800
+Subject: [PATCH] build: Move sstream include above safe-ctype.h {PR117771]
+
+sstream in some versions of libstdc++ include locale which might not have been
+included yet. safe-ctype.h defines the toupper, tolower, etc. as macros so the
+c++ header files needed to be included before hand as comment in system.h says:
+/* Include C++ standard headers before "safe-ctype.h" to avoid GCC
+   poisoning the ctype macros through safe-ctype.h */
+
+I don't understand how it was working before when memory was included after
+safe-ctype.h rather than before. But this makes sstream consistent with the
+other C++ headers.
+
+Pushed as obvious after a build for riscv64-elf.
+
+gcc/ChangeLog:
+
+	PR target/117771
+	* system.h: Move the include of sstream above safe-ctype.h.
+
+Signed-off-by: Andrew Pinski <quic_apinski@quicinc.com>
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+Upstream-Status: Backport [gcc-15.1.0 f6e00226a4ca63e76e3e0b3a09a4ce6223980981]
+---
+ gcc/system.h | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/gcc/system.h b/gcc/system.h
+index 33245e76a986..ff983986153c 100644
+--- a/gcc/system.h
++++ b/gcc/system.h
+@@ -222,6 +222,9 @@ extern int fprintf_unlocked (FILE *, const char *, ...);
+ #ifdef INCLUDE_FUNCTIONAL
+ # include <functional>
+ #endif
++#ifdef INCLUDE_SSTREAM
++# include <sstream>
++#endif
+ # include <memory>
+ # include <cstring>
+ # include <initializer_list>
+@@ -742,10 +745,6 @@ extern int vsnprintf (char *, size_t, const char *, va_list);
+ # include <mutex>
+ #endif
+ 
+-#ifdef INCLUDE_SSTREAM
+-# include <sstream>
+-#endif
+-
+ #ifdef INCLUDE_MALLOC_H
+ #if defined(HAVE_MALLINFO) || defined(HAVE_MALLINFO2)
+ #include <malloc.h>

