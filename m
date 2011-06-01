Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QRto7-0002Fw-Ns
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 00:22:31 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 Jun 2011 15:19:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,305,1304319600"; 
   d="scan'208";a="8092497"
Received: from unknown (HELO [10.255.13.41]) ([10.255.13.41])
	by orsmga001.jf.intel.com with ESMTP; 01 Jun 2011 15:19:19 -0700
Message-ID: <4DE6BAE6.3040406@linux.intel.com>
Date: Wed, 01 Jun 2011 15:19:18 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1306958862.git.otavio@ossystems.com.br>	<ddcfd950f58f85e00b0ea094534f27ccf1315152.1306958862.git.otavio@ossystems.com.br>	<1306960406.3119.6.camel@lenovo.internal.reciva.com>	<BANLkTinyA0PAq3bQRTi2zCrWKKOVypytqg@mail.gmail.com>	<1306961600.3119.15.camel@lenovo.internal.reciva.com>	<BANLkTimvA2gMHB=zmZmLqz+CdyAsR3dmXg@mail.gmail.com>	<4DE6B299.2060507@linux.intel.com>
	<20110601215232.GE3281@jama.jama.net>
In-Reply-To: <20110601215232.GE3281@jama.jama.net>
Subject: Re: [PATCH 3/3] gnutls: link against 'dl' library
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
X-List-Received-Date: Wed, 01 Jun 2011 22:22:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/01/2011 02:52 PM, Martin Jansa wrote:
> On Wed, Jun 01, 2011 at 02:43:53PM -0700, Saul Wold wrote:
>> On 06/01/2011 02:00 PM, Otavio Salvador wrote:
>>> On Wed, Jun 1, 2011 at 20:53, Phil Blundell<pb@pbcl.net>   wrote:
>>>> On Wed, 2011-06-01 at 20:39 +0000, Otavio Salvador wrote:
>>>>> Are you able to reproduce it?
>>>>
>>>> No, it works fine for me.  I get:
>>>>
>>>> checking how to link with libpthread... -lpthread
>>>> checking for libdl... yes
>>>> checking how to link with libdl... -ldl
>>>> checking whether we are using the GNU C++ compiler... yes
>>>>
>>>> This is with the current head of oe-core on qemuarm.
>>>
>>> I am building for i586 but I doubt it is related.
>>>
>>> I get:
>>>
>>> checking for libpthread... yes
>>> checking how to link with libpthread... /usr/lib/libpthread.so
>>> checking for libdl... no
>>> checking whether we are using the GNU C++ compiler... yes
>>>
>> I also built for x86 and beagle, both have libdl, can you check that you
>> do not have some kind of site configuration that is overriding, also
>> maybe post your log from .../gnutls-2.12.5/lib/config.log
>
> here it tries to link against host libdl
>
> configure:26050: checking for libdl
> configure:26069: arm-oe-linux-gnueabi-gcc -march=armv4t -mtune=arm920t
> --sysroot=/OE/shr-core/tmp/sysroots/om-gta02 -o conftest -O2 -pipe -g
> -feliminate-unused-debug-types
> -I/OE/shr-core/tmp/sysroots/om-gta02/usr/include -Wl,-O1
> -Wl,--as-needed conftest.c  /usr/lib/libdl.so>&5
> /usr/lib/libdl.so: file not recognized: File format not recognized
> collect2: ld returned 1 exit status
>
Well that's interesting, since I see it linking using -ldl, there must 
be some other setting that's affecting this, I have been looking in 
gnutls to see if I can find something else that sets libdl.so vs -ldl,
I have not found it.

configure:26075: i586-poky-linux-gcc -march=i586 
--sysroot=/builds/world/tmp/sysroots/qemux86 -o conftest -O2 -pipe -g 
-feliminate-unused-debug-types 
-I/builds/world/tmp/sysroots/qemux86/usr/include -Wl,-O1 
-Wl,--as-needed conftest.c  -ldl >&5
configure:26075: $? = 0
configure:26085: result: yes
configure:26092: checking how to link with libdl
configure:26094: result: -ldl

Sau!

>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


