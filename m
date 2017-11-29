Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 21BE277CCC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Nov 2017 18:13:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vATIDhqk021535
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 29 Nov 2017 10:13:44 -0800
Received: from [128.224.56.93] (128.224.56.93) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 29 Nov 2017 10:13:43 -0800
To: Saul Wold <sgw@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
References: <20171129032818.2545-1-sgw@linux.intel.com>
	<2b2306eb-7a97-b1e1-918b-4a47438ecad2@windriver.com>
	<1511973051.2714.120.camel@linux.intel.com>
	<f4f037ff-fcde-a801-ec0d-4068fae961e2@windriver.com>
	<1511977937.2714.137.camel@linux.intel.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <5a974b15-a273-636c-6424-b74a747276ff@windriver.com>
Date: Wed, 29 Nov 2017 13:13:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1511977937.2714.137.camel@linux.intel.com>
Subject: Re: [PATCH 1/2] kernel-yocto: ensure sccs variable is set when using KBUILD_DEFCONFIG
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
X-List-Received-Date: Wed, 29 Nov 2017 18:13:45 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/29/2017 12:52 PM, Saul Wold wrote:
> On Wed, 2017-11-29 at 11:56 -0500, Bruce Ashfield wrote:
>> On 11/29/2017 11:30 AM, Saul Wold wrote:
>>> On Wed, 2017-11-29 at 09:23 -0500, Bruce Ashfield wrote:
>>>> On 11/28/2017 10:28 PM, Saul Wold wrote:
>>>>> When using KBUILD_DEFCONFIG, $sccs should be set to the
>>>>> $WORKDIR/defconfig
>>>>> regardless if it compares or is copied. Otherwise $sccs is not
>>>>> set
>>>>> and the
>>>>> defconfig is not found correctly.
>>>>
>>>> Actually, looking at this more today, and this morning in my
>>>> testing.
>>>> This shouldn't be necessary .. it doesn't hurt anything (well,
>>>> actually
>>>> it could end up with two defconfigs in the variable, but that
>>>> also
>>>> should be ok).
>>>>
>>>
>>> Ok, I understand, it's in find_sccs() where if you have "defconfig"
>>> in
>>> the SRC_URI then with my change you could end up with two
>>> defconfigs.
>>>
>>> The problem I saw was if one just sets KBUILD_DEFCONFIG and does
>>> not
>>> set any config info on the SRC_URI then it's possible for $sccs to
>>> be
>>> empty, which was bad.
>>
>> I took a look at the conditions again, and I can't see that
>> path. But that doesn't mean it isn't there, is this a configuration
>> that I can build and see myself ?
>>
> Set KBUILD_DEFCONFIG to some kernel defconfig, ensure SRC_URI does not
> have any defconfig, .scc or .cfg files.  Build once that will populate
> the $WORKDIR/defconfig with vai the else path of the first if and the
> cp path in the do_kernel_metadata() code.  Build a second time and the
> $WORKDIR/defconfig exists now and the first part of the if with the cmp
> will occur and the defconfig will not be found because $sccs does not
> get set in the original code when the cmp is equal.

That's the ticket .. I didn't think of a 2nd pass through the
build.

So with that extra assignment + a duplicate removal, it should
be safe for all the paths.

Did you want to send a v2, or did you want me to make that tweak?

Either way, I'll continue testing here.

Bruce

> 
> Sau!
> 
>>>
>>> Maybe a cleaning of multiple "defconfig" entries on $sccs is
>>> needed?
>>>
>>
>> Yah, regardless of my above statement, it certainly wouldn't hurt
>> and would be a good safeguard, since two defconfigs would trigger
>> a M x N configuration audit of options (where M and N could be
>> in the thousands) .. and hence, take a long time.
>>
>> Bruce
>>
>>> Sau!
>>>
>>>
>>>>>
>>>>> Part of
>>>>> [YOCTO #12162]
>>>>>
>>>>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>>>>> ---
>>>>>     meta/classes/kernel-yocto.bbclass | 2 +-
>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/meta/classes/kernel-yocto.bbclass
>>>>> b/meta/classes/kernel-yocto.bbclass
>>>>> index 1d447951c49..98ec78fb768 100644
>>>>> --- a/meta/classes/kernel-yocto.bbclass
>>>>> +++ b/meta/classes/kernel-yocto.bbclass
>>>>> @@ -110,8 +110,8 @@ do_kernel_metadata() {
>>>>>     				fi
>>>>>     			else
>>>>>     				cp -f
>>>>> ${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG}
>>>>> ${WORKDIR}/defconfig
>>>>> -				sccs="${WORKDIR}/defconfig"
>>>>>     			fi
>>>>> +			sccs="${WORKDIR}/defconfig"
>>>>
>>>> The test that was protecting this assignment is:
>>>>
>>>>       if [ -f "${WORKDIR}/defconfig" ]; then
>>>>
>>>> and then:
>>>>
>>>>      cmp "${WORKDIR}/defconfig"
>>>> "${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG}"
>>>>
>>>> The only way that a defconfig can be in ${WORKDIR}/defconfig by
>>>> the time this runs, is if the fetcher puts it there. Which means
>>>> it is on the SRC_URI and comes from the recipe writer's layer.
>>>>
>>>> There is existing code that already picks this up and adds it
>>>> to the configuration queue:
>>>>
>>>>            sccs="$sccs ${@" ".join(find_sccs(d))}"
>>>>
>>>> So that defconfig, is already going to be picked up directly
>>>> from the SRC_URI.
>>>>
>>>> Bruce
>>>>
>>>>
>>>>>     		else
>>>>>     			bbfatal "A KBUILD_DEFCONFIG
>>>>> '${KBUILD_DEFCONFIG}' was specified, but not present in the
>>>>> source
>>>>> tree"
>>>>>     		fi
>>>>>
>>>>
>>>>
>>
>>


