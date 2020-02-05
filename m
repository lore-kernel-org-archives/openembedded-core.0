Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
	[209.85.222.176])
	by mail.openembedded.org (Postfix) with ESMTP id F0D91605F2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 23:13:00 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id x82so3684584qkb.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2020 15:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=DICWUeW9ijxgVEe/p1jR4sAXdymjn2dcjE2RfW3d55k=;
	b=ZOpB7cfohetZODmVzRM4g/ywV0jw3qEhjE7+9kmjnWsF80A1hRLL+nehTX2las8y5Q
	t3v17RVTBfgjYIqC4rj6g/R03cEexW/gf72x7PEU5nrQaWLDd/YYSZGFqo6guzuEmMdN
	MB92z064iq54d1OKmX0ufkdRUGN+OTsV1Cghi93rPYUdoMekXBeyYFTLkPi6b4tv2pxz
	uZhzLUeIvpfNs/MfswbSwkGG6hu88UfznwTeyg5AL8sGqo8LFQKssVXyuo2ab7GZyL3g
	UJPaCLxULNQWK1om2tzMx74A0wI0LZu7RbmG9bWUDXzVnDF9fyoVNyyPCj3DVHS6P6Mt
	2Ppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DICWUeW9ijxgVEe/p1jR4sAXdymjn2dcjE2RfW3d55k=;
	b=exGrul3Bfg3oUHTUvtJZnqDEdt+DwXHGKnO9Bh0ErUXDlnK+KZk47v4ON3R3AWKHj7
	9VVctSERrmg3/wsMNjweBwH5S0CFmWHa83hxMskTifUSDJjGUkAvUalXMEGhxAu2jLHf
	+07mrNOTln1JrphO5t8vfU43doSQz3ahjImq4beQOlJ0MBTdJlPbl7olaZ5tGgoeX8wz
	HFQhxYujXqeQ8HjVaPgsxwe48Bb3BSwm4ynnfGN664U8mXakSyhEdeiPbXf/hmgy7nwB
	ZI/5kTys1LGoLNIyBnOxZgYmfUMl/FUUs3VbKoaCxkUu4vn6ly9E/0IXnlu7zW8SF7z6
	reIg==
X-Gm-Message-State: APjAAAUfsXXARuGEgTblHxg3xNZ/vVvA47PDPqNErYTJNOSEP8y+OwCV
	mKh6UzDvcSgF55jDmE6AwFM=
X-Google-Smtp-Source: APXvYqzdfd1lD4VQ2LwS0VPOKdabitmoWzxK3iFzr98rEJHKRoxUs6IHh+pnr7DWoeogl2g0R47M4g==
X-Received: by 2002:a05:620a:557:: with SMTP id
	o23mr150318qko.246.1580944380918; 
	Wed, 05 Feb 2020 15:13:00 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95])
	by smtp.gmail.com with ESMTPSA id o17sm696332qtj.80.2020.02.05.15.13.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 05 Feb 2020 15:13:00 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed,  5 Feb 2020 18:12:48 -0500
Message-Id: <14beb4fa55a56a8c5cc95f314073623f6c1b0039.1580944129.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1580944129.git.bruce.ashfield@gmail.com>
References: <cover.1580944129.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/9] kernel-yocto.bbclass: set KERNEL_LD also for merge_config.sh
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
X-List-Received-Date: Wed, 05 Feb 2020 23:13:01 -0000
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


