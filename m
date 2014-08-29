Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa06-10.prod.phx3.secureserver.net
	(p3plsmtpa06-10.prod.phx3.secureserver.net [173.201.192.111])
	by mail.openembedded.org (Postfix) with ESMTP id 039F46FE64
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 20:59:02 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa06-10.prod.phx3.secureserver.net with 
	id kkyz1o00Y1mTNtu01kz0tz; Fri, 29 Aug 2014 13:59:03 -0700
Message-ID: <5400E993.3020903@pabigot.com>
Date: Fri, 29 Aug 2014 15:58:59 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Dan McGregor <danismostlikely@gmail.com>
References: <CADwFkYeYJVe0KyVY3gipy-cGm4kRhaHoit2WThcKsLnpdyyrOw@mail.gmail.com>	<54006899.3020609@pabigot.com>
	<CACS+7ZRyJJUxQLU_qzbaoTo6p=x9AxRLYigPB_cgz+zg4gRq5Q@mail.gmail.com>
In-Reply-To: <CACS+7ZRyJJUxQLU_qzbaoTo6p=x9AxRLYigPB_cgz+zg4gRq5Q@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: boost 1.56 compile fail
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
X-List-Received-Date: Fri, 29 Aug 2014 20:59:04 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/29/2014 03:36 PM, Dan McGregor wrote:
> On 29 August 2014 05:48, Peter A. Bigot <pab@pabigot.com> wrote:
>> On 08/29/2014 06:28 AM, Yi Qingliang wrote:
>>
>> hardware: samsung s3c6410
>>
>> after updated to latest poky, the boost compile fail!
>>
>> error info:
>> libs/atomic/src/lockpool.cpp:127:5: error: 'thread_fence' is not a member of
>> 'boost::atomics::detail'
>> libs/atomic/src/lockpool.cpp:138:5: error: 'signal_fence' is not a member of
>> 'boost::atomics::detail'
>>
>>
>> after dig into it, I found that:
>> the marco 'BOOST_ATOMIC_FLAG_LOCK_FREE' is 0, so it don't include
>> 'operations_lockfree.hpp' which has 'thread_fence' and 'signal_fence', but
>> pthread.h at line 21.
>>
>> in file 'caps_gcc_atomic.hpp', 'BOOST_ATOMIC_FLAG_LOCK_FREE' is set to '0',
>> the author think if '__GCC_ATOMIC_BOOL_LOCK_FREE' is 1, the atomic serial
>> function gcc provided is not lock free.
>>
>>
>> This is the sort of GCC internal header indicator that would have changed
>> value as a result of:
>>
>> http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-devtools/gcc/gcc-configure-common.inc?id=0ba6ab39f187ecd4261f08e768f365f461384a3a
>>
>>
>>
>> at the end of 'caps_gcc_atomic.hpp', it defined 'BOOST_ATOMIC_THREAD_FENCE'
>> as 2.
>>
>> so the conflict is: BOOST_ATOMIC_THREAD_FENCE and
>> BOOST_ATOMIC_FLAG_LOCK_FREE
>>
>> I don't know it is the new poky problem, or the boost problem, any idea?
>>
>>
>> My guess is that Boost is making assumptions about what the internal GCC
>> predefined symbols mean that aren't entirely accurate.  There are several
>> flags that are used in the libstdc++ headers to indicate whether the
>> compiler is using lock-free instructions.
>>
>> Boost-1.56 builds without error for my beaglebone target with poky at:
>>
>> * 669c07d (HEAD, origin/master, origin/HEAD, master/upstream, master/dev)
>> [Wed Aug 27 14:24:52 2014 +0100] bitbake: build/data: Write out more
>> complete python run files
>>
>> so it may have something to do with your target machine.
> It absolutely does. I found that armv6 breaks, but armv6zk and newer work.

Interesting.  There are no armv6zk tune features I can see in poky, 
though google suggests it applies to the Raspberry Pi.

The problem then must be with the first override in this:

# ARMv6+ adds atomic instructions that affect the ABI in libraries built
# with TUNE_CCARGS in gcc-runtime.  Make the compiler default to a
# compatible architecture.  armv6 and armv7a cover the minimum tune
# features used in OE.
EXTRA_OECONF_append_armv6 = " --with-arch=armv6"
EXTRA_OECONF_append_armv7a = " --with-arch=armv7-a"

ARMv6 has LDREX/STREX, but ARMv6K adds {LD,ST}REX{B,H,D}.  The same 
problem addressed above is likely to happen if the libraries are built 
with armv6k but the compiler doesn't default to it.

There are no armv6k tune parameters I can locate in poky.  What layers 
have the tune configurations that are causing problems?

Peter


