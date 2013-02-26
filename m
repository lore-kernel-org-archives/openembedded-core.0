Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UAFaM-0006Ru-Og
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 09:08:34 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 25 Feb 2013 23:52:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,739,1355126400"; d="scan'208";a="295943446"
Received: from unknown (HELO [10.255.12.143]) ([10.255.12.143])
	by fmsmga002.fm.intel.com with ESMTP; 25 Feb 2013 23:52:06 -0800
Message-ID: <512C69A6.6040707@linux.intel.com>
Date: Mon, 25 Feb 2013 23:52:06 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Marko Lindqvist <cazfi74@gmail.com>
References: <cover.1361091390.git.cazfi74@gmail.com>
	<5123B265.9050003@linux.intel.com>
	<CAF6bG8ei3p_RjsZX2Nmf5fy+StgJThrcR6R_rZ6-wT_A+6kAkg@mail.gmail.com>
	<CAF6bG8c9BU06uGvuM0ENuyGL4yggQOct620yP18kbkrh_bxbLA@mail.gmail.com>
	<512BE70F.4050707@linux.intel.com>
	<CAF6bG8fPGOjUB_nvNML1SAckQngEOSijzDH43dtSSQ7FmCmquw@mail.gmail.com>
In-Reply-To: <CAF6bG8fPGOjUB_nvNML1SAckQngEOSijzDH43dtSSQ7FmCmquw@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] automake-1.13 and upstream version updates
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
X-List-Received-Date: Tue, 26 Feb 2013 08:08:34 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/25/2013 11:42 PM, Marko Lindqvist wrote:
> On 26 February 2013 00:34, Saul Wold <sgw@linux.intel.com> wrote:
>> On 02/25/2013 03:40 AM, Marko Lindqvist wrote:
>>>
>>> On 20 February 2013 16:32, Marko Lindqvist <cazfi74@gmail.com> wrote:
>>>>
>>>> On 19 February 2013 19:12, Saul Wold <sgw@linux.intel.com> wrote:
>>>>>
>>>>> On 02/17/2013 01:00 AM, Marko Lindqvist wrote:
>>>>>>
>>>>>>      libffi: update to upstream version 3.0.12
>>>>>
>>>>>
>>>>> Not sure what's going on but I saw a batch of failures with glib-2.0,
>>>>> take a
>>>>> look at the autobuilder failure:
>>>>>
>>>>>
>>>>> http://autobuilder.yoctoproject.org:8010/builders/nightly-ppc/builds/808/steps/shell_29/logs/stdio
>>>>>
>>>>>    or
>>>>>
>>>>>
>>>>> http://autobuilder.yoctoproject.org:8010/builders/nightly-x86/builds/931/steps/shell_29/logs/stdio
>>>>>
>>>>> Not sure why, but glib-2.0 is not finding the libffi library, but it
>>>>> seems
>>>>> to exist in the sysroot.
>>>>
>>>>
>>>>    I should be able to take a brief look next weekend, but tonight and
>>>> tomorrow I'm busy with other things.
>>>
>>>
>>>    I've found no way to reproduce this on my own computer no matter how
>>> I've tried to invalidate parts of the cache etc. but I wonder if it
>>> could be that for some reason libffi didn't exist in sysroot already
>>> at the time it was needed, only later when you checked for it. I see
>>> no problem with glib-2.0-native dependencies, though.
>>>
>> I found a way to reproduce it and fix it, I believe!
>>
>> Just curious, what's your build host arch?  and what does gcc
>> -print-multi-os-directory return on your host?
>
>   x86_64-linux
>
>   > gcc -print-multi-os-directory
> ../lib
>
Interesting, I get ../lib64 from that on a Fedora 18 machines

my gcc -v output:

Using built-in specs.
COLLECT_GCC=gcc
COLLECT_LTO_WRAPPER=/usr/libexec/gcc/x86_64-redhat-linux/4.7.2/lto-wrapper
Target: x86_64-redhat-linux
Configured with: ../configure --prefix=/usr --mandir=/usr/share/man 
--infodir=/usr/share/info 
--with-bugurl=http://bugzilla.redhat.com/bugzilla --enable-bootstrap 
--enable-shared --enable-threads=posix --enable-checking=release 
--disable-build-with-cxx --disable-build-poststage1-with-cxx 
--with-system-zlib --enable-__cxa_atexit --disable-libunwind-exceptions 
--enable-gnu-unique-object --enable-linker-build-id 
--with-linker-hash-style=gnu 
--enable-languages=c,c++,objc,obj-c++,java,fortran,ada,go,lto 
--enable-plugin --enable-initfini-array --enable-java-awt=gtk 
--disable-dssi --with-java-home=/usr/lib/jvm/java-1.5.0-gcj-1.5.0.0/jre 
--enable-libgcj-multifile --enable-java-maintainer-mode 
--with-ecj-jar=/usr/share/java/eclipse-ecj.jar 
--disable-libjava-multilib --with-ppl --with-cloog --with-tune=generic 
--with-arch_32=i686 --build=x86_64-redhat-linux

Even after I commented out this code in configure.ac, I was then getting 
gconf (a dependee of libffi) complaining about a redunant RPATH which 
also traced down to the newer version of libffi!

There seems to be some issue lurking here with configure and libtool.

Sau!


>   > gcc -v
> Using built-in specs.
> COLLECT_GCC=gcc
> COLLECT_LTO_WRAPPER=/usr/lib/gcc/x86_64-linux-gnu/4.7/lto-wrapper
> Target: x86_64-linux-gnu
> Configured with: ../src/configure -v --with-pkgversion='Debian
> 4.7.2-5' --with-bugurl=file:///usr/share/doc/gcc-4.7/README.Bugs
> --enable-languages=c,c++,go,fortran,objc,obj-c++ --prefix=/usr
> --program-suffix=-4.7 --enable-shared --enable-linker-build-id
> --with-system-zlib --libexecdir=/usr/lib --without-included-gettext
> --enable-threads=posix --with-gxx-include-dir=/usr/include/c++/4.7
> --libdir=/usr/lib --enable-nls --with-sysroot=/ --enable-clocale=gnu
> --enable-libstdcxx-debug --enable-libstdcxx-time=yes
> --enable-gnu-unique-object --enable-plugin --enable-objc-gc
> --with-arch-32=i586 --with-tune=generic --enable-checking=release
> --build=x86_64-linux-gnu --host=x86_64-linux-gnu
> --target=x86_64-linux-gnu
> Thread model: posix
> gcc version 4.7.2 (Debian 4.7.2-5)
>
>
>> It returns lib64 on my host and it causes the libs to be installed in the
>> <WORKDIR>/image/usr/lib64 dir and not get picked up by the
>> populate_sysroot() code.
>>
>> I commented out some code in configure.ac and that seems to have solved the
>> problem, but I am not sure if we need to start adding lib64 to
>> populate_sysroot or tweaking configure code!
>>
>> Sau!
>
>
>   - ML
>
>


