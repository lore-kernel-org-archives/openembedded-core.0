Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 292A36B25A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 13:06:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7DD6Chc011037
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Aug 2013 06:06:12 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 13 Aug 2013 06:06:12 -0700
Message-ID: <520A2F3E.8040602@windriver.com>
Date: Tue, 13 Aug 2013 09:06:06 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1376321829-30658-1-git-send-email-otavio@ossystems.com.br>
	<5209AAB7.9060403@windriver.com>
	<CAP9ODKr5b3Wg4oJHjBNZNDipMj+Ojt+VSFOSEQb3fyPinAuU5Q@mail.gmail.com>
In-Reply-To: <CAP9ODKr5b3Wg4oJHjBNZNDipMj+Ojt+VSFOSEQb3fyPinAuU5Q@mail.gmail.com>
Cc: Evan Kotara <evan.kotara@freescale.com>,
	Lauren Post <lauren.post@freescale.com>,
	Daiane Angolini <daiane.angolini@freescale.com>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-dtb: Use kernel build system to generate the dtb files
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
X-List-Received-Date: Tue, 13 Aug 2013 13:06:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-08-13 08:46 AM, Otavio Salvador wrote:
> On Tue, Aug 13, 2013 at 12:40 AM, Bruce Ashfield
> <bruce.ashfield@windriver.com> wrote:
>> On 13-08-12 11:37 AM, Otavio Salvador wrote:
>>>
>>> As the Linux kernel, unconditionally, builds the dtc application and
>>> it is the compatible version with the DeviceTree files shipped within
>>> the kernel it is better to use it and the kernel build system to
>>> generate the dtb files.
>>
>>
>>  From my point of view, I agree with this. I've always pushed for using
>> all of the artifacts from the kernel built (uImage, dtb, etc) and this
>> is consistent with that approach.
>
> Good.
>
>>> Some DeviceTree files rely on CPP and kernel headers to be able to
>>> generate the dtb binary contents and it is harder to replicate it
>>> outside of Linux kernel build system so we /use/ it.
>>>
>>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>>> ---
>>> NOTE: This depends on 'linux-dtb.inc: Replace /boot/ with
>>> /${KERNEL_IMAGEDEST}/' patch
>>>
>>>    meta/recipes-kernel/linux/linux-dtb.inc | 59
>>> +++++++++++++++------------------
>>>    1 file changed, 27 insertions(+), 32 deletions(-)
>>>
>>> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc
>>> b/meta/recipes-kernel/linux/linux-dtb.inc
>>> index 41dd599..a65f8bd 100644
>>> --- a/meta/recipes-kernel/linux/linux-dtb.inc
>>> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
>>> @@ -1,44 +1,39 @@
>>>    # Support for device tree generation
>>>    FILES_kernel-devicetree = "/${KERNEL_IMAGEDEST}/devicetree*"
>>> -KERNEL_DEVICETREE_FLAGS ?= "-R 8 -p 0x3000"
>>>
>>>    python __anonymous () {
>>> -    devicetree = d.getVar("KERNEL_DEVICETREE", True) or ''
>>> -    if devicetree:
>>> -        depends = d.getVar("DEPENDS", True)
>>> -        d.setVar("DEPENDS", "%s dtc-native" % depends)
>>> -        packages = d.getVar("PACKAGES", True)
>>> -        d.setVar("PACKAGES", "%s kernel-devicetree" % packages)
>>> +    d.appendVar("PACKAGES", " kernel-devicetree")
>>
>>
>> What if someone, somewhere needs a custom dtc. Can we still trigger
>> a dependency on dtc-native is a different flag is set ?
>
> The Kernel does not provide a way to 'override' it; it always use it
> from scripts/dtc and it is the compatible version with the DeviceTree
> files shipped within the kernel, so it is better to use it and the
> kernel build system to generate the dtb files.

What I meant was not to override the kernel's dtc, but to simply fall
back to the old dtc-native reaching into the tree and compiling the
dts. That way we have flexibility as a fall back.

>
>>>    }
>>>
>>>    do_install_append() {
>>> +       bbwarn "ARRG"
>>>          if test -n "${KERNEL_DEVICETREE}"; then
>>> -               for DTS_FILE in ${KERNEL_DEVICETREE}; do
>>> -                       if [ ! -f ${DTS_FILE} ]; then
>>> -                               echo "Warning: ${DTS_FILE} is not
>>> available!"
>>> -                               continue
>>> +               for DTB in ${KERNEL_DEVICETREE}; do
>>> +                       if echo ${DTB} | grep -q '/dts/'; then
>>> +                               bbwarn "${DTB} points to the full path dts
>>> file while it should have the target for use."
>>
>>
>> This isn't reading right to me. What are you trying to say ? That
>> KERNEL_DEVICE_TREE should be the name of the dts and not the path
>> to that dts ? I'd say 'name' versus target.
>
> You should name it 'imx6q-sabresd.dtb' for example.

right, that's what I always do myself. So I'm really just suggesting that
the bbwarn message be a bit more clear. i.e.

   bbwarn "${DTB} contains the full path to the the dts file, but only 
the dtb name should be used."

>
>> What about testing for it's existence ? The old code used to do that.
>
> It will fail if you ask it to build an invalid dtb file.
>
>>> +                               DTB=`basename ${DTB} | sed
>>> 's,\.dts$,.dtb,g'`
>>
>>
>>  From the description of the patch .. this part is unexpected.
>> You are changing more than what is used to compile the dtb,
>> but the processing of the options.
>
> It is not; I need to call it with the target. This is to support
> converting from 'current' use to 'new' use and keep backward
> compatibility.

Right, so you are switching to dtb, which the kernel expects, not
dts. The commit message should make this clear, right now it
doesn't. You need to understand what the kernel is looking for to
know why the change is being made.

>
>>>                          fi
>>> -                       DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "."
>>> '{print $1}'`
>>> -                       DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed
>>> "s/${MACHINE}/${DTS_BASE_NAME}/g"`
>>> -                       DTB_SYMLINK_NAME=`echo
>>> ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
>>> -                       dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o
>>> ${DTS_BASE_NAME} ${DTS_FILE}
>>> -                       install -m 0644 ${DTS_BASE_NAME}
>>> ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.dtb
>>> +                       DTB_BASE_NAME=`basename ${DTB} .dtb`
>>> +                       DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed
>>> "s/${MACHINE}/${DTB_BASE_NAME}/g"`
>>> +                       DTB_SYMLINK_NAME=`echo
>>> ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
>>> +                       oe_runmake ${DTB}
>>
>>
>> The change log should explain this as well. You are switching the
>> naming to DTB from the old DTS .. because ? The kernel build
>> requires it ? something else ? You tell me :)
>
> This is to support converting from 'current' use to 'new' use and keep
> backward compatibility.
>
>>> +                       install -m 0644 ${B}/arch/${ARCH}/boot/${DTB}
>>> ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.dtb
>>>                  done
>>>          fi
>>>    }
>>>
>>>    do_deploy_append() {
>>>          if test -n "${KERNEL_DEVICETREE}"; then
>>> -               for DTS_FILE in ${KERNEL_DEVICETREE}; do
>>> -                       if [ ! -f ${DTS_FILE} ]; then
>>> -                               echo "Warning: ${DTS_FILE} is not
>>> available!"
>>> -                               continue
>>> +               for DTB in ${KERNEL_DEVICETREE}; do
>>> +                       if echo ${DTB} | grep -q '/dts/'; then
>>> +                               bbwarn "${DTB} points to the full path dts
>>> file while it should have the target for use. "
>>> +                               DTB=`basename ${DTB} | sed
>>> 's,\.dts$,.dtb,g'`
>>
>>
>> Given that the old and new code repeats this block .. is there an
>> opportunity to factor it out into a function ?
>
> In a new patch?

Could be, or just as part of this one. Either way works.

Cheers,

Bruce

>
>>>                          fi
>>> -                       DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "."
>>> '{print $1}'`
>>> -                       DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed
>>> "s/${MACHINE}/${DTS_BASE_NAME}/g"`
>>> -                       DTB_SYMLINK_NAME=`echo
>>> ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
>>> +                       DTB_BASE_NAME=`basename ${DTB} .dtb`
>>> +                       DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed
>>> "s/${MACHINE}/${DTB_BASE_NAME}/g"`
>>> +                       DTB_SYMLINK_NAME=`echo
>>> ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
>>>                          install -d ${DEPLOYDIR}
>>> -                       install -m 0644 ${B}/${DTS_BASE_NAME}
>>> ${DEPLOYDIR}/${DTB_NAME}.dtb
>>> +                       install -m 0644 ${B}/arch/${ARCH}/boot/${DTB}
>>> ${DEPLOYDIR}/${DTB_NAME}.dtb
>>
>>
>> Same question, we switch to DTB from DTS for technical or clarity/cosmetic
>> reasons ?
>
> This is to support converting from 'current' use to 'new' use and keep
> backward compatibility.
>
>>>                          cd ${DEPLOYDIR}
>>>                          ln -sf ${DTB_NAME}.dtb ${DTB_SYMLINK_NAME}.dtb
>>>                          cd -
>>> @@ -48,20 +43,20 @@ do_deploy_append() {
>>>
>>>    pkg_postinst_kernel-devicetree () {
>>>          cd /${KERNEL_IMAGEDEST}
>>> -       for DTS_FILE in ${KERNEL_DEVICETREE}
>>> +       for DTB_FILE in ${KERNEL_DEVICETREE}
>>>          do
>>> -               DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print
>>> $1}'`
>>> -               DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed
>>> "s/${MACHINE}/${DTS_BASE_NAME}/g"`
>>> -               update-alternatives --install
>>> /${KERNEL_IMAGEDEST}/${DTS_BASE_NAME}.dtb ${DTS_BASE_NAME}.dtb
>>> devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
>>> +               DTB_BASE_NAME=`basename ${DTB_FILE} | awk -F "." '{print
>>> $1}'`
>>> +               DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed
>>> "s/${MACHINE}/${DTB_BASE_NAME}/g"`
>>> +               update-alternatives --install
>>> /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.dtb ${DTB_BASE_NAME}.dtb
>>> devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
>>
>>
>> The DTS -> DTB name change is making the patch look bigger than it is,
>> and really should be separate from the switch to the in tree dtc.
>
> This is to support converting from 'current' use to 'new' use and keep
> backward compatibility. We need to use the .dtb file when calling
> make.
>


