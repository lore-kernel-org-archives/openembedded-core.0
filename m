Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C7ECE74583
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 07:21:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9M7Kt0r022248
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 22 Oct 2018 00:21:06 -0700
Received: from [128.224.162.153] (128.224.162.153) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Mon, 22 Oct 2018 00:20:44 -0700
To: ChenQi <Qi.Chen@windriver.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1539926193.git.Qi.Chen@windriver.com>
	<aa81e6d3c24822a91432cac5af20378a65301254.1539926193.git.Qi.Chen@windriver.com>
	<2980ba34e7eb66ad6ad22d5cd85b12a9bb7e30b2.camel@linuxfoundation.org>
	<1968d06f-a488-7e62-65e1-601bf0c24bba@windriver.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <7f2b4e9e-7f2f-89e9-4348-7f693f6115a6@windriver.com>
Date: Mon, 22 Oct 2018 15:20:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1968d06f-a488-7e62-65e1-601bf0c24bba@windriver.com>
X-Originating-IP: [128.224.162.153]
Subject: Re: [PATCH 1/1] systemd: add back alternatives for init utitilies
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
X-List-Received-Date: Mon, 22 Oct 2018 07:21:32 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 10/22/2018 03:01 PM, ChenQi wrote:
> On 10/21/2018 05:37 AM, Richard Purdie wrote:
>> On Fri, 2018-10-19 at 13:19 +0800, Chen Qi wrote:
>>> Add back alternatives for init utilities to avoid regression.
>>>
>>> These alternatives were removed when upgradeing systemd to 239.
>>> They were removed out of the logic that init utitilies should be
>>> bound to init manager. However, it turned out that two use cases
>>> were not covered.
>>>
>>> 1) initramfs using commands like 'reboot' from busybox.
>>> 2) Users use customized busybox defconfig which enables init
>>> utilities.
>>>
>>> The first use case caused a regression bug in yocto.
>>>    https://bugzilla.yoctoproject.org/show_bug.cgi?id=12914
>>> Patches were sent to fix the reboot problem.
>>>
>>> But this is not enough. As we may have the second use case. In such
>>> situation, users will find themselves having regression error when
>>> using 'busybox + systemd' (and busybox is installed after systemd,
>>> overriding the systemd symlinks).
>>>
>>> So in order to avoid regression, add back these alternatives.
>>>
>>> Signed-off-by
>> There is something odd going on which this change since it triggers:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/35/builds/95/steps/7/logs/step7c 
>>
>>
>> I've isolated it to this change having initially thought it was Mark's
>> systemd change...
>>
>> Cheers,
>>
>> Richard
>>
>>
> Hi Richard,
>
> I saw all those reverts and tests about master-next on oe mailing list 
> and I really feel sorry for causing autobuilder failures.
> Before I sent out the patch, I did do testimage test with 
> 'core-image-minimal + systemd + ssh + package-management' and things 
> were working well.
>
> Back to this failure, after some investigation, I finally found the 
> root cause. It's about udev-extraconf.
> Before my patch, udev-extraconf actually does not work as originally 
> designed. Check the following codes in mount.sh from udev-extraconf.
> BASE_INIT="`readlink "/sbin/init"`"
> INIT_SYSTEMD="/lib/systemd/systemd"
>
> if [ "x$BASE_INIT" = "x$INIT_SYSTEMD" ];then
>     # systemd as init uses systemd-mount to mount block devices
>     MOUNT="/usr/bin/systemd-mount"
>     UMOUNT="/usr/bin/systemd-umount"
> [snip]
>
> In our system, what we have is:
> root@qemux86-64:~# ls -l /sbin/init
> lrwxrwxrwx    1 root     root            22 Oct 22 04:00 /sbin/init -> 
> ../lib/systemd/systemd
>
> As '../lib/systemd/systemd' does not equal to '/lib/systemd/systemd', 
> the mount.sh is not using systemd-mount.
>
> When checking links, we should use `readlnk -f' instead of just 
> 'readlink'. In other words, things happen to succeed for 
> core-image-sato because of some error in the mount.sh script from 
> udev-extraconf.
>
> My patch links /sbin/init to /lib/systemd/systemd and that makes the 
> mount.sh start to work, thus revealing the error.
> In fact, besides the dev-vda.mount problem, I also got 
> media-run-hdc.mount failure on core-image-sato. They are both caused 
> by the udev-extraconf.
>
> I'm going to remove the 'init' from alternatives and send out V2. But 
> udev-extraconf also needs to be fixed.
> (CC Hongzhi who did the change.)
>
> Richard, what do you think we should do about the automount udev rule 
> from udev-extraconf?
> I'd suggest that we do not install the automount udev rule in case of 
> systemd. I think the mount.sh script is likely to cause conflicts and 
> failures unless it's constructed very carefully in case of systemd. 
> Unfortunately, I don't think that script could be easily made 
> reliable, considering all the possible .mount and .automount units 
> that users may add as custom configuration.
> Hongzhi, what's your opinion?

Hi all,

I am so sorry for causing failures. I will send patch to fix the issue 
as soon as possible.

I agree with Chen Qi's suggestions. The "mount.sh" is out-of-date.

--Hongzhi

>
> Best Regards,
> Chen Qi
>


