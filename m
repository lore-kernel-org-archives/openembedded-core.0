Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 68FD3607BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 08:12:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6D8Cfw9015074
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Jul 2015 01:12:41 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 13 Jul 2015 01:12:40 -0700
Message-ID: <55A372F6.9030107@windriver.com>
Date: Mon, 13 Jul 2015 16:12:38 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1436464186.git.raj.khem@gmail.com>
	<ba4775eeebab2aec8f81970e61903a35a46eb4ce.1436464186.git.raj.khem@gmail.com>
In-Reply-To: <ba4775eeebab2aec8f81970e61903a35a46eb4ce.1436464186.git.raj.khem@gmail.com>
Subject: Re: [PATCH 1/3] gcc-4.9: Upgrade to 4.9.3
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
X-List-Received-Date: Mon, 13 Jul 2015 08:12:43 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit


Hi Khem,

This upgrade breaks linux-yocto 3.14 build on qemumips or qemumips64:

In local.conf:
MACHINE = "qemumips"
PREFERRED_VERSION_linux-yocto_qemumips = "3.14%"

$ bitbake linux-yocto -ccompile

Then errors:
tmp/work-shared/qemumips/kernel-source/arch/mips/kernel/r4k_fpu.S: Assembler 
messages:
tmp/work-shared/qemumips/kernel-source/arch/mips/kernel/r4k_fpu.S:68: Error: 
opcode not supported on this processor: mips3 (mips3) `sdc1 $f0,272+0($4)'
tmp/work-shared/qemumips/kernel-source/arch/mips/kernel/r4k_fpu.S:69: Error: 
opcode not supported on this processor: mips3 (mips3) `sdc1 $f2,272+16($4)'
tmp/work-shared/qemumips/kernel-source/arch/mips/kernel/r4k_fpu.S:70: Error: 
opcode not supported on this processor: mips3 (mips3) `sdc1 $f4,272+32($4)'
tmp/work-shared/qemumips/kernel-source/arch/mips/kernel/r4k_fpu.S:71: Error: 
opcode not supported on this processor: mips3 (mips3) `sdc1 $f6,272+48($4)'
tmp/work-shared/qemumips/kernel-source/arch/mips/kernel/r4k_fpu.S:72: Error: 
opcode not supported on this processor: mips3 (mips3) `sdc1 $f8,272+64($4)'
tmp/work-shared/qemumips/kernel-source/arch/mips/kernel/r4k_fpu.S:73: Error: 
opcode not supported on this processor: mips3 (mips3) `sdc1 $f10,272+80($4)'
tmp/work-shared/qemumips/kernel-source/arch/mips/kernel/r4k_fpu.S:74: Error: 
opcode not supported on this processor: mips3 (mips3) `sdc1 $f12,272+96($4)'
tmp/work-shared/qemumips/kernel-source/arch/mips/kernel/r4k_fpu.S:75: Error: 
opcode not supported on this processor: mips3 (mips3) `sdc1 $f14,272+112($4)'
tmp/work-shared/qemumips/kernel-source/arch/mips/kernel/r4k_fpu.S:76: Error: 
opcode not supported on this processor: mips3 (mips3) `sdc1 $f16,272+128($4)'
tmp/work-shared/qemumips/kernel-source/arch/mips/kernel/r4k_fpu.S:77: Error: 
opcode not supported on this processor: mips3 (mips3) `sdc1 $f18,272+144($4)'
tmp/work-shared/qemumips/kernel-source/arch/mips/kernel/r4k_fpu.S:78: Error: 
opcode not supported on this processor: mips3 (mips3) `sdc1 $f20,272+160($4)'
tmp/work-shared/qemumips/kernel-source/arch/mips/kernel/r4k_fpu.S:79: Error: 
opcode not supported on this processor: mips3 (mips3) `sdc1 $f22,272+176($4)'
tmp/work-shared/qemumips/kernel-source/arch/mips/kernel/r4k_fpu.S:80: Error: 
opcode not supported on this processor: mips3 (mips3) `sdc1 $f24,272+192($4)'

// Robert

On 07/10/2015 01:52 AM, Khem Raj wrote:
> Drop upsteamed patch for
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=66483 which is already in
> 4.9.3
>
> rename 0063-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
> to 0062-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch to
> keep the sequence
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/recipes-devtools/gcc/gcc-4.9.inc              | 11 +++---
>   ...BS_DIR-replacement-instead-of-hardcoding.patch} |  0
>   ...racking.c-backport-from-gcc-trunk-r212178.patch | 39 ----------------------
>   3 files changed, 5 insertions(+), 45 deletions(-)
>   rename meta/recipes-devtools/gcc/gcc-4.9/{0063-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch => 0062-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch} (100%)
>   delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0062-gcc-var-tracking.c-backport-from-gcc-trunk-r212178.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
> index 9ed3e09..d61eca7 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.9.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
> @@ -2,11 +2,11 @@ require gcc-common.inc
>
>   # Third digit in PV should be incremented after a minor release
>
> -PV = "4.9.2"
> +PV = "4.9.3"
>
>   # BINV should be incremented to a revision after a minor gcc release
>
> -BINV = "4.9.2"
> +BINV = "4.9.3"
>
>   FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-4.9:"
>
> @@ -77,11 +77,10 @@ SRC_URI = "\
>       file://0059-gcc-PR-rtl-optimization-63348.patch \
>       file://0060-Only-allow-e500-double-in-SPE_SIMD_REGNO_P-registers.patch \
>       file://0061-target-gcc-includedir.patch \
> -    file://0062-gcc-var-tracking.c-backport-from-gcc-trunk-r212178.patch \
> -    file://0063-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch \
> +    file://0062-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch \
>   "
> -SRC_URI[md5sum] = "4df8ee253b7f3863ad0b86359cd39c43"
> -SRC_URI[sha256sum] = "2020c98295856aa13fda0f2f3a4794490757fc24bcca918d52cc8b4917b972dd"
> +SRC_URI[md5sum] = "6f831b4d251872736e8e9cc09746f327"
> +SRC_URI[sha256sum] = "2332b2a5a321b57508b9031354a8503af6fdfb868b8c1748d33028d100a8b67e"
>
>   S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
>   B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0063-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch b/meta/recipes-devtools/gcc/gcc-4.9/0062-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-4.9/0063-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
> rename to meta/recipes-devtools/gcc/gcc-4.9/0062-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0062-gcc-var-tracking.c-backport-from-gcc-trunk-r212178.patch b/meta/recipes-devtools/gcc/gcc-4.9/0062-gcc-var-tracking.c-backport-from-gcc-trunk-r212178.patch
> deleted file mode 100644
> index c0ea62f..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0062-gcc-var-tracking.c-backport-from-gcc-trunk-r212178.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From b30ffb8097749fdb55704aa7d8307ca1a58255d6 Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
> -Date: Tue, 7 Apr 2015 16:15:11 +0200
> -Subject: [PATCH] gcc/var-tracking.c: backport from gcc trunk r212178
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -resolves a bug seen on cortexa8 building qt5 libraries.
> -
> -2014-06-30  Joseph Myers  <joseph@codesourcery.com>
> -
> -    * var-tracking.c (add_stores): Return instead of asserting if old
> -    and new values for conditional store are the same.
> -
> -git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@212178 138bc75d-0d04-0410-961f-82ee72b054a4
> -
> -Signed-off-by: Stefan Müller-Klieser <s.mueller-klieser@phytec.de>
> ----
> - gcc/var-tracking.c | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/gcc/var-tracking.c b/gcc/var-tracking.c
> -index 65d8285..7c38910 100644
> ---- a/gcc/var-tracking.c
> -+++ b/gcc/var-tracking.c
> -@@ -5997,7 +5997,8 @@ add_stores (rtx loc, const_rtx expr, void *cuip)
> -     {
> -       cselib_val *oval = cselib_lookup (oloc, GET_MODE (oloc), 0, VOIDmode);
> -
> --      gcc_assert (oval != v);
> -+      if (oval == v)
> -+        return;
> -       gcc_assert (REG_P (oloc) || MEM_P (oloc));
> -
> -       if (oval && !cselib_preserved_value_p (oval))
> ---
> -1.9.1
> -
>

