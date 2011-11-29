Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RVK1D-0008E8-Gv
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 10:30:28 +0100
Received: from [192.168.1.15] (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 6525B4B05F7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 10:23:42 +0100 (CET)
Message-ID: <4ED4A49D.7040806@eukrea.com>
Date: Tue, 29 Nov 2011 10:23:41 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: base-passwd problem : No such file or directory
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
X-List-Received-Date: Tue, 29 Nov 2011 09:30:30 -0000
X-Groupsio-MsgNum: 13082
Content-Type: multipart/mixed; boundary="------------020302020109070802050502"

--------------020302020109070802050502
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

while building an image (.bb attached), I new get the following problem 
(reproduced on 3 different hosts) :

ERROR: Error executing a python function in 
/home/ebenard/WORK/PROJECT/setup-scripts/sources/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb:
IOError: [Errno 2] No such file or directory: 
'/home/ebenard/WORK/PROJECT/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/PROJECT-board/usr/share/base-passwd/passwd.master'

Log is attached.

Thanks,
Eric

--------------020302020109070802050502
Content-Type: text/plain;
 name="eukrea-base-image.bb"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="eukrea-base-image.bb"

# based on micro-base-image
#

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"

IMAGE_PREPROCESS_COMMAND = "rootfs_update_timestamp"

# Install basic files only
IMAGE_INSTALL += "angstrom-task-boot dropbear initscripts"
IMAGE_LINGUAS = ""

CAN = ' ${@base_contains("MACHINE_FEATURES", "can", "canutils", "",d)}'
TOUCH = ' ${@base_contains("MACHINE_FEATURES", "touchscreen", "tslib tslib-calibrate tslib-tests", "",d)}'
ALSA = ' ${@base_contains("MACHINE_FEATURES", "alsa", "alsa-utils-aplay alsa-utils-alsamixer alsa-utils-amixer alsa-utils-alsactl", "",d)}'
WIFI = ' ${@base_contains("MACHINE_FEATURES", "wifi", "firmware-marvell-sd8688 wireless-tools wpa-supplicant", "",d)}'
BLUETOOTH = ' ${@base_contains("MACHINE_FEATURES", "bluetooth", "bluez4", "",d)}'
PPP = ' ${@base_contains("MACHINE_FEATURES", "ppp", "ppp", "",d)}'

SPLASH = ' ${@base_contains("MACHINE_FEATURES", "screen", "psplash", "",d)}'
# Use busybox as login manager
#IMAGE_LOGIN_MANAGER = "busybox"
IMAGE_LOGIN_MANAGER = "shadow"

# Include minimum init and init scripts
IMAGE_DEV_MANAGER = "busybox-mdev"
IMAGE_INIT_MANAGER = "sysvinit sysvinit-pidof"
IMAGE_INITSCRIPTS = "initscripts"

DEPENDS += "busybox"

RDEPENDS_append = " \
	module-init-tools \
	e2fsprogs \
	"

EUKREA_INSTALL = " \
	i2c-tools devmem2 e2fsprogs-mke2fs e2fsprogs-e2fsck \
	e2fsprogs-tune2fs strace \
	dosfstools gdbserver libstdc++ evtest watchdog \
	module-init-tools gdbserver libgcc libstdc++\
	kernel-modules gpio mtd-utils \
"

IMAGE_INSTALL += "\
	task-boot \
	${IMAGE_INITSCRIPTS} \
	${IMAGE_DEV_MANAGER} \
	${IMAGE_INIT_MANAGER} \
	${IMAGE_LOGIN_MANAGER} \
	${EUKREA_INSTALL} \
	${CAN} \
	${TOUCH} \
	${ALSA} \
	${WIFI} \
	${BLUETOOTH} \
	${PPP} \
	${SPLASH} \
"

export IMAGE_BASENAME = "eukrea-base-image"

inherit image

ROOTFS_POSTPROCESS_COMMAND += '${@base_conditional("DISTRO_TYPE", "release", "zap_root_password; ", "",d)}'

--------------020302020109070802050502
Content-Type: text/plain;
 name="log.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="log.txt"

bitbake barebox meta-toolchain eukrea-base-image

PARALLEL_MAKE     = "-j8"
BB_NUMBER_THREADS = "8"
-> fails on base-passwd
ERROR: Error executing a python function in /home/ebenard/WORK/PROJECT/setup-scripts/sources/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb:
IOError: [Errno 2] No such file or directory: '/home/ebenard/WORK/PROJECT/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/PROJECT-board/usr/share/base-passwd/passwd.master'


OE Build Configuration:
BB_VERSION        = "1.15.0"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "project-board"
DISTRO            = "angstrom"
DISTRO_VERSION    = "v2011.11-core"
TUNE_FEATURES     = "armv5 dsp thumb arm926ejs"
TARGET_FPU        = "soft"
meta-angstrom     = "master:bc72e71ccf7e79cdc8246e0ae0dbe62d11355263"
meta-oe           
meta-efl          
meta-gpe          
meta-gnome        
meta-xfce         = "master:475674091355f9114a79d71d42543f01881bdaba"
meta-board    = "master:f6724e330addf822580352fb883195ed9cf74940"
meta              = "master:2864ff6a4b3c3f9b3bbb6d2597243cc5d3715939"


launched one more time and got :

ERROR: Error executing a python function in /home/ebenard/WORK/PROJECT/setup-scripts/sources/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb:
IOError: [Errno 2] No such file or directory: '/home/ebenard/WORK/PROJECT/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/PROJECT-board/usr/share/base-passwd/passwd.master'

ERROR: The stack trace of python calls that resulted in this exception/failure was:
ERROR:   File "populate_packages", line 192, in <module>
ERROR: 
ERROR:   File "populate_packages", line 9, in populate_packages
ERROR: 
ERROR: The code that was being executed was:
ERROR:      0188:				bb.note("%s contains dangling symlink to %s" % (pkg, l))
ERROR:      0189:		d.setVar('RDEPENDS_' + pkg, bb.utils.join_deps(rdepends, commasep=False))
ERROR:      0190:
ERROR:      0191:
ERROR:  *** 0192:populate_packages(d)
ERROR:      0193:
ERROR: (file: 'populate_packages', lineno: 192, function: <module>)
ERROR:      0005:	# would be unavailable. We need to create these files at preinst
ERROR:      0006:	# time before the files from the package may be available, hence
ERROR:      0007:	# storing the data from the files in the preinst directly.
ERROR:      0008:
ERROR:  *** 0009:	f = open(bb.data.expand("/home/ebenard/WORK/PROJECT/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/PROJECT-board/usr/share/base-passwd/passwd.master", d), 'r')
ERROR:      0010:	passwd = "".join(f.readlines())
ERROR:      0011:	f.close()
ERROR:      0012:	f = open(bb.data.expand("/home/ebenard/WORK/PROJECT/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/PROJECT-board/usr/share/base-passwd/group.master", d), 'r')
ERROR:      0013:	group = "".join(f.readlines())
ERROR: (file: 'populate_packages', lineno: 9, function: populate_packages)
ERROR: Function 'populate_packages' failed
ERROR: Logfile of failure stored in: /home/ebenard/WORK/PROJECT/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/base-passwd-3.5.22-r9/temp/log.do_package.5669
Log data follows:
| DEBUG: No locale files in this package
| DEBUG: runstrip: 'arm-angstrom-linux-gnueabi-strip' --remove-section=.comment --remove-section=.note '/home/ebenard/WORK/PROJECT/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/base-passwd-3.5.22-r9/package/usr/sbin/update-passwd'
| ERROR: Error executing a python function in /home/ebenard/WORK/PROJECT/setup-scripts/sources/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb:
| IOError: [Errno 2] No such file or directory: '/home/ebenard/WORK/PROJECT/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/PROJECT-board/usr/share/base-passwd/passwd.master'
| 
| ERROR: The stack trace of python calls that resulted in this exception/failure was:
| ERROR:   File "populate_packages", line 192, in <module>
| ERROR:
| ERROR:   File "populate_packages", line 9, in populate_packages
| ERROR:
| ERROR: The code that was being executed was:
| ERROR:      0188:				bb.note("%s contains dangling symlink to %s" % (pkg, l))
| ERROR:      0189:		d.setVar('RDEPENDS_' + pkg, bb.utils.join_deps(rdepends, commasep=False))
| ERROR:      0190:
| ERROR:      0191:
| ERROR:  *** 0192:populate_packages(d)
| ERROR:      0193:
| ERROR: (file: 'populate_packages', lineno: 192, function: <module>)
| ERROR:      0005:	# would be unavailable. We need to create these files at preinst
| ERROR:      0006:	# time before the files from the package may be available, hence
| ERROR:      0007:	# storing the data from the files in the preinst directly.
| ERROR:      0008:
| ERROR:  *** 0009:	f = open(bb.data.expand("/home/ebenard/WORK/PROJECT/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/PROJECT-board/usr/share/base-passwd/passwd.master", d), 'r')
| ERROR:      0010:	passwd = "".join(f.readlines())
| ERROR:      0011:	f.close()
| ERROR:      0012:	f = open(bb.data.expand("/home/ebenard/WORK/PROJECT/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/PROJECT-board/usr/share/base-passwd/group.master", d), 'r')
| ERROR:      0013:	group = "".join(f.readlines())
| ERROR: (file: 'populate_packages', lineno: 9, function: populate_packages)
| ERROR: Function 'populate_packages' failed
NOTE: package base-passwd-3.5.22-r9: task do_package: Failed


--> reducing BB_NUMBER_THREADS to "4" -> problem went away (but reproduced with a clean build with  BB_NUMBER_THREADS = "4"


NOTE: Executing RunQueue Tasks
NOTE: Running task 1855 of 2631 (ID: 61, /home/ebenard/WORK/PROJECT/setup-scripts/sources/meta-PROJECT/recipes-kernel/linux/linux_3.0.11.bb, do_rm_work_all)
NOTE: Running task 1886 of 2631 (ID: 1568, /home/ebenard/WORK/PROJECT/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cross-canadian_4.5.bb, do_package)
NOTE: Running task 1887 of 2631 (ID: 1562, /home/ebenard/WORK/PROJECT/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cross-canadian_4.5.bb, do_populate_sysroot)
NOTE: Running noexec task 1936 of 2631 (ID: 1462, virtual:nativesdk:/home/ebenard/WORK/PROJECT/setup-scripts/sources/openembedded-core/meta/recipes-devtools/qemu/qemu_0.15.0.bb, do_package_write)
NOTE: Running noexec task 1938 of 2631 (ID: 1459, virtual:nativesdk:/home/ebenard/WORK/PROJECT/setup-scripts/sources/openembedded-core/meta/recipes-devtools/qemu/qemu_0.15.0.bb, do_build)
NOTE: Running task 1939 of 2631 (ID: 1464, virtual:nativesdk:/home/ebenard/WORK/PROJECT/setup-scripts/sources/openembedded-core/meta/recipes-devtools/qemu/qemu_0.15.0.bb, do_rm_work)
NOTE: package linux-3.0.11-r0: task do_rm_work_all: Started
NOTE: package linux-3.0.11-r0: task do_rm_work_all: Succeeded
NOTE: package gcc-cross-canadian-arm-4.5-r43+svnr178923: task do_populate_sysroot: Started
NOTE: Running noexec task 2063 of 2631 (ID: 1266, /home/ebenard/WORK/PROJECT/setup-scripts/sources/openembedded-core/meta/recipes-extended/pam/libpam_1.1.4.bb, do_package_write)
NOTE: Running noexec task 2065 of 2631 (ID: 1711, /home/ebenard/WORK/PROJECT/setup-scripts/sources/openembedded-core/meta/recipes-core/coreutils/coreutils_8.14.bb, do_package_write)
NOTE: Running noexec task 2066 of 2631 (ID: 1263, /home/ebenard/WORK/PROJECT/setup-scripts/sources/openembedded-core/meta/recipes-extended/pam/libpam_1.1.4.bb, do_build)
NOTE: Running task 2067 of 2631 (ID: 1268, /home/ebenard/WORK/PROJECT/setup-scripts/sources/openembedded-core/meta/recipes-extended/pam/libpam_1.1.4.bb, do_rm_work)
NOTE: package gcc-cross-canadian-arm-4.5-r43+svnr178923: task do_package: Started
NOTE: package qemu-nativesdk-0.15.0-r1: task do_rm_work: Started
NOTE: package libpam-1.1.4-r2: task do_rm_work: Started
NOTE: package libpam-1.1.4-r2: task do_rm_work: Succeeded
NOTE: Running noexec task 2069 of 2631 (ID: 1708, /home/ebenard/WORK/PROJECT/setup-scripts/sources/openembedded-core/meta/recipes-core/coreutils/coreutils_8.14.bb, do_build)
NOTE: Running task 2070 of 2631 (ID: 1713, /home/ebenard/WORK/PROJECT/setup-scripts/sources/openembedded-core/meta/recipes-core/coreutils/coreutils_8.14.bb, do_rm_work)
NOTE: package coreutils-8.14-r1: task do_rm_work: Started
NOTE: package qemu-nativesdk-0.15.0-r1: task do_rm_work: Succeeded
NOTE: Running noexec task 2147 of 2631 (ID: 1472, /home/ebenard/WORK/PROJECT/setup-scripts/sources/openembedded-core/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb, do_build)
NOTE: Running task 2148 of 2631 (ID: 1477, /home/ebenard/WORK/PROJECT/setup-scripts/sources/openembedded-core/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb, do_rm_work)
NOTE: package gcc-cross-canadian-arm-4.5-r43+svnr178923: task do_populate_sysroot: Succeeded
NOTE: Running task 2157 of 2631 (ID: 1453, virtual:nativesdk:/home/ebenard/WORK/PROJECT/setup-scripts/sources/openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb, do_package_write_ipk)
NOTE: package coreutils-8.14-r1: task do_rm_work: Succeeded
NOTE: Running task 2192 of 2631 (ID: 1673, /home/ebenard/WORK/PROJECT/setup-scripts/sources/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb, do_package)
NOTE: package qemu-helper-nativesdk-1.0-r9: task do_rm_work: Started
NOTE: package pkgconfig-nativesdk-0.25-r2: task do_package_write_ipk: Started
NOTE: package qemu-helper-nativesdk-1.0-r9: task do_rm_work: Succeeded
NOTE: Running task 2193 of 2631 (ID: 1667, /home/ebenard/WORK/PROJECT/setup-scripts/sources/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb, do_populate_sysroot)
NOTE: package base-passwd-3.5.22-r9: task do_package: Started
NOTE: package base-passwd-3.5.22-r9: task do_populate_sysroot: Started
WARNING: For recipe gcc-cross-canadian-arm, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/src
WARNING:   /usr/local/angstrom-eglibc-x86_64-armv5te/sysroots/x86_64-angstromsdk-linux/usr/arm-angstrom-linux-gnueabi
WARNING:   /usr/local/angstrom-eglibc-x86_64-armv5te/sysroots/x86_64-angstromsdk-linux/usr/lib/lib
WARNING:   /usr/local/angstrom-eglibc-x86_64-armv5te/sysroots/x86_64-angstromsdk-linux/usr/arm-angstrom-linux-gnueabi/lib
WARNING:   /usr/src/debug
NOTE: package base-passwd-3.5.22-r9: task do_populate_sysroot: Succeeded
NOTE: Running task 2228 of 2631 (ID: 1650, /home/ebenard/WORK/PROJECT/setup-scripts/sources/meta-angstrom/recipes-angstrom/angstrom/angstrom-feed-configs.bb, do_package_write_ipk)
NOTE: package pkgconfig-nativesdk-0.25-r2: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 2229 of 2631 (ID: 1449, virtual:nativesdk:/home/ebenard/WORK/PROJECT/setup-scripts/sources/openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb, do_package_write)
NOTE: Running noexec task 2230 of 2631 (ID: 1446, virtual:nativesdk:/home/ebenard/WORK/PROJECT/setup-scripts/sources/openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb, do_build)
NOTE: Running task 2231 of 2631 (ID: 1451, virtual:nativesdk:/home/ebenard/WORK/PROJECT/setup-scripts/sources/openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb, do_rm_work)
NOTE: package angstrom-feed-configs-1.0-r15: task do_package_write_ipk: Started
NOTE: package pkgconfig-nativesdk-0.25-r2: task do_rm_work: Started
NOTE: package pkgconfig-nativesdk-0.25-r2: task do_rm_work: Succeeded
NOTE: Running task 2290 of 2631 (ID: 467, /home/ebenard/WORK/PROJECT/setup-scripts/sources/openembedded-core/meta/recipes-core/dropbear/dropbear_0.53.1.bb, do_compile)
NOTE: package dropbear-0.53.1-r0: task do_compile: Started
NOTE: package base-passwd-3.5.22-r9: task do_package: Succeeded
NOTE: Running task 2291 of 2631 (ID: 485, /home/ebenard/WORK/PROJECT/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/tasks/task-boot.bb, do_package_write_ipk)
NOTE: package task-boot-1.0-r56: task do_package_write_ipk: Started
NOTE: package task-boot-1.0-r56: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 2292 of 2631 (ID: 481, /home/ebenard/WORK/PROJECT/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/tasks/task-boot.bb, do_package_write)
NOTE: Running task 2293 of 2631 (ID: 1676, /home/ebenard/WORK/PROJECT/setup-scripts/sources/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb, do_package_write_ipk)
NOTE: package base-passwd-3.5.22-r9: task do_package_write_ipk: Started
NOTE: package base-passwd-3.5.22-r9: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 2294 of 2631 (ID: 1672, /home/ebenard/WORK/PROJECT/setup-scripts/sources/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb, do_package_write)
NOTE: Running noexec task 2295 of 2631 (ID: 478, /home/ebenard/WORK/PROJECT/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/tasks/task-boot.bb, do_build)
NOTE: Running task 2296 of 2631 (ID: 483, /home/ebenard/WORK/PROJECT/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/tasks/task-boot.bb, do_rm_work)
NOTE: package task-boot-1.0-r56: task do_rm_work: Started
NOTE: package task-boot-1.0-r56: task do_rm_work: Succeeded
NOTE: Running noexec task 2297 of 2631 (ID: 1669, /home/ebenard/WORK/PROJECT/setup-scripts/sources/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb, do_build)
NOTE: Running task 2298 of 2631 (ID: 1674, /home/ebenard/WORK/PROJECT/setup-scripts/sources/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb, do_rm_work)
NOTE: package base-passwd-3.5.22-r9: task do_rm_work: Started
NOTE: package base-passwd-3.5.22-r9: task do_rm_work: Succeeded
NOTE: Running task 2312 of 2631 (ID: 387, /home/ebenard/WORK/PROJECT/setup-scripts/sources/openembedded-core/meta/recipes-core/tasks/task-sdk-host-nativesdk.bb, do_configure)
NOTE: package task-sdk-host-nativesdk-1.0-r10: task do_configure: Started
NOTE: package task-sdk-host-nativesdk-1.0-r10: task do_configure: Succeeded
NOTE: Running task 2313 of 2631 (ID: 388, /home/ebenard/WORK/PROJECT/setup-scripts/sources/openembedded-core/meta/recipes-core/tasks/task-sdk-host-nativesdk.bb, do_compile)
NOTE: package dropbear-0.53.1-r0: task do_compile: Succeeded
NOTE: package task-sdk-host-nativesdk-1.0-r10: task do_compile: Started
NOTE: package task-sdk-host-nativesdk-1.0-r10: task do_compile: Succeeded
NOTE: Running task 2314 of 2631 (ID: 461, /home/ebenard/WORK/PROJECT/setup-scripts/sources/openembedded-core/meta/recipes-core/dropbear/dropbear_0.53.1.bb, do_install)
NOTE: Running task 2315 of 2631 (ID: 383, /home/ebenard/WORK/PROJECT/setup-scripts/sources/openembedded-core/meta/recipes-core/tasks/task-sdk-host-nativesdk.bb, do_install)
NOTE: package dropbear-0.53.1-r0: task do_install: Started
NOTE: package task-sdk-host-nativesdk-1.0-r10: task do_install: Started
NOTE: package task-sdk-host-nativesdk-1.0-r10: task do_install: Succeeded
NOTE: Running task 2317 of 2631 (ID: 390, /home/ebenard/WORK/PROJECT/setup-scripts/sources/openembedded-core/meta/recipes-core/tasks/task-sdk-host-nativesdk.bb, do_package)
NOTE: package dropbear-0.53.1-r0: task do_install: Succeeded
NOTE: Running task 2318 of 2631 (ID: 469, /home/ebenard/WORK/PROJECT/setup-scripts/sources/openembedded-core/meta/recipes-core/dropbear/dropbear_0.53.1.bb, do_package)
NOTE: package task-sdk-host-nativesdk-1.0-r10: task do_package: Started
WARNING: For recipe task-sdk-host-nativesdk, the following files/directories were installed but not shipped in any package:
WARNING:   /usr
WARNING:   /usr/src
WARNING:   /usr/src/debug
NOTE: package dropbear-0.53.1-r0: task do_package: Started
^C
Keyboard Interrupt, closing down...

Waiting for 4 active tasks to finish:
0: dropbear-0.53.1-r0 do_package (pid 25058)
1: task-sdk-host-nativesdk-1.0-r10 do_package (pid 24971)
2: angstrom-feed-configs-1.0-r15 do_package_write_ipk (pid 20432)
3: gcc-cross-canadian-arm-4.5-r43+svnr178923 do_package (pid 19802)
^C
Second Keyboard Interrupt, stopping...

NOTE: Sending SIGTERM to remaining 4 tasks
^C^C^C
Third Keyboard Interrupt, exit.

NOTE: Sending SIGTERM to remaining 4 tasks

--------------020302020109070802050502--
