Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id 778F360D93
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 17:36:03 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id j5so5110396qtq.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2020 09:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=DICWUeW9ijxgVEe/p1jR4sAXdymjn2dcjE2RfW3d55k=;
	b=vggkl3sI5JDBXqHU6B0mVmPJ4wNvBHZQFHKSX4VgnrjE3j2ZeCGkznyOBFWwElfQjj
	xI30387moR6eJjOoCgKemHc6Gk57Vhmrztj4H/ZMKtdQdhyvfLbXcK/ctDkhK4aTS1HG
	CmKpQYBri/9p7tgRByOfASBplEL3C4KCX0VE7ygDo/bdSXbvaNOELIgal7nEr3e/f5uP
	5NaHad84iSkKBh33lVHVvQHzE7ZNhrBqzJfq41y4vZLlmOvHnuuOF5FfwHG2yt5poczf
	Qd9GfwHv2JsZcrxlVjYnmRdaEkgltkmO3phHTcgScKUBsppWa5WL98yztAme15nRJ/kV
	3SBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DICWUeW9ijxgVEe/p1jR4sAXdymjn2dcjE2RfW3d55k=;
	b=m4FB/0jkM7szpQWdkxqdbU0TV829vYAgj4frlNfYIBVpuCQBFHFXl3KKBSmGiH5z+H
	fvSbUDwvrOtvp7z/Q8R3YGbJQp41ExwocIc5wvOGyh9fBkuuUruqOvjlf637MdFvdm0A
	/GxnNFgefqHLv5a4z3s/neHDh9ZcspxCP0cd/76EjirZ1ZopiiLjuPrmeWK80fYHfbU4
	qH+PBnd+7upUCQxV9aiJrtQM0qOlRjTb8tPOoaXbSRZmH0aDESvlAFzRf8N1uxJA5KIA
	cHo3+ONpYsfFDqiBaVbPAKMhr7zyg3L1jo/1L3hItQ4L4WiCxOvjHeWTc8T2Zn0un7Mm
	u8GQ==
X-Gm-Message-State: APjAAAVyNsYDPmEllIgNeHiLxnl4z2p4TDhB3V8vSsCzTSub/7m4lAzj
	iMGTagNk3wO0DH3i3PjeZxM=
X-Google-Smtp-Source: APXvYqzs9A5ypQ8gEZjorned8NBEm63ROW23vS+7kXe8rrQHqjq2BuocIkDLfTMoUJdl+h+QQQ4ZRw==
X-Received: by 2002:ac8:1194:: with SMTP id d20mr3589601qtj.243.1581010564037; 
	Thu, 06 Feb 2020 09:36:04 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	e26sm1715138qkm.80.2020.02.06.09.36.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 06 Feb 2020 09:36:03 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Thu,  6 Feb 2020 12:35:50 -0500
Message-Id: <14beb4fa55a56a8c5cc95f314073623f6c1b0039.1581010425.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1581010425.git.bruce.ashfield@gmail.com>
References: <cover.1581010425.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/10] kernel-yocto.bbclass: set KERNEL_LD also for merge_config.sh
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
X-List-Received-Date: Thu, 06 Feb 2020 17:36:03 -0000
Content-Transfer-Encoding: quoted-printable

From: Martin Jansa <martin.jansa@gmail.com>

* when ld-is-gold is used, merge_config.sh silently fails and doesn't gener=
ate anything
  useful in .config (and also include directory isn't created):

  tmp-glibc-bfd-qemux86-do_kernel_configme/work/qemux86-oe-linux/linux-yoct=
o/5.4.15-r0/linux-qemux86-standard-build:
  total 164K
  drwxr-xr-x 4 martin martin 4.0K Feb  5 02:27 .
  drwxrwxr-x 7 martin martin 4.0K Feb  5 02:27 ..
  -rw-rw-r-- 1 martin martin 133K Feb  5 02:28 .config
  -rw-rw-r-- 1 martin martin   39 Feb  5 02:27 .gitignore
  drwxr-xr-x 4 martin martin 4.0K Feb  5 02:27 include
  -rw-rw-r-- 1 martin martin  201 Feb  5 02:27 Makefile
  drwxrwxr-x 4 martin martin 4.0K Feb  5 02:27 scripts
  lrwxrwxrwx 1 martin martin   61 Feb  5 02:27 source -> /OE/build/oe-core/=
tmp-glibc/work-shared/qemux86/kernel-source

  tmp-glibc-gold-qemux86-do_kernel_configme/work/qemux86-oe-linux/linux-yoc=
to/5.4.15-r0/linux-qemux86-standard-build:
  total 28K
  drwxr-xr-x 3 martin martin 4.0K Feb  5 02:26 .
  drwxrwxr-x 7 martin martin 4.0K Feb  5 02:26 ..
  -rw-rw-r-- 1 martin martin   74 Feb  5 02:26 .config
  -rw-rw-r-- 1 martin martin   39 Feb  5 02:26 .gitignore
  -rw-rw-r-- 1 martin martin  201 Feb  5 02:26 Makefile
  drwxrwxr-x 4 martin martin 4.0K Feb  5 02:26 scripts
  lrwxrwxrwx 1 martin martin   61 Feb  5 02:26 source -> /OE/build/oe-core/=
tmp-glibc/work-shared/qemux86/kernel-source

  $ cat tmp-glibc-gold-qemux86-do_kernel_configme/work/qemux86-oe-linux/lin=
ux-yocto/5.4.15-r0/linux-qemux86-standard-build/.config
  CONFIG_LOCALVERSION=3D"-yocto-standard"

* and because the failure is silent, it will happily start building
  kernel with default defconfig, which even builds OK for qemux86-64
  but on qemux86 I've noticed this issue, because incorrectly
  configured kernel build fails with:

  $ tail -n 20 tmp-glibc-gold-qemux86/work/qemux86-oe-linux/linux-yocto/5.4=
.15-r0/temp/log.do_compile
    LD       /OE/build/oe-core/tmp-glibc/work/qemux86-oe-linux/linux-yocto/=
5.4.15-r0/linux-qemux86-standard-build/tools/objtool/libsubcmd-in.o
    AR       /OE/build/oe-core/tmp-glibc/work/qemux86-oe-linux/linux-yocto/=
5.4.15-r0/linux-qemux86-standard-build/tools/objtool/libsubcmd.a
    HOSTCC  scripts/mod/mk_elfconfig
    CC      scripts/mod/devicetable-offsets.s
    CC      scripts/mod/empty.o
  cc1: error: code model 'kernel' not supported in the 32 bit mode
  cc1: sorry, unimplemented: 64-bit mode not compiled in
  make[2]: *** [/OE/build/oe-core/tmp-glibc/work-shared/qemux86/kernel-sour=
ce/scripts/Makefile.build:99: scripts/mod/devicetable-offsets.s] Error 1
  make[2]: *** Waiting for unfinished jobs....
  cc1: error: code model 'kernel' not supported in the 32 bit mode
  cc1: sorry, unimplemented: 64-bit mode not compiled in
  make[2]: *** [/OE/build/oe-core/tmp-glibc/work-shared/qemux86/kernel-sour=
ce/scripts/Makefile.build:266: scripts/mod/empty.o] Error 1
  make[1]: *** [/OE/build/oe-core/tmp-glibc/work-shared/qemux86/kernel-sour=
ce/Makefile:1111: prepare0] Error 2
  make[1]: *** Waiting for unfinished jobs....
    LD       /OE/build/oe-core/tmp-glibc/work/qemux86-oe-linux/linux-yocto/=
5.4.15-r0/linux-qemux86-standard-build/tools/objtool/objtool-in.o
  /OE/build/oe-core/tmp-glibc/work-shared/qemux86/kernel-source/tools/objto=
ol
    LINK     /OE/build/oe-core/tmp-glibc/work/qemux86-oe-linux/linux-yocto/=
5.4.15-r0/linux-qemux86-standard-build/tools/objtool/objtool
  make: *** [/OE/build/oe-core/tmp-glibc/work-shared/qemux86/kernel-source/=
Makefile:179: sub-make] Error 2
  WARNING: exit code 1 from a shell command.

* the issue happens in log.do_kernel_configme, but the log is completely us=
eless:

  cat tmp-glibc-gold-qemux86-do_kernel_configme/work/qemux86-oe-linux/linux=
-yocto/5.4.15-r0/temp/log.do_kernel_configme
  DEBUG: Executing python function extend_recipe_sysroot
  NOTE: Direct dependencies are ['virtual:native:/OE/build/oe-core/openembe=
dded-core/meta/recipes-devtools/bison/bison_3.5.bb:do_populate_sysroot', '/=
OE/build/oe-core/openembedded-core/meta/recipes-kernel/kern-tools/kern-tool=
s-native_git.bb:do_populate_sysroot', 'virtual:native:/OE/build/oe-core/ope=
nembedded-core/meta/recipes-extended/bc/bc_1.07.1.bb:do_populate_sysroot', =
'/OE/build/oe-core/openembedded-core/meta/recipes-devtools/binutils/binutil=
s-cross_2.33.bb:do_populate_sysroot', '/OE/build/oe-core/openembedded-core/=
meta/recipes-devtools/quilt/quilt-native_0.66.bb:do_populate_sysroot', '/OE=
/build/oe-core/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_9.2.bb=
:do_populate_sysroot']
  NOTE: Installed into sysroot: ['bison-native', 'bc-native', 'binutils-cro=
ss-i686', 'gcc-cross-i686', 'autoconf-native', 'xz-native', 'flex-native', =
'gnu-config-native', 'automake-native', 'libtool-native', 'texinfo-dummy-na=
tive', 'gettext-minimal-native', 'readline-native', 'zlib-native', 'gmp-nat=
ive', 'libmpc-native', 'mpfr-native', 'linux-libc-headers', 'm4-native', 'n=
curses-native', 'pkgconfig-native']
  NOTE: Skipping as already exists in sysroot: ['kern-tools-native', 'quilt=
-native']
  DEBUG: sed -e 's:^[^/]*/:/OE/build/oe-core/tmp-glibc/work/qemux86-oe-linu=
x/linux-yocto/5.4.15-r0/recipe-sysroot-native/:g' /OE/build/oe-core/tmp-gli=
bc/sysroots-components/x86_64/bison-native/fixmepath /OE/build/oe-core/tmp-=
glibc/sysroots-components/x86_64/gcc-cross-i686/fixmepath /OE/build/oe-core=
/tmp-glibc/sysroots-components/x86_64/autoconf-native/fixmepath /OE/build/o=
e-core/tmp-glibc/sysroots-components/x86_64/gnu-config-native/fixmepath /OE=
/build/oe-core/tmp-glibc/sysroots-components/x86_64/automake-native/fixmepa=
th /OE/build/oe-core/tmp-glibc/sysroots-components/x86_64/libtool-native/fi=
xmepath /OE/build/oe-core/tmp-glibc/sysroots-components/x86_64/gmp-native/f=
ixmepath /OE/build/oe-core/tmp-glibc/sysroots-components/x86_64/ncurses-nat=
ive/fixmepath /OE/build/oe-core/tmp-glibc/sysroots-components/x86_64/pkgcon=
fig-native/fixmepath | xargs sed -i -e 's:FIXMESTAGINGDIRTARGET:/OE/build/o=
e-core/tmp-glibc/work/qemux86-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot=
:g; s:FIXMESTAGINGDIRHOST:/OE/build/oe-core/tmp-glibc/work/qemux86-oe-linux=
/linux-yocto/5.4.15-r0/recipe-sysroot-native:g' -e 's:FIXME_PSEUDO_SYSROOT:=
/OE/build/oe-core/tmp-glibc/sysroots-components/x86_64/pseudo-native:g' -e =
's:FIXME_HOSTTOOLS_DIR:/OE/build/oe-core/tmp-glibc/hosttools:g' -e 's:FIXME=
_PKGDATA_DIR:/OE/build/oe-core/tmp-glibc/pkgdata/qemux86:g' -e 's:FIXME_PSE=
UDO_LOCALSTATEDIR:/OE/build/oe-core/tmp-glibc/work/qemux86-oe-linux/linux-y=
octo/5.4.15-r0/pseudo/:g' -e 's:FIXME_LOGFIFO:/OE/build/oe-core/tmp-glibc/w=
ork/qemux86-oe-linux/linux-yocto/5.4.15-r0/temp/fifo.10476:g'
  DEBUG: Python function extend_recipe_sysroot finished
  DEBUG: Executing shell function do_kernel_configme
  DEBUG: Shell function do_kernel_configme finished

  ]because merge_config.sh is redirected to work-shared/qemux86/kernel-sour=
ce/.kernel-meta/cfg/merge_config_build.log
  and bbfatal_log called in do_kernel_configme only when merge_config.sh fa=
ils which it should in this case
  but doesn't.

  The merge_config_build.log shows 5.4 specific error:
    scripts/Kconfig.include:39:  gold linker 'i686-oe-linux-ld' not support=
ed
  but then it happily continues reporting what isn't applied in not created
  .config file

  --- tmp-glibc-bfd-qemux86-do_kernel_configme/work-shared/qemux86/kernel-s=
ource/.kernel-meta/cfg/merge_config_build.log  2020-02-05 02:28:01.45552020=
7 +0100
  +++ tmp-glibc-gold-qemux86-do_kernel_configme/work-shared/qemux86/kernel-=
source/.kernel-meta/cfg/merge_config_build.log 2020-02-05 02:26:30.65647090=
9 +0100
  @@ -171,586 +171,5113 @@
     HOSTCC  scripts/kconfig/symbol.o
     HOSTLD  scripts/kconfig/conf
   scripts/kconfig/conf  --alldefconfig Kconfig
  -./.tmp.config.jDjIEYi9Yq:2208:warning: unexpected data:  #
  -./.tmp.config.jDjIEYi9Yq:2209:warning: unexpected data:  # Generic Drive=
r Options
  -./.tmp.config.jDjIEYi9Yq:2210:warning: unexpected data:  #
  -./.tmp.config.jDjIEYi9Yq:3102:warning: symbol value 'm' invalid for SAMP=
LE_SECCOMP
  -./.tmp.config.jDjIEYi9Yq:3119:warning: symbol value 'm' invalid for NF_C=
T_PROTO_GRE
  -./.tmp.config.jDjIEYi9Yq:3120:warning: symbol value 'm' invalid for NF_C=
T_PROTO_SCTP
  -./.tmp.config.jDjIEYi9Yq:3121:warning: symbol value 'm' invalid for NF_C=
T_PROTO_UDPLITE
  -#
  -# configuration written to .config
  -#
  +scripts/Kconfig.include:39:  gold linker 'i686-oe-linux-ld' not supported
  +make[2]: *** [/OE/build/oe-core/tmp-glibc/work-shared/qemux86/kernel-sou=
rce/scripts/kconfig/Makefile:73: alldefconfig] Error 1
  +make[1]: *** [/OE/build/oe-core/tmp-glibc/work-shared/qemux86/kernel-sou=
rce/Makefile:567: alldefconfig] Error 2
   make[1]: Leaving directory '/OE/build/oe-core/tmp-glibc/work/qemux86-oe-=
linux/linux-yocto/5.4.15-r0/linux-qemux86-standard-build'
  +make: *** [Makefile:179: sub-make] Error 2
  +grep: /OE/build/oe-core/tmp-glibc/work/qemux86-oe-linux/linux-yocto/5.4.=
15-r0/linux-qemux86-standard-build/.config: No such file or directory
  +Value requested for CONFIG_LOCALVERSION not in final .config
  +Requested value:  CONFIG_LOCALVERSION=3D""
  +Actual value:
  +
  +grep: /OE/build/oe-core/tmp-glibc/work/qemux86-oe-linux/linux-yocto/5.4.=
15-r0/linux-qemux86-standard-build/.config: No such file or directory
  +Value requested for CONFIG_LOCALVERSION_AUTO not in final .config
  +Requested value:  # CONFIG_LOCALVERSION_AUTO is not set
  +Actual value:

* I don't know why merge_config.sh uses separate more difficult to find mer=
ge_config_build.log
  instead of leaving the output to end in log.do_kernel_configme, I'll send=
 it as separate
  commit so that it can be discussed there.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.=
bbclass
index e8a9b1f18e..f71aa7d0a6 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -354,7 +354,7 @@ do_kernel_configme() {
 		bbfatal_log "Could not find configuration queue (${meta_dir}/config.queu=
e)"
 	fi
=20
-	CFLAGS=3D"${CFLAGS} ${TOOLCHAIN_OPTIONS}"	HOSTCC=3D"${BUILD_CC} ${BUILD_C=
FLAGS} ${BUILD_LDFLAGS}" HOSTCPP=3D"${BUILD_CPP}" CC=3D"${KERNEL_CC}" ARCH=
=3D${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs} > ${meta_dir}=
/cfg/merge_config_build.log 2>&1
+	CFLAGS=3D"${CFLAGS} ${TOOLCHAIN_OPTIONS}"	HOSTCC=3D"${BUILD_CC} ${BUILD_C=
FLAGS} ${BUILD_LDFLAGS}" HOSTCPP=3D"${BUILD_CPP}" CC=3D"${KERNEL_CC}" LD=3D=
"${KERNEL_LD}" ARCH=3D${ARCH} merge_config.sh -O ${B} ${config_flags} ${con=
figs} > ${meta_dir}/cfg/merge_config_build.log 2>&1
 	if [ $? -ne 0 ]; then
 		bbfatal_log "Could not configure ${KMACHINE}-${LINUX_KERNEL_TYPE}"
 	fi
--=20
2.19.1


