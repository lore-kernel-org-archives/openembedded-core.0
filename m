Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E03967885C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 17:25:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vB4HP0tN013279
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 4 Dec 2017 09:25:00 -0800 (PST)
Received: from server.local (128.224.21.208) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 4 Dec 2017 09:25:00 -0800
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1512401707.git.bruce.ashfield@windriver.com>
	<fc66fbd898d637782560e123ec6a87a62dde89fc.1512401707.git.bruce.ashfield@windriver.com>
	<CAMKF1soUD8m1vOyzVwiygp3ib4jCyy7dfdqxde2Y-LG_CXqOTA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <ad367df7-795c-20c9-eef3-436f12038f97@windriver.com>
Date: Mon, 4 Dec 2017 12:24:59 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soUD8m1vOyzVwiygp3ib4jCyy7dfdqxde2Y-LG_CXqOTA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Saul Wold <saul.wold@intel.com>
Subject: Re: [PATCH 8/8] linux-yocto-dev: update to v4.15+
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
X-List-Received-Date: Mon, 04 Dec 2017 17:25:02 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2017-12-04 11:38 AM, Khem Raj wrote:
> On Mon, Dec 4, 2017 at 7:39 AM, Bruce Ashfield
> <bruce.ashfield@windriver.com> wrote:
>> Outside of the normal patch refreshes and boot issues, there are new
>> build time tools within the kernel that required the following
>> dependencies:
>>
>> For ORC_UNWINDER support in x86-64:
>>
>>   DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native elfutils', '', d)}"
> 
> do we need both target and host elfutils

Yup. There were references to both. Some had to run for hostcc
and others in the target arch.

Bruce

> 
>>
>> And for certificate processing during the build, we need ssl headers
>> and hexdump:
>>
>>    DEPENDS += "openssl-native util-linux-native"
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>   meta/recipes-kernel/linux/linux-yocto-dev.bb | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
>> index 6876ab707153..69787adb2dec 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
>> @@ -28,10 +28,13 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
>>   SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
>>   SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
>>
>> -LINUX_VERSION ?= "4.14-rc+"
>> +LINUX_VERSION ?= "4.15-rc+"
>>   LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
>>   PV = "${LINUX_VERSION}+git${SRCPV}"
>>
>> +DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native elfutils', '', d)}"
>> +DEPENDS += "openssl-native util-linux-native"
>> +
>>   COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64)"
>>
>>   KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
>> --
>> 2.5.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


