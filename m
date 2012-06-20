Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1ShJxD-0004YK-7q
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 14:24:11 +0200
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 303F5D2380; Wed, 20 Jun 2012 14:13:30 +0200 (CEST)
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
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 15AC9D232B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 14:12:59 +0200 (CEST)
Message-ID: <4FE1BE46.4080507@linaro.org>
Date: Wed, 20 Jun 2012 14:12:54 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120611 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4FE0684D.2000906@linaro.org> <4FE0714A.1060603@linaro.org>
	<CAMKF1spK-ezqmFr+rh7J5dcbVvPbpDFGHxW02HvX9uaWdqTohQ@mail.gmail.com>
	<4FE0A7DF.7030909@linaro.org>
	<CAMKF1so50NhTxaeeghsH8ogD=HUgmGDjR8rnh4yPbYv0JaU5tA@mail.gmail.com>
In-Reply-To: <CAMKF1so50NhTxaeeghsH8ogD=HUgmGDjR8rnh4yPbYv0JaU5tA@mail.gmail.com>
Subject: Re: Is target toolchain supposed to be working?
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
X-List-Received-Date: Wed, 20 Jun 2012 12:24:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 20.06.2012 09:55, Khem Raj pisze:
> On Tue, Jun 19, 2012 at 9:25 AM, Marcin Juszkiewicz 
> <marcin.juszkiewicz@linaro.org> wrote:
>> W dniu 19.06.2012 18:19, Khem Raj pisze:
>> 
>>> includedir already has leading slash so I wonder if you changed 
>>> includedir in your setup somehow ?
>> 
>> bitbake gcc -e|grep ^includedir shown "/usr/include" value. G++
>> started on target as "g++ -v" shown
>> "--with-c++-includes=/usr/include/c++" so I was surprised when it
>> was not working.
>> 
>> Added extra slash and it works. But please check in your
>> configuration.
>> 
> 
> can you try the fixes from my branch
> 
> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/misc-updates
>
>  this should fix both gcc and binutils on target

I am still building one image from scratch but my build with gcc-linaro
and your fix-g++-sysroot.patch applied works perfectly:

root@qemux86:~# g++ -v hello.cc -o hello
Using built-in specs.
COLLECT_GCC=g++
COLLECT_LTO_WRAPPER=/usr/libexec/gcc/i586-oe-linux/4.7.1/lto-wrapper
Target: i586-oe-linux
Configured with:
/home/hrw/HDD/devel/canonical/ci-linaro/oecore/build/tmp-eglibc/work-shared/gcc-linaro-4.7-r4/gcc-linaro-4.7-2012.06/configure
--build=x86_64-linux --host=i586-oe-linux --target=i586-oe-linux
--prefix=/usr --exec_prefix=/usr --bindir=/usr/bin --sbindir=/usr/sbin
--libexecdir=/usr/libexec --datadir=/usr/share --sysconfdir=/etc
--sharedstatedir=/com --localstatedir=/var --libdir=/usr/lib
--includedir=/usr/include --oldincludedir=/usr/include
--infodir=/usr/share/info --mandir=/usr/share/man --disable-silent-rules
--disable-dependency-tracking
--with-libtool-sysroot=/home/hrw/HDD/devel/canonical/ci-linaro/oecore/build/tmp-eglibc/sysroots/qemux86
--with-gnu-ld --enable-shared --enable-languages=c,c++
--enable-threads=posix --disable-multilib --enable-c99
--enable-long-long --enable-symvers=gnu --enable-libstdcxx-pch
--program-prefix=i586-oe-linux- --without-local-prefix
--enable-target-optspace --enable-lto --enable-libssp
--disable-bootstrap --disable-libgomp --disable-libmudflap
--with-system-zlib --with-linker-hash-style=gnu --with-ppl=no
--with-cloog=no --enable-checking=release --enable-cheaders=c_global
--with-sysroot=/
--with-build-sysroot=/home/hrw/HDD/devel/canonical/ci-linaro/oecore/build/tmp-eglibc/sysroots/qemux86
--with-gxx-include-dir=/usr/include/c++/ --enable-nls --enable-__cxa_atexit
Thread model: posix
gcc version 4.7.1 20120531 (prerelease) (Linaro GCC 4.7-2012.06)
COLLECT_GCC_OPTIONS='-v' '-o' 'hello' '-shared-libgcc' '-mtune=pentium'
'-march=pentium'
 /usr/libexec/gcc/i586-oe-linux/4.7.1/cc1plus -quiet -v -D_GNU_SOURCE
hello.cc -quiet -dumpbase hello.cc -mtune=pentium -march=pentium
-auxbase hello -version -o /tmp/ccDHhaba.s
GNU C++ (Linaro GCC 4.7-2012.06) version 4.7.1 20120531 (prerelease)
(i586-oe-linux)
        compiled by GNU C version 4.7.1 20120531 (prerelease), GMP
version 5.0.4, MPFR version 3.1.0, MPC version 0.8.2
GGC heuristics: --param ggc-min-expand=63 --param ggc-min-heapsize=63580
ignoring nonexistent directory "/usr/local/include"
ignoring nonexistent directory
"/usr/lib/gcc/i586-oe-linux/4.7.1/../../../../i586-oe-linux/include"
#include "..." search starts here:
#include <...> search starts here:
 /usr/include/c++/
 /usr/include/c++//i586-oe-linux
 /usr/include/c++//backward
 /usr/lib/gcc/i586-oe-linux/4.7.1/include
 /usr/lib/gcc/i586-oe-linux/4.7.1/include-fixed
 /usr/include
End of search list.
GNU C++ (Linaro GCC 4.7-2012.06) version 4.7.1 20120531 (prerelease)
(i586-oe-linux)
        compiled by GNU C version 4.7.1 20120531 (prerelease), GMP
version 5.0.4, MPFR version 3.1.0, MPC version 0.8.2
GGC heuristics: --param ggc-min-expand=63 --param ggc-min-heapsize=63580
Compiler executable checksum: 585670605c6fcd60b0d620e1dbed0fa5
COLLECT_GCC_OPTIONS='-v' '-o' 'hello' '-shared-libgcc' '-mtune=pentium'
'-march=pentium'
 /usr/lib/gcc/i586-oe-linux/4.7.1/../../../../i586-oe-linux/bin/as -v
--32 -o /tmp/ccqQP9HY.o /tmp/ccDHhaba.s
GNU assembler version 2.22 (i586-oe-linux) using BFD version (GNU
Binutils) 2.22
COMPILER_PATH=/usr/libexec/gcc/i586-oe-linux/4.7.1/:/usr/libexec/gcc/i586-oe-linux/4.7.1/:/usr/libexec/gcc/i586-oe-linux/:/usr/lib/gcc/i586-oe-linux/4.7.1/:/usr/lib/gcc/i586-oe-linux/:/usr/lib/gcc/i586-oe-linux/4.7.1/../../../../i586-oe-linux/bin/
LIBRARY_PATH=/usr/lib/gcc/i586-oe-linux/4.7.1/:/usr/lib/gcc/i586-oe-linux/4.7.1/../../../i586-oe-linux/4.7.1/:/usr/lib/gcc/i586-oe-linux/4.7.1/../../../:/lib/:/usr/lib/i586-oe-linux/4.7.1/:/usr/lib/
COLLECT_GCC_OPTIONS='-v' '-o' 'hello' '-shared-libgcc' '-mtune=pentium'
'-march=pentium'
 /usr/libexec/gcc/i586-oe-linux/4.7.1/collect2 --sysroot=/
--eh-frame-hdr --hash-style=gnu -m elf_i386 -dynamic-linker
/lib/ld-linux.so.2 -o hello
/usr/lib/gcc/i586-oe-linux/4.7.1/../../../crt1.o
/usr/lib/gcc/i586-oe-linux/4.7.1/../../../crti.o
/usr/lib/gcc/i586-oe-linux/4.7.1/../../../i586-oe-linux/4.7.1/crtbegin.o
-L/usr/lib/gcc/i586-oe-linux/4.7.1
-L/usr/lib/gcc/i586-oe-linux/4.7.1/../../../i586-oe-linux/4.7.1
-L/usr/lib/gcc/i586-oe-linux/4.7.1/../../..
-L/usr/lib/i586-oe-linux/4.7.1 /tmp/ccqQP9HY.o -lstdc++ -lm -lgcc_s
-lgcc -lc -lgcc_s -lgcc
/usr/lib/gcc/i586-oe-linux/4.7.1/../../../i586-oe-linux/4.7.1/crtend.o
/usr/lib/gcc/i586-oe-linux/4.7.1/../../../crtn.o
root@qemux86:~#



