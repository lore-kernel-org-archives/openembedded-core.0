Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BE2F560811
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 15:49:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4UFnpgk012243
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 May 2013 08:49:51 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Thu, 30 May 2013 08:49:51 -0700
Message-ID: <51A7751E.9060102@windriver.com>
Date: Thu, 30 May 2013 10:49:50 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Philip Balister <philip@balister.org>
References: <cover.1369820334.git.hongxu.jia@windriver.com>
	<51A71980.30802@communistcode.co.uk>
	<51A74370.3030700@windriver.com> <51A74CFA.5090609@balister.org>
In-Reply-To: <51A74CFA.5090609@balister.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4]Add FUSE: File system in Userspace
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
X-List-Received-Date: Thu, 30 May 2013 15:49:53 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/30/13 7:58 AM, Philip Balister wrote:
> On 05/30/2013 08:17 AM, Mark Hatle wrote:
>> On 5/30/13 4:18 AM, Jack Mitchell wrote:
>>>
>>> On 30/05/13 10:01, Hongxu Jia wrote:
>>>> Add fuse to oe-core and let target system could support
>>>> `ntfs' and `exfat' filesystems.
>>>>
>>>> Test Case
>>>>
>>>> *Steps
>>>> 1, preparation
>>>> 1 target: e-menlow
>>>> 2 usb sticks: one for boot and install, another for filesystem test.
>>>>
>>>> 2, config
>>>> conf/local.conf:
>>>> 247 MACHINE ?= "emenlow-noemgd"
>>>> 247 IMAGE_INSTALL_append = " ntfs-3g ntfsprogs fuse-exfat exfat-utils"
>>>>
>>>> conf/bblayers.conf:
>>>>      8 BBLAYERS ?= " \
>>>>      9   /home/jiahongxu/yocto/poky/meta \
>>>>     10   /home/jiahongxu/yocto/poky/meta-yocto \
>>>>     11   /home/jiahongxu/yocto/poky/meta-yocto-bsp \
>>>>     12   /home/jiahongxu/yocto/poky/meta-intel \
>>>>     13   /home/jiahongxu/yocto/poky/meta-intel/meta-emenlow \
>>>>
>>>> 3, build image
>>>> bitbake core-image-sato
>>>>
>>>> 4, load image to emenlow
>>>> Test Case TC-2927: boot and install from usb
>>>>
>>>> 5, open a terminal/ssh of e-menlow
>>>> Test Case TC-2955: remote access by ssh
>>>>
>>>> 6, make exfat filesystem on the testing usb storage
>>>> 1) plug usb stick into e-menlow
>>>> 2) execute `mkfs.exfat /dev/sdc1'
>>>>
>>>> 7, test usb stick with exfat filesystem is accessible
>>>> Test Case TC-2947: usb mount
>>>> Test Case TC-2948: usb read files
>>>> Test Case TC-2949: usb umount
>>>> Test Case TC-2950: usb write files
>>>>
>>>> 8, make ntfs filesystem on the testing usb storage
>>>> 1) plug usb stick into e-menlow, if mounted, invoke `umount
>>>> /dev/sdc1' first.
>>>> 2) execute `mkfs.ntfs -f /dev/sdc1'
>>>>
>>>> 9, test usb stick with ntfs filesystem is accessible
>>>> Test Case TC-2947: usb mount
>>>> Test Case TC-2948: usb read files
>>>> Test Case TC-2949: usb umount
>>>> Test Case TC-2950: usb write files
>>>>
>>>> *Expected Results:
>>>> 1, build image success
>>>>
>>>> 2, make exfat filesystem success
>>>> root@emenlow-noemgd:~# mkfs.exfat /dev/sdc1
>>>> mkexfatfs 1.0.1
>>>> Creating... done.
>>>> Flushing... done.
>>>> File system created successfully.
>>>>
>>>> 3, make ntfs filesystem success
>>>> root@emenlow-noemgd:~# mkfs.ntfs -f /dev/sdc1
>>>> Cluster size has been automatically set to 4096 bytes.
>>>> Creating NTFS volume structures.
>>>> mkntfs completed successfully. Have a nice day.
>>>>
>>>> 4, While the usb's filesystem type is exfat or ntfs, system can mount
>>>> plugged usb automatically, read files from usb, write files to usb and
>>>> unmout usb automatically.
>>>>
>>>> [YOCTO #4178]
>>>>
>>>> The following changes since commit
>>>> 350c36fcd97e8ef223b91e548d39c346c1c4cb29:
>>>>
>>>>      bitbake: test/fetch: Allow the conditional network tests to work
>>>> under python 2.6 (2013-05-17 12:42:08 +0300)
>>>>
>>>> are available in the git repository at:
>>>>
>>>>      git://git.pokylinux.org/poky-contrib hongxu/support-fuse
>>>>
>>>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/support-fuse
>>>>
>>>>
>>>> Hongxu Jia (4):
>>>>      fuse: import recipe from meta-oe
>>>>      ntfs-3g-ntfsprogs:import and update recipe from meta-oe
>>>>      fuse-exfat: add version 1.0.1
>>>>      exfat-utils: add version 1.0.1
>>>>
>>>>     meta/recipes-support/exfat/exfat-utils_1.0.1.bb    |   29 ++++++++++
>>>>     meta/recipes-support/exfat/fuse-exfat_1.0.1.bb     |   26 +++++++++
>>>>     meta/recipes-support/fuse/fuse-2.9.2/aarch64.patch |   20 +++++++
>>>>     .../fuse/fuse-2.9.2/gold-unversioned-symbol.patch  |   60
>>>> ++++++++++++++++++++
>>>>     meta/recipes-support/fuse/fuse_2.9.2.bb            |   38
>>>> +++++++++++++
>>>>     .../ntfs-3g-ntfsprogs_2013.1.13.bb                 |   33 +++++++++++
>>>>     6 files changed, 206 insertions(+)
>>>>     create mode 100644 meta/recipes-support/exfat/exfat-utils_1.0.1.bb
>>>>     create mode 100644 meta/recipes-support/exfat/fuse-exfat_1.0.1.bb
>>>>     create mode 100644 meta/recipes-support/fuse/fuse-2.9.2/aarch64.patch
>>>>     create mode 100644
>>>> meta/recipes-support/fuse/fuse-2.9.2/gold-unversioned-symbol.patch
>>>>     create mode 100644 meta/recipes-support/fuse/fuse_2.9.2.bb
>>>>     create mode 100644
>>>> meta/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2013.1.13.bb
>>>>
>>>
>>> Without trying to be difficult, is oe-core really the place to support
>>> and spend effort ensuring NTFS/exFAT formatted drives are supported?
>>
>> The basis of this work comes from pretty much all SD/MicroSD cards, most
>> consumer USB hard disks, etc being preformatted as NTFS/exFAT.  When
>> building a consumer device the designers often want to just use FUSE out
>> of the box so they don't have to work on adding the functionality
>> themselves.
>>
>> meta-oe is often times too much stuff in one bundle to just included in
>> a project.  The developers I work with prefer a smaller load of
>> packages, primarily oe-core + whatever they need.  It makes it easier to
>> support and easier to prevent problems from being introduced by feature
>> creep.
>
> If there are issues using meta-oe for a few recipes, we need to identify
> these issues and fix them.

The issue isn't that it's a few bad recipes, the issue is that meta-oe is a 
collection of software that doesn't fit anywhere else.  (I'm speaking 
specifically of meta-oe, -not- meta-openembedded which has multiple layers in it.)

It's easy for me to justify meta-gnome, if I need gnome.. meta-multimedia, if I 
need multimedia, etc..  but meta-oe has no single purpose, it's just the place 
where stuff is put when it doesn't fit anywhere else -- or someone is 
experimenting with new code.

It has 413 recipes (and 2 bbappends).  Of the 413, likely many of those should 
really be in one of the other meta-openembedded layers (or even other project 
layers).  But my customers are not willing to bring in 413 packages just for '1' 
package they might need out of the set.

(Similarly, we don't just "bring in" meta-openembedded either.. we break out the 
layers so only the ones we're willing to support, and our customers need are 
provided to them.)  There is no such thing as an "unsupported" package when you 
are a commercial vendor.

> If we do not advocate for the layer model, we risk creeping slowly back
> to the monolithic OE of days gone by.

It's not the layer model that is the issue, it's that meta-oe has no single 
purpose other then to house things that aren't somewhere else.

What I (speaking as a vendor and my customer advocate) want is oe-core to 
contain the base software that most devices may need.  Then individual layers to 
add capabilities above and beyond that.  (Capabilities may be things like BSPs, 
networking, multimedia, gnome, kde, distributions, etc.)

> Philip
>
>>
>>> Could these improvements not stay in meta-oe? I don't really see support
>>> for essentially propriety filesystems as a core feature of a Linux build.
>>
>> Yes they could, but then it forces more people to copy the recipes out
>> of meta-oe.
>>
>> I myself am mixed on if fuse belongs on oe-core or not.  I can see the
>> argument both ways on including it or rejecting it.  However, I'm
>> getting more and more commercial requests for FUSE to be part of the
>> main system.
>>
>>> Shout up if I'm talking nonsense, just my 2p.
>>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>


