Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D47C4828F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 13:10:07 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.17201.1707397801488841382
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 05:10:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UbCWcqev;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-33b18099411so1216637f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 05:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707397800; x=1708002600; darn=lists.openembedded.org;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q/BAJSQ51sv9uqn+friyOPM3L7RlUk7yHP+iPDlsM3Y=;
        b=UbCWcqevK3V18ETnTtXnahXsFln1ZW2rGSsr5BmMVOkdscl/LCqWAsLcywx4JdsPoe
         kYq/LFmzcgxlP93hhSVeUsitA0coe1HMsYKnlaZeU1Npn3DoRxZmaROxMmwPeekGpyO3
         70nTpZ4wVTk8t5v9Rw4YCYESquVMgtCqNWRG22tCLCDsFjspYOrV3Q0luWo9UFG7c9GL
         nzgVWqnSsFfwfV1adxOiQbxz4VAi5wLXlIBcxsSHxDiUwZN3ekIKkOIPAuy2dkLfox2H
         ah1pumxIfuQCKm+Olr87JMG7FZ/J3bMoaJyrAtRlaYfgpN1vZ4Jwbc7vC977J/gH/6xx
         UeXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707397800; x=1708002600;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q/BAJSQ51sv9uqn+friyOPM3L7RlUk7yHP+iPDlsM3Y=;
        b=udmR7mkOiDLU7AmBB3y/N8N/ZeZPyV94MMx8hiFrlGWmMziAAtCzqZdvU5iOLl5/xn
         Je4WBkbyAo0RF24u2ZZRP27sgUprjacDa/c4hD/TRYDvY+Orz/+gfx7L2/Mtm2D6VdiP
         ztT3FIajmpMU5ttgEE6Ps3FPlDvnHvM1XJ4/JeRGwBpGIG2OGjrag1vJ3X9B7qix5Yae
         zNBD+kY0iEGH4TZMOFbvdg0tYtVmcxdQFstfKfWfhjFjp9Ni5gHdD/DodV3ntAyIYbFq
         swTPQjR4K61cpovfInd+iLp8ka6LNvf21n7CaZLC0htn65TKiyMxFzhbvhaIW4H+ptDe
         Y8IQ==
X-Gm-Message-State: AOJu0YxDRWP5U6idsKLaBEg1O8NcTBV9MnOVo2LbAJzikssvCjv5/v3s
	P0YPM6vaSJInJ23pSfHqbwa67kSknAML+madOhrZyzEODDr9+pxc
X-Google-Smtp-Source: AGHT+IEmWvxBKATxy/UOo10aC7Qq6+Eb2YjY6StBhPBM8V2wgDvHgepKm55a2cjVcQ8rYm6ep5fXaQ==
X-Received: by 2002:adf:fc86:0:b0:33b:198f:4a45 with SMTP id g6-20020adffc86000000b0033b198f4a45mr5180326wrr.12.1707397799428;
        Thu, 08 Feb 2024 05:09:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUKx0VVE966ZmMHOKUqu8DkBB81cZMd4dN1FJU8EG7+QPUw4+5vA0UEMUAWcmgSwRm0mSvTVKEpNThFA0pBpbXdu7YQ3ZPIml7r3QCK0w3ARAvHT2Ndso/gHSms/yqe3OHACInH1XYR33ZI8BLt2g8xtnd8sJCatdtSMOpf2BQHKjCvvCM=
Received: from [10.139.2.160] ([154.47.27.145])
        by smtp.gmail.com with ESMTPSA id r20-20020adfb1d4000000b00337d6f0013esm3599210wra.107.2024.02.08.05.09.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Feb 2024 05:09:58 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------cuy5nOG7bGjLXTohj5u5HuaC"
Message-ID: <fbb5123f-b2c6-4229-99ff-2d483e4b749c@gmail.com>
Date: Thu, 8 Feb 2024 14:09:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 1/2] shadow: update 4.13 -> 4.14.2
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "Chen, Qi" <Qi.Chen@windriver.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 Alexander Kanavin <alex@linutronix.de>
References: <20240111131521.2305172-1-alex@linutronix.de>
 <51ee1c53-0687-22a5-ec9b-88c2ecd2bc66@windriver.com>
 <CANNYZj8Wqm1NNx0VuxOU7sxoxsKcKh+vG-3WrkKiDqQVGSDNsg@mail.gmail.com>
 <CO6PR11MB56024A3C9C403E77C038F106ED702@CO6PR11MB5602.namprd11.prod.outlook.com>
 <CANNYZj-A5mfTyDSU0JzSpD_y29ByQrSbM=DupDWDFtMaDjtwEg@mail.gmail.com>
 <28d1f2fe-18fc-48a2-98a3-d6c4b84a242e@gmail.com>
 <CANNYZj_4rwjT5+Q4+Nm5czUPXiQG1gCzcnROj5cUVmQsG0Bt2g@mail.gmail.com>
 <17B1DDC9333F50F1.20876@lists.openembedded.org>
 <9c50fcac-5993-4293-a794-422fe8ec5e5c@gmail.com>
 <99fe5b08b06c72cf7bfc9818f2f415416f4419f4.camel@linuxfoundation.org>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <99fe5b08b06c72cf7bfc9818f2f415416f4419f4.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 13:10:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195149

This is a multi-part message in MIME format.
--------------cuy5nOG7bGjLXTohj5u5HuaC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

shadow-native configure log is below.

DEBUG: Executing python function extend_recipe_sysroot
NOTE: Direct dependencies are 
['/home/uvv/projects/upstream/poky-shadow/meta/recipes-core/gettext/gettext-minimal-native_0.22.4.bb:do_populate_sysroot', 
'/home/uvv/projects/upstream/poky-shadow/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_populate_sysroot', 
'/home/uvv/projects/upstream/poky-shadow/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', 
'virtual:native:/home/uvv/projects/upstream/poky-shadow/meta/recipes-devtools/autoconf/autoconf_2.72e.bb:do_populate_sysroot', 
'virtual:native:/home/uvv/projects/upstream/poky-shadow/meta/recipes-devtools/automake/automake_1.16.5.bb:do_populate_sysroot', 
'virtual:native:/home/uvv/projects/upstream/poky-shadow/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 
'virtual:native:/home/uvv/projects/upstream/poky-shadow/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot', 
'virtual:native:/home/uvv/projects/upstream/poky-shadow/meta/recipes-support/libbsd/libbsd_0.11.8.bb:do_populate_sysroot']
NOTE: Installed into sysroot: []
NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 
'libtool-native', 'm4-native', 'quilt-native', 'texinfo-dummy-native', 
'autoconf-native', 'automake-native', 'gnu-config-native', 
'pkgconfig-native', 'xz-native', 'attr-native', 'libbsd-native', 
'libmd-native']
DEBUG: Python function extend_recipe_sysroot finished
DEBUG: Executing shell function autotools_preconfigure
DEBUG: Shell function autotools_preconfigure finished
DEBUG: Executing python function autotools_aclocals
DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 
'bit-64', 'x86_64-linux', 'common']
DEBUG: Python function autotools_aclocals finished
DEBUG: Executing shell function do_configure
automake (GNU automake) 1.16.5
Copyright (C) 2021 Free Software Foundation, Inc.
License GPLv2+: GNU GPL version 2 or later 
<https://gnu.org/licenses/gpl-2.0.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by Tom Tromey <tromey@redhat.com>
        and Alexandre Duret-Lutz <adl@gnu.org>.
AUTOV is 1.16
NOTE: Executing ACLOCAL="aclocal 
--system-acdir=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr/share/aclocal/ 
--automake-acdir=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr/share/aclocal-1.16" 
autoreconf -Wcross --verbose --install --force --exclude=autopoint -I 
/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/shadow-4.14.2/m4/
autoreconf: export WARNINGS=cross,no-obsolete
autoreconf: Entering directory '.'
autoreconf: running: aclocal 
--system-acdir=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr/share/aclocal/ 
--automake-acdir=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr/share/aclocal-1.16 
-I 
/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/shadow-4.14.2/m4/ 
--force
autoreconf: configure.ac: tracing
autoreconf: running: libtoolize --copy --force
libtoolize: putting auxiliary files in '.'.
libtoolize: copying file './ltmain.sh'
libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'm4'.
libtoolize: copying file 'm4/libtool.m4'
libtoolize: copying file 'm4/ltoptions.m4'
libtoolize: copying file 'm4/ltsugar.m4'
libtoolize: copying file 'm4/ltversion.m4'
libtoolize: copying file 'm4/lt~obsolete.m4'
libtoolize: Consider adding '-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
autoreconf: configure.ac: not using Intltool
autoreconf: configure.ac: not using Gtkdoc
autoreconf: running: aclocal 
--system-acdir=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr/share/aclocal/ 
--automake-acdir=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr/share/aclocal-1.16 
-I 
/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/shadow-4.14.2/m4/ 
--force
autoreconf: running: 
/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr/bin/autoconf 
--include=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/shadow-4.14.2/m4/ 
--force
autoreconf: running: 
/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr/bin/autoheader 
--include=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/shadow-4.14.2/m4/ 
--force
autoreconf: running: automake --add-missing --copy --force-missing
configure.ac:23: installing './compile'
configure.ac:9: installing './missing'
lib/Makefile.am: installing './depcomp'
autoreconf: './install-sh' is updated
autoreconf: './config.sub' is updated
autoreconf: './config.guess' is updated
autoreconf: Leaving directory '.'
NOTE: Running ../shadow-4.14.2/configure  --build=x86_64-linux       
--host=x86_64-linux           --target=x86_64-linux 
--prefix=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr 
--exec_prefix=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr 
--bindir=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr/bin 
--sbindir=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr/sbin 
--libexecdir=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr/libexec 
--datadir=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr/share 
--sysconfdir=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/etc 
--sharedstatedir=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/com 
--localstatedir=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/var 
--libdir=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr/lib 
--includedir=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr/include 
--oldincludedir=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr/include 
--infodir=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr/share/info 
--mandir=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr/share/man 
           --disable-silent-rules --disable-dependency-tracking 
--without-libcrack --with-group-name-max-length=24 
--enable-subordinate-ids=yes --without-sssd                  
--without-nscd --disable-static --without-acl --with-attr 
--without-audit --with-libbsd --without-libpam --without-selinux 
--disable-nls
configure: loading site script 
/home/uvv/projects/upstream/poky-shadow/meta/site/endian-little
configure: loading site script 
/home/uvv/projects/upstream/poky-shadow/meta/site/common-linux
configure: loading site script 
/home/uvv/projects/upstream/poky-shadow/meta/site/common-glibc
configure: loading site script 
/home/uvv/projects/upstream/poky-shadow/meta/site/x86_64-linux
configure: loading site script 
/home/uvv/projects/upstream/poky-shadow/meta/site/common
checking for a BSD-compatible install... 
/home/uvv/projects/upstream/poky-shadow/build/tmp/hosttools/install -c
checking whether build environment is sane... yes
checking for a race-free mkdir -p... 
/home/uvv/projects/upstream/poky-shadow/build/tmp/hosttools/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking whether make supports nested variables... yes
checking whether make supports nested variables... (cached) yes
checking whether make supports the include directive... yes (GNU style)
checking for x86_64-linux-gcc... gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables...
checking whether we are cross compiling... no
checking for suffix of object files... o
checking whether the compiler supports GNU C... yes
checking whether gcc  accepts -g... yes
checking for gcc  option to enable C11 features... none needed
checking whether gcc  understands -c and -o together... yes
checking dependency style of gcc ... none
checking for stdio.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for strings.h... yes
checking for sys/stat.h... yes
checking for sys/types.h... yes
checking for unistd.h... yes
checking for wchar.h... yes
checking for minix/config.h... no
checking for utime.h... yes
checking whether it is safe to define __EXTENSIONS__... yes
checking whether _XOPEN_SOURCE should be defined... no
checking whether to enable maintainer-specific portions of Makefiles... no
checking for x86_64-linux-gcc... (cached) gcc
checking whether the compiler supports GNU C... (cached) yes
checking whether gcc  accepts -g... (cached) yes
checking for gcc  option to enable C11 features... (cached) none needed
checking whether gcc  understands -c and -o together... (cached) yes
checking dependency style of gcc ... (cached) none
checking whether ln -s works... yes
checking for bison... no
checking for byacc... no
checking build system type... x86_64-pc-linux-gnu
checking host system type... x86_64-pc-linux-gnu
checking how to print strings... printf
checking for a sed that does not truncate output... (cached) sed
checking for grep that handles long lines and -e... 
/home/uvv/projects/upstream/poky-shadow/build/tmp/hosttools/grep
checking for egrep... 
/home/uvv/projects/upstream/poky-shadow/build/tmp/hosttools/grep -E
checking for fgrep... 
/home/uvv/projects/upstream/poky-shadow/build/tmp/hosttools/grep -F
checking for ld used by gcc ... ld
checking if the linker (ld ) is GNU ld... yes
checking for BSD- or MS-compatible name lister (nm)... nm
checking the name lister (nm) interface... BSD nm
checking the maximum length of command line arguments... 1572864
checking how to convert x86_64-pc-linux-gnu file names to 
x86_64-pc-linux-gnu format... func_convert_file_noop
checking how to convert x86_64-pc-linux-gnu file names to toolchain 
format... func_convert_file_noop
checking for ld  option to reload object files... -r
checking for x86_64-linux-file... no
checking for file... file
checking for x86_64-linux-objdump... objdump
checking how to recognize dependent libraries... pass_all
checking for x86_64-linux-dlltool... no
checking for dlltool... no
checking how to associate runtime and link libraries... printf %s\n
checking for x86_64-linux-ar... ar
checking for archiver @FILE support... @
checking for x86_64-linux-strip... strip
checking for x86_64-linux-ranlib... ranlib -D
checking command to parse nm output from gcc  object... ok
checking for sysroot... no
checking for a working dd... 
/home/uvv/projects/upstream/poky-shadow/build/tmp/hosttools/dd
checking how to truncate binary pipes... 
/home/uvv/projects/upstream/poky-shadow/build/tmp/hosttools/dd bs=4096 
count=1
checking for x86_64-linux-mt... no
checking for mt... no
checking if : is a manifest tool... no
checking for dlfcn.h... yes
checking for objdir... .libs
checking if gcc  supports -fno-rtti -fno-exceptions... no
checking for gcc  option to produce PIC... -fPIC -DPIC
checking if gcc  PIC flag -fPIC -DPIC works... yes
checking if gcc  static flag -static works... yes
checking if gcc  supports -c -o file.o... yes
checking if gcc  supports -c -o file.o... (cached) yes
checking whether the gcc  linker (ld  -m elf_x86_64) supports shared 
libraries... yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... no
checking for crypt.h... yes
checking for utmp.h... yes
checking for termio.h... yes
checking for sgtty.h... yes
checking for sys/ioctl.h... yes
checking for paths.h... yes
checking for sys/capability.h... no
checking for sys/random.h... yes
checking for gshadow.h... yes
checking for lastlog.h... yes
checking for rpc/key_prot.h... yes
checking for acl/libacl.h... no
checking for attr/libattr.h... yes
checking for attr/error_context.h... yes
checking for shadow.h... yes
checking for arc4random_buf... no
checking for futimes... yes
checking for getentropy... yes
checking for getrandom... yes
checking for getspnam... yes
checking for getusershell... yes
checking for initgroups... yes
checking for lckpwdf... yes
checking for lutimes... yes
checking for mempcpy... yes
checking for setgroups... yes
checking for updwtmp... yes
checking for updwtmpx... yes
checking for innetgr... yes
checking for getspnam_r... yes
checking for rpmatch... yes
checking for memset_explicit... no
checking for explicit_bzero... yes
checking for stpecpy... no
checking for stpeprintf... no
checking for gcc  option to enable large file support... none needed
checking for struct utmp.ut_type... yes
checking for struct utmp.ut_id... yes
checking for struct utmp.ut_name... yes
checking for struct utmp.ut_user... yes
checking for struct utmp.ut_host... yes
checking for struct utmp.ut_syslen... no
checking for struct utmp.ut_addr... yes
checking for struct utmp.ut_addr_v6... yes
checking for struct utmp.ut_time... yes
checking for struct utmp.ut_xtime... yes
checking for struct utmp.ut_tv... yes
checking for uid_t... yes
checking for gid_t... yes
checking type of array argument to getgroups... gid_t
checking whether utime accepts a null argument... (cached) yes
checking for putgrent... yes
checking for putpwent... yes
checking for putspent... yes
checking for sgetgrent... no
checking for sgetpwent... no
checking for sgetspent... yes
checking for setpgrp... yes
checking for secure_getenv... yes
checking for working shadow group support... yes
checking location of shared mail directory... (cached) 
/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/var/spool/mail
checking location of user mail file... (cached) Mailbox
checking location of utmp... (cached) 
/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/var/run
checking location of faillog/lastlog/wtmp... (cached) 
/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/var/log
checking location of the passwd program... (cached) 
/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr/bin
checking for library containing gethostbyname... none required
checking for econf_readDirs in -leconf... no
checking size of uid_t... (cached) 4
checking size of gid_t... (cached) 4
checking for sd_session_get_remote_host in -lsystemd... yes
checking for crypt in -lcrypt... yes
checking for crypt in -lcrypt... (cached) yes
checking for library containing readpassphrase... -lbsd
checking for x86_64-linux-pkg-config... no
checking for pkg-config... 
/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr/bin/pkg-config
checking pkg-config is at least version 0.9.0... yes
checking for libbsd-overlay... yes
checking for readpassphrase.h... yes
checking for attr/libattr.h... (cached) yes
checking for attr/error_context.h... (cached) yes
checking for attr_copy_file in -lattr... yes
checking for attr_copy_fd in -lattr... yes
checking for sys/statfs.h... yes
checking for linux/magic.h... yes
checking for linux/btrfs_tree.h... yes
checking for tcb.h... no
checking use login and su access checking if PAM not used... yes
checking for fgetpwent_r... yes
checking whether NLS is requested... no
checking for msgfmt... no
checking for gmsgfmt... :
checking for xgettext... no
checking for msgmerge... no
checking for ld... ld  -m elf_x86_64
checking if the linker (ld  -m elf_x86_64) is GNU ld... yes
checking for shared library run path origin... done
checking 32-bit host C ABI... no
checking how to run the C preprocessor... gcc  -E
checking for egrep -e... (cached) 
/home/uvv/projects/upstream/poky-shadow/build/tmp/hosttools/grep -E
checking for ELF binary format... yes
checking for the common suffixes of directories in the library search 
path... lib,lib,lib64
checking for CFPreferencesCopyAppValue... no
checking for CFLocaleCopyCurrent... no
checking whether to use NLS... no
configure: creating ./config.status
config.status: creating Makefile
config.status: creating po/Makefile.in
config.status: creating doc/Makefile
config.status: creating man/Makefile
config.status: creating man/config.xml
config.status: creating man/po/Makefile
config.status: creating man/cs/Makefile
config.status: creating man/da/Makefile
config.status: creating man/de/Makefile
config.status: creating man/es/Makefile
config.status: creating man/fi/Makefile
config.status: creating man/fr/Makefile
config.status: creating man/hu/Makefile
config.status: creating man/id/Makefile
config.status: creating man/it/Makefile
config.status: creating man/ja/Makefile
config.status: creating man/ko/Makefile
config.status: creating man/pl/Makefile
config.status: creating man/pt_BR/Makefile
config.status: creating man/ru/Makefile
config.status: creating man/sv/Makefile
config.status: creating man/tr/Makefile
config.status: creating man/uk/Makefile
config.status: creating man/zh_CN/Makefile
config.status: creating man/zh_TW/Makefile
config.status: creating lib/Makefile
config.status: creating libsubid/Makefile
config.status: creating libsubid/subid.h
config.status: creating src/Makefile
config.status: creating contrib/Makefile
config.status: creating etc/Makefile
config.status: creating etc/pam.d/Makefile
config.status: creating etc/shadow-maint/Makefile
config.status: creating shadow.spec
config.status: creating config.h
config.status: executing depfiles commands
config.status: executing libtool commands
config.status: executing po-directories commands
config.status: creating po/POTFILES
config.status: creating po/Makefile

shadow will be compiled with the following features:

     auditing support:        no
     CrackLib support:        no
     PAM support:            no
     SELinux support:        no
     BtrFS support:            yes
     ACL support:            no
     Extended Attributes support:    yes
     tcb support (incomplete):    no
     shadow group support:        yes
     S/Key support:            no
     SHA passwords encryption:    yes
     bcrypt passwords encryption:    no
     yescrypt passwords encryption:    no
     nscd support:            no
     sssd support:            no
     subordinate IDs support:    yes
     enable lastlog:            no
     enable logind:            yes
     use file caps:            no
     install su:            yes
     enabled vendor dir:

DEBUG: Shell function do_configure finished
DEBUG: Executing python function do_qa_configure
NOTE: Checking autotools environment for common misconfiguration
NOTE: Checking configure output for unrecognised options
DEBUG: Python function do_qa_configure finished
DEBUG: Executing shell function autotools_postconfigure
DEBUG: Shell function autotools_postconfigure finished

On 08.02.2024 13:16, Richard Purdie wrote:
> I suspect some kind of host contamination and you have something
> installed on your distro which the rest of us don't.
>
> Can you share the do_configure logs?
>
> Cheers,
>
> Richard
>

--------------cuy5nOG7bGjLXTohj5u5HuaC
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">shadow-native configure log is below.<br>
      <br>
      DEBUG: Executing python function extend_recipe_sysroot<br>
      NOTE: Direct dependencies are
['/home/uvv/projects/upstream/poky-shadow/meta/recipes-core/gettext/gettext-minimal-native_0.22.4.bb:do_populate_sysroot',
'/home/uvv/projects/upstream/poky-shadow/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_populate_sysroot',
'/home/uvv/projects/upstream/poky-shadow/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot',
'virtual:native:/home/uvv/projects/upstream/poky-shadow/meta/recipes-devtools/autoconf/autoconf_2.72e.bb:do_populate_sysroot',
'virtual:native:/home/uvv/projects/upstream/poky-shadow/meta/recipes-devtools/automake/automake_1.16.5.bb:do_populate_sysroot',
'virtual:native:/home/uvv/projects/upstream/poky-shadow/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot',
'virtual:native:/home/uvv/projects/upstream/poky-shadow/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot',
'virtual:native:/home/uvv/projects/upstream/poky-shadow/meta/recipes-support/libbsd/libbsd_0.11.8.bb:do_populate_sysroot']<br>
      NOTE: Installed into sysroot: []<br>
      NOTE: Skipping as already exists in sysroot:
      ['gettext-minimal-native', 'libtool-native', 'm4-native',
      'quilt-native', 'texinfo-dummy-native', 'autoconf-native',
      'automake-native', 'gnu-config-native', 'pkgconfig-native',
      'xz-native', 'attr-native', 'libbsd-native', 'libmd-native']<br>
      DEBUG: Python function extend_recipe_sysroot finished<br>
      DEBUG: Executing shell function autotools_preconfigure<br>
      DEBUG: Shell function autotools_preconfigure finished<br>
      DEBUG: Executing python function autotools_aclocals<br>
      DEBUG: SITE files ['endian-little', 'common-linux',
      'common-glibc', 'bit-64', 'x86_64-linux', 'common']<br>
      DEBUG: Python function autotools_aclocals finished<br>
      DEBUG: Executing shell function do_configure<br>
      automake (GNU automake) 1.16.5<br>
      Copyright (C) 2021 Free Software Foundation, Inc.<br>
      License GPLv2+: GNU GPL version 2 or later
      <a class="moz-txt-link-rfc2396E" href="https://gnu.org/licenses/gpl-2.0.html">&lt;https://gnu.org/licenses/gpl-2.0.html&gt;</a><br>
      This is free software: you are free to change and redistribute it.<br>
      There is NO WARRANTY, to the extent permitted by law.<br>
      <br>
      Written by Tom Tromey <a class="moz-txt-link-rfc2396E" href="mailto:tromey@redhat.com">&lt;tromey@redhat.com&gt;</a><br>
             and Alexandre Duret-Lutz <a class="moz-txt-link-rfc2396E" href="mailto:adl@gnu.org">&lt;adl@gnu.org&gt;</a>.<br>
      AUTOV is 1.16<br>
      NOTE: Executing ACLOCAL="aclocal
--system-acdir=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr/share/aclocal/
--automake-acdir=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr/share/aclocal-1.16"
      autoreconf -Wcross --verbose --install --force --exclude=autopoint
      -I
/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/shadow-4.14.2/m4/<br>
      autoreconf: export WARNINGS=cross,no-obsolete<br>
      autoreconf: Entering directory '.'<br>
      autoreconf: running: aclocal
--system-acdir=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr/share/aclocal/
--automake-acdir=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr/share/aclocal-1.16
      -I
/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/shadow-4.14.2/m4/
      --force<br>
      autoreconf: configure.ac: tracing<br>
      autoreconf: running: libtoolize --copy --force<br>
      libtoolize: putting auxiliary files in '.'.<br>
      libtoolize: copying file './ltmain.sh'<br>
      libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'm4'.<br>
      libtoolize: copying file 'm4/libtool.m4'<br>
      libtoolize: copying file 'm4/ltoptions.m4'<br>
      libtoolize: copying file 'm4/ltsugar.m4'<br>
      libtoolize: copying file 'm4/ltversion.m4'<br>
      libtoolize: copying file 'm4/lt~obsolete.m4'<br>
      libtoolize: Consider adding '-I m4' to ACLOCAL_AMFLAGS in
      Makefile.am.<br>
      autoreconf: configure.ac: not using Intltool<br>
      autoreconf: configure.ac: not using Gtkdoc<br>
      autoreconf: running: aclocal
--system-acdir=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr/share/aclocal/
--automake-acdir=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr/share/aclocal-1.16
      -I
/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/shadow-4.14.2/m4/
      --force<br>
      autoreconf: running:
/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr/bin/autoconf
--include=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/shadow-4.14.2/m4/
      --force<br>
      autoreconf: running:
/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr/bin/autoheader
--include=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/shadow-4.14.2/m4/
      --force<br>
      autoreconf: running: automake --add-missing --copy --force-missing<br>
      configure.ac:23: installing './compile'<br>
      configure.ac:9: installing './missing'<br>
      lib/Makefile.am: installing './depcomp'<br>
      autoreconf: './install-sh' is updated<br>
      autoreconf: './config.sub' is updated<br>
      autoreconf: './config.guess' is updated<br>
      autoreconf: Leaving directory '.'<br>
      NOTE: Running ../shadow-4.14.2/configure  --build=x86_64-linux    
            --host=x86_64-linux           --target=x86_64-linux        
       
--prefix=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr
               
--exec_prefix=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr
               
--bindir=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr/bin
               
--sbindir=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr/sbin
           
--libexecdir=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr/libexec
               
--datadir=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr/share
               
--sysconfdir=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/etc
               
--sharedstatedir=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/com
               
--localstatedir=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/var
               
--libdir=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr/lib
               
--includedir=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr/include
               
--oldincludedir=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr/include
               
--infodir=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr/share/info
               
--mandir=/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr/share/man
                --disable-silent-rules          
      --disable-dependency-tracking            
      --without-libcrack                 
      --with-group-name-max-length=24                 
      --enable-subordinate-ids=yes                 
      --without-sssd                  --without-nscd --disable-static 
      --without-acl --with-attr --without-audit --with-libbsd
      --without-libpam --without-selinux --disable-nls<br>
      configure: loading site script
      /home/uvv/projects/upstream/poky-shadow/meta/site/endian-little<br>
      configure: loading site script
      /home/uvv/projects/upstream/poky-shadow/meta/site/common-linux<br>
      configure: loading site script
      /home/uvv/projects/upstream/poky-shadow/meta/site/common-glibc<br>
      configure: loading site script
      /home/uvv/projects/upstream/poky-shadow/meta/site/x86_64-linux<br>
      configure: loading site script
      /home/uvv/projects/upstream/poky-shadow/meta/site/common<br>
      checking for a BSD-compatible install...
      /home/uvv/projects/upstream/poky-shadow/build/tmp/hosttools/install
      -c<br>
      checking whether build environment is sane... yes<br>
      checking for a race-free mkdir -p...
      /home/uvv/projects/upstream/poky-shadow/build/tmp/hosttools/mkdir
      -p<br>
      checking for gawk... gawk<br>
      checking whether make sets $(MAKE)... yes<br>
      checking whether make supports nested variables... yes<br>
      checking whether make supports nested variables... (cached) yes<br>
      checking whether make supports the include directive... yes (GNU
      style)<br>
      checking for x86_64-linux-gcc... gcc<br>
      checking whether the C compiler works... yes<br>
      checking for C compiler default output file name... a.out<br>
      checking for suffix of executables...<br>
      checking whether we are cross compiling... no<br>
      checking for suffix of object files... o<br>
      checking whether the compiler supports GNU C... yes<br>
      checking whether gcc  accepts -g... yes<br>
      checking for gcc  option to enable C11 features... none needed<br>
      checking whether gcc  understands -c and -o together... yes<br>
      checking dependency style of gcc ... none<br>
      checking for stdio.h... yes<br>
      checking for stdlib.h... yes<br>
      checking for string.h... yes<br>
      checking for inttypes.h... yes<br>
      checking for stdint.h... yes<br>
      checking for strings.h... yes<br>
      checking for sys/stat.h... yes<br>
      checking for sys/types.h... yes<br>
      checking for unistd.h... yes<br>
      checking for wchar.h... yes<br>
      checking for minix/config.h... no<br>
      checking for utime.h... yes<br>
      checking whether it is safe to define __EXTENSIONS__... yes<br>
      checking whether _XOPEN_SOURCE should be defined... no<br>
      checking whether to enable maintainer-specific portions of
      Makefiles... no<br>
      checking for x86_64-linux-gcc... (cached) gcc<br>
      checking whether the compiler supports GNU C... (cached) yes<br>
      checking whether gcc  accepts -g... (cached) yes<br>
      checking for gcc  option to enable C11 features... (cached) none
      needed<br>
      checking whether gcc  understands -c and -o together... (cached)
      yes<br>
      checking dependency style of gcc ... (cached) none<br>
      checking whether ln -s works... yes<br>
      checking for bison... no<br>
      checking for byacc... no<br>
      checking build system type... x86_64-pc-linux-gnu<br>
      checking host system type... x86_64-pc-linux-gnu<br>
      checking how to print strings... printf<br>
      checking for a sed that does not truncate output... (cached) sed<br>
      checking for grep that handles long lines and -e...
      /home/uvv/projects/upstream/poky-shadow/build/tmp/hosttools/grep<br>
      checking for egrep...
      /home/uvv/projects/upstream/poky-shadow/build/tmp/hosttools/grep
      -E<br>
      checking for fgrep...
      /home/uvv/projects/upstream/poky-shadow/build/tmp/hosttools/grep
      -F<br>
      checking for ld used by gcc ... ld<br>
      checking if the linker (ld ) is GNU ld... yes<br>
      checking for BSD- or MS-compatible name lister (nm)... nm<br>
      checking the name lister (nm) interface... BSD nm<br>
      checking the maximum length of command line arguments... 1572864<br>
      checking how to convert x86_64-pc-linux-gnu file names to
      x86_64-pc-linux-gnu format... func_convert_file_noop<br>
      checking how to convert x86_64-pc-linux-gnu file names to
      toolchain format... func_convert_file_noop<br>
      checking for ld  option to reload object files... -r<br>
      checking for x86_64-linux-file... no<br>
      checking for file... file<br>
      checking for x86_64-linux-objdump... objdump<br>
      checking how to recognize dependent libraries... pass_all<br>
      checking for x86_64-linux-dlltool... no<br>
      checking for dlltool... no<br>
      checking how to associate runtime and link libraries... printf
      %s\n<br>
      checking for x86_64-linux-ar... ar<br>
      checking for archiver @FILE support... @<br>
      checking for x86_64-linux-strip... strip<br>
      checking for x86_64-linux-ranlib... ranlib -D<br>
      checking command to parse nm output from gcc  object... ok<br>
      checking for sysroot... no<br>
      checking for a working dd...
      /home/uvv/projects/upstream/poky-shadow/build/tmp/hosttools/dd<br>
      checking how to truncate binary pipes...
      /home/uvv/projects/upstream/poky-shadow/build/tmp/hosttools/dd
      bs=4096 count=1<br>
      checking for x86_64-linux-mt... no<br>
      checking for mt... no<br>
      checking if : is a manifest tool... no<br>
      checking for dlfcn.h... yes<br>
      checking for objdir... .libs<br>
      checking if gcc  supports -fno-rtti -fno-exceptions... no<br>
      checking for gcc  option to produce PIC... -fPIC -DPIC<br>
      checking if gcc  PIC flag -fPIC -DPIC works... yes<br>
      checking if gcc  static flag -static works... yes<br>
      checking if gcc  supports -c -o file.o... yes<br>
      checking if gcc  supports -c -o file.o... (cached) yes<br>
      checking whether the gcc  linker (ld  -m elf_x86_64) supports
      shared libraries... yes<br>
      checking whether -lc should be explicitly linked in... no<br>
      checking dynamic linker characteristics... GNU/Linux ld.so<br>
      checking how to hardcode library paths into programs... immediate<br>
      checking whether stripping libraries is possible... yes<br>
      checking if libtool supports shared libraries... yes<br>
      checking whether to build shared libraries... yes<br>
      checking whether to build static libraries... no<br>
      checking for crypt.h... yes<br>
      checking for utmp.h... yes<br>
      checking for termio.h... yes<br>
      checking for sgtty.h... yes<br>
      checking for sys/ioctl.h... yes<br>
      checking for paths.h... yes<br>
      checking for sys/capability.h... no<br>
      checking for sys/random.h... yes<br>
      checking for gshadow.h... yes<br>
      checking for lastlog.h... yes<br>
      checking for rpc/key_prot.h... yes<br>
      checking for acl/libacl.h... no<br>
      checking for attr/libattr.h... yes<br>
      checking for attr/error_context.h... yes<br>
      checking for shadow.h... yes<br>
      checking for arc4random_buf... no<br>
      checking for futimes... yes<br>
      checking for getentropy... yes<br>
      checking for getrandom... yes<br>
      checking for getspnam... yes<br>
      checking for getusershell... yes<br>
      checking for initgroups... yes<br>
      checking for lckpwdf... yes<br>
      checking for lutimes... yes<br>
      checking for mempcpy... yes<br>
      checking for setgroups... yes<br>
      checking for updwtmp... yes<br>
      checking for updwtmpx... yes<br>
      checking for innetgr... yes<br>
      checking for getspnam_r... yes<br>
      checking for rpmatch... yes<br>
      checking for memset_explicit... no<br>
      checking for explicit_bzero... yes<br>
      checking for stpecpy... no<br>
      checking for stpeprintf... no<br>
      checking for gcc  option to enable large file support... none
      needed<br>
      checking for struct utmp.ut_type... yes<br>
      checking for struct utmp.ut_id... yes<br>
      checking for struct utmp.ut_name... yes<br>
      checking for struct utmp.ut_user... yes<br>
      checking for struct utmp.ut_host... yes<br>
      checking for struct utmp.ut_syslen... no<br>
      checking for struct utmp.ut_addr... yes<br>
      checking for struct utmp.ut_addr_v6... yes<br>
      checking for struct utmp.ut_time... yes<br>
      checking for struct utmp.ut_xtime... yes<br>
      checking for struct utmp.ut_tv... yes<br>
      checking for uid_t... yes<br>
      checking for gid_t... yes<br>
      checking type of array argument to getgroups... gid_t<br>
      checking whether utime accepts a null argument... (cached) yes<br>
      checking for putgrent... yes<br>
      checking for putpwent... yes<br>
      checking for putspent... yes<br>
      checking for sgetgrent... no<br>
      checking for sgetpwent... no<br>
      checking for sgetspent... yes<br>
      checking for setpgrp... yes<br>
      checking for secure_getenv... yes<br>
      checking for working shadow group support... yes<br>
      checking location of shared mail directory... (cached)
/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/var/spool/mail<br>
      checking location of user mail file... (cached) Mailbox<br>
      checking location of utmp... (cached)
/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/var/run<br>
      checking location of faillog/lastlog/wtmp... (cached)
/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/var/log<br>
      checking location of the passwd program... (cached)
/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr/bin<br>
      checking for library containing gethostbyname... none required<br>
      checking for econf_readDirs in -leconf... no<br>
      checking size of uid_t... (cached) 4<br>
      checking size of gid_t... (cached) 4<br>
      checking for sd_session_get_remote_host in -lsystemd... yes<br>
      checking for crypt in -lcrypt... yes<br>
      checking for crypt in -lcrypt... (cached) yes<br>
      checking for library containing readpassphrase... -lbsd<br>
      checking for x86_64-linux-pkg-config... no<br>
      checking for pkg-config...
/home/uvv/projects/upstream/poky-shadow/build/tmp/work/x86_64-linux/shadow-native/4.14.2/recipe-sysroot-native/usr/bin/pkg-config<br>
      checking pkg-config is at least version 0.9.0... yes<br>
      checking for libbsd-overlay... yes<br>
      checking for readpassphrase.h... yes<br>
      checking for attr/libattr.h... (cached) yes<br>
      checking for attr/error_context.h... (cached) yes<br>
      checking for attr_copy_file in -lattr... yes<br>
      checking for attr_copy_fd in -lattr... yes<br>
      checking for sys/statfs.h... yes<br>
      checking for linux/magic.h... yes<br>
      checking for linux/btrfs_tree.h... yes<br>
      checking for tcb.h... no<br>
      checking use login and su access checking if PAM not used... yes<br>
      checking for fgetpwent_r... yes<br>
      checking whether NLS is requested... no<br>
      checking for msgfmt... no<br>
      checking for gmsgfmt... :<br>
      checking for xgettext... no<br>
      checking for msgmerge... no<br>
      checking for ld... ld  -m elf_x86_64<br>
      checking if the linker (ld  -m elf_x86_64) is GNU ld... yes<br>
      checking for shared library run path origin... done<br>
      checking 32-bit host C ABI... no<br>
      checking how to run the C preprocessor... gcc  -E<br>
      checking for egrep -e... (cached)
      /home/uvv/projects/upstream/poky-shadow/build/tmp/hosttools/grep
      -E<br>
      checking for ELF binary format... yes<br>
      checking for the common suffixes of directories in the library
      search path... lib,lib,lib64<br>
      checking for CFPreferencesCopyAppValue... no<br>
      checking for CFLocaleCopyCurrent... no<br>
      checking whether to use NLS... no<br>
      configure: creating ./config.status<br>
      config.status: creating Makefile<br>
      config.status: creating po/Makefile.in<br>
      config.status: creating doc/Makefile<br>
      config.status: creating man/Makefile<br>
      config.status: creating man/config.xml<br>
      config.status: creating man/po/Makefile<br>
      config.status: creating man/cs/Makefile<br>
      config.status: creating man/da/Makefile<br>
      config.status: creating man/de/Makefile<br>
      config.status: creating man/es/Makefile<br>
      config.status: creating man/fi/Makefile<br>
      config.status: creating man/fr/Makefile<br>
      config.status: creating man/hu/Makefile<br>
      config.status: creating man/id/Makefile<br>
      config.status: creating man/it/Makefile<br>
      config.status: creating man/ja/Makefile<br>
      config.status: creating man/ko/Makefile<br>
      config.status: creating man/pl/Makefile<br>
      config.status: creating man/pt_BR/Makefile<br>
      config.status: creating man/ru/Makefile<br>
      config.status: creating man/sv/Makefile<br>
      config.status: creating man/tr/Makefile<br>
      config.status: creating man/uk/Makefile<br>
      config.status: creating man/zh_CN/Makefile<br>
      config.status: creating man/zh_TW/Makefile<br>
      config.status: creating lib/Makefile<br>
      config.status: creating libsubid/Makefile<br>
      config.status: creating libsubid/subid.h<br>
      config.status: creating src/Makefile<br>
      config.status: creating contrib/Makefile<br>
      config.status: creating etc/Makefile<br>
      config.status: creating etc/pam.d/Makefile<br>
      config.status: creating etc/shadow-maint/Makefile<br>
      config.status: creating shadow.spec<br>
      config.status: creating config.h<br>
      config.status: executing depfiles commands<br>
      config.status: executing libtool commands<br>
      config.status: executing po-directories commands<br>
      config.status: creating po/POTFILES<br>
      config.status: creating po/Makefile<br>
      <br>
      shadow will be compiled with the following features:<br>
      <br>
          auditing support:        no<br>
          CrackLib support:        no<br>
          PAM support:            no<br>
          SELinux support:        no<br>
          BtrFS support:            yes<br>
          ACL support:            no<br>
          Extended Attributes support:    yes<br>
          tcb support (incomplete):    no<br>
          shadow group support:        yes<br>
          S/Key support:            no<br>
          SHA passwords encryption:    yes<br>
          bcrypt passwords encryption:    no<br>
          yescrypt passwords encryption:    no<br>
          nscd support:            no<br>
          sssd support:            no<br>
          subordinate IDs support:    yes<br>
          enable lastlog:            no<br>
          enable logind:            yes<br>
          use file caps:            no<br>
          install su:            yes<br>
          enabled vendor dir:<br>
      <br>
      DEBUG: Shell function do_configure finished<br>
      DEBUG: Executing python function do_qa_configure<br>
      NOTE: Checking autotools environment for common misconfiguration<br>
      NOTE: Checking configure output for unrecognised options<br>
      DEBUG: Python function do_qa_configure finished<br>
      DEBUG: Executing shell function autotools_postconfigure<br>
      DEBUG: Shell function autotools_postconfigure finished<br>
      <br>
      On 08.02.2024 13:16, Richard Purdie wrote:<span
      style="white-space: pre-wrap">
</span></div>
    <blockquote type="cite"
cite="mid:99fe5b08b06c72cf7bfc9818f2f415416f4419f4.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">I suspect some kind of host contamination and you have something
installed on your distro which the rest of us don't.

Can you share the do_configure logs?

Cheers,

Richard

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------cuy5nOG7bGjLXTohj5u5HuaC--

