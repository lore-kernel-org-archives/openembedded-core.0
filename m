Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 25BCC6C894
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 05:34:45 +0000 (UTC)
Received: by mail-ie0-f177.google.com with SMTP id qd12so9287874ieb.36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 22:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=fI1tc0es4znULaGXrSLBTkABakQSMC/IiZZalz+cAZc=;
	b=CfGIfSMt38v/IXKioaKuInrPcmBXQb91EcspQaWQQ8QQIeNG41y40N7V3ZCK/fsXCx
	9pWJIilL+dMX9yp0K3z7eRSFUStRxBP7tsayXEizFvu8gfCYluIUfsPacDhh3txaqvqT
	YH78tkhIyIVJGNi8q/2Gm9wjNiFFfVHP2lyJl79nKfhGyaIxEiwixgDydRpO4TfDRs+u
	wNqBCgkVRU7acG5j3WWSLEVG4JpLu3IV4vGdLxl8wyYGF+BQ5BApq1McJAxHVv2wZmX+
	6CVWX0yGyHZhDuzL4b2dj41GPvqiX9PAPmr5j5IDOm1F0oKbNTuxXypZe1Qjkqs8jtor
	h3cA==
X-Received: by 10.50.22.67 with SMTP id b3mr389924igf.39.1379396087057; Mon,
	16 Sep 2013 22:34:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.216.195 with HTTP; Mon, 16 Sep 2013 22:34:16 -0700 (PDT)
In-Reply-To: <1379381170-10557-1-git-send-email-cjp256@gmail.com>
References: <1379381170-10557-1-git-send-email-cjp256@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Sep 2013 22:34:16 -0700
Message-ID: <CAMKF1srOTaNFj_vKkG1SkE9-YxVFkeVoukxW9qEkNo_s8qw--w@mail.gmail.com>
To: Chris Patterson <cjp256@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: upgrade to 1.6.0
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
X-List-Received-Date: Tue, 17 Sep 2013 05:34:45 -0000
Content-Type: text/plain; charset=UTF-8

Hi Chris

On Mon, Sep 16, 2013 at 6:26 PM, Chris Patterson <cjp256@gmail.com> wrote:
> This update also drops the following patches which appear to have been resolved upstream:
> - ftd_header.patch
> - target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch
>

Thanks for the patch. I think its a tad late for 1.5 release since we
use Qemu heavily
but I would suggest to keep it current and submit it after the window
for 1.6 is open after branch for 1.5 is cut out.

> Signed-off-by: Chris Patterson <cjp256@gmail.com>
> ---
>  meta/recipes-devtools/qemu/files/fdt_header.patch  | 39 -----------
>  ...-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch | 79 ----------------------
>  meta/recipes-devtools/qemu/qemu.inc                |  2 +-
>  .../qemu/{qemu_1.5.0.bb => qemu_1.6.0.bb}          | 14 ++--
>  4 files changed, 9 insertions(+), 125 deletions(-)
>  delete mode 100644 meta/recipes-devtools/qemu/files/fdt_header.patch
>  delete mode 100644 meta/recipes-devtools/qemu/files/target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch
>  rename meta/recipes-devtools/qemu/{qemu_1.5.0.bb => qemu_1.6.0.bb} (44%)
>
> diff --git a/meta/recipes-devtools/qemu/files/fdt_header.patch b/meta/recipes-devtools/qemu/files/fdt_header.patch
> deleted file mode 100644
> index dccfe53..0000000
> --- a/meta/recipes-devtools/qemu/files/fdt_header.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -Upstream-Status: Pending
> -
> -qemu: define fdt types in libfdt_env.h from qemu
> -
> -    * fixes
> -    In file included from /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/libfdt.h:55:0,
> -                     from /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/work/x86_64-linux/qemu-native/1.4.0-r0/qemu-1.4.0/hw/arm/../../device_tree.c:28:
> -    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:58:2: error: unknown type name 'fdt32_t'
> -    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:59:2: error: unknown type name 'fdt32_t'
> -    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:60:2: error: unknown type name 'fdt32_t'
> -    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:61:2: error: unknown type name 'fdt32_t'
> -    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:62:2: error: unknown type name 'fdt32_t'
> -    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:63:2: error: unknown type name 'fdt32_t'
> -    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:64:2: error: unknown type name 'fdt32_t'
> -    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:67:2: error: unknown type name 'fdt32_t'
> -    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:70:2: error: unknown type name 'fdt32_t'
> -    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:73:2: error: unknown type name 'fdt32_t'
> -    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:77:2: error: unknown type name 'fdt64_t'
> -    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:78:2: error: unknown type name 'fdt64_t'
> -    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:82:2: error: unknown type name 'fdt32_t'
> -    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:87:2: error: unknown type name 'fdt32_t'
> -    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:88:2: error: unknown type name 'fdt32_t'
> -    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:89:2: error: unknown type name 'fdt32_t'
> -
> -Index: qemu-1.4.0/include/libfdt_env.h
> -===================================================================
> ---- qemu-1.4.0.orig/include/libfdt_env.h       2013-02-15 23:05:35.000000000 +0000
> -+++ qemu-1.4.0/include/libfdt_env.h    2013-04-13 14:17:27.918885225 +0000
> -@@ -21,6 +21,10 @@
> -
> - #include "qemu/bswap.h"
> -
> -+typedef uint16_t fdt16_t;
> -+typedef uint32_t fdt32_t;
> -+typedef uint64_t fdt64_t;
> -+
> - #ifdef HOST_WORDS_BIGENDIAN
> - #define fdt32_to_cpu(x)  (x)
> - #define cpu_to_fdt32(x)  (x)
> diff --git a/meta/recipes-devtools/qemu/files/target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch b/meta/recipes-devtools/qemu/files/target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch
> deleted file mode 100644
> index 852efd1..0000000
> --- a/meta/recipes-devtools/qemu/files/target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch
> +++ /dev/null
> @@ -1,79 +0,0 @@
> -Upstream-Status: Backported
> -
> -From dec3fc9657e0682637de4d5a29d947284d01985c Mon Sep 17 00:00:00 2001
> -From: Richard Henderson <rth@twiddle.net>
> -Date: Wed, 29 May 2013 12:30:51 -0700
> -Subject: [PATCH] target-i386: Fix aflag logic for CODE64 and the 0x67 prefix
> -
> -The code reorganization in commit 4a6fd938 broke handling of PREFIX_ADR.
> -While fixing this, tidy and comment the code so that it's more obvious
> -what's going on in setting both aflag and dflag.
> -
> -The TARGET_X86_64 ifdef can be eliminated because CODE64 expands to the
> -constant zero when TARGET_X86_64 is undefined.
> -
> -Cc: Paolo Bonzini <pbonzini@redhat.com>
> -Reported-by: Laszlo Ersek <lersek@redhat.com>
> -Signed-off-by: Richard Henderson <rth@twiddle.net>
> -Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> -Message-id: 1369855851-21400-1-git-send-email-rth@twiddle.net
> -Signed-off-by: Anthony Liguori <aliguori@us.ibm.com>
> ----
> - target-i386/translate.c |   30 +++++++++++++++---------------
> - 1 file changed, 15 insertions(+), 15 deletions(-)
> -
> -diff --git a/target-i386/translate.c b/target-i386/translate.c
> -index 0aeccdb..14b0298 100644
> ---- a/target-i386/translate.c
> -+++ b/target-i386/translate.c
> -@@ -4677,8 +4677,6 @@ static target_ulong disas_insn(CPUX86State *env, DisasContext *s,
> -     }
> -     s->pc = pc_start;
> -     prefixes = 0;
> --    aflag = s->code32;
> --    dflag = s->code32;
> -     s->override = -1;
> -     rex_w = -1;
> -     rex_r = 0;
> -@@ -4801,23 +4799,25 @@ static target_ulong disas_insn(CPUX86State *env, DisasContext *s,
> -     }
> -
> -     /* Post-process prefixes.  */
> --    if (prefixes & PREFIX_DATA) {
> --        dflag ^= 1;
> --    }
> --    if (prefixes & PREFIX_ADR) {
> --        aflag ^= 1;
> --    }
> --#ifdef TARGET_X86_64
> -     if (CODE64(s)) {
> --        if (rex_w == 1) {
> --            /* 0x66 is ignored if rex.w is set */
> --            dflag = 2;
> -+        /* In 64-bit mode, the default data size is 32-bit.  Select 64-bit
> -+           data with rex_w, and 16-bit data with 0x66; rex_w takes precedence
> -+           over 0x66 if both are present.  */
> -+        dflag = (rex_w > 0 ? 2 : prefixes & PREFIX_DATA ? 0 : 1);
> -+        /* In 64-bit mode, 0x67 selects 32-bit addressing.  */
> -+        aflag = (prefixes & PREFIX_ADR ? 1 : 2);
> -+    } else {
> -+        /* In 16/32-bit mode, 0x66 selects the opposite data size.  */
> -+        dflag = s->code32;
> -+        if (prefixes & PREFIX_DATA) {
> -+            dflag ^= 1;
> -         }
> --        if (!(prefixes & PREFIX_ADR)) {
> --            aflag = 2;
> -+        /* In 16/32-bit mode, 0x67 selects the opposite addressing.  */
> -+        aflag = s->code32;
> -+        if (prefixes & PREFIX_ADR) {
> -+            aflag ^= 1;
> -         }
> -     }
> --#endif
> -
> -     s->prefix = prefixes;
> -     s->aflag = aflag;
> ---
> -1.7.9.5
> -
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 97e9b7b..296b405 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -54,7 +54,7 @@ do_configure() {
>         KVMOPTS="--enable-kvm"
>      fi
>
> -    ${S}/configure --prefix=${prefix} --sysconfdir=${sysconfdir} --libexecdir=${libexecdir} --disable-strip ${EXTRA_OECONF} $KVMOPTS
> +    ${S}/configure --prefix=${prefix} --sysconfdir=${sysconfdir} --libexecdir=${libexecdir} --localstatedir=${localstatedir} --disable-strip ${EXTRA_OECONF} $KVMOPTS
>      test ! -e ${S}/target-i386/beginend_funcs.sh || chmod a+x ${S}/target-i386/beginend_funcs.sh
>  }
>
> diff --git a/meta/recipes-devtools/qemu/qemu_1.5.0.bb b/meta/recipes-devtools/qemu/qemu_1.6.0.bb
> similarity index 44%
> rename from meta/recipes-devtools/qemu/qemu_1.5.0.bb
> rename to meta/recipes-devtools/qemu/qemu_1.6.0.bb
> index d6dd743..f8dbe6d 100644
> --- a/meta/recipes-devtools/qemu/qemu_1.5.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu_1.6.0.bb
> @@ -3,13 +3,15 @@ require qemu.inc
>  LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
>                      file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
>
> -SRC_URI += "file://fdt_header.patch \
> -            file://target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch \
> -            file://target-ppc_fix_bit_extraction.patch \
> -           "
> +SRC_URI += "file://target-ppc_fix_bit_extraction.patch"
>
>  SRC_URI_prepend = "http://wiki.qemu.org/download/qemu-${PV}.tar.bz2"
> -SRC_URI[md5sum] = "b6f3265b8ed39d77e8f354f35cc26e16"
> -SRC_URI[sha256sum] = "b22b30ee9712568dfb4eedf76783f4a76546e1cbc41659b909646bcf0b4867bb"
> +SRC_URI[md5sum] = "f3f39308472d629aca57a255a0c91ba9"
> +SRC_URI[sha256sum] = "3132e58ada26d43b6924e8c2f07db80aa1e5022f3dcf03dee7d8bb9194b2cb48"
>
>  COMPATIBLE_HOST_class-target_mips64 = "null"
> +
> +do_install_append() {
> +    # Prevent QA warnings about installed ${localstatedir}/run
> +    if [ -d ${D}${localstatedir}/run ]; then rmdir ${D}${localstatedir}/run; fi
> +}
> --
> 1.8.4.rc3
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

