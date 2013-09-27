Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 22C0E61844
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 12:33:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8RCXfu5004274
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 27 Sep 2013 05:33:41 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 27 Sep 2013 05:33:41 -0700
Message-ID: <52457B23.8040306@windriver.com>
Date: Fri, 27 Sep 2013 08:33:39 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Andrea Adami <andrea.adami@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <1377212667-5915-1-git-send-email-jason.wessel@windriver.com>	<1377364531.6762.202.camel@ted>	<CAAQYJAtn3RqJa4K=-UUjfxQemqwH5Te1wCvGRqeJxhii03h29A@mail.gmail.com>	<1380272728.18603.414.camel@ted>
	<CAAQYJAs3P1ii+RTgRdWq0R00p+20CKg25AbZhfUDwe7ZCxVpQA@mail.gmail.com>
In-Reply-To: <CAAQYJAs3P1ii+RTgRdWq0R00p+20CKg25AbZhfUDwe7ZCxVpQA@mail.gmail.com>
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [v2 PATCH] kernel.bbclass, image.bbclass: Implement kernel INITRAMFS dependency and bundling
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
X-List-Received-Date: Fri, 27 Sep 2013 12:33:44 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-09-27 07:59 AM, Andrea Adami wrote:
> On Fri, Sep 27, 2013 at 11:05 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Fri, 2013-09-27 at 10:07 +0200, Andrea Adami wrote:
>>> On Sat, Aug 24, 2013 at 7:15 PM, Richard Purdie
>>> <richard.purdie@linuxfoundation.org> wrote:
>>>> On Thu, 2013-08-22 at 18:04 -0500, Jason Wessel wrote:
>>>>> This patch aims to fix the following two cases for the INITRAMFS generation.
>>>>>    1) Allow an image recipe to specify a paired INITRAMFS recipe such
>>>>>       as core-image-minimal-initramfs.  This allows building a base
>>>>>       image which always generates the needed initramfs image in one step
>>>>>    2) Allow building a single binary which contains a kernel and
>>>>>       the initramfs.
>>>>>
>>>>> A key requirement of the initramfs is to be able to add kernel
>>>>> modules.  The current implementation of the INITRAMFS_IMAGE variable
>>>>> has a circular dependency when using kernel modules in the initramfs
>>>>> image.bb file that is caused by kernel.bbclass trying to build the
>>>>> initramfs before the kernel's do_install rule.
>>>>>
>>>>> The solution for this problem is to have the kernel's
>>>>> do_bundle_initramfs_image task depend on the do_rootfs from the
>>>>> INITRAMFS_IMAGE and not some intermediate point.  The image.bbclass
>>>>> will also sets up dependencies to make the initramfs creation task run
>>>>> last.
>>>>>
>>>>> The code to bundle the kernel and initramfs together has been added.
>>>>> At a high level, all it is doing is invoking a second compilation of
>>>>> the kernel but changing the value of CONFIG_INITRAMFS_SOURCE to point
>>>>> to the generated initramfs from the image recipe.
>>>>>
>>>>> [YOCTO #4072]
>>>>>
>>>>> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
>>>>> Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>>>>
>>>> I have a couple of things I'd really like to see get resolved here. One
>>>> is below, the other is I'm worried about the packaged output differences
>>>> since we can package the kernel into a package file and now its going to
>>>> be different.
>>>>
>>>> I appreciate its a hard problem to solve but not impossible. Basically
>>>> we move the package generation for that single package into a separate
>>>> recipe and have it depend on the bundling task if/as/when needed. The
>>>> bundle task stashes the kernel in the sysroot, the other recipe simply
>>>> packages it. Its a little bit of a dance but should ensure we get
>>>> everything consistent.
>>>>
>>>>
>>>>> ---
>>>>>   meta/classes/image.bbclass  |   12 ++++++
>>>>>   meta/classes/kernel.bbclass |   96 +++++++++++++++++++++++++++++++++++++------
>>>>>   meta/conf/local.conf.sample |   20 +++++++++
>>>>>   3 files changed, 116 insertions(+), 12 deletions(-)
>>>>>
>>>>> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>>>>> index 909702a..23967ec 100644
>>>>> --- a/meta/classes/image.bbclass
>>>>> +++ b/meta/classes/image.bbclass
>>>>> @@ -130,6 +130,10 @@ python () {
>>>>>       d.setVar('MULTILIB_VENDORS', ml_vendor_list)
>>>>>
>>>>>       check_image_features(d)
>>>>> +    initramfs_image = d.getVar('INITRAMFS_IMAGE', True) or ""
>>>>> +    if initramfs_image != "":
>>>>> +        d.appendVarFlag('do_build', 'depends', " %s:do_bundle_initramfs" %  d.getVar('PN', True))
>>>>> +        d.appendVarFlag('do_bundle_initramfs', 'depends', " %s:do_rootfs" % initramfs_image)
>>>>>   }
>>>>>
>>>>>   #
>>>>> @@ -629,3 +633,11 @@ do_package_write_deb[noexec] = "1"
>>>>>   do_package_write_rpm[noexec] = "1"
>>>>>
>>>>>   addtask rootfs before do_build
>>>>> +# Allow the kernel to be repacked with the initramfs and boot image file as a single file
>>>>> +do_bundle_initramfs[depends] += "virtual/kernel:do_bundle_initramfs"
>>>>> +do_bundle_initramfs[nostamp] = "1"
>>>>> +do_bundle_initramfs[noexec] = "1"
>>>>> +do_bundle_initramfs () {
>>>>> +     :
>>>>> +}
>>>>> +addtask bundle_initramfs after do_rootfs
>>>>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>>>>> index e039dfc..8cf66ce 100644
>>>>> --- a/meta/classes/kernel.bbclass
>>>>> +++ b/meta/classes/kernel.bbclass
>>>>> @@ -9,6 +9,7 @@ INHIBIT_DEFAULT_DEPS = "1"
>>>>>   KERNEL_IMAGETYPE ?= "zImage"
>>>>>   INITRAMFS_IMAGE ?= ""
>>>>>   INITRAMFS_TASK ?= ""
>>>>> +INITRAMFS_IMAGE_BUNDLE ?= ""
>>>>>
>>>>>   python __anonymous () {
>>>>>       kerneltype = d.getVar('KERNEL_IMAGETYPE', True) or ''
>>>>> @@ -19,7 +20,15 @@ python __anonymous () {
>>>>>
>>>>>       image = d.getVar('INITRAMFS_IMAGE', True)
>>>>>       if image:
>>>>> -        d.setVar('INITRAMFS_TASK', '${INITRAMFS_IMAGE}:do_rootfs')
>>>>> +        d.appendVarFlag('do_bundle_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_rootfs')
>>>>> +
>>>>> +    # NOTE: setting INITRAMFS_TASK is for backward compatibility
>>>>> +    #       The preferred method is to set INITRAMFS_IMAGE, because
>>>>> +    #       this INITRAMFS_TASK has circular dependency problems
>>>>> +    #       if the initramfs requires kernel modules
>>>>> +    image_task = d.getVar('INITRAMFS_TASK', True)
>>>>> +    if image_task:
>>>>> +        d.appendVarFlag('do_configure', 'depends', ' ${INITRAMFS_TASK}')
>>>>>   }
>>>>>
>>>>>   inherit kernel-arch deploy
>>>>> @@ -72,9 +81,82 @@ KERNEL_SRC_PATH = "/usr/src/kernel"
>>>>>
>>>>>   KERNEL_IMAGETYPE_FOR_MAKE = "${@(lambda s: s[:-3] if s[-3:] == ".gz" else s)(d.getVar('KERNEL_IMAGETYPE', True))}"
>>>>>
>>>>> +copy_initramfs() {
>>>>> +     echo "Copying initramfs into ./usr ..."
>>>>> +     # Find and use the first initramfs image archive type we find
>>>>> +     rm -f ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio
>>>>> +     for img in cpio.gz cpio.lzo cpio.lzma cpio.xz; do
>>>>> +             if [ -e "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img" ]; then
>>>>> +                     cp ${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img ${B}/usr/.
>>>>> +                     case $img in
>>>>> +                     *gz)
>>>>> +                             echo "gzip decompressing image"
>>>>> +                             gunzip -f ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.$img
>>>>> +                             break
>>>>> +                             ;;
>>>>> +                     *lzo)
>>>>> +                             echo "lzo decompressing image"
>>>>> +                             lzop -df ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.$img
>>>>> +                             break
>>>>> +                             ;;
>>>>> +                     *lzma)
>>>>> +                             echo "lzma decompressing image"
>>>>> +                             lzmash -df ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.$img
>>>>> +                             break
>>>>> +                             ;;
>>>>> +                     *xz)
>>>>> +                             echo "xz decompressing image"
>>>>> +                             xz -df ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.$img
>>>>> +                             break
>>>>> +                             ;;
>>>>> +                     esac
>>>>> +             fi
>>>>> +     done
>>>>> +     echo "Finished copy of initramfs into ./usr"
>>>>> +}
>>>>
>>>> But what about my bzip2'd image? ;-)
>>>>
>>>> I'd suggest we rid of this and instead ensure that we're generating an
>>>> uncompressed cpio image. The image generation code will happily sort
>>>> that our for us if we ask it for that specific image type.
>>>>
>>>> I'd also wondered if we could remove INITRAMFS_TASK since its just going
>>>> to confuse things and I'd prefer to maintain only one way of doing this
>>>> if at all possible.
>>>>
>>>> Cheers,
>>>>
>>>> Richard
>>>
>>>
>>> Though our observations, in an effort to solve Yocto #4072 the
>>> patchset has been merged.
>>> As side effect it broke the 'old style' creation of initramfs so some
>>> recipes are now unbuildable.
>>>
>>> I'm in touch with Bruce and Jason and I have already a patch for
>>> kernel.bbclass restoring the old functionality by adding one more
>>> variable in each recipe: INITRAMFS_TASK.
>>>
>>> I'm pretty sure we could have built the same kind of images containing
>>> modules in one pass before as well and still dislike the idea of
>>> having to set a variable in local.conf to spread it to the kernel and
>>> to the image (to any image...)
>>>
>>> With 1.5 approaching I'd like to have the issue solved as soon as possible.
>>> Richard, when is deadline for core-patches?
>>
>> Basically ASAP. The next release build is the start of next week but any
>> patches going into that need to have been run through an autobuilder
>> cycle first.
>>
>> This is the first I've heard of the problem, other than some comments
>> about possible problems on irc. Can someone please open up a bug for
>> this and clearly describe what used to work and now doesn't and what the
>> possible fixes or workarounds are?
>>
>> I don't think anyone likes regressions however if we don't have the open
>> bug, its very hard to track.
>>
>> You say you've talked to Bruce/Jason but why didn't the discussion
>> happen on the mailing list? That way others may have been able to help
>> and now I could read back the list and see for myself what the issue is.
>> As it is, I simply don't know other than the need to set a new variable
>> which is hinted at above...
>>
>
> I'm waiting for feedback because my patch is just restoring some lines
> of code in kernel_do_configure removed by the a.m. patch and should be
> harmless wrt 'new-style' builds.
> I don't know exactly which image has to be built for testing: I
> successfully embedded core-image-base and its kernel+modules.
>
> The point is, with the actual kernel.bbclass, it could *perhaps* be
> necessary to add one more check before copying the cpio to the kernel
> /usr.
>
> -    if [ ! -z "${INITRAMFS_IMAGE}" ]; then
> +    if [ ! -z "${INITRAMFS_IMAGE}" -a ! -z "${INITRAMFS_TASK}" ]; then
>
> I don't think so anyway, and personally dislike this second var
> INITRAMFS_TASK, which would need to be put in every kernel recipe
> asking for old-compat build.
>
> Alternatively one could write in the recipe do_configure[depends] +=
> "my-image:do_rootfs" but imho is better to handle that in
> kernel.bbclass and just set INITRAMFS_IMAGE in the recipe.
>

I'm back at this again today, yesterday was a complete write off for
me. Sorry about that. But I'm here to drive this to resolution now.

>
> Patch follows (prolly mangled): will be resent once agreed
>
>  From 8d399441b32ae9d64c6045ca99b3a80f67590f8b Mon Sep 17 00:00:00 2001
> From: Andrea Adami <andrea.adami@gmail.com>
> Date: Mon, 16 Sep 2013 20:10:14 +0200
> Subject: [PATCH] kernel.bbclass: copy the initramfs cpio in
> kernel_do_configure()
>
> The straight build of a kernel with embedded image fails
> on do_compile after
>
> commmit 609d5a9ab9e58bb1c2bcc2145399fbc8b701b85a
> kernel.bbclass, image.bbclass: Implement kernel INITRAMFS dependency and
> bundling
>
> To keep the old behavior kernel recipe must declare both
> INITRAMFS_IMAGE and the respective INITRAMFS_TASK.

This definitely restores things in the short term, but I've got a
few things I tried yeterday to check on, and see if the builds
worked at all.

That being said, even the new changes I was working on have a
larger footprint than this, so at this point, I don't object to this.
As everyone recalls in the original threads, I was adamant that we
not break any existing workflows when trying to add this bundling
code.

I'll follow up shortly with a better response.

Cheers,

Bruce

>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>   meta/classes/kernel.bbclass | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 8cf66ce..a534579 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -301,6 +301,14 @@ kernel_do_configure() {
>           cp "${WORKDIR}/defconfig" "${B}/.config"
>       fi
>       yes '' | oe_runmake oldconfig
> +
> +    if [ ! -z "${INITRAMFS_IMAGE}" -a ! -z "${INITRAMFS_TASK}" ]; then
> +        for img in cpio.gz cpio.lzo cpio.lzma cpio.xz; do
> +        if [ -e
> "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img" ]; then
> +            cp
> "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img"
> initramfs.$img
> +        fi
> +        done
> +    fi
>   }
>
>   do_savedefconfig() {
>


