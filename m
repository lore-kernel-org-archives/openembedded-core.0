Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 802097828D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 18:57:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7NIuEFh020773
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 23 Aug 2017 11:56:15 -0700 (PDT)
Received: from [128.224.56.93] (128.224.56.93) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 23 Aug 2017 11:56:14 -0700
To: Denys Dmytriyenko <denis@denix.org>
References: <cover.1503283308.git.bruce.ashfield@windriver.com>
	<ab92e7d90c416d6e5cdb17cdba269e09ec967607.1503283308.git.bruce.ashfield@windriver.com>
	<20170823183156.GB26405@denix.org>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <c3b032b7-607e-0730-2159-2591d33b2523@windriver.com>
Date: Wed, 23 Aug 2017 14:56:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170823183156.GB26405@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 8/9] kernel-yocto: ensure that only valid BSPs are built
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
X-List-Received-Date: Wed, 23 Aug 2017 18:57:08 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/23/2017 02:31 PM, Denys Dmytriyenko wrote:
> On Sun, Aug 20, 2017 at 10:58:21PM -0400, Bruce Ashfield wrote:
>> There was a bug in the search routines responsible for locating
>> BSP definitions which returned a valid match if only the ktype
>> matched.
>>
>> This meant that someone looking for "qemux86foo" (which is an
>> invalid definition) would potentially end up building "qemuarm"
>> and be none the wiser (until it didn't boot).
>>
>> With this fix to the tools search routine, and improved return
>> code testing, we will now stop the build and report and error to
>> the user.
>>
>> [YOCTO: #11878]
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>   meta/classes/kernel-yocto.bbclass                       | 3 +++
>>   meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
>>   2 files changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
>> index 1ca0756c4959..3c6df92131bc 100644
>> --- a/meta/classes/kernel-yocto.bbclass
>> +++ b/meta/classes/kernel-yocto.bbclass
>> @@ -143,6 +143,9 @@ do_kernel_metadata() {
>>   
>>   	# expand kernel features into their full path equivalents
>>   	bsp_definition=$(spp ${includes} --find -DKMACHINE=${KMACHINE} -DKTYPE=${LINUX_KERNEL_TYPE})
>> +	if [ $? -ne 0 ] || [ -z "${bsp_definition}" ]; then
>> +		bbfatal_log "Could not locate BSP definiton for ${KMACHINE}/${LINUX_KERNEL_TYPE}."
>> +	fi
>>   	meta_dir=$(kgit --meta)
>>   
>>   	# run1: pull all the configuration fragments, no matter where they come from
>> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>> index 2217a31076a2..4a78b897d34f 100644
>> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=a6c2fa8aef1b
>>   
>>   DEPENDS = "git-native"
>>   
>> -SRCREV = "9cd2b626d652bec10c6bc75275b35bfee74d447c"
>> +SRCREV = "0571411cc033c11df7827508dd786876ce2f8c83"
> 
> My builds last night of poky+meta-ti all failed with:
> 
> DEBUG: Running ... git -c core.fsyncobjectfiles=0 clone -s -n /OE/poky-master/downloads/git2/git.yoctoproject.org.yocto-kernel-tools.git/ /OE/poky-master/build/tmp/work/x86_64-linux/kern-tools-native/0.2+gitAUTOINC+0571411cc0-r12/git/
> DEBUG: Running ... git -c core.fsyncobjectfiles=0 remote set-url origin git://git.yoctoproject.org/yocto-kernel-tools.git
> DEBUG: Running ... git -c core.fsyncobjectfiles=0 checkout -B master 0571411cc033c11df7827508dd786876ce2f8c83
> ERROR: Fetcher failure: Fetch command ... git -c core.fsyncobjectfiles=0 checkout -B master 0571411cc033c11df7827508dd786876ce2f8c83 failed with exit code 128, output:
> fatal: reference is not a tree: 0571411cc033c11df7827508dd786876ce2f8c83

I haven't seen this one, but I did just confirm manually that that
SRCREV is in the upstream repo.

Did some sort of mirroring get in the way ?

Bruce

> 
> 
>>   PR = "r12"
>>   PV = "0.2+git${SRCPV}"
>>   
>> -- 
>> 2.5.0
>>
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


