Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T3fRG-0006T8-44
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 05:47:34 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Aug 2012 20:35:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,799,1336374000"; d="scan'208";a="183244339"
Received: from unknown (HELO [10.255.13.49]) ([10.255.13.49])
	by orsmga001.jf.intel.com with ESMTP; 20 Aug 2012 20:35:27 -0700
Message-ID: <503301FF.6060503@linux.intel.com>
Date: Mon, 20 Aug 2012 20:35:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <CAMKF1srjqDsesRcWP7oGzouPj9aOt_Ln0aOWE9cEQwpUQ7Unuw@mail.gmail.com>
In-Reply-To: <CAMKF1srjqDsesRcWP7oGzouPj9aOt_Ln0aOWE9cEQwpUQ7Unuw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Toolchain rework, call for testing
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Aug 2012 03:47:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/16/2012 09:47 PM, Khem Raj wrote:
> Hi All
>
> Recently glibc build has been simplified upstream. It has dropped the
> dependency on libgcc_s and libgcc_eh for building glibc itself.
> This means that we can simplify our toolchain bootstrap a bit by
> dropping 1 of the 3 cross gcc build stages. We do not need
> gcc-cross-intermediate
> anymore. This should bring some build time reduction and simplify the
> bootstrap. I have a series of patches which I have tested
> by building core-image-minimal and meta-toolchain for all supported
> qemu architectures and also uclibc/eglibc both
> but it needs a lot more testing therefore I am calling out wider
> audience for help in testing it out.
>
> The branch is
>
> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/toolchain-rework
>
Might be some small issues with the non-gplv3 build (test using 
INCOMPATIBLE_LICENSE="GPLv3"

> ERROR: Function failed: do_compile (see /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-non-gpl3/build/build/tmp/work/i586-poky-linux/gmp-4.2.1-r2/temp/log.do_compile.17894 for further information)
> ERROR: Logfile of failure stored in: /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-non-gpl3/build/build/tmp/work/i586-poky-linux/gmp-4.2.1-r2/temp/log.do_compile.17894
> Log data follows:
> | DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux', 'common-glibc', 'i586-linux', 'common']
> | DEBUG: Executing shell function do_compile
> | NOTE: make -j 16
> | i586-poky-linux-gcc  -m32   -march=i586 --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-non-gpl3/build/build/tmp/sysroots/qemux86 `test -f 'gen-fac_ui.c' || echo './'`gen-fac_ui.c -o gen-fac_ui
> | i586-poky-linux-gcc  -m32   -march=i586 --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-non-gpl3/build/build/tmp/sysroots/qemux86 `test -f 'gen-fib.c' || echo './'`gen-fib.c -o gen-fib
> | i586-poky-linux-gcc  -m32   -march=i586 --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-non-gpl3/build/build/tmp/sysroots/qemux86 `test -f 'gen-bases.c' || echo './'`gen-bases.c -o gen-bases -lm
> | i586-poky-linux-gcc  -m32   -march=i586 --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-non-gpl3/build/build/tmp/sysroots/qemux86 `test -f 'gen-psqr.c' || echo './'`gen-psqr.c -o gen-psqr -lm
> | ./gen-fib header 32 0 >fib_table.h || (rm -f fib_table.h; exit 1)
> | ./gen-fib table 32 0 >mpn/fib_table.c || (rm -f mpn/fib_table.c; exit 1)
> | ./gen-fac_ui 32 0 >mpz/fac_ui.h || (rm -f mpz/fac_ui.h; exit 1)
> | ./gen-bases header 32 0 >mp_bases.h || (rm -f mp_bases.h; exit 1)
> | ./gen-bases table 32 0 >mpn/mp_bases.c || (rm -f mpn/mp_bases.c; exit 1)
> | ./gen-psqr 32 0 >mpn/perfsqr.h || (rm -f mpn/perfsqr.h; exit 1)
> | ./gen-bases: error while loading shared libraries: libgcc_s.so.1: cannot open shared object file: No such file or directory
> | ./gen-bases: error while loading shared libraries: libgcc_s.so.1: cannot open shared object file: No such file or directory
> | ./gen-psqr: error while loading shared libraries: libgcc_s.so.1: cannot open shared object file: No such file or directory
> | make: *** [mp_bases.h] Error 1
> | make: *** Waiting for unfinished jobs....
> | make: *** [mpn/mp_bases.c] Error 1
> | make: *** [mpn/perfsqr.h] Error 1
> | ERROR: oe_runmake failed
> | ERROR: Function failed: do_compile (see /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-non-gpl3/build/build/tmp/work/i586-poky-linux/gmp-4.2.1-r2/temp/log.do_compile.17894 for further information)
> NOTE: recipe gmp-4.2.1-r2: task do_compile: Failed

Older version of gmp seems to fail.

Sau!


> Thanks
>
> -Khem
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


