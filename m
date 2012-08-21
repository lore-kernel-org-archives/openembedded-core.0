Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T3gO1-0003Ta-T1
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 06:48:17 +0200
Received: by eekb57 with SMTP id b57so1527508eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 21:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=zMYeVKM8ze9qirh6AYCjd42K5J5f2mPPrCYAdRr9Dl4=;
	b=0vH0P9AOq98UXeuNhaAaALaM4ztrpocndCbShrdDynAvtrI2yHbDF86i6nMy4LqC4S
	kWFkeZsySvJlweQNOgDoWzrv3/pc5OqiTW0XOVwX8UvykWYJtrxDAOWUG5MoH/kuAvpc
	LfMepHTe1sc3PZruzdHhrIRMgyN3zqvS3izd7qE5tLrt95FK0Mb9EJ1b8cvDZjRtytV2
	vco5keciNHQwdD+00L0/D2vM3y1STRTyqqg6TdHkz8dtcmwlyEgObdwlcG5d0sjVEDWs
	MNX+fjkj0pA7QV8JqCteyA80eTqccbhdSeY/kng5SK1c3s/Joh6+NpJRrpKra317sEIS
	dbcg==
Received: by 10.14.211.3 with SMTP id v3mr11572644eeo.43.1345523774532; Mon,
	20 Aug 2012 21:36:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Mon, 20 Aug 2012 21:35:44 -0700 (PDT)
In-Reply-To: <503301FF.6060503@linux.intel.com>
References: <CAMKF1srjqDsesRcWP7oGzouPj9aOt_Ln0aOWE9cEQwpUQ7Unuw@mail.gmail.com>
	<503301FF.6060503@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Aug 2012 21:35:44 -0700
Message-ID: <CAMKF1spryKsHys54URK+W7jAibsTW3uhHc=T+RJ--PbVf2mGMQ@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
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
X-List-Received-Date: Tue, 21 Aug 2012 04:48:18 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 20, 2012 at 8:35 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 08/16/2012 09:47 PM, Khem Raj wrote:
>>
>> Hi All
>>
>> Recently glibc build has been simplified upstream. It has dropped the
>> dependency on libgcc_s and libgcc_eh for building glibc itself.
>> This means that we can simplify our toolchain bootstrap a bit by
>> dropping 1 of the 3 cross gcc build stages. We do not need
>> gcc-cross-intermediate
>> anymore. This should bring some build time reduction and simplify the
>> bootstrap. I have a series of patches which I have tested
>> by building core-image-minimal and meta-toolchain for all supported
>> qemu architectures and also uclibc/eglibc both
>> but it needs a lot more testing therefore I am calling out wider
>> audience for help in testing it out.
>>
>> The branch is
>>
>>
>> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/toolchain-rework
>>
> Might be some small issues with the non-gplv3 build (test using
> INCOMPATIBLE_LICENSE="GPLv3"

hmm, Add libgcc to DEPENDS of gmp-4.2.1 and see if that fixes this issue

>
>> ERROR: Function failed: do_compile (see
>> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-non-gpl3/build/build/tmp/work/i586-poky-linux/gmp-4.2.1-r2/temp/log.do_compile.17894
>> for further information)
>> ERROR: Logfile of failure stored in:
>> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-non-gpl3/build/build/tmp/work/i586-poky-linux/gmp-4.2.1-r2/temp/log.do_compile.17894
>> Log data follows:
>> | DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common',
>> 'common-linux', 'common-glibc', 'i586-linux', 'common']
>> | DEBUG: Executing shell function do_compile
>> | NOTE: make -j 16
>> | i586-poky-linux-gcc  -m32   -march=i586
>> --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-non-gpl3/build/build/tmp/sysroots/qemux86
>> `test -f 'gen-fac_ui.c' || echo './'`gen-fac_ui.c -o gen-fac_ui
>> | i586-poky-linux-gcc  -m32   -march=i586
>> --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-non-gpl3/build/build/tmp/sysroots/qemux86
>> `test -f 'gen-fib.c' || echo './'`gen-fib.c -o gen-fib
>> | i586-poky-linux-gcc  -m32   -march=i586
>> --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-non-gpl3/build/build/tmp/sysroots/qemux86
>> `test -f 'gen-bases.c' || echo './'`gen-bases.c -o gen-bases -lm
>> | i586-poky-linux-gcc  -m32   -march=i586
>> --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-non-gpl3/build/build/tmp/sysroots/qemux86
>> `test -f 'gen-psqr.c' || echo './'`gen-psqr.c -o gen-psqr -lm
>> | ./gen-fib header 32 0 >fib_table.h || (rm -f fib_table.h; exit 1)
>> | ./gen-fib table 32 0 >mpn/fib_table.c || (rm -f mpn/fib_table.c; exit 1)
>> | ./gen-fac_ui 32 0 >mpz/fac_ui.h || (rm -f mpz/fac_ui.h; exit 1)
>> | ./gen-bases header 32 0 >mp_bases.h || (rm -f mp_bases.h; exit 1)
>> | ./gen-bases table 32 0 >mpn/mp_bases.c || (rm -f mpn/mp_bases.c; exit 1)
>> | ./gen-psqr 32 0 >mpn/perfsqr.h || (rm -f mpn/perfsqr.h; exit 1)
>> | ./gen-bases: error while loading shared libraries: libgcc_s.so.1: cannot
>> open shared object file: No such file or directory
>> | ./gen-bases: error while loading shared libraries: libgcc_s.so.1: cannot
>> open shared object file: No such file or directory
>> | ./gen-psqr: error while loading shared libraries: libgcc_s.so.1: cannot
>> open shared object file: No such file or directory
>> | make: *** [mp_bases.h] Error 1
>> | make: *** Waiting for unfinished jobs....
>> | make: *** [mpn/mp_bases.c] Error 1
>> | make: *** [mpn/perfsqr.h] Error 1
>> | ERROR: oe_runmake failed
>> | ERROR: Function failed: do_compile (see
>> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-non-gpl3/build/build/tmp/work/i586-poky-linux/gmp-4.2.1-r2/temp/log.do_compile.17894
>> for further information)
>> NOTE: recipe gmp-4.2.1-r2: task do_compile: Failed
>
>
> Older version of gmp seems to fail.
>
> Sau!
>
>
>> Thanks
>>
>> -Khem
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>


