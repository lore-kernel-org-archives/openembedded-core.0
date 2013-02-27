Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UAWZD-0003Io-62
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 03:16:25 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1R202Ua028249
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Feb 2013 18:00:02 -0800 (PST)
Received: from [128.224.162.186] (128.224.162.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.328.9;
	Tue, 26 Feb 2013 18:00:00 -0800
Message-ID: <512D689A.30206@windriver.com>
Date: Wed, 27 Feb 2013 09:59:54 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1361857721.git.liezhi.yang@windriver.com>
	<a5db423d88f92e3ff5ed58bf35c7561b80aec82e.1361857721.git.liezhi.yang@windriver.com>
	<512CE051.2090900@linux.intel.com>
	<20130226175835.GC13278@sakrah.homelinux.org>
In-Reply-To: <20130226175835.GC13278@sakrah.homelinux.org>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: Re: [PATCH 1/1] lttng-ust: cannot find -llttng-ust-tracepoint
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
X-List-Received-Date: Wed, 27 Feb 2013 02:16:33 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Khem,

Here is the full error log, we can see that liblttng-ust.la needs 
lttng-ust-tracepoint.la:

arm-poky-linux-gnueabi-libtool: link: arm-poky-linux-gnueabi-gcc  -march=armv5te 
  -marm -mthumb-interwork 
--sysroot=/buildarea2/lyang1/ppp/tmp/sysroots/qemuarm -shared  -fPIC -DPIC 
-Wl,--whole-archive ../snprintf/.libs/libustsnprintf.a 
../liblttng-ust-comm/.libs/liblttng-ust-comm.a ./.libs/liblttng-ust-runtime.a 
./.libs/liblttng-ust-support.a -Wl,--no-whole-archive  -llttng-ust-tracepoint 
-lrt /buildarea2/lyang1/ppp/tmp/sysroots/qemuarm/usr/lib/libuuid.so 
/buildarea2/lyang1/ppp/tmp/sysroots/qemuarm/usr/lib/liburcu-bp.so 
-L/buildarea2/lyang1/ppp/tmp/sysroots/qemuarm/usr/lib 
/buildarea2/lyang1/ppp/tmp/sysroots/qemuarm/usr/lib/liburcu-cds.so 
/buildarea2/lyang1/ppp/tmp/sysroots/qemuarm/usr/lib/liburcu-common.so -lpthread 
  -march=armv5te -marm -mthumb-interwork 
--sysroot=/buildarea2/lyang1/ppp/tmp/sysroots/qemuarm -O2 -Wl,-O1 
-Wl,--hash-style=gnu -Wl,--as-needed   -Wl,-soname -Wl,liblttng-ust.so.0 -o 
.libs/liblttng-ust.so.0.0.0
arm-poky-linux-gnueabi-libtool: link: ( cd ".libs" && rm -f 
"liblttng-ust-tracepoint.la" && ln -s "../liblttng-ust-tracepoint.la" 
"liblttng-ust-tracepoint.la" )
/buildarea2/lyang1/ppp/tmp/sysroots/x86_64-linux/usr/libexec/armv5te-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld: 
cannot find -llttng-ust-tracepoint
collect2: error: ld returned 1 exit status
make[2]: *** [liblttng-ust.la] Error 1

// Robert

On 02/27/2013 01:58 AM, Khem Raj wrote:
> On (26/02/13 08:18), Darren Hart wrote:
>> Pulling in Tom as I don't have any experience with lttng.
>>
>> On 02/26/2013 01:24 AM, Robert Yang wrote:
>>> liblttng_ust.la should depend on liblttng-ust-tracepoint.la, otherwise
>>> there maybe a parallel build issue when building liblttng_ust.la:
>>>
>>> ld: cannot find -llttng-ust-tracepoint
>
> Are you using gold linker when you get this issue ?
> patch is OK if you are sure that some other .la is not pulling it in as
> well otherwise you dont want overlinking.
>


