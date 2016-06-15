Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id DE17165CB6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 21:39:59 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id d132so4832660oig.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 14:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yc7TFBI1uXc3+6QIJwg50qoDb0oEZwIDBLmz2/o9fsU=;
	b=pDWjcW+VHBzvg2si/CWUcT9fEQfiY3HH2zJD5IRShZ/jhnNjyXDUKwk3djDhIEepPJ
	cAOWvCPo5sO2W5HHDIa1FiJui9gwSDSAq5E5vXVbi908qgABWRpvbNmMqL3kBpFoxreH
	pmt81TtW3EEc/tPFb/wnV5G6mqlvBMBj7IufxDip0ogGmEjydXkCDawGpqE0UgAr2Swy
	5S+fjhefn8Kd1QQVlEHIKWAExOGAZyySrHfX0MTPSIRdTYkxtewdgoZtkrI3MH4WiF64
	enCiduzOPUx3WPqeH+0nqvn57pkSwJSNU2we9H4WaBwGzBlM5BxNXNPH7zK+nXvHY/z1
	YB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yc7TFBI1uXc3+6QIJwg50qoDb0oEZwIDBLmz2/o9fsU=;
	b=hNe2eoAoFvzSkWP47IGSBQmOhbDsjtE7vvqDy6XYEvuf9d7UKciIo4A7TwwcOcMLkN
	LZnH1zQ/rKDJyoEU9MkPbTgaY4IcEhyFnO162pYRccKbWhRROzGGS212ohi5mJmHazo1
	Afm/54ScjJQvSSAYJyWGGwP4RXl/ktcO5JeJ5J4MRJAP6ZEYBPTs9UcW6xQEu2rGx/yZ
	LLJGSbMqIhzch7RoPkmRTmpjChT+ogzS/3imxmuUqWCZXhnrQsCMvmM/4AoTvg/+T8z0
	BaSKBltrM9JivED74vFIM+DSmIIwxJi9+EvLWkaqmnXLwmCwZwUEbFx8RPdoexCK4N2y
	3JSg==
X-Gm-Message-State: ALyK8tI4E77uZneknVgVk40H7BtBk7/zi/kLrjlsrREI0upOQIWAMeN26D5by6rBJ1Xr8A25TmdoGO1gw0OmNA==
X-Received: by 10.202.212.141 with SMTP id l135mr532322oig.190.1466026800062; 
	Wed, 15 Jun 2016 14:40:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.129.164 with HTTP; Wed, 15 Jun 2016 14:39:59 -0700 (PDT)
In-Reply-To: <CAMKF1sp=GBNXY5Kieu9XEKrgpBFUT+14PqP-P0DnosR4i4qePQ@mail.gmail.com>
References: <1465780196-7491-1-git-send-email-sarnold@vctlabs.com>
	<CAMKF1sp=GBNXY5Kieu9XEKrgpBFUT+14PqP-P0DnosR4i4qePQ@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
Date: Wed, 15 Jun 2016 14:39:59 -0700
Message-ID: <CAOLEWZX=1DAk8BFAaJ0G5WfAMwHdeZY=j_QiA9LvztXWXN1how@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu-native: set ld.bfd, fix cflags, and set some environment vars
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
X-List-Received-Date: Wed, 15 Jun 2016 21:40:00 -0000
Content-Type: text/plain; charset=UTF-8

Undefined references to itself, essentially.  Lemme regenerate a build
log with failure in it.  The host toolchain defaults to gcc 5.3.0 with
LTO plugin enabled and gold linker as default (with multilib-strict
profile).  This time I think it's getting confused about
toolchain/binutils multilib config and the qemu makefiles probably
need a bigger set of fixes to work with gold and/or multilib.

My $.02 would be use/set bfd linker as default for now.

Steve

This is without any changes to current poky/oe-core recipes:

| /usr/lib/gcc/x86_64-pc-linux-gnu/5.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
error: /usr/lib64/libstdc++.a(eh_personality.o): requires dynamic
R_X86_64_PC32 reloc against '__stack_chk_fail' which may overflow at
runtime; recompile with -fPIC
| /usr/lib/gcc/x86_64-pc-linux-gnu/5.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
error: /usr/lib64/libstdc++.a(eh_personality.o): requires unsupported
dynamic reloc 11; recompile with -fPIC
| /usr/lib/gcc/x86_64-pc-linux-gnu/5.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
error: /usr/lib64/libstdc++.a(eh_personality.o): requires dynamic
R_X86_64_PC32 reloc against 'abort' which may overflow at runtime;
recompile with -fPIC
| /usr/lib/gcc/x86_64-pc-linux-gnu/5.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
error: /usr/lib64/libstdc++.a(eh_personality.o): requires dynamic
R_X86_64_PC32 reloc against 'abort' which may overflow at runtime;
recompile with -fPIC
| /usr/lib/gcc/x86_64-pc-linux-gnu/5.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
error: /usr/lib64/libstdc++.a(eh_personality.o): requires dynamic
R_X86_64_PC32 reloc against '_Unwind_GetRegionStart' which may
overflow at runtime; recompile with -fPIC
| /usr/lib/gcc/x86_64-pc-linux-gnu/5.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
error: /usr/lib64/libstdc++.a(eh_personality.o): requires dynamic
R_X86_64_PC32 reloc against '_Unwind_SetGR' which may overflow at
runtime; recompile with -fPIC
| /usr/lib/gcc/x86_64-pc-linux-gnu/5.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
error: /usr/lib64/libstdc++.a(eh_personality.o): requires dynamic
R_X86_64_PC32 reloc against '_Unwind_Resume' which may overflow at
runtime; recompile with -fPIC
| /usr/lib/gcc/x86_64-pc-linux-gnu/5.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
error: /usr/lib64/libstdc++.a(eh_personality.o): requires dynamic
R_X86_64_32 reloc against '__gxx_personality_v0' which may overflow at
runtime; recompile with -fPIC
| /usr/lib/gcc/x86_64-pc-linux-gnu/5.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
error: /usr/lib64/libstdc++.a(eh_terminate.o): requires dynamic
R_X86_64_PC32 reloc against 'abort' which may overflow at runtime;
recompile with -fPIC
| /usr/lib/gcc/x86_64-pc-linux-gnu/5.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
error: /usr/lib64/libstdc++.a(eh_terminate.o): requires dynamic
R_X86_64_32 reloc which may overflow at runtime; recompile with -fPIC
| /usr/lib/gcc/x86_64-pc-linux-gnu/5.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
error: /usr/lib64/libstdc++.a(eh_exception.o): requires dynamic
R_X86_64_32 reloc which may overflow at runtime; recompile with -fPIC
| /usr/lib/gcc/x86_64-pc-linux-gnu/5.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
error: /usr/lib64/libstdc++.a(eh_exception.o): requires dynamic
R_X86_64_32 reloc which may overflow at runtime; recompile with -fPIC
| /usr/lib/gcc/x86_64-pc-linux-gnu/5.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
error: /usr/lib64/libstdc++.a(bad_alloc.o): requires dynamic
R_X86_64_32 reloc which may overflow at runtime; recompile with -fPIC
| /usr/lib/gcc/x86_64-pc-linux-gnu/5.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
error: /usr/lib64/libstdc++.a(bad_alloc.o): requires unsupported
dynamic reloc 11; recompile with -fPIC
| /usr/lib/gcc/x86_64-pc-linux-gnu/5.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
error: /usr/lib64/libstdc++.a(bad_alloc.o): requires unsupported
dynamic reloc 11; recompile with -fPIC
| /usr/lib/gcc/x86_64-pc-linux-gnu/5.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
error: /usr/lib64/libstdc++.a(tinfo.o): requires dynamic R_X86_64_PC32
reloc against 'strcmp' which may overflow at runtime; recompile with
-fPIC
| /usr/lib/gcc/x86_64-pc-linux-gnu/5.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
error: /usr/lib64/libstdc++.a(eh_catch.o): requires dynamic
R_X86_64_PC32 reloc against '_Unwind_DeleteException' which may
overflow at runtime; recompile with -fPIC
| /usr/lib/gcc/x86_64-pc-linux-gnu/5.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
error: /usr/lib64/libstdc++.a(eh_alloc.o): requires dynamic
R_X86_64_32 reloc which may overflow at runtime; recompile with -fPIC
| /usr/lib/gcc/x86_64-pc-linux-gnu/5.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
error: /usr/lib64/libstdc++.a(eh_alloc.o): requires dynamic
R_X86_64_32 reloc which may overflow at runtime; recompile with -fPIC
| /usr/lib/gcc/x86_64-pc-linux-gnu/5.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
error: /usr/lib64/libstdc++.a(eh_alloc.o): requires unsupported
dynamic reloc 11; recompile with -fPIC
| /usr/lib/gcc/x86_64-pc-linux-gnu/5.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
error: /usr/lib64/libstdc++.a(eh_alloc.o): requires unsupported
dynamic reloc 11; recompile with -fPIC
| /usr/lib/gcc/x86_64-pc-linux-gnu/5.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
error: /usr/lib64/libstdc++.a(eh_alloc.o): requires unsupported
dynamic reloc 11; recompile with -fPIC
| /usr/lib/gcc/x86_64-pc-linux-gnu/5.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
error: /usr/lib64/libstdc++.a(eh_alloc.o): requires unsupported
dynamic reloc 11; recompile with -fPIC
| /usr/lib/gcc/x86_64-pc-linux-gnu/5.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
error: /usr/lib64/libstdc++.a(eh_alloc.o): requires dynamic
R_X86_64_32 reloc against
'_ZN9__gnu_cxx24__concurrence_lock_errorD1Ev' which may overflow at
runtime; recompile with -fPIC
| /usr/lib/gcc/x86_64-pc-linux-gnu/5.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
error: /usr/lib64/libstdc++.a(eh_alloc.o): requires dynamic
R_X86_64_32 reloc against
'_ZN9__gnu_cxx26__concurrence_unlock_errorD1Ev' which may overflow at
runtime; recompile with -fPIC
| /usr/lib/gcc/x86_64-pc-linux-gnu/5.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
error: /usr/lib64/libstdc++.a(eh_alloc.o): requires dynamic
R_X86_64_PC32 reloc against 'malloc' which may overflow at runtime;
recompile with -fPIC
| /usr/lib/gcc/x86_64-pc-linux-gnu/5.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
error: /usr/lib64/libstdc++.a(eh_alloc.o): requires unsupported
dynamic reloc 11; recompile with -fPIC
| /usr/lib/gcc/x86_64-pc-linux-gnu/5.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
error: /usr/lib64/libstdc++.a(eh_alloc.o): requires dynamic
R_X86_64_PC32 reloc against 'malloc' which may overflow at runtime;
recompile with -fPIC
| /usr/lib/gcc/x86_64-pc-linux-gnu/5.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
error: /usr/lib64/libstdc++.a(eh_alloc.o): requires unsupported
dynamic reloc 11; recompile with -fPIC
| /usr/lib/gcc/x86_64-pc-linux-gnu/5.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
error: /usr/lib64/libstdc++.a(eh_alloc.o): requires dynamic
R_X86_64_32 reloc which may overflow at runtime; recompile with -fPIC
| /usr/lib/gcc/x86_64-pc-linux-gnu/5.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
error: /usr/lib64/libstdc++.a(vterminate.o): requires dynamic
R_X86_64_32 reloc which may overflow at runtime; recompile with -fPIC
| /usr/lib/gcc/x86_64-pc-linux-gnu/5.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
error: /usr/lib64/libstdc++.a(vterminate.o): requires dynamic
R_X86_64_32 reloc against '_ZTISt9exception' which may overflow at
runtime; recompile with -fPIC
| /usr/lib/gcc/x86_64-pc-linux-gnu/5.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
error: /usr/lib64/libstdc++.a(vterminate.o): requires dynamic
R_X86_64_32 reloc which may overflow at runtime; recompile with -fPIC
| /usr/lib/gcc/x86_64-pc-linux-gnu/5.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
error: /usr/lib64/libstdc++.a(pure.o): requires dynamic R_X86_64_32
reloc which may overflow at runtime; recompile with -fPIC
| /usr/lib/gcc/x86_64-pc-linux-gnu/5.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
error: /usr/lib64/libstdc++.a(pure.o): requires dynamic R_X86_64_32
reloc which may overflow at runtime; recompile with -fPIC
| /usr/lib/gcc/x86_64-pc-linux-gnu/5.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
error: /usr/lib64/libstdc++.a(cp-demangle.o): requires unsupported
dynamic reloc 11; recompile with -fPIC
| collect2: error: ld returned 1 exit status
| Makefile:193: recipe for target 'qemu-system-arm' failed
| make[1]: *** [qemu-system-arm] Error 1
| Makefile:184: recipe for target 'subdir-arm-softmmu' failed
| make: *** [subdir-arm-softmmu] Error 2
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (log file is located at
/home/sarnold/beagleboard-bsp/poky/build-newkern/tmp/work/x86_64-linux/qemu-native/2.5.0-r1/temp/log.do_compile.29916)
ERROR: Task 4 (virtual:native:/home/sarnold/beagleboard-bsp/poky/meta/recipes-devtools/qemu/qemu_2.5.0.bb,
do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 187 tasks of which 185 didn't need to
be rerun and 1 failed.

Summary: 1 task failed:
  virtual:native:/home/sarnold/beagleboard-bsp/poky/meta/recipes-devtools/qemu/qemu_2.5.0.bb,
do_compile

On Wed, Jun 15, 2016 at 2:03 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Sun, Jun 12, 2016 at 6:09 PM, Stephen Arnold <sarnold@vctlabs.com> wrote:
>> The main thing is build failures with gold linker, but qemu is also a
>> little too aggressive at finding random tools on the build host, so we
>> also set the build env for qemu-native and make sure it doesn't reset
>> its own (hard-coded) cflags when we don't want it to.
>>
>> Signed-off-by: Stephen Arnold <sarnold@vctlabs.com>
>> ---
>>  meta/recipes-devtools/qemu/qemu.inc                     | 13 +++++++++++--
>>  meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch | 13 +++++++++++++
>>  meta/recipes-devtools/qemu/qemu_2.6.0.bb                |  4 +++-
>>  3 files changed, 27 insertions(+), 3 deletions(-)
>>  create mode 100644 meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch
>>
>> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
>> index bf689bb..d5925fd 100644
>> --- a/meta/recipes-devtools/qemu/qemu.inc
>> +++ b/meta/recipes-devtools/qemu/qemu.inc
>> @@ -30,8 +30,12 @@ SRC_URI_append_class-native = "\
>>
>>  EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror  --disable-bluez --disable-libiscsi --with-system-pixman --extra-cflags='${CFLAGS}'"
>>
>> -EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror \
>> -                               "
>> +EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror"
>> +
>> +EXTRA_OEMAKE_append_class-native = " LD='${LD}' AR='${AR}' OBJCOPY='${OBJCOPY}' LDFLAGS='${LDFLAGS}'"
>> +
>> +LDFLAGS_append_class-native = " -fuse-ld=bfd"
>
> what errors do you see with gold ?
>
>> +
>>  export LIBTOOL="${HOST_SYS}-libtool"
>>
>>  do_configure_prepend_class-native() {
>> @@ -40,6 +44,11 @@ do_configure_prepend_class-native() {
>>         if [ ! -z "$BHOST_PKGCONFIG_PATH" ]; then
>>                 export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$BHOST_PKGCONFIG_PATH
>>         fi
>> +
>> +       # Alter target makefiles to accept CFLAGS set via env
>> +       sed -i -r \
>> +               -e 's/^(C|OP_C|HELPER_C)FLAGS=/\1FLAGS+=/' \
>> +               "${S}"/Makefile "${S}"/Makefile.target
>>  }
>>
>>  KVMENABLE = "--enable-kvm"
>> diff --git a/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch b/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch
>> new file mode 100644
>> index 0000000..173394f
>> --- /dev/null
>> +++ b/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch
>> @@ -0,0 +1,13 @@
>> +--- a/configure
>> ++++ b/configure
>> +@@ -4468,10 +4468,6 @@ fi
>> + if test "$gcov" = "yes" ; then
>> +   CFLAGS="-fprofile-arcs -ftest-coverage -g $CFLAGS"
>> +   LDFLAGS="-fprofile-arcs -ftest-coverage $LDFLAGS"
>> +-elif test "$fortify_source" = "yes" ; then
>> +-  CFLAGS="-O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 $CFLAGS"
>> +-elif test "$debug" = "no"; then
>> +-  CFLAGS="-O2 $CFLAGS"
>> + fi
>> +
>> + ##########################################
>> diff --git a/meta/recipes-devtools/qemu/qemu_2.6.0.bb b/meta/recipes-devtools/qemu/qemu_2.6.0.bb
>> index e391326..735d013 100644
>> --- a/meta/recipes-devtools/qemu/qemu_2.6.0.bb
>> +++ b/meta/recipes-devtools/qemu/qemu_2.6.0.bb
>> @@ -8,7 +8,9 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
>>              file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
>>              file://no-valgrind.patch \
>>              file://pathlimit.patch \
>> -           "
>> +            file://qemu-2.5.0-cflags.patch \
>> +"
>> +
>>  SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
>>  SRC_URI[md5sum] = "ca3f70b43f093e33e9e014f144067f13"
>>  SRC_URI[sha256sum] = "c9ac4a651b273233d21b8bec32e30507cb9cce7900841febc330956a1a8434ec"
>> --
>> 2.8.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

