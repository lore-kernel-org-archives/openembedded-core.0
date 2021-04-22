Received: from smtp.radiodata.biz (smtp.radiodata.biz [116.203.112.52])
 by mx.groups.io with SMTP id smtpd.web08.1399.1619114095738374217
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 10:54:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: radiodata.biz, ip: 116.203.112.52, mailfrom: cschneider@radiodata.biz)
Received: from localhost (localhost [127.0.0.1])
	by smtp.radiodata.biz (Postfix) with ESMTP id 061AD3EFD9
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Apr 2021 19:54:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smtp.radiodata.biz
Received: from smtp.radiodata.biz ([116.203.112.52])
	by localhost (smtp.radiodata.biz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ubwebCv_pMPX
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Apr 2021 19:54:46 +0200 (CEST)
Received: from mail.radiodata.biz (p578044f8.dip0.t-ipconnect.de [87.128.68.248])
	by smtp.radiodata.biz (Postfix) with ESMTPSA id 98DC43E8F8
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Apr 2021 19:54:46 +0200 (CEST)
Received: from [192.168.0.72] (ip5b403c63.dynamic.kabel-deutschland.de [91.64.60.99])
	by mail.radiodata.biz (Postfix) with ESMTPSA id 9CA8A2007F
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Apr 2021 19:54:45 +0200 (CEST)
Subject: jq in nativesdk
References: <e4f323fd-6924-c333-1a9e-820f4701d343@radiodata.biz>
To: openembedded-core@lists.openembedded.org
From: "Christian Schneider" <cschneider@radiodata.biz>
X-Forwarded-Message-Id: <e4f323fd-6924-c333-1a9e-820f4701d343@radiodata.biz>
Message-ID: <04af3911-74d8-d9be-d02b-e6ef195f591c@radiodata.biz>
Date: Thu, 22 Apr 2021 19:54:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <e4f323fd-6924-c333-1a9e-820f4701d343@radiodata.biz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi, I need jq in my SDK, unfortunately the oe jq recipe doesn't contain 
BBCLASSEXTEND += "nativesdk", so I added this to a bbappend in my local 
overlay. Did the same for onig(uruma), as this is required by jq.
onig seems to be fine, but nativesdk-jq itself fails in do_package:
NOTE: Executing RunQueue Tasks
ERROR: nativesdk-jq-1.5-r0 do_package: nativesdk-jq: chrpath command 
failed with exit code 7:
b'/home/yocto/radium/poky/build/tmp/work/x86_64-nativesdk-radiumsdk-linux/nativesdk-jq/1.5-r0/package/opt/radiumos/19.12/sysroots/x86_64-radiumsdk-linux/usr/bin/jq: 
RPATH=/home/yocto/radium/poky/build/tmp/work/x86_64-nativesdk-radiumsdk-linux/nativesdk-jq/1.5-r0/build/.libs\n'b"new 
rpath 
'$ORIGIN/../../../../../../../home/yocto/radium/poky/build/tmp/work/x86_64-nativesdk-radiumsdk-linux/nativesdk-jq/1.5-r0/build/.libs' 
too large; maximum length 103\n"
ERROR: nativesdk-jq-1.5-r0 do_package: Function failed: perform_packagecopy
ERROR: Logfile of failure stored in: 
/home/yocto/radium/poky/build/tmp/work/x86_64-nativesdk-radiumsdk-linux/nativesdk-jq/1.5-r0/temp/log.do_package.16121
ERROR: Task 
(virtual:nativesdk:/home/yocto/radium/meta-openembedded/meta-oe/recipes-devtools/jq/jq_1.5.bb:do_package) 
failed with exit code '1'


Mentionend log.do_package.16121 contains not much more info:
DEBUG: Executing python function sstate_task_prefunc
DEBUG: Python function sstate_task_prefunc finished
DEBUG: Executing python function extend_recipe_sysroot
NOTE: Direct dependencies are 
['/home/yocto/radium/poky/meta/recipes-devtools/gcc/gcc-crosssdk_8.2.bb:do_populate_sysroot', 
'virtual:native:/home/yocto/radium/poky/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_populate_sysroot', 
'virtual:native:/home/yocto/radium/poky/meta/recipes-devtools/autoconf/autoconf_2.69.bb:do_populate_sysroot', 
'/home/yocto/radium/poky/meta/recipes-devtools/libtool/libtool-native_2.4.6.bb:do_populate_sysroot', 
'virtual:nativesdk:/home/yocto/radium/poky/meta/recipes-devtools/gcc/gcc-runtime_8.2.bb:do_populate_sysroot', 
'virtual:native:/home/yocto/radium/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 
'virtual:nativesdk:/home/yocto/radium/meta-openembedded/meta-oe/recipes-support/onig/onig_5.9.6.bb:do_populate_sysroot', 
'virtual:native:/home/yocto/radium/poky/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_populate_sysroot', 
'/home/yocto/radium/poky/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_populate_sysroot', 
'virtual:nativesdk:/home/yocto/radium/poky/meta/recipes-core/glibc/glibc_2.28.bb:do_populate_sysroot', 
'virtual:native:/home/yocto/radium/poky/meta/recipes-devtools/automake/automake_1.16.1.bb:do_populate_sysroot', 
'virtual:native:/home/yocto/radium/poky/meta/recipes-devtools/chrpath/chrpath_0.16.bb:do_populate_sysroot', 
'virtual:native:/home/yocto/radium/poky/meta/recipes-devtools/rpm/rpm_4.14.2.bb:do_populate_sysroot']
NOTE: Installed into sysroot: ['dwarfsrcfiles-native', 'rpm-native', 
'elfutils-native', 'libarchive-native', 'nss-native', 'dbus-native', 
'popt-native', 'file-native', 'db-native', 'bzip2-native', 
'python3-native', 'lzo-native', 'e2fsprogs-native', 'nspr-native', 
'sqlite3-native', 'expat-native', 'openssl-native', 'gdbm-native', 
'readline-native', 'attr-native', 'util-linux-native', 'ncurses-native']
NOTE: Skipping as already exists in sysroot: 
['gcc-crosssdk-x86_64-radiumsdk-linux', 'gnu-config-native', 
'autoconf-native', 'libtool-native', 'nativesdk-gcc-runtime', 
'pseudo-native', 'nativesdk-onig', 'quilt-native', 'nativesdk-glibc', 
'automake-native', 'chrpath-native', 'flex-native', 'gmp-native', 
'gettext-native', 'binutils-crosssdk-x86_64-radiumsdk-linux', 
'zlib-native', 'xz-native', 'mpfr-native', 'libmpc-native', 
'nativesdk-linux-libc-headers', 'm4-native', 'texinfo-dummy-native', 
'nativesdk-libgcc', 'pkgconfig-native', 'gettext-minimal-native']
DEBUG: sed -e 
's:^[^/]*/:/home/yocto/radium/poky/build/tmp/work/x86_64-nativesdk-radiumsdk-linux/nativesdk-jq/1.5-r0/recipe-sysroot-native/:g' 
/home/yocto/radium/poky/build/tmp/sysroots-components/x86_64/rpm-native/fixmepath 
/home/yocto/radium/poky/build/tmp/sysroots-components/x86_64/elfutils-native/fixmepath 
/home/yocto/radium/poky/build/tmp/sysroots-components/x86_64/dbus-native/fixmepath 
/home/yocto/radium/poky/build/tmp/sysroots-components/x86_64/python3-native/fixmepath 
/home/yocto/radium/poky/build/tmp/sysroots-components/x86_64/e2fsprogs-native/fixmepath 
/home/yocto/radium/poky/build/tmp/sysroots-components/x86_64/nspr-native/fixmepath 
/home/yocto/radium/poky/build/tmp/sysroots-components/x86_64/openssl-native/fixmepath 
/home/yocto/radium/poky/build/tmp/sysroots-components/x86_64/ncurses-native/fixmepath 
| xargs sed -i -e 
's:FIXMESTAGINGDIRTARGET:/home/yocto/radium/poky/build/tmp/work/x86_64-nativesdk-radiumsdk-linux/nativesdk-jq/1.5-r0/recipe-sysroot:g; 
s:FIXMESTAGINGDIRHOST:/home/yocto/radium/poky/build/tmp/work/x86_64-nativesdk-radiumsdk-linux/nativesdk-jq/1.5-r0/recipe-sysroot-native:g' 
-e 
's:FIXME_COMPONENTS_DIR:/home/yocto/radium/poky/build/tmp/sysroots-components:g' 
-e 's:FIXME_HOSTTOOLS_DIR:/home/yocto/radium/poky/build/tmp/hosttools:g' 
-e 
's:FIXME_PKGDATA_DIR:/home/yocto/radium/poky/build/tmp/pkgdata/x86_64-radiumsdk-linux:g' 
-e 
's:FIXME_PSEUDO_LOCALSTATEDIR:/home/yocto/radium/poky/build/tmp/work/x86_64-nativesdk-radiumsdk-linux/nativesdk-jq/1.5-r0/pseudo/:g' 
-e 
's:FIXME_LOGFIFO:/home/yocto/radium/poky/build/tmp/work/x86_64-nativesdk-radiumsdk-linux/nativesdk-jq/1.5-r0/temp/fifo.16121:g'
DEBUG: Python function extend_recipe_sysroot finished
DEBUG: Executing python function do_package
DEBUG: Executing python function package_get_auto_pr
DEBUG: Python function package_get_auto_pr finished
DEBUG: Executing python function perform_packagecopy
ERROR: nativesdk-jq: chrpath command failed with exit code 7:
b'/home/yocto/radium/poky/build/tmp/work/x86_64-nativesdk-radiumsdk-linux/nativesdk-jq/1.5-r0/package/opt/radiumos/19.12/sysroots/x86_64-radiumsdk-linux/usr/bin/jq: 
RPATH=/home/yocto/radium/poky/build/tmp/work/x86_64-nativesdk-radiumsdk-linux/nativesdk-jq/1.5-r0/build/.libs\n'b"new 
rpath 
'$ORIGIN/../../../../../../../home/yocto/radium/poky/build/tmp/work/x86_64-nativesdk-radiumsdk-linux/nativesdk-jq/1.5-r0/build/.libs' 
too large; maximum length 103\n"
DEBUG: Python function perform_packagecopy finished
DEBUG: Python function do_package finished
ERROR: Function failed: perform_packagecopy


questions now are:
1) Is BBCLASSEXTEND += "nativesdk" in a bbappend file a good/right way 
to bring jq to my nativesdk, or are there different/alternative 
approaches to do this?
2) Is there a way to fix/work around this chrpath error?

Thanks in advance,
BR Christian
