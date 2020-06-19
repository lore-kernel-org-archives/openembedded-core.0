Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web12.10268.1592582413316091554
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2020 09:00:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ID+xT/pP;
 spf=pass (domain: gmail.com, ip: 209.85.222.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id g44so3339816uae.12
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2020 09:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p15+S/ZltzwO9fIjvzoT9O1F7FpxedO6lywhFG3mFo0=;
        b=ID+xT/pPza6XzN52KvEpHpl0P0UvaieGejp17ZFQc3sSpOCC7vDHbwFEP0keFFc5kW
         6pRIl3gKiXA99M5G2pUlgAkHfBTPrKvgJmv+/g2Llf3EjXWjDUwC0HrIXbi3uFgTQlLK
         xRBmS1j29zVhKYhBWmqyv+s91VaiDLms8HlJq464qJXll6r8D/28DeY9v/eAzBzqohh1
         YhISMjOA9sbJ3S8nnpVt8yZOzDSgIxg3scX+evw7MsWVewoyJ3QN+fvIUQuylHMUEcm+
         TlowuWwGnYB2+2PyIrmBcbBG6KGFNd2pAZD5e4vRcx5hGM+WBM6S/ERnC2vjdFsKWce+
         IOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p15+S/ZltzwO9fIjvzoT9O1F7FpxedO6lywhFG3mFo0=;
        b=Iig4C000U7GnkHyTWaQbpXXB8Qp/qBmNkWGuHJDlp+oV4FKyPea8tVTrtAbjp0+jEB
         yaxJNdYSir+VwtW6EmnBC5VG2XMCgxTLvj0SMhb/zofGBiZH71Yr24lzcJAZS66UE2PF
         HJr+J3UsYhbWdJj2wWFZY5RroFInhN/g9a0GzA/S8dDwGM09QmwvtzvWyuIfxwTpe6CO
         SSnTqXENVctVeuj9LaLjXJfT2rtJhuqJ3DOw1arKszLpg6edlSnqy9s/q4j0FaIEvSWb
         hZ0UxxaUdM0XbGuo9YU/U+ub1pAcI4oeapYgzuksN3Lg+XyKO7CMhXCOruVQ+QvH8H/R
         bw/A==
X-Gm-Message-State: AOAM533YnbadWEiQ+4Q2tERqNlu2uteeMkTHqqT6glA0EVVH6AEO4k3s
	ZMaghJ9FhXtnP/e4M04nMXoKPnHxM2tNpPmF8YHmbWlD
X-Google-Smtp-Source: ABdhPJy8qgHJ870cK1qtcxzIAylHuPU5OUaVh0ndp0zKLKZTpIVPUz/vjMio2NzVHpuJn4HwCGDO09wXUapIG8T2qlo=
X-Received: by 2002:ab0:168c:: with SMTP id e12mr3159795uaf.89.1592582411295;
 Fri, 19 Jun 2020 09:00:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200619145656.11158-1-sakib.sajal@windriver.com>
In-Reply-To: <20200619145656.11158-1-sakib.sajal@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 19 Jun 2020 17:59:52 +0200
Message-ID: <CANNYZj_Y08o5WKeStd8ayk768nYUAVSi8gSqrpWe5ktPnNN0xQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemu: uprev v4.2.0 -> v5.0.0
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Joe Slater <joe.slater@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000e6a23f05a871fc88"

--000000000000e6a23f05a871fc88
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jun 2020 at 16:59, Sakib Sajal <sakib.sajal@windriver.com> wrote:

> Ran qemu-ptest on x86-64 and arm64 with identical results:
> PASS: 1166
> SKIP:    0
> FAIL:    0
>

Please add qemu-ptest to conf/distro/include/ptest-packagelists.inc if it
is now passing :)


>
> --- a/meta/classes/qemuboot.bbclass
> +++ b/meta/classes/qemuboot.bbclass
> @@ -77,7 +77,7 @@ QB_MEM ?= "-m 256"
>  QB_SERIAL_OPT ?= "-serial mon:stdio -serial null"
>  QB_DEFAULT_KERNEL ?= "${KERNEL_IMAGETYPE}"
>  QB_DEFAULT_FSTYPE ?= "ext4"
> -QB_OPT_APPEND ?= "-show-cursor"
> +QB_OPT_APPEND ?= "-display sdl,show-cursor=on"
>

This is not correct as it enforces the SDL frontend even in non-graphical
environments, or when people want to use gtk instead. Please adjust
scripts/runqemu instead to add the option everywhere where -display is used.

The rest looks fine, thanks for working on this :)

Alex




> --- a/meta/recipes-devtools/qemu/qemu/0001-Add-enable-disable-udev.patch
> +++ b/meta/recipes-devtools/qemu/qemu/0001-Add-enable-disable-udev.patch
> @@ -1,21 +1,24 @@
> -From a471cf4e4c73350e090eb2cd87ec959d138012e5 Mon Sep 17 00:00:00 2001
> +From b921e5204030845dc7c9d16d5f66d965e8d05367 Mon Sep 17 00:00:00 2001
>  From: Jeremy Puhlman <jpuhlman@mvista.com>
>  Date: Thu, 19 Mar 2020 11:54:26 -0700
>  Subject: [PATCH] Add enable/disable libudev
>
>  Upstream-Status: Pending
>  Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
> +
> +[update patch context]
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>  ---
>   configure | 4 ++++
>   1 file changed, 4 insertions(+)
>
>  diff --git a/configure b/configure
> -index cac271c..bd116eb 100755
> +index 36646e7b..48912a94 100755
>  --- a/configure
>  +++ b/configure
> -@@ -1539,6 +1539,10 @@ for opt do
> +@@ -1601,6 +1601,10 @@ for opt do
>     ;;
> -   --disable-plugins) plugins="no"
> +   --gdb=*) gdb_bin="$optarg"
>     ;;
>  +  --enable-libudev) libudev="yes"
>  +  ;;
> @@ -25,5 +28,5 @@ index cac271c..bd116eb 100755
>         echo "ERROR: unknown option $opt"
>         echo "Try '$0 --help' for more information"
>  --
> -1.8.3.1
> +2.24.0
>
> diff --git
> a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-missing-wacom-HID-descriptor.patch
> b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-missing-wacom-HID-descriptor.patch
> index 66ff996508..ae89ae09dd 100644
> ---
> a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-missing-wacom-HID-descriptor.patch
> +++
> b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-missing-wacom-HID-descriptor.patch
> @@ -1,4 +1,4 @@
> -From 526cb7e26f6dd96c9ee2ffa05ce0a358d3bfbfb3 Mon Sep 17 00:00:00 2001
> +From 883feb43129dc39b491e492c7ccfe89aefe53c44 Mon Sep 17 00:00:00 2001
>  From: Richard Purdie <richard.purdie@linuxfoundation.org>
>  Date: Thu, 27 Nov 2014 14:04:29 +0000
>  Subject: [PATCH] qemu: Add missing wacom HID descriptor
> @@ -14,6 +14,8 @@ Signed-off-by: Richard Purdie <
> richard.purdie@linuxfoundation.org>
>  Upstream-Status: Submitted
>  2014/11/27
>
> +[update patch context]
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>  ---
>   hw/usb/dev-wacom.c | 94 +++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 93 insertions(+), 1 deletion(-)
> @@ -137,3 +139,6 @@ index 8ed57b3b..1502928b 100644
>       case WACOM_SET_REPORT:
>           if (s->mouse_grabbed) {
>               qemu_remove_mouse_event_handler(s->eh_entry);
> +--
> +2.24.0
> +
> diff --git
> a/meta/recipes-devtools/qemu/qemu/0001-qemu-Do-not-include-file-if-not-exists.patch
> b/meta/recipes-devtools/qemu/qemu/0001-qemu-Do-not-include-file-if-not-exists.patch
> index eccac0509c..6e38d814cd 100644
> ---
> a/meta/recipes-devtools/qemu/qemu/0001-qemu-Do-not-include-file-if-not-exists.patch
> +++
> b/meta/recipes-devtools/qemu/qemu/0001-qemu-Do-not-include-file-if-not-exists.patch
> @@ -1,4 +1,4 @@
> -From 98c2da129db19ee63d7e21b77a0ef70822c95069 Mon Sep 17 00:00:00 2001
> +From 34247f83095f8cdcdc1f9d7f0c6ffbd46b25d979 Mon Sep 17 00:00:00 2001
>  From: Oleksiy Obitotskyy <oobitots@cisco.com>
>  Date: Wed, 25 Mar 2020 21:21:35 +0200
>  Subject: [PATCH] qemu: Do not include file if not exists
> @@ -8,24 +8,27 @@ if_alg.h still included.
>
>  Upstream-status: Submitted [
> https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg07188.html]
>  Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
> +
> +[update patch context]
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>  ---
>   linux-user/syscall.c | 2 ++
>   1 file changed, 2 insertions(+)
>
>  diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> -index fc18f244..68d62666 100644
> +index d6f8cc97..a61420e7 100644
>  --- a/linux-user/syscall.c
>  +++ b/linux-user/syscall.c
> -@@ -106,7 +106,9 @@
> +@@ -109,7 +109,9 @@
>   #include <linux/blkpg.h>
>   #include <netpacket/packet.h>
>   #include <linux/netlink.h>
>  +#if defined(CONFIG_AF_ALG)
>   #include <linux/if_alg.h>
>  +#endif
> + #include <linux/rtc.h>
> + #include <sound/asound.h>
>   #include "linux_loop.h"
> - #include "uname.h"
> -
>  --
> -2.20.1
> +2.24.0
>
> diff --git
> a/meta/recipes-devtools/qemu/qemu/0002-Add-subpackage-ptest-which-runs-all-unit-test-cases-.patch
> b/meta/recipes-devtools/qemu/qemu/0002-Add-subpackage-ptest-which-runs-all-unit-test-cases-.patch
> index 7f7da51006..3d268870fc 100644
> ---
> a/meta/recipes-devtools/qemu/qemu/0002-Add-subpackage-ptest-which-runs-all-unit-test-cases-.patch
> +++
> b/meta/recipes-devtools/qemu/qemu/0002-Add-subpackage-ptest-which-runs-all-unit-test-cases-.patch
> @@ -1,4 +1,4 @@
> -From 8ee6281516bd9210e75e91d705da8916bab3bf51 Mon Sep 17 00:00:00 2001
> +From 5da6cef7761157a003e7ebde74fb3cf90ab396d9 Mon Sep 17 00:00:00 2001
>  From: Juro Bystricky <juro.bystricky@intel.com>
>  Date: Thu, 31 Aug 2017 11:06:56 -0700
>  Subject: [PATCH] Add subpackage -ptest which runs all unit test cases for
> @@ -10,17 +10,19 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
>
>  Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
>
> +[update patch context]
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>  ---
>   tests/Makefile.include | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
>  diff --git a/tests/Makefile.include b/tests/Makefile.include
> -index 8566f5f1..52d0320b 100644
> +index 51de6762..1ea4d322 100644
>  --- a/tests/Makefile.include
>  +++ b/tests/Makefile.include
> -@@ -1210,4 +1210,12 @@ all: $(QEMU_IOTESTS_HELPERS-y)
> - -include $(wildcard tests/*.d)
> - -include $(wildcard tests/libqos/*.d)
> +@@ -941,4 +941,12 @@ all: $(QEMU_IOTESTS_HELPERS-y)
> + -include $(wildcard tests/qtest/*.d)
> + -include $(wildcard tests/qtest/libqos/*.d)
>
>  +buildtest-TESTS: $(check-unit-y)
>  +
> @@ -31,3 +33,6 @@ index 8566f5f1..52d0320b 100644
>  +      done
>  +
>   endif
> +--
> +2.24.0
> +
> diff --git
> a/meta/recipes-devtools/qemu/qemu/0005-qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch
> b/meta/recipes-devtools/qemu/qemu/0005-qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch
> index ec303371b0..2c5b241e41 100644
> ---
> a/meta/recipes-devtools/qemu/qemu/0005-qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch
> +++
> b/meta/recipes-devtools/qemu/qemu/0005-qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch
> @@ -1,22 +1,24 @@
> -From 6cdf82af2eba312b9b8da86dda28b98d3d51f4d4 Mon Sep 17 00:00:00 2001
> +From 230fe5804099bdca0c9e4cae7280c9fc513cb7f5 Mon Sep 17 00:00:00 2001
>  From: Stephen Arnold <sarnold@vctlabs.com>
>  Date: Sun, 12 Jun 2016 18:09:56 -0700
>  Subject: [PATCH] qemu-native: set ld.bfd, fix cflags, and set some
> environment
>
>  Upstream-Status: Pending
>
> +[update patch context]
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>  ---
>   configure | 4 ----
>   1 file changed, 4 deletions(-)
>
>  diff --git a/configure b/configure
> -index a766017b..72f11aca 100755
> +index 83c65439..6bdf488c 100755
>  --- a/configure
>  +++ b/configure
> -@@ -6085,10 +6085,6 @@ write_c_skeleton
> +@@ -6251,10 +6251,6 @@ write_c_skeleton
>   if test "$gcov" = "yes" ; then
> -   CFLAGS="-fprofile-arcs -ftest-coverage -g $CFLAGS"
> -   LDFLAGS="-fprofile-arcs -ftest-coverage $LDFLAGS"
> +   QEMU_CFLAGS="-fprofile-arcs -ftest-coverage -g $QEMU_CFLAGS"
> +   QEMU_LDFLAGS="-fprofile-arcs -ftest-coverage $QEMU_LDFLAGS"
>  -elif test "$fortify_source" = "yes" ; then
>  -  CFLAGS="-O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 $CFLAGS"
>  -elif test "$debug" = "no"; then
> @@ -24,3 +26,6 @@ index a766017b..72f11aca 100755
>   fi
>
>   if test "$have_asan" = "yes"; then
> +--
> +2.24.0
> +
> diff --git
> a/meta/recipes-devtools/qemu/qemu/0009-Fix-webkitgtk-builds.patch
> b/meta/recipes-devtools/qemu/qemu/0009-Fix-webkitgtk-builds.patch
> index 7e273eeced..eef3f3f97f 100644
> --- a/meta/recipes-devtools/qemu/qemu/0009-Fix-webkitgtk-builds.patch
> +++ b/meta/recipes-devtools/qemu/qemu/0009-Fix-webkitgtk-builds.patch
> @@ -1,4 +1,4 @@
> -From 613166007e3b852c99caf2cd34a972e2c8460737 Mon Sep 17 00:00:00 2001
> +From 815c97ba0de02da9dace3fcfcbdf9b20e029f0d7 Mon Sep 17 00:00:00 2001
>  From: Martin Jansa <martin.jansa@lge.com>
>  Date: Fri, 1 Jun 2018 08:41:07 +0000
>  Subject: [PATCH] Fix webkitgtk builds
> @@ -19,6 +19,8 @@ This reverts commit
> ebf9a3630c911d0cfc9c20f7cafe9ba4f88cf583.
>  Upstream-Status: Pending
>  Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>
> +[update patch context]
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>  ---
>   include/exec/cpu-all.h  |  6 +-----
>   include/exec/cpu_ldst.h |  5 ++++-
> @@ -27,7 +29,7 @@ Signed-off-by: Alistair Francis <
> alistair.francis@wdc.com>
>   4 files changed, 10 insertions(+), 23 deletions(-)
>
>  diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
> -index e96781a4..a369f81a 100644
> +index 49384bb6..93b12519 100644
>  --- a/include/exec/cpu-all.h
>  +++ b/include/exec/cpu-all.h
>  @@ -162,12 +162,8 @@ extern unsigned long guest_base;
> @@ -45,10 +47,10 @@ index e96781a4..a369f81a 100644
>
>   #include "exec/hwaddr.h"
>  diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
> -index fd499f7e..30575f60 100644
> +index 53de1975..cf19ed2e 100644
>  --- a/include/exec/cpu_ldst.h
>  +++ b/include/exec/cpu_ldst.h
> -@@ -65,7 +65,10 @@ typedef uint64_t abi_ptr;
> +@@ -70,7 +70,10 @@ typedef uint64_t abi_ptr;
>   #if HOST_LONG_BITS <= TARGET_VIRT_ADDR_SPACE_BITS
>   #define guest_addr_valid(x) (1)
>   #else
> @@ -61,10 +63,10 @@ index fd499f7e..30575f60 100644
>   #define h2g_valid(x) guest_addr_valid((unsigned long)(x) - guest_base)
>
>  diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> -index 46a6e3a7..77354654 100644
> +index e3780337..1d4aba95 100644
>  --- a/linux-user/mmap.c
>  +++ b/linux-user/mmap.c
> -@@ -78,7 +78,7 @@ int target_mprotect(abi_ulong start, abi_ulong len, int
> prot)
> +@@ -71,7 +71,7 @@ int target_mprotect(abi_ulong start, abi_ulong len, int
> prot)
>           return -TARGET_EINVAL;
>       len = TARGET_PAGE_ALIGN(len);
>       end = start + len;
> @@ -73,7 +75,7 @@ index 46a6e3a7..77354654 100644
>           return -TARGET_ENOMEM;
>       }
>       prot &= PROT_READ | PROT_WRITE | PROT_EXEC;
> -@@ -495,8 +495,8 @@ abi_long target_mmap(abi_ulong start, abi_ulong len,
> int prot,
> +@@ -467,8 +467,8 @@ abi_long target_mmap(abi_ulong start, abi_ulong len,
> int prot,
>            * It can fail only on 64-bit host with 32-bit target.
>            * On any other target/host host mmap() handles this error
> correctly.
>            */
> @@ -84,7 +86,7 @@ index 46a6e3a7..77354654 100644
>               goto fail;
>           }
>
> -@@ -636,10 +636,8 @@ int target_munmap(abi_ulong start, abi_ulong len)
> +@@ -604,10 +604,8 @@ int target_munmap(abi_ulong start, abi_ulong len)
>       if (start & ~TARGET_PAGE_MASK)
>           return -TARGET_EINVAL;
>       len = TARGET_PAGE_ALIGN(len);
> @@ -96,7 +98,7 @@ index 46a6e3a7..77354654 100644
>       mmap_lock();
>       end = start + len;
>       real_start = start & qemu_host_page_mask;
> -@@ -694,13 +692,6 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong
> old_size,
> +@@ -662,13 +660,6 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong
> old_size,
>       int prot;
>       void *host_addr;
>
> @@ -111,10 +113,10 @@ index 46a6e3a7..77354654 100644
>
>       if (flags & MREMAP_FIXED) {
>  diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> -index 171c0cae..fc18f244 100644
> +index 05f03919..d6f8cc97 100644
>  --- a/linux-user/syscall.c
>  +++ b/linux-user/syscall.c
> -@@ -4138,9 +4138,6 @@ static inline abi_ulong do_shmat(CPUArchState
> *cpu_env,
> +@@ -4287,9 +4287,6 @@ static inline abi_ulong do_shmat(CPUArchState
> *cpu_env,
>               return -TARGET_EINVAL;
>           }
>       }
> @@ -124,12 +126,15 @@ index 171c0cae..fc18f244 100644
>
>       mmap_lock();
>
> -@@ -6990,7 +6987,7 @@ static int open_self_maps(void *cpu_env, int fd)
> -         }
> -         if (h2g_valid(min)) {
> -             int flags = page_get_flags(h2g(min));
> --            max = h2g_valid(max - 1) ? max :
> (uintptr_t)g2h(GUEST_ADDR_MAX) + 1;
> -+            max = h2g_valid(max - 1) ? max :
> (uintptr_t)g2h(GUEST_ADDR_MAX);
> +@@ -7247,7 +7244,7 @@ static int open_self_maps(void *cpu_env, int fd)
> +             const char *path;
> +
> +             max = h2g_valid(max - 1) ?
> +-                max : (uintptr_t) g2h(GUEST_ADDR_MAX) + 1;
> ++                max : (uintptr_t) g2h(GUEST_ADDR_MAX);
> +
>               if (page_check_range(h2g(min), max - min, flags) == -1) {
>                   continue;
> -             }
> +--
> +2.24.0
> +
> diff --git
> a/meta/recipes-devtools/qemu/qemu/0011-hw-i386-pc-fix-regression-in-parsing-vga-cmdline-par.patch
> b/meta/recipes-devtools/qemu/qemu/0011-hw-i386-pc-fix-regression-in-parsing-vga-cmdline-par.patch
> deleted file mode 100644
> index 2fe0850a33..0000000000
> ---
> a/meta/recipes-devtools/qemu/qemu/0011-hw-i386-pc-fix-regression-in-parsing-vga-cmdline-par.patch
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -From a88c40f02ace88f09b2a85a64831b277b2ebc88c Mon Sep 17 00:00:00 2001
> -From: Peter Wu <peter@lekensteyn.nl>
> -Date: Sat, 21 Dec 2019 17:21:24 +0100
> -Subject: [PATCH] hw/i386/pc: fix regression in parsing vga cmdline
> parameter
> -
> -When the 'vga=' parameter is succeeded by another parameter, QEMU 4.2.0
> -would refuse to start with a rather cryptic message:
> -
> -    $ qemu-system-x86_64 -kernel /boot/vmlinuz-linux -append 'vga=792
> quiet'
> -    qemu: can't parse 'vga' parameter: Invalid argument
> -
> -It was not clear whether this applied to the '-vga std' parameter or the
> -'-append' one. Fix the parsing regression and clarify the error.
> -
> -Fixes: 133ef074bd ("hw/i386/pc: replace use of strtol with qemu_strtoui
> in x86_load_linux()")
> -Cc: Sergio Lopez <slp@redhat.com>
> -Signed-off-by: Peter Wu <peter@lekensteyn.nl>
> -Message-Id: <20191221162124.1159291-1-peter@lekensteyn.nl>
> -Cc: qemu-stable@nongnu.org
> -Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> -Upstream-Status: Backport [
> https://git.qemu.org/?p=qemu.git;a=commitdiff;h=a88c40f02ace88f09b2a85a64831b277b2ebc88c
> ]
> ----
> - hw/i386/x86.c | 8 ++++----
> - 1 file changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> -index d8bb5c2a96..9b9a4d5837 100644
> ---- a/hw/i386/x86.c
> -+++ b/hw/i386/x86.c
> -@@ -612,6 +612,7 @@ void x86_load_linux(X86MachineState *x86ms,
> -     vmode = strstr(kernel_cmdline, "vga=");
> -     if (vmode) {
> -         unsigned int video_mode;
> -+        const char *end;
> -         int ret;
> -         /* skip "vga=" */
> -         vmode += 4;
> -@@ -622,10 +623,9 @@ void x86_load_linux(X86MachineState *x86ms,
> -         } else if (!strncmp(vmode, "ask", 3)) {
> -             video_mode = 0xfffd;
> -         } else {
> --            ret = qemu_strtoui(vmode, NULL, 0, &video_mode);
> --            if (ret != 0) {
> --                fprintf(stderr, "qemu: can't parse 'vga' parameter:
> %s\n",
> --                        strerror(-ret));
> -+            ret = qemu_strtoui(vmode, &end, 0, &video_mode);
> -+            if (ret != 0 || (*end && *end != ' ')) {
> -+                fprintf(stderr, "qemu: invalid 'vga=' kernel
> parameter.\n");
> -                 exit(1);
> -             }
> -         }
> ---
> -2.25.0
> -
> diff --git
> a/meta/recipes-devtools/qemu/qemu/0012-fix-libcap-header-issue-on-some-distro.patch
> b/meta/recipes-devtools/qemu/qemu/0012-fix-libcap-header-issue-on-some-distro.patch
> deleted file mode 100644
> index 3a7d7bbd33..0000000000
> ---
> a/meta/recipes-devtools/qemu/qemu/0012-fix-libcap-header-issue-on-some-distro.patch
> +++ /dev/null
> @@ -1,86 +0,0 @@
> -From 9125afb733d8c96416bb83c5adad39bb8d0803a1 Mon Sep 17 00:00:00 2001
> -From: Hongxu Jia <hongxu.jia@windriver.com>
> -Date: Tue, 12 Mar 2013 09:54:06 +0800
> -Subject: [PATCH] fix libcap header issue on some distro
> -
> -1, When build qemu-native on SLED 11.2, there is an error:
> -...
> -| In file included from /usr/include/bits/sigcontext.h:28,
> -|  from /usr/include/signal.h:339,
> -|  from /buildarea2/tmp/work/i686-linux/qemu-native/1.4.0-r0/
> -qemu-1.4.0/include/qemu-common.h:42,
> -|  from fsdev/virtfs-proxy-helper.c:23:
> -|  /usr/include/asm/sigcontext.h:28: error: expected specifier-
> -qualifier-list before '__u64'
> -|  /usr/include/asm/sigcontext.h:191: error: expected specifier-
> -qualifier-list before '__u64'
> -...
> -
> -2, The virtfs-proxy-helper.c includes <sys/capability.h> and
> -qemu-common.h in sequence. The header include map is:
> -(`-->' presents `include')
> -...
> -"virtfs-proxy-helper.c" --> <sys/capability.h>
> -...
> -"virtfs-proxy-helper.c" --> "qemu-common.h" --> <signal.h> -->
> -<bits/sigcontext.h> --> <asm/sigcontext.h> --> <linux/types.h> -->
> -<asm/types.h> --> <asm-generic/types.h> --> <asm-generic/int-ll64.h>
> -...
> -
> -3, The bug is found on SLED 11.2 x86. In libcap header file
> -/usr/include/sys/capability.h, it does evil stuff like this:
> -...
> -  25 /*
> -  26  * Make sure we can be included from userland by preventing
> -  27  * capability.h from including other kernel headers
> -  28  */
> -  29 #define _LINUX_TYPES_H
> -  30 #define _LINUX_FS_H
> -  31 #define __LINUX_COMPILER_H
> -  32 #define __user
> -  33
> -  34 typedef unsigned int __u32;
> -  35 typedef __u32 __le32;
> -...
> -This completely prevents including /usr/include/linux/types.h.
> -The above `<asm/sigcontext.h> --> <linux/types.h>' is prevented,
> -and '__u64' is defined in <asm-generic/int-ll64.h>.
> -
> -4, Modify virtfs-proxy-helper.c to include <sys/capability.h>
> -last to workaround the issue.
> -
> -http://www.linuxtv.org/pipermail/vdr/2009-August/021194.html
> -http://patchwork.linuxtv.org/patch/12748/
> -
> -Upstream-Status: Pending
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> -
> ----
> - fsdev/virtfs-proxy-helper.c | 7 +++++--
> - 1 file changed, 5 insertions(+), 2 deletions(-)
> -
> -diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
> -index 6f132c5f..8329950c 100644
> ---- a/fsdev/virtfs-proxy-helper.c
> -+++ b/fsdev/virtfs-proxy-helper.c
> -@@ -13,7 +13,6 @@
> - #include <sys/resource.h>
> - #include <getopt.h>
> - #include <syslog.h>
> --#include <sys/capability.h>
> - #include <sys/fsuid.h>
> - #include <sys/vfs.h>
> - #include <sys/ioctl.h>
> -@@ -27,7 +26,11 @@
> - #include "9p-iov-marshal.h"
> - #include "hw/9pfs/9p-proxy.h"
> - #include "fsdev/9p-iov-marshal.h"
> --
> -+/*
> -+ * Include this one last due to some versions of it being buggy:
> -+ * http://www.linuxtv.org/pipermail/vdr/2009-August/021194.html
> -+ */
> -+#include <sys/capability.h>
> - #define PROGNAME "virtfs-proxy-helper"
> -
> - #ifndef XFS_SUPER_MAGIC
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2019-15890.patch
> b/meta/recipes-devtools/qemu/qemu/CVE-2019-15890.patch
> deleted file mode 100644
> index 1d89431be6..0000000000
> --- a/meta/recipes-devtools/qemu/qemu/CVE-2019-15890.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -From 4fc0d23e8f6d795c679623d2ed2cbe6a7a17b9c7 Mon Sep 17 00:00:00 2001
> -From: Li Zhou <li.zhou@windriver.com>
> -Date: Tue, 10 Sep 2019 20:02:15 -0700
> -Subject: [PATCH] ip_reass: Fix use after free
> -
> -Using ip_deq after m_free might read pointers from an allocation reuse.
> -
> -This would be difficult to exploit, but that is still related with
> -CVE-2019-14378 which generates fragmented IP packets that would trigger
> this
> -issue and at least produce a DoS.
> -
> -Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
> -
> -Upstream-Status: Backport
> -CVE: CVE-2019-15890
> -Signed-off-by: Li Zhou <li.zhou@windriver.com>
> ----
> - slirp/src/ip_input.c | 6 ++++--
> - 1 file changed, 4 insertions(+), 2 deletions(-)
> -
> -diff --git a/slirp/src/ip_input.c b/slirp/src/ip_input.c
> -index 8c75d914..c07d7d40 100644
> ---- a/slirp/src/ip_input.c
> -+++ b/slirp/src/ip_input.c
> -@@ -292,6 +292,7 @@ static struct ip *ip_reass(Slirp *slirp, struct ip
> *ip, struct ipq *fp)
> -      */
> -     while (q != (struct ipasfrag *)&fp->frag_link &&
> -            ip->ip_off + ip->ip_len > q->ipf_off) {
> -+        struct ipasfrag *prev;
> -         i = (ip->ip_off + ip->ip_len) - q->ipf_off;
> -         if (i < q->ipf_len) {
> -             q->ipf_len -= i;
> -@@ -299,9 +300,10 @@ static struct ip *ip_reass(Slirp *slirp, struct ip
> *ip, struct ipq *fp)
> -             m_adj(dtom(slirp, q), i);
> -             break;
> -         }
> -+        prev = q;
> -         q = q->ipf_next;
> --        m_free(dtom(slirp, q->ipf_prev));
> --        ip_deq(q->ipf_prev);
> -+        ip_deq(prev);
> -+        m_free(dtom(slirp, prev));
> -     }
> -
> - insert:
> ---
> -2.23.0
> -
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-11102.patch
> b/meta/recipes-devtools/qemu/qemu/CVE-2020-11102.patch
> deleted file mode 100644
> index e8f3e1dbdb..0000000000
> --- a/meta/recipes-devtools/qemu/qemu/CVE-2020-11102.patch
> +++ /dev/null
> @@ -1,148 +0,0 @@
> -From 8ffb7265af64ec81748335ec8f20e7ab542c3850 Mon Sep 17 00:00:00 2001
> -From: Prasad J Pandit <pjp@fedoraproject.org>
> -Date: Tue, 24 Mar 2020 22:57:22 +0530
> -Subject: [PATCH] net: tulip: check frame size and r/w data length
> -
> -Tulip network driver while copying tx/rx buffers does not check
> -frame size against r/w data length. This may lead to OOB buffer
> -access. Add check to avoid it.
> -
> -Limit iterations over descriptors to avoid potential infinite
> -loop issue in tulip_xmit_list_update.
> -
> -Reported-by: Li Qiang <pangpei.lq@antfin.com>
> -Reported-by: Ziming Zhang <ezrakiez@gmail.com>
> -Reported-by: Jason Wang <jasowang@redhat.com>
> -Tested-by: Li Qiang <liq3ea@gmail.com>
> -Reviewed-by: Li Qiang <liq3ea@gmail.com>
> -Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> -Signed-off-by: Jason Wang <jasowang@redhat.com>
> -
> -Upstream-Status: Backport [
> https://git.qemu.org/?p=qemu.git;a=commit;h=8ffb7265af64ec81748335ec8f20e7ab542c3850
> ]
> -CVE: CVE-2020-11102
> -Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> ----
> - hw/net/tulip.c | 36 +++++++++++++++++++++++++++---------
> - 1 file changed, 27 insertions(+), 9 deletions(-)
> -
> -diff --git a/hw/net/tulip.c b/hw/net/tulip.c
> -index cfac271..1295f51 100644
> ---- a/hw/net/tulip.c
> -+++ b/hw/net/tulip.c
> -@@ -170,6 +170,10 @@ static void tulip_copy_rx_bytes(TULIPState *s,
> struct tulip_descriptor *desc)
> -         } else {
> -             len = s->rx_frame_len;
> -         }
> -+
> -+        if (s->rx_frame_len + len > sizeof(s->rx_frame)) {
> -+            return;
> -+        }
> -         pci_dma_write(&s->dev, desc->buf_addr1, s->rx_frame +
> -             (s->rx_frame_size - s->rx_frame_len), len);
> -         s->rx_frame_len -= len;
> -@@ -181,6 +185,10 @@ static void tulip_copy_rx_bytes(TULIPState *s,
> struct tulip_descriptor *desc)
> -         } else {
> -             len = s->rx_frame_len;
> -         }
> -+
> -+        if (s->rx_frame_len + len > sizeof(s->rx_frame)) {
> -+            return;
> -+        }
> -         pci_dma_write(&s->dev, desc->buf_addr2, s->rx_frame +
> -             (s->rx_frame_size - s->rx_frame_len), len);
> -         s->rx_frame_len -= len;
> -@@ -227,7 +235,8 @@ static ssize_t tulip_receive(TULIPState *s, const
> uint8_t *buf, size_t size)
> -
> -     trace_tulip_receive(buf, size);
> -
> --    if (size < 14 || size > 2048 || s->rx_frame_len ||
> tulip_rx_stopped(s)) {
> -+    if (size < 14 || size > sizeof(s->rx_frame) - 4
> -+        || s->rx_frame_len || tulip_rx_stopped(s)) {
> -         return 0;
> -     }
> -
> -@@ -275,7 +284,6 @@ static ssize_t tulip_receive_nc(NetClientState *nc,
> -     return tulip_receive(qemu_get_nic_opaque(nc), buf, size);
> - }
> -
> --
> - static NetClientInfo net_tulip_info = {
> -     .type = NET_CLIENT_DRIVER_NIC,
> -     .size = sizeof(NICState),
> -@@ -558,7 +566,7 @@ static void tulip_tx(TULIPState *s, struct
> tulip_descriptor *desc)
> -         if ((s->csr[6] >> CSR6_OM_SHIFT) & CSR6_OM_MASK) {
> -             /* Internal or external Loopback */
> -             tulip_receive(s, s->tx_frame, s->tx_frame_len);
> --        } else {
> -+        } else if (s->tx_frame_len <= sizeof(s->tx_frame)) {
> -             qemu_send_packet(qemu_get_queue(s->nic),
> -                 s->tx_frame, s->tx_frame_len);
> -         }
> -@@ -570,23 +578,31 @@ static void tulip_tx(TULIPState *s, struct
> tulip_descriptor *desc)
> -     }
> - }
> -
> --static void tulip_copy_tx_buffers(TULIPState *s, struct tulip_descriptor
> *desc)
> -+static int tulip_copy_tx_buffers(TULIPState *s, struct tulip_descriptor
> *desc)
> - {
> -     int len1 = (desc->control >> TDES1_BUF1_SIZE_SHIFT) &
> TDES1_BUF1_SIZE_MASK;
> -     int len2 = (desc->control >> TDES1_BUF2_SIZE_SHIFT) &
> TDES1_BUF2_SIZE_MASK;
> -
> -+    if (s->tx_frame_len + len1 > sizeof(s->tx_frame)) {
> -+        return -1;
> -+    }
> -     if (len1) {
> -         pci_dma_read(&s->dev, desc->buf_addr1,
> -             s->tx_frame + s->tx_frame_len, len1);
> -         s->tx_frame_len += len1;
> -     }
> -
> -+    if (s->tx_frame_len + len2 > sizeof(s->tx_frame)) {
> -+        return -1;
> -+    }
> -     if (len2) {
> -         pci_dma_read(&s->dev, desc->buf_addr2,
> -             s->tx_frame + s->tx_frame_len, len2);
> -         s->tx_frame_len += len2;
> -     }
> -     desc->status = (len1 + len2) ? 0 : 0x7fffffff;
> -+
> -+    return 0;
> - }
> -
> - static void tulip_setup_filter_addr(TULIPState *s, uint8_t *buf, int n)
> -@@ -651,13 +667,15 @@ static uint32_t tulip_ts(TULIPState *s)
> -
> - static void tulip_xmit_list_update(TULIPState *s)
> - {
> -+#define TULIP_DESC_MAX 128
> -+    uint8_t i = 0;
> -     struct tulip_descriptor desc;
> -
> -     if (tulip_ts(s) != CSR5_TS_SUSPENDED) {
> -         return;
> -     }
> -
> --    for (;;) {
> -+    for (i = 0; i < TULIP_DESC_MAX; i++) {
> -         tulip_desc_read(s, s->current_tx_desc, &desc);
> -         tulip_dump_tx_descriptor(s, &desc);
> -
> -@@ -675,10 +693,10 @@ static void tulip_xmit_list_update(TULIPState *s)
> -                 s->tx_frame_len = 0;
> -             }
> -
> --            tulip_copy_tx_buffers(s, &desc);
> --
> --            if (desc.control & TDES1_LS) {
> --                tulip_tx(s, &desc);
> -+            if (!tulip_copy_tx_buffers(s, &desc)) {
> -+                if (desc.control & TDES1_LS) {
> -+                    tulip_tx(s, &desc);
> -+                }
> -             }
> -         }
> -         tulip_desc_write(s, s->current_tx_desc, &desc);
> ---
> -1.8.3.1
> -
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-11869.patch
> b/meta/recipes-devtools/qemu/qemu/CVE-2020-11869.patch
> deleted file mode 100644
> index ca7ffed934..0000000000
> --- a/meta/recipes-devtools/qemu/qemu/CVE-2020-11869.patch
> +++ /dev/null
> @@ -1,97 +0,0 @@
> -From ac2071c3791b67fc7af78b8ceb320c01ca1b5df7 Mon Sep 17 00:00:00 2001
> -From: BALATON Zoltan <balaton@eik.bme.hu>
> -Date: Mon, 6 Apr 2020 22:34:26 +0200
> -Subject: [PATCH] ati-vga: Fix checks in ati_2d_blt() to avoid crash
> -
> -In some corner cases (that never happen during normal operation but a
> -malicious guest could program wrong values) pixman functions were
> -called with parameters that result in a crash. Fix this and add more
> -checks to disallow such cases.
> -
> -Reported-by: Ziming Zhang <ezrakiez@gmail.com>
> -Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> -Message-id: 20200406204029.19559747D5D@zero.eik.bme.hu
> -Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> -
> -Upstream-Status: Backport [
> https://git.qemu.org/?p=qemu.git;a=commit;h=ac2071c3791b67fc7af78b8ceb320c01ca1b5df7
> ]
> -CVE: CVE-2020-11869
> -Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ----
> - hw/display/ati_2d.c | 37 ++++++++++++++++++++++++++-----------
> - 1 file changed, 26 insertions(+), 11 deletions(-)
> -
> -diff --git a/hw/display/ati_2d.c b/hw/display/ati_2d.c
> -index 42e8231..23a8ae0 100644
> ---- a/hw/display/ati_2d.c
> -+++ b/hw/display/ati_2d.c
> -@@ -53,12 +53,20 @@ void ati_2d_blt(ATIVGAState *s)
> -             s->vga.vbe_start_addr, surface_data(ds), surface_stride(ds),
> -             surface_bits_per_pixel(ds),
> -             (s->regs.dp_mix & GMC_ROP3_MASK) >> 16);
> --    int dst_x = (s->regs.dp_cntl & DST_X_LEFT_TO_RIGHT ?
> --                 s->regs.dst_x : s->regs.dst_x + 1 - s->regs.dst_width);
> --    int dst_y = (s->regs.dp_cntl & DST_Y_TOP_TO_BOTTOM ?
> --                 s->regs.dst_y : s->regs.dst_y + 1 - s->regs.dst_height);
> -+    unsigned dst_x = (s->regs.dp_cntl & DST_X_LEFT_TO_RIGHT ?
> -+                      s->regs.dst_x : s->regs.dst_x + 1 -
> s->regs.dst_width);
> -+    unsigned dst_y = (s->regs.dp_cntl & DST_Y_TOP_TO_BOTTOM ?
> -+                      s->regs.dst_y : s->regs.dst_y + 1 -
> s->regs.dst_height);
> -     int bpp = ati_bpp_from_datatype(s);
> -+    if (!bpp) {
> -+        qemu_log_mask(LOG_GUEST_ERROR, "Invalid bpp\n");
> -+        return;
> -+    }
> -     int dst_stride = DEFAULT_CNTL ? s->regs.dst_pitch :
> s->regs.default_pitch;
> -+    if (!dst_stride) {
> -+        qemu_log_mask(LOG_GUEST_ERROR, "Zero dest pitch\n");
> -+        return;
> -+    }
> -     uint8_t *dst_bits = s->vga.vram_ptr + (DEFAULT_CNTL ?
> -                         s->regs.dst_offset : s->regs.default_offset);
> -
> -@@ -82,12 +90,16 @@ void ati_2d_blt(ATIVGAState *s)
> -     switch (s->regs.dp_mix & GMC_ROP3_MASK) {
> -     case ROP3_SRCCOPY:
> -     {
> --        int src_x = (s->regs.dp_cntl & DST_X_LEFT_TO_RIGHT ?
> --                     s->regs.src_x : s->regs.src_x + 1 -
> s->regs.dst_width);
> --        int src_y = (s->regs.dp_cntl & DST_Y_TOP_TO_BOTTOM ?
> --                     s->regs.src_y : s->regs.src_y + 1 -
> s->regs.dst_height);
> -+        unsigned src_x = (s->regs.dp_cntl & DST_X_LEFT_TO_RIGHT ?
> -+                       s->regs.src_x : s->regs.src_x + 1 -
> s->regs.dst_width);
> -+        unsigned src_y = (s->regs.dp_cntl & DST_Y_TOP_TO_BOTTOM ?
> -+                       s->regs.src_y : s->regs.src_y + 1 -
> s->regs.dst_height);
> -         int src_stride = DEFAULT_CNTL ?
> -                          s->regs.src_pitch : s->regs.default_pitch;
> -+        if (!src_stride) {
> -+            qemu_log_mask(LOG_GUEST_ERROR, "Zero source pitch\n");
> -+            return;
> -+        }
> -         uint8_t *src_bits = s->vga.vram_ptr + (DEFAULT_CNTL ?
> -                             s->regs.src_offset : s->regs.default_offset);
> -
> -@@ -137,8 +149,10 @@ void ati_2d_blt(ATIVGAState *s)
> -                                     dst_y * surface_stride(ds),
> -                                     s->regs.dst_height *
> surface_stride(ds));
> -         }
> --        s->regs.dst_x += s->regs.dst_width;
> --        s->regs.dst_y += s->regs.dst_height;
> -+        s->regs.dst_x = (s->regs.dp_cntl & DST_X_LEFT_TO_RIGHT ?
> -+                         dst_x + s->regs.dst_width : dst_x);
> -+        s->regs.dst_y = (s->regs.dp_cntl & DST_Y_TOP_TO_BOTTOM ?
> -+                         dst_y + s->regs.dst_height : dst_y);
> -         break;
> -     }
> -     case ROP3_PATCOPY:
> -@@ -179,7 +193,8 @@ void ati_2d_blt(ATIVGAState *s)
> -                                     dst_y * surface_stride(ds),
> -                                     s->regs.dst_height *
> surface_stride(ds));
> -         }
> --        s->regs.dst_y += s->regs.dst_height;
> -+        s->regs.dst_y = (s->regs.dp_cntl & DST_Y_TOP_TO_BOTTOM ?
> -+                         dst_y + s->regs.dst_height : dst_y);
> -         break;
> -     }
> -     default:
> ---
> -1.8.3.1
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-1711.patch
> b/meta/recipes-devtools/qemu/qemu/CVE-2020-1711.patch
> deleted file mode 100644
> index aa7bc82329..0000000000
> --- a/meta/recipes-devtools/qemu/qemu/CVE-2020-1711.patch
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -From 693fd2acdf14dd86c0bf852610f1c2cca80a74dc Mon Sep 17 00:00:00 2001
> -From: Felipe Franciosi <felipe@nutanix.com>
> -Date: Thu, 23 Jan 2020 12:44:59 +0000
> -Subject: [PATCH] iscsi: Cap block count from GET LBA STATUS
> (CVE-2020-1711)
> -
> -When querying an iSCSI server for the provisioning status of blocks (via
> -GET LBA STATUS), Qemu only validates that the response descriptor zero's
> -LBA matches the one requested. Given the SCSI spec allows servers to
> -respond with the status of blocks beyond the end of the LUN, Qemu may
> -have its heap corrupted by clearing/setting too many bits at the end of
> -its allocmap for the LUN.
> -
> -A malicious guest in control of the iSCSI server could carefully program
> -Qemu's heap (by selectively setting the bitmap) and then smash it.
> -
> -This limits the number of bits that iscsi_co_block_status() will try to
> -update in the allocmap so it can't overflow the bitmap.
> -
> -Upstream-Status: Backport [
> https://git.qemu.org/?p=qemu.git;a=patch;h=693fd2acdf14dd86c0bf852610f1c2cca80a74dc
> ]
> -CVE: CVE-2020-1711
> -
> -Fixes: CVE-2020-1711
> -Cc: qemu-stable@nongnu.org
> -Signed-off-by: Felipe Franciosi <felipe@nutanix.com>
> -Signed-off-by: Peter Turschmid <peter.turschm@nutanix.com>
> -Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> -Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> -Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ----
> - block/iscsi.c | 5 +++--
> - 1 file changed, 3 insertions(+), 2 deletions(-)
> -
> -diff --git a/block/iscsi.c b/block/iscsi.c
> -index 2aea7e3..cbd5729 100644
> ---- a/block/iscsi.c
> -+++ b/block/iscsi.c
> -@@ -701,7 +701,7 @@ static int coroutine_fn
> iscsi_co_block_status(BlockDriverState *bs,
> -     struct scsi_get_lba_status *lbas = NULL;
> -     struct scsi_lba_status_descriptor *lbasd = NULL;
> -     struct IscsiTask iTask;
> --    uint64_t lba;
> -+    uint64_t lba, max_bytes;
> -     int ret;
> -
> -     iscsi_co_init_iscsitask(iscsilun, &iTask);
> -@@ -721,6 +721,7 @@ static int coroutine_fn
> iscsi_co_block_status(BlockDriverState *bs,
> -     }
> -
> -     lba = offset / iscsilun->block_size;
> -+    max_bytes = (iscsilun->num_blocks - lba) * iscsilun->block_size;
> -
> -     qemu_mutex_lock(&iscsilun->mutex);
> - retry:
> -@@ -764,7 +765,7 @@ retry:
> -         goto out_unlock;
> -     }
> -
> --    *pnum = (int64_t) lbasd->num_blocks * iscsilun->block_size;
> -+    *pnum = MIN((int64_t) lbasd->num_blocks * iscsilun->block_size,
> max_bytes);
> -
> -     if (lbasd->provisioning == SCSI_PROVISIONING_TYPE_DEALLOCATED ||
> -         lbasd->provisioning == SCSI_PROVISIONING_TYPE_ANCHORED) {
> ---
> -1.8.3.1
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-7039-1.patch
> b/meta/recipes-devtools/qemu/qemu/CVE-2020-7039-1.patch
> deleted file mode 100644
> index df6bca6db6..0000000000
> --- a/meta/recipes-devtools/qemu/qemu/CVE-2020-7039-1.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From b2663d527a1992ba98c0266458b21ada3b9d0d2e Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Thu, 27 Feb 2020 12:07:35 +0800
> -Subject: [PATCH] tcp_emu: Fix oob access
> -
> -The main loop only checks for one available byte, while we sometimes
> -need two bytes.
> -
> -CVE: CVE-2020-7039
> -Upstream-Status: Backport
> -[
> https://gitlab.freedesktop.org/slirp/libslirp/commit/2655fffed7a9e765bcb4701dd876e9dab975f289
> ]
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - slirp/src/tcp_subr.c | 6 ++++++
> - 1 file changed, 6 insertions(+)
> -
> -diff --git a/slirp/src/tcp_subr.c b/slirp/src/tcp_subr.c
> -index d6dd133..4bea2d4 100644
> ---- a/slirp/src/tcp_subr.c
> -+++ b/slirp/src/tcp_subr.c
> -@@ -886,6 +886,8 @@ int tcp_emu(struct socket *so, struct mbuf *m)
> -                 break;
> -
> -             case 5:
> -+                if (bptr == m->m_data + m->m_len - 1)
> -+                        return 1; /* We need two bytes */
> -                 /*
> -                  * The difference between versions 1.0 and
> -                  * 2.0 is here. For future versions of
> -@@ -901,6 +903,10 @@ int tcp_emu(struct socket *so, struct mbuf *m)
> -                 /* This is the field containing the port
> -                  * number that RA-player is listening to.
> -                  */
> -+
> -+                if (bptr == m->m_data + m->m_len - 1)
> -+                        return 1; /* We need two bytes */
> -+
> -                 lport = (((uint8_t *)bptr)[0] << 8) + ((uint8_t
> *)bptr)[1];
> -                 if (lport < 6970)
> -                     lport += 256; /* don't know why */
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-7039-2.patch
> b/meta/recipes-devtools/qemu/qemu/CVE-2020-7039-2.patch
> deleted file mode 100644
> index 4a00fa2afd..0000000000
> --- a/meta/recipes-devtools/qemu/qemu/CVE-2020-7039-2.patch
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -From 8f67e76e4148e37f3d8d2bcbdee7417fdedb7669 Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Thu, 27 Feb 2020 12:10:34 +0800
> -Subject: [PATCH] slirp: use correct size while emulating commands
> -
> -While emulating services in tcp_emu(), it uses 'mbuf' size
> -'m->m_size' to write commands via snprintf(3). Use M_FREEROOM(m)
> -size to avoid possible OOB access.
> -Signed-off-by: default avatarPrasad J Pandit <pjp@fedoraproject.org>
> -Signed-off-by: Samuel Thibault's avatarSamuel Thibault
> -<samuel.thibault@ens-lyon.org>
> -Message-Id: <20200109094228.79764-3-ppandit@redhat.com>
> -
> -CVE: CVE-2020-7039
> -Upstream-Status: Backport
> -[
> https://gitlab.freedesktop.org/slirp/libslirp/commit/82ebe9c370a0e2970fb5695aa19aa5214a6a1c80
> ]
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - slirp/src/tcp_subr.c | 9 ++++-----
> - 1 file changed, 4 insertions(+), 5 deletions(-)
> -
> -diff --git a/slirp/src/tcp_subr.c b/slirp/src/tcp_subr.c
> -index 4bea2d4..e8ed4ef 100644
> ---- a/slirp/src/tcp_subr.c
> -+++ b/slirp/src/tcp_subr.c
> -@@ -696,7 +696,7 @@ int tcp_emu(struct socket *so, struct mbuf *m)
> -             n4 = (laddr & 0xff);
> -
> -             m->m_len = bptr - m->m_data; /* Adjust length */
> --            m->m_len += snprintf(bptr, m->m_size - m->m_len,
> -+            m->m_len += snprintf(bptr, M_FREEROOM(m),
> -                                  "ORT %d,%d,%d,%d,%d,%d\r\n%s", n1, n2,
> n3, n4,
> -                                  n5, n6, x == 7 ? buff : "");
> -             return 1;
> -@@ -731,8 +731,7 @@ int tcp_emu(struct socket *so, struct mbuf *m)
> -             n4 = (laddr & 0xff);
> -
> -             m->m_len = bptr - m->m_data; /* Adjust length */
> --            m->m_len +=
> --                snprintf(bptr, m->m_size - m->m_len,
> -+            m->m_len += snprintf(bptr, M_FREEROOM(m),
> -                          "27 Entering Passive Mode
> (%d,%d,%d,%d,%d,%d)\r\n%s",
> -                          n1, n2, n3, n4, n5, n6, x == 7 ? buff : "");
> -
> -@@ -758,8 +757,8 @@ int tcp_emu(struct socket *so, struct mbuf *m)
> -         if (m->m_data[m->m_len - 1] == '\0' && lport != 0 &&
> -             (so = tcp_listen(slirp, INADDR_ANY, 0, so->so_laddr.s_addr,
> -                              htons(lport), SS_FACCEPTONCE)) != NULL)
> --            m->m_len =
> --                snprintf(m->m_data, m->m_size, "%d",
> ntohs(so->so_fport)) + 1;
> -+            m->m_len = snprintf(m->m_data, M_ROOM(m),
> -+                                "%d", ntohs(so->so_fport)) + 1;
> -         return 1;
> -
> -     case EMU_IRC:
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-7039-3.patch
> b/meta/recipes-devtools/qemu/qemu/CVE-2020-7039-3.patch
> deleted file mode 100644
> index 70ce480d80..0000000000
> --- a/meta/recipes-devtools/qemu/qemu/CVE-2020-7039-3.patch
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -From 0b03959b72036afce151783720d9e54988cf76ef Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Thu, 27 Feb 2020 12:15:04 +0800
> -Subject: [PATCH] slirp: use correct size while emulating IRC commands
> -
> -While emulating IRC DCC commands, tcp_emu() uses 'mbuf' size
> -'m->m_size' to write DCC commands via snprintf(3). This may
> -lead to OOB write access, because 'bptr' points somewhere in
> -the middle of 'mbuf' buffer, not at the start. Use M_FREEROOM(m)
> -size to avoid OOB access.
> -Reported-by: default avatarVishnu Dev TJ <vishnudevtj@gmail.com>
> -Signed-off-by: default avatarPrasad J Pandit <pjp@fedoraproject.org>
> -Reviewed-by: Samuel Thibault's avatarSamuel Thibault
> -<samuel.thibault@ens-lyon.org>
> -Message-Id: <20200109094228.79764-2-ppandit@redhat.com>
> -
> -CVE: CVE-2020-7039
> -Upstream-Status: Backport
> -[
> https://gitlab.freedesktop.org/slirp/libslirp/commit/ce131029d6d4a405cb7d3ac6716d03e58fb4a5d9
> ]
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - slirp/src/tcp_subr.c | 11 ++++++-----
> - 1 file changed, 6 insertions(+), 5 deletions(-)
> -
> -diff --git a/slirp/src/tcp_subr.c b/slirp/src/tcp_subr.c
> -index e8ed4ef..3a4a8ee 100644
> ---- a/slirp/src/tcp_subr.c
> -+++ b/slirp/src/tcp_subr.c
> -@@ -777,7 +777,8 @@ int tcp_emu(struct socket *so, struct mbuf *m)
> -                 return 1;
> -             }
> -             m->m_len = bptr - m->m_data; /* Adjust length */
> --            m->m_len += snprintf(bptr, m->m_size, "DCC CHAT chat %lu
> %u%c\n",
> -+            m->m_len += snprintf(bptr, M_FREEROOM(m),
> -+                                 "DCC CHAT chat %lu %u%c\n",
> -                                  (unsigned
> long)ntohl(so->so_faddr.s_addr),
> -                                  ntohs(so->so_fport), 1);
> -         } else if (sscanf(bptr, "DCC SEND %256s %u %u %u", buff, &laddr,
> &lport,
> -@@ -787,8 +788,8 @@ int tcp_emu(struct socket *so, struct mbuf *m)
> -                 return 1;
> -             }
> -             m->m_len = bptr - m->m_data; /* Adjust length */
> --            m->m_len +=
> --                snprintf(bptr, m->m_size, "DCC SEND %s %lu %u %u%c\n",
> buff,
> -+            m->m_len += snprintf(bptr, M_FREEROOM(m),
> -+                         "DCC SEND %s %lu %u %u%c\n", buff,
> -                          (unsigned long)ntohl(so->so_faddr.s_addr),
> -                          ntohs(so->so_fport), n1, 1);
> -         } else if (sscanf(bptr, "DCC MOVE %256s %u %u %u", buff, &laddr,
> &lport,
> -@@ -798,8 +799,8 @@ int tcp_emu(struct socket *so, struct mbuf *m)
> -                 return 1;
> -             }
> -             m->m_len = bptr - m->m_data; /* Adjust length */
> --            m->m_len +=
> --                snprintf(bptr, m->m_size, "DCC MOVE %s %lu %u %u%c\n",
> buff,
> -+            m->m_len += snprintf(bptr, M_FREEROOM(m),
> -+                         "DCC MOVE %s %lu %u %u%c\n", buff,
> -                          (unsigned long)ntohl(so->so_faddr.s_addr),
> -                          ntohs(so->so_fport), n1, 1);
> -         }
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-7211.patch
> b/meta/recipes-devtools/qemu/qemu/CVE-2020-7211.patch
> deleted file mode 100644
> index 11be4c92e7..0000000000
> --- a/meta/recipes-devtools/qemu/qemu/CVE-2020-7211.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From 14ec36e107a8c9af7d0a80c3571fe39b291ff1d4 Mon Sep 17 00:00:00 2001
> -From: Prasad J Pandit <pjp@fedoraproject.org>
> -Date: Mon, 13 Jan 2020 17:44:31 +0530
> -Subject: [PATCH] slirp: tftp: restrict relative path access
> -
> -tftp restricts relative or directory path access on Linux systems.
> -Apply same restrictions on Windows systems too. It helps to avoid
> -directory traversal issue.
> -
> -Fixes: https://bugs.launchpad.net/qemu/+bug/1812451
> -Reported-by: Peter Maydell <peter.maydell@linaro.org>
> -Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> -Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
> -Message-Id: <20200113121431.156708-1-ppandit@redhat.com>
> -
> -Upstream-Status: Backport [
> https://gitlab.freedesktop.org/slirp/libslirp/-/commit/14ec36e107a8c9af7d0a80c3571fe39b291ff1d4.patch
> ]
> -CVE: CVE-2020-7211
> -Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> -
> ----
> - slirp/src/tftp.c | 9 +++++++--
> - 1 file changed, 7 insertions(+), 2 deletions(-)
> -
> -diff --git a/slirp/src/tftp.c b/slirp/src/tftp.c
> -index 093c2e0..e52e71b 100644
> ---- a/slirp/src/tftp.c
> -+++ b/slirp/src/tftp.c
> -@@ -344,8 +344,13 @@ static void tftp_handle_rrq(Slirp *slirp, struct
> sockaddr_storage *srcsas,
> -     k += 6; /* skipping octet */
> -
> -     /* do sanity checks on the filename */
> --    if (!strncmp(req_fname, "../", 3) ||
> --        req_fname[strlen(req_fname) - 1] == '/' || strstr(req_fname,
> "/../")) {
> -+    if (
> -+#ifdef G_OS_WIN32
> -+        strstr(req_fname, "..\\") ||
> -+        req_fname[strlen(req_fname) - 1] == '\\' ||
> -+#endif
> -+        strstr(req_fname, "../") ||
> -+        req_fname[strlen(req_fname) - 1] == '/') {
> -         tftp_send_error(spt, 2, "Access violation", tp);
> -         return;
> -     }
> ---
> -2.24.1
> -
> diff --git a/meta/recipes-devtools/qemu/qemu/find_datadir.patch
> b/meta/recipes-devtools/qemu/qemu/find_datadir.patch
> new file mode 100644
> index 0000000000..74e9ba56ce
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/find_datadir.patch
> @@ -0,0 +1,37 @@
> +qemu: search for datadir as in version 4.2
> +
> +os_find_datadir() was changed after the 4.2 release.  We need to check for
> +../share/qemu relative to the executable because that is where the runqemu
> +configuration assumes it will be.
> +
> +Upstream-Status: Submitted [qemu-devel@nongnu.org]
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> +
> +
> +--- a/os-posix.c
> ++++ b/os-posix.c
> +@@ -82,8 +82,9 @@ void os_setup_signal_handling(void)
> +
> + /*
> +  * Find a likely location for support files using the location of the
> binary.
> ++ * Typically, this would be "$bindir/../share/qemu".
> +  * When running from the build tree this will be "$bindir/../pc-bios".
> +- * Otherwise, this is CONFIG_QEMU_DATADIR.
> ++ * Otherwise, this is CONFIG_QEMU_DATADIR as constructed by configure.
> +  */
> + char *os_find_datadir(void)
> + {
> +@@ -93,6 +94,12 @@ char *os_find_datadir(void)
> +     exec_dir = qemu_get_exec_dir();
> +     g_return_val_if_fail(exec_dir != NULL, NULL);
> +
> ++    dir = g_build_filename(exec_dir, "..", "share", "qemu", NULL);
> ++    if (g_file_test(dir, G_FILE_TEST_IS_DIR)) {
> ++        return g_steal_pointer(&dir);
> ++    }
> ++    g_free(dir);  /* no autofree this time */
> ++
> +     dir = g_build_filename(exec_dir, "..", "pc-bios", NULL);
> +     if (g_file_test(dir, G_FILE_TEST_IS_DIR)) {
> +         return g_steal_pointer(&dir);
> diff --git a/meta/recipes-devtools/qemu/qemu_4.2.0.bb
> b/meta/recipes-devtools/qemu/qemu_5.0.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/qemu/qemu_4.2.0.bb
> rename to meta/recipes-devtools/qemu/qemu_5.0.0.bb
> --
> 2.27.0
>
> 
>

--000000000000e6a23f05a871fc88
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div dir=3D"lt=
r">On Fri, 19 Jun 2020 at 16:59, Sakib Sajal &lt;<a href=3D"mailto:sakib.sa=
jal@windriver.com" target=3D"_blank">sakib.sajal@windriver.com</a>&gt; wrot=
e:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Ran qemu-ptest on x86-64 and arm64 with identical results:<br=
>
PASS: 1166<br>
SKIP:=C2=A0 =C2=A0 0<br>
FAIL:=C2=A0 =C2=A0 0<br></blockquote><div><br></div><div>Please add qemu-p=
test to conf/distro/include/ptest-packagelists.inc if it is now passing :)<=
br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
<br>
--- a/meta/classes/qemuboot.bbclass<br>
+++ b/meta/classes/qemuboot.bbclass<br>
@@ -77,7 +77,7 @@ QB_MEM ?=3D &quot;-m 256&quot;<br>
=C2=A0QB_SERIAL_OPT ?=3D &quot;-serial mon:stdio -serial null&quot;<br>
=C2=A0QB_DEFAULT_KERNEL ?=3D &quot;${KERNEL_IMAGETYPE}&quot;<br>
=C2=A0QB_DEFAULT_FSTYPE ?=3D &quot;ext4&quot;<br>
-QB_OPT_APPEND ?=3D &quot;-show-cursor&quot;<br>
+QB_OPT_APPEND ?=3D &quot;-display sdl,show-cursor=3Don&quot;<br></blockqu=
ote><div><br></div><div>This is not correct as it enforces the SDL frontend=
 even in non-graphical environments, or when people want to use gtk instead=
. Please adjust scripts/runqemu instead to add the option everywhere where =
-display is used.</div><div><br></div><div>The rest looks fine, thanks for =
working on this :)</div><div><br></div><div>Alex<br></div><div><br></div><d=
iv><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">--- a/meta/recipes-devtools/qemu/qemu/0001-Add-enable-disable-udev.pat=
ch<br>
+++ b/meta/recipes-devtools/qemu/qemu/0001-Add-enable-disable-udev.patch<b=
r>
@@ -1,21 +1,24 @@<br>
-From a471cf4e4c73350e090eb2cd87ec959d138012e5 Mon Sep 17 00:00:00 2001<br=
>
+From b921e5204030845dc7c9d16d5f66d965e8d05367 Mon Sep 17 00:00:00 2001<br=
>
=C2=A0From: Jeremy Puhlman &lt;<a href=3D"mailto:jpuhlman@mvista.com" targ=
et=3D"_blank">jpuhlman@mvista.com</a>&gt;<br>
=C2=A0Date: Thu, 19 Mar 2020 11:54:26 -0700<br>
=C2=A0Subject: [PATCH] Add enable/disable libudev<br>
<br>
=C2=A0Upstream-Status: Pending<br>
=C2=A0Signed-off-by: Jeremy Puhlman &lt;<a href=3D"mailto:jpuhlman@mvista.=
com" target=3D"_blank">jpuhlman@mvista.com</a>&gt;<br>
+<br>
+[update patch context]<br>
+Signed-off-by: Sakib Sajal &lt;<a href=3D"mailto:sakib.sajal@windriver.co=
m" target=3D"_blank">sakib.sajal@windriver.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 configure | 4 ++++<br>
=C2=A0 1 file changed, 4 insertions(+)<br>
<br>
=C2=A0diff --git a/configure b/configure<br>
-index cac271c..bd116eb 100755<br>
+index 36646e7b..48912a94 100755<br>
=C2=A0--- a/configure<br>
=C2=A0+++ b/configure<br>
-@@ -1539,6 +1539,10 @@ for opt do<br>
+@@ -1601,6 +1601,10 @@ for opt do<br>
=C2=A0 =C2=A0 ;;<br>
-=C2=A0 =C2=A0--disable-plugins) plugins=3D&quot;no&quot;<br>
+=C2=A0 =C2=A0--gdb=3D*) gdb_bin=3D&quot;$optarg&quot;<br>
=C2=A0 =C2=A0 ;;<br>
=C2=A0+=C2=A0 --enable-libudev) libudev=3D&quot;yes&quot;<br>
=C2=A0+=C2=A0 ;;<br>
@@ -25,5 +28,5 @@ index cac271c..bd116eb 100755<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;ERROR: unknown option $opt&quot;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Try &#39;$0 --help&#39; for more in=
formation&quot;<br>
=C2=A0-- <br>
-1.8.3.1<br>
+2.24.0<br>
<br>
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-missing-wacom-H=
ID-descriptor.patch b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-missing=
-wacom-HID-descriptor.patch<br>
index 66ff996508..ae89ae09dd 100644<br>
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-missing-wacom-HID-desc=
riptor.patch<br>
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-missing-wacom-HID-desc=
riptor.patch<br>
@@ -1,4 +1,4 @@<br>
-From 526cb7e26f6dd96c9ee2ffa05ce0a358d3bfbfb3 Mon Sep 17 00:00:00 2001<br=
>
+From 883feb43129dc39b491e492c7ccfe89aefe53c44 Mon Sep 17 00:00:00 2001<br=
>
=C2=A0From: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfound=
ation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
=C2=A0Date: Thu, 27 Nov 2014 14:04:29 +0000<br>
=C2=A0Subject: [PATCH] qemu: Add missing wacom HID descriptor<br>
@@ -14,6 +14,8 @@ Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:rich=
ard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfound=
ation.org</a>&gt;<br>
=C2=A0Upstream-Status: Submitted<br>
=C2=A02014/11/27<br>
<br>
+[update patch context]<br>
+Signed-off-by: Sakib Sajal &lt;<a href=3D"mailto:sakib.sajal@windriver.co=
m" target=3D"_blank">sakib.sajal@windriver.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 hw/usb/dev-wacom.c | 94 +++++++++++++++++++++++++++++++++++++++++++=
++-<br>
=C2=A0 1 file changed, 93 insertions(+), 1 deletion(-)<br>
@@ -137,3 +139,6 @@ index 8ed57b3b..1502928b 100644<br>
=C2=A0 =C2=A0 =C2=A0 case WACOM_SET_REPORT:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;mouse_grabbed) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_remove_mouse_event_h=
andler(s-&gt;eh_entry);<br>
+-- <br>
+2.24.0<br>
+<br>
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Do-not-include-file=
-if-not-exists.patch b/meta/recipes-devtools/qemu/qemu/0001-qemu-Do-not-inc=
lude-file-if-not-exists.patch<br>
index eccac0509c..6e38d814cd 100644<br>
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Do-not-include-file-if-not=
-exists.patch<br>
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Do-not-include-file-if-not=
-exists.patch<br>
@@ -1,4 +1,4 @@<br>
-From 98c2da129db19ee63d7e21b77a0ef70822c95069 Mon Sep 17 00:00:00 2001<br=
>
+From 34247f83095f8cdcdc1f9d7f0c6ffbd46b25d979 Mon Sep 17 00:00:00 2001<br=
>
=C2=A0From: Oleksiy Obitotskyy &lt;<a href=3D"mailto:oobitots@cisco.com" t=
arget=3D"_blank">oobitots@cisco.com</a>&gt;<br>
=C2=A0Date: Wed, 25 Mar 2020 21:21:35 +0200<br>
=C2=A0Subject: [PATCH] qemu: Do not include file if not exists<br>
@@ -8,24 +8,27 @@ if_alg.h still included.<br>
<br>
=C2=A0Upstream-status: Submitted [<a href=3D"https://lists.gnu.org/archive=
/html/qemu-devel/2020-03/msg07188.html" rel=3D"noreferrer" target=3D"_blank=
">https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg07188.html</a>]<=
br>
=C2=A0Signed-off-by: Oleksiy Obitotskyy &lt;<a href=3D"mailto:oobitots@cis=
co.com" target=3D"_blank">oobitots@cisco.com</a>&gt;<br>
+<br>
+[update patch context]<br>
+Signed-off-by: Sakib Sajal &lt;<a href=3D"mailto:sakib.sajal@windriver.co=
m" target=3D"_blank">sakib.sajal@windriver.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 linux-user/syscall.c | 2 ++<br>
=C2=A0 1 file changed, 2 insertions(+)<br>
<br>
=C2=A0diff --git a/linux-user/syscall.c b/linux-user/syscall.c<br>
-index fc18f244..68d62666 100644<br>
+index d6f8cc97..a61420e7 100644<br>
=C2=A0--- a/linux-user/syscall.c<br>
=C2=A0+++ b/linux-user/syscall.c<br>
-@@ -106,7 +106,9 @@<br>
+@@ -109,7 +109,9 @@<br>
=C2=A0 #include &lt;linux/blkpg.h&gt;<br>
=C2=A0 #include &lt;netpacket/packet.h&gt;<br>
=C2=A0 #include &lt;linux/netlink.h&gt;<br>
=C2=A0+#if defined(CONFIG_AF_ALG)<br>
=C2=A0 #include &lt;linux/if_alg.h&gt;<br>
=C2=A0+#endif<br>
+ #include &lt;linux/rtc.h&gt;<br>
+ #include &lt;sound/asound.h&gt;<br>
=C2=A0 #include &quot;linux_loop.h&quot;<br>
- #include &quot;uname.h&quot;<br>
- <br>
=C2=A0-- <br>
-2.20.1<br>
+2.24.0<br>
<br>
diff --git a/meta/recipes-devtools/qemu/qemu/0002-Add-subpackage-ptest-whi=
ch-runs-all-unit-test-cases-.patch b/meta/recipes-devtools/qemu/qemu/0002-A=
dd-subpackage-ptest-which-runs-all-unit-test-cases-.patch<br>
index 7f7da51006..3d268870fc 100644<br>
--- a/meta/recipes-devtools/qemu/qemu/0002-Add-subpackage-ptest-which-runs=
-all-unit-test-cases-.patch<br>
+++ b/meta/recipes-devtools/qemu/qemu/0002-Add-subpackage-ptest-which-runs=
-all-unit-test-cases-.patch<br>
@@ -1,4 +1,4 @@<br>
-From 8ee6281516bd9210e75e91d705da8916bab3bf51 Mon Sep 17 00:00:00 2001<br=
>
+From 5da6cef7761157a003e7ebde74fb3cf90ab396d9 Mon Sep 17 00:00:00 2001<br=
>
=C2=A0From: Juro Bystricky &lt;<a href=3D"mailto:juro.bystricky@intel.com"=
 target=3D"_blank">juro.bystricky@intel.com</a>&gt;<br>
=C2=A0Date: Thu, 31 Aug 2017 11:06:56 -0700<br>
=C2=A0Subject: [PATCH] Add subpackage -ptest which runs all unit test case=
s for<br>
@@ -10,17 +10,19 @@ Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang=
@windriver.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
<br>
=C2=A0Signed-off-by: Juro Bystricky &lt;<a href=3D"mailto:juro.bystricky@i=
ntel.com" target=3D"_blank">juro.bystricky@intel.com</a>&gt;<br>
<br>
+[update patch context]<br>
+Signed-off-by: Sakib Sajal &lt;<a href=3D"mailto:sakib.sajal@windriver.co=
m" target=3D"_blank">sakib.sajal@windriver.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 tests/Makefile.include | 8 ++++++++<br>
=C2=A0 1 file changed, 8 insertions(+)<br>
<br>
=C2=A0diff --git a/tests/Makefile.include b/tests/Makefile.include<br>
-index 8566f5f1..52d0320b 100644<br>
+index 51de6762..1ea4d322 100644<br>
=C2=A0--- a/tests/Makefile.include<br>
=C2=A0+++ b/tests/Makefile.include<br>
-@@ -1210,4 +1210,12 @@ all: $(QEMU_IOTESTS_HELPERS-y)<br>
- -include $(wildcard tests/*.d)<br>
- -include $(wildcard tests/libqos/*.d)<br>
+@@ -941,4 +941,12 @@ all: $(QEMU_IOTESTS_HELPERS-y)<br>
+ -include $(wildcard tests/qtest/*.d)<br>
+ -include $(wildcard tests/qtest/libqos/*.d)<br>
<br>
=C2=A0+buildtest-TESTS: $(check-unit-y)<br>
=C2=A0+<br>
@@ -31,3 +33,6 @@ index 8566f5f1..52d0320b 100644<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 done<br>
=C2=A0+<br>
=C2=A0 endif<br>
+-- <br>
+2.24.0<br>
+<br>
diff --git a/meta/recipes-devtools/qemu/qemu/0005-qemu-native-set-ld.bfd-f=
ix-cflags-and-set-some-envir.patch b/meta/recipes-devtools/qemu/qemu/0005-q=
emu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch<br>
index ec303371b0..2c5b241e41 100644<br>
--- a/meta/recipes-devtools/qemu/qemu/0005-qemu-native-set-ld.bfd-fix-cfla=
gs-and-set-some-envir.patch<br>
+++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-native-set-ld.bfd-fix-cfla=
gs-and-set-some-envir.patch<br>
@@ -1,22 +1,24 @@<br>
-From 6cdf82af2eba312b9b8da86dda28b98d3d51f4d4 Mon Sep 17 00:00:00 2001<br=
>
+From 230fe5804099bdca0c9e4cae7280c9fc513cb7f5 Mon Sep 17 00:00:00 2001<br=
>
=C2=A0From: Stephen Arnold &lt;<a href=3D"mailto:sarnold@vctlabs.com" targ=
et=3D"_blank">sarnold@vctlabs.com</a>&gt;<br>
=C2=A0Date: Sun, 12 Jun 2016 18:09:56 -0700<br>
=C2=A0Subject: [PATCH] qemu-native: set ld.bfd, fix cflags, and set some e=
nvironment<br>
<br>
=C2=A0Upstream-Status: Pending<br>
<br>
+[update patch context]<br>
+Signed-off-by: Sakib Sajal &lt;<a href=3D"mailto:sakib.sajal@windriver.co=
m" target=3D"_blank">sakib.sajal@windriver.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 configure | 4 ----<br>
=C2=A0 1 file changed, 4 deletions(-)<br>
<br>
=C2=A0diff --git a/configure b/configure<br>
-index a766017b..72f11aca 100755<br>
+index 83c65439..6bdf488c 100755<br>
=C2=A0--- a/configure<br>
=C2=A0+++ b/configure<br>
-@@ -6085,10 +6085,6 @@ write_c_skeleton<br>
+@@ -6251,10 +6251,6 @@ write_c_skeleton<br>
=C2=A0 if test &quot;$gcov&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 =C2=A0CFLAGS=3D&quot;-fprofile-arcs -ftest-coverage -g $CFLAGS&quo=
t;<br>
-=C2=A0 =C2=A0LDFLAGS=3D&quot;-fprofile-arcs -ftest-coverage $LDFLAGS&quot=
;<br>
+=C2=A0 =C2=A0QEMU_CFLAGS=3D&quot;-fprofile-arcs -ftest-coverage -g $QEMU_=
CFLAGS&quot;<br>
+=C2=A0 =C2=A0QEMU_LDFLAGS=3D&quot;-fprofile-arcs -ftest-coverage $QEMU_LD=
FLAGS&quot;<br>
=C2=A0-elif test &quot;$fortify_source&quot; =3D &quot;yes&quot; ; then<br=
>
=C2=A0-=C2=A0 CFLAGS=3D&quot;-O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 $=
CFLAGS&quot;<br>
=C2=A0-elif test &quot;$debug&quot; =3D &quot;no&quot;; then<br>
@@ -24,3 +26,6 @@ index a766017b..72f11aca 100755<br>
=C2=A0 fi<br>
<br>
=C2=A0 if test &quot;$have_asan&quot; =3D &quot;yes&quot;; then<br>
+-- <br>
+2.24.0<br>
+<br>
diff --git a/meta/recipes-devtools/qemu/qemu/0009-Fix-webkitgtk-builds.pat=
ch b/meta/recipes-devtools/qemu/qemu/0009-Fix-webkitgtk-builds.patch<br>
index 7e273eeced..eef3f3f97f 100644<br>
--- a/meta/recipes-devtools/qemu/qemu/0009-Fix-webkitgtk-builds.patch<br>
+++ b/meta/recipes-devtools/qemu/qemu/0009-Fix-webkitgtk-builds.patch<br>
@@ -1,4 +1,4 @@<br>
-From 613166007e3b852c99caf2cd34a972e2c8460737 Mon Sep 17 00:00:00 2001<br=
>
+From 815c97ba0de02da9dace3fcfcbdf9b20e029f0d7 Mon Sep 17 00:00:00 2001<br=
>
=C2=A0From: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@lge.com" targe=
t=3D"_blank">martin.jansa@lge.com</a>&gt;<br>
=C2=A0Date: Fri, 1 Jun 2018 08:41:07 +0000<br>
=C2=A0Subject: [PATCH] Fix webkitgtk builds<br>
@@ -19,6 +19,8 @@ This reverts commit ebf9a3630c911d0cfc9c20f7cafe9ba4f88c=
f583.<br>
=C2=A0Upstream-Status: Pending<br>
=C2=A0Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.franc=
is@wdc.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
<br>
+[update patch context]<br>
+Signed-off-by: Sakib Sajal &lt;<a href=3D"mailto:sakib.sajal@windriver.co=
m" target=3D"_blank">sakib.sajal@windriver.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 include/exec/cpu-all.h=C2=A0 |=C2=A0 6 +-----<br>
=C2=A0 include/exec/cpu_ldst.h |=C2=A0 5 ++++-<br>
@@ -27,7 +29,7 @@ Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:al=
istair.francis@wdc.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<=
br>
=C2=A0 4 files changed, 10 insertions(+), 23 deletions(-)<br>
<br>
=C2=A0diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h<br>
-index e96781a4..a369f81a 100644<br>
+index 49384bb6..93b12519 100644<br>
=C2=A0--- a/include/exec/cpu-all.h<br>
=C2=A0+++ b/include/exec/cpu-all.h<br>
=C2=A0@@ -162,12 +162,8 @@ extern unsigned long guest_base;<br>
@@ -45,10 +47,10 @@ index e96781a4..a369f81a 100644<br>
<br>
=C2=A0 #include &quot;exec/hwaddr.h&quot;<br>
=C2=A0diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h<br>
-index fd499f7e..30575f60 100644<br>
+index 53de1975..cf19ed2e 100644<br>
=C2=A0--- a/include/exec/cpu_ldst.h<br>
=C2=A0+++ b/include/exec/cpu_ldst.h<br>
-@@ -65,7 +65,10 @@ typedef uint64_t abi_ptr;<br>
+@@ -70,7 +70,10 @@ typedef uint64_t abi_ptr;<br>
=C2=A0 #if HOST_LONG_BITS &lt;=3D TARGET_VIRT_ADDR_SPACE_BITS<br>
=C2=A0 #define guest_addr_valid(x) (1)<br>
=C2=A0 #else<br>
@@ -61,10 +63,10 @@ index fd499f7e..30575f60 100644<br>
=C2=A0 #define h2g_valid(x) guest_addr_valid((unsigned long)(x) - guest_ba=
se)<br>
<br>
=C2=A0diff --git a/linux-user/mmap.c b/linux-user/mmap.c<br>
-index 46a6e3a7..77354654 100644<br>
+index e3780337..1d4aba95 100644<br>
=C2=A0--- a/linux-user/mmap.c<br>
=C2=A0+++ b/linux-user/mmap.c<br>
-@@ -78,7 +78,7 @@ int target_mprotect(abi_ulong start, abi_ulong len, int=
 prot)<br>
+@@ -71,7 +71,7 @@ int target_mprotect(abi_ulong start, abi_ulong len, int=
 prot)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -TARGET_EINVAL;<br>
=C2=A0 =C2=A0 =C2=A0 len =3D TARGET_PAGE_ALIGN(len);<br>
=C2=A0 =C2=A0 =C2=A0 end =3D start + len;<br>
@@ -73,7 +75,7 @@ index 46a6e3a7..77354654 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -TARGET_ENOMEM;<br>
=C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 prot &amp;=3D PROT_READ | PROT_WRITE | PROT_EXEC;<br>
-@@ -495,8 +495,8 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, =
int prot,<br>
+@@ -467,8 +467,8 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, =
int prot,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* It can fail only on 64-bit host=
 with 32-bit target.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* On any other target/host host m=
map() handles this error correctly.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
@@ -84,7 +86,7 @@ index 46a6e3a7..77354654 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-@@ -636,10 +636,8 @@ int target_munmap(abi_ulong start, abi_ulong len)<br=
>
+@@ -604,10 +604,8 @@ int target_munmap(abi_ulong start, abi_ulong len)<br=
>
=C2=A0 =C2=A0 =C2=A0 if (start &amp; ~TARGET_PAGE_MASK)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -TARGET_EINVAL;<br>
=C2=A0 =C2=A0 =C2=A0 len =3D TARGET_PAGE_ALIGN(len);<br>
@@ -96,7 +98,7 @@ index 46a6e3a7..77354654 100644<br>
=C2=A0 =C2=A0 =C2=A0 mmap_lock();<br>
=C2=A0 =C2=A0 =C2=A0 end =3D start + len;<br>
=C2=A0 =C2=A0 =C2=A0 real_start =3D start &amp; qemu_host_page_mask;<br>
-@@ -694,13 +692,6 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong=
 old_size,<br>
+@@ -662,13 +660,6 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong=
 old_size,<br>
=C2=A0 =C2=A0 =C2=A0 int prot;<br>
=C2=A0 =C2=A0 =C2=A0 void *host_addr;<br>
<br>
@@ -111,10 +113,10 @@ index 46a6e3a7..77354654 100644<br>
<br>
=C2=A0 =C2=A0 =C2=A0 if (flags &amp; MREMAP_FIXED) {<br>
=C2=A0diff --git a/linux-user/syscall.c b/linux-user/syscall.c<br>
-index 171c0cae..fc18f244 100644<br>
+index 05f03919..d6f8cc97 100644<br>
=C2=A0--- a/linux-user/syscall.c<br>
=C2=A0+++ b/linux-user/syscall.c<br>
-@@ -4138,9 +4138,6 @@ static inline abi_ulong do_shmat(CPUArchState *cpu_=
env,<br>
+@@ -4287,9 +4287,6 @@ static inline abi_ulong do_shmat(CPUArchState *cpu_=
env,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -TARGET_EINVAL;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 }<br>
@@ -124,12 +126,15 @@ index 171c0cae..fc18f244 100644<br>
<br>
=C2=A0 =C2=A0 =C2=A0 mmap_lock();<br>
<br>
-@@ -6990,7 +6987,7 @@ static int open_self_maps(void *cpu_env, int fd)<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (h2g_valid(min)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int flags =3D page_get_fl=
ags(h2g(min));<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 max =3D h2g_valid(max - 1) ? m=
ax : (uintptr_t)g2h(GUEST_ADDR_MAX) + 1;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 max =3D h2g_valid(max - 1) ? m=
ax : (uintptr_t)g2h(GUEST_ADDR_MAX);<br>
+@@ -7247,7 +7244,7 @@ static int open_self_maps(void *cpu_env, int fd)<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *path;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max =3D h2g_valid(max - 1=
) ?<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 max : (uintptr_t=
) g2h(GUEST_ADDR_MAX) + 1;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 max : (uintptr_t=
) g2h(GUEST_ADDR_MAX);<br>
+ <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (page_check_range(h2g(=
min), max - min, flags) =3D=3D -1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-- <br>
+2.24.0<br>
+<br>
diff --git a/meta/recipes-devtools/qemu/qemu/0011-hw-i386-pc-fix-regressio=
n-in-parsing-vga-cmdline-par.patch b/meta/recipes-devtools/qemu/qemu/0011-h=
w-i386-pc-fix-regression-in-parsing-vga-cmdline-par.patch<br>
deleted file mode 100644<br>
index 2fe0850a33..0000000000<br>
--- a/meta/recipes-devtools/qemu/qemu/0011-hw-i386-pc-fix-regression-in-pa=
rsing-vga-cmdline-par.patch<br>
+++ /dev/null<br>
@@ -1,54 +0,0 @@<br>
-From a88c40f02ace88f09b2a85a64831b277b2ebc88c Mon Sep 17 00:00:00 2001<br=
>
-From: Peter Wu &lt;<a href=3D"mailto:peter@lekensteyn.nl" target=3D"_blan=
k">peter@lekensteyn.nl</a>&gt;<br>
-Date: Sat, 21 Dec 2019 17:21:24 +0100<br>
-Subject: [PATCH] hw/i386/pc: fix regression in parsing vga cmdline parame=
ter<br>
-<br>
-When the &#39;vga=3D&#39; parameter is succeeded by another parameter, QE=
MU 4.2.0<br>
-would refuse to start with a rather cryptic message:<br>
-<br>
-=C2=A0 =C2=A0 $ qemu-system-x86_64 -kernel /boot/vmlinuz-linux -append &#=
39;vga=3D792 quiet&#39;<br>
-=C2=A0 =C2=A0 qemu: can&#39;t parse &#39;vga&#39; parameter: Invalid argu=
ment<br>
-<br>
-It was not clear whether this applied to the &#39;-vga std&#39; parameter=
 or the<br>
-&#39;-append&#39; one. Fix the parsing regression and clarify the error.<=
br>
-<br>
-Fixes: 133ef074bd (&quot;hw/i386/pc: replace use of strtol with qemu_strt=
oui in x86_load_linux()&quot;)<br>
-Cc: Sergio Lopez &lt;<a href=3D"mailto:slp@redhat.com" target=3D"_blank">=
slp@redhat.com</a>&gt;<br>
-Signed-off-by: Peter Wu &lt;<a href=3D"mailto:peter@lekensteyn.nl" target=
=
=3D"_blank">peter@lekensteyn.nl</a>&gt;<br>
-Message-Id: &lt;<a href=3D"mailto:20191221162124.1159291-1-peter@lekenste=
yn.nl" target=3D"_blank">20191221162124.1159291-1-peter@lekensteyn.nl</a>&g=
t;<br>
-Cc: <a href=3D"mailto:qemu-stable@nongnu.org" target=3D"_blank">qemu-stab=
le@nongnu.org</a><br>
-Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" t=
arget=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
-Upstream-Status: Backport [<a href=3D"https://git.qemu.org/?p=3Dqemu.git;=
a=3Dcommitdiff;h=3Da88c40f02ace88f09b2a85a64831b277b2ebc88c" rel=3D"norefer=
rer" target=3D"_blank">https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=
=3Da88c40f02ace88f09b2a85a64831b277b2ebc88c</a>]<br>
----<br>
- hw/i386/x86.c | 8 ++++----<br>
- 1 file changed, 4 insertions(+), 4 deletions(-)<br>
-<br>
-diff --git a/hw/i386/x86.c b/hw/i386/x86.c<br>
-index d8bb5c2a96..9b9a4d5837 100644<br>
---- a/hw/i386/x86.c<br>
-+++ b/hw/i386/x86.c<br>
-@@ -612,6 +612,7 @@ void x86_load_linux(X86MachineState *x86ms,<br>
-=C2=A0 =C2=A0 =C2=A0vmode =3D strstr(kernel_cmdline, &quot;vga=3D&quot;);=
<br>
-=C2=A0 =C2=A0 =C2=A0if (vmode) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int video_mode;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *end;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* skip &quot;vga=3D&quot; */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vmode +=3D 4;<br>
-@@ -622,10 +623,9 @@ void x86_load_linux(X86MachineState *x86ms,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (!strncmp(vmode, &quot;ask&qu=
ot;, 3)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0video_mode =3D 0xfffd;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D qemu_strtoui(vmode, NU=
LL, 0, &amp;video_mode);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret !=3D 0) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, =
&quot;qemu: can&#39;t parse &#39;vga&#39; parameter: %s\n&quot;,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 strerror(-ret));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D qemu_strtoui(vmode, &a=
mp;end, 0, &amp;video_mode);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret !=3D 0 || (*end &amp;&=
amp; *end !=3D &#39; &#39;)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, =
&quot;qemu: invalid &#39;vga=3D&#39; kernel parameter.\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--- <br>
-2.25.0<br>
-<br>
diff --git a/meta/recipes-devtools/qemu/qemu/0012-fix-libcap-header-issue-=
on-some-distro.patch b/meta/recipes-devtools/qemu/qemu/0012-fix-libcap-head=
er-issue-on-some-distro.patch<br>
deleted file mode 100644<br>
index 3a7d7bbd33..0000000000<br>
--- a/meta/recipes-devtools/qemu/qemu/0012-fix-libcap-header-issue-on-some=
-distro.patch<br>
+++ /dev/null<br>
@@ -1,86 +0,0 @@<br>
-From 9125afb733d8c96416bb83c5adad39bb8d0803a1 Mon Sep 17 00:00:00 2001<br=
>
-From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" target=
=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
-Date: Tue, 12 Mar 2013 09:54:06 +0800<br>
-Subject: [PATCH] fix libcap header issue on some distro<br>
-<br>
-1, When build qemu-native on SLED 11.2, there is an error:<br>
-...<br>
-| In file included from /usr/include/bits/sigcontext.h:28,<br>
-|=C2=A0 from /usr/include/signal.h:339,<br>
-|=C2=A0 from /buildarea2/tmp/work/i686-linux/qemu-native/1.4.0-r0/<br>
-qemu-1.4.0/include/qemu-common.h:42,<br>
-|=C2=A0 from fsdev/virtfs-proxy-helper.c:23:<br>
-|=C2=A0 /usr/include/asm/sigcontext.h:28: error: expected specifier-<br>
-qualifier-list before &#39;__u64&#39;<br>
-|=C2=A0 /usr/include/asm/sigcontext.h:191: error: expected specifier-<br>
-qualifier-list before &#39;__u64&#39;<br>
-...<br>
-<br>
-2, The virtfs-proxy-helper.c includes &lt;sys/capability.h&gt; and<br>
-qemu-common.h in sequence. The header include map is:<br>
-(`--&gt;&#39; presents `include&#39;)<br>
-...<br>
-&quot;virtfs-proxy-helper.c&quot; --&gt; &lt;sys/capability.h&gt;<br>
-...<br>
-&quot;virtfs-proxy-helper.c&quot; --&gt; &quot;qemu-common.h&quot; --&gt;=
 &lt;signal.h&gt; --&gt;<br>
-&lt;bits/sigcontext.h&gt; --&gt; &lt;asm/sigcontext.h&gt; --&gt; &lt;linu=
x/types.h&gt; --&gt;<br>
-&lt;asm/types.h&gt; --&gt; &lt;asm-generic/types.h&gt; --&gt; &lt;asm-gen=
eric/int-ll64.h&gt;<br>
-...<br>
-<br>
-3, The bug is found on SLED 11.2 x86. In libcap header file<br>
-/usr/include/sys/capability.h, it does evil stuff like this:<br>
-...<br>
-=C2=A0 25 /*<br>
-=C2=A0 26=C2=A0 * Make sure we can be included from userland by preventin=
g<br>
-=C2=A0 27=C2=A0 * capability.h from including other kernel headers<br>
-=C2=A0 28=C2=A0 */<br>
-=C2=A0 29 #define _LINUX_TYPES_H<br>
-=C2=A0 30 #define _LINUX_FS_H<br>
-=C2=A0 31 #define __LINUX_COMPILER_H<br>
-=C2=A0 32 #define __user<br>
-=C2=A0 33<br>
-=C2=A0 34 typedef unsigned int __u32;<br>
-=C2=A0 35 typedef __u32 __le32;<br>
-...<br>
-This completely prevents including /usr/include/linux/types.h.<br>
-The above `&lt;asm/sigcontext.h&gt; --&gt; &lt;linux/types.h&gt;&#39; is =
prevented,<br>
-and &#39;__u64&#39; is defined in &lt;asm-generic/int-ll64.h&gt;.<br>
-<br>
-4, Modify virtfs-proxy-helper.c to include &lt;sys/capability.h&gt;<br>
-last to workaround the issue.<br>
-<br>
-<a href=3D"http://www.linuxtv.org/pipermail/vdr/2009-August/021194.html" =
rel=3D"noreferrer" target=3D"_blank">http://www.linuxtv.org/pipermail/vdr/2=
009-August/021194.html</a><br>
-<a href=3D"http://patchwork.linuxtv.org/patch/12748/" rel=3D"noreferrer" =
target=3D"_blank">http://patchwork.linuxtv.org/patch/12748/</a><br>
-<br>
-Upstream-Status: Pending<br>
-Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com"=
 target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
-<br>
----<br>
- fsdev/virtfs-proxy-helper.c | 7 +++++--<br>
- 1 file changed, 5 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c<br=
>
-index 6f132c5f..8329950c 100644<br>
---- a/fsdev/virtfs-proxy-helper.c<br>
-+++ b/fsdev/virtfs-proxy-helper.c<br>
-@@ -13,7 +13,6 @@<br>
- #include &lt;sys/resource.h&gt;<br>
- #include &lt;getopt.h&gt;<br>
- #include &lt;syslog.h&gt;<br>
--#include &lt;sys/capability.h&gt;<br>
- #include &lt;sys/fsuid.h&gt;<br>
- #include &lt;sys/vfs.h&gt;<br>
- #include &lt;sys/ioctl.h&gt;<br>
-@@ -27,7 +26,11 @@<br>
- #include &quot;9p-iov-marshal.h&quot;<br>
- #include &quot;hw/9pfs/9p-proxy.h&quot;<br>
- #include &quot;fsdev/9p-iov-marshal.h&quot;<br>
--<br>
-+/*<br>
-+ * Include this one last due to some versions of it being buggy:<br>
-+ * <a href=3D"http://www.linuxtv.org/pipermail/vdr/2009-August/021194.ht=
ml" rel=3D"noreferrer" target=3D"_blank">http://www.linuxtv.org/pipermail/v=
dr/2009-August/021194.html</a><br>
-+ */<br>
-+#include &lt;sys/capability.h&gt;<br>
- #define PROGNAME &quot;virtfs-proxy-helper&quot;<br>
- <br>
- #ifndef XFS_SUPER_MAGIC<br>
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2019-15890.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2019-15890.patch<br>
deleted file mode 100644<br>
index 1d89431be6..0000000000<br>
--- a/meta/recipes-devtools/qemu/qemu/CVE-2019-15890.patch<br>
+++ /dev/null<br>
@@ -1,48 +0,0 @@<br>
-From 4fc0d23e8f6d795c679623d2ed2cbe6a7a17b9c7 Mon Sep 17 00:00:00 2001<br=
>
-From: Li Zhou &lt;<a href=3D"mailto:li.zhou@windriver.com" target=3D"_bla=
nk">li.zhou@windriver.com</a>&gt;<br>
-Date: Tue, 10 Sep 2019 20:02:15 -0700<br>
-Subject: [PATCH] ip_reass: Fix use after free<br>
-<br>
-Using ip_deq after m_free might read pointers from an allocation reuse.<b=
r>
-<br>
-This would be difficult to exploit, but that is still related with<br>
-CVE-2019-14378 which generates fragmented IP packets that would trigger t=
his<br>
-issue and at least produce a DoS.<br>
-<br>
-Signed-off-by: Samuel Thibault &lt;<a href=3D"mailto:samuel.thibault@ens-=
lyon.org" target=3D"_blank">samuel.thibault@ens-lyon.org</a>&gt;<br>
-<br>
-Upstream-Status: Backport<br>
-CVE: CVE-2019-15890<br>
-Signed-off-by: Li Zhou &lt;<a href=3D"mailto:li.zhou@windriver.com" targe=
t=3D"_blank">li.zhou@windriver.com</a>&gt;<br>
----<br>
- slirp/src/ip_input.c | 6 ++++--<br>
- 1 file changed, 4 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/slirp/src/ip_input.c b/slirp/src/ip_input.c<br>
-index 8c75d914..c07d7d40 100644<br>
---- a/slirp/src/ip_input.c<br>
-+++ b/slirp/src/ip_input.c<br>
-@@ -292,6 +292,7 @@ static struct ip *ip_reass(Slirp *slirp, struct ip *i=
p, struct ipq *fp)<br>
-=C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0while (q !=3D (struct ipasfrag *)&amp;fp-&gt;frag_lin=
k &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ip-&gt;ip_off + ip-&gt;ip_len &=
gt; q-&gt;ipf_off) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct ipasfrag *prev;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i =3D (ip-&gt;ip_off + ip-&gt;ip_len) -=
 q-&gt;ipf_off;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (i &lt; q-&gt;ipf_len) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0q-&gt;ipf_len -=3D i;<br>
-@@ -299,9 +300,10 @@ static struct ip *ip_reass(Slirp *slirp, struct ip *=
ip, struct ipq *fp)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m_adj(dtom(slirp, q), i);=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 prev =3D q;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0q =3D q-&gt;ipf_next;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 m_free(dtom(slirp, q-&gt;ipf_prev));<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 ip_deq(q-&gt;ipf_prev);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ip_deq(prev);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 m_free(dtom(slirp, prev));<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
- insert:<br>
--- <br>
-2.23.0<br>
-<br>
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-11102.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2020-11102.patch<br>
deleted file mode 100644<br>
index e8f3e1dbdb..0000000000<br>
--- a/meta/recipes-devtools/qemu/qemu/CVE-2020-11102.patch<br>
+++ /dev/null<br>
@@ -1,148 +0,0 @@<br>
-From 8ffb7265af64ec81748335ec8f20e7ab542c3850 Mon Sep 17 00:00:00 2001<br=
>
-From: Prasad J Pandit &lt;<a href=3D"mailto:pjp@fedoraproject.org" target=
=
=3D"_blank">pjp@fedoraproject.org</a>&gt;<br>
-Date: Tue, 24 Mar 2020 22:57:22 +0530<br>
-Subject: [PATCH] net: tulip: check frame size and r/w data length<br>
-<br>
-Tulip network driver while copying tx/rx buffers does not check<br>
-frame size against r/w data length. This may lead to OOB buffer<br>
-access. Add check to avoid it.<br>
-<br>
-Limit iterations over descriptors to avoid potential infinite<br>
-loop issue in tulip_xmit_list_update.<br>
-<br>
-Reported-by: Li Qiang &lt;<a href=3D"mailto:pangpei.lq@antfin.com" target=
=
=3D"_blank">pangpei.lq@antfin.com</a>&gt;<br>
-Reported-by: Ziming Zhang &lt;<a href=3D"mailto:ezrakiez@gmail.com" targe=
t=3D"_blank">ezrakiez@gmail.com</a>&gt;<br>
-Reported-by: Jason Wang &lt;<a href=3D"mailto:jasowang@redhat.com" target=
=
=3D"_blank">jasowang@redhat.com</a>&gt;<br>
-Tested-by: Li Qiang &lt;<a href=3D"mailto:liq3ea@gmail.com" target=3D"_bl=
ank">liq3ea@gmail.com</a>&gt;<br>
-Reviewed-by: Li Qiang &lt;<a href=3D"mailto:liq3ea@gmail.com" target=3D"_=
blank">liq3ea@gmail.com</a>&gt;<br>
-Signed-off-by: Prasad J Pandit &lt;<a href=3D"mailto:pjp@fedoraproject.or=
g" target=3D"_blank">pjp@fedoraproject.org</a>&gt;<br>
-Signed-off-by: Jason Wang &lt;<a href=3D"mailto:jasowang@redhat.com" targ=
et=3D"_blank">jasowang@redhat.com</a>&gt;<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://git.qemu.org/?p=3Dqemu.git;=
a=3Dcommit;h=3D8ffb7265af64ec81748335ec8f20e7ab542c3850" rel=3D"noreferrer"=
 target=3D"_blank">https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D8ffb72=
65af64ec81748335ec8f20e7ab542c3850</a>]<br>
-CVE: CVE-2020-11102<br>
-Signed-off-by: Chee Yang Lee &lt;<a href=3D"mailto:chee.yang.lee@intel.co=
m" target=3D"_blank">chee.yang.lee@intel.com</a>&gt;<br>
----<br>
- hw/net/tulip.c | 36 +++++++++++++++++++++++++++---------<br>
- 1 file changed, 27 insertions(+), 9 deletions(-)<br>
-<br>
-diff --git a/hw/net/tulip.c b/hw/net/tulip.c<br>
-index cfac271..1295f51 100644<br>
---- a/hw/net/tulip.c<br>
-+++ b/hw/net/tulip.c<br>
-@@ -170,6 +170,10 @@ static void tulip_copy_rx_bytes(TULIPState *s, struc=
t tulip_descriptor *desc)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D s-&gt;rx_frame_le=
n;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;rx_frame_len + len &gt; sizeof(s-&=
gt;rx_frame)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pci_dma_write(&amp;s-&gt;dev, desc-&gt;=
buf_addr1, s-&gt;rx_frame +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(s-&gt;rx_frame_size - s-=
&gt;rx_frame_len), len);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;rx_frame_len -=3D len;<br>
-@@ -181,6 +185,10 @@ static void tulip_copy_rx_bytes(TULIPState *s, struc=
t tulip_descriptor *desc)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D s-&gt;rx_frame_le=
n;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;rx_frame_len + len &gt; sizeof(s-&=
gt;rx_frame)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pci_dma_write(&amp;s-&gt;dev, desc-&gt;=
buf_addr2, s-&gt;rx_frame +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(s-&gt;rx_frame_size - s-=
&gt;rx_frame_len), len);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;rx_frame_len -=3D len;<br>
-@@ -227,7 +235,8 @@ static ssize_t tulip_receive(TULIPState *s, const uin=
t8_t *buf, size_t size)<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0trace_tulip_receive(buf, size);<br>
- <br>
--=C2=A0 =C2=A0 if (size &lt; 14 || size &gt; 2048 || s-&gt;rx_frame_len |=
| tulip_rx_stopped(s)) {<br>
-+=C2=A0 =C2=A0 if (size &lt; 14 || size &gt; sizeof(s-&gt;rx_frame) - 4<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 || s-&gt;rx_frame_len || tulip_rx_stopped(s)=
) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-@@ -275,7 +284,6 @@ static ssize_t tulip_receive_nc(NetClientState *nc,<b=
r>
-=C2=A0 =C2=A0 =C2=A0return tulip_receive(qemu_get_nic_opaque(nc), buf, si=
ze);<br>
- }<br>
- <br>
--<br>
- static NetClientInfo net_tulip_info =3D {<br>
-=C2=A0 =C2=A0 =C2=A0.type =3D NET_CLIENT_DRIVER_NIC,<br>
-=C2=A0 =C2=A0 =C2=A0.size =3D sizeof(NICState),<br>
-@@ -558,7 +566,7 @@ static void tulip_tx(TULIPState *s, struct tulip_desc=
riptor *desc)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((s-&gt;csr[6] &gt;&gt; CSR6_OM_SHIF=
T) &amp; CSR6_OM_MASK) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Internal or external L=
oopback */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tulip_receive(s, s-&gt;tx=
_frame, s-&gt;tx_frame_len);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (s-&gt;tx_frame_len &lt;=3D sizeof=
(s-&gt;tx_frame)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_send_packet(qemu_get=
_queue(s-&gt;nic),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;tx_fr=
ame, s-&gt;tx_frame_len);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-@@ -570,23 +578,31 @@ static void tulip_tx(TULIPState *s, struct tulip_de=
scriptor *desc)<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- }<br>
- <br>
--static void tulip_copy_tx_buffers(TULIPState *s, struct tulip_descriptor=
 *desc)<br>
-+static int tulip_copy_tx_buffers(TULIPState *s, struct tulip_descriptor =
*desc)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0int len1 =3D (desc-&gt;control &gt;&gt; TDES1_BUF1_SI=
ZE_SHIFT) &amp; TDES1_BUF1_SIZE_MASK;<br>
-=C2=A0 =C2=A0 =C2=A0int len2 =3D (desc-&gt;control &gt;&gt; TDES1_BUF2_SI=
ZE_SHIFT) &amp; TDES1_BUF2_SIZE_MASK;<br>
- <br>
-+=C2=A0 =C2=A0 if (s-&gt;tx_frame_len + len1 &gt; sizeof(s-&gt;tx_frame))=
 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
-+=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0if (len1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pci_dma_read(&amp;s-&gt;dev, desc-&gt;b=
uf_addr1,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;tx_frame + s-&gt;tx=
_frame_len, len1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;tx_frame_len +=3D len1;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-+=C2=A0 =C2=A0 if (s-&gt;tx_frame_len + len2 &gt; sizeof(s-&gt;tx_frame))=
 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
-+=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0if (len2) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pci_dma_read(&amp;s-&gt;dev, desc-&gt;b=
uf_addr2,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;tx_frame + s-&gt;tx=
_frame_len, len2);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;tx_frame_len +=3D len2;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0desc-&gt;status =3D (len1 + len2) ? 0 : 0x7fffffff;<b=
r>
-+<br>
-+=C2=A0 =C2=A0 return 0;<br>
- }<br>
- <br>
- static void tulip_setup_filter_addr(TULIPState *s, uint8_t *buf, int n)<=
br>
-@@ -651,13 +667,15 @@ static uint32_t tulip_ts(TULIPState *s)<br>
- <br>
- static void tulip_xmit_list_update(TULIPState *s)<br>
- {<br>
-+#define TULIP_DESC_MAX 128<br>
-+=C2=A0 =C2=A0 uint8_t i =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0struct tulip_descriptor desc;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0if (tulip_ts(s) !=3D CSR5_TS_SUSPENDED) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--=C2=A0 =C2=A0 for (;;) {<br>
-+=C2=A0 =C2=A0 for (i =3D 0; i &lt; TULIP_DESC_MAX; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tulip_desc_read(s, s-&gt;current_tx_des=
c, &amp;desc);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tulip_dump_tx_descriptor(s, &amp;desc);=
<br>
- <br>
-@@ -675,10 +693,10 @@ static void tulip_xmit_list_update(TULIPState *s)<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;tx_fr=
ame_len =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tulip_copy_tx_buffers(s, &amp;=
desc);<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (desc.control &amp; TDES1_L=
S) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tulip_tx(s, &amp=
;desc);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!tulip_copy_tx_buffers(s, =
&amp;desc)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (desc.control=
 &amp; TDES1_LS) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tu=
lip_tx(s, &amp;desc);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tulip_desc_write(s, s-&gt;current_tx_de=
sc, &amp;desc);<br>
--- <br>
-1.8.3.1<br>
-<br>
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-11869.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2020-11869.patch<br>
deleted file mode 100644<br>
index ca7ffed934..0000000000<br>
--- a/meta/recipes-devtools/qemu/qemu/CVE-2020-11869.patch<br>
+++ /dev/null<br>
@@ -1,97 +0,0 @@<br>
-From ac2071c3791b67fc7af78b8ceb320c01ca1b5df7 Mon Sep 17 00:00:00 2001<br=
>
-From: BALATON Zoltan &lt;<a href=3D"mailto:balaton@eik.bme.hu" target=3D"=
_blank">balaton@eik.bme.hu</a>&gt;<br>
-Date: Mon, 6 Apr 2020 22:34:26 +0200<br>
-Subject: [PATCH] ati-vga: Fix checks in ati_2d_blt() to avoid crash<br>
-<br>
-In some corner cases (that never happen during normal operation but a<br>
-malicious guest could program wrong values) pixman functions were<br>
-called with parameters that result in a crash. Fix this and add more<br>
-checks to disallow such cases.<br>
-<br>
-Reported-by: Ziming Zhang &lt;<a href=3D"mailto:ezrakiez@gmail.com" targe=
t=3D"_blank">ezrakiez@gmail.com</a>&gt;<br>
-Signed-off-by: BALATON Zoltan &lt;<a href=3D"mailto:balaton@eik.bme.hu" t=
arget=3D"_blank">balaton@eik.bme.hu</a>&gt;<br>
-Message-id: <a href=3D"mailto:20200406204029.19559747D5D@zero.eik.bme.hu"=
 target=3D"_blank">20200406204029.19559747D5D@zero.eik.bme.hu</a><br>
-Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" tar=
get=3D"_blank">kraxel@redhat.com</a>&gt;<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://git.qemu.org/?p=3Dqemu.git;=
a=3Dcommit;h=3Dac2071c3791b67fc7af78b8ceb320c01ca1b5df7" rel=3D"noreferrer"=
 target=3D"_blank">https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Dac2071=
c3791b67fc7af78b8ceb320c01ca1b5df7</a>]<br>
-CVE: CVE-2020-11869<br>
-Signed-off-by: Lee Chee Yang &lt;<a href=3D"mailto:chee.yang.lee@intel.co=
m" target=3D"_blank">chee.yang.lee@intel.com</a>&gt;<br>
----<br>
- hw/display/ati_2d.c | 37 ++++++++++++++++++++++++++-----------<br>
- 1 file changed, 26 insertions(+), 11 deletions(-)<br>
-<br>
-diff --git a/hw/display/ati_2d.c b/hw/display/ati_2d.c<br>
-index 42e8231..23a8ae0 100644<br>
---- a/hw/display/ati_2d.c<br>
-+++ b/hw/display/ati_2d.c<br>
-@@ -53,12 +53,20 @@ void ati_2d_blt(ATIVGAState *s)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;vga.vbe_start_addr,=
 surface_data(ds), surface_stride(ds),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0surface_bits_per_pixel(ds=
),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(s-&gt;regs.dp_mix &amp; =
GMC_ROP3_MASK) &gt;&gt; 16);<br>
--=C2=A0 =C2=A0 int dst_x =3D (s-&gt;regs.dp_cntl &amp; DST_X_LEFT_TO_RIGH=
T ?<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;regs=
.dst_x : s-&gt;regs.dst_x + 1 - s-&gt;regs.dst_width);<br>
--=C2=A0 =C2=A0 int dst_y =3D (s-&gt;regs.dp_cntl &amp; DST_Y_TOP_TO_BOTTO=
M ?<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;regs=
.dst_y : s-&gt;regs.dst_y + 1 - s-&gt;regs.dst_height);<br>
-+=C2=A0 =C2=A0 unsigned dst_x =3D (s-&gt;regs.dp_cntl &amp; DST_X_LEFT_TO=
_RIGHT ?<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 s-&gt;regs.dst_x : s-&gt;regs.dst_x + 1 - s-&gt;regs.dst_width);<br=
>
-+=C2=A0 =C2=A0 unsigned dst_y =3D (s-&gt;regs.dp_cntl &amp; DST_Y_TOP_TO_=
BOTTOM ?<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 s-&gt;regs.dst_y : s-&gt;regs.dst_y + 1 - s-&gt;regs.dst_height);<b=
r>
-=C2=A0 =C2=A0 =C2=A0int bpp =3D ati_bpp_from_datatype(s);<br>
-+=C2=A0 =C2=A0 if (!bpp) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;Invalid=
 bpp\n&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-+=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0int dst_stride =3D DEFAULT_CNTL ? s-&gt;regs.dst_pitc=
h : s-&gt;regs.default_pitch;<br>
-+=C2=A0 =C2=A0 if (!dst_stride) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;Zero de=
st pitch\n&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-+=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0uint8_t *dst_bits =3D s-&gt;vga.vram_ptr + (DEFAULT_C=
NTL ?<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0s-&gt;regs.dst_offset : s-&gt;regs.default_offset);<br>
- <br>
-@@ -82,12 +90,16 @@ void ati_2d_blt(ATIVGAState *s)<br>
-=C2=A0 =C2=A0 =C2=A0switch (s-&gt;regs.dp_mix &amp; GMC_ROP3_MASK) {<br>
-=C2=A0 =C2=A0 =C2=A0case ROP3_SRCCOPY:<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 int src_x =3D (s-&gt;regs.dp_cntl &amp; DST_=
X_LEFT_TO_RIGHT ?<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0s-&gt;regs.src_x : s-&gt;regs.src_x + 1 - s-&gt;regs.dst_width);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 int src_y =3D (s-&gt;regs.dp_cntl &amp; DST_=
Y_TOP_TO_BOTTOM ?<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0s-&gt;regs.src_y : s-&gt;regs.src_y + 1 - s-&gt;regs.dst_height);<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned src_x =3D (s-&gt;regs.dp_cntl &amp;=
 DST_X_LEFT_TO_RIGHT ?<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0s-&gt;regs.src_x : s-&gt;regs.src_x + 1 - s-&gt;regs.dst_widt=
h);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned src_y =3D (s-&gt;regs.dp_cntl &amp;=
 DST_Y_TOP_TO_BOTTOM ?<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0s-&gt;regs.src_y : s-&gt;regs.src_y + 1 - s-&gt;regs.dst_heig=
ht);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int src_stride =3D DEFAULT_CNTL ?<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 s-&gt;regs.src_pitch : s-&gt;regs.default_pitch;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!src_stride) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,=
 &quot;Zero source pitch\n&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t *src_bits =3D s-&gt;vga.vram_pt=
r + (DEFAULT_CNTL ?<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;regs.src_offset : s-&gt;regs.default_=
offset);<br>
- <br>
-@@ -137,8 +149,10 @@ void ati_2d_blt(ATIVGAState *s)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dst_y * surface=
_stride(ds),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;regs.dst_=
height * surface_stride(ds));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs.dst_x +=3D s-&gt;regs.dst_width;<=
br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs.dst_y +=3D s-&gt;regs.dst_height;=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs.dst_x =3D (s-&gt;regs.dp_cntl &am=
p; DST_X_LEFT_TO_RIGHT ?<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0dst_x + s-&gt;regs.dst_width : dst_x);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs.dst_y =3D (s-&gt;regs.dp_cntl &am=
p; DST_Y_TOP_TO_BOTTOM ?<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0dst_y + s-&gt;regs.dst_height : dst_y);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0case ROP3_PATCOPY:<br>
-@@ -179,7 +193,8 @@ void ati_2d_blt(ATIVGAState *s)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dst_y * surface=
_stride(ds),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;regs.dst_=
height * surface_stride(ds));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs.dst_y +=3D s-&gt;regs.dst_height;=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs.dst_y =3D (s-&gt;regs.dp_cntl &am=
p; DST_Y_TOP_TO_BOTTOM ?<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0dst_y + s-&gt;regs.dst_height : dst_y);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0default:<br>
--- <br>
-1.8.3.1<br>
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-1711.patch b/meta/re=
cipes-devtools/qemu/qemu/CVE-2020-1711.patch<br>
deleted file mode 100644<br>
index aa7bc82329..0000000000<br>
--- a/meta/recipes-devtools/qemu/qemu/CVE-2020-1711.patch<br>
+++ /dev/null<br>
@@ -1,64 +0,0 @@<br>
-From 693fd2acdf14dd86c0bf852610f1c2cca80a74dc Mon Sep 17 00:00:00 2001<br=
>
-From: Felipe Franciosi &lt;<a href=3D"mailto:felipe@nutanix.com" target=
=3D"_blank">felipe@nutanix.com</a>&gt;<br>
-Date: Thu, 23 Jan 2020 12:44:59 +0000<br>
-Subject: [PATCH] iscsi: Cap block count from GET LBA STATUS (CVE-2020-171=
1)<br>
-<br>
-When querying an iSCSI server for the provisioning status of blocks (via<=
br>
-GET LBA STATUS), Qemu only validates that the response descriptor zero&#3=
9;s<br>
-LBA matches the one requested. Given the SCSI spec allows servers to<br>
-respond with the status of blocks beyond the end of the LUN, Qemu may<br>
-have its heap corrupted by clearing/setting too many bits at the end of<b=
r>
-its allocmap for the LUN.<br>
-<br>
-A malicious guest in control of the iSCSI server could carefully program<=
br>
-Qemu&#39;s heap (by selectively setting the bitmap) and then smash it.<br=
>
-<br>
-This limits the number of bits that iscsi_co_block_status() will try to<b=
r>
-update in the allocmap so it can&#39;t overflow the bitmap.<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://git.qemu.org/?p=3Dqemu.git;=
a=3Dpatch;h=3D693fd2acdf14dd86c0bf852610f1c2cca80a74dc" rel=3D"noreferrer" =
target=3D"_blank">https://git.qemu.org/?p=3Dqemu.git;a=3Dpatch;h=3D693fd2ac=
df14dd86c0bf852610f1c2cca80a74dc</a>]<br>
-CVE: CVE-2020-1711<br>
-<br>
-Fixes: CVE-2020-1711<br>
-Cc: <a href=3D"mailto:qemu-stable@nongnu.org" target=3D"_blank">qemu-stab=
le@nongnu.org</a><br>
-Signed-off-by: Felipe Franciosi &lt;<a href=3D"mailto:felipe@nutanix.com"=
 target=3D"_blank">felipe@nutanix.com</a>&gt;<br>
-Signed-off-by: Peter Turschmid &lt;<a href=3D"mailto:peter.turschm@nutani=
x.com" target=3D"_blank">peter.turschm@nutanix.com</a>&gt;<br>
-Signed-off-by: Raphael Norwitz &lt;<a href=3D"mailto:raphael.norwitz@nuta=
nix.com" target=3D"_blank">raphael.norwitz@nutanix.com</a>&gt;<br>
-Signed-off-by: Kevin Wolf &lt;<a href=3D"mailto:kwolf@redhat.com" target=
=3D"_blank">kwolf@redhat.com</a>&gt;<br>
-Signed-off-by: Lee Chee Yang &lt;<a href=3D"mailto:chee.yang.lee@intel.co=
m" target=3D"_blank">chee.yang.lee@intel.com</a>&gt;<br>
----<br>
- block/iscsi.c | 5 +++--<br>
- 1 file changed, 3 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/block/iscsi.c b/block/iscsi.c<br>
-index 2aea7e3..cbd5729 100644<br>
---- a/block/iscsi.c<br>
-+++ b/block/iscsi.c<br>
-@@ -701,7 +701,7 @@ static int coroutine_fn iscsi_co_block_status(BlockDr=
iverState *bs,<br>
-=C2=A0 =C2=A0 =C2=A0struct scsi_get_lba_status *lbas =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0struct scsi_lba_status_descriptor *lbasd =3D NULL;<br=
>
-=C2=A0 =C2=A0 =C2=A0struct IscsiTask iTask;<br>
--=C2=A0 =C2=A0 uint64_t lba;<br>
-+=C2=A0 =C2=A0 uint64_t lba, max_bytes;<br>
-=C2=A0 =C2=A0 =C2=A0int ret;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0iscsi_co_init_iscsitask(iscsilun, &amp;iTask);<br>
-@@ -721,6 +721,7 @@ static int coroutine_fn iscsi_co_block_status(BlockDr=
iverState *bs,<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0lba =3D offset / iscsilun-&gt;block_size;<br>
-+=C2=A0 =C2=A0 max_bytes =3D (iscsilun-&gt;num_blocks - lba) * iscsilun-&=
gt;block_size;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0qemu_mutex_lock(&amp;iscsilun-&gt;mutex);<br>
- retry:<br>
-@@ -764,7 +765,7 @@ retry:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_unlock;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--=C2=A0 =C2=A0 *pnum =3D (int64_t) lbasd-&gt;num_blocks * iscsilun-&gt;bl=
ock_size;<br>
-+=C2=A0 =C2=A0 *pnum =3D MIN((int64_t) lbasd-&gt;num_blocks * iscsilun-&g=
t;block_size, max_bytes);<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0if (lbasd-&gt;provisioning =3D=3D SCSI_PROVISIONING_T=
YPE_DEALLOCATED ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lbasd-&gt;provisioning =3D=3D SCSI_PROV=
ISIONING_TYPE_ANCHORED) {<br>
--- <br>
-1.8.3.1<br>
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-7039-1.patch b/meta/=
recipes-devtools/qemu/qemu/CVE-2020-7039-1.patch<br>
deleted file mode 100644<br>
index df6bca6db6..0000000000<br>
--- a/meta/recipes-devtools/qemu/qemu/CVE-2020-7039-1.patch<br>
+++ /dev/null<br>
@@ -1,44 +0,0 @@<br>
-From b2663d527a1992ba98c0266458b21ada3b9d0d2e Mon Sep 17 00:00:00 2001<br=
>
-From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com" targ=
et=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
-Date: Thu, 27 Feb 2020 12:07:35 +0800<br>
-Subject: [PATCH] tcp_emu: Fix oob access<br>
-<br>
-The main loop only checks for one available byte, while we sometimes<br>
-need two bytes.<br>
-<br>
-CVE: CVE-2020-7039<br>
-Upstream-Status: Backport<br>
-[<a href=3D"https://gitlab.freedesktop.org/slirp/libslirp/commit/2655fffe=
d7a9e765bcb4701dd876e9dab975f289" rel=3D"noreferrer" target=3D"_blank">http=
s://gitlab.freedesktop.org/slirp/libslirp/commit/2655fffed7a9e765bcb4701dd8=
76e9dab975f289</a>]<br>
-<br>
-Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.=
com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
----<br>
- slirp/src/tcp_subr.c | 6 ++++++<br>
- 1 file changed, 6 insertions(+)<br>
-<br>
-diff --git a/slirp/src/tcp_subr.c b/slirp/src/tcp_subr.c<br>
-index d6dd133..4bea2d4 100644<br>
---- a/slirp/src/tcp_subr.c<br>
-+++ b/slirp/src/tcp_subr.c<br>
-@@ -886,6 +886,8 @@ int tcp_emu(struct socket *so, struct mbuf *m)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 5:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (bptr =3D=3D =
m-&gt;m_data + m-&gt;m_len - 1)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 return 1; /* We need two bytes */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * The diff=
erence between versions 1.0 and<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 2.0 is h=
ere. For future versions of<br>
-@@ -901,6 +903,10 @@ int tcp_emu(struct socket *so, struct mbuf *m)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This is =
the field containing the port<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * number t=
hat RA-player is listening to.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (bptr =3D=3D =
m-&gt;m_data + m-&gt;m_len - 1)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 return 1; /* We need two bytes */<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lport =3D (=
((uint8_t *)bptr)[0] &lt;&lt; 8) + ((uint8_t *)bptr)[1];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (lport &=
lt; 6970)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0lport +=3D 256; /* don&#39;t know why */<br>
--- <br>
-2.7.4<br>
-<br>
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-7039-2.patch b/meta/=
recipes-devtools/qemu/qemu/CVE-2020-7039-2.patch<br>
deleted file mode 100644<br>
index 4a00fa2afd..0000000000<br>
--- a/meta/recipes-devtools/qemu/qemu/CVE-2020-7039-2.patch<br>
+++ /dev/null<br>
@@ -1,59 +0,0 @@<br>
-From 8f67e76e4148e37f3d8d2bcbdee7417fdedb7669 Mon Sep 17 00:00:00 2001<br=
>
-From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com" targ=
et=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
-Date: Thu, 27 Feb 2020 12:10:34 +0800<br>
-Subject: [PATCH] slirp: use correct size while emulating commands<br>
-<br>
-While emulating services in tcp_emu(), it uses &#39;mbuf&#39; size<br>
-&#39;m-&gt;m_size&#39; to write commands via snprintf(3). Use M_FREEROOM(=
m)<br>
-size to avoid possible OOB access.<br>
-Signed-off-by: default avatarPrasad J Pandit &lt;<a href=3D"mailto:pjp@fe=
doraproject.org" target=3D"_blank">pjp@fedoraproject.org</a>&gt;<br>
-Signed-off-by: Samuel Thibault&#39;s avatarSamuel Thibault<br>
-&lt;<a href=3D"mailto:samuel.thibault@ens-lyon.org" target=3D"_blank">sam=
uel.thibault@ens-lyon.org</a>&gt;<br>
-Message-Id: &lt;<a href=3D"mailto:20200109094228.79764-3-ppandit@redhat.c=
om" target=3D"_blank">20200109094228.79764-3-ppandit@redhat.com</a>&gt;<br>
-<br>
-CVE: CVE-2020-7039<br>
-Upstream-Status: Backport<br>
-[<a href=3D"https://gitlab.freedesktop.org/slirp/libslirp/commit/82ebe9c3=
70a0e2970fb5695aa19aa5214a6a1c80" rel=3D"noreferrer" target=3D"_blank">http=
s://gitlab.freedesktop.org/slirp/libslirp/commit/82ebe9c370a0e2970fb5695aa1=
9aa5214a6a1c80</a>]<br>
-<br>
-Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.=
com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
----<br>
- slirp/src/tcp_subr.c | 9 ++++-----<br>
- 1 file changed, 4 insertions(+), 5 deletions(-)<br>
-<br>
-diff --git a/slirp/src/tcp_subr.c b/slirp/src/tcp_subr.c<br>
-index 4bea2d4..e8ed4ef 100644<br>
---- a/slirp/src/tcp_subr.c<br>
-+++ b/slirp/src/tcp_subr.c<br>
-@@ -696,7 +696,7 @@ int tcp_emu(struct socket *so, struct mbuf *m)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n4 =3D (laddr &amp; 0xff)=
;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m-&gt;m_len =3D bptr - m-=
&gt;m_data; /* Adjust length */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m-&gt;m_len +=3D snprintf(bptr=
, m-&gt;m_size - m-&gt;m_len,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m-&gt;m_len +=3D snprintf(bptr=
, M_FREEROOM(m),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;ORT %d,%d,%d,%d,%d,%d\=
r\n%s&quot;, n1, n2, n3, n4,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n5, n6, x =3D=3D 7 ? buff : =
&quot;&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
-@@ -731,8 +731,7 @@ int tcp_emu(struct socket *so, struct mbuf *m)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n4 =3D (laddr &amp; 0xff)=
;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m-&gt;m_len =3D bptr - m-=
&gt;m_data; /* Adjust length */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m-&gt;m_len +=3D<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(bptr, m=
-&gt;m_size - m-&gt;m_len,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m-&gt;m_len +=3D snprintf(bptr=
, M_FREEROOM(m),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 &quot;27 Entering Passive Mode (%d,%d,%d,%d,%d,%d)\r\n%s=
&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 n1, n2, n3, n4, n5, n6, x =3D=3D 7 ? buff : &quot;&quot;=
);<br>
- <br>
-@@ -758,8 +757,8 @@ int tcp_emu(struct socket *so, struct mbuf *m)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (m-&gt;m_data[m-&gt;m_len - 1] =3D=
=3D &#39;\0&#39; &amp;&amp; lport !=3D 0 &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(so =3D tcp_listen(slirp,=
 INADDR_ANY, 0, so-&gt;so_laddr.s_addr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 htons(lport), SS_FACCEPTONCE)) !=3D NULL)<=
br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m-&gt;m_len =3D<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(m-&gt;m=
_data, m-&gt;m_size, &quot;%d&quot;, ntohs(so-&gt;so_fport)) + 1;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m-&gt;m_len =3D snprintf(m-&gt=
;m_data, M_ROOM(m),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%d&quot;, ntohs(so-&gt;so_=
fport)) + 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0case EMU_IRC:<br>
--- <br>
-2.7.4<br>
-<br>
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-7039-3.patch b/meta/=
recipes-devtools/qemu/qemu/CVE-2020-7039-3.patch<br>
deleted file mode 100644<br>
index 70ce480d80..0000000000<br>
--- a/meta/recipes-devtools/qemu/qemu/CVE-2020-7039-3.patch<br>
+++ /dev/null<br>
@@ -1,64 +0,0 @@<br>
-From 0b03959b72036afce151783720d9e54988cf76ef Mon Sep 17 00:00:00 2001<br=
>
-From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com" targ=
et=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
-Date: Thu, 27 Feb 2020 12:15:04 +0800<br>
-Subject: [PATCH] slirp: use correct size while emulating IRC commands<br>
-<br>
-While emulating IRC DCC commands, tcp_emu() uses &#39;mbuf&#39; size<br>
-&#39;m-&gt;m_size&#39; to write DCC commands via snprintf(3). This may<br=
>
-lead to OOB write access, because &#39;bptr&#39; points somewhere in<br>
-the middle of &#39;mbuf&#39; buffer, not at the start. Use M_FREEROOM(m)<=
br>
-size to avoid OOB access.<br>
-Reported-by: default avatarVishnu Dev TJ &lt;<a href=3D"mailto:vishnudevt=
j@gmail.com" target=3D"_blank">vishnudevtj@gmail.com</a>&gt;<br>
-Signed-off-by: default avatarPrasad J Pandit &lt;<a href=3D"mailto:pjp@fe=
doraproject.org" target=3D"_blank">pjp@fedoraproject.org</a>&gt;<br>
-Reviewed-by: Samuel Thibault&#39;s avatarSamuel Thibault<br>
-&lt;<a href=3D"mailto:samuel.thibault@ens-lyon.org" target=3D"_blank">sam=
uel.thibault@ens-lyon.org</a>&gt;<br>
-Message-Id: &lt;<a href=3D"mailto:20200109094228.79764-2-ppandit@redhat.c=
om" target=3D"_blank">20200109094228.79764-2-ppandit@redhat.com</a>&gt;<br>
-<br>
-CVE: CVE-2020-7039<br>
-Upstream-Status: Backport<br>
-[<a href=3D"https://gitlab.freedesktop.org/slirp/libslirp/commit/ce131029=
d6d4a405cb7d3ac6716d03e58fb4a5d9" rel=3D"noreferrer" target=3D"_blank">http=
s://gitlab.freedesktop.org/slirp/libslirp/commit/ce131029d6d4a405cb7d3ac671=
6d03e58fb4a5d9</a>]<br>
-<br>
-Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.=
com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
----<br>
- slirp/src/tcp_subr.c | 11 ++++++-----<br>
- 1 file changed, 6 insertions(+), 5 deletions(-)<br>
-<br>
-diff --git a/slirp/src/tcp_subr.c b/slirp/src/tcp_subr.c<br>
-index e8ed4ef..3a4a8ee 100644<br>
---- a/slirp/src/tcp_subr.c<br>
-+++ b/slirp/src/tcp_subr.c<br>
-@@ -777,7 +777,8 @@ int tcp_emu(struct socket *so, struct mbuf *m)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m-&gt;m_len =3D bptr - m-=
&gt;m_data; /* Adjust length */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m-&gt;m_len +=3D snprintf(bptr=
, m-&gt;m_size, &quot;DCC CHAT chat %lu %u%c\n&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m-&gt;m_len +=3D snprintf(bptr=
, M_FREEROOM(m),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;DCC CHAT chat %lu %u=
%c\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (unsigned long)ntohl(so-&gt;=
so_faddr.s_addr),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ntohs(so-&gt;so_fport), 1);<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (sscanf(bptr, &quot;DCC SEND =
%256s %u %u %u&quot;, buff, &amp;laddr, &amp;lport,<br>
-@@ -787,8 +788,8 @@ int tcp_emu(struct socket *so, struct mbuf *m)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m-&gt;m_len =3D bptr - m-=
&gt;m_data; /* Adjust length */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m-&gt;m_len +=3D<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(bptr, m=
-&gt;m_size, &quot;DCC SEND %s %lu %u %u%c\n&quot;, buff,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m-&gt;m_len +=3D snprintf(bptr=
, M_FREEROOM(m),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;DCC SEND %s %lu %u %u%c\n&quot;, buff,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 (unsigned long)ntohl(so-&gt;so_faddr.s_addr),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 ntohs(so-&gt;so_fport), n1, 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (sscanf(bptr, &quot;DCC MOVE =
%256s %u %u %u&quot;, buff, &amp;laddr, &amp;lport,<br>
-@@ -798,8 +799,8 @@ int tcp_emu(struct socket *so, struct mbuf *m)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m-&gt;m_len =3D bptr - m-=
&gt;m_data; /* Adjust length */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m-&gt;m_len +=3D<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(bptr, m=
-&gt;m_size, &quot;DCC MOVE %s %lu %u %u%c\n&quot;, buff,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m-&gt;m_len +=3D snprintf(bptr=
, M_FREEROOM(m),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;DCC MOVE %s %lu %u %u%c\n&quot;, buff,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 (unsigned long)ntohl(so-&gt;so_faddr.s_addr),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 ntohs(so-&gt;so_fport), n1, 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--- <br>
-2.7.4<br>
-<br>
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-7211.patch b/meta/re=
cipes-devtools/qemu/qemu/CVE-2020-7211.patch<br>
deleted file mode 100644<br>
index 11be4c92e7..0000000000<br>
--- a/meta/recipes-devtools/qemu/qemu/CVE-2020-7211.patch<br>
+++ /dev/null<br>
@@ -1,46 +0,0 @@<br>
-From 14ec36e107a8c9af7d0a80c3571fe39b291ff1d4 Mon Sep 17 00:00:00 2001<br=
>
-From: Prasad J Pandit &lt;<a href=3D"mailto:pjp@fedoraproject.org" target=
=
=3D"_blank">pjp@fedoraproject.org</a>&gt;<br>
-Date: Mon, 13 Jan 2020 17:44:31 +0530<br>
-Subject: [PATCH] slirp: tftp: restrict relative path access<br>
-<br>
-tftp restricts relative or directory path access on Linux systems.<br>
-Apply same restrictions on Windows systems too. It helps to avoid<br>
-directory traversal issue.<br>
-<br>
-Fixes: <a href=3D"https://bugs.launchpad.net/qemu/+bug/1812451" rel=3D"no=
referrer" target=3D"_blank">https://bugs.launchpad.net/qemu/+bug/1812451</a=
><br>
-Reported-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
-Signed-off-by: Prasad J Pandit &lt;<a href=3D"mailto:pjp@fedoraproject.or=
g" target=3D"_blank">pjp@fedoraproject.org</a>&gt;<br>
-Reviewed-by: Samuel Thibault &lt;<a href=3D"mailto:samuel.thibault@ens-ly=
on.org" target=3D"_blank">samuel.thibault@ens-lyon.org</a>&gt;<br>
-Message-Id: &lt;<a href=3D"mailto:20200113121431.156708-1-ppandit@redhat.=
com" target=3D"_blank">20200113121431.156708-1-ppandit@redhat.com</a>&gt;<b=
r>
-<br>
-Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/slir=
p/libslirp/-/commit/14ec36e107a8c9af7d0a80c3571fe39b291ff1d4.patch" rel=3D"=
noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/slirp/libslirp=
/-/commit/14ec36e107a8c9af7d0a80c3571fe39b291ff1d4.patch</a>]<br>
-CVE: CVE-2020-7211<br>
-Signed-off-by: Chee Yang Lee &lt;<a href=3D"mailto:chee.yang.lee@intel.co=
m" target=3D"_blank">chee.yang.lee@intel.com</a>&gt;<br>
-<br>
----<br>
- slirp/src/tftp.c | 9 +++++++--<br>
- 1 file changed, 7 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/slirp/src/tftp.c b/slirp/src/tftp.c<br>
-index 093c2e0..e52e71b 100644<br>
---- a/slirp/src/tftp.c<br>
-+++ b/slirp/src/tftp.c<br>
-@@ -344,8 +344,13 @@ static void tftp_handle_rrq(Slirp *slirp, struct soc=
kaddr_storage *srcsas,<br>
-=C2=A0 =C2=A0 =C2=A0k +=3D 6; /* skipping octet */<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0/* do sanity checks on the filename */<br>
--=C2=A0 =C2=A0 if (!strncmp(req_fname, &quot;../&quot;, 3) ||<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 req_fname[strlen(req_fname) - 1] =3D=3D &#39=
;/&#39; || strstr(req_fname, &quot;/../&quot;)) {<br>
-+=C2=A0 =C2=A0 if (<br>
-+#ifdef G_OS_WIN32<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 strstr(req_fname, &quot;..\\&quot;) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 req_fname[strlen(req_fname) - 1] =3D=3D &#39=
;\\&#39; ||<br>
-+#endif<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 strstr(req_fname, &quot;../&quot;) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 req_fname[strlen(req_fname) - 1] =3D=3D &#39=
;/&#39;) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tftp_send_error(spt, 2, &quot;Access vi=
olation&quot;, tp);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
--- <br>
-2.24.1<br>
-<br>
diff --git a/meta/recipes-devtools/qemu/qemu/find_datadir.patch b/meta/rec=
ipes-devtools/qemu/qemu/find_datadir.patch<br>
new file mode 100644<br>
index 0000000000..74e9ba56ce<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/qemu/qemu/find_datadir.patch<br>
@@ -0,0 +1,37 @@<br>
+qemu: search for datadir as in version 4.2<br>
+<br>
+os_find_datadir() was changed after the 4.2 release.=C2=A0 We need to che=
ck for<br>
+../share/qemu relative to the executable because that is where the runqem=
u<br>
+configuration assumes it will be.<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"mailto:qemu-devel@nongnu.org" targ=
et=3D"_blank">qemu-devel@nongnu.org</a>]<br>
+<br>
+Signed-off-by: Joe Slater &lt;<a href=3D"mailto:joe.slater@windriver.com"=
 target=3D"_blank">joe.slater@windriver.com</a>&gt;<br>
+<br>
+<br>
+--- a/os-posix.c<br>
++++ b/os-posix.c<br>
+@@ -82,8 +82,9 @@ void os_setup_signal_handling(void)<br>
+ <br>
+ /*<br>
+=C2=A0 * Find a likely location for support files using the location of t=
he binary.<br>
++ * Typically, this would be &quot;$bindir/../share/qemu&quot;.<br>
+=C2=A0 * When running from the build tree this will be &quot;$bindir/../p=
c-bios&quot;.<br>
+- * Otherwise, this is CONFIG_QEMU_DATADIR.<br>
++ * Otherwise, this is CONFIG_QEMU_DATADIR as constructed by configure.<b=
r>
+=C2=A0 */<br>
+ char *os_find_datadir(void)<br>
+ {<br>
+@@ -93,6 +94,12 @@ char *os_find_datadir(void)<br>
+=C2=A0 =C2=A0 =C2=A0exec_dir =3D qemu_get_exec_dir();<br>
+=C2=A0 =C2=A0 =C2=A0g_return_val_if_fail(exec_dir !=3D NULL, NULL);<br>
+ <br>
++=C2=A0 =C2=A0 dir =3D g_build_filename(exec_dir, &quot;..&quot;, &quot;s=
hare&quot;, &quot;qemu&quot;, NULL);<br>
++=C2=A0 =C2=A0 if (g_file_test(dir, G_FILE_TEST_IS_DIR)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return g_steal_pointer(&amp;dir);<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 g_free(dir);=C2=A0 /* no autofree this time */<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0dir =3D g_build_filename(exec_dir, &quot;..&quot;, &q=
uot;pc-bios&quot;, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0if (g_file_test(dir, G_FILE_TEST_IS_DIR)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return g_steal_pointer(&amp;dir);<br>
diff --git a/meta/recipes-devtools/qemu/<a href=3D"http://qemu_4.2.0.bb" r=
el=3D"noreferrer" target=3D"_blank">qemu_4.2.0.bb</a> b/meta/recipes-devtoo=
ls/qemu/<a href=3D"http://qemu_5.0.0.bb" rel=3D"noreferrer" target=3D"_blan=
k">qemu_5.0.0.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/qemu/<a href=3D"http://qemu_4.2.0.bb" re=
l=3D"noreferrer" target=3D"_blank">qemu_4.2.0.bb</a><br>
rename to meta/recipes-devtools/qemu/<a href=3D"http://qemu_5.0.0.bb" rel=
=3D"noreferrer" target=3D"_blank">qemu_5.0.0.bb</a><br>
-- <br>
2.27.0<br>
<br>
<br>
</blockquote></div></div>
</div>

--000000000000e6a23f05a871fc88--
