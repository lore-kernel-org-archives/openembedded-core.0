Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9773.1793273914930731298
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 04:38:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
	by 156.147.23.51 with ESMTP; 29 Oct 2026 20:38:32 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.122.207)
	by 156.147.1.151 with ESMTP; 29 Oct 2026 20:38:32 +0900
X-Original-SENDERIP: 10.177.122.207
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [RFC PATCH 3/4] multilib_header_wrapper.h: support musl
Date: Thu, 29 Oct 2026 20:38:28 +0900
Message-ID: <20261029113829.2806167-4-mark.yang@lge.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029113829.2806167-1-mark.yang@lge.com>
References: <20261029113829.2806167-1-mark.yang@lge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 11:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248936
Content-Type: text/plain; charset="utf-8"

From: "mark.yang" <mark.yang@lge.com>

Pick the -32/-64 variant on musl from the musl headers in the sysroot,
or from __SIZEOF_POINTER__ when both variants are there. glibc multilib
is unchanged.

This brings back __MHWORDSIZE, dropped in 3a6ba47ede. musl defines
__WORDSIZE in sys/reg.h and sys/user.h, and a wrapper included after
them would redefine it. The first wrapper in a translation unit sets
it as follows:

1. Already defined: used as is. SWIG has no __has_include, so musl
   recipes that run it over wrapped headers pass -D__MHWORDSIZE=<bits>.
2. Only bits/alltypes-32.h or only bits/alltypes-64.h: 32 or 64.
   This is a recipe sysroot, which has one musl variant.
3. bits/alltypes.h with both variants: __SIZEOF_POINTER__ * 8.
   This is an SDK sysroot.
4. Otherwise: __WORDSIZE from bits/wordsize.h, as before.

musl installs bits/alltypes-32.h or -64.h now that its bits headers
are wrapped.

bpf needs no __bpf__ check. 6d8c7e3426 removed the old one, which
set 64. A lib32 recipe that builds eBPF with clang -target bpf gets
8-byte pointers, so the pointer size alone would pick the -64.h
headers. Its sysroot has only the -32.h ones, and rule 2 picks those.

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 scripts/multilib_header_wrapper.h | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/scripts/multilib_header_wrapper.h b/scripts/multilib_header_wrapper.h
index 88f3193812..cb7ebb8c10 100644
--- a/scripts/multilib_header_wrapper.h
+++ b/scripts/multilib_header_wrapper.h
@@ -5,9 +5,23 @@
  * 
  */
 
-#include <bits/wordsize.h>
+#ifndef __MHWORDSIZE
+# if defined(__has_include)
+#  if __has_include(<bits/alltypes-32.h>) && !__has_include(<bits/alltypes-64.h>)
+#   define __MHWORDSIZE 32				/* musl, 32-bit only */
+#  elif __has_include(<bits/alltypes-64.h>) && !__has_include(<bits/alltypes-32.h>)
+#   define __MHWORDSIZE 64				/* musl, 64-bit only */
+#  elif __has_include(<bits/alltypes.h>)
+#   define __MHWORDSIZE (__SIZEOF_POINTER__ * 8)	/* musl, both (SDK) */
+#  endif
+# endif
+# ifndef __MHWORDSIZE
+#  include <bits/wordsize.h>				/* glibc */
+#  define __MHWORDSIZE __WORDSIZE
+# endif
+#endif
 
-#if __WORDSIZE == 32
+#if __MHWORDSIZE == 32
 
 #ifdef _MIPS_SIM
 
@@ -23,9 +37,9 @@
 #include <ENTER_HEADER_FILENAME_HERE-32.h>
 #endif
 
-#elif __WORDSIZE == 64
+#elif __MHWORDSIZE == 64
 #include <ENTER_HEADER_FILENAME_HERE-64.h>
 #else
 #error "Unknown __WORDSIZE detected"
-#endif /* matches #if __WORDSIZE == 32 */
+#endif /* matches #if __MHWORDSIZE == 32 */
   
