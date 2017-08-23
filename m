Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5360F7823D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 19:18:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7NJI6Oe027168
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 23 Aug 2017 12:18:06 -0700
Received: from [128.224.56.93] (128.224.56.93) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 23 Aug 2017 12:18:06 -0700
To: Andre McCurdy <armccurdy@gmail.com>
References: <1503514478-20276-1-git-send-email-bruce.ashfield@windriver.com>
	<CAJ86T=WvQuxybbB3Dhyy_hSTQup66GUrk4F7HxE27=ud7CwzVA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <bb52922d-8ae6-7a2f-9ef7-302cbe175012@windriver.com>
Date: Wed, 23 Aug 2017 15:18:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAJ86T=WvQuxybbB3Dhyy_hSTQup66GUrk4F7HxE27=ud7CwzVA@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-yocto: relax BSP definition test
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
X-List-Received-Date: Wed, 23 Aug 2017 19:18:08 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/23/2017 03:07 PM, Andre McCurdy wrote:
> On Wed, Aug 23, 2017 at 11:54 AM, Bruce Ashfield
> <bruce.ashfield@windriver.com> wrote:
>> commit 44aea7b873 [kernel-yocto: ensure that only valid BSPs are built]
>> introduced a new check to ensure that a valid BSP definition was found,
>> rather than building something that 'closely' matched the current
>> MACHINE.
>>
>> This check breaks valid configurations which do not have a bsp
>> definition but are otherwise completely configured machines.
>>
>> To allow both elements to co-exist (and not add warnings or errors
>> to otherwise valid builds), we first check to see if an empty bsp
>> definition was found, but then check to see if a defconfig was
>> provided.
>>
>> If a defconfig has been provided, that is a sign that the board
>> configuration is complete and we should continue the build without
>> otherwise bothering the user.
>>
>> Tested on meta-raspberrypi and linux-yocto*
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>   meta/classes/kernel-yocto.bbclass | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
>> index 3c6df92131bc..d68e720589dc 100644
>> --- a/meta/classes/kernel-yocto.bbclass
>> +++ b/meta/classes/kernel-yocto.bbclass
>> @@ -143,8 +143,11 @@ do_kernel_metadata() {
>>
>>          # expand kernel features into their full path equivalents
>>          bsp_definition=$(spp ${includes} --find -DKMACHINE=${KMACHINE} -DKTYPE=${LINUX_KERNEL_TYPE})
>> -       if [ $? -ne 0 ] || [ -z "${bsp_definition}" ]; then
>> -               bbfatal_log "Could not locate BSP definiton for ${KMACHINE}/${LINUX_KERNEL_TYPE}."
>> +       if [ -z "$bsp_definition" ]; then
>> +               echo -q "$sccs" | grep defconfig
> 
> echo -q ?

gah!

v2 coming. that should be grep -q ...

Thanks for catching that :D

Bruce

> 
>> +               if [ $? -ne 0 ]; then
>> +                       bberror "Could not locate BSP definition for ${KMACHINE}/${LINUX_KERNEL_TYPE} and no defconfig was provided"
>> +               fi
>>          fi
>>          meta_dir=$(kgit --meta)
>>
>> --
>> 2.5.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


