Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 874B1750FC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Sep 2018 01:09:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8U19UY7011183
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 29 Sep 2018 18:09:31 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Sat, 29 Sep 2018 18:09:30 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1538199671.git.kai.kang@windriver.com>
	<7cf91a3e20704f362f975a75775fd864bdb2731c.1538199671.git.kai.kang@windriver.com>
	<b39f86162f18cbaf06d9d2757419255aac9cbec2.camel@linuxfoundation.org>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <3a9f6906-3d80-2b0a-2991-350765356f9a@windriver.com>
Date: Sun, 30 Sep 2018 09:07:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <b39f86162f18cbaf06d9d2757419255aac9cbec2.camel@linuxfoundation.org>
Subject: Re: [PATCH 08/10] os-release: fix install file conflict for multilib
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
X-List-Received-Date: Sun, 30 Sep 2018 01:09:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年09月29日 20:37, Richard Purdie wrote:
> On Sat, 2018-09-29 at 13:43 +0800, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> It fails to create image when install os-release and lib32-os-release
>> both:
>>
>>> file /etc/os-release conflicts between attempted installs of
>>> os-release-1.0-r0.core2_64 and lib32-os-release-1.0-r0.x86
>> The /etc/os-release is a symlink link to ${libdir}/os-release.
>> Actually
>> the content of files are identical and make /etc/os-release to be
>> hard
>> link could fix the issue. But according to os-release (5), symlink
>> link
>> is necessary for initrd environment such as dracut.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/recipes-core/os-release/os-release.bb | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/os-release/os-release.bb
>> b/meta/recipes-core/os-release/os-release.bb
>> index bf4f815a10..4d5487c06d 100644
>> --- a/meta/recipes-core/os-release/os-release.bb
>> +++ b/meta/recipes-core/os-release/os-release.bb
>> @@ -1,10 +1,12 @@
>> -inherit allarch
>> -
>>   SUMMARY = "Operating system identification"
>>   DESCRIPTION = "The /usr/lib/os-release file contains operating
>> system identification data."
>>   LICENSE = "MIT"
>>   INHIBIT_DEFAULT_DEPS = "1"
>>   
>> +inherit allarch multilib_script
>> +
>> +MULTILIB_SCRIPTS = "${PN}:${sysconfdir}/os-release"
> This is exactly the kind of thing I did not want to see
> MUTLILIB_SCRIPTS used for. Its now being proposed everywhere you have
> an issue with conflicting files without consideration about what
> actually makes sense.
>
> What might make more sense here is only to build os-release for the
> main namespace and not any of the multilibs. It could RPROVIDE if
> necessary.

Robert's patch about "multilib: avoid expanding grub and grub-efi to 
multilib' has been merged to master-next,
I'll do it base on his patch.

Regards,
Kai

>
> Cheers,
>
> Richard
>
>

-- 
Regards,
Neil | Kai Kang


