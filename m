Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0ABF06C0C5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2018 02:08:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAU27378002156
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 Nov 2018 18:07:13 -0800
Received: from [128.224.163.177] (128.224.163.177) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 29 Nov 2018 18:06:52 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1542781427.git.liezhi.yang@windriver.com>
	<bd77663c215d2ed20cb3765b95e62b9b14330896.1542781427.git.liezhi.yang@windriver.com>
	<CAP9ODKquwOEHEcQc2EOZzty_+GgO1ONKAZU_U4h-L9PRxwFWBg@mail.gmail.com>
	<2e148cdc-6ba1-e945-26f3-51ac35674a85@windriver.com>
	<CAJTo0LacrSjy+xfqVa7k5pDM2OAYHr08e7AiprvKpsps1+kmeA@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <9dedaf1d-877b-d902-bdbe-1705a8540f71@windriver.com>
Date: Fri, 30 Nov 2018 10:11:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LacrSjy+xfqVa7k5pDM2OAYHr08e7AiprvKpsps1+kmeA@mail.gmail.com>
Cc: c.andersen@kostal.com, Otavio Salvador <otavio.salvador@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] uboot-sign.bbclass: fix signature and deployment
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
X-List-Received-Date: Fri, 30 Nov 2018 02:08:47 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Ross,

On 11/29/18 9:15 PM, Burton, Ross wrote:
> This didn't get merged before other pieces did, so can you please
> rebase and resend?

Thanks, I will rebase to master-next and resend. BTW, the Christian Andersen
(the reporter) has replied that the patch works for him:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=12112

// Robert

> 
> Ross
> On Thu, 22 Nov 2018 at 01:43, Robert Yang <liezhi.yang@windriver.com> wrote:
>>
>>
>>
>> On 11/22/18 1:20 AM, Otavio Salvador wrote:
>>> Hello,
>>>
>>> On Wed, Nov 21, 2018 at 4:08 AM Robert Yang <liezhi.yang@windriver.com> wrote:
>>>>
>>>> Fixed:
>>>> MACHINE = "beaglebone-yocto"
>>>> KERNEL_CLASSES += "kernel-fitimage"
>>>> KERNEL_IMAGETYPE_beaglebone-yocto = "fitImage"
>>>> UBOOT_MACHINE_beaglebone-yocto = "am335x_boneblack_vboot_config"
>>>> UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
>>>> UBOOT_SIGN_KEYDIR = "${TOPDIR}/conf"
>>>> UBOOT_SIGN_KEYNAME = "dev"
>>>> UBOOT_SIGN_ENABLE = "1"
>>>> IMAGE_INSTALL_remove = "kernel-image-zimage"
>>>>
>>>> $ cd conf
>>>> $ openssl genrsa -F4 -out dev.key 2048
>>>> $ openssl req -batch -new -x509 -key dev.key -out dev.crt
>>>> $ cd ../
>>>> $ bitbake u-boot linux-yocto
>>>> $ grep signature tmp/deploy/images/beaglebone-yocto/*.dtb
>>>> Binary file tmp/deploy/images/beaglebone-yocto/u-boot-beaglebone-yocto-2018.07-r0.dtb matches
>>>> Binary file tmp/deploy/images/beaglebone-yocto/u-boot-beaglebone-yocto.dtb matches
>>>> Binary file tmp/deploy/images/beaglebone-yocto/u-boot.dtb matches
>>>>
>>>> And there would be no signature info when rebuild from sstate:
>>>> $ bitbake u-boot linux-yocto -cclean
>>>> $ bitbake u-boot linux-yocto
>>>> $ grep signature tmp/deploy/images/beaglebone-yocto/*.dtb
>>>> No result
>>>>
>>>> This s because kernel directly edit ${DEPLOY_DIR_IMAGE}/u-boot.dtb, (Note, it
>>>> is global ${DEPLOY_DIR_IMAGE}, not recipe's DEPLOYDIR), so that the modified
>>>> info is not in sstate, and would be lost when rebuild from sstate.
>>>>
>>>> There are other problems in previouse code:
>>>> - The u-boot.dtb is provided by u-boot, but edited by kernel during signing, so
>>>>     it should be deployed by kernel rather than u-boot.
>>>>
>>>> - The u-boot.do_concat_dtb directly install files to global ${DEPLOY_DIR_IMAGE},
>>>>     this is incorrect, the ${DEPLOY_DIR_IMAGE} should be installed by do_deploy.
>>>>
>>>> - It seems that it assumes do_deploy depends on do_install according the comments,
>>>>     but they have no relationships:
>>>>     # do_concat_dtb is scheduled _before_ do_install as it overwrite the
>>>>     # u-boot.bin in both DEPLOYDIR and DEPLOY_IMAGE_DIR.
>>>>
>>>> - The do_concat_dtb should be run after do_compile, but it doesn't have this
>>>>     dependency.
>>>>
>>>> Make u-boot install u-boot.dtb to ${datadir}, kernel copies u-boot.dtb from
>>>> ${STAGING_DATADIR} to ${B} and deploy it can fix the problem.
>>>>
>>>> [YOCTO #12112]
>>>>
>>>> Reported-by: Christian Andersen <c.andersen@kostal.com>
>>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>>
>>> The change itself looks good, I noticed that the script part is not
>>> using 4 spaces for indenting and as this is being changed, it might
>>> make sense to address this as well.
>>
>> Thanks, sounds good to me, I will make another patch for it after this is merged.
>>
>> // Robert
>>
>>>
>>> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
>>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

