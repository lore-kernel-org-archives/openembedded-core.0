Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1385F6E5FC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 02:22:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vAL2M6b4030783
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 20 Nov 2017 18:22:06 -0800
Received: from [128.224.162.147] (128.224.162.147) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 20 Nov 2017 18:22:05 -0800
To: Andre McCurdy <armccurdy@gmail.com>
References: <1510898885-256081-1-git-send-email-hongxu.jia@windriver.com>
	<CAJTo0LaojmxziZDKu48jfM4K+TW6V9ra=FE8x_oJSz3ps+gG-g@mail.gmail.com>
	<82397892-7190-ac1a-8aa4-128cb928e8f0@windriver.com>
	<CAJ86T=VJo7d94DVxHGdhRLve8kjWNRSidMJfuxPxienV1MK3yA@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <e02b7a4b-0430-81f9-8dfa-7ff3d616d0f5@windriver.com>
Date: Tue, 21 Nov 2017 10:24:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=VJo7d94DVxHGdhRLve8kjWNRSidMJfuxPxienV1MK3yA@mail.gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] systemd: fix formatting IDE storage does not trigger "change" uevents
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
X-List-Received-Date: Tue, 21 Nov 2017 02:22:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2017年11月21日 10:00, Andre McCurdy wrote:
> On Mon, Nov 20, 2017 at 5:21 PM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> On 2017年11月20日 19:07, Burton, Ross wrote:
>> On 17 November 2017 at 06:08, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>>> +qemu by default emulates IDE and the linux-yocto kernel(s) use
>>> +CONFIG_IDE instead of the more modern libsata, so disks appear as
>>> +/dev/hd*. A similar patch rejected by upstream because CONFIG_IDE
>>> +is deprecated.
>> Can we fix our kernel and/or qemu configuration too?
>>
>> For qemu, RP have replace it with virtio, but it have the
>> similar issue on virtualbox with IDE controller.
> VirtualBox gives you the choice about whether to connect the HDD image
> to a virtual IDE or SATA port.
>
> ie VirtualBox isn't a reason to have our rootfs images continue to try
> to support IDE.

For IDE, the mainstream distribution (ubuntu/fedora) do not support it.

Ubuntu 17.10, kernel 4.13.0-16
vim /boot/config-4.13.0-16-generic
...
# CONFIG_IDE is not set
CONFIG_ATA_PIIX=y
...

Fedora 27, kernel 4.13.5
vi /boot/config-4.13.5-300.fc27.x86_64
...
# CONFIG_IDE is not set
CONFIG_ATA_PIIX=y
...

The IDE seems not stable, and I have fixed two issue on it.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=79d73346ac05bc31f2e96f899c4e9aaaa616a8d4
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8dc7a31fbce5e2dbbacd83d910da37105181b054

If enable both of IDE and ATA and the IDE still have a higher priority.
We should explicitly not set CONFIG_IDE.

Here is the discussion on upstream mailing list.
https://www.mail-archive.com/linux-block@vger.kernel.org/msg15114.html

//Hongxu

>> ...
>> commit f59e729f98ef9b506b0cfdc415567e03ec87f2a9
>> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Date:   Tue Aug 22 22:58:02 2017 +0100
>>
>>      runqemu: Use virtio to mount cdrom drives
>>
>>      The IDE driver in the kernel is fragile and in 4.12 is causing
>> backtraces.
>>      To unblock 4.12 kernel merging use the virtio CD driver instead to mount
>>      iso images which should be faster and more stable.
>> ...
>>
>> //Hongxu
>>
>> Ross
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>


