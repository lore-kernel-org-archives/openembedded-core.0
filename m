Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 618DB796E4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2018 06:09:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9O69umG009167
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 23 Oct 2018 23:09:56 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Tue, 23 Oct 2018 23:09:55 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1540191752.git.Qi.Chen@windriver.com>
	<a2bd44ad10ae076b40b11a1a2c8d0007817b17af.1540191752.git.Qi.Chen@windriver.com>
	<ae8c420e68e7027797576f48f414cbd3bdbaa5a5.camel@linuxfoundation.org>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <0dd8f9ff-1a40-615f-962e-b5fb60f7f57e@windriver.com>
Date: Wed, 24 Oct 2018 14:16:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <ae8c420e68e7027797576f48f414cbd3bdbaa5a5.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.218]
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
X-List-Received-Date: Wed, 24 Oct 2018 06:09:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/24/2018 05:48 AM, Richard Purdie wrote:
> On Mon, 2018-10-22 at 15:03 +0800, Chen Qi wrote:
>> Add back alternatives for init utilities to avoid regression.
>>
>> These alternatives were removed when upgradeing systemd to 239.
>> They were removed out of the logic that init utitilies should be
>> bound to init manager. However, it turned out that two use cases
>> were not covered.
>>
>> 1) initramfs using commands like 'reboot' from busybox.
>> 2) Users use customized busybox defconfig which enables init
>> utilities.
>>
>> The first use case caused a regression bug in yocto.
>>    https://bugzilla.yoctoproject.org/show_bug.cgi?id=12914
>> Patches were sent to fix the reboot problem.
>>
>> But this is not enough. As we may have the second use case. In such
>> situation, users will find themselves having regression error when
>> using 'busybox + systemd' (and busybox is installed after systemd,
>> overriding the systemd symlinks).
>>
>> So in order to avoid regression, add back these alternatives.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> Sorry but this is still failing:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/35/builds/107/steps/7/logs/step7c
>
> Cheers,
>
> Richard
>
>
Hi Richard,

The failure is revealed by Kevin's patches regarding udev-extraconf. 
More particularly, it's the following patch that reveals the problem.
"udev-extraconf: Use the canonical file name of systemd"

I've sent out a patch to remove udev-extraconf from 
packagegroup-core-lsb/-x11-sato to fix this failure.
I tested 'testimage + core-image-sato/lsb' with the following 5 patches 
(3 from Kevin which are now on master-next, 2 from me) with master 
branch, and the tests passed.
  packagegroup-core-lsb/-x11-sato: no udev-extraconf in case of systemd
  systemd: add back alternatives for init utitilies
  udev-extraconf: Skip the entry in /etc/fstab when using the systemd-mount
  udev-extraconf: Fix the recursively dependency for the systemd-mount
  udev-extraconf: Use the canonical file name of systemd

P.S.
I chose to remove udev-extraconf from these two packagegroups because:
1) udev-extraconf is needed in live image, so the automount rule needs 
to be there in the final package, regardless of the init manager of the 
real rootfs.
2) It's not clear whether users need the automount feature in case of 
systemd. So I didn't choose to modify the mount.sh script to exit 
directly if init manager is systemd.
3) I think it's not easy to make mount.sh reliable in systemd. Kevin's 
patches are good and helpful, but still not solve all problems. e.g. The 
mount.sh still doesn't take into consideration of .mount and .automount 
units; and it does not consider this failure case, i.e. no medium found 
on /dev/hdc.

Best Regards,
Chen Qi

Best Regards,
Chen Qi

