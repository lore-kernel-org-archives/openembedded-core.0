Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RuvNV-0007yF-10
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 01:27:17 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Feb 2012 16:19:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="105102651"
Received: from unknown (HELO [10.255.14.116]) ([10.255.14.116])
	by orsmga001.jf.intel.com with ESMTP; 07 Feb 2012 16:19:07 -0800
Message-ID: <4F31BF7B.4040303@linux.intel.com>
Date: Tue, 07 Feb 2012 16:19:07 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
	<c68f6de298c35c25638ea3a5adeb06c97cd74036.1328510189.git.raj.khem@gmail.com>
	<4F30DC16.1050506@linux.intel.com>
	<CAMKF1sqTc3PA_4xNbp1751tA73pRazsvrFdwhomdELtb-25ZGg@mail.gmail.com>
	<4F314A73.8070406@linux.intel.com>
	<20120207231245.GA13160@sakrah.homelinux.org>
In-Reply-To: <20120207231245.GA13160@sakrah.homelinux.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/20] zlib: Upgrade 1.2.5 -> 1.2.6
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
X-List-Received-Date: Wed, 08 Feb 2012 00:27:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/07/2012 03:12 PM, Khem Raj wrote:
> On (07/02/12 07:59), Saul Wold wrote:
>> On 02/07/2012 07:31 AM, Khem Raj wrote:
>>> On Tue, Feb 7, 2012 at 12:08 AM, Saul Wold<sgw@linux.intel.com>   wrote:
>>>> | /bin/grep: /intel/poky/builds/world/tmp/sysroots/qemux86/usr/lib/libz.la:
>>>> No such file or directory
>>>
>>> thanks ok I did not catch it with sato image build. which package is
>>> failing with this
>>> error.
>>>
>> pixman, gconf, polkit are the 3 I saw doing a world build.
>
> I havent been able to reproduce it with eglibc I tried bitbake gconf
> pixman polkit it all liked well. Might be my machine is just nice to me
> but that said when I get to the culprit it mostly will be the package
> who is using .la in weird way since zlib already ships a .pc file it
> should have used that one instead
>
Khem,

Can you verify if you have a .la file in you sysroot?

tmp/work/i586-poky-linux/zlib-1.2.5-r3/package/usr/lib:
libz.a  libz.la  libz.so  libz.so.1  libz.so.1.2.5  pkgconfig

tmp/work/i586-poky-linux/zlib-1.2.6-r0/package/usr/lib:
libz.a  libz.so  libz.so.1  libz.so.1.2.6  pkgconfig

Very reproducible on my machine:

| i586-poky-linux-libtool: link: cannot find the library 
`/intel/poky/builds/world/tmp/sysroots/qemux86/usr/lib/libz.la' or 
unhandled argument `=/usr/lib/libz.la'
| make[2]: *** [trap-crasher] Error 1
| make[2]: *** Waiting for unfinished jobs....
| i586-poky-linux-libtool: link: cannot find the library 
`/intel/poky/builds/world/tmp/sysroots/qemux86/usr/lib/libz.la' or 
unhandled argument `=/usr/lib/libz.la'
| make[2]: *** [fetch-test] Error 1
| i586-poky-linux-libtool: link: cannot find the library 
`/intel/poky/builds/world/tmp/sysroots/qemux86/usr/lib/libz.la' or 
unhandled argument `=/usr/lib/libz.la'
| make[2]: *** [region-test] Error 1
| i586-poky-linux-libtool: link: cannot find the library 
`/intel/poky/builds/world/tmp/sysroots/qemux86/usr/lib/libz.la' or 
unhandled argument `=/usr/lib/libz.la'
| make[2]: *** [pdf-op-test] Error 1
| i586-poky-linux-libtool: link: cannot find the library 
`/intel/poky/builds/world/tmp/sysroots/qemux86/usr/lib/libz.la' or 
unhERROR: Function failed: do_compile (see 
/intel/poky/builds/world/tmp/work/i586-poky-linux/pixman-1_0.24.2-r0/temp/log.do_compile.13548 
for further information)
| andled argument `=/usr/lib/libz.la'
| make[2]: *** [oob-test] Error 1
| i586-poky-linux-libtool: link: cannot find the library 
`/intel/poky/builds/world/tmp/sysroots/qemux86/usr/lib/libz.la' or 
unhandled argument `=/usr/lib/libz.la'
| make[2]: *** [alpha-loop] Error 1
| i586-poky-linux-libtool: link: cannot find the library 
`/intel/poky/builds/world/tmp/sysroots/qemux86/usr/lib/libz.la' or 
unhandled argument `=/usr/lib/libz.la'
| make[2]: *** [a1-trap-test] Error 1
| i586-poky-linux-libtool: link: cannot find the library 
`/intel/poky/builds/world/tmp/sysroots/qemux86/usr/lib/libz.la' or 
unhandled argument `=/usr/lib/libz.la'
| make[2]: *** [region-translate-test] Error 1
| i586-poky-linux-libtool: link: cannot find the library 
`/intel/poky/builds/world/tmp/sysroots/qemux86/usr/lib/libz.la' or 
unhandled argument `=/usr/lib/libz.la'
| make[2]: *** [scaling-helpers-test] Error 1
| i586-poky-linux-libtool: link: cannot find the library 
`/intel/poky/builds/world/tmp/sysroots/qemux86/usr/lib/libz.la' or 
unhandled argument `=/usr/lib/libz.la'
| make[2]: *** [scaling-crash-test] Error 1
| i586-poky-linux-libtool: link: cannot find the library 
`/intel/poky/builds/world/tmp/sysroots/qemux86/usr/lib/libz.la' or 
unhandled argument `=/usr/lib/libz.la'
| make[2]: *** [gradient-crash-test] Error 1
| i586-poky-linux-libtool: link: cannot find the library 
`/intel/poky/builds/world/tmp/sysroots/qemux86/usr/lib/libz.la' or 
unhandled argument `=/usr/lib/libz.la'
| make[2]: *** [region-contains-test] Error 1
| make[2]: Leaving directory 
`/intel/poky/builds/world/tmp/work/i586-poky-linux/pixman-1_0.24.2-r0/pixman-0.24.2/test'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory 
`/intel/poky/builds/world/tmp/work/i586-poky-linux/pixman-1_0.24.2-r0/pixman-0.24.2'
| make: *** [all] Error 2
| ERROR: oe_runmake failed
NOTE: package pixman-1_0.24.2-r0: task do_compile: Failed


Sau!



>>
>> Sau!
>


