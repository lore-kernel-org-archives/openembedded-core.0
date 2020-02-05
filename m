Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 47B616102C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 03:03:12 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id p3so738319edx.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Feb 2020 19:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=DoUFthOxAzGRBaWOgywxKDrL2Py/tUrNcjFAcZtZZDs=;
	b=ZlvvfnoogcOBvY0X3ZMH6n95Qr5HJKVjs+3+P0oHw9CC+I5kVFs4QIIPNsutX84La+
	4MQr2X5H5JW0MHvRqJ0X1uyar5PfMnl66/UTF7pCnRhUKkSpXTUrtJRadYvU+SLN0Ib3
	9jGIiR29ExOlq96m8oSETrv0KpPNvWWpO4CtedijnlN74PgEqCfw++sagnk87y3cxLIs
	Vc/K6jlxO3yuT9qpWocKdnITbu3khOfHbrOm9dqdzuT1CyN7jobZ6udoLkkHpDTKSVff
	1BIk7eq74P6aOiVGPrpgYoVdPiHSvZF6EkDatOZryPDJiA8c7MDa/z/AN5jAen5HPvop
	IEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=DoUFthOxAzGRBaWOgywxKDrL2Py/tUrNcjFAcZtZZDs=;
	b=FEExqS3rwLQeTpCH8gcqmD0fbjyRLM4GxpbRtO7WDdixJZY+2KI8TxR3IUyj4GnAYs
	YfYbIgNxLWD/1lp6PxVxZ/PzpjKvs8QJbFPyOQHstBRLCawf/usbWQHWoFdl7kqo4sjI
	LZ2ysKZY7Bt7gGPkgG9a1CHB1bF7tIoB3UsaDzRz+9XLCFzTSnwpLKhagaQOR9iXT8+c
	RydrqU5B5KKKc5vKCQBANUFrMXYWT/pV8ZduCmQjSSsIRjqg4/c2BmEbA6RrwosdbfI1
	CPyc8eQqsqcKKAiu0910LU76YsmxYJTiChLoFkRLMTIHD7tsXEQR6fvhvrpAQwM/s4H/
	smDA==
X-Gm-Message-State: APjAAAWgUSd3YL5zcbPUOKZrUbc/VXt31G5ydvtvABqPfrvqal6CEPJt
	xnasOvRENaEgjh2ZBv76SrzRdVoLwB5vWqPAHVKAChzD
X-Google-Smtp-Source: APXvYqxgP7T2c80fGloOJD5dEbJ+M4FBgP8CTP+zAmqcBz8gQu4QzG3GUvcABVw1x6u5iEJX4nz9RklCYiso5dHk9pg=
X-Received: by 2002:a50:aacd:: with SMTP id r13mr2969045edc.129.1580871792913; 
	Tue, 04 Feb 2020 19:03:12 -0800 (PST)
MIME-Version: 1.0
References: <20200205024241.27828-1-Martin.Jansa@gmail.com>
In-Reply-To: <20200205024241.27828-1-Martin.Jansa@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 4 Feb 2020 22:03:02 -0500
Message-ID: <CADkTA4PkJoSeoGbf5U8PW68QQDLALOW0GDD2wpa6LgCgHdRg=w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] kernel-yocto.bbclass: set KERNEL_LD also for merge_config.sh
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
X-List-Received-Date: Wed, 05 Feb 2020 03:03:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2020 at 9:42 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> * when ld-is-gold is used, merge_config.sh silently fails and doesn't gen=
erate anything
>   useful in .config (and also include directory isn't created):
>
>   tmp-glibc-bfd-qemux86-do_kernel_configme/work/qemux86-oe-linux/linux-yo=
cto/5.4.15-r0/linux-qemux86-standard-build:
>   total 164K
>   drwxr-xr-x 4 martin martin 4.0K Feb  5 02:27 .
>   drwxrwxr-x 7 martin martin 4.0K Feb  5 02:27 ..
>   -rw-rw-r-- 1 martin martin 133K Feb  5 02:28 .config
>   -rw-rw-r-- 1 martin martin   39 Feb  5 02:27 .gitignore
>   drwxr-xr-x 4 martin martin 4.0K Feb  5 02:27 include
>   -rw-rw-r-- 1 martin martin  201 Feb  5 02:27 Makefile
>   drwxrwxr-x 4 martin martin 4.0K Feb  5 02:27 scripts
>   lrwxrwxrwx 1 martin martin   61 Feb  5 02:27 source -> /OE/build/oe-cor=
e/tmp-glibc/work-shared/qemux86/kernel-source
>
>   tmp-glibc-gold-qemux86-do_kernel_configme/work/qemux86-oe-linux/linux-y=
octo/5.4.15-r0/linux-qemux86-standard-build:
>   total 28K
>   drwxr-xr-x 3 martin martin 4.0K Feb  5 02:26 .
>   drwxrwxr-x 7 martin martin 4.0K Feb  5 02:26 ..
>   -rw-rw-r-- 1 martin martin   74 Feb  5 02:26 .config
>   -rw-rw-r-- 1 martin martin   39 Feb  5 02:26 .gitignore
>   -rw-rw-r-- 1 martin martin  201 Feb  5 02:26 Makefile
>   drwxrwxr-x 4 martin martin 4.0K Feb  5 02:26 scripts
>   lrwxrwxrwx 1 martin martin   61 Feb  5 02:26 source -> /OE/build/oe-cor=
e/tmp-glibc/work-shared/qemux86/kernel-source
>
>   $ cat tmp-glibc-gold-qemux86-do_kernel_configme/work/qemux86-oe-linux/l=
inux-yocto/5.4.15-r0/linux-qemux86-standard-build/.config
>   CONFIG_LOCALVERSION=3D"-yocto-standard"
>
> * and because the failure is silent, it will happily start building
>   kernel with default defconfig, which even builds OK for qemux86-64
>   but on qemux86 I've noticed this issue, because incorrectly
>   configured kernel build fails with:
>
>   $ tail -n 20 tmp-glibc-gold-qemux86/work/qemux86-oe-linux/linux-yocto/5=
.4.15-r0/temp/log.do_compile
>     LD       /OE/build/oe-core/tmp-glibc/work/qemux86-oe-linux/linux-yoct=
o/5.4.15-r0/linux-qemux86-standard-build/tools/objtool/libsubcmd-in.o
>     AR       /OE/build/oe-core/tmp-glibc/work/qemux86-oe-linux/linux-yoct=
o/5.4.15-r0/linux-qemux86-standard-build/tools/objtool/libsubcmd.a
>     HOSTCC  scripts/mod/mk_elfconfig
>     CC      scripts/mod/devicetable-offsets.s
>     CC      scripts/mod/empty.o
>   cc1: error: code model 'kernel' not supported in the 32 bit mode
>   cc1: sorry, unimplemented: 64-bit mode not compiled in
>   make[2]: *** [/OE/build/oe-core/tmp-glibc/work-shared/qemux86/kernel-so=
urce/scripts/Makefile.build:99: scripts/mod/devicetable-offsets.s] Error 1
>   make[2]: *** Waiting for unfinished jobs....
>   cc1: error: code model 'kernel' not supported in the 32 bit mode
>   cc1: sorry, unimplemented: 64-bit mode not compiled in
>   make[2]: *** [/OE/build/oe-core/tmp-glibc/work-shared/qemux86/kernel-so=
urce/scripts/Makefile.build:266: scripts/mod/empty.o] Error 1
>   make[1]: *** [/OE/build/oe-core/tmp-glibc/work-shared/qemux86/kernel-so=
urce/Makefile:1111: prepare0] Error 2
>   make[1]: *** Waiting for unfinished jobs....
>     LD       /OE/build/oe-core/tmp-glibc/work/qemux86-oe-linux/linux-yoct=
o/5.4.15-r0/linux-qemux86-standard-build/tools/objtool/objtool-in.o
>   /OE/build/oe-core/tmp-glibc/work-shared/qemux86/kernel-source/tools/obj=
tool
>     LINK     /OE/build/oe-core/tmp-glibc/work/qemux86-oe-linux/linux-yoct=
o/5.4.15-r0/linux-qemux86-standard-build/tools/objtool/objtool
>   make: *** [/OE/build/oe-core/tmp-glibc/work-shared/qemux86/kernel-sourc=
e/Makefile:179: sub-make] Error 2
>   WARNING: exit code 1 from a shell command.
>
> * the issue happens in log.do_kernel_configme, but the log is completely =
useless:
>
>   cat tmp-glibc-gold-qemux86-do_kernel_configme/work/qemux86-oe-linux/lin=
ux-yocto/5.4.15-r0/temp/log.do_kernel_configme
>   DEBUG: Executing python function extend_recipe_sysroot
>   NOTE: Direct dependencies are ['virtual:native:/OE/build/oe-core/openem=
bedded-core/meta/recipes-devtools/bison/bison_3.5.bb:do_populate_sysroot', =
'/OE/build/oe-core/openembedded-core/meta/recipes-kernel/kern-tools/kern-to=
ols-native_git.bb:do_populate_sysroot', 'virtual:native:/OE/build/oe-core/o=
penembedded-core/meta/recipes-extended/bc/bc_1.07.1.bb:do_populate_sysroot'=
, '/OE/build/oe-core/openembedded-core/meta/recipes-devtools/binutils/binut=
ils-cross_2.33.bb:do_populate_sysroot', '/OE/build/oe-core/openembedded-cor=
e/meta/recipes-devtools/quilt/quilt-native_0.66.bb:do_populate_sysroot', '/=
OE/build/oe-core/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_9.2.=
bb:do_populate_sysroot']
>   NOTE: Installed into sysroot: ['bison-native', 'bc-native', 'binutils-c=
ross-i686', 'gcc-cross-i686', 'autoconf-native', 'xz-native', 'flex-native'=
, 'gnu-config-native', 'automake-native', 'libtool-native', 'texinfo-dummy-=
native', 'gettext-minimal-native', 'readline-native', 'zlib-native', 'gmp-n=
ative', 'libmpc-native', 'mpfr-native', 'linux-libc-headers', 'm4-native', =
'ncurses-native', 'pkgconfig-native']
>   NOTE: Skipping as already exists in sysroot: ['kern-tools-native', 'qui=
lt-native']
>   DEBUG: sed -e 's:^[^/]*/:/OE/build/oe-core/tmp-glibc/work/qemux86-oe-li=
nux/linux-yocto/5.4.15-r0/recipe-sysroot-native/:g' /OE/build/oe-core/tmp-g=
libc/sysroots-components/x86_64/bison-native/fixmepath /OE/build/oe-core/tm=
p-glibc/sysroots-components/x86_64/gcc-cross-i686/fixmepath /OE/build/oe-co=
re/tmp-glibc/sysroots-components/x86_64/autoconf-native/fixmepath /OE/build=
/oe-core/tmp-glibc/sysroots-components/x86_64/gnu-config-native/fixmepath /=
OE/build/oe-core/tmp-glibc/sysroots-components/x86_64/automake-native/fixme=
path /OE/build/oe-core/tmp-glibc/sysroots-components/x86_64/libtool-native/=
fixmepath /OE/build/oe-core/tmp-glibc/sysroots-components/x86_64/gmp-native=
/fixmepath /OE/build/oe-core/tmp-glibc/sysroots-components/x86_64/ncurses-n=
ative/fixmepath /OE/build/oe-core/tmp-glibc/sysroots-components/x86_64/pkgc=
onfig-native/fixmepath | xargs sed -i -e 's:FIXMESTAGINGDIRTARGET:/OE/build=
/oe-core/tmp-glibc/work/qemux86-oe-linux/linux-yocto/5.4.15-r0/recipe-sysro=
ot:g; s:FIXMESTAGINGDIRHOST:/OE/build/oe-core/tmp-glibc/work/qemux86-oe-lin=
ux/linux-yocto/5.4.15-r0/recipe-sysroot-native:g' -e 's:FIXME_PSEUDO_SYSROO=
T:/OE/build/oe-core/tmp-glibc/sysroots-components/x86_64/pseudo-native:g' -=
e 's:FIXME_HOSTTOOLS_DIR:/OE/build/oe-core/tmp-glibc/hosttools:g' -e 's:FIX=
ME_PKGDATA_DIR:/OE/build/oe-core/tmp-glibc/pkgdata/qemux86:g' -e 's:FIXME_P=
SEUDO_LOCALSTATEDIR:/OE/build/oe-core/tmp-glibc/work/qemux86-oe-linux/linux=
-yocto/5.4.15-r0/pseudo/:g' -e 's:FIXME_LOGFIFO:/OE/build/oe-core/tmp-glibc=
/work/qemux86-oe-linux/linux-yocto/5.4.15-r0/temp/fifo.10476:g'
>   DEBUG: Python function extend_recipe_sysroot finished
>   DEBUG: Executing shell function do_kernel_configme
>   DEBUG: Shell function do_kernel_configme finished
>
>   ]because merge_config.sh is redirected to work-shared/qemux86/kernel-so=
urce/.kernel-meta/cfg/merge_config_build.log
>   and bbfatal_log called in do_kernel_configme only when merge_config.sh =
fails which it should in this case
>   but doesn't.
>
>   The merge_config_build.log shows 5.4 specific error:
>     scripts/Kconfig.include:39:  gold linker 'i686-oe-linux-ld' not suppo=
rted
>   but then it happily continues reporting what isn't applied in not creat=
ed
>   .config file
>
>   --- tmp-glibc-bfd-qemux86-do_kernel_configme/work-shared/qemux86/kernel=
-source/.kernel-meta/cfg/merge_config_build.log  2020-02-05 02:28:01.455520=
207 +0100
>   +++ tmp-glibc-gold-qemux86-do_kernel_configme/work-shared/qemux86/kerne=
l-source/.kernel-meta/cfg/merge_config_build.log 2020-02-05 02:26:30.656470=
909 +0100
>   @@ -171,586 +171,5113 @@
>      HOSTCC  scripts/kconfig/symbol.o
>      HOSTLD  scripts/kconfig/conf
>    scripts/kconfig/conf  --alldefconfig Kconfig
>   -./.tmp.config.jDjIEYi9Yq:2208:warning: unexpected data:  #
>   -./.tmp.config.jDjIEYi9Yq:2209:warning: unexpected data:  # Generic Dri=
ver Options
>   -./.tmp.config.jDjIEYi9Yq:2210:warning: unexpected data:  #
>   -./.tmp.config.jDjIEYi9Yq:3102:warning: symbol value 'm' invalid for SA=
MPLE_SECCOMP
>   -./.tmp.config.jDjIEYi9Yq:3119:warning: symbol value 'm' invalid for NF=
_CT_PROTO_GRE
>   -./.tmp.config.jDjIEYi9Yq:3120:warning: symbol value 'm' invalid for NF=
_CT_PROTO_SCTP
>   -./.tmp.config.jDjIEYi9Yq:3121:warning: symbol value 'm' invalid for NF=
_CT_PROTO_UDPLITE
>   -#
>   -# configuration written to .config
>   -#
>   +scripts/Kconfig.include:39:  gold linker 'i686-oe-linux-ld' not suppor=
ted
>   +make[2]: *** [/OE/build/oe-core/tmp-glibc/work-shared/qemux86/kernel-s=
ource/scripts/kconfig/Makefile:73: alldefconfig] Error 1
>   +make[1]: *** [/OE/build/oe-core/tmp-glibc/work-shared/qemux86/kernel-s=
ource/Makefile:567: alldefconfig] Error 2
>    make[1]: Leaving directory '/OE/build/oe-core/tmp-glibc/work/qemux86-o=
e-linux/linux-yocto/5.4.15-r0/linux-qemux86-standard-build'
>   +make: *** [Makefile:179: sub-make] Error 2
>   +grep: /OE/build/oe-core/tmp-glibc/work/qemux86-oe-linux/linux-yocto/5.=
4.15-r0/linux-qemux86-standard-build/.config: No such file or directory
>   +Value requested for CONFIG_LOCALVERSION not in final .config
>   +Requested value:  CONFIG_LOCALVERSION=3D""
>   +Actual value:
>   +
>   +grep: /OE/build/oe-core/tmp-glibc/work/qemux86-oe-linux/linux-yocto/5.=
4.15-r0/linux-qemux86-standard-build/.config: No such file or directory
>   +Value requested for CONFIG_LOCALVERSION_AUTO not in final .config
>   +Requested value:  # CONFIG_LOCALVERSION_AUTO is not set
>   +Actual value:
>
> * I don't know why merge_config.sh uses separate more difficult to find m=
erge_config_build.log
>   instead of leaving the output to end in log.do_kernel_configme, I'll se=
nd it as separate
>   commit so that it can be discussed there.

That's because there's a LOT of noise in the merge_config log, the
separate task for doing the audit has heuristics to highlight
important errors, and allows configuration fragments to override each
other, have optional fragments, etc.

I already have the various audit level variables in use for
linux-yocto style kernels, at the highest level it could be dumped,
but absolutely not by default.

Cheers,

Bruce

>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/kernel-yocto.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yoct=
o.bbclass
> index 141eeafeb9..d2796b01bf 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -345,7 +345,7 @@ do_kernel_configme() {
>                 bbfatal_log "Could not find configuration queue (${meta_d=
ir}/config.queue)"
>         fi
>
> -       CFLAGS=3D"${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC=3D"${BUILD_CC} $=
{BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP=3D"${BUILD_CPP}" CC=3D"${KERNEL_CC=
}" ARCH=3D${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs} > ${me=
ta_dir}/cfg/merge_config_build.log 2>&1
> +       CFLAGS=3D"${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC=3D"${BUILD_CC} $=
{BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP=3D"${BUILD_CPP}" CC=3D"${KERNEL_CC=
}" LD=3D"${KERNEL_LD}" ARCH=3D${ARCH} merge_config.sh -O ${B} ${config_flag=
s} ${configs} > ${meta_dir}/cfg/merge_config_build.log 2>&1
>         if [ $? -ne 0 ]; then
>                 bbfatal_log "Could not configure ${KMACHINE}-${LINUX_KERN=
EL_TYPE}"
>         fi
> --
> 2.20.1
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

