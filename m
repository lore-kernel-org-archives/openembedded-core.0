Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DD51577CD1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 02:28:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v3B2SQf3000952
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 10 Apr 2017 19:28:27 -0700 (PDT)
Received: from [128.224.162.201] (128.224.162.201) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Mon, 10 Apr 2017 19:28:25 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Robert Yang
	<liezhi.yang@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1491557671.git.liezhi.yang@windriver.com>
	<af3b44b2cc2be0771d70599286fa55d6ec3629bf.1491557671.git.liezhi.yang@windriver.com>
	<1491843234.783.2.camel@linuxfoundation.org>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <05b9de85-5165-604f-041e-23df352343c3@windriver.com>
Date: Tue, 11 Apr 2017 10:29:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1491843234.783.2.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.201]
Cc: "Bartosh, Eduard" <eduard.bartosh@intel.com>
Subject: Re: [PATCH 7/8] qemuboot.bbclass: add two vars for use by runqemu
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
X-List-Received-Date: Tue, 11 Apr 2017 02:28:29 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2017 12:53 AM, Richard Purdie wrote:
> On Fri, 2017-04-07 at 02:47 -0700, Robert Yang wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Add STAGING_DIR_TUNCTL_NATIVE and STAGING_DIR_QEMU_BINDIR_NATIVE so
>> that
>> runqemu could find 'tunctl' and 'qemu-xxx' binaries to run correctly.
>>
>> [YOCTO #11266]
>> [YOCTO #11193]
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> Hi Robert/Qi,
>
> Unfortunately this can't work as we can't use binaries directly from
> the sysroot-components directory if they link to any libraries. tunctl
> is ok but qemu links against libfdt.so.1 which isn't there. If the
> system has its own copy, it may happen to work by luck but if it
> doesn't, or the system version is incompatible we'd see failures.
>
> So I'm afraid we need to find a different solution.
>
> Cheers,
>
> Richard
>

Thanks for pointing that out.
I'm thinking about still just preserving recipe-sysroot-native of image 
as the solution, because this directory seems to be the only one which 
have both 'qemu-xxx' from qemu-native and 'tunctl' from 
qemu-native-helper. What do you think?

P.S. I noticed that Ed also sent out a patch using this solution. The 
patch title is "image.bbclass: prevent rm_work to remove native RSS".

Best Regards,
Chen Qi

>>   meta/classes/qemuboot.bbclass | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/qemuboot.bbclass
>> b/meta/classes/qemuboot.bbclass
>> index 2870388dfb..ac52ef295e 100644
>> --- a/meta/classes/qemuboot.bbclass
>> +++ b/meta/classes/qemuboot.bbclass
>> @@ -70,12 +70,15 @@ QB_DRIVE_TYPE ?= "/dev/sd"
>>   # Create qemuboot.conf
>>   addtask do_write_qemuboot_conf after do_rootfs before do_image
>>   IMGDEPLOYDIR ?= "${WORKDIR}/deploy-${PN}-image-complete"
>> +STAGING_DIR_TUNCTL_NATIVE = "${STAGING_DIR}-
>> components/${BUILD_ARCH}/qemu-helper-native"
>> +STAGING_DIR_QEMU_BINDIR_NATIVE = "${STAGING_DIR}-
>> components/${BUILD_ARCH}/qemu-native/usr/bin"
>>   
>>   def qemuboot_vars(d):
>>       build_vars = ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
>>                   'KERNEL_IMAGETYPE', 'IMAGE_NAME', 'IMAGE_LINK_NAME',
>>                   'STAGING_DIR_NATIVE', 'STAGING_BINDIR_NATIVE',
>> -                'STAGING_DIR_HOST']
>> +                'STAGING_DIR_HOST', 'STAGING_DIR_TUNCTL_NATIVE',
>> +                'STAGING_DIR_QEMU_BINDIR_NATIVE']
>>       return build_vars + [k for k in d.keys() if k.startswith('QB_')]
>>   
>>   do_write_qemuboot_conf[vardeps] += "${@' '.join(qemuboot_vars(d))}"
>> -- 
>> 2.11.0.rc2.dirty
>>


