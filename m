Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AA2B973211
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 05:03:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0K53mpD021456
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 Jan 2016 21:03:48 -0800 (PST)
Received: from server.local (128.224.22.105) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 19 Jan 2016 21:03:46 -0800
To: Ming Liu <liu.ming50@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <1451999565-3502-1-git-send-email-liu.ming50@gmail.com>
	<569E8FDB.3000401@windriver.com> <569EACA0.8000007@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <569F1532.9050405@windriver.com>
Date: Wed, 20 Jan 2016 00:03:46 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <569EACA0.8000007@gmail.com>
Cc: yue.tao@windriver.com
Subject: Re: [PATCH 0/3] Introduces kernel-initramfs recipe to resolve a implicit dependency issue
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
X-List-Received-Date: Wed, 20 Jan 2016 05:03:49 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-01-19 4:37 PM, Ming Liu wrote:
>
>
> On 01/19/2016 08:34 PM, Bruce Ashfield wrote:
>> On 16-01-05 08:12 AM, Ming Liu wrote:
>>> In current initramfs bundled kernel packaging policy, there are several
>>> dependency chains co-existing:
>>>
>>> | "core-image-minimal.do_build" ->
>>> "core-image-minimal.do_bundle_initramfs"
>>> | "core-image-minimal.do_bundle_initramfs" ->
>>> "virtual/kernel.do_bundle_initramfs"
>>> | "core-image-minimal.do_bundle_initramfs" ->
>>> "core-image-minimal.do_rootfs"
>>
>> In current master, the above dependency should now be
>> do_image_complete, correct ?
> Yes, now it has been changed to do_image_complete.
>
>>
>>> | "core-image-minimal.do_rootfs" ->
>>> "virtual/kernel.do_package_write_${IMAGE_PKGTYPE}"
>>
>> And for the one above here, I'm not seeing this dependency. Are you
>> saying that it comes via the do_image_complete dependency ?
> It comes from the "recrdeptask" flag in image bbclass, for instance,
> meta/classes/rootfs_rpm.bbclass, it has:
> do_rootfs[recrdeptask] += "do_package_write_rpm"
>
> this makes sure that do_rootfs task of a certain image would run after
> do_package_write_rpm of all its DEPENDS and RDEPENDS, recursively.
>
>>
>>> | "virtual/kernel.do_package_write_${IMAGE_PKGTYPE}" ->
>>> "virtual/kernel.do_package"
>>> | "virtual/kernel.do_package" -> "virtual/kernel.do_install"
>>> |
>>> | "virtual/kernel.do_deploy" -> "virtual/kernel.do_bundle_initramfs"
>>> | "virtual/kernel.do_bundle_initramfs" -> "virtual/kernel.do_install"
>>
>> I'm somehow missing the above dependency as well. I suppose I could dump
>> out the dot file, but I'd like to hear it explained here as well. Since
>> if I can't get the dependency from the text of the commits, it will
>> become hard to maintain.
> They are intertask dependencies, I still take RPM as a example:
> meta/classes/package_rpm.bbclass:addtask package_write_rpm after
> do_packagedata do_package
> meta/classes/kernel.bbclass:addtask bundle_initramfs after do_install
> before do_deploy
>
>>
>>>
>>> We could see, virtual/kernel.do_package is not explicitly depending on
>>> virtual/kernel.do_bundle_initramfs so far, therefore, there is not a
>>> workable way to add initramfs bundled kernel image into rootfs, because
>>> kernel's do_bundle_initramfs could run parallelly with its do_package,
>>> which means we will get a implicit kernel-image package that
>>> sometimes it
>>> contains the initramfs bundled kernel or sometimes it doesn't.
>>
>> I do see what you are describing above. If we've defined
>> INITRAMFS_IMAGE, the anonymous python in kernel.bbclass does make
>> the kernel's do_bundle_initramfs depend on the initramfs image's
>> do_image_complete.
>>
>> Why not just add a task dependency ?
> Do you mean adding a task dependency between package and

As long as we've built the kernel + modules and also built the
initramfs image, we have everything we need to bundle the kernel and
initramfs.

.. but yes, if it wasn't package, it would have to be the compile
phase, and the circular dependency is the same.

> bundle_initramfs in kernel recipe? But that would introduce a circular
> dependency issue as described in commit log of
> 609d5a9ab9e58bb1c2bcc2145399fbc8b701b85a, under following conditions:
> 1 Some kernel modules have been added into INITRAMFS_IMAGE.
> 2 INITRAMFS_IMAGE has been bundled into kernel image
> 3 kernel-image package has been added into IMAGE_INSTALL.
>

Agreed.

>>
>>>
>>> To fix this problem, the idea is to let the initramfs bundled kernel
>>> packaging depend on do_bundle_initramfs, meanwhile, to avoid the
>>> circular
>>> dependency issue that commit: 609d5a9ab9e58bb1c2bcc2145399fbc8b701b85a
>>> [ kernel.bbclass, image.bbclass: Implement kernel INITRAMFS
>>> dependency and bundling ]
>>
>> But here's my issue. We know that the INITRAMFS image cannot contain,
>> or depend on a kernel itself. So the dependency won't be circular.
>> It is true that we don't enforce that, but that has always been stated
>> in the commits that created the bundling.
>>
>> Is it that condition you are trying to enforce with the split ?
> I know that the users are not allowed to add kernel itself into a
> INITRAMFS_IMAGE meanwhile bundle it into kernel, which will certainly
> create a circular dependency. The split was not trying to resolve that
> condition, but to fix a implicit kernel-image package without
> introducing any circular dependencies.

Right.

Bruce

>
> //Ming Liu
>>
>> Bruce
>>
>>>
>>> was trying to address, this dependency has to be splitted from kernel
>>> recipe(at least, I could not figure out another way to achieve it), so a
>>> new kernel-initramfs is introduced, in which a dependency chain is
>>> created:
>>>
>>> | "kernel-initramfs.do_install" -> "virtual/kernel.do_deploy"
>>> | "virtual/kernel.do_deploy" -> "virtual/kernel.do_bundle_initramfs"
>>>
>>> Then the users can add initramfs bundled kernel image into rootfs by:
>>>
>>> IMAGE_INSTALL_append = " kernel-initramfs"
>>>
>>> without introducing any circular dependencies.
>>>
>>> Ming Liu (3):
>>>    kernel.bbclass: do not install initramfs bundled kernel image
>>>    image.bbclass: removes bundle_initramfs related code
>>>    kernel-initramfs: new recipe, creates initramfs bundled kernel
>>>      packaging
>>>
>>>   meta/classes/image.bbclass                    | 11 -----
>>>   meta/classes/kernel.bbclass                   |  4 --
>>>   meta/recipes-kernel/linux/kernel-initramfs.bb | 69
>>> +++++++++++++++++++++++++++
>>>   3 files changed, 69 insertions(+), 15 deletions(-)
>>>   create mode 100644 meta/recipes-kernel/linux/kernel-initramfs.bb
>>>
>>
>


