Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QoJTA-00011S-IZ
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 20:13:33 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 02 Aug 2011 11:09:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,307,1309762800"; d="scan'208";a="35054284"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by fmsmga002.fm.intel.com with ESMTP; 02 Aug 2011 11:09:09 -0700
Message-ID: <4E383D44.1060104@linux.intel.com>
Date: Tue, 02 Aug 2011 11:09:08 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1312108283-11264-1-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1312108283-11264-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH] eglibc: fix build for armv4 machines
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Aug 2011 18:13:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/31/2011 03:31 AM, Dmitry Eremin-Solenikov wrote:
> eglibc builds for arm-eabi unconditionally enables the libc-do-syscall.S
> file, which contains thumb assembly. It's unused in arm-eabi-nothumb case,
> so just ifdef the actual code.
>
> Signed-off-by: Dmitry Eremin-Solenikov<dbaryshkov@gmail.com>
> ---
>   .../eglibc-fixup-arm-eabi-nothumb.patch            |   17 +++++++++++++++++
>   .../eglibc-fixup-arm-eabi-nothumb.patch            |   17 +++++++++++++++++
>   meta/recipes-core/eglibc/eglibc_2.12.bb            |    3 ++-
>   meta/recipes-core/eglibc/eglibc_2.13.bb            |    3 ++-
>   4 files changed, 38 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.12/eglibc-fixup-arm-eabi-nothumb.patch
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/eglibc-fixup-arm-eabi-nothumb.patch
>
> diff --git a/meta/recipes-core/eglibc/eglibc-2.12/eglibc-fixup-arm-eabi-nothumb.patch b/meta/recipes-core/eglibc/eglibc-2.12/eglibc-fixup-arm-eabi-nothumb.patch
> new file mode 100644
> index 0000000..e189b23
> --- /dev/null
> +++ b/meta/recipes-core/eglibc/eglibc-2.12/eglibc-fixup-arm-eabi-nothumb.patch

Dmitry,

Can you please add patch headers to this, per the openembedded wiki:

http://wiki.openembedded.org/index.php/Commit_Patch_Message_Guidelines

If you could please also add Upstream-Status as appropriate.

Thanks
	Sau!

> @@ -0,0 +1,17 @@
> +Index: libc/ports/sysdeps/unix/sysv/linux/arm/eabi/libc-do-syscall.S
> +===================================================================
> +--- libc.orig/ports/sysdeps/unix/sysv/linux/arm/eabi/libc-do-syscall.S	2011-07-31 12:07:13.000000000 +0400
> ++++ libc/ports/sysdeps/unix/sysv/linux/arm/eabi/libc-do-syscall.S	2011-07-31 12:08:30.000000000 +0400
> +@@ -25,6 +25,7 @@
> +    ARM unwind tables for register to register moves, the actual opcodes
> +    are not defined.  */
> +
> ++#ifdef __thumb__
> + 	.thumb
> + 	.syntax unified
> + 	.hidden __libc_do_syscall
> +@@ -41,3 +42,4 @@
> + 	pop	{r7, pc}
> + 	.fnend
> + END (__libc_do_syscall)
> ++#endif
> diff --git a/meta/recipes-core/eglibc/eglibc-2.13/eglibc-fixup-arm-eabi-nothumb.patch b/meta/recipes-core/eglibc/eglibc-2.13/eglibc-fixup-arm-eabi-nothumb.patch
> new file mode 100644
> index 0000000..e189b23
> --- /dev/null
> +++ b/meta/recipes-core/eglibc/eglibc-2.13/eglibc-fixup-arm-eabi-nothumb.patch
> @@ -0,0 +1,17 @@
> +Index: libc/ports/sysdeps/unix/sysv/linux/arm/eabi/libc-do-syscall.S
> +===================================================================
> +--- libc.orig/ports/sysdeps/unix/sysv/linux/arm/eabi/libc-do-syscall.S	2011-07-31 12:07:13.000000000 +0400
> ++++ libc/ports/sysdeps/unix/sysv/linux/arm/eabi/libc-do-syscall.S	2011-07-31 12:08:30.000000000 +0400
> +@@ -25,6 +25,7 @@
> +    ARM unwind tables for register to register moves, the actual opcodes
> +    are not defined.  */
> +
> ++#ifdef __thumb__
> + 	.thumb
> + 	.syntax unified
> + 	.hidden __libc_do_syscall
> +@@ -41,3 +42,4 @@
> + 	pop	{r7, pc}
> + 	.fnend
> + END (__libc_do_syscall)
> ++#endif
> diff --git a/meta/recipes-core/eglibc/eglibc_2.12.bb b/meta/recipes-core/eglibc/eglibc_2.12.bb
> index 1ada892..eb7d220 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.12.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.12.bb
> @@ -1,7 +1,7 @@
>   require eglibc.inc
>
>   DEPENDS += "gperf-native"
> -PR = "r20"
> +PR = "r21"
>
>   SRCREV = "14158"
>
> @@ -11,6 +11,7 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http
>              file://IO-acquire-lock-fix.patch \
>              file://shorten-build-commands.patch \
>              file://mips-rld-map-check.patch \
> +           file://eglibc-fixup-arm-eabi-nothumb.patch \
>              file://etc/ld.so.conf \
>              file://generate-supported.mk \
>   	  "
> diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
> index 41fe7c7..e54692b 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.13.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
> @@ -3,7 +3,7 @@ require eglibc.inc
>   SRCREV = "14157"
>
>   DEPENDS += "gperf-native"
> -PR = "r9"
> +PR = "r10"
>   PR_append = "+svnr${SRCPV}"
>
>   EGLIBC_BRANCH="eglibc-2_13"
> @@ -13,6 +13,7 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http
>              file://shorten-build-commands.patch \
>              file://mips-rld-map-check.patch \
>              file://stack-protector-test.patch \
> +           file://eglibc-fixup-arm-eabi-nothumb.patch \
>              file://etc/ld.so.conf \
>              file://generate-supported.mk \
>              file://glibc_bug_fix_12454.patch \


