Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 307D760C02
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 03:24:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1R3Oh7S018855
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 26 Feb 2014 19:24:43 -0800 (PST)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Wed, 26 Feb 2014 19:24:42 -0800
Message-ID: <530EB012.1090800@windriver.com>
Date: Thu, 27 Feb 2014 11:25:06 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1393399942.git.Qi.Chen@windriver.com>	
	<daee4480b735a557aaa314f9a1f9bf6fbb3f9a12.1393399942.git.Qi.Chen@windriver.com>	
	<CAJTo0LaOPBcyt-WfvXqKR4FEpVD3Lf5c04BXemFNC6_Pa-JMkQ@mail.gmail.com>	
	<530DC059.5010608@windriver.com> <1393411485.31769.109.camel@ted>
In-Reply-To: <1393411485.31769.109.camel@ted>
X-Originating-IP: [128.224.162.218]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] python-numpy: fix compile error for qemumips
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
X-List-Received-Date: Thu, 27 Feb 2014 03:24:44 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/26/2014 06:44 PM, Richard Purdie wrote:
> On Wed, 2014-02-26 at 18:22 +0800, ChenQi wrote:
>> On 02/26/2014 06:02 PM, Burton, Ross wrote:
>>> On 26 February 2014 07:33, Chen Qi <Qi.Chen@windriver.com> wrote:
>>>> This is because for qemumips, there are no such files in SRC_URI. And
>>>> actually we don't need such files. So for qemumips, the `cp' command
>>>> is expected to fail.
>>> Those files contain the definitions of things like word size and byte
>>> ordering, so unless I've misunderstood the build process for numpy
>>> what's happening with this patch is that it's using the host
>>> environment.
>>>
>>> Ross
>>>
>>>
>> Those files are there already.
>> For archs like x86, we first replace them so that the build process
>> doesn't fail (according to the comments in the recipe); but for
>> mips/ppc, we don't need to do so, the build just succeeds.
>>
>> chenqi@pek-hostel-vm07:~/poky/build-qemumips64 [0] $ ls
>> tmp/work/mips64-poky-linux/python-numpy/1.7.0-r1/numpy-1.7.0/build/src.linux-i686-2.7/numpy/core/include/numpy/
>> config.h  __multiarray_api.c  __multiarray_api.h multiarray_api.txt
>> _numpyconfig.h  __ufunc_api.c  __ufunc_api.h ufunc_api.txt
>> __umath_generated.c
> Ross' point stands, its just using the values from the host (build)
> system. If your build system was mips it might stand a chance of
> working, I suspect you're building on x86 though and x86 != mips.
>
> Cheers,
>
> Richard
>
>
>

Ross & Richard,

Thanks for making it clear.
Yesterday, I built it and tested it on target. As some basic tests 
passed, I thought everything was OK.
Now I've checked those files, and obviously I've made a mistake.
I'll rework on this one.

Best Regards,
Chen Qi

