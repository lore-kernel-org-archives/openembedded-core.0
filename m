Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <8a8cbe906197ff3e5aa385d148747b8757d81bb5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] Binutils: Avoid Race condition in as.info
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Thu, 03 Mar 2022 08:02:22 +0000
In-Reply-To: <20220303055700.144747-1-pgowda.cve@gmail.com>
References: <20220303055700.144747-1-pgowda.cve@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Pgowda <pgowda.cve@gmail.com>, openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com

On Wed, 2022-03-02 at 21:57 -0800, Pgowda wrote:
> The race condition in binutils/gas folder was introduced with the
> following patch. The patch avoids recursive make into the doc folder.
> It would speed up the build process slightly. However, the as.info
> is installed twice which resulted in the race condition sometimes.
> https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=bde299e063de090bf36c1fe51874d1e9f4d94c3c
> 
> On debugging the code, it was found that the issue was related to
> install-data-local. On further analysis, there is already a patch in
> binutils that removes install-data-local.
> On applying the patch as.info is installed once as expected and there’s
> no possibility of any race condition.
> https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=9a84a44d5df4618dd616137fa755bd71b7eacc5f
> 
> Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=9a84a44d5df4618dd616137fa755bd71b7eacc5f]
> 
> [YOCTO #14725]
> 
> Signed-off-by: pgowda <pgowda.cve@gmail.com>
> ---
>  .../binutils/binutils-2.38.inc                |  1 +
>  .../0013-Avoid-as-info-race-condition.patch   | 75 +++++++++++++++++++
>  2 files changed, 76 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0013-Avoid-as-info-race-condition.patch

Thanks for tracking that down, it will be good to fix this one as we've seen it
fail a few times. Note that the Upstream-Status in the patch below was
incorrect, it needed to be Backport like it is above.

I've fixed it in the patch I've queued for testing so no need to resend.

Cheers,

Richard

> 
> diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
> index 6d4415048a..4ce74f94bf 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.38.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
> @@ -31,5 +31,6 @@ SRC_URI = "\
>       file://0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch \
>       file://0011-sync-with-OE-libtool-changes.patch \
>       file://0012-Check-for-clang-before-checking-gcc-version.patch \
> +     file://0013-Avoid-as-info-race-condition.patch \
>  "
>  S  = "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils/0013-Avoid-as-info-race-condition.patch b/meta/recipes-devtools/binutils/binutils/0013-Avoid-as-info-race-condition.patch
> new file mode 100644
> index 0000000000..8edc12d5a9
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0013-Avoid-as-info-race-condition.patch
> @@ -0,0 +1,75 @@
> +From 9a84a44d5df4618dd616137fa755bd71b7eacc5f Mon Sep 17 00:00:00 2001
> +From: Mike Frysinger <vapier@gentoo.org>
> +Date: Sun, 23 Jan 2022 12:44:24 -0500
> +Subject: [PATCH] gas: drop old cygnus install hack
> +
> +This was needed when gas was using the automake cygnus option, but
> +this was removed years ago by Simon in d0ac1c44885daf68f631befa37e
> +("Bump to autoconf 2.69 and automake 1.15.1").  So delete it here.
> +The info pages are already & still installed by default w/out it.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + gas/Makefile.in  | 14 +++++---------
> + gas/doc/local.mk |  4 ----
> + 2 files changed, 5 insertions(+), 13 deletions(-)
> +
> +diff --git a/gas/Makefile.in b/gas/Makefile.in
> +index 8f0a56fd8d6..67dac53f68c 100644
> +--- a/gas/Makefile.in
> ++++ b/gas/Makefile.in
> +@@ -1854,7 +1854,7 @@ info: info-recursive
> + 
> + info-am: $(INFO_DEPS) info-local
> + 
> +-install-data-am: install-data-local install-info-am install-man
> ++install-data-am: install-info-am install-man
> + 
> + install-dvi: install-dvi-recursive
> + 
> +@@ -2008,10 +2008,10 @@ uninstall-man: uninstall-man1
> + 	distclean-DEJAGNU distclean-compile distclean-generic \
> + 	distclean-hdr distclean-libtool distclean-tags dvi dvi-am html \
> + 	html-am html-local info info-am info-local install install-am \
> +-	install-data install-data-am install-data-local install-dvi \
> +-	install-dvi-am install-exec install-exec-am install-exec-local \
> +-	install-html install-html-am install-info install-info-am \
> +-	install-man install-man1 install-pdf install-pdf-am install-ps \
> ++	install-data install-data-am install-dvi install-dvi-am \
> ++	install-exec install-exec-am install-exec-local install-html \
> ++	install-html-am install-info install-info-am install-man \
> ++	install-man1 install-pdf install-pdf-am install-ps \
> + 	install-ps-am install-strip installcheck installcheck-am \
> + 	installdirs installdirs-am maintainer-clean \
> + 	maintainer-clean-aminfo maintainer-clean-generic mostlyclean \
> +@@ -2211,10 +2211,6 @@ doc/asconfig.texi: doc/$(CONFIG).texi doc/$(am__dirstamp)
> + 	$(AM_V_GEN)cp $(srcdir)/doc/$(CONFIG).texi doc/asconfig.texi
> + 	$(AM_V_at)chmod u+w doc/asconfig.texi
> + 
> +-# We want install to imply install-info as per GNU standards, despite the
> +-# cygnus option.
> +-install-data-local: install-info
> +-
> + # Maintenance
> + 
> + # We need it for the taz target in ../Makefile.in.
> +diff --git a/gas/doc/local.mk b/gas/doc/local.mk
> +index c2de441257c..ac205cf08a2 100644
> +--- a/gas/doc/local.mk
> ++++ b/gas/doc/local.mk
> +@@ -101,10 +101,6 @@ CPU_DOCS = \
> + 	%D%/c-z80.texi \
> + 	%D%/c-z8k.texi
> + 
> +-# We want install to imply install-info as per GNU standards, despite the
> +-# cygnus option.
> +-install-data-local: install-info
> +-
> + # This one isn't ready for prime time yet.  Not even a little bit.
> + 
> + noinst_TEXINFOS = %D%/internals.texi
> +-- 
> +2.27.0
> +
> 
> 


