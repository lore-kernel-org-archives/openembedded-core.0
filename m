Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 458376FCE0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 16:00:45 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id rd3so21289716pab.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 09:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wr7r2DfRxlnlQGm4jHyIq0zeaSlzWUq1FSkoERoL9QI=;
	b=vl5/G67swUVVr10MYJQ8VgC9h1NexlceQzpTjQpI4BRsOVAiszLLltxownlxjTGyUB
	Kr8/fXijUJnfJJAfY5IWFXs8FAeUE387LxESVneuW0NlQZECBtdpax0glMRnWBsWhwfM
	ls9z8Lgw4nmeTsCIaTCY20HhdoiQVpAjGG4/jrKWhss8siab7x1N6EQ36Gq6zaayvGiH
	w13/cqz8v2fgr6iLt56axAZ+7Wy5AHWp44M3lD8olLI1sDKYG9NeQ8BSE4bJ3AB5LOu5
	7YD5ouIcAJvY/QHt321ZALs3wAU2bRa9WxCIcpgp7/FzUi8K515XDzQKXK+oRPpzfke/
	kzGw==
X-Received: by 10.69.19.193 with SMTP id gw1mr29673866pbd.106.1408982441572;
	Mon, 25 Aug 2014 09:00:41 -0700 (PDT)
Received: from haswell ([2601:9:3580:7a5:baca:3aff:fe80:aa8f])
	by mx.google.com with ESMTPSA id ct1sm275057pdb.64.2014.08.25.09.00.40
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Aug 2014 09:00:41 -0700 (PDT)
Date: Mon, 25 Aug 2014 09:04:25 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
Message-ID: <20140825160425.GB21358@haswell>
References: <1408935491-79054-1-git-send-email-benjamin.esquivel@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1408935491-79054-1-git-send-email-benjamin.esquivel@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc: Fix to egrep 'yes$' instead 'yes' at configure
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
X-List-Received-Date: Mon, 25 Aug 2014 16:00:49 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 14-08-24 21:58:11, Benjamin Esquivel wrote:
> The pre-processed output of conftest.c contains an include dir
> and if the path of it contains a 'yes' it will cause some variables
> to be wrongly set to yes because of the way it greps for it.
> Fix is to egrep for yes$ instead.
> This has to be done at the configure and the configure.ac files given
> the configure file comes straight out of the source tarball.

May be its better to use a different string then 'yes' which is more
unique and less likely to conflict in tests somthing
like

[AC_EGREP_CPP(we_have_that_sysconf_val,[#ifdef __ARM_PCS_VFP
                       we_have_that_sysconf_val
                      #endif
                     .....


> 
> [YOCTO #6614]
> 
> Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
> ---
>  .../eglibc-2.19/fix-yesdir-falsepositive.patch     | 136 +++++++++++++++++++++
>  meta/recipes-core/eglibc/eglibc_2.19.bb            |   1 +
>  2 files changed, 137 insertions(+)
>  create mode 100644 meta/recipes-core/eglibc/eglibc-2.19/fix-yesdir-falsepositive.patch
> 
> diff --git a/meta/recipes-core/eglibc/eglibc-2.19/fix-yesdir-falsepositive.patch b/meta/recipes-core/eglibc/eglibc-2.19/fix-yesdir-falsepositive.patch
> new file mode 100644
> index 0000000..962203e
> --- /dev/null
> +++ b/meta/recipes-core/eglibc/eglibc-2.19/fix-yesdir-falsepositive.patch
> @@ -0,0 +1,136 @@
> +The pre-processed output of conftest.c contains an include directory and if
> +the path of it contains a 'yes' it will cause some variables to be wrongly set
> +to yes because of the way it greps for it. Fix is to egrep for yes$ instead.
> +
> +Upstream-status: Pending
> +Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com> 
> +Index: libc/ports/sysdeps/aarch64/configure
> +===================================================================
> +--- libc.orig/ports/sysdeps/aarch64/configure
> ++++ libc/ports/sysdeps/aarch64/configure
> +@@ -153,7 +153,7 @@ else
> + 
> + _ACEOF
> + if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
> +-  $EGREP "yes" >/dev/null 2>&1; then :
> ++  $EGREP "yes$" >/dev/null 2>&1; then :
> +   libc_cv_aarch64_be=yes
> + else
> +   libc_cv_aarch64_be=no
> +Index: libc/ports/sysdeps/arm/configure
> +===================================================================
> +--- libc.orig/ports/sysdeps/arm/configure
> ++++ libc/ports/sysdeps/arm/configure
> +@@ -184,7 +184,7 @@ else
> + 
> + _ACEOF
> + if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
> +-  $EGREP "yes" >/dev/null 2>&1; then :
> ++  $EGREP "yes$" >/dev/null 2>&1; then :
> +   libc_cv_arm_pcs_vfp=yes
> + else
> +   libc_cv_arm_pcs_vfp=no
> +Index: libc/ports/sysdeps/mips/configure
> +===================================================================
> +--- libc.orig/ports/sysdeps/mips/configure
> ++++ libc/ports/sysdeps/mips/configure
> +@@ -147,7 +147,7 @@ yes
> + #endif
> + _ACEOF
> + if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
> +-  $EGREP "yes" >/dev/null 2>&1; then :
> ++  $EGREP "yes$" >/dev/null 2>&1; then :
> +   libc_cv_mips_nan2008=yes
> + else
> +   libc_cv_mips_nan2008=no
> +Index: libc/ports/sysdeps/aarch64/configure.ac
> +===================================================================
> +--- libc.orig/ports/sysdeps/aarch64/configure.ac
> ++++ libc/ports/sysdeps/aarch64/configure.ac
> +@@ -10,7 +10,7 @@ GLIBC_PROVIDES dnl See aclocal.m4 in the
> + # the dynamic linker via %ifdef.
> + AC_CACHE_CHECK([for big endian],
> +   [libc_cv_aarch64_be],
> +-  [AC_EGREP_CPP(yes,[#ifdef __AARCH64EB__
> ++  [AC_EGREP_CPP(yes$$,[#ifdef __AARCH64EB__
> +                       yes
> +                      #endif
> +   ], libc_cv_aarch64_be=yes, libc_cv_aarch64_be=no)])
> +Index: libc/ports/sysdeps/arm/configure.ac
> +===================================================================
> +--- libc.orig/ports/sysdeps/arm/configure.ac
> ++++ libc/ports/sysdeps/arm/configure.ac
> +@@ -34,7 +34,7 @@ fi
> + # the dynamic linker via %ifdef.
> + AC_CACHE_CHECK([whether the compiler is using the ARM hard-float ABI],
> +   [libc_cv_arm_pcs_vfp],
> +-  [AC_EGREP_CPP(yes,[#ifdef __ARM_PCS_VFP
> ++  [AC_EGREP_CPP(yes$$,[#ifdef __ARM_PCS_VFP
> +                       yes
> +                      #endif
> +   ], libc_cv_arm_pcs_vfp=yes, libc_cv_arm_pcs_vfp=no)])
> +Index: libc/ports/sysdeps/mips/configure.ac
> +===================================================================
> +--- libc.orig/ports/sysdeps/mips/configure.ac
> ++++ libc/ports/sysdeps/mips/configure.ac
> +@@ -6,7 +6,7 @@ dnl position independent way.
> + dnl AC_DEFINE(PI_STATIC_AND_HIDDEN)
> + 
> + AC_CACHE_CHECK([whether the compiler is using the 2008 NaN encoding],
> +-  libc_cv_mips_nan2008, [AC_EGREP_CPP(yes, [dnl
> ++  libc_cv_mips_nan2008, [AC_EGREP_CPP(yes$$, [dnl
> + #ifdef __mips_nan2008
> + yes
> + #endif], libc_cv_mips_nan2008=yes, libc_cv_mips_nan2008=no)])
> +Index: libc/ports/sysdeps/unix/sysv/linux/mips/configure
> +===================================================================
> +--- libc.orig/ports/sysdeps/unix/sysv/linux/mips/configure
> ++++ libc/ports/sysdeps/unix/sysv/linux/mips/configure
> +@@ -249,7 +249,7 @@ yes
> + #endif
> + _ACEOF
> + if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
> +-  $EGREP "yes" >/dev/null 2>&1; then :
> ++  $EGREP "yes$" >/dev/null 2>&1; then :
> +   libc_cv_mips_nan2008=yes
> + else
> +   libc_cv_mips_nan2008=no
> +Index: libc/ports/sysdeps/unix/sysv/linux/mips/configure.ac
> +===================================================================
> +--- libc.orig/ports/sysdeps/unix/sysv/linux/mips/configure.ac
> ++++ libc/ports/sysdeps/unix/sysv/linux/mips/configure.ac
> +@@ -45,7 +45,7 @@ if test -z "$libc_mips_float"; then
> + fi
> + 
> + AC_CACHE_CHECK([whether the compiler is using the 2008 NaN encoding],
> +-  libc_cv_mips_nan2008, [AC_EGREP_CPP(yes, [dnl
> ++  libc_cv_mips_nan2008, [AC_EGREP_CPP(yes$$, [dnl
> + #ifdef __mips_nan2008
> + yes
> + #endif], libc_cv_mips_nan2008=yes, libc_cv_mips_nan2008=no)])
> +Index: libc/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure
> +===================================================================
> +--- libc.orig/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure
> ++++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure
> +@@ -147,7 +147,7 @@ else
> + 
> + _ACEOF
> + if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
> +-  $EGREP "yes" >/dev/null 2>&1; then :
> ++  $EGREP "yes$" >/dev/null 2>&1; then :
> +   libc_cv_ppc64_elfv2_abi=yes
> + else
> +   libc_cv_ppc64_elfv2_abi=no
> +Index: libc/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure.ac
> +===================================================================
> +--- libc.orig/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure.ac
> ++++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure.ac
> +@@ -4,7 +4,7 @@ GLIBC_PROVIDES dnl See aclocal.m4 in the
> + # Define default-abi according to compiler flags.
> + AC_CACHE_CHECK([whether the compiler is using the PowerPC64 ELFv2 ABI],
> +   [libc_cv_ppc64_elfv2_abi],
> +-  [AC_EGREP_CPP(yes,[#if _CALL_ELF == 2
> ++  [AC_EGREP_CPP(yes$$,[#if _CALL_ELF == 2
> +                       yes
> +                      #endif
> +   ], libc_cv_ppc64_elfv2_abi=yes, libc_cv_ppc64_elfv2_abi=no)])
> diff --git a/meta/recipes-core/eglibc/eglibc_2.19.bb b/meta/recipes-core/eglibc/eglibc_2.19.bb
> index 19bd52d..a97e1cf 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.19.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.19.bb
> @@ -28,6 +28,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr25
>             file://grok_gold.patch \
>             file://fix_am_rootsbindir.patch;striplevel=2 \
>             file://timezone-re-written-tzselect-as-posix-sh.patch \
> +           file://fix-yesdir-falsepositive.patch \
>            "
>  SRC_URI[md5sum] = "197836c2ba42fb146e971222647198dd"
>  SRC_URI[sha256sum] = "baaa030531fc308f7820c46acdf8e1b2f8e3c1f40bcd28b6e440d1c95d170d4c"
> -- 
> 1.8.5.5
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

