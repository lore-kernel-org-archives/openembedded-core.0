Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1SCCsn-0002Pn-7m
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 18:35:02 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2QGPqCL013447
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 26 Mar 2012 09:25:52 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 26 Mar 2012 09:25:53 -0700
Message-ID: <4F70988B.4010403@windriver.com>
Date: Mon, 26 Mar 2012 12:25:47 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1332507302.git.Martin.Jansa@gmail.com>
	<0f5173c469e4ae3e5155d5d3f0643d3a63e25b91.1332507302.git.Martin.Jansa@gmail.com>
	<4F6C79A8.30403@windriver.com>
	<20120323133102.GG3879@jama.jama.net>
	<20120326160246.GH3941@jama.jama.net>
In-Reply-To: <20120326160246.GH3941@jama.jama.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] kernel.bbclass: fix extra + in kernelrelease
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
X-List-Received-Date: Mon, 26 Mar 2012 16:35:02 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-03-26 12:02 PM, Martin Jansa wrote:
> On Fri, Mar 23, 2012 at 02:31:02PM +0100, Martin Jansa wrote:
>> On Fri, Mar 23, 2012 at 09:24:56AM -0400, Bruce Ashfield wrote:
>>> On 12-03-23 08:56 AM, Martin Jansa wrote:
>>>> * see http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/014308.html
>>>
>>> I was just looking at this in the past day or so and was
>>> wondering where it had gone. Saved me the effort!
>>>
>>
>> Please bump PR in kernel recipes you care about (I did for mine.. )
>
> I was testing your patch
> "linux-yocto: common-pc: Add PCNET32 to the config"
> to see if this patch fixes + also in linux-yocto recipes and somehow it
> seems still keeping +
>
> OE @ ~/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/linux-yocto/linux-yocto-3.2.11+git6+867fc7a19f2ea74253d1f20c3d61b7829635175b_4+4ca7e2c5d42e755e1b4c3e1478128f047a8ed2a8-r1/linux-qemux86-64-standard-build
> $ ../linux/scripts/setlocalversion .
> -yocto-standard
>
> seems ok, but
> root@qemux86-64:/lib/modules# opkg files kernel-module-uvesafb
> Package kernel-module-uvesafb
> (3.2.11+git6+867fc7a19f2ea74253d1f20c3d61b7829635175b_4+4ca7e2c5d42e755e1b4c3e1478128f047a8ed2a8-r1)
> is installed on root and has the following files:
> /lib/modules/
> /lib/modules/3.2.11-yocto-standard+/kernel/drivers/video/
> /lib/modules/3.2.11-yocto-standard+/kernel/drivers/video/uvesafb.ko
>
> and also:
> OE @ ~/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/linux-yocto/linux-yocto-3.2.11+git6+867fc7a19f2ea74253d1f20c3d61b7829635175b_4+4ca7e2c5d42e755e1b4c3e1478128f047a8ed2a8-r1/linux-qemux86-64-standard-build
> $ make kernelrelease
>    GEN
> /OE/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/linux-yocto/linux-yocto-3.2.11+git6+867fc7a19f2ea74253d1f20c3d61b7829635175b_4+4ca7e2c5d42e755e1b4c3e1478128f047a8ed2a8-r1/linux-qemux86-64-standard-build/Makefile
> scripts/kconfig/conf --silentoldconfig Kconfig
> 3.2.11-yocto-standard+
>
> Any idea why it doesn't work with linux-yocto layout and works with
> other kernels from git (tested on kernels from meta-smartphone).

I haven't had a chance to poke much at this yet, since I've been
tied up working with some repository tweaks.

But I can have a look shortly. There are some old(ish) patches that
deal with local version, both in the tree, and in some infrastructure
that could be interacting here. I'll spawn some builds (and actually
let the packaging run), and have a look.

Cheers,

Bruce

>
> Cheers,
>
>>
>>> Acked-by: Bruce Ashfield<bruce.ashfield@windriver.com>
>>>
>>>>
>>>> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
>>>> ---
>>>>    meta/classes/kernel.bbclass |    6 ++++++
>>>>    1 files changed, 6 insertions(+), 0 deletions(-)
>>>>
>>>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>>>> index 5e4cdd4..736768e 100644
>>>> --- a/meta/classes/kernel.bbclass
>>>> +++ b/meta/classes/kernel.bbclass
>>>> @@ -204,6 +204,12 @@ sysroot_stage_all_append() {
>>>>    }
>>>>
>>>>    kernel_do_configure() {
>>>> +	# fixes extra + in /lib/modules/2.6.37+
>>>> +	# $ scripts/setlocalversion . =>   +
>>>> +	# $ make kernelversion =>   2.6.37
>>>> +	# $ make kernelrelease =>   2.6.37+
>>>> +	touch ${B}/.scmversion
>>>> +
>>>>    	# Copy defconfig to .config if .config does not exist. This allows
>>>>    	# recipes to manage the .config themselves in do_configure_prepend().
>>>>    	if [ -f "${WORKDIR}/defconfig" ]&&   [ ! -f "${B}/.config" ]; then
>>>
>>
>> --
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
>
>



