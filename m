Return-Path: <compudj@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [78.47.125.74])
	by mail.openembedded.org (Postfix) with ESMTP id D501C7714F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 14:52:42 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id B533E3402E2;
	Wed, 27 Jan 2016 14:52:42 +0000 (UTC)
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (evm-mail-1.efficios.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id EwPosUjsWG2a; Wed, 27 Jan 2016 14:52:35 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id 1F2953402EF;
	Wed, 27 Jan 2016 14:52:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (evm-mail-1.efficios.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id a8q6GOosMUkn; Wed, 27 Jan 2016 14:52:35 +0000 (UTC)
Received: from evm-mail-1.efficios.com (evm-mail-1.efficios.com [78.47.125.74])
	by mail.efficios.com (Postfix) with ESMTP id ECD963402E2;
	Wed, 27 Jan 2016 14:52:34 +0000 (UTC)
Date: Wed, 27 Jan 2016 14:52:34 +0000 (UTC)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <1525639988.5879.1453906354785.JavaMail.zimbra@efficios.com>
In-Reply-To: <1453902430-30567-1-git-send-email-mathieu.desnoyers@efficios.com>
References: <1453902430-30567-1-git-send-email-mathieu.desnoyers@efficios.com>
MIME-Version: 1.0
X-Originating-IP: [78.47.125.74]
X-Mailer: Zimbra 8.6.0_GA_1178 (ZimbraWebClient - FF43 (Linux)/8.6.0_GA_1178)
Thread-Topic: hidden weak symbols by removing buggy openembedded gcc patch
Thread-Index: cWL8xtypG/9TMvN/ZfOJgjtl747Bew==
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH poky (OE-core)] Fix: hidden weak symbols by removing buggy openembedded gcc patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jan 2016 14:52:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- On Jan 27, 2016, at 8:47 AM, Mathieu Desnoyers mathieu.desnoyers@efficios.com wrote:

> We are noticing the presence of the following patch in various
> openembedded gcc versions:
> 
> 0024-PR-target-32219.patch

This patch removal should be applied to master, jethro,
fido, and dizzy branches.

I will prepare a separate commit to remove the patch from gcc 4.8
for fido and dizzy branches.

Thanks,

Mathieu

> 
> However, contrarily to its "Backport" status, that patch is
> not upstream in gcc, and it breaks handling of start/stop automatic
> weak hidden symbols we use in lttng-ust.
> 
> We are only experiencing problems on the various openembedded
> compilers, but on no other distro (with same compiler versions),
> which led us to suspect a buggy distro-specific gcc patch.
> 
> We've been testing with openembedded gcc-4.9.2-r0. Rebuilding the gcc
> compiler with this patch removed fixes the lttng-ust issue.
> 
> Link:
> http://lists.openembedded.org/pipermail/openembedded-core/2016-January/116306.html
> Link: http://lists.lttng.org/pipermail/lttng-dev/2014-May/023112.html
> Link: https://gcc.gnu.org/ml/gcc-help/2014-05/msg00042.html
> Link:
> http://cgit.openembedded.org/openembedded-core/commit/?id=3cb2b003db7371b3a47d02c08352a262e1e419b4
> Link: https://sourceware.org/bugzilla/show_bug.cgi?id=15435
> 
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> CC: openembedded-core@lists.openembedded.org
> CC: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> CC: Khem Raj <raj.khem@gmail.com>
> CC: Ross Burton <ross.burton@intel.com>
> ---
> meta/recipes-devtools/gcc/gcc-4.9.inc              |  1 -
> .../gcc/gcc-4.9/0024-PR-target-32219.patch         | 62 ----------------------
> 2 files changed, 63 deletions(-)
> delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0024-PR-target-32219.patch
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc
> b/meta/recipes-devtools/gcc/gcc-4.9.inc
> index e9dfc50..736c956 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.9.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
> @@ -47,7 +47,6 @@ SRC_URI = "\
>     file://0021-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch \
>     file://0022-COLLECT_GCC_OPTIONS.patch \
>     file://0023-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch \
> -    file://0024-PR-target-32219.patch \
>     file://0025-fortran-cross-compile-hack.patch \
>     file://0026-libgcc-sjlj-check.patch \
>     file://0027-cpp-honor-sysroot.patch \
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0024-PR-target-32219.patch
> b/meta/recipes-devtools/gcc/gcc-4.9/0024-PR-target-32219.patch
> deleted file mode 100644
> index 45acf7f..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0024-PR-target-32219.patch
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -From e0d15f4f8bf28c351b9215ca37f1caa24df0e1fd Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 09:18:54 +0400
> -Subject: [PATCH 24/35] PR target/32219
> -
> -* varasm.c (default_binds_local_p_1): Weak data is not local.
> -
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Backport
> ----
> - gcc/testsuite/gcc.dg/visibility-21.c |   14 ++++++++++++++
> - gcc/varasm.c                         |    9 ++++-----
> - 2 files changed, 18 insertions(+), 5 deletions(-)
> - create mode 100644 gcc/testsuite/gcc.dg/visibility-21.c
> -
> -Index: gcc-4.9-20140316/gcc/varasm.c
> -===================================================================
> ---- gcc-4.9-20140316.orig/gcc/varasm.c
> -+++ gcc-4.9-20140316/gcc/varasm.c
> -@@ -6771,6 +6771,10 @@ default_binds_local_p_1 (const_tree exp,
> -   /* Static variables are always local.  */
> -   else if (! TREE_PUBLIC (exp))
> -     local_p = true;
> -+  /* hidden weak can't be overridden by something non-local, all
> -+     that is possible is that it is not defined at all. */
> -+  else if (DECL_WEAK (exp))
> -+    local_p = false;
> -   /* A variable is local if the user has said explicitly that it will
> -      be.  */
> -   else if ((DECL_VISIBILITY_SPECIFIED (exp)
> -@@ -6784,11 +6788,6 @@ default_binds_local_p_1 (const_tree exp,
> -      local.  */
> -   else if (DECL_VISIBILITY (exp) != VISIBILITY_DEFAULT)
> -     local_p = true;
> --  /* Default visibility weak data can be overridden by a strong symbol
> --     in another module and so are not local.  */
> --  else if (DECL_WEAK (exp)
> --	   && !resolved_locally)
> --    local_p = false;
> -   /* If PIC, then assume that any global name can be overridden by
> -      symbols resolved from other modules.  */
> -   else if (shlib)
> -Index: gcc-4.9-20140316/gcc/testsuite/gcc.dg/visibility-22.c
> -===================================================================
> ---- /dev/null
> -+++ gcc-4.9-20140316/gcc/testsuite/gcc.dg/visibility-22.c
> -@@ -0,0 +1,13 @@
> -+/* PR target/32219 */
> -+/* { dg-do run } */
> -+/* { dg-require-visibility "" } */
> -+/* { dg-options "-fPIC" { target fpic } } */
> -+
> -+extern void f() __attribute__((weak,visibility("hidden")));
> -+extern int puts( char const* );
> -+int main()
> -+{
> -+  if (f)
> -+    f();
> -+  return 0;
> -+}
> --
> 2.1.4

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com

