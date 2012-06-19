Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1SgxB9-0005dW-44
	for Openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 14:05:03 +0200
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 2DA1AD2380; Tue, 19 Jun 2012 13:54:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-144.dynamic.chello.pl
	[87.206.60.144])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id E63FAD232A
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2012 13:53:52 +0200 (CEST)
Message-ID: <4FE0684D.2000906@linaro.org>
Date: Tue, 19 Jun 2012 13:53:49 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120611 Thunderbird/14.0
MIME-Version: 1.0
To: Openembedded-core@lists.openembedded.org
Subject: Is target toolchain supposed to be working?
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
X-List-Received-Date: Tue, 19 Jun 2012 12:05:03 -0000
X-Groupsio-MsgNum: 23754
Content-Type: multipart/mixed; boundary="------------080404050106000500020003"

--------------080404050106000500020003
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi

Some of you may remember me from old times. Recently I got some work to
do related with OpenEmbedded but I need working toolchain on target device.

I use openembedded-core and got few problems with "core-image-lsb-sdk"
on qemux86 target (final image will be armv7 or even armv8 later).

First thing: binutils - "ld: this linker was not configured to use
sysroots" even with simple hello.c source. Fix attached.

Second thing: gcc (or rather g++) which is unable to find STL headers
(after installing libstdc++-dev package):

ignoring nonexistent directory "usr/include/c++/"
ignoring nonexistent directory "usr/include/c++//i586-oe-linux"
ignoring nonexistent directory "usr/include/c++//backward"
ignoring nonexistent directory "/usr/local/include"
ignoring nonexistent directory
"/usr/lib/gcc/i586-oe-linux/4.7.1/../../../../i586-oe-linux/include"
#include "..." search starts here:
 .
#include <...> search starts here:
 ..
 ../lib
 /usr/lib/gcc/i586-oe-linux/4.7.1/include
 /usr/lib/gcc/i586-oe-linux/4.7.1/include-fixed
 /usr/include
 ../lib/compat
End of search list.

So far I did not looked at fixing this part but will do as I want to be
able to build anything on target.

So what status is of C/C++ toolchain in OE-Core?


Full log:

root@qemux86:~/dpkg-1.16.4.3/dselect# g++ -DHAVE_CONFIG_H
-DLOCALEDIR=\"/usr/local/share/locale\"
-DADMINDIR=\"/usr/local/var/lib/dpkg\" -DLIBDIR=\"/usr/local/lib/dpkg\"
-DLOCALLIBDIR=\"/usr/local/lib/dpkg\" -idirafter ../lib/compat -iquote .
-I.. -I../lib   -Wall -Wextra -Wno-unused-parameter
-Wno-missing-field-initializers       -Wmissing-declarations
-Wmissing-format-attribute       -Wformat-security -Wpointer-arith
 -Wvla -Winit-self -Wwrite-strings -Wcast-align -Wshadow
-Wno-unused-value -g -O2 -MT basecmds.o -MD -MP -MF .deps/basecmds.Tpo
-c -o basecmds.o basecmds.cc -v

Using built-in specs.


COLLECT_GCC=g++


Target: i586-oe-linux
Configured with:
/home/hrw/HDD/devel/canonical/ci-linaro/oecore/build/tmp-oe-gcc-eglibc/work-shared/gcc-4.7.0+svnr186651-r2/gcc-4_7-branch/configure
--build=x86_64-linux --host=i586-oe-linux --target=i586-oe-linux
--prefix=/usr --exec_prefix=/usr --bindir=/usr/bin --sbindir=/usr/sbin
--libexecdir=/usr/libexec --datadir=/usr/share --sysconfdir=/etc
--sharedstatedir=/com --localstatedir=/var --libdir=/usr/lib
--includedir=/usr/include --oldincludedir=/usr/include
--infodir=/usr/share/info --mandir=/usr/share/man --disable-silent-rules
--disable-dependency-tracking
--with-libtool-sysroot=/home/hrw/HDD/devel/canonical/ci-linaro/oecore/build/tmp-oe-gcc-eglibc/sysroots/qemux86
--with-gnu-ld --enable-shared --enable-languages=c,c++
--enable-threads=posix --disable-multilib --enable-c99
--enable-long-long --enable-symvers=gnu --enable-libstdcxx-pch
--program-prefix=i586-oe-linux- --without-local-prefix
--enable-target-optspace --enable-lto --enable-libssp
--disable-bootstrap --disable-libgomp --disable-libmudflap
--with-system-zlib --with-linker-hash-style=gnu --with-ppl=no
--with-cloog=no --enable-checking=release --enable-cheaders=c_global
--with-sysroot=/
--with-build-sysroot=/home/hrw/HDD/devel/canonical/ci-linaro/oecore/build/tmp-oe-gcc-eglibc/sysroots/qemux86
--with-gxx-include-dir=/usr/include/c++/ --enable-nls --enable-__cxa_atexit
Thread model: posix
gcc version 4.7.1 20120421 (prerelease) (GCC)
COLLECT_GCC_OPTIONS='-D' 'HAVE_CONFIG_H' '-D'
'LOCALEDIR="/usr/local/share/locale"' '-D'
'ADMINDIR="/usr/local/var/lib/dpkg"' '-D' 'LIBDIR="/usr/local/lib/dpkg"'
'-D' 'LOCALLIBDIR="/usr/local/lib/dpkg"' '-idirafter' '../lib/compat'
'-iquote' '.' '-I' '..' '-I' '../lib' '-Wall' '-Wextra'
'-Wno-unused-parameter' '-Wno-missing-field-initializers'
'-Wmissing-declarations' '-Wmissing-format-attribute'
'-Wformat-security' '-Wpointer-arith' '-Wvla' '-Winit-self'
'-Wwrite-strings' '-Wcast-align' '-Wshadow' '-Wno-unused-value' '-g'
'-O2' '-MT' 'basecmds.o' '-MD' '-MP' '-MF' '.deps/basecmds.Tpo' '-c'
'-o' 'basecmds.o' '-v' '-shared-libgcc' '-mtune=pentium' '-march=pentium'
 /usr/libexec/gcc/i586-oe-linux/4.7.1/cc1plus -quiet -v -I .. -I ../lib
-MD basecmds.d -MF .deps/basecmds.Tpo -MP -MT basecmds.o -D_GNU_SOURCE
-D HAVE_CONFIG_H -D LOCALEDIR="/usr/local/share/locale" -D
ADMINDIR="/usr/local/var/lib/dpkg" -D LIBDIR="/usr/local/lib/dpkg" -D
LOCALLIBDIR="/usr/local/lib/dpkg" -idirafter ../lib/compat -iquote .
basecmds.cc -quiet -dumpbase basecmds.cc -mtune=pentium -march=pentium
-auxbase-strip basecmds.o -g -O2 -Wall -Wextra -Wno-unused-parameter
-Wno-missing-field-initializers -Wmissing-declarations
-Wmissing-format-attribute -Wformat-security -Wpointer-arith -Wvla
-Winit-self -Wwrite-strings -Wcast-align -Wshadow -Wno-unused-value
-version -o /tmp/cc8JRMwR.s
GNU C++ (GCC) version 4.7.1 20120421 (prerelease) (i586-oe-linux)
        compiled by GNU C version 4.7.1 20120421 (prerelease), GMP
version 5.0.4, MPFR version 3.1.0, MPC version 0.8.2
GGC heuristics: --param ggc-min-expand=37 --param ggc-min-heapsize=14944
ignoring nonexistent directory "usr/include/c++/"
ignoring nonexistent directory "usr/include/c++//i586-oe-linux"
ignoring nonexistent directory "usr/include/c++//backward"
ignoring nonexistent directory "/usr/local/include"
ignoring nonexistent directory
"/usr/lib/gcc/i586-oe-linux/4.7.1/../../../../i586-oe-linux/include"
#include "..." search starts here:
 .
#include <...> search starts here:
 ..
 ../lib
 /usr/lib/gcc/i586-oe-linux/4.7.1/include
 /usr/lib/gcc/i586-oe-linux/4.7.1/include-fixed
 /usr/include
 ../lib/compat
End of search list.
GNU C++ (GCC) version 4.7.1 20120421 (prerelease) (i586-oe-linux)
        compiled by GNU C version 4.7.1 20120421 (prerelease), GMP
version 5.0.4, MPFR version 3.1.0, MPC version 0.8.2
GGC heuristics: --param ggc-min-expand=37 --param ggc-min-heapsize=14944
Compiler executable checksum: f2356c38dccf4363f0860c867fa500e7
In file included from basecmds.cc:32:0:
dselect.h:27:21: fatal error: algorithm: No such file or directory
compilation terminated.


--------------080404050106000500020003
Content-Type: text/x-patch;
 name="0001-binutils-set-sysroot-for-target.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-binutils-set-sysroot-for-target.patch"

From 9a988989916b2093949696368cf96c6c4fb22c8d Mon Sep 17 00:00:00 2001
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Tue, 19 Jun 2012 13:16:53 +0200
Subject: [PATCH] binutils: set sysroot for target

"ld: this linker was not configured to use sysroots" was what I got on
device instead of compiled binary.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta/recipes-devtools/binutils/binutils_2.22.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils_2.22.bb b/meta/recipes-devtools/binutils/binutils_2.22.bb
index 7b6adef..71523d7 100644
--- a/meta/recipes-devtools/binutils/binutils_2.22.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.22.bb
@@ -1,6 +1,6 @@
 require binutils.inc
 
-PR = "r9"
+PR = "r10"
 
 LIC_FILES_CHKSUM="\
     file://src-release;endline=17;md5=4830a9ef968f3b18dd5e9f2c00db2d35\
@@ -40,3 +40,5 @@ SRC_URI[sha256sum] = "6c7af8ed1c8cf9b4b9d6e6fe09a3e1d3d479fe63984ba8b9b26bf356b6
 
 
 BBCLASSEXTEND = "native"
+
+EXTRA_OECONF += "--with-sysroot=/ "
-- 
1.7.10.4


--------------080404050106000500020003--
