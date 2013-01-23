Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TxsYZ-0005oy-Uk
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 06:07:30 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0N4pr41007821
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 Jan 2013 20:51:54 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 22 Jan 2013 20:51:53 -0800
Message-ID: <50FF6C73.805@windriver.com>
Date: Wed, 23 Jan 2013 12:52:03 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1358836314.git.Qi.Chen@windriver.com>
	<55f028c6a820eca153b31716bc7b8516a77ef06f.1358836314.git.Qi.Chen@windriver.com>
	<50FF195D.6020604@linux.intel.com> <50FF5805.3070509@windriver.com>
	<50FF64F6.2020209@linux.intel.com>
In-Reply-To: <50FF64F6.2020209@linux.intel.com>
X-Originating-IP: [128.224.163.154]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V8 5/6] volatile-conf-minimal: add recipe
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
X-List-Received-Date: Wed, 23 Jan 2013 05:07:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/23/2013 12:20 PM, Saul Wold wrote:
> On 01/22/2013 07:24 PM, ChenQi wrote:
>> On 01/23/2013 06:57 AM, Saul Wold wrote:
>>> On 01/21/2013 10:36 PM, Qi.Chen@windriver.com wrote:
>>>> From: Chen Qi <Qi.Chen@windriver.com>
>>>>
>>>> This recipe provides a config file for core-image-minimal.
>>>> This config file is used for volatile storage handling in case of a
>>>> readonly rootfs.
>>>>
>>>> Also, let core-image-minimal depend on this recipe.
>>>>
>>>> [YOCTO #3406]
>>>>
>>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>>> ---
>>>>   meta/recipes-core/images/core-image-minimal.bb     |    3 +++
>>>>   .../files/volatiles-readonly-minimal               |    8 ++++++++
>>>>   .../volatile-conf-minimal_1.0.bb                   |   15
>>>> +++++++++++++++
>>>>   3 files changed, 26 insertions(+)
>>>>   create mode 100644
>>>> meta/recipes-core/readonly-volatile-conf/files/volatiles-readonly-minimal 
>>>>
>>>>
>>>>   create mode 100644
>>>> meta/recipes-core/readonly-volatile-conf/volatile-conf-minimal_1.0.bb
>>>>
>>>> diff --git a/meta/recipes-core/images/core-image-minimal.bb
>>>> b/meta/recipes-core/images/core-image-minimal.bb
>>>> index 0d2613e..f6baeae 100644
>>>> --- a/meta/recipes-core/images/core-image-minimal.bb
>>>> +++ b/meta/recipes-core/images/core-image-minimal.bb
>>>> @@ -6,6 +6,9 @@ IMAGE_LINGUAS = " "
>>>>
>>>>   LICENSE = "MIT"
>>>>
>>>> +RDEPENDS += "volatile-conf-minimal"
>>> This needs to be RDEPENDS_${PN}
>>>
>>>> +IMAGE_INSTALL += "volatile-conf-minimal"
>>>> +
>>> I am still digging into this idea of having a image specific volatile
>>> package, RP is not wild about it either.  What's different now from
>>> before is the minimal version cut down from the orignal version?  Is
>>> there any reason we can't use a larger volatile conf?
>>>
>>> Sau!
>>>
>> Hi Saul,
>>
>> I thought about this, but didn't dig deep into it because I thought one
>> conf file for one image would be clearer.
>> On a second thought, maybe we could use a config file like below.
>>
>> <pkg1>
>> readonly specific config items for pkg1
>> </pkg1>
>>
>> <pkg2>
>> readonly specific config items for pkg2
>> </pkg2>
>>
>> ....
>> (Let's denote it as the original config file.)
>>
>> In this way, all config items are centred into one place.
>> And the strategy would be like:
>> 1. get a list of pkgs that are to be installed on target
>>      L = [pkg1, pkg2, ..., pkgn]
>> 2. original config file -- [select items according to L] --> final
>> config file
>>      The selecting procedure is simply something like:
>>       for pkg in $pkgs; do cat origin | sed -ne "/<$pkg>/,/<\/$pkg>/ {
>> /<$pkg>/n; /<\/$pkg>/n; p; }" ; done > final
>>      The final config file should look like the ones that we use for now
>> so that we can still use populate-volatile.sh to create the dirs and 
>> links.
>> 3. Parse the final config file with populate-volatile.sh to create the
>> proper directories and links.
>>
>> The problem is that I don't know how to get the pkg list.
>> Could somebody help me?
>>
>> What do you think about this strategy?
>>
> Hmm, once you put it this way, another thought came to mind we could 
> create a volatile class similar to update-rc.d or useradd where we 
> specify the a VOLATILE_PKGS, VOLATILE_DIR, VOLATILE_LINK in  the 
> appropriate recipes directly and then inherit the volatile class.
>
> Thoughts?
>

Good idea! It's cleaner and more manageable.
I'll investigate this idea more and try it out :)

Thanks,
Chen Qi

> Sau!
>
>> Cheers,
>> Chen Qi
>>
>>
>>
>>
>>
>>
>
>



