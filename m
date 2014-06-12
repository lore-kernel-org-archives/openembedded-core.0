Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 669A2609BF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 16:33:54 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 12 Jun 2014 09:33:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,466,1400050800"; d="scan'208";a="444766587"
Received: from unknown (HELO [10.255.12.166]) ([10.255.12.166])
	by azsmga001.ch.intel.com with ESMTP; 12 Jun 2014 09:33:53 -0700
Message-ID: <5399D671.5040403@linux.intel.com>
Date: Thu, 12 Jun 2014 09:33:53 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Tobias Klauser <tklauser@distanz.ch>, 
	openembedded-core@lists.openembedded.org
References: <1402058035-11177-1-git-send-email-tklauser@distanz.ch>
In-Reply-To: <1402058035-11177-1-git-send-email-tklauser@distanz.ch>
Subject: Re: [PATCH] powertop: upgrade from 2.5 to 2.6.1
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
X-List-Received-Date: Thu, 12 Jun 2014 16:33:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/06/2014 05:33 AM, Tobias Klauser wrote:
> Upgrade powertop from 2.5 to 2.6.1. Also adjust to the new upstream
> download URL.
>
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> ---
>   .../{powertop_2.5.bb => powertop_2.6.1.bb}         |    6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta/recipes-kernel/powertop/{powertop_2.5.bb => powertop_2.6.1.bb} (81%)
>
> diff --git a/meta/recipes-kernel/powertop/powertop_2.5.bb b/meta/recipes-kernel/powertop/powertop_2.6.1.bb
> similarity index 81%
> rename from meta/recipes-kernel/powertop/powertop_2.5.bb
> rename to meta/recipes-kernel/powertop/powertop_2.6.1.bb
> index 86a7f60..6a293bc 100644
> --- a/meta/recipes-kernel/powertop/powertop_2.5.bb
> +++ b/meta/recipes-kernel/powertop/powertop_2.6.1.bb
> @@ -6,10 +6,10 @@ DEPENDS = "ncurses libnl pciutils"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
>
> -SRC_URI = "http://01.org/powertop/sites/default/files/downloads/powertop-${PV}.tar.gz"
> +SRC_URI = "http://01.org/sites/default/files/downloads/powertop/powertop-${PV}.tar.gz"
>
> -SRC_URI[md5sum] = "806bbcbd44fcea1f807c9582fc1f7d3e"
> -SRC_URI[sha256sum] = "8b2c08a555d79e1c428863470c41cb023971d74ba4801d80a05e35adeec23c0b"
> +SRC_URI[md5sum] = "4391e7b0af854ecf722cdf712f24b631"
> +SRC_URI[sha256sum] = "034cde6d5bb433fe0d29251d5cde5d4c2948abf05fe29ef10966b659331b20e4"
>
>   inherit autotools gettext pkgconfig
>
>
I know this seems like a simple change, but it may have introduced a 
parallel make issue:
> | ../mips-poky-linux-libtool  --tag=CC   --mode=link mips-poky-linux-gcc  -meb -mabi=32 -mhard-float -march=mips32 --sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips  -O2 -pipe -g -feliminate-unused-debug-types  -Wl,-O1  -Wl,--as-needed  -o libtraceevnet.la  event-parse.lo parse-filter.lo parse-utils.lo trace-seq.lo  -lpthread -lncurses
> | mips-poky-linux-libtool: link: mips-poky-linux-ar cru .libs/libtraceevnet.a .libs/event-parse.o .libs/parse-filter.o .libs/parse-utils.o .libs/trace-seq.o
> | mips-poky-linux-libtool: link: mips-poky-linux-ranlib .libs/libtraceevnet.a
> | mips-poky-linux-libtool: link: ( cd ".libs" && rm -f "libtraceevnet.la" && ln -s "../libtraceevnet.la" "libtraceevnet.la" )
> | make[2]: Leaving directory `/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/build/traceevent'
> | Making all in src
> | make[2]: Entering directory `/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/build/src'
> | make  all-am
> | make[3]: Entering directory `/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/build/src'
> | mips-poky-linux-g++  -meb -mabi=32 -mhard-float -march=mips32 --sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips -DHAVE_CONFIG_H -I. -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/powertop-2.6.1/src -I..  -D_FORTIFY_SOURCE=2   -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips/usr/include/libnl3    -DLOCALEDIR=\"/usr/share/locale\"  -fno-omit-frame-pointer -fstack-protector -Wall -Wshadow -Wformat   -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips/usr/include/libnl3   -O2 -pipe -g -feliminate-unused-debug-types -fvisibility-inlines-hidden -c -o powertop-display.o `test -f 'display.cpp' || echo '/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/powertop-2.6.1/src/'`display.cpp
> | mips-poky-linux-g++  -meb -mabi=32 -mhard-float -march=mips32 --sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips -DHAVE_CONFIG_H -I. -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/powertop-2.6.1/src -I..  -D_FORTIFY_SOURCE=2   -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips/usr/include/libnl3    -DLOCALEDIR=\"/usr/share/locale\"  -fno-omit-frame-pointer -fstack-protector -Wall -Wshadow -Wformat   -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips/usr/include/libnl3   -O2 -pipe -g -feliminate-unused-debug-types -fvisibility-inlines-hidden -c -o powertop-devlist.o `test -f 'devlist.cpp' || echo '/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/powertop-2.6.1/src/'`devlist.cpp
> | mips-poky-linux-g++  -meb -mabi=32 -mhard-float -march=mips32 --sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips -DHAVE_CONFIG_H -I. -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/powertop-2.6.1/src -I..  -D_FORTIFY_SOURCE=2   -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips/usr/include/libnl3    -DLOCALEDIR=\"/usr/share/locale\"  -fno-omit-frame-pointer -fstack-protector -Wall -Wshadow -Wformat   -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips/usr/include/libnl3   -O2 -pipe -g -feliminate-unused-debug-types -fvisibility-inlines-hidden -c -o powertop-lib.o `test -f 'lib.cpp' || echo '/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/powertop-2.6.1/src/'`lib.cpp
> | mips-poky-linux-g++  -meb -mabi=32 -mhard-float -march=mips32 --sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips -DHAVE_CONFIG_H -I. -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/powertop-2.6.1/src -I..  -D_FORTIFY_SOURCE=2   -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips/usr/include/libnl3    -DLOCALEDIR=\"/usr/share/locale\"  -fno-omit-frame-pointer -fstack-protector -Wall -Wshadow -Wformat   -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips/usr/include/libnl3   -O2 -pipe -g -feliminate-unused-debug-types -fvisibility-inlines-hidden -c -o tuning/powertop-bluetooth.o `test -f 'tuning/bluetooth.cpp' || echo '/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/powertop-2.6.1/src/'`tuning/bluetooth.cpp
> | mips-poky-linux-g++  -meb -mabi=32 -mhard-float -march=mips32 --sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips -DHAVE_CONFIG_H -I. -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/powertop-2.6.1/src -I..  -D_FORTIFY_SOURCE=2   -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips/usr/include/libnl3    -DLOCALEDIR=\"/usr/share/locale\"  -fno-omit-frame-pointer -fstack-protector -Wall -Wshadow -Wformat   -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips/usr/include/libnl3   -O2 -pipe -g -feliminate-unused-debug-types -fvisibility-inlines-hidden -c -o tuning/powertop-tuning.o `test -f 'tuning/tuning.cpp' || echo '/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/powertop-2.6.1/src/'`tuning/tuning.cpp
> | mips-poky-linux-g++  -meb -mabi=32 -mhard-float -march=mips32 --sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips -DHAVE_CONFIG_H -I. -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/powertop-2.6.1/src -I..  -D_FORTIFY_SOURCE=2   -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips/usr/include/libnl3    -DLOCALEDIR=\"/usr/share/locale\"  -fno-omit-frame-pointer -fstack-protector -Wall -Wshadow -Wformat   -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips/usr/include/libnl3   -O2 -pipe -g -feliminate-unused-debug-types -fvisibility-inlines-hidden -c -o tuning/powertop-tuningusb.o `test -f 'tuning/tuningusb.cpp' || echo '/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/powertop-2.6.1/src/'`tuning/tuningusb.cpp
> | mips-poky-linux-g++  -meb -mabi=32 -mhard-float -march=mips32 --sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips -DHAVE_CONFIG_H -I. -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/powertop-2.6.1/src -I..  -D_FORTIFY_SOURCE=2   -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips/usr/include/libnl3    -DLOCALEDIR=\"/usr/share/locale\"  -fno-omit-frame-pointer -fstack-protector -Wall -Wshadow -Wformat   -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips/usr/include/libnl3   -O2 -pipe -g -feliminate-unused-debug-types -fvisibility-inlines-hidden -c -o tuning/powertop-ethernet.o `test -f 'tuning/ethernet.cpp' || echo '/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/powertop-2.6.1/src/'`tuning/ethernet.cpp
> | Assembler messages:
> | Fatal error: can't create tuning/powertop-bluetooth.o: No such file or directory
> | mips-poky-linux-g++  -meb -mabi=32 -mhard-float -march=mips32 --sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips -DHAVE_CONFIG_H -I. -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/powertop-2.6.1/src -I..  -D_FORTIFY_SOURCE=2   -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips/usr/include/libnl3    -DLOCALEDIR=\"/usr/share/locale\"  -fno-omit-frame-pointer -fstack-protector -Wall -Wshadow -Wformat   -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips/usr/include/libnl3   -O2 -pipe -g -feliminate-unused-debug-types -fvisibility-inlines-hidden -c -o tuning/powertop-tunable.o `test -f 'tuning/tunable.cpp' || echo '/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/powertop-2.6.1/src/'`tuning/tunable.cpp
> | Assembler messages:
> | Fatal error: can't create tuning/powertop-tuningusb.o: No such file or directory
> | mips-poky-linux-gcc  -meb -mabi=32 -mhard-float -march=mips32 --sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips -DHAVE_CONFIG_H -I. -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/powertop-2.6.1/src -I..  -D_FORTIFY_SOURCE=2   -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips/usr/include/libnl3    -DLOCALEDIR=\"/usr/share/locale\"   -O2 -pipe -g -feliminate-unused-debug-types -c -o tuning/powertop-iw.o `test -f 'tuning/iw.c' || echo '/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/powertop-2.6.1/src/'`tuning/iw.c
> | mips-poky-linux-g++  -meb -mabi=32 -mhard-float -march=mips32 --sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips -DHAVE_CONFIG_H -I. -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/powertop-2.6.1/src -I..  -D_FORTIFY_SOURCE=2   -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips/usr/include/libnl3    -DLOCALEDIR=\"/usr/share/locale\"  -fno-omit-frame-pointer -fstack-protector -Wall -Wshadow -Wformat   -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips/usr/include/libnl3   -O2 -pipe -g -feliminate-unused-debug-types -fvisibility-inlines-hidden -c -o tuning/powertop-wifi.o `test -f 'tuning/wifi.cpp' || echo '/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/powertop-2.6.1/src/'`tuning/wifi.cpp
> | Assembler messages:
> | Fatal error: can't create tuning/powertop-ethernet.o: No such file or directory
> | mips-poky-linux-g++  -meb -mabi=32 -mhard-float -march=mips32 --sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips -DHAVE_CONFIG_H -I. -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/powertop-2.6.1/src -I..  -D_FORTIFY_SOURCE=2   -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips/usr/include/libnl3    -DLOCALEDIR=\"/usr/share/locale\"  -fno-omit-frame-pointer -fstack-protector -Wall -Wshadow -Wformat   -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips/usr/include/libnl3   -O2 -pipe -g -feliminate-unused-debug-types -fvisibility-inlines-hidden -c -o tuning/powertop-tuningsysfs.o `test -f 'tuning/tuningsysfs.cpp' || echo '/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/powertop-2.6.1/src/'`tuning/tuningsysfs.cp
p
> | mips-poky-linux-g++  -meb -mabi=32 -mhard-float -march=mips32 --sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips -DHAVE_CONFIG_H -I. -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/powertop-2.6.1/src -I..  -D_FORTIFY_SOURCE=2   -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips/usr/include/libnl3    -DLOCALEDIR=\"/usr/share/locale\"  -fno-omit-frame-pointer -fstack-protector -Wall -Wshadow -Wformat   -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips/usr/include/libnl3   -O2 -pipe -g -feliminate-unused-debug-types -fvisibility-inlines-hidden -c -o tuning/powertop-runtime.o `test -f 'tuning/runtime.cpp' || echo '/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/powertop-2.6.1/src/'`tuning/runtime.cpp
> | Assembler messages:
> | Fatal error: can't create tuning/powertop-tunable.o: No such file or directory
> | Assembler messages:
> | Fatal error: can't create tuning/powertop-iw.o: No such file or directory
> | Assembler messages:
> | Fatal error: can't create tuning/powertop-wifi.o: No such file or directory
> | Assembler messages:
> | Fatal error: can't create tuning/powertop-runtime.o: No such file or directory
> | Assembler messages:
> | mips-poky-linux-g++  -meb -mabi=32 -mhard-float -march=mips32 --sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips -DHAVE_CONFIG_H -I. -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/powertop-2.6.1/src -I..  -D_FORTIFY_SOURCE=2   -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips/usr/include/libnl3    -DLOCALEDIR=\"/usr/share/locale\"  -fno-omit-frame-pointer -fstack-protector -Wall -Wshadow -Wformat   -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips/usr/include/libnl3   -O2 -pipe -g -feliminate-unused-debug-types -fvisibility-inlines-hidden -c -o report/powertop-report-maker.o `test -f 'report/report-maker.cpp' || echo '/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/powertop-2.6.1/src/'`report/report-maker
.cpp
> | Fatal error: can't create tuning/powertop-tuning.o: No such file or directory
> | mips-poky-linux-g++  -meb -mabi=32 -mhard-float -march=mips32 --sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips -DHAVE_CONFIG_H -I. -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/powertop-2.6.1/src -I..  -D_FORTIFY_SOURCE=2   -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips/usr/include/libnl3    -DLOCALEDIR=\"/usr/share/locale\"  -fno-omit-frame-pointer -fstack-protector -Wall -Wshadow -Wformat   -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips/usr/include/libnl3   -O2 -pipe -g -feliminate-unused-debug-types -fvisibility-inlines-hidden -c -o report/powertop-report-formatter-base.o `test -f 'report/report-formatter-base.cpp' || echo '/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/powertop-2.6.1/src/'`r
eport/report-formatter-base.cpp
> | mips-poky-linux-g++  -meb -mabi=32 -mhard-float -march=mips32 --sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips -DHAVE_CONFIG_H -I. -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/powertop-2.6.1/src -I..  -D_FORTIFY_SOURCE=2   -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips/usr/include/libnl3    -DLOCALEDIR=\"/usr/share/locale\"  -fno-omit-frame-pointer -fstack-protector -Wall -Wshadow -Wformat   -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips/usr/include/libnl3   -O2 -pipe -g -feliminate-unused-debug-types -fvisibility-inlines-hidden -c -o report/powertop-report-formatter-csv.o `test -f 'report/report-formatter-csv.cpp' || echo '/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/powertop-2.6.1/src/'`rep
ort/report-formatter-csv.cpp
> | mips-poky-linux-g++  -meb -mabi=32 -mhard-float -march=mips32 --sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips -DHAVE_CONFIG_H -I. -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/powertop-2.6.1/src -I..  -D_FORTIFY_SOURCE=2   -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips/usr/include/libnl3    -DLOCALEDIR=\"/usr/share/locale\"  -fno-omit-frame-pointer -fstack-protector -Wall -Wshadow -Wformat   -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips/usr/include/libnl3   -O2 -pipe -g -feliminate-unused-debug-types -fvisibility-inlines-hidden -c -o report/powertop-report-formatter-html.o `test -f 'report/report-formatter-html.cpp' || echo '/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/powertop-2.6.1/src/'`r
eport/report-formatter-html.cpp
> | Assembler messages:
> | Fatal error: can't create tuning/powertop-tuningsysfs.o: No such file or directory
> | make[3]: *** [tuning/powertop-iw.o] Error 2
> | make[3]: *** Waiting for unfinished jobs....
> | make[3]: *** [tuning/powertop-tunable.o] Error 2
> | make[3]: *** [tuning/powertop-tuningusb.o] Error 2
> | make[3]: *** [tuning/powertop-tuningsysfs.o] Error 2
> | make[3]: *** [tuning/powertop-wifi.o] Error 2
> | /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/powertop-2.6.1/src/tuning/bluetooth.cpp: In member function 'virtual void bt_tunable::toggle()':
> | /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/powertop-2.6.1/src/tuning/bluetooth.cpp:179:55: warning: ignoring return value of 'int system(const char*)', declared with attribute warn_unused_result [-Wunused-result]
> |    system("/usr/sbin/hciconfig hci0 up &> /dev/null &");
> |                                                        ^
> | /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/powertop-2.6.1/src/tuning/bluetooth.cpp:182:54: warning: ignoring return value of 'int system(const char*)', declared with attribute warn_unused_result [-Wunused-result]
> |   system("/usr/sbin/hciconfig hci0 down &> /dev/null");
> |                                                       ^
> | make[3]: *** [tuning/powertop-bluetooth.o] Error 2
> | make[3]: *** [tuning/powertop-tuning.o] Error 2
> | make[3]: *** [tuning/powertop-ethernet.o] Error 2
> | make[3]: *** [tuning/powertop-runtime.o] Error 2
> | make[3]: Leaving directory `/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/build/src'
> | make[2]: *** [all] Error 2
> | make[2]: Leaving directory `/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/build/src'
> | make[1]: *** [all-recursive] Error 1
> | make[1]: Leaving directory `/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/build'
> | make: *** [all] Error 2
> | ERROR: oe_runmake failed
> | WARNING: /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/temp/run.do_compile.12871:1 exit 1 from
> |   exit 1
> | ERROR: Function failed: do_compile (log file is located at /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/powertop/2.6.1-r0/temp/log.do_compile.12871)
> NOTE: recipe powertop-2.6.1-r0: task do_compile: Failed

Please review this error, we are building with PARALLEL_MAKE = "-j 16"

Sau!


