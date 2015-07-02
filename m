Return-Path: <Jian.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 17528607BB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jul 2015 06:34:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t626YRGD019634
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 1 Jul 2015 23:34:27 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 1 Jul 2015 23:34:26 -0700
Message-ID: <5594DAB1.8030406@windriver.com>
Date: Thu, 2 Jul 2015 14:31:13 +0800
From: Liu Jian <jian.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1435731416-31190-1-git-send-email-jian.liu@windriver.com>
	<CADkTA4NwLTbU3O=NVc2cU13OctN_k0RD_cb8t9vtMrY0V4pS6Q@mail.gmail.com>
In-Reply-To: <CADkTA4NwLTbU3O=NVc2cU13OctN_k0RD_cb8t9vtMrY0V4pS6Q@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-devsrc: missing tools for building modules
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
X-List-Received-Date: Thu, 02 Jul 2015 06:34:32 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Bruce,

I test it with arm. The arch of compiled tools is still x86.
Thanks very much for your notification.

Regards!
Jian


于 2015年07月01日 22:48, Bruce Ashfield 写道:
> On Wed, Jul 1, 2015 at 2:16 AM, Jian Liu <jian.liu@windriver.com> wrote:
>> Some tools under scripts are missed and this can cause error
>> during building modules on the target
>> Build these tools by "make script".
> We have a bugzilla for this, but the change was pending some other
> re-organizations
> of the kernel source packaging.
>
> The problem with packing this is that we used to get QA errors since
> the tools don't
> match the target arch.
>
> Can you confirm that you've built, packaged and installed this on a
> non-x86 architecture ?
>
> Bruce
>
>> Also handle the .debug directories.
>>
>> Signed-off-by: Jian Liu <jian.liu@windriver.com>
>> ---
>>   meta/recipes-kernel/linux/kernel-devsrc.bb | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
>> index dd65788..ff03d4e 100644
>> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
>> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
>> @@ -57,6 +57,9 @@ do_install() {
>>           # architecture (since scripts and helpers are native format).
>>           KBUILD_OUTPUT="$kerneldir"
>>           oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean _mrproper_scripts
>> +        # Tools under scripts/ is necessary.
>> +        cross_tool_prefix=${@d.getVar('TARGET_RAW_PREFIX', True) or ""}
>> +        make -C $kerneldir CROSS_COMPILE=$cross_tool_prefix scripts
>>
>>           # As of Linux kernel version 3.0.1, the clean target removes
>>           # arch/powerpc/lib/crtsavres.o which is present in
>> @@ -71,6 +74,7 @@ do_install() {
>>   # Ensure we don't race against "make scripts" during cpio
>>   do_install[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
>>
>> -PACKAGES = "kernel-devsrc"
>> +PACKAGES = "kernel-devsrc-dbg kernel-devsrc"
>> +FILES_${PN}-dbg = "${KERNEL_SRC_PATH}/scripts/.debug ${KERNEL_SRC_PATH}/scripts/*/.debug"
>>   FILES_${PN} = "${KERNEL_SRC_PATH}"
>>   RDEPENDS_${PN} = "bc"
>> --
>> 1.8.5.2.233.g932f7e4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

-- 
Jian Liu
Email: jian.liu@windriver.com
Office Phone: 86-10-84778539


