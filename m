Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4D5CD605B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 13:41:20 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 30 Mar 2016 06:41:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,416,1455004800"; d="scan'208";a="774678380"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.27.217])
	by orsmga003.jf.intel.com with ESMTP; 30 Mar 2016 06:41:19 -0700
Message-ID: <1459345278.3751.1.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Mar 2016 14:41:18 +0100
In-Reply-To: <1459292571-13876-1-git-send-email-raj.khem@gmail.com>
References: <1459292571-13876-1-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.18.5.2 (3.18.5.2-1.fc23) 
Mime-Version: 1.0
Subject: Re: [PATCH] psmisc: Remove including sys/user.h and __WORDSIZE
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
X-List-Received-Date: Wed, 30 Mar 2016 13:41:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2016-03-29 at 23:02 +0000, Khem Raj wrote:
> We can replace __WORDSIZE with UINTPTR_MAX
> sys/user.h is in conflict with asm/ptrace.h on musl

psmisc is failing to build on the autobuilder with this patch included:

https://autobuilder.yoctoproject.org/main/builders/nightly-no-x11/build
s/65/steps/BuildImages/logs/stdio

https://autobuilder.yoctoproject.org/main/builders/nightly-non-
gpl3/builds/721/steps/BuildImages/logs/stdio

> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch | 49
> ++++++++++++++++++++++
>  meta/recipes-extended/psmisc/psmisc_22.21.bb       |  8 ++--
>  2 files changed, 54 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-extended/psmisc/psmisc/0001-Use-
> UINTPTR_MAX-instead-of-__WORDSIZE.patch
> 
> diff --git a/meta/recipes-extended/psmisc/psmisc/0001-Use-
> UINTPTR_MAX-instead-of-__WORDSIZE.patch b/meta/recipes-
> extended/psmisc/psmisc/0001-Use-UINTPTR_MAX-instead-of-
> __WORDSIZE.patch
> new file mode 100644
> index 0000000..2e70d5e
> --- /dev/null
> +++ b/meta/recipes-extended/psmisc/psmisc/0001-Use-UINTPTR_MAX-
> instead-of-__WORDSIZE.patch
> @@ -0,0 +1,49 @@
> +From 004de754e8b2c3cbfaf3aeba511a1c4149b23eb4 Mon Sep 17 00:00:00
> 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Thu, 24 Mar 2016 15:46:14 +0000
> +Subject: [PATCH] Use UINTPTR_MAX instead of __WORDSIZE
> +
> +Do not include sys/user.h since it conflicts with
> +pt_regs struct from kernel APIs in asm/ptrace.h
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> +Upstream-Status: Pending
> +
> + src/peekfd.c | 12 ++++++------
> + 1 file changed, 6 insertions(+), 6 deletions(-)
> +
> +diff --git a/src/peekfd.c b/src/peekfd.c
> +index cba2130..e2c39cd 100644
> +--- a/src/peekfd.c
> ++++ b/src/peekfd.c
> +@@ -30,8 +30,8 @@
> + #include <asm/ptrace.h>
> + #include <byteswap.h>
> + #include <endian.h>
> +-#include <sys/user.h>
> + #include <stdlib.h>
> ++#include <stdint.h>
> + #include <getopt.h>
> + #include <ctype.h>
> + 
> +@@ -228,11 +228,11 @@ int main(int argc, char **argv)
> + 		if (WIFSTOPPED(status)) {
> + #ifdef PPC
> + 			struct pt_regs regs;
> +-			regs.gpr[0] = ptrace(PTRACE_PEEKUSER, pid,
> __WORDSIZE/8 * PT_R0, 0);
> +-			regs.gpr[3] = ptrace(PTRACE_PEEKUSER, pid,
> __WORDSIZE/8 * PT_R3, 0);
> +-			regs.gpr[4] = ptrace(PTRACE_PEEKUSER, pid,
> __WORDSIZE/8 * PT_R4, 0);
> +-			regs.gpr[5] = ptrace(PTRACE_PEEKUSER, pid,
> __WORDSIZE/8 * PT_R5, 0);
> +-			regs.orig_gpr3 = ptrace(PTRACE_PEEKUSER,
> pid, __WORDSIZE/8 * PT_ORIG_R3, 0);
> ++			regs.gpr[0] = ptrace(PTRACE_PEEKUSER, pid,
> UINTPTR_MAX/8 * PT_R0, 0);
> ++			regs.gpr[3] = ptrace(PTRACE_PEEKUSER, pid,
> UINTPTR_MAX/8 * PT_R3, 0);
> ++			regs.gpr[4] = ptrace(PTRACE_PEEKUSER, pid,
> UINTPTR_MAX/8 * PT_R4, 0);
> ++			regs.gpr[5] = ptrace(PTRACE_PEEKUSER, pid,
> UINTPTR_MAX/8 * PT_R5, 0);
> ++			regs.orig_gpr3 = ptrace(PTRACE_PEEKUSER,
> pid, UINTPTR_MAX/8 * PT_ORIG_R3, 0);
> + #elif defined(ARM)
> + 			struct pt_regs regs;
> + 			ptrace(PTRACE_GETREGS, pid, 0, &regs);
> +-- 
> +1.8.3.1
> +
> diff --git a/meta/recipes-extended/psmisc/psmisc_22.21.bb
> b/meta/recipes-extended/psmisc/psmisc_22.21.bb
> index 66aba9e..1c6473e 100644
> --- a/meta/recipes-extended/psmisc/psmisc_22.21.bb
> +++ b/meta/recipes-extended/psmisc/psmisc_22.21.bb
> @@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e
> 8d672dc4c32c317bb3"
>  SRC_URI[md5sum] = "935c0fd6eb208288262b385fa656f1bf"
>  SRC_URI[sha256sum] =
> "97323cad619210845b696d7d722c383852b2acb5c49b5b0852c4f29c77a8145a"
>  
> -SRC_URI += "file://0001-Typo-in-fuser-makes-M-on-all-the-time.patch
> \
> -            file://0002-Include-limits.h-for-PATH_MAX.patch \
> -            "
> +SRC_URI = "${SOURCEFORGE_MIRROR}/psmisc/psmisc-${PV}.tar.gz \
> +           file://0001-Typo-in-fuser-makes-M-on-all-the-time.patch \
> +           file://0002-Include-limits.h-for-PATH_MAX.patch \
> +           file://0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch \
> +           "
> -- 
> 1.9.1
> 

