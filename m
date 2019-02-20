Return-Path: <ml@embed.me.uk>
X-Greylist: delayed 1598 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 20 Feb 2019 09:38:42 UTC
Received: from legacy.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6F0287C66D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 09:38:42 +0000 (UTC)
To: openembedded-core@lists.openembedded.org
References: <83ec17fa-88b0-04fa-adab-b402b10c6339@topic.nl>
	<CAMjhiJjO0+0=_6HOmVM67U0nnbW=iu-FiMTzJBe4ZCvceuguuA@mail.gmail.com>
	<CAJ86T=Vy6AMbJ0J23V_9K+GJxwCFjD-Gq7NQwZ7AeJSW5Lum_A@mail.gmail.com>
	<CAMjhiJgFxSH3Rz+ot6qAZN1LPF=WmZ1ySt0Y4TSCg0S0m7YsxQ@mail.gmail.com>
From: Jack Mitchell <ml@embed.me.uk>
Message-ID: <647c28e3-fe28-cc3c-505e-2520ef11a4b6@embed.me.uk>
Date: Wed, 20 Feb 2019 09:12:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <CAMjhiJgFxSH3Rz+ot6qAZN1LPF=WmZ1ySt0Y4TSCg0S0m7YsxQ@mail.gmail.com>
Subject: Re: wic creates ext4 images that read really slow in u-boot
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
X-List-Received-Date: Wed, 20 Feb 2019 09:38:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-BW
Content-Transfer-Encoding: 7bit



On 19/02/2019 20:45, Leon Woestenberg wrote:
> Hello all,
> 
> On Tue, Feb 19, 2019 at 8:28 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>> On Tue, Feb 19, 2019 at 9:13 AM Leon Woestenberg <leon@sidebranch.com> wrote:
>>>
>>> Hello Mike,
>>>
>>> sounds familiar.
>>>
>>> On Tue, 19 Feb 2019 at 17:55, Mike Looijmans <mike.looijmans@topic.nl> wrote:
>>>>
>>>> Took me a while to figure out why my board took 90 seconds to boot suddenly.
>>>> The issue turned out to be the ext4 partition created by wic.
>>>
>>> I suspect it's not WIC's fault.
>>>>
>>>> ZynqMP> load mmc 0:2 0x100000 /lib/firmware/fpga.bin
>>>> 19311092 bytes read in 85529 ms (219.7 KiB/s)
>>>>
>>>> Now if I boot the board rename and copy that file onto itself, then it's
>>>> suddenly normal again when I reboot the board:
>>>>
>>>> ZynqMP> load mmc 0:2 0x10000
>>>> I'm not knowledgeable on ext4, so any ideas what's being passed onto the image
>>>> creation tool that causes this?
>>>
>>> I suspect your version of U-Boot does not handle files spread across multiple filesystems (allocation) extends efficiently.
>>>
>>> Copying the file makes the copy being layed out in one extend probably.
>>
>>
>> If WIC is generating filesystem images from scratch there's no excuse for files to be unnecessarily fragmented.
>>
>> Even if some of all of the boot time can be recovered by a patch to u-boot that won't help systems which have already been deployed and don't have a way to update the bootloader.
>>
> I am not sure if "fragmented" is the right term in terms of filesystem
> details. Filesystem allocation extents (not "extends" as I mistyped
> earlier) are different from heavy file fragmentation. However, I agree
> things can be made more optimal.
> 
> So, with adding the above, there are *two* issues at play here:
> 1) Most/older versions of U-Boot not able to efficiently load files
> from ext4 filesystems, that cross multiple extents. I am aware of two
> fixes, see below.
> 2) WIC uses mkext4fs in such a way that files can cross multiple
> (allocation) extents. This is sub-optimal and know to cause issues
> with many U-Boot versions (deployed on existing systems in the field).
> The problems shows "randomly" with large files being deployed to the
> ext4 filesystem. We (OE/Yocto) may want to fix this.
> 
>>> I am aware of two fixes for U-Boot. I will look them up, and reply again to this thread.
> 
> Google for these two commits. I cherry-picked the first one for my
> project and can confirm it brings back the desired performance. (Still
> assuming this is the identical cause as for TO/Mike.)
> 
> commit 855b8e4f9f255415a7753819e392e4b5d984f35c
> Author: Matt Madison <matt@madison.systems>
> Date:   Sat Aug 19 08:46:46 2017 -0700
> 
>     ext4: cache extent blocks during file reads
> 
>     A simpler and less-efficient approach to solving
>     the problem with extent index blocks than what
>     was in fc0fc50f38a4d7d0554558076a79dfe8b0d78cd5,
>     but one that does not break write operations.
> 
>     Signed-off-by: Matt Madison <matt@madison.systems>
> 
> Regards,
> 
> Leon.
> 
> p.s. excuse the earlier HTML mail with signature
> 

I can concur that I have also used this patch to fix speed issues with
ext4 reads. The problem becomes particularly prominent when you have
large files on a small partition which get over-written. I'm sure I have
seen a patch go into uboot mainline recently which improved performance
but I can't find it or it never actually made it into the tree.

