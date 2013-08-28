Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 314A26B988
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 03:55:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7S3oPGg000166
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Aug 2013 20:50:25 -0700 (PDT)
Received: from [128.224.21.235] (128.224.21.235) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 27 Aug 2013 20:50:24 -0700
Message-ID: <521D737D.4000706@windriver.com>
Date: Tue, 27 Aug 2013 23:50:21 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, "Huang, Jie (Jackie)"
	<Jackie.Huang@windriver.com>
References: <1377251290-4290-1-git-send-email-lpapp@kde.org>
	<521D0495.203@windriver.com> <20130827200817.GB3544@jama>
	<1377646160.32502.25.camel@ted>
In-Reply-To: <1377646160.32502.25.camel@ted>
X-Originating-IP: [128.224.21.235]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot: update to 2013.07
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
X-List-Received-Date: Wed, 28 Aug 2013 03:55:32 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-08-27 07:29 PM, Richard Purdie wrote:
> On Tue, 2013-08-27 at 22:08 +0200, Martin Jansa wrote:
>> On Tue, Aug 27, 2013 at 03:57:09PM -0400, Randy MacLeod wrote:
>>> On 13-08-23 05:48 AM, Laszlo Papp wrote:
>>>> Signed-off-by: Laszlo Papp <lpapp@kde.org>
>>>> ---
>>>>    meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb | 27 +++++++++++++++++++++++
>>>>    meta/recipes-bsp/u-boot/u-boot_2013.07.bb         | 23 +++++++++++++++++++
>>>>    2 files changed, 50 insertions(+)
>>>>    create mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
>>>>    create mode 100644 meta/recipes-bsp/u-boot/u-boot_2013.07.bb
>>>>
>>> ...
>>>> diff --git a/meta/recipes-bsp/u-boot/u-boot_2013.07.bb b/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
>>>> new file mode 100644
>>>> index 0000000..f3f4b62
>>>> --- /dev/null
>>>> +++ b/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
>>>> @@ -0,0 +1,23 @@
>>>> +require u-boot.inc
>>>> +
>>>> +# To build u-boot for your machine, provide the following lines in your machine
>>>> +# config, replacing the assignments as appropriate for your machine.
>>>> +# UBOOT_MACHINE = "omap3_beagle_config"
>>>> +# UBOOT_ENTRYPOINT = "0x80008000"
>>>> +# UBOOT_LOADADDRESS = "0x80008000"
>>>> +
>>>> +LICENSE = "GPLv2+"
>>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
>>>> +                    file://README;beginline=1;endline=22;md5=78b195c11cb6ef63e6985140db7d7bab"
>>>> +
>>>> +# This revision corresponds to the tag "v2013.07"
>>>> +# We use the revision in order to avoid having to fetch it from the repo during parse
>>>> +SRCREV = "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
>>>> +
>>>> +PV = "v2013.07+git${SRCPV}"
>>>> +
>>>> +SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
>>>
>>> Just curious...
>>> I dont' see a good reason to specify the git protocol twice:
>>>      git://.... and ; protocol=git
>>
>> It's not twice, git:// is to select bitbake fetcher (git.py) and one
>> fetcher can support multiple protocols (e.g. over git, http or ssh)
>>
>> but you're right that in most cases "protocol=git" isn't needed, because
>> it's default protocol for git fetcher when host is specified in that
>> SRC_URI.
>>
>> bitbake/lib/bb/fetch2/git.py:
>>          if 'protocol' in ud.parm:
>>              ud.proto = ud.parm['protocol']
>>          elif not ud.host:
>>              ud.proto = 'file'
>>          else:
>>              ud.proto = "git"
>>
>> And I would support removing it in one go as it clearly confuses people
>> :).
>
> The reason is that the default for the git fetcher was once rsync. Why?
> The fetcher was written when git was still a new and unexplored
> landscape. We decided in the end to break that insane default and fix
> it.
>
> We should kill off the now unnecessary parameters though.

Ok. Jackie will have time to make a first pass tomorrow.
Jackie, please include the replacement script in your email.

// Randy

>
> Cheers,
>
> Richard
>
>
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350

