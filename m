Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RQGu3-0002Yv-15
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 12:10:11 +0100
Received: from [192.168.1.15] (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 11B144B0295
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 12:03:46 +0100 (CET)
Message-ID: <4EC24711.2010805@eukrea.com>
Date: Tue, 15 Nov 2011 12:03:45 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: Reproducible build problem with BB_NUMBER_THREADS=8
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Nov 2011 11:10:11 -0000
X-Groupsio-MsgNum: 12474
Content-Type: multipart/mixed; boundary="------------070402040408010906090708"

--------------070402040408010906090708
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I often meet a problem related to C++ headers which are not found (despite 
existing)n often when bitbake starts compiling mysql & directfb.
I tested on 2 build hosts (both with Core i7, one i686 ubuntu, one x64_64 
Fedora) and manage to reproduce the problem easily with BB_NUMBER_THREADS=8 in 
both cases.

The configuration is quite simple :
angstrom setup script + beagleboard machine + bitbake qt4e-demo-image
with
PARALLEL_MAKE     = "-j6"
BB_NUMBER_THREADS = "8"

Please find attached the 2 logs :
- log1.txt (with one custom overlay containing a custom image) :
mysql fails with
| ../include/my_global.h:1516:15: fatal error: new: No such file or directory
the file exists :
build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/include/c++/new
it seems that include/c++ is not in the header search path
reducing BB_NUMBER_THREADS to 2 leads to the same kind of problem in libcgroup :
| libcg_ba.cpp:18:18: fatal error: string: No such file or directory
the file exists :
build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/include/c++/debug/string
=> the only solution was to remove tmp and start again with a reduced 
BB_NUMBER_THREADS

- log2.txt (plain oe-core + angstrom setup to remove the doubt of my overlay 
being the source of the problem) :
directfb fails with
mkdgifft.cpp:64:16: fatal error: list: No such file or directory
the file exists :
build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/include/c++/list
here again, it seems that include/c++ is not in the header search path
=> I reduced BB_NUMBER_THREADS to 1 and launched again bitbake (build actually 
in progress).

The workaround is to reduce BB_NUMBER_THREADS to <=4 which seems to never 
bring the problem (at least for a dozen of builds).

Does anyone meet the same problem ?
Any idea of what could be wrong here ?

Thanks,
Eric

--------------070402040408010906090708
Content-Type: text/plain;
 name="log1.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="log1.txt"

Buyild host :
CPU : Intel(R) Core(TM) i7-2720QM CPU @ 2.20GHz
RAM : 8GB
Distribution : Fedora release 15 (Lovelock) x86_64
Filesystem : /dev/mapper/vg_e6520eb-lv_home on /home type ext4 (rw,relatime,user_xattr,barrier=1,data=ordered)

PARALLEL_MAKE     = "-j6"
BB_NUMBER_THREADS = "8"

[ebenard@e6520eb setup-scripts]$ bitbake hardware-bringup-image eukrea-qtdemo-image qt4e-demo-image
OE Build Configuration:
BB_VERSION        = "1.15.0"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "beagleboard"
DISTRO            = "angstrom"
DISTRO_VERSION    = "v2011.11-core"
TUNE_FEATURES     = "armv7a vfp neon cortexa8"
TARGET_FPU        = "vfp-neon"
meta-angstrom     = "master:fcc61ee9da3c76db82fe780db9441555c8d5f115"
meta-oe           
meta-efl          
meta-gpe          
meta-gnome        
meta-xfce         = "master:1e93fb3cb6d716ad811bd26154fdcec42195c360"
meta-opie         = "master:bd11184f5b5a8037444b22019c73249a967a4eb7"
meta-ti           = "master:a0b13fc0e549390c8e2e24004117d0275a0bb966"
meta-ettus        = "master:f097bb61772d07610d84a668dc19a47e180962b3"
meta-efikamx      = "master:2ef47fdd4e8232d766c0c63d9427253ee56e31d0"
meta-nslu2        = "master:17853811179f2760791c6b138f96e9dd15493517"
meta-htc          
meta-nokia        
meta-openmoko     
meta-palm         = "master:11f5fab0c4e382c99e2fb89de5121a93d7031816"
meta-handheld     = "master:c83f57f0ec2b43c22f0fd628fe5ad17b330b972d"
meta-sugarbay     
meta-crownbay     
meta-emenlow      
meta-fishriver    
meta-jasperforest 
meta-n450         = "master:2a41ae377613b1f14829179f437aa76bbb1bc39e"
meta-eukrea       
meta-eukrea-cpuimx35 = "master:ddcc090984f1b55600aa948d6315e4b4815991ca"
meta              = "master:f2316ff39670ed99382411e15ac035550360fbdd"



| arm-angstrom-linux-gnueabi-g++  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 -mthumb-interwork -mno-thumb --sysroot=/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard -DDEFAULT_BASEDIR=\"/usr\" -DMYSQL_DATADIR="\"/var/mysql\"" -DDEFAULT_CHARSET_HOME="\"/usr\"" -DSHAREDIR="\"/usr/share/mysql\"" -DDEFAULT_HOME_ENV=MYSQL_HOME -DDEFAULT_GROUP_SUFFIX_ENV=MYSQL_GROUP_SUFFIX -DDEFAULT_SYSCONFDIR="\"/etc/mysql\"" -DHAVE_CONFIG_H -I. -I../include -I../include -I../include -I.    -O2 -pipe -g -feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidden -fvisibility-inlines-hidden   -fno-implicit-templates -fno-exceptions -fno-rtti -c -o my_new.o my_new.cc
| In file included from mysys_priv.h:16:0,
|                  from my_new.cc:21:
| ../include/my_global.h:1516:15: fatal error: new: No such file or directory
| compilation terminated.
| make[1]: *** [my_new.o] Error 1
| make[1]: Leaving directory `/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/mysql5-5.1.40-r5/mysql-5.1.40/mysys'
| make: *** [all-recursive] Error 1
| + die 'oe_runmake failed'
| + bbfatal 'oe_runmake failed'
| + echo 'ERROR: oe_runmake failed'
| ERROR: oe_runmake failed
| + exit 1
| 

ERROR: Function 'do_compile' failed (see /home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/mysql5-5.1.40-r5/temp/log.do_compile.23756 for further information)
NOTE: package mysql5-5.1.40-r5: task do_compile: Failed
NOTE: Running task 2008 of 4017 (ID: 1902, /home/ebenard/WORK/IMX/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/mysql/mysql5_5.1.40.bb, do_compile)
NOTE: package python-2.7.2-r0.2: task do_populate_sysroot: Started
NOTE: package gettext-0.18.1.1-r4: task do_install: Started
NOTE: package perl-5.14.2-r0: task do_install: Started
NOTE: package linux-3.0.9-r110a: task do_unpack: Started
NOTE: package mysql5-5.1.40-r5: task do_compile: Started
NOTE: package postgresql-8.4.7-r5.0: task do_install: Started
ERROR: Function 'do_compile' failed (see /home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/mysql5-5.1.40-r5/temp/log.do_compile.24230 for further information)
ERROR: Logfile of failure stored in: /home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/mysql5-5.1.40-r5/temp/log.do_compile.24230
Log data follows:
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
| + cd /home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/mysql5-5.1.40-r5/mysql-5.1.40
| + do_compile
| + base_do_compile
| + '[' -e Makefile -o -e makefile ']'
| + oe_runmake
| + '[' xmake = x ']'
| + bbnote make GEN_LEX_HASH=/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/bin/gen_lex_hash
| + echo 'NOTE: make GEN_LEX_HASH=/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/bin/gen_lex_hash'
| NOTE: make GEN_LEX_HASH=/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/bin/gen_lex_hash
| + make GEN_LEX_HASH=/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/bin/gen_lex_hash
| Making all in .
| make[1]: Entering directory `/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/mysql5-5.1.40-r5/mysql-5.1.40'
| make abi_headers="include/mysql/plugin.h include/mysql.h" do_abi_check
| make[2]: Entering directory `/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/mysql5-5.1.40-r5/mysql-5.1.40'
| set -ex; \
| for file in include/mysql/plugin.h include/mysql.h; do \
|          arm-angstrom-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 -mthumb-interwork -mno-thumb --sysroot=/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard -E -nostdinc -dI -DMYSQL_ABI_CHECK \
|                   -I./include \
|                   -I./include/mysql \
|                   -I./sql \
|                   -I./include \
|                   -I./include/mysql \
|                   -I./sql \
|                                  $file 2>/dev/null | \
|                   /bin/sed -e '/^# /d' \
|                             -e '/^[ 	]*$/d' \
|                             -e '/^#pragma GCC set_debug_pwd/d' \
|                             -e '/^#ident/d' > \
|                                        ./abi_check.out; \
|                   /usr/bin/diff -w $file.pp ./abi_check.out; \
|                   /bin/rm ./abi_check.out; \
| done
| + for file in include/mysql/plugin.h include/mysql.h
| + arm-angstrom-linux-gnueabi-gcc -march=armv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 -mthumb-interwork -mno-thumb --sysroot=/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard -E -nostdinc -dI -DMYSQL_ABI_CHECK -I./include -I./include/mysql -I./sql -I./include -I./include/mysql -I./sql include/mysql/plugin.h
| + /bin/sed -e '/^# /d' -e '/^[ 	]*$/d' -e '/^#pragma GCC set_debug_pwd/d' -e '/^#ident/d'
| + /usr/bin/diff -w include/mysql/plugin.h.pp ./abi_check.out
| + /bin/rm ./abi_check.out
| + for file in include/mysql/plugin.h include/mysql.h
| + arm-angstrom-linux-gnueabi-gcc -march=armv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 -mthumb-interwork -mno-thumb --sysroot=/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard -E -nostdinc -dI -DMYSQL_ABI_CHECK -I./include -I./include/mysql -I./sql -I./include -I./include/mysql -I./sql include/mysql.h
| + /bin/sed -e '/^# /d' -e '/^[ 	]*$/d' -e '/^#pragma GCC set_debug_pwd/d' -e '/^#ident/d'
| + /usr/bin/diff -w include/mysql.h.pp ./abi_check.out
| + /bin/rm ./abi_check.out
| make[2]: Leaving directory `/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/mysql5-5.1.40-r5/mysql-5.1.40'
| make[1]: Leaving directory `/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/mysql5-5.1.40-r5/mysql-5.1.40'
| Making all in include
| make[1]: Entering directory `/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/mysql5-5.1.40-r5/mysql-5.1.40/include'
| make  all-am
| make[2]: Entering directory `/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/mysql5-5.1.40-r5/mysql-5.1.40/include'
| make[2]: Leaving directory `/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/mysql5-5.1.40-r5/mysql-5.1.40/include'
| make[1]: Leaving directory `/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/mysql5-5.1.40-r5/mysql-5.1.40/include'
| Making all in cmd-line-utils
| make[1]: Entering directory `/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/mysql5-5.1.40-r5/mysql-5.1.40/cmd-line-utils'
| Making all in libedit
| make[2]: Entering directory `/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/mysql5-5.1.40-r5/mysql-5.1.40/cmd-line-utils/libedit'
| make[2]: Nothing to be done for `all'.
| make[2]: Leaving directory `/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/mysql5-5.1.40-r5/mysql-5.1.40/cmd-line-utils/libedit'
| make[2]: Entering directory `/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/mysql5-5.1.40-r5/mysql-5.1.40/cmd-line-utils'
| make[2]: Nothing to be done for `all-am'.
| make[2]: Leaving directory `/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/mysql5-5.1.40-r5/mysql-5.1.40/cmd-line-utils'
| make[1]: Leaving directory `/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/mysql5-5.1.40-r5/mysql-5.1.40/cmd-line-utils'
| Making all in sql-common
| make[1]: Entering directory `/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/mysql5-5.1.40-r5/mysql-5.1.40/sql-common'
| make[1]: Nothing to be done for `all'.
| make[1]: Leaving directory `/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/mysql5-5.1.40-r5/mysql-5.1.40/sql-common'
| Making all in scripts
| make[1]: Entering directory `/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/mysql5-5.1.40-r5/mysql-5.1.40/scripts'
| make  all-am
| make[2]: Entering directory `/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/mysql5-5.1.40-r5/mysql-5.1.40/scripts'
| make[2]: Nothing to be done for `all-am'.
| make[2]: Leaving directory `/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/mysql5-5.1.40-r5/mysql-5.1.40/scripts'
| make[1]: Leaving directory `/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/mysql5-5.1.40-r5/mysql-5.1.40/scripts'
| Making all in strings
| make[1]: Entering directory `/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/mysql5-5.1.40-r5/mysql-5.1.40/strings'
| make[1]: Nothing to be done for `all'.
| make[1]: Leaving directory `/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/mysql5-5.1.40-r5/mysql-5.1.40/strings'
| Making all in mysys
| make[1]: Entering directory `/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/mysql5-5.1.40-r5/mysql-5.1.40/mysys'
| arm-angstrom-linux-gnueabi-g++  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 -mthumb-interwork -mno-thumb --sysroot=/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard -DDEFAULT_BASEDIR=\"/usr\" -DMYSQL_DATADIR="\"/var/mysql\"" -DDEFAULT_CHARSET_HOME="\"/usr\"" -DSHAREDIR="\"/usr/share/mysql\"" -DDEFAULT_HOME_ENV=MYSQL_HOME -DDEFAULT_GROUP_SUFFIX_ENV=MYSQL_GROUP_SUFFIX -DDEFAULT_SYSCONFDIR="\"/etc/mysql\"" -DHAVE_CONFIG_H -I. -I../include -I../include -I../include -I.    -O2 -pipe -g -feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidden -fvisibility-inlines-hidden   -fno-implicit-templates -fno-exceptions -fno-rtti -c -o my_new.o my_new.cc
| In file included from mysys_priv.h:16:0,
|                  from my_new.cc:21:
| ../include/my_global.h:1516:15: fatal error: new: No such file or directory
| compilation terminated.
| make[1]: *** [my_new.o] Error 1
| make[1]: Leaving directory `/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/mysql5-5.1.40-r5/mysql-5.1.40/mysys'
| make: *** [all-recursive] Error 1
| + die 'oe_runmake failed'
| + bbfatal 'oe_runmake failed'
| + echo 'ERROR: oe_runmake failed'
| ERROR: oe_runmake failed
| + exit 1
| ERROR: Function 'do_compile' failed (see /home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/mysql5-5.1.40-r5/temp/log.do_compile.24230 for further information)
NOTE: package mysql5-5.1.40-r5: task do_compile: Failed
ERROR: Task 1902 (/home/ebenard/WORK/IMX/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/mysql/mysql5_5.1.40.bb, do_compile) failed with exit code '1'
Waiting for 5 active tasks to finish:
0: postgresql-8.4.7-r5.0 do_install (pid 24227)
1: python-2.7.2-r0.2 do_populate_sysroot (pid 24136)
2: gettext-0.18.1.1-r4 do_install (pid 24106)
3: perl-5.14.2-r0 do_install (pid 24172)
4: linux-3.0.9-r110a do_unpack (pid 24118)
Waiting for 4 active tasks to finish:
0: postgresql-8.4.7-r5.0 do_install (pid 24227)
1: gettext-0.18.1.1-r4 do_install (pid 24106)
2: perl-5.14.2-r0 do_install (pid 24172)
3: linux-3.0.9-r110a do_unpack (pid 24118)
NOTE: package python-2.7.2-r0.2: task do_populate_sysroot: Succeeded
Waiting for 3 active tasks to finish:
0: postgresql-8.4.7-r5.0 do_install (pid 24227)
1: gettext-0.18.1.1-r4 do_install (pid 24106)
2: linux-3.0.9-r110a do_unpack (pid 24118)
NOTE: package perl-5.14.2-r0: task do_install: Succeeded
Waiting for 2 active tasks to finish:
0: gettext-0.18.1.1-r4 do_install (pid 24106)
1: linux-3.0.9-r110a do_unpack (pid 24118)
NOTE: package postgresql-8.4.7-r5.0: task do_install: Succeeded
Waiting for 1 active tasks to finish:
0: gettext-0.18.1.1-r4 do_install (pid 24106)
NOTE: package linux-3.0.9-r110a: task do_unpack: Succeeded
NOTE: package gettext-0.18.1.1-r4: task do_install: Succeeded
ERROR: '/home/ebenard/WORK/IMX/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/mysql/mysql5_5.1.40.bb' failed


[ebenard@e6520eb setup-scripts]$ find build/tmp-angstrom_2010_x-eglibc/sysroots/ -iname new
build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/include/c++/new
build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/share/quilt/new

*****>>>> launched with BB_NUMBER_THREADS = "2"
PARALLEL_MAKE     = "-j6"
BB_NUMBER_THREADS = "2"

NOTE: Running task 1064 of 4017 (ID: 1325, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-core/gettext/gettext_0.18.1.1.bb, do_populate_sysroot)
NOTE: Running task 1445 of 4017 (ID: 674, /home/ebenard/WORK/IMX/setup-scripts/sources/meta-ti/recipes-kernel/linux/linux_3.0.bb, do_patch)
NOTE: package gettext-0.18.1.1-r4: task do_populate_sysroot: Started
NOTE: package linux-3.0.9-r110a: task do_patch: Started
NOTE: package gettext-0.18.1.1-r4: task do_populate_sysroot: Succeeded
NOTE: Running task 1446 of 4017 (ID: 1653, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-devtools/flex/flex_2.5.35.bb, do_configure)
NOTE: package flex-2.5.35-r2: task do_configure: Started
NOTE: package linux-3.0.9-r110a: task do_patch: Succeeded
NOTE: Running task 1447 of 4017 (ID: 2708, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.8.18.bb, do_configure)
NOTE: package cracklib-2.8.18-r1: task do_configure: Started
NOTE: package flex-2.5.35-r2: task do_configure: Succeeded
NOTE: Running task 1448 of 4017 (ID: 1654, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-devtools/flex/flex_2.5.35.bb, do_compile)
NOTE: package flex-2.5.35-r2: task do_compile: Started
NOTE: package flex-2.5.35-r2: task do_compile: Succeeded
NOTE: Running task 1449 of 4017 (ID: 1649, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-devtools/flex/flex_2.5.35.bb, do_install)
NOTE: package flex-2.5.35-r2: task do_install: Started
NOTE: package flex-2.5.35-r2: task do_install: Succeeded
NOTE: Running task 1450 of 4017 (ID: 1650, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-devtools/flex/flex_2.5.35.bb, do_populate_sysroot)
NOTE: package flex-2.5.35-r2: task do_populate_sysroot: Started
NOTE: package flex-2.5.35-r2: task do_populate_sysroot: Succeeded
NOTE: Running task 1451 of 4017 (ID: 2695, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-devtools/bison/bison_2.5.bb, do_configure)
NOTE: package bison-2.5-r1: task do_configure: Started
NOTE: package cracklib-2.8.18-r1: task do_configure: Succeeded
NOTE: Running task 1452 of 4017 (ID: 2709, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.8.18.bb, do_compile)
NOTE: package cracklib-2.8.18-r1: task do_compile: Started
NOTE: package cracklib-2.8.18-r1: task do_compile: Succeeded
NOTE: Running task 1453 of 4017 (ID: 2704, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.8.18.bb, do_install)
NOTE: package cracklib-2.8.18-r1: task do_install: Started
NOTE: package cracklib-2.8.18-r1: task do_install: Succeeded
NOTE: Running task 1454 of 4017 (ID: 2705, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.8.18.bb, do_populate_sysroot)
NOTE: package cracklib-2.8.18-r1: task do_populate_sysroot: Started
NOTE: package cracklib-2.8.18-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 1455 of 4017 (ID: 3346, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb, do_configure)
NOTE: package libxdmcp-1_1.1.0-r0: task do_configure: Started
NOTE: package libxdmcp-1_1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1456 of 4017 (ID: 3347, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb, do_compile)
NOTE: package libxdmcp-1_1.1.0-r0: task do_compile: Started
NOTE: package libxdmcp-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1457 of 4017 (ID: 3342, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb, do_install)
NOTE: package libxdmcp-1_1.1.0-r0: task do_install: Started
NOTE: package libxdmcp-1_1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1458 of 4017 (ID: 3343, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb, do_populate_sysroot)
NOTE: package libxdmcp-1_1.1.0-r0: task do_populate_sysroot: Started
NOTE: package libxdmcp-1_1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1459 of 4017 (ID: 3333, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.2.6.bb, do_configure)
NOTE: package xtrans-1_1.2.6-r0: task do_configure: Started
NOTE: package xtrans-1_1.2.6-r0: task do_configure: Succeeded
NOTE: Running task 1460 of 4017 (ID: 3334, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.2.6.bb, do_compile)
NOTE: package xtrans-1_1.2.6-r0: task do_compile: Started
NOTE: package xtrans-1_1.2.6-r0: task do_compile: Succeeded
NOTE: Running task 1461 of 4017 (ID: 3329, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.2.6.bb, do_install)
NOTE: package xtrans-1_1.2.6-r0: task do_install: Started
NOTE: package xtrans-1_1.2.6-r0: task do_install: Succeeded
NOTE: Running task 1462 of 4017 (ID: 3330, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.2.6.bb, do_populate_sysroot)
NOTE: package xtrans-1_1.2.6-r0: task do_populate_sysroot: Started
NOTE: package xtrans-1_1.2.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1463 of 4017 (ID: 3359, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb, do_configure)
NOTE: package libxau-1_1.0.6-r0: task do_configure: Started
NOTE: package bison-2.5-r1: task do_configure: Succeeded
NOTE: Running task 1464 of 4017 (ID: 2696, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-devtools/bison/bison_2.5.bb, do_compile)
NOTE: package bison-2.5-r1: task do_compile: Started
NOTE: package bison-2.5-r1: task do_compile: Succeeded
NOTE: Running task 1465 of 4017 (ID: 2691, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-devtools/bison/bison_2.5.bb, do_install)
NOTE: package bison-2.5-r1: task do_install: Started
NOTE: package bison-2.5-r1: task do_install: Succeeded
NOTE: Running task 1466 of 4017 (ID: 2692, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-devtools/bison/bison_2.5.bb, do_populate_sysroot)
NOTE: package bison-2.5-r1: task do_populate_sysroot: Started
NOTE: package bison-2.5-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 1467 of 4017 (ID: 1250, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-extended/pam/libpam_1.1.4.bb, do_configure)
NOTE: package libpam-1.1.4-r2: task do_configure: Started
NOTE: package libxau-1_1.0.6-r0: task do_configure: Succeeded
NOTE: Running task 1468 of 4017 (ID: 3360, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb, do_compile)
NOTE: package libxau-1_1.0.6-r0: task do_compile: Started
NOTE: package libxau-1_1.0.6-r0: task do_compile: Succeeded
NOTE: Running task 1469 of 4017 (ID: 3355, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb, do_install)
NOTE: package libxau-1_1.0.6-r0: task do_install: Started
NOTE: package libxau-1_1.0.6-r0: task do_install: Succeeded
NOTE: Running task 1470 of 4017 (ID: 3356, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb, do_populate_sysroot)
NOTE: package libxau-1_1.0.6-r0: task do_populate_sysroot: Started
NOTE: package libxau-1_1.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1471 of 4017 (ID: 1680, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-core/util-linux/util-linux_2.19.1.bb, do_configure)
NOTE: package util-linux-2.19.1-r10: task do_configure: Started
NOTE: package libpam-1.1.4-r2: task do_configure: Succeeded
NOTE: Running task 1472 of 4017 (ID: 1251, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-extended/pam/libpam_1.1.4.bb, do_compile)
NOTE: package libpam-1.1.4-r2: task do_compile: Started
NOTE: package util-linux-2.19.1-r10: task do_configure: Succeeded
NOTE: Running task 1473 of 4017 (ID: 1681, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-core/util-linux/util-linux_2.19.1.bb, do_compile)
NOTE: package util-linux-2.19.1-r10: task do_compile: Started
NOTE: package libpam-1.1.4-r2: task do_compile: Succeeded
NOTE: Running task 1474 of 4017 (ID: 1246, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-extended/pam/libpam_1.1.4.bb, do_install)
NOTE: package libpam-1.1.4-r2: task do_install: Started
NOTE: package util-linux-2.19.1-r10: task do_compile: Succeeded
NOTE: Running task 1475 of 4017 (ID: 1675, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-core/util-linux/util-linux_2.19.1.bb, do_install)
NOTE: package util-linux-2.19.1-r10: task do_install: Started
NOTE: package util-linux-2.19.1-r10: task do_install: Succeeded
NOTE: Running task 1476 of 4017 (ID: 1676, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-core/util-linux/util-linux_2.19.1.bb, do_populate_sysroot)
NOTE: package util-linux-2.19.1-r10: task do_populate_sysroot: Started
NOTE: package libpam-1.1.4-r2: task do_install: Succeeded
NOTE: Running task 1477 of 4017 (ID: 1247, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-extended/pam/libpam_1.1.4.bb, do_populate_sysroot)
NOTE: package util-linux-2.19.1-r10: task do_populate_sysroot: Succeeded
NOTE: Running task 1478 of 4017 (ID: 3398, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xextproto_7.2.0.bb, do_configure)
NOTE: package libpam-1.1.4-r2: task do_populate_sysroot: Started
NOTE: package xextproto-1_7.2.0-r0: task do_configure: Started
NOTE: package libpam-1.1.4-r2: task do_populate_sysroot: Succeeded
NOTE: Running task 1479 of 4017 (ID: 261, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-extended/shadow/shadow_4.1.4.3.bb, do_configure)
NOTE: package shadow-4.1.4.3-r5: task do_configure: Started
NOTE: package xextproto-1_7.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1480 of 4017 (ID: 3399, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xextproto_7.2.0.bb, do_compile)
NOTE: package xextproto-1_7.2.0-r0: task do_compile: Started
NOTE: package xextproto-1_7.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1481 of 4017 (ID: 3394, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xextproto_7.2.0.bb, do_install)
NOTE: package xextproto-1_7.2.0-r0: task do_install: Started
NOTE: package xextproto-1_7.2.0-r0: task do_install: Succeeded
NOTE: Running task 1482 of 4017 (ID: 3395, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xextproto_7.2.0.bb, do_populate_sysroot)
NOTE: package xextproto-1_7.2.0-r0: task do_populate_sysroot: Started
NOTE: package xextproto-1_7.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1483 of 4017 (ID: 3463, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/libxcb_1.7.bb, do_configure)
NOTE: package libxcb-1.7-r2: task do_configure: Started
NOTE: package libxcb-1.7-r2: task do_configure: Succeeded
NOTE: Running task 1484 of 4017 (ID: 3464, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/libxcb_1.7.bb, do_compile)
NOTE: package libxcb-1.7-r2: task do_compile: Started
NOTE: package shadow-4.1.4.3-r5: task do_configure: Succeeded
NOTE: Running task 1485 of 4017 (ID: 262, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-extended/shadow/shadow_4.1.4.3.bb, do_compile)
NOTE: package shadow-4.1.4.3-r5: task do_compile: Started
NOTE: package shadow-4.1.4.3-r5: task do_compile: Succeeded
NOTE: Running task 1486 of 4017 (ID: 257, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-extended/shadow/shadow_4.1.4.3.bb, do_install)
NOTE: package shadow-4.1.4.3-r5: task do_install: Started
NOTE: package shadow-4.1.4.3-r5: task do_install: Succeeded
NOTE: Running task 1487 of 4017 (ID: 258, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-extended/shadow/shadow_4.1.4.3.bb, do_populate_sysroot)
NOTE: package shadow-4.1.4.3-r5: task do_populate_sysroot: Started
NOTE: package shadow-4.1.4.3-r5: task do_populate_sysroot: Succeeded
NOTE: Running task 1488 of 4017 (ID: 2721, virtual:native:/home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-core/dbus/dbus_1.4.12.bb, do_configure)
NOTE: package dbus-native-1.4.12-r7: task do_configure: Started
NOTE: package libxcb-1.7-r2: task do_compile: Succeeded
NOTE: Running task 1489 of 4017 (ID: 3459, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/libxcb_1.7.bb, do_install)
NOTE: package libxcb-1.7-r2: task do_install: Started
NOTE: package libxcb-1.7-r2: task do_install: Succeeded
NOTE: Running task 1490 of 4017 (ID: 3460, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/libxcb_1.7.bb, do_populate_sysroot)
NOTE: package libxcb-1.7-r2: task do_populate_sysroot: Started
NOTE: package libxcb-1.7-r2: task do_populate_sysroot: Succeeded
NOTE: Running task 1491 of 4017 (ID: 3450, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/inputproto_2.0.2.bb, do_configure)
NOTE: package inputproto-1_2.0.2-r0: task do_configure: Started
NOTE: package dbus-native-1.4.12-r7: task do_configure: Succeeded
NOTE: Running task 1492 of 4017 (ID: 2722, virtual:native:/home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-core/dbus/dbus_1.4.12.bb, do_compile)
NOTE: package dbus-native-1.4.12-r7: task do_compile: Started
NOTE: package inputproto-1_2.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1493 of 4017 (ID: 3451, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/inputproto_2.0.2.bb, do_compile)
NOTE: package inputproto-1_2.0.2-r0: task do_compile: Started
NOTE: package inputproto-1_2.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1494 of 4017 (ID: 3446, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/inputproto_2.0.2.bb, do_install)
NOTE: package inputproto-1_2.0.2-r0: task do_install: Started
NOTE: package inputproto-1_2.0.2-r0: task do_install: Succeeded
NOTE: Running task 1495 of 4017 (ID: 3447, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/inputproto_2.0.2.bb, do_populate_sysroot)
NOTE: package inputproto-1_2.0.2-r0: task do_populate_sysroot: Started
NOTE: package inputproto-1_2.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1496 of 4017 (ID: 2669, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb, do_configure)
NOTE: package libx11-1.4.4-r0: task do_configure: Started
NOTE: package dbus-native-1.4.12-r7: task do_compile: Succeeded
NOTE: Running task 1497 of 4017 (ID: 2717, virtual:native:/home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-core/dbus/dbus_1.4.12.bb, do_install)
NOTE: package dbus-native-1.4.12-r7: task do_install: Started
NOTE: package dbus-native-1.4.12-r7: task do_install: Succeeded
NOTE: Running task 1498 of 4017 (ID: 2718, virtual:native:/home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-core/dbus/dbus_1.4.12.bb, do_populate_sysroot)
NOTE: package dbus-native-1.4.12-r7: task do_populate_sysroot: Started
NOTE: package dbus-native-1.4.12-r7: task do_populate_sysroot: Succeeded
NOTE: Running noexec task 1499 of 4017 (ID: 2724, virtual:native:/home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-core/dbus/dbus_1.4.12.bb, do_package)
NOTE: Running noexec task 1500 of 4017 (ID: 2723, virtual:native:/home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-core/dbus/dbus_1.4.12.bb, do_package_write)
NOTE: Running noexec task 1501 of 4017 (ID: 2720, virtual:native:/home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-core/dbus/dbus_1.4.12.bb, do_build)
NOTE: Running task 1502 of 4017 (ID: 2725, virtual:native:/home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-core/dbus/dbus_1.4.12.bb, do_rm_work)
NOTE: package dbus-native-1.4.12-r7: task do_rm_work: Started
NOTE: package dbus-native-1.4.12-r7: task do_rm_work: Succeeded
NOTE: Running task 1503 of 4017 (ID: 2499, virtual:native:/home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb, do_configure)
NOTE: package glib-2.0-native-1_2.30.0-r3: task do_configure: Started
NOTE: package libx11-1.4.4-r0: task do_configure: Succeeded
NOTE: Running task 1504 of 4017 (ID: 2670, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb, do_compile)
NOTE: package libx11-1.4.4-r0: task do_compile: Started
NOTE: package glib-2.0-native-1_2.30.0-r3: task do_configure: Succeeded
NOTE: Running task 1505 of 4017 (ID: 2500, virtual:native:/home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb, do_compile)
NOTE: package glib-2.0-native-1_2.30.0-r3: task do_compile: Started
NOTE: package libx11-1.4.4-r0: task do_compile: Succeeded
NOTE: Running task 1506 of 4017 (ID: 2665, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb, do_install)
NOTE: package libx11-1.4.4-r0: task do_install: Started
NOTE: package libx11-1.4.4-r0: task do_install: Succeeded
NOTE: Running task 1507 of 4017 (ID: 2666, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb, do_populate_sysroot)
NOTE: package libx11-1.4.4-r0: task do_populate_sysroot: Started
NOTE: package glib-2.0-native-1_2.30.0-r3: task do_compile: Succeeded
NOTE: Running task 1508 of 4017 (ID: 2495, virtual:native:/home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb, do_install)
NOTE: package glib-2.0-native-1_2.30.0-r3: task do_install: Started
NOTE: package libx11-1.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1509 of 4017 (ID: 574, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb, do_configure)
NOTE: package e2fsprogs-1.41.14-r3: task do_configure: Started
NOTE: package glib-2.0-native-1_2.30.0-r3: task do_install: Succeeded
NOTE: Running task 1510 of 4017 (ID: 2496, virtual:native:/home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb, do_populate_sysroot)
NOTE: package glib-2.0-native-1_2.30.0-r3: task do_populate_sysroot: Started
NOTE: package glib-2.0-native-1_2.30.0-r3: task do_populate_sysroot: Succeeded
NOTE: Running noexec task 1511 of 4017 (ID: 2502, virtual:native:/home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb, do_package)
NOTE: Running noexec task 1512 of 4017 (ID: 2501, virtual:native:/home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb, do_package_write)
NOTE: Running noexec task 1513 of 4017 (ID: 2498, virtual:native:/home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb, do_build)
NOTE: Running task 1514 of 4017 (ID: 2503, virtual:native:/home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb, do_rm_work)
NOTE: package glib-2.0-native-1_2.30.0-r3: task do_rm_work: Started
NOTE: package glib-2.0-native-1_2.30.0-r3: task do_rm_work: Succeeded
NOTE: Running task 1515 of 4017 (ID: 1079, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.15.bb, do_configure)
NOTE: package desktop-file-utils-native-0.15-r0: task do_configure: Started
NOTE: package e2fsprogs-1.41.14-r3: task do_configure: Succeeded
NOTE: Running task 1516 of 4017 (ID: 575, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb, do_compile)
NOTE: package e2fsprogs-1.41.14-r3: task do_compile: Started
NOTE: package desktop-file-utils-native-0.15-r0: task do_configure: Succeeded
NOTE: Running task 1517 of 4017 (ID: 1080, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.15.bb, do_compile)
NOTE: package desktop-file-utils-native-0.15-r0: task do_compile: Started
NOTE: package desktop-file-utils-native-0.15-r0: task do_compile: Succeeded
NOTE: Running task 1518 of 4017 (ID: 1075, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.15.bb, do_install)
NOTE: package desktop-file-utils-native-0.15-r0: task do_install: Started
NOTE: package desktop-file-utils-native-0.15-r0: task do_install: Succeeded
NOTE: Running task 1519 of 4017 (ID: 1076, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.15.bb, do_populate_sysroot)
NOTE: package desktop-file-utils-native-0.15-r0: task do_populate_sysroot: Started
NOTE: package desktop-file-utils-native-0.15-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1520 of 4017 (ID: 1630, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.1.bb, do_package)
NOTE: package linux-libc-headers-3.1-r1: task do_package: Started
NOTE: package e2fsprogs-1.41.14-r3: task do_compile: Succeeded
NOTE: Running task 1521 of 4017 (ID: 669, /home/ebenard/WORK/IMX/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/libgcc_4.5.bb, do_package)
NOTE: package linux-libc-headers-3.1-r1: task do_package: Succeeded
NOTE: Running task 1522 of 4017 (ID: 1633, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.1.bb, do_package_write_ipk)
NOTE: package linux-libc-headers-3.1-r1: task do_package_write_ipk: Started
NOTE: package libgcc-4.5-r43+svnr178923: task do_package: Started
WARNING: For recipe libgcc, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/src
WARNING:   /usr/src/debug
NOTE: package linux-libc-headers-3.1-r1: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 1523 of 4017 (ID: 1629, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.1.bb, do_package_write)
NOTE: Running task 1524 of 4017 (ID: 1110, /home/ebenard/WORK/IMX/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/eglibc_2.12.bb, do_package)
WARNING: QA Issue: No GNU_HASH in the elf binary: '/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/libgcc-4.5-r43+svnr178923/packages-split/libgcc/lib/libgcc_s.so.1'
NOTE: package eglibc-2.12-r27: task do_package: Started
NOTE: package libgcc-4.5-r43+svnr178923: task do_package: Succeeded
NOTE: Running task 1525 of 4017 (ID: 630, /home/ebenard/WORK/IMX/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-runtime_4.5.bb, do_package)
NOTE: package gcc-runtime-4.5-r43+svnr178923: task do_package: Started


| #	source='test_functions.c' object='test_functions.o' libtool=no
| arm-angstrom-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 -mthumb-interwork -mno-thumb --sysroot=/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard -DHAVE_CONFIG_H -I. -I.. -I../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c test_functions.c
| ../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=link arm-angstrom-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 -mthumb-interwork -mno-thumb --sysroot=/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard  -O2 -pipe -g -feliminate-unused-debug-types -Wall  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o libcgrouptest01 libcgrouptest01.o test_functions.o ../src/.libs/libcgroup.la
| arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-gcc -march=armv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 -mthumb-interwork -mno-thumb --sysroot=/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard -O2 -pipe -g -feliminate-unused-debug-types -Wall -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o .libs/libcgrouptest01 libcgrouptest01.o test_functions.o  ../src/.libs/libcgroup.so -lpthread
| \
| #	source='libcg_ba.cpp' object='libcg_ba.o' libtool=no
| arm-angstrom-linux-gnueabi-g++  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 -mthumb-interwork -mno-thumb --sysroot=/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard -DHAVE_CONFIG_H -I. -I.. -I../include    -O2 -pipe -g -feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidden -fvisibility-inlines-hidden -c -o libcg_ba.o libcg_ba.cpp
| libcg_ba.cpp:18:18: fatal error: string: No such file or directory
| compilation terminated.
| make[2]: *** [libcg_ba.o] Error 1
| make[2]: Leaving directory `/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/tests'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory `/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1'
| make: *** [all] Error 2
| + die 'oe_runmake failed'
| + bbfatal 'oe_runmake failed'
| + echo 'ERROR: oe_runmake failed'
| ERROR: oe_runmake failed
| + exit 1
| ERROR: Function 'do_compile' failed (see /home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/temp/log.do_compile.5450 for further information)
NOTE: package libcgroup-0.37.1-r0: task do_compile: Failed
ERROR: Task 1225 (/home/ebenard/WORK/IMX/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/libcgroup/libcgroup_0.37.1.bb, do_compile) failed with exit code '1'
Waiting for 1 active tasks to finish:
0: eglibc-locale-2.12-r18 do_package (pid 6557)
NOTE: package eglibc-locale-2.12-r18: task do_package: Succeeded
ERROR: '/home/ebenard/WORK/IMX/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/libcgroup/libcgroup_0.37.1.bb' failed


[ebenard@e6520eb setup-scripts]$ find build/tmp-angstrom_2010_x-eglibc/sysroots/ -iname string
build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/include/c++/debug/string
build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/include/c++/string

*****>>>> only solution from now : remove tmp and start again with a reduced BB_NUMBER_THREADS

--------------070402040408010906090708
Content-Type: text/plain;
 name="log2.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="log2.txt"

Buyild host :
CPU : Intel(R) Core(TM) i7 CPU         920  @ 2.67GHz
RAM : 12GB
Distribution : Ubuntu 10.04.3 LTS i686
Filesystem : /dev/mapper/HOME-lvol0 on /home type ext3 (rw,relatime,errors=remount-ro)

PARALLEL_MAKE     = "-j6"
BB_NUMBER_THREADS = "8"

bitbake qt4e-demo-image

OE Build Configuration:
BB_VERSION        = "1.15.0"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "beagleboard"
DISTRO            = "angstrom"
DISTRO_VERSION    = "v2011.11-core"
TUNE_FEATURES     = "armv7a vfp neon cortexa8"
TARGET_FPU        = "vfp-neon"
meta-angstrom     = "master:f9679a34fc6220a06e5ecbd38f00e5f68ba935bf"
meta-oe           
meta-efl          
meta-gpe          
meta-gnome        
meta-xfce         = "master:a03a4083df90184fc1083b2f01952a50cfa51bca"
meta-opie         = "master:bd11184f5b5a8037444b22019c73249a967a4eb7"
meta-ti           = "master:59e00aecf2740048b03364f0c41b15da686d254f"
meta-ettus        = "master:f097bb61772d07610d84a668dc19a47e180962b3"
meta-efikamx      = "master:2ef47fdd4e8232d766c0c63d9427253ee56e31d0"
meta-nslu2        = "master:17853811179f2760791c6b138f96e9dd15493517"
meta-htc          
meta-nokia        
meta-openmoko     
meta-palm         = "master:8d2caaa1d2081869b00b534c00eed4ea1983919a"
meta-handheld     = "master:c83f57f0ec2b43c22f0fd628fe5ad17b330b972d"
meta-sugarbay     
meta-crownbay     
meta-emenlow      
meta-fishriver    
meta-jasperforest 
meta-n450         = "master:2a41ae377613b1f14829179f437aa76bbb1bc39e"
meta              = "master:f2316ff39670ed99382411e15ac035550360fbdd"

NOTE: Resolving any missing task queue dependencies

arm-angstrom-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 -mthumb-interwork -mno-thumb --sysroot=/home/ebenard/WO
RK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard -DHAVE_CONFIG_H -I. -I.. -I../include -I../lib -I../include -I../lib -I../src -DDATADIR=\"/usr/share/directfb-1.4.12\
" -D_REENTRANT  -I/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/include/freetype2   -I/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2
010_x-eglibc/sysroots/beagleboard/usr/include/libpng12   -O3 -ffast-math -pipe -O2 -pipe -g -feliminate-unused-debug-types -D_GNU_SOURCE  -std=gnu99 -Werror-implicit-function-declaration -c ra
w16toraw24.c
mkdgifft.cpp:64:16: fatal error: list: No such file or directory
compilation terminated.
make[2]: *** [mkdgifft.o] Error 1
make[2]: *** Waiting for unfinished jobs....
make[2]: Leaving directory `/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/directfb-1.4.12-r0/DirectFB-1.4.12/tools'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/directfb-1.4.12-r0/DirectFB-1.4.12'
make: *** [all] Error 2
+ die 'oe_runmake failed'
+ bbfatal 'oe_runmake failed'
+ echo 'ERROR: oe_runmake failed'
ERROR: oe_runmake failed
+ exit 1
ERROR: Function 'do_compile' failed (see /home/ebenard/WORK/IMX/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/directfb-1.4.12-r0/temp/log.do_compile.32382 f
or further information)
NOTE: package directfb-1.4.12-r0: task do_compile: Failed
ERROR: Task 738 (/home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-graphics/directfb/directfb_1.4.12.bb, do_compile) failed with exit code '1'
Waiting for 7 active tasks to finish:
0: perl-5.14.2-r0 do_compile (pid 328)
1: gettext-0.18.1.1-r4 do_install (pid 14995)
2: python-2.7.2-r0.2 do_install (pid 16216)
3: postgresql-8.4.7-r5.0 do_compile (pid 14300)
4: strace-4.5.20-r2 do_configure (pid 16223)
5: linux-3.0.9-r110a do_fetch (pid 18272)
6: mysql5-5.1.40-r5 do_configure (pid 22132)

$ find build/tmp-angstrom_2010_x-eglibc/sysroots/ -iname list
build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/include/c++/profile/list
build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/include/c++/list
build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/include/c++/debug/list

*****>>>> launched with BB_NUMBER_THREADS = "1"
PARALLEL_MAKE     = "-j6"
BB_NUMBER_THREADS = "1"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Running task 1013 of 3361 (ID: 1633, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-core/gettext/gettext_0.18.1.1.bb, do_populate_sysroot)
NOTE: package gettext-0.18.1.1-r4: task do_populate_sysroot: Started
NOTE: package gettext-0.18.1.1-r4: task do_populate_sysroot: Succeeded
NOTE: Running task 1035 of 3361 (ID: 2742, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.8.18.bb, do_configure)
NOTE: package cracklib-2.8.18-r1: task do_configure: Started
NOTE: package cracklib-2.8.18-r1: task do_configure: Succeeded
NOTE: Running task 1036 of 3361 (ID: 2743, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.8.18.bb, do_compile)
NOTE: package cracklib-2.8.18-r1: task do_compile: Started
NOTE: package cracklib-2.8.18-r1: task do_compile: Succeeded
NOTE: Running task 1037 of 3361 (ID: 2738, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.8.18.bb, do_install)
NOTE: package cracklib-2.8.18-r1: task do_install: Started
NOTE: package cracklib-2.8.18-r1: task do_install: Succeeded
NOTE: Running task 1038 of 3361 (ID: 2739, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.8.18.bb, do_populate_sysroot)
NOTE: package cracklib-2.8.18-r1: task do_populate_sysroot: Started
NOTE: package cracklib-2.8.18-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 1043 of 3361 (ID: 2729, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-devtools/flex/flex_2.5.35.bb, do_configure)
NOTE: package flex-2.5.35-r2: task do_configure: Started
NOTE: package flex-2.5.35-r2: task do_configure: Succeeded
NOTE: Running task 1044 of 3361 (ID: 2730, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-devtools/flex/flex_2.5.35.bb, do_compile)
NOTE: package flex-2.5.35-r2: task do_compile: Started
NOTE: package flex-2.5.35-r2: task do_compile: Succeeded
NOTE: Running task 1045 of 3361 (ID: 2725, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-devtools/flex/flex_2.5.35.bb, do_install)
NOTE: package flex-2.5.35-r2: task do_install: Started
NOTE: package flex-2.5.35-r2: task do_install: Succeeded
NOTE: Running task 1046 of 3361 (ID: 2726, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-devtools/flex/flex_2.5.35.bb, do_populate_sysroot)
NOTE: package flex-2.5.35-r2: task do_populate_sysroot: Started
NOTE: package flex-2.5.35-r2: task do_populate_sysroot: Succeeded
NOTE: Running task 1051 of 3361 (ID: 2716, /home/ebenard/WORK/IMX/setup-scripts/sources/openembedded-core/meta/recipes-devtools/bison/bison_2.5.bb, do_configure)
NOTE: package bison-2.5-r1: task do_configure: Started

--------------070402040408010906090708--
