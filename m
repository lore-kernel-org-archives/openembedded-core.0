Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 752307E3AA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2019 09:24:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x699OBQ5023060
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 9 Jul 2019 02:24:11 -0700 (PDT)
Received: from [128.224.162.148] (128.224.162.148) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Tue, 9 Jul 2019 02:24:11 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1562570956.git.Qi.Chen@windriver.com>
	<0dee845494880f0c201e79d6ee0f50390f183465.1562570957.git.Qi.Chen@windriver.com>
	<bffaaf84031568a924656bf092d9d17405fbef2f.camel@linuxfoundation.org>
	<62f74fe5-abe0-9d13-50ce-7660291180ce@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <6a7b868b-348a-b747-4115-9e4089ad0232@windriver.com>
Date: Tue, 9 Jul 2019 17:36:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <62f74fe5-abe0-9d13-50ce-7660291180ce@windriver.com>
X-Originating-IP: [128.224.162.148]
Subject: Re: [PATCH 1/1] buildtools-tarball: add nativesdk-libxml2-utils
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
X-List-Received-Date: Tue, 09 Jul 2019 09:24:11 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/09/2019 09:38 AM, ChenQi wrote:
> On 07/09/2019 12:47 AM, Richard Purdie wrote:
>> On Mon, 2019-07-08 at 15:37 +0800, Chen Qi wrote:
>>> For build-sysroots.bb, the xmlcatalog would not be in its
>>> staging directory. Causing the following error for eSDK.
>>>
>>> ERROR: build-sysroots-1.0-r0 do_build_native_sysroot: Command
>>> '/PATH/TO/IMAGE/testsdkext/tmp/sysroots/x86_64/usr/bin/postinst-
>>> docbook-xml-dtd4-native-xmlcatalog' returned non-zero exit status
>>> 127.
>>> ERROR: build-sysroots-1.0-r0 do_build_native_sysroot: Function
>>> failed: do_build_native_sysroot
>>>
>>> The problem could be reproduced by the following steps.
>>> 1. Add in local.conf:
>>>     IMAGE_INSTALL_append = " btrfs-tools"
>>>     DISTRO_FEATURES_append = " api-documentation"
>>>     INHERIT += "testsdk"
>>> 2. bitbake core-image-minimal -c populate_sdk_ext
>>> 3. bitbake core-image-minimal -c testsdkext
>>>
>>> So we add nativesdk-libxml2-utils to buildtools-tarball
>>> to ensure the existence of xmlcatalog. Also add it
>>> to HOSTTOOLS_NONFATAL so it could be seen by bitbake.
>>>
>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> ---
>>>   meta/conf/bitbake.conf                       | 3 +++
>>>   meta/recipes-core/meta/buildtools-tarball.bb | 1 +
>>>   2 files changed, 4 insertions(+)
>>>
>>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>>> index 5e93f5c..2f64eae 100644
>>> --- a/meta/conf/bitbake.conf
>>> +++ b/meta/conf/bitbake.conf
>>> @@ -517,6 +517,9 @@ HOSTTOOLS_NONFATAL += "scp"
>>>   # Link to git-lfs if present
>>>   HOSTTOOLS_NONFATAL += "git-lfs"
>>>   +# build-sysroot needs xmlcatalog in order for eSDK installation
>>> +HOSTTOOLS_NONFATAL += "xmlcatalog"
>> I don't mind the buildtools-tarball change but HOSTTOOLS is starting to
>> grow to contain far too much random stuff which could impact
>> reproduciblity.
>>
>> Is there some other way we could fix this? It still feels like a
>> dependency problem which we chould fix by adding a missing dependency
>> although I appreciate its far from being that simple.
>>
>> I wonder if there is a way we could teach build-sysroots to be cleverer
>> about dependencies?
>
> I'll try to implement it and send out a new patch.
>

Hi Richard and Ross,

Unfortunately I cannot figure out a good way to implement this.
Could you please help giving me some hints?

Best Regards,
Chen Qi

> Regards,
> Chen Qi
>
>> Cheers,
>>
>> Richard
>>
>>
>


