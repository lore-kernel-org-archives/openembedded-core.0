Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E4C0F7CDC8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 09:59:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x279xeDa028606
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 7 Mar 2019 01:59:42 -0800 (PST)
Received: from [128.224.163.214] (128.224.163.214) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 7 Mar 2019 01:59:39 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <20190307065138.54589-1-zhixiong.chi@windriver.com>
	<CAJTo0LbsGET5t6AyfgfQ2L=jR01g+uM8Ec0FA5L5nxpchGd49g@mail.gmail.com>
From: Zhixiong Chi <zhixiong.chi@windriver.com>
Message-ID: <eadbbfcd-6dd6-929e-1fbc-8aee74b5961b@windriver.com>
Date: Thu, 7 Mar 2019 18:00:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbsGET5t6AyfgfQ2L=jR01g+uM8Ec0FA5L5nxpchGd49g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] core-image-minimal-initramfs: add libgcc into the initramfs image
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
X-List-Received-Date: Thu, 07 Mar 2019 09:59:43 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

It's not for dependency of the package in the initramfs image,

just for the multithread application while the customer use initramfs image.

Since we use PACKAGE_INSTALL to override the rootfs in the initramfs bb 
file,

so we couldn't use the IMAGE_INSTALL_append to add the package in the 
local.conf.

Did you think if it should be added into the image? :-)

I know the initramfs is just to bootup the system. If the customer want 
to support the

multithread app, they can use the other types of the image.

Thanks.


On 2019年03月07日 17:05, Burton, Ross wrote:
> Wouldn't it be better to add that dependency to the packages which need it?
>
> Ross
>
> On Thu, 7 Mar 2019 at 06:53, Zhixiong Chi <zhixiong.chi@windriver.com> wrote:
>> Add the libgcc package into the initramfs image to avoid multithread
>> function error in the userspace(eg: pthread_cancel).
>>
>> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
>> ---
>>   meta/recipes-core/images/core-image-minimal-initramfs.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
>> index 7df8ab1ebd..3cf2c7b01f 100644
>> --- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
>> +++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
>> @@ -11,7 +11,7 @@ INITRAMFS_SCRIPTS ?= "\
>>                         initramfs-module-install-efi \
>>                        "
>>
>> -PACKAGE_INSTALL = "${INITRAMFS_SCRIPTS} ${VIRTUAL-RUNTIME_base-utils} udev base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"
>> +PACKAGE_INSTALL = "${INITRAMFS_SCRIPTS} ${VIRTUAL-RUNTIME_base-utils} udev base-passwd libgcc ${ROOTFS_BOOTSTRAP_INSTALL}"
>>
>>   # Do not pollute the initrd image with rootfs features
>>   IMAGE_FEATURES = ""
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
---------------------
Thanks,
Zhixiong Chi
Tel: +86-10-8477-7036


