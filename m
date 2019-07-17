Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 61BD87EC66
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 08:25:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6H8OV9V014485
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 17 Jul 2019 01:25:02 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 17 Jul 2019 01:24:51 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20190715102016.114264-1-kai.kang@windriver.com>
	<CAMKF1sq8rpdxdH2Yr8bHze06-R3hsmLTDdSLkX-TEj4utY2VYQ@mail.gmail.com>
	<0f664af2-cea3-aaa2-2a7c-74c43d58ced4@windriver.com>
	<CAMKF1spSOgaLYgy6U3r=wXNPcMA+qyy1Oigpob42xFAOFugbvA@mail.gmail.com>
	<8164ebb7-8a4f-a7ce-74de-e4adb60a6022@windriver.com>
	<CAMKF1sp=r+x8+DyGPAmJUfAMn6qtSzjquP+iaEwjtz1SkYXf7A@mail.gmail.com>
	<4d14f4a4-c3a2-ed2d-e8dc-fd6de1963124@windriver.com>
	<CAMKF1srFgjj8r2PqzPKmsi2NToOkd60TknrcPWP4-pvRLLu58A@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <90bfbd77-4e09-9a83-77b1-e87d24e13c5c@windriver.com>
Date: Wed, 17 Jul 2019 16:24:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAMKF1srFgjj8r2PqzPKmsi2NToOkd60TknrcPWP4-pvRLLu58A@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] webkitgtk: set incomptible with tune mips
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
X-List-Received-Date: Wed, 17 Jul 2019 08:25:28 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/7/17 下午4:18, Khem Raj wrote:
> oh COMPATIBLE_HOST_mipsarch threw me off. do we need to use the
> override when the specific check
> is done on right hand side?

I didn't figure out a better way to reset COMPATIBLE_HOST only for 
default tune 'mips'.  Without override _mipsarch,
I need to list all the COMPATIBLE_HOSTs such as 
"(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64).*-linux'" in the *else*
part of bb.utils.contains().

Regards,
Kai


>
> On Tue, Jul 16, 2019 at 11:51 PM Kang Kai <Kai.Kang@windriver.com> wrote:
>> On 2019/7/17 下午2:20, Khem Raj wrote:
>>
>> Right so we should only disable the tunes which don’t have clz and not all mips as this patch is doing
>>
>> The patch only set COMPATILE_HOST to null  only when default tune is 'mips' which causes webkitgtk fails.
>> And for other conditions, it doesn't block to build that the COMPATILE_HOST is 'mips.*-linux'.  Such as the
>> default bsps qemumips(default tune mips32r2) and qemumips64(mips64r2), it doesn't affect them.
>>
>> Kai
>>
>>
>>
>> On Tue, Jul 16, 2019 at 10:42 PM Kang Kai <Kai.Kang@windriver.com> wrote:
>>> On 2019/7/16 下午11:33, Khem Raj wrote:
>>>
>>>
>>>
>>> On Tue, Jul 16, 2019 at 2:33 AM Kang Kai <Kai.Kang@windriver.com> wrote:
>>>> On 2019/7/16 下午3:19, Khem Raj wrote:
>>>>> On Mon, Jul 15, 2019 at 3:21 AM <kai.kang@windriver.com> wrote:
>>>>>> From: Kai Kang <kai.kang@windriver.com>
>>>>>>
>>>>>> It fails to compile webkit when default tune is 'mips':
>>>>>>
>>>>>> | .../tmp-glibc/work/mips-wrs-linux/webkitgtk/2.24.2-r0/webkitgtk-2.24.2
>>>>>> | /Source/JavaScriptCore/assembler/MacroAssemblerMIPS.h:418:23:
>>>>>> | error: static assertion failed: CLZ opcode is not available for this ISA
>>>>>>
>>>>>> So don't build webkit when default tune is mips.
>>>>>>
>>>>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>>>>> ---
>>>>>>    meta/recipes-sato/webkit/webkitgtk_2.24.2.bb | 2 ++
>>>>>>    1 file changed, 2 insertions(+)
>>>>>>
>>>>>> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.24.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.24.2.bb
>>>>>> index 056334fff5..891266b220 100644
>>>>>> --- a/meta/recipes-sato/webkit/webkitgtk_2.24.2.bb
>>>>>> +++ b/meta/recipes-sato/webkit/webkitgtk_2.24.2.bb
>>>>>> @@ -43,6 +43,8 @@ DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libxt libidn libgcrypt \
>>>>>>              gettext-native glib-2.0 glib-2.0-native libtasn1 \
>>>>>>              "
>>>>>>
>>>>>> +COMPATIBLE_HOST_mipsarch = "${@bb.utils.contains('DEFAULTTUNE', 'mips', 'null', 'mips.*-linux', d)}"
>>>>>> +
>>>>> this disables is for all kind of mips. I think thats a broad set, it
>>>>> would be best to narrow it to what you saw it failing for
>>>>> e.g. it should work for mips32 and mips64 so maybe mips1 is what you
>>>>> want to disable for
>>>> I tested with qemumips and qemumips64. When set
>>>>
>>>> DEFAULTTUNE= "mips"
>>>
>>> How about using mips32 and mips64 for default tune and retest
>>>
>>>
>>> It build webkitgtk successfully on qemumips and qemumips64 with default tune mips32 and mips64.
>>>
>>>
>>>>
>>>> It fails with the error.
>>>>
>>>> Regards,
>>>> Kai
>>>>
>>>>>
>>>>>>    PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'wayland' ,d)} \
>>>>>>                       ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'webgl opengl', '' ,d)} \
>>>>>>                       enchant \
>>>>>> --
>>>>>> 2.20.0
>>>>>>
>>>>>> --
>>>>>> _______________________________________________
>>>>>> Openembedded-core mailing list
>>>>>> Openembedded-core@lists.openembedded.org
>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>
>>>> --
>>>> Kai Kang
>>>>
>>> --
>>> Kai Kang
>>
>> --
>> Kai Kang


-- 
Kai Kang


