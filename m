Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RIR4A-0003fX-K1
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Oct 2011 22:24:14 +0200
Received: from [192.168.2.8] (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 74FBAA62B5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2011 22:18:12 +0200 (CEST)
Message-ID: <4EA5C803.1030205@eukrea.com>
Date: Mon, 24 Oct 2011 22:18:11 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Dependency problem in mysql ?
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
X-List-Received-Date: Mon, 24 Oct 2011 20:24:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

while testing a build from scratch of a configuration which was working, I 
increased BB_NUMBER_THREADS to  "8" and PARALLEL_MAKE to "-j6" and started to 
get problems with mysql (log at the end of this mail).

Reducing BB_NUMBER_THREADS to 4 "solved" the problem.

Any idea what dependency could be missing in mysql ?

Thanks,
Eric

OE Build Configuration:
BB_VERSION        = "1.13.3"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "eukrea-cpuimx35"
DISTRO            = "angstrom"
DISTRO_VERSION    = "v2011.10-core"
TUNE_FEATURES     = "armv6 vfp arm1136jfs"
TARGET_FPU        = "vfp"
meta-angstrom     = "master:8c6a777b3411140b0147171189148152a5f8ed58"
meta-oe
meta-efl
meta-gpe
meta-gnome
meta-xfce         = "master:2631ed9f4c987192749960bc7a2209b5f5bbfa78"
meta-eukrea
meta-eukrea-cpuimx35 = "master:5aa07bdfc3fe8961c8165317698a805ee92dfe9d"
meta              = "master:e25fad9b8eef59bf7ca11ae141739d0bc2235655"


Then bitbake linux 3 x images (including one integrating qtdemo)
leaded 3 consecutive times to :
| arm-angstrom-linux-gnueabi-g++  -march=armv6    -mthumb-interwork 
-mfloat-abi=softfp -mtune=arm1136jf-s -mthumb-interwork -mno-thumb 
--sysroot=/home/ebenard/OECORE/tmp/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/eukrea-cpuimx35 
-DDEFAULT_BASEDIR=\"/usr\" -DMYSQL_DATADIR="\"/var/mysql\"" 
-DDEFAULT_CHARSET_HOME="\"/usr\"" -DSHAREDIR="\"/usr/share/mysql\"" 
-DDEFAULT_HOME_ENV=MYSQL_HOME -DDEFAULT_GROUP_SUFFIX_ENV=MYSQL_GROUP_SUFFIX 
-DDEFAULT_SYSCONFDIR="\"/etc/mysql\"" -DHAVE_CONFIG_H -I. -I../include 
-I../include -I../include -I.    -O2 -pipe -g -feliminate-unused-debug-types 
-fpermissive -fvisibility-inlines-hidden -fvisibility-inlines-hidden 
-fno-implicit-templates -fno-exceptions -fno-rtti -c -o my_new.o my_new.cc
| In file included from mysys_priv.h:16:0,
|                  from my_new.cc:21:
| ../include/my_global.h:1516:15: fatal error: new: No such file or directory
| compilation terminated.
| make[1]: *** [my_new.o] Error 1
| make[1]: Leaving directory 
`/home/ebenard/OECORE/tmp/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv6-vfp-angstrom-linux-gnueabi/mysql5-5.1.40-r5/mysql-5.1.40/mysys'
| make: *** [all-recursive] Error 1
| + die 'oe_runmake failed'
| + bbfatal 'oe_runmake failed'
| + echo 'ERROR: oe_runmake failed'
| ERROR: oe_runmake failed
| + exit 1
NOTE: package mysql5-5.1.40-r5: task do_compile: Failed
ERROR: Task 1566 
(/home/ebenard/OECORE/tmp/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/mysql/mysql5_5.1.40.bb, 
do_compile) failed with exit code '1'


