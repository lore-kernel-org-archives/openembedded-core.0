Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA477C61DA4
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 23:31:22 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.3195.1676417475601539423
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 15:31:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=J6lObkle;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 416D9C0002;
	Tue, 14 Feb 2023 23:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676417472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HLhFXL48pogqqXUnh7GRbUslo3q3lSphYt4ErMMFhzc=;
	b=J6lObkleNqL1xxTvxVv7DLKwshQpsb/1dRPSuny0ukmv0PLY3wkyyPaIpRYdVc52APbfgb
	EleDrZH/LjUU9DusYkPHDE7p1gXfukoPTmOwRMlYm7yf2R7nVW+Iu7leD9pP0bdIJMUCT2
	bcVd04OSzQ1gmlYhm1zGp10Nm9e9wvmZsOSd9NhqYvnyPgOaCbWQkcKxCysfsqWKviQSmo
	kzK5/mHyNU57BglesuUTuYWB0X6QHDuK9cmIBth0rUs0X68s2jv3Or3ld6prwcC3uBz36P
	Qx9d/sWV21kIs1ln+exhqKlURakul4JN8bQMnugXsseyMzRFoSBgjOLXSzEgXg==
Date: Wed, 15 Feb 2023 00:31:11 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Subject: Re: [OE-core] [PATCH 1/2] site: remove glib site values
Message-ID: <Y+wZv+VfY7CatrUu@mail.local>
References: <20230214155603.2390194-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214155603.2390194-1-ross.burton@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 23:31:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177177

Hello Ross,

iI think this is causes failures on the AB while building nativesdk-pkgconfig:

https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/6725/steps/12/logs/stdio

| checking for growing stack pointer... configure: error: in `/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-pkgconfig/0.29.2+gitAUTOINC+d97db4fae4-r0/build/glib':
| configure: error: cannot run test program while cross compiling
| See `config.log' for more details
| configure: error: ../../git/glib/configure failed for glib
| NOTE: The following config.log files may provide further information.
| NOTE: /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-pkgconfig/0.29.2+gitAUTOINC+d97db4fae4-r0/build/glib/config.log /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-pkgconfig/0.29.2+gitAUTOINC+d97db4fae4-r0/build/config.log
| ERROR: configure failed
| WARNING: /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-pkgconfig/0.29.2+gitAUTOINC+d97db4fae4-r0/temp/run.do_configure.24368:285 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-pkgconfig/0.29.2+gitAUTOINC+d97db4fae4-r0/temp/run.do_configure.24368, line 285
| 	#2: oe_runconf, /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-pkgconfig/0.29.2+gitAUTOINC+d97db4fae4-r0/temp/run.do_configure.24368, line 261
| 	#3: autotools_do_configure, /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-pkgconfig/0.29.2+gitAUTOINC+d97db4fae4-r0/temp/run.do_configure.24368, line 231
| 	#4: do_configure, /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-pkgconfig/0.29.2+gitAUTOINC+d97db4fae4-r0/temp/run.do_configure.24368, line 151
| 	#5: main, /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-pkgconfig/0.29.2+gitAUTOINC+d97db4fae4-r0/temp/run.do_configure.24368, line 289
NOTE: recipe nativesdk-pkgconfig-0.29.2+gitAUTOINC+d97db4fae4-r0: task do_configure: Failed
ERROR: Task (virtual:nativesdk:/home/pokybuild/yocto-worker/beaglebone/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_configure) failed with exit code '1'

Let me know if you want config.log, I pulled it from the worker.

On 14/02/2023 15:56:02+0000, Ross Burton wrote:
> GLib 1.x is incredibly obsolete and GLib 2.x is built using Meson
> not autotools, so we can remove the GLib entries from the site files.
> 
> Also fix a few copy/paste typos where glib_ was used incorrectly, for example:
> 
>   ac_cv_sizeof_ptrdiff_t=${glib_cv_sizeof_ptrdiff_t=4}
> 
> The glib_cv_ should be ac_cv_.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/site/arc-common          |  4 ----
>  meta/site/arm-32              | 15 ---------------
>  meta/site/arm-64              | 15 ---------------
>  meta/site/arm-common          | 19 -------------------
>  meta/site/arm-darwin          |  2 --
>  meta/site/arm-darwin8         |  2 --
>  meta/site/arm-linux           |  2 +-
>  meta/site/armeb-linux         |  2 +-
>  meta/site/common-glibc        | 13 -------------
>  meta/site/common-musl         |  9 ---------
>  meta/site/ix86-common         | 22 ----------------------
>  meta/site/loongarch64-linux   |  4 ----
>  meta/site/microblaze-linux    | 23 -----------------------
>  meta/site/mips-common         |  7 -------
>  meta/site/mips-linux          | 18 ------------------
>  meta/site/mips64-linux        | 22 ----------------------
>  meta/site/mips64el-linux      | 22 ----------------------
>  meta/site/mipsel-linux        | 18 ------------------
>  meta/site/mipsisa32r6-linux   | 18 ------------------
>  meta/site/mipsisa32r6el-linux | 18 ------------------
>  meta/site/mipsisa64r6-linux   | 22 ----------------------
>  meta/site/mipsisa64r6el-linux | 22 ----------------------
>  meta/site/nios2-linux         | 35 +----------------------------------
>  meta/site/powerpc-common      |  5 -----
>  meta/site/powerpc-linux       |  5 -----
>  meta/site/powerpc32-linux     | 26 --------------------------
>  meta/site/riscv32-linux       |  4 ----
>  meta/site/riscv64-linux       |  4 ----
>  meta/site/sh-common           | 33 ---------------------------------
>  meta/site/sparc-linux         |  6 ------
>  meta/site/x32-linux           |  3 ---
>  meta/site/x86_64-linux        | 22 ----------------------
>  32 files changed, 3 insertions(+), 439 deletions(-)
> 
> diff --git a/meta/site/arc-common b/meta/site/arc-common
> index d3c721a8bb9..5cdad0b07b0 100644
> --- a/meta/site/arc-common
> +++ b/meta/site/arc-common
> @@ -3,9 +3,5 @@ ac_cv_alignof_guint32=4
>  ac_cv_alignof_guint64=4
>  ac_cv_alignof_unsigned_long=4
>  
> -# glib-2.0
> -glib_cv_stack_grows=${glib_cv_stack_grows=no}
> -glib_cv_uscore=${glib_cv_uscore=no}
> -
>  # startup-notification
>  lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
> diff --git a/meta/site/arm-32 b/meta/site/arm-32
> index 60ada2e974d..c6af852354e 100644
> --- a/meta/site/arm-32
> +++ b/meta/site/arm-32
> @@ -4,21 +4,6 @@
>  ac_cv_sizeof_size_t=${ac_cv_sizeof_size_t=4}
>  ac_cv_sizeof_ssize_t=${ac_cv_sizeof_ssize_t=4}
>  
> -# glib
> -glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
> -glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
> -glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
> -
> -# glib-2.0
> -glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
> -glib_cv_sizeof_intmax_t=${glib_cv_sizeof_intmax_t=8}
> -glib_cv_sizeof_ptrdiff_t=${glib_cv_sizeof_ptrdiff_t=4}
> -glib_cv_sizeof_size_t=${glib_cv_sizeof_size_t=4}
> -glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
> -ac_cv_alignof_guint32=4
> -ac_cv_alignof_guint64=8
> -ac_cv_alignof_unsigned_long=4
> -
>  # jikes
>  ac_cv_sizeof_wchar_t=4
>  
> diff --git a/meta/site/arm-64 b/meta/site/arm-64
> index 40763fb0592..79c10dab0e8 100644
> --- a/meta/site/arm-64
> +++ b/meta/site/arm-64
> @@ -7,21 +7,6 @@ ac_cv_sizeof_ssize_t=8
>  ac_cv_alignof_char=1
>  ac_cv_alignof_double=8
>  
> -# glib
> -#glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
> -#glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
> -#glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
> -
> -# glib-2.0
> -#glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
> -#glib_cv_sizeof_intmax_t=${glib_cv_sizeof_intmax_t=8}
> -#glib_cv_sizeof_ptrdiff_t=${glib_cv_sizeof_ptrdiff_t=4}
> -#glib_cv_sizeof_size_t=${glib_cv_sizeof_size_t=4}
> -#glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
> -ac_cv_alignof_guint32=4
> -ac_cv_alignof_guint64=8
> -ac_cv_alignof_unsigned_long=8
> -
>  # at-spi2-core
>  ac_cv_alignof_dbind_pointer=8
>  ac_cv_alignof_dbind_struct=1
> diff --git a/meta/site/arm-common b/meta/site/arm-common
> index 4c25c82be95..18c6d422008 100644
> --- a/meta/site/arm-common
> +++ b/meta/site/arm-common
> @@ -41,25 +41,6 @@ ac_cv_func_fnmatch_works=${ac_cv_func_fnmatch_works=yes}
>  # gettext
>  am_cv_func_working_getline=${am_cv_func_working_getline=yes}
>  
> -# glib
> -glib_cv_stack_grows=${glib_cv_stack_grows=no}
> -glib_cv_uscore=${glib_cv_uscore=no}
> -glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
> -glib_cv_has__inline=${glib_cv_has__inline=yes}
> -glib_cv_has__inline__=${glib_cv_has__inline__=yes}
> -glib_cv_hasinline=${glib_cv_hasinline=yes}
> -glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
> -glib_cv_uscore=${glib_cv_uscore=no}
> -glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
> -glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
> -glib_cv_sys_pthread_mutex_trylock_posix=${glib_cv_sys_pthread_mutex_trylock_posix=yes}
> -glib_cv_sys_pthread_getspecific_posix=${glib_cv_sys_pthread_getspecific_posix=yes}
> -glib_cv_sys_pthread_cond_timedwait_posix=${glib_cv_sys_pthread_cond_timedwait_posix=yes}
> -
> -# glib-2.0
> -glib_cv_long_long_format=${glib_cv_long_long_format=ll}
> -glib_cv_sys_use_pid_niceness_surrogate=${glib_cv_sys_use_pid_niceness_surrogate=yes}
> -
>  #gstreamer
>  as_cv_unaligned_access=${as_cv_unaligned_access=no}
>  
> diff --git a/meta/site/arm-darwin b/meta/site/arm-darwin
> index 09ff097aa0d..00d9a64aa71 100644
> --- a/meta/site/arm-darwin
> +++ b/meta/site/arm-darwin
> @@ -1,7 +1,5 @@
>  ac_cv_lib_m_sin=${ac_cv_lib_m_sin=yes}
>  ac_cv_func_posix_spawn=${ac_cv_func_posix_spawn=no}
> -glib_cv_stack_grows=${glib_cv_stack_grows=no}
> -glib_cv_uscore=${glib_cv_uscore=no}
>  ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=no}
>  ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=no}
>  ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=no}
> diff --git a/meta/site/arm-darwin8 b/meta/site/arm-darwin8
> index 09ff097aa0d..00d9a64aa71 100644
> --- a/meta/site/arm-darwin8
> +++ b/meta/site/arm-darwin8
> @@ -1,7 +1,5 @@
>  ac_cv_lib_m_sin=${ac_cv_lib_m_sin=yes}
>  ac_cv_func_posix_spawn=${ac_cv_func_posix_spawn=no}
> -glib_cv_stack_grows=${glib_cv_stack_grows=no}
> -glib_cv_uscore=${glib_cv_uscore=no}
>  ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=no}
>  ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=no}
>  ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=no}
> diff --git a/meta/site/arm-linux b/meta/site/arm-linux
> index fb3c81d0e97..c4205a4a2e7 100644
> --- a/meta/site/arm-linux
> +++ b/meta/site/arm-linux
> @@ -17,7 +17,7 @@ ac_cv_sizeof_long_p=${ac_cv_sizeof_long_p=4}
>  ac_cv_sizeof_float=${ac_cv_sizeof_float=4}
>  ac_cv_sizeof_double=${ac_cv_sizeof_double=8}
>  ac_cv_sizeof_long_double=${ac_cv_sizeof_long_double=8}
> -ac_cv_sizeof_ptrdiff_t=${glib_cv_sizeof_ptrdiff_t=4}
> +ac_cv_sizeof_ptrdiff_t=${ac_cv_sizeof_ptrdiff_t=4}
>  ac_cv_sizeof_unsigned_short=${ac_cv_sizeof_unsigned_short=2}
>  ac_cv_sizeof_unsigned=${ac_cv_sizeof_unsigned=4}
>  ac_cv_sizeof_unsigned_int=${ac_cv_sizeof_unsigned_int=4}
> diff --git a/meta/site/armeb-linux b/meta/site/armeb-linux
> index 6521ff584ae..3e57e1843c5 100644
> --- a/meta/site/armeb-linux
> +++ b/meta/site/armeb-linux
> @@ -12,7 +12,7 @@ ac_cv_sizeof_void_p=${ac_cv_sizeof_void_p=4}
>  ac_cv_sizeof_long_double=${ac_cv_sizeof_long_double=8}
>  ac_cv_sizeof_char_p=${ac_cv_sizeof_char_p=4}
>  ac_cv_sizeof_unsigned=${ac_cv_sizeof_unsigned=4}
> -ac_cv_sizeof_ptrdiff_t=${glib_cv_sizeof_ptrdiff_t=4}
> +ac_cv_sizeof_ptrdiff_t=${ac_cv_sizeof_ptrdiff_t=4}
>  
>  ac_cv_uchar=${ac_cv_uchar=no}
>  ac_cv_uint=${ac_cv_uint=yes}
> diff --git a/meta/site/common-glibc b/meta/site/common-glibc
> index 0a665658fb1..7ba91e03c04 100644
> --- a/meta/site/common-glibc
> +++ b/meta/site/common-glibc
> @@ -36,19 +36,6 @@ gl_cv_func_working_mkstemp=${gl_cv_func_working_mkstemp=yes}
>  gl_cv_func_working_mktime=${gl_cv_func_working_mktime=yes}
>  gl_cv_func_working_utimes=${gl_cv_func_working_utimes=yes}
>  
> -# glib
> -glib_cv_strlcpy=${glib_cv_strlcpy=no}
> -ac_cv_func_printf_unix98=${ac_cv_func_printf_unix98=yes}
> -ac_cv_func_snprintf_c99=${ac_cv_func_snprintf_c99=yes}
> -ac_cv_func_vsnprintf_c99=${ac_cv_func_vsnprintf_c99=yes}
> -glib_cv_compliant_posix_memalign=${glib_cv_compliant_posix_memalign=1}
> -glib_cv_long_long_format=${glib_cv_long_long_format=ll}
> -# glib-1.x requires this and pkgconfig-native / pkgconfig-nativesdk use
> -# that to avoid a dependency loop.
> -glib_cv___va_copy=${glib_cv___va_copy=yes}
> -glib_cv_va_copy=${glib_cv_va_copy=yes}
> -glib_cv_have_qsort_r=${glib_cv_have_qsort_r=yes}
> -
>  #dbus-glib
>  ac_cv_have_abstract_sockets=${ac_cv_have_abstract_sockets=yes}
>  
> diff --git a/meta/site/common-musl b/meta/site/common-musl
> index 23e50ef7491..0fd0413819e 100644
> --- a/meta/site/common-musl
> +++ b/meta/site/common-musl
> @@ -18,15 +18,6 @@ ac_cv_func_strtod=${ac_cv_func_strtod=yes}
>  # off_t is always 64bit on musl systems
>  ac_cv_sys_file_offset_bits=${ac_cv_sys_file_offset_bits=64}
>  
> -# glib
> -glib_cv_strlcpy=${glib_cv_strlcpy=no}
> -ac_cv_func_printf_unix98=${ac_cv_func_printf_unix98=yes}
> -ac_cv_func_snprintf_c99=${ac_cv_func_snprintf_c99=yes}
> -ac_cv_func_vsnprintf_c99=${ac_cv_func_vsnprintf_c99=yes}
> -glib_cv_compliant_posix_memalign=${glib_cv_compliant_posix_memalign=1}
> -glib_cv_long_long_format=${glib_cv_long_long_format=ll}
> -glib_cv_have_qsort_r=${glib_cv_have_qsort_r=yes}
> -
>  #dbus-glib
>  ac_cv_have_abstract_sockets=${ac_cv_have_abstract_sockets=yes}
>  
> diff --git a/meta/site/ix86-common b/meta/site/ix86-common
> index d98ae5265b0..b97b2e3f60c 100644
> --- a/meta/site/ix86-common
> +++ b/meta/site/ix86-common
> @@ -69,28 +69,6 @@ ettercap_cv_type_socklen_t=${ettercap_cv_type_socklen_t=yes}
>  # gettext
>  am_cv_func_working_getline=${am_cv_func_working_getline=yes}
>  
> -# glib
> -glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
> -glib_cv_has__inline=${glib_cv_has__inline=yes}
> -glib_cv_has__inline__=${glib_cv_has__inline__=yes}
> -glib_cv_hasinline=${glib_cv_hasinline=yes}
> -glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
> -glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
> -glib_cv_sys_pthread_cond_timedwait_posix=${glib_cv_sys_pthread_cond_timedwait_posix=yes}
> -glib_cv_sys_pthread_getspecific_posix=${glib_cv_sys_pthread_getspecific_posix=yes}
> -glib_cv_sys_pthread_mutex_trylock_posix=${glib_cv_sys_pthread_mutex_trylock_posix=yes}
> -glib_cv_uscore=${glib_cv_uscore=no}
> -glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
> -glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=yes}
> -
> -# glib-2.0
> -glib_cv_stack_grows=${glib_cv_stack_grows=no}
> -utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
> -glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
> -ac_cv_alignof_guint32=4
> -ac_cv_alignof_guint64=4
> -ac_cv_alignof_unsigned_long=4
> -
>  # guile
>  ac_cv_uchar=${ac_cv_uchar=no}
>  ac_cv_uint=${ac_cv_uint=yes}
> diff --git a/meta/site/loongarch64-linux b/meta/site/loongarch64-linux
> index 38bc5f044dd..384d3bd8774 100644
> --- a/meta/site/loongarch64-linux
> +++ b/meta/site/loongarch64-linux
> @@ -3,9 +3,5 @@ ac_cv_alignof_guint32=4
>  ac_cv_alignof_guint64=8
>  ac_cv_alignof_unsigned_long=8
>  
> -# glib-2.0
> -glib_cv_stack_grows=${glib_cv_stack_grows=no}
> -glib_cv_uscore=${glib_cv_uscore=no}
> -
>  # startup-notification
>  lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
> diff --git a/meta/site/microblaze-linux b/meta/site/microblaze-linux
> index c6a40c6bec5..61dcd43e8c8 100644
> --- a/meta/site/microblaze-linux
> +++ b/meta/site/microblaze-linux
> @@ -26,29 +26,6 @@ ac_cv_uint=${ac_cv_uint=yes}
>  ac_cv_ulong=${ac_cv_ulong=yes}
>  ac_cv_ushort=${ac_cv_ushort=yes}
>  
> -# glib
> -glib_cv_stack_grows=${glib_cv_stack_grows=no}
> -glib_cv_has__inline=${glib_cv_has__inline=yes}
> -glib_cv_has__inline__=${glib_cv_has__inline__=yes}
> -glib_cv_hasinline=${glib_cv_hasinline=yes}
> -glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
> -glib_cv_uscore=${glib_cv_uscore=no}
> -glib_cv_va_copy=${glib_cv_va_copy=yes}
> -glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
> -glib_cv___va_copy=${glib_cv___va_copy=yes}
> -
> -# glib-2.0
> -glib_cv_long_long_format=${glib_cv_long_long_format=ll}
> -ac_cv_alignof_guint32=4
> -ac_cv_alignof_guint64=8
> -ac_cv_alignof_unsigned_long=4
> -glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
> -glib_cv_sizeof_intmax_t=${glib_cv_sizeof_intmax_t=8}
> -glib_cv_sizeof_ptrdiff_t=${glib_cv_sizeof_ptrdiff_t=4}
> -glib_cv_sizeof_size_t=${glib_cv_sizeof_size_t=4}
> -glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
> -glib_cv_sys_use_pid_niceness_surrogate=${glib_cv_sys_use_pid_niceness_surrogate=yes}
> -
>  # startup-notification
>  lf_cv_sane_realloc=yes
>  
> diff --git a/meta/site/mips-common b/meta/site/mips-common
> index 892817b1080..ff1b7f4e5e0 100644
> --- a/meta/site/mips-common
> +++ b/meta/site/mips-common
> @@ -18,13 +18,6 @@ screen_cv_sys_terminfo_used=${screen_cv_sys_terminfo_used=yes}
>  # apache
>  ac_cv_sizeof_ssize_t=${ac_cv_sizeof_ssize_t=4}
>  
> -# glib
> -glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
> -ac_cv_alignof_guint32=4
> -ac_cv_alignof_guint64=8
> -ac_cv_alignof_unsigned_long=4
> -
> -
>  # slrn
>  slrn_cv_va_val_copy=${slrn_cv_va_val_copy=yes}
>  
> diff --git a/meta/site/mips-linux b/meta/site/mips-linux
> index b2f15eee183..91570ec3098 100644
> --- a/meta/site/mips-linux
> +++ b/meta/site/mips-linux
> @@ -15,24 +15,6 @@ ac_cv_have_space_d_name_in_struct_dirent=${ac_cv_have_space_d_name_in_struct_dir
>  # fget
>  compat_cv_func_snprintf_works=${compat_cv_func_snprintf_works=yes}
>  
> -# glib
> -glib_cv___va_copy=${glib_cv___va_copy=yes}
> -glib_cv_has__inline=${glib_cv_has__inline=yes}
> -glib_cv_has__inline__=${glib_cv_has__inline__=yes}
> -glib_cv_hasinline=${glib_cv_hasinline=yes}
> -glib_cv_long_long_format=${glib_cv_long_long_format=ll}
> -glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
> -glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
> -glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
> -glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
> -glib_cv_stack_grows=${glib_cv_stack_grows=no}
> -glib_cv_uscore=${glib_cv_uscore=no}
> -
> -# glib-2.0
> -glib_cv_stack_grows=${glib_cv_stack_grows=no}
> -utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
> -glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
> -
>  # libpcap
>  ac_cv_linux_vers=${ac_cv_linux_vers=2}
>  
> diff --git a/meta/site/mips64-linux b/meta/site/mips64-linux
> index e7c16405eb2..7e05b94a093 100644
> --- a/meta/site/mips64-linux
> +++ b/meta/site/mips64-linux
> @@ -15,28 +15,6 @@ ac_cv_have_space_d_name_in_struct_dirent=${ac_cv_have_space_d_name_in_struct_dir
>  # fget
>  compat_cv_func_snprintf_works=${compat_cv_func_snprintf_works=yes}
>  
> -# glib
> -glib_cv___va_copy=${glib_cv___va_copy=yes}
> -glib_cv_has__inline=${glib_cv_has__inline=yes}
> -glib_cv_has__inline__=${glib_cv_has__inline__=yes}
> -glib_cv_hasinline=${glib_cv_hasinline=yes}
> -glib_cv_long_long_format=${glib_cv_long_long_format=ll}
> -glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
> -glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
> -glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
> -glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
> -glib_cv_stack_grows=${glib_cv_stack_grows=no}
> -glib_cv_uscore=${glib_cv_uscore=no}
> -
> -# glib-2.0
> -glib_cv_stack_grows=${glib_cv_stack_grows=no}
> -utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
> -glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
> -ac_cv_alignof_guint32=4
> -ac_cv_alignof_guint64=8
> -ac_cv_alignof_unsigned_long=8
> -ac_cv_sizeof_ssize_t=8
> -
>  # libpcap
>  ac_cv_linux_vers=${ac_cv_linux_vers=2}
>  
> diff --git a/meta/site/mips64el-linux b/meta/site/mips64el-linux
> index 406ffd66c5d..1e1d7687c28 100644
> --- a/meta/site/mips64el-linux
> +++ b/meta/site/mips64el-linux
> @@ -15,28 +15,6 @@ ac_cv_have_space_d_name_in_struct_dirent=${ac_cv_have_space_d_name_in_struct_dir
>  # fget
>  compat_cv_func_snprintf_works=${compat_cv_func_snprintf_works=yes}
>  
> -# glib
> -glib_cv___va_copy=${glib_cv___va_copy=yes}
> -glib_cv_has__inline=${glib_cv_has__inline=yes}
> -glib_cv_has__inline__=${glib_cv_has__inline__=yes}
> -glib_cv_hasinline=${glib_cv_hasinline=yes}
> -glib_cv_long_long_format=${glib_cv_long_long_format=ll}
> -glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
> -glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
> -glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
> -glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
> -glib_cv_stack_grows=${glib_cv_stack_grows=no}
> -glib_cv_uscore=${glib_cv_uscore=no}
> -
> -# glib-2.0
> -glib_cv_stack_grows=${glib_cv_stack_grows=no}
> -utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
> -glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
> -ac_cv_alignof_guint32=4
> -ac_cv_alignof_guint64=8
> -ac_cv_alignof_unsigned_long=8
> -ac_cv_sizeof_ssize_t=8
> -
>  # libpcap
>  ac_cv_linux_vers=${ac_cv_linux_vers=2}
>  
> diff --git a/meta/site/mipsel-linux b/meta/site/mipsel-linux
> index e9cf193cec2..a3077f21610 100644
> --- a/meta/site/mipsel-linux
> +++ b/meta/site/mipsel-linux
> @@ -15,24 +15,6 @@ ac_cv_have_space_d_name_in_struct_dirent=${ac_cv_have_space_d_name_in_struct_dir
>  # fget
>  compat_cv_func_snprintf_works=${compat_cv_func_snprintf_works=yes}
>  
> -# glib
> -glib_cv___va_copy=${glib_cv___va_copy=yes}
> -glib_cv_has__inline=${glib_cv_has__inline=yes}
> -glib_cv_has__inline__=${glib_cv_has__inline__=yes}
> -glib_cv_hasinline=${glib_cv_hasinline=yes}
> -glib_cv_long_long_format=${glib_cv_long_long_format=ll}
> -glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
> -glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
> -glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
> -glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
> -glib_cv_stack_grows=${glib_cv_stack_grows=no}
> -glib_cv_uscore=${glib_cv_uscore=no}
> -
> -# glib-2.0
> -glib_cv_stack_grows=${glib_cv_stack_grows=no}
> -utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
> -glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
> -
>  # libpcap
>  ac_cv_linux_vers=${ac_cv_linux_vers=2}
>  
> diff --git a/meta/site/mipsisa32r6-linux b/meta/site/mipsisa32r6-linux
> index b2f15eee183..91570ec3098 100644
> --- a/meta/site/mipsisa32r6-linux
> +++ b/meta/site/mipsisa32r6-linux
> @@ -15,24 +15,6 @@ ac_cv_have_space_d_name_in_struct_dirent=${ac_cv_have_space_d_name_in_struct_dir
>  # fget
>  compat_cv_func_snprintf_works=${compat_cv_func_snprintf_works=yes}
>  
> -# glib
> -glib_cv___va_copy=${glib_cv___va_copy=yes}
> -glib_cv_has__inline=${glib_cv_has__inline=yes}
> -glib_cv_has__inline__=${glib_cv_has__inline__=yes}
> -glib_cv_hasinline=${glib_cv_hasinline=yes}
> -glib_cv_long_long_format=${glib_cv_long_long_format=ll}
> -glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
> -glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
> -glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
> -glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
> -glib_cv_stack_grows=${glib_cv_stack_grows=no}
> -glib_cv_uscore=${glib_cv_uscore=no}
> -
> -# glib-2.0
> -glib_cv_stack_grows=${glib_cv_stack_grows=no}
> -utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
> -glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
> -
>  # libpcap
>  ac_cv_linux_vers=${ac_cv_linux_vers=2}
>  
> diff --git a/meta/site/mipsisa32r6el-linux b/meta/site/mipsisa32r6el-linux
> index e9cf193cec2..a3077f21610 100644
> --- a/meta/site/mipsisa32r6el-linux
> +++ b/meta/site/mipsisa32r6el-linux
> @@ -15,24 +15,6 @@ ac_cv_have_space_d_name_in_struct_dirent=${ac_cv_have_space_d_name_in_struct_dir
>  # fget
>  compat_cv_func_snprintf_works=${compat_cv_func_snprintf_works=yes}
>  
> -# glib
> -glib_cv___va_copy=${glib_cv___va_copy=yes}
> -glib_cv_has__inline=${glib_cv_has__inline=yes}
> -glib_cv_has__inline__=${glib_cv_has__inline__=yes}
> -glib_cv_hasinline=${glib_cv_hasinline=yes}
> -glib_cv_long_long_format=${glib_cv_long_long_format=ll}
> -glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
> -glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
> -glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
> -glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
> -glib_cv_stack_grows=${glib_cv_stack_grows=no}
> -glib_cv_uscore=${glib_cv_uscore=no}
> -
> -# glib-2.0
> -glib_cv_stack_grows=${glib_cv_stack_grows=no}
> -utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
> -glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
> -
>  # libpcap
>  ac_cv_linux_vers=${ac_cv_linux_vers=2}
>  
> diff --git a/meta/site/mipsisa64r6-linux b/meta/site/mipsisa64r6-linux
> index e7c16405eb2..7e05b94a093 100644
> --- a/meta/site/mipsisa64r6-linux
> +++ b/meta/site/mipsisa64r6-linux
> @@ -15,28 +15,6 @@ ac_cv_have_space_d_name_in_struct_dirent=${ac_cv_have_space_d_name_in_struct_dir
>  # fget
>  compat_cv_func_snprintf_works=${compat_cv_func_snprintf_works=yes}
>  
> -# glib
> -glib_cv___va_copy=${glib_cv___va_copy=yes}
> -glib_cv_has__inline=${glib_cv_has__inline=yes}
> -glib_cv_has__inline__=${glib_cv_has__inline__=yes}
> -glib_cv_hasinline=${glib_cv_hasinline=yes}
> -glib_cv_long_long_format=${glib_cv_long_long_format=ll}
> -glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
> -glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
> -glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
> -glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
> -glib_cv_stack_grows=${glib_cv_stack_grows=no}
> -glib_cv_uscore=${glib_cv_uscore=no}
> -
> -# glib-2.0
> -glib_cv_stack_grows=${glib_cv_stack_grows=no}
> -utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
> -glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
> -ac_cv_alignof_guint32=4
> -ac_cv_alignof_guint64=8
> -ac_cv_alignof_unsigned_long=8
> -ac_cv_sizeof_ssize_t=8
> -
>  # libpcap
>  ac_cv_linux_vers=${ac_cv_linux_vers=2}
>  
> diff --git a/meta/site/mipsisa64r6el-linux b/meta/site/mipsisa64r6el-linux
> index 406ffd66c5d..1e1d7687c28 100644
> --- a/meta/site/mipsisa64r6el-linux
> +++ b/meta/site/mipsisa64r6el-linux
> @@ -15,28 +15,6 @@ ac_cv_have_space_d_name_in_struct_dirent=${ac_cv_have_space_d_name_in_struct_dir
>  # fget
>  compat_cv_func_snprintf_works=${compat_cv_func_snprintf_works=yes}
>  
> -# glib
> -glib_cv___va_copy=${glib_cv___va_copy=yes}
> -glib_cv_has__inline=${glib_cv_has__inline=yes}
> -glib_cv_has__inline__=${glib_cv_has__inline__=yes}
> -glib_cv_hasinline=${glib_cv_hasinline=yes}
> -glib_cv_long_long_format=${glib_cv_long_long_format=ll}
> -glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
> -glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
> -glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
> -glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
> -glib_cv_stack_grows=${glib_cv_stack_grows=no}
> -glib_cv_uscore=${glib_cv_uscore=no}
> -
> -# glib-2.0
> -glib_cv_stack_grows=${glib_cv_stack_grows=no}
> -utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
> -glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
> -ac_cv_alignof_guint32=4
> -ac_cv_alignof_guint64=8
> -ac_cv_alignof_unsigned_long=8
> -ac_cv_sizeof_ssize_t=8
> -
>  # libpcap
>  ac_cv_linux_vers=${ac_cv_linux_vers=2}
>  
> diff --git a/meta/site/nios2-linux b/meta/site/nios2-linux
> index 656da9fde46..58ffcbc7e2f 100644
> --- a/meta/site/nios2-linux
> +++ b/meta/site/nios2-linux
> @@ -53,39 +53,6 @@ ac_cv_func_fnmatch_works=${ac_cv_func_fnmatch_works=yes}
>  # gettext
>  am_cv_func_working_getline=${am_cv_func_working_getline=yes}
>  
> -# gio
> -ac_cv_func_getgrgid_r=${ac_cv_func_getgrgid_r=yes}
> -
> -# glib
> -glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
> -glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
> -glib_cv_stack_grows=${glib_cv_stack_grows=no}
> -glib_cv_uscore=${glib_cv_uscore=no}
> -glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
> -glib_cv_has__inline=${glib_cv_has__inline=yes}
> -glib_cv_has__inline__=${glib_cv_has__inline__=yes}
> -glib_cv_hasinline=${glib_cv_hasinline=yes}
> -glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
> -glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
> -glib_cv_uscore=${glib_cv_uscore=no}
> -glib_cv_va_copy=${glib_cv_va_copy=yes}
> -glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
> -glib_cv___va_copy=${glib_cv___va_copy=yes}
> -glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
> -ac_cv_func_getpwuid_r=${ac_cv_func_getpwuid_r=yes}
> -glib_cv_sys_pthread_mutex_trylock_posix=${glib_cv_sys_pthread_mutex_trylock_posix=yes}
> -glib_cv_sys_pthread_getspecific_posix=${glib_cv_sys_pthread_getspecific_posix=yes}
> -glib_cv_sys_pthread_cond_timedwait_posix=${glib_cv_sys_pthread_cond_timedwait_posix=yes}
> -
> -# glib-2.0
> -glib_cv_long_long_format=${glib_cv_long_long_format=ll}
> -glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
> -glib_cv_sizeof_intmax_t=${glib_cv_sizeof_intmax_t=8}
> -glib_cv_sizeof_ptrdiff_t=${glib_cv_sizeof_ptrdiff_t=4}
> -glib_cv_sizeof_size_t=${glib_cv_sizeof_size_t=4}
> -glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
> -glib_cv_sys_use_pid_niceness_surrogate=${glib_cv_sys_use_pid_niceness_surrogate=yes}
> -
>  #gstreamer
>  as_cv_unaligned_access=${as_cv_unaligned_access=no}
>  
> @@ -225,7 +192,7 @@ ac_cv_sizeof_long_p=${ac_cv_sizeof_long_p=4}
>  ac_cv_sizeof_float=${ac_cv_sizeof_float=4}
>  ac_cv_sizeof_double=${ac_cv_sizeof_double=8}
>  ac_cv_sizeof_long_double=${ac_cv_sizeof_long_double=8}
> -ac_cv_sizeof_ptrdiff_t=${glib_cv_sizeof_ptrdiff_t=4}
> +ac_cv_sizeof_ptrdiff_t=${ac_cv_sizeof_ptrdiff_t=4}
>  ac_cv_sizeof_unsigned_short=${ac_cv_sizeof_unsigned_short=2}
>  ac_cv_sizeof_unsigned=${ac_cv_sizeof_unsigned=4}
>  ac_cv_sizeof_unsigned_int=${ac_cv_sizeof_unsigned_int=4}
> diff --git a/meta/site/powerpc-common b/meta/site/powerpc-common
> index efa299c664b..02217c70f94 100644
> --- a/meta/site/powerpc-common
> +++ b/meta/site/powerpc-common
> @@ -1,8 +1,3 @@
> -# glib
> -ac_cv_alignof_guint32=4
> -ac_cv_alignof_guint64=8
> -ac_cv_alignof_unsigned_long=4
> -
>  # at-spi2-core
>  ac_cv_alignof_char=1
>  ac_cv_alignof_dbind_pointer=4
> diff --git a/meta/site/powerpc-linux b/meta/site/powerpc-linux
> index a9f89cb5d47..0aa5732fc00 100644
> --- a/meta/site/powerpc-linux
> +++ b/meta/site/powerpc-linux
> @@ -4,11 +4,6 @@ ac_cv_va_val_copy=${ac_cv_va_val_copy=yes}
>  # startup-notification
>  lf_cv_sane_realloc=yes
>  
> -# glib
> -glib_cv_stack_grows=${glib_cv_stack_grows=no}
> -glib_cv_uscore=${glib_cv_uscore=no}
> -glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
> -
>  # lftp
>  lftp_cv_va_val_copy=${lftp_cv_va_val_copy=yes}
>  
> diff --git a/meta/site/powerpc32-linux b/meta/site/powerpc32-linux
> index 764e97e4c31..c2f870b432c 100644
> --- a/meta/site/powerpc32-linux
> +++ b/meta/site/powerpc32-linux
> @@ -97,21 +97,6 @@ php_cv_lib_cookie_io_functions_use_off64_t=${php_cv_lib_cookie_io_functions_use_
>  # gettext
>  am_cv_func_working_getline=${am_cv_func_working_getline=yes}
>  
> -# glib
> -glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
> -glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
> -glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
> -glib_cv_has__inline=${glib_cv_has__inline=yes}
> -glib_cv_has__inline__=${glib_cv_has__inline__=yes}
> -glib_cv_hasinline=${glib_cv_hasinline=yes}
> -glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
> -glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
> -glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
> -glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
> -glib_cv_sys_pthread_mutex_trylock_posix=${glib_cv_sys_pthread_mutex_trylock_posix=yes}
> -glib_cv_sys_pthread_getspecific_posix=${glib_cv_sys_pthread_getspecific_posix=yes}
> -glib_cv_sys_pthread_cond_timedwait_posix=${glib_cv_sys_pthread_cond_timedwait_posix=yes}
> -
>  # ettercap
>  ettercap_cv_type_socklen_t=${ettercap_cv_type_socklen_t=yes}
>  
> @@ -121,17 +106,6 @@ acx_working_snprintf=${acx_working_snprintf=yes}
>  # D-BUS
>  ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
>  
> -# glib 2.0
> -glib_cv_long_long_format=${glib_cv_long_long_format=ll}
> -glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
> -glib_cv_sizeof_intmax_t=${glib_cv_sizeof_intmax_t=8}
> -glib_cv_sizeof_ptrdiff_t=${glib_cv_sizeof_ptrdiff_t=4}
> -glib_cv_sizeof_size_t=${glib_cv_sizeof_size_t=4}
> -glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
> -glib_cv_sys_use_pid_niceness_surrogate=${glib_cv_sys_use_pid_niceness_surrogate=yes}
> -
> -glib_cv_strlcpy=${glib_cv_strlcpy=no}
> -
>  # httppc
>  ac_cv_strerror_r_SUSv3=${ac_cv_strerror_r_SUSv3=no}
>  
> diff --git a/meta/site/riscv32-linux b/meta/site/riscv32-linux
> index 97de628e228..2cc26f3b93f 100644
> --- a/meta/site/riscv32-linux
> +++ b/meta/site/riscv32-linux
> @@ -3,9 +3,5 @@ ac_cv_alignof_guint32=4
>  ac_cv_alignof_guint64=8
>  ac_cv_alignof_unsigned_long=4
>  
> -# glib-2.0
> -glib_cv_stack_grows=${glib_cv_stack_grows=no}
> -glib_cv_uscore=${glib_cv_uscore=no}
> -
>  # startup-notification
>  lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
> diff --git a/meta/site/riscv64-linux b/meta/site/riscv64-linux
> index 38bc5f044dd..384d3bd8774 100644
> --- a/meta/site/riscv64-linux
> +++ b/meta/site/riscv64-linux
> @@ -3,9 +3,5 @@ ac_cv_alignof_guint32=4
>  ac_cv_alignof_guint64=8
>  ac_cv_alignof_unsigned_long=8
>  
> -# glib-2.0
> -glib_cv_stack_grows=${glib_cv_stack_grows=no}
> -glib_cv_uscore=${glib_cv_uscore=no}
> -
>  # startup-notification
>  lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
> diff --git a/meta/site/sh-common b/meta/site/sh-common
> index d269a17db92..720d4543518 100644
> --- a/meta/site/sh-common
> +++ b/meta/site/sh-common
> @@ -103,24 +103,6 @@ ac_cv_pread=${ac_cv_pread=no}
>  ac_cv_pwrite=${ac_cv_pwrite=no}
>  php_cv_lib_cookie_io_functions_use_off64_t=${php_cv_lib_cookie_io_functions_use_off64_t=yes}
>  
> -# glib
> -glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
> -glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
> -glib_cv_stack_grows=${glib_cv_stack_grows=no}
> -glib_cv_uscore=${glib_cv_uscore=no}
> -glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
> -glib_cv_has__inline=${glib_cv_has__inline=yes}
> -glib_cv_has__inline__=${glib_cv_has__inline__=yes}
> -glib_cv_hasinline=${glib_cv_hasinline=yes}
> -glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
> -glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
> -glib_cv_uscore=${glib_cv_uscore=no}
> -glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
> -glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
> -glib_cv_sys_pthread_mutex_trylock_posix=${glib_cv_sys_pthread_mutex_trylock_posix=yes}
> -glib_cv_sys_pthread_getspecific_posix=${glib_cv_sys_pthread_getspecific_posix=yes}
> -glib_cv_sys_pthread_cond_timedwait_posix=${glib_cv_sys_pthread_cond_timedwait_posix=yes}
> -
>  # ettercap
>  ettercap_cv_type_socklen_t=${ettercap_cv_type_socklen_t=yes}
>  
> @@ -130,21 +112,6 @@ acx_working_snprintf=${acx_working_snprintf=yes}
>  # D-BUS
>  ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
>  
> -# glib 2.0
> -glib_cv_long_long_format=${glib_cv_long_long_format=ll}
> -glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
> -glib_cv_sizeof_intmax_t=${glib_cv_sizeof_intmax_t=8}
> -glib_cv_sizeof_ptrdiff_t=${glib_cv_sizeof_ptrdiff_t=4}
> -glib_cv_sizeof_size_t=${glib_cv_sizeof_size_t=4}
> -glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
> -glib_cv_sys_use_pid_niceness_surrogate=${glib_cv_sys_use_pid_niceness_surrogate=yes}
> -
> -glib_cv_strlcpy=${glib_cv_strlcpy=no}
> -glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
> -ac_cv_alignof_guint32=4
> -ac_cv_alignof_guint64=8
> -ac_cv_alignof_unsigned_long=4
> -
>  # httppc
>  ac_cv_strerror_r_SUSv3=${ac_cv_strerror_r_SUSv3=no}
>  
> diff --git a/meta/site/sparc-linux b/meta/site/sparc-linux
> index 49d0d9a3d66..c87eaae5ec3 100644
> --- a/meta/site/sparc-linux
> +++ b/meta/site/sparc-linux
> @@ -38,11 +38,5 @@ am_cv_sys_posix_termios=${am_cv_sys_posix_termios=yes}
>  # gettext
>  am_cv_func_working_getline=${am_cv_func_working_getline=yes}
>  
> -#glib
> -glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
> -glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24} 
> -glib_cv_uscore=${glib_cv_uscore=no}
> -glib_cv_stack_grows=${glib_cv_stack_grows=no}
> -
>  #linux
>  ac_cv_linux_vers=${ac_cv_linux_vers=2}
> diff --git a/meta/site/x32-linux b/meta/site/x32-linux
> index 4b70422ed2a..cf4ef147f7a 100644
> --- a/meta/site/x32-linux
> +++ b/meta/site/x32-linux
> @@ -3,6 +3,3 @@ ac_cv_sizeof_long_double=${ac_cv_sizeof_long_double=16}
>  ac_cv_sizeof_dev_t=${ac_cv_sizeof_dev_t=8}
>  ac_cv_sys_file_offset_bits=${ac_cv_sys_file_offset_bits=64}
>  ac_cv_alignof_double=8
> -
> -# glib
> -glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=32}
> diff --git a/meta/site/x86_64-linux b/meta/site/x86_64-linux
> index ea3176da938..d7b7a530ff5 100644
> --- a/meta/site/x86_64-linux
> +++ b/meta/site/x86_64-linux
> @@ -32,28 +32,6 @@ db_cv_align_t=${db_cv_align_t='unsigned long long'}
>  db_cv_fcntl_f_setfd=${db_cv_fcntl_f_setfd=yes}
>  db_cv_sprintf_count=${db_cv_sprintf_count=yes}
>  
> -# glib
> -glib_cv_hasinline=${glib_cv_hasinline=yes}
> -glib_cv_has__inline=${glib_cv_has__inline=yes}
> -glib_cv_has__inline__=${glib_cv_has__inline__=yes}
> -glib_cv_long_long_format=${glib_cv_long_long_format=ll}
> -glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=yes}
> -glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
> -glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=40}
> -glib_cv_sizeof_intmax_t=${glib_cv_sizeof_intmax_t=8}
> -glib_cv_sizeof_ptrdiff_t=${glib_cv_sizeof_ptrdiff_t=8}
> -glib_cv_sizeof_size_t=${glib_cv_sizeof_size_t=8}
> -glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=8}
> -glib_cv_stack_grows=${glib_cv_stack_grows=no}
> -glib_cv_sys_pthread_cond_timedwait_posix=${glib_cv_sys_pthread_cond_timedwait_posix=yes}
> -glib_cv_sys_pthread_getspecific_posix=${glib_cv_sys_pthread_getspecific_posix=yes}
> -glib_cv_sys_pthread_mutex_trylock_posix=${glib_cv_sys_pthread_mutex_trylock_posix=yes}
> -glib_cv_uscore=${glib_cv_uscore=no}
> -glib_cv_va_val_copy=${glib_cv_va_val_copy=no}
> -ac_cv_alignof_guint32=4
> -ac_cv_alignof_guint64=8
> -ac_cv_alignof_unsigned_long=8
> -
>  nano_cv_func_regexec_segv_emptystr=${nano_cv_func_regexec_segv_emptystr=no}
>  samba_cv_HAVE_VA_COPY=${samba_cv_HAVE_VA_COPY=yes}
>  screen_cv_sys_bcopy_overlap=${screen_cv_sys_bcopy_overlap=no}
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177152): https://lists.openembedded.org/g/openembedded-core/message/177152
> Mute This Topic: https://lists.openembedded.org/mt/96962709/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

