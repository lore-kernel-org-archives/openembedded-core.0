Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9B50378A2F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 08:34:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w668YLTX004871
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 6 Jul 2018 01:34:21 -0700
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Fri, 6 Jul 2018 01:34:20 -0700
To: Khem Raj <raj.khem@gmail.com>, "Burton, Ross" <ross.burton@intel.com>
References: <cover.1527214769.git.Qi.Chen@windriver.com>
	<31d93c4a23eec59b835a52dc7002814e1b9fbe22.1527214769.git.Qi.Chen@windriver.com>
	<CAJTo0LbuaPOcp0WbB0_T9O+kivU9Wye6Zzb6w8xD-kQXXOpJzg@mail.gmail.com>
	<CAMKF1sqEzOBqP+ReVAA5zHn1qosQrrpti_2Aigv4OzzU6tF3Kg@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <c5249320-c4a0-b443-4ef5-be8bab9021f7@windriver.com>
Date: Fri, 6 Jul 2018 16:37:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqEzOBqP+ReVAA5zHn1qosQrrpti_2Aigv4OzzU6tF3Kg@mail.gmail.com>
X-Originating-IP: [128.224.162.218]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] buildtools-tarball: add nativesdk-libnss-nis
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
X-List-Received-Date: Fri, 06 Jul 2018 08:34:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ross,

Please consider merging this patch.

With Khem's recent fix "libnss-nis: Limit parse skip only for target 
recipe on musl", I think this patch could be merged safely.
I've tested it locally with glibc and musl.

Best Regards,
Chen Qi

On 06/07/2018 01:17 AM, Khem Raj wrote:
> On Wed, Jun 6, 2018 at 9:48 AM, Burton, Ross <ross.burton@intel.com> wrote:
>> Try building a musl buildtools and it breaks:
>>
>> ERROR: Nothing RPROVIDES 'nativesdk-libnss-nis' (but
>> /home/ross/Yocto/poky/meta/recipes-core/meta/buildtools-tarball.bb
>> RDEPENDS on or otherwise requires it)
>> nativesdk-libnss-nis was skipped: incompatible with musl C library
>>
> I think the compatibility check is too greedy in the recipe, this should
> only be applicable to target class recipe.
>
>> Ross
>>
>> On 25 May 2018 at 03:54, Chen Qi <Qi.Chen@windriver.com> wrote:
>>> Recent glibc change removed libnss-nis module from glibc and a new
>>> recipe libnss-nis.bb was added.
>>>
>>> After this change, we need to make sure nativesdk-libnss-nis is also
>>> included in buildtools-tarball, otherwise, we may encounter the following
>>> error when using 'tar' command from buildtools-tarball.
>>>
>>>    tar: relocation error: /lib/x86_64-linux-gnu/libnss_nis.so.2: \
>>>         symbol _nsl_default_nss version GLIBC_PRIVATE not defined \
>>>         in file libnsl.so.1 with link time reference
>>>
>>> This error occured on my ubuntu16.04 host with 'nis' configured in
>>> /etc/nssswitch.conf.
>>>
>>> So add nativesdk-libnss-nis to buildtools-tarball to fix this problem.
>>>
>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> ---
>>>   meta/recipes-core/meta/buildtools-tarball.bb | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
>>> index d98a9c9..377733f 100644
>>> --- a/meta/recipes-core/meta/buildtools-tarball.bb
>>> +++ b/meta/recipes-core/meta/buildtools-tarball.bb
>>> @@ -21,6 +21,7 @@ TOOLCHAIN_HOST_TASK ?= "\
>>>       nativesdk-wget \
>>>       nativesdk-ca-certificates \
>>>       nativesdk-texinfo \
>>> +    nativesdk-libnss-nis \
>>>       "
>>>
>>>   MULTIMACH_TARGET_SYS = "${SDK_ARCH}-nativesdk${SDK_VENDOR}-${SDK_OS}"
>>> --
>>> 1.9.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core



