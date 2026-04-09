Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A451FF31E31
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 15:28:57 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.134996.1775748529698874188
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 08:28:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JicOIn/n;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso13366265e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 08:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775748528; x=1776353328; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pLeKwuoLTNcWYbm9YnR0/7UbTev0LGrYg19VSbGH7w=;
        b=JicOIn/n3n6bm7sP2Gq94tMvwUDcTlfLbXoH4XayGo8dFqyhGQq98w8IFihYJl8Dm6
         XwM2JIYpl+5nHQWP81S5KGm431elq4nvn3vw1FLQj1+CP+9lCBODj/XYD3tsgFEus2QO
         raTD6rCvM1Cu08toU87WL3f9d0qeiPiyGhX0bebs+gG53oF9YSuNkTv8TvpFbCffcHpv
         cDi6nmCgdUjxNMQNl7rzq72C6Fd0rf9C3DebQibxHWDPqnpDVFyH+yZSyakmPm1T/Mmu
         R5CBOY8/uQr8lPXUWDq1I11zxRPi3jrQ33rWmyjlJOhlzQTeZKMB0/f7H1rQr76aC3jY
         wMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775748528; x=1776353328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2pLeKwuoLTNcWYbm9YnR0/7UbTev0LGrYg19VSbGH7w=;
        b=g9Pwo6Pv+OIghlDIia+MigQgvg44JIaI6uc1gYAJfy2CAuMvojuEcaxIYAPCC4bNhd
         AxKEyA190igtVkhUGdMuOWlEWja/QbSMRZK+Bu3SbMEAkH2zg2f3gfdn42cqKYNosTY9
         TnxSdAsdfcXMvKkHYTFOvDKe8fNJ+0EBwYIlR3wIALXN86xEMhr9BpdjaRh50M5LheHg
         an37k9zN+zP/gay/q/fR6Ev4jfAurOtLM/kbJlc7TXuAq2WPYOz3KULR/hXfkOQ/dqk4
         PgUgPPBQh0Djaf1yFWfNOnZ2fyb6gy/wWdAkPq6CGoXa6kCMzRmytlL6B9Wesr51yCoh
         qpQw==
X-Gm-Message-State: AOJu0YwCdui4qvQkLSSVkS+VO0d8qrZqqCLpnu0Tjunbp0PxuxVIZWEt
	yMB8RQ6AhB36J7kTtsYwkzQtzqOQZDp2rUhBNIoFX6iq3JNVrazoHvLvSVxpXg==
X-Gm-Gg: AeBDievQN1WG6MLjfoGH9Ky6zGWpMvhmemElQ/J68FNKQyeQmhNnufZCEs9wDHNwxE+
	pGiq1i2jvlCVya3OVzDMamNTS/cIFbwBdfgfhTZR3TltNRXKOHJ6vIokZkoN/Wh3H6++paRB8zh
	tK+IwFYCDAvwR2EIQpozmgG/V6hRcqm8zHq2c/jqaN0GO0UiQXFbxhZ21B60ii7yWGsaULfhBlB
	XH8wOezUVBGjx7DsipHp+3/UoCZgwUChTfH74smfgNb7N+kr8u64YBjImqDwuQnBgkiCEZqFx4F
	1uBVrfa6nmPkQL/tyOSmVoRzhfvphvfVtYLJ2kfWCS/FAhkk8dzc/7BhGd2IAg3wywQTE4DXfVn
	CNxeXL6QHyP98zn3wLpmjwfPF/PgUm4V3VA5I4/QCoSlKP/hq8Wx8FZxLVBprR48YBLKcNA6nqm
	je4ENSdGbLP96TfxL9OEozf4UG2w==
X-Received: by 2002:a05:6000:4b0a:b0:43b:a16b:ee69 with SMTP id ffacd0b85a97d-43d595cf8c2mr5650814f8f.24.1775748527868;
        Thu, 09 Apr 2026 08:28:47 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e1fe0b0sm70075622f8f.0.2026.04.09.08.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 08:28:47 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [whinlatter][PATCH 8/9] gcc: backport a fix for building with gcc-16
Date: Thu,  9 Apr 2026 17:28:27 +0200
Message-ID: <20260409152839.2894434-8-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409152839.2894434-1-martin.jansa@gmail.com>
References: <20260409152839.2894434-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 15:28:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234924

From: Martin Jansa <martin.jansa@gmail.com>

Fixes:
https://errors.yoctoproject.org/Errors/Details/905192/
when building on host with gcc-16

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-15.2.inc        |   1 +
 ...dy-Make-it-buildable-by-C-11-to-C-26.patch | 257 ++++++++++++++++++
 2 files changed, 258 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0028-libcody-Make-it-buildable-by-C-11-to-C-26.patch

diff --git a/meta/recipes-devtools/gcc/gcc-15.2.inc b/meta/recipes-devtools/gcc/gcc-15.2.inc
index d178b25487..69eff3621d 100644
--- a/meta/recipes-devtools/gcc/gcc-15.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-15.2.inc
@@ -73,6 +73,7 @@ SRC_URI = "${BASEURI} \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
 	   file://0026-fix-pr90579-testcases.patch \
+           file://0028-libcody-Make-it-buildable-by-C-11-to-C-26.patch \
 "
 
 UNPACKDIR = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
diff --git a/meta/recipes-devtools/gcc/gcc/0028-libcody-Make-it-buildable-by-C-11-to-C-26.patch b/meta/recipes-devtools/gcc/gcc/0028-libcody-Make-it-buildable-by-C-11-to-C-26.patch
new file mode 100644
index 0000000000..431facb011
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

