Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 99AF974E1F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 08:49:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4U8mpfh004902
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 30 May 2018 01:49:06 -0700
Received: from [128.224.27.70] (128.224.27.70) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 30 May 2018 01:48:40 -0700
To: Andre McCurdy <armccurdy@gmail.com>
References: <cover.1527216285.git.liezhi.yang@windriver.com>
	<5e17001bc93d4c8ba7eaa513080076cc1b382647.1527216285.git.liezhi.yang@windriver.com>
	<CAJ86T=XjyBp=yJ1Ov6FM_FVfn+8twy92k4i+PFJhyy4W4xD75Q@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <47162233-50fe-eea4-801d-b448bb2a9b06@windriver.com>
Date: Wed, 30 May 2018 16:48:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=XjyBp=yJ1Ov6FM_FVfn+8twy92k4i+PFJhyy4W4xD75Q@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 06/24] at: add libselinux to PACKAGECONFIG
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
X-List-Received-Date: Wed, 30 May 2018 08:49:32 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit


On 05/30/2018 06:01 AM, Andre McCurdy wrote:
> On Thu, May 24, 2018 at 7:48 PM, Robert Yang <liezhi.yang@windriver.com> wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> * add libselinux to PACKAGECONFIG for at
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/recipes-extended/at/at_3.1.20.bb | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/meta/recipes-extended/at/at_3.1.20.bb b/meta/recipes-extended/at/at_3.1.20.bb
>> index 8fe3b43..b76e83d 100644
>> --- a/meta/recipes-extended/at/at_3.1.20.bb
>> +++ b/meta/recipes-extended/at/at_3.1.20.bb
>> @@ -8,6 +8,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
>>   DEPENDS = "flex flex-native bison-native \
>>              ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>>
>> +PACKAGECONFIG ?= "\
>> +    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
> 
> The "new way" to do this would be:
> 
>    ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}

Thanks, good to know that, the patch has been merged, I'm leaning to keep it
as the current status since it has no side effect.

// Robert

> 
>> +"
>> +
>> +PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux,"
>> +
>>   RDEPENDS_${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_DEPS}', '', d)} \
>>   "
>>
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

