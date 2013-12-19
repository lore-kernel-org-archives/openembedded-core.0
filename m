Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EA38260DEC;
	Thu, 19 Dec 2013 15:21:44 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Dec 2013 07:21:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,512,1384329600"; d="scan'208";a="454913152"
Received: from unknown (HELO [10.255.15.132]) ([10.255.15.132])
	by orsmga002.jf.intel.com with ESMTP; 19 Dec 2013 07:21:10 -0800
Message-ID: <52B30EE5.6050901@linux.intel.com>
Date: Thu, 19 Dec 2013 07:21:09 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, 
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAMKF1spWnFvXRAp-GuoBL9vXceg29h5Numv7PYhZNWUJu8rMRw@mail.gmail.com>
In-Reply-To: <CAMKF1spWnFvXRAp-GuoBL9vXceg29h5Numv7PYhZNWUJu8rMRw@mail.gmail.com>
Subject: Re: [RFC] Binutils upgrade to 2.24
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
X-List-Received-Date: Thu, 19 Dec 2013 15:21:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/16/2013 12:03 PM, Khem Raj wrote:
> Hi
>
> I have pushed a contrib branch for binutils 2.24 upgrade here
>
> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/binutils-2.24
>
> I have tested it on both uclibc/eglibc and qemu machines. But it would
> be nice if
> it gets more testing for machines I havent tested
>

Looks like we tickled an LD bug of somekind, we are seeing the following 
failure across all machines, this was a second build using binutils 
2.24, so there was some shared state usage.

RP pointed out the --as-needed option was used with -lm as those symbols 
are math related.

> | powerpc-poky-linux-gcc  -m32 -mhard-float -mcpu=7400 --sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/work/ppc7400-poky-linux/wireless-tools/1_29-r4/wireless_tools.29  -O2 -pipe -g -feliminate-unused-debug-types -MMD     -o iwconfig iwconfig.o libiw.so.29 -lm
> | powerpc-poky-linux-gcc  -m32 -mhard-float -mcpu=7400 --sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/work/ppc7400-poky-linux/wireless-tools/1_29-r4/wireless_tools.29  -O2 -pipe -g -feliminate-unused-debug-types -MMD     -o iwlist iwlist.o libiw.so.29 -lm
> | powerpc-poky-linux-gcc  -m32 -mhard-float -mcpu=7400 --sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/work/ppc7400-poky-linux/wireless-tools/1_29-r4/wireless_tools.29  -O2 -pipe -g -feliminate-unused-debug-types -MMD     -o iwpriv iwpriv.o libiw.so.29 -lm
> | powerpc-poky-linux-gcc  -m32 -mhard-float -mcpu=7400 --sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/work/ppc7400-poky-linux/wireless-tools/1_29-r4/wireless_tools.29  -O2 -pipe -g -feliminate-unused-debug-types -MMD     -o iwspy iwspy.o libiw.so.29 -lm
> | powerpc-poky-linux-gcc  -m32 -mhard-float -mcpu=7400 --sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/work/ppc7400-poky-linux/wireless-tools/1_29-r4/wireless_tools.29  -O2 -pipe -g -feliminate-unused-debug-types -MMD     -o iwgetid iwgetid.o libiw.so.29 -lm
> | powerpc-poky-linux-gcc  -m32 -mhard-float -mcpu=7400 --sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/work/ppc7400-poky-linux/wireless-tools/1_29-r4/wireless_tools.29  -O2 -pipe -g -feliminate-unused-debug-types -MMD     -o iwevent iwevent.o libiw.so.29 -lm
> | libiw.so.29: undefined reference to `ceil'
> | libiw.so.29: undefined reference to `pow'
> | libiw.so.29: undefined reference to `log10'
> | libiw.so.29: undefined reference to `floor'
> | collect2: error: ld returned 1 exit status
> | make: *** [iwconfig] Error 1
> | make: *** Waiting for unfinished jobs....
> | libiw.so.29: undefined reference to `ceil'
> | libiw.so.29: undefined reference to `pow'
> | libiw.so.29: undefined reference to `log10'
> | libiw.so.29: undefined reference to `floor'
> | collect2: error: ld returned 1 exit status
> | make: *** [iwgetid] Error 1
> | libiw.so.29: undefined reference to `ceil'
> | libiw.so.29: undefined reference to `pow'
> | libiw.so.29: undefined reference to `log10'
> | libiw.so.29: undefined reference to `floor'
> | collect2: error: ld returned 1 exit status
> | make: *** [iwspy] Error 1
> | libiw.so.29: undefined reference to `ceil'
> | libiw.so.29: undefined reference to `pow'
> | libiw.so.29: undefined reference to `log10'
> | libiw.so.29: undefined reference to `floor'
> | collect2: error: ld returned 1 exit status
> | make: *** [iwpriv] Error 1
> | libiw.so.29: undefined reference to `ceil'
> | libiw.so.29: undefined reference to `pow'
> | libiw.so.29: undefined reference to `log10'
> | libiw.so.29: undefined reference to `floor'
> | collect2: error: ld returned 1 exit status
> | make: *** [iwlist] Error 1
> | libiw.so.29: undefined reference to `ceil'
> | libiw.so.29: undefined reference to `pow'
> | libiw.so.29: undefined reference to `log10'
> | libiw.so.29: undefined reference to `floor'
> | collect2: error: ld returned 1 exit status
> | make: *** [iwevent] Error 1
> | ERROR: oe_runmake failed


Link to the AB example, this is one of many.

http://autobuilder.yoctoproject.org/main/builders/nightly-ppc/builds/54/steps/Building%20Images/logs/stdio


Sau!

> Thanks
>
> -Khem
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

