Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B258978F63
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 09:43:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7E9hPPr021770
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 14 Aug 2018 02:43:26 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Tue, 14 Aug 2018 02:43:25 -0700
To: <richard.purdie@linuxfoundation.org>
References: <cover.1533888808.git.kai.kang@windriver.com>
	<8aa373833d3e5f54689b8863f864c39dc90e5cab.1533888808.git.kai.kang@windriver.com>
	<3dc3372508f6543edd5e6805ca004bf4bcb80c1f.camel@linuxfoundation.org>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <298e574b-696f-1fac-8283-107ec805509c@windriver.com>
Date: Tue, 14 Aug 2018 17:40:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <3dc3372508f6543edd5e6805ca004bf4bcb80c1f.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] allarch: disable allarch when multilib is used
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
X-List-Received-Date: Tue, 14 Aug 2018 09:43:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年08月12日 00:10, richard.purdie@linuxfoundation.org wrote:
> On Fri, 2018-08-10 at 16:14 +0800, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Some allarch packages rdepends non-allarch packages. When multilib is
>> used, it doesn't expand the dependency chain correctly, e.g.
>>
>> core-image-sato -> ca-certificates(allarch) -> openssl
>>
>> we expect dependency chain for lib32-core-image-sato:
>>
>> lib32-core-image-sato -> ca-certificates(allarch) -> lib32-openssl
>>
>> it should install lib32-openssl for ca-certificates but openssl is
>> still wrongly imported.
>>
>> Disable allarch when multilib is used.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/classes/allarch.bbclass         | 4 ++++
>>   meta/classes/icecc.bbclass           | 2 +-
>>   meta/classes/multilib.bbclass        | 3 ++-
>>   meta/classes/multilib_global.bbclass | 4 +---
>>   meta/classes/package.bbclass         | 9 ++++++---
>>   meta/classes/staging.bbclass         | 2 +-
>>   6 files changed, 15 insertions(+), 9 deletions(-)
> With this applied, "bitbake nativesdk-dbus" fails to build since
> it can't find the extra autoconf macros from an allarch recipe in
> DEPENDS.
>
> e.g. https://autobuilder.yocto.io/builders/nightly-arm/builds/1262/step
> s/Building%20Toolchain%20Images/logs/stdio

The autoconf-archive-native is not installed to recipe sysroot native. 
Some debug info shows the task do_populate_sysroot
of autoconf-archive-native is not executed. And so do some other 
packages(tasks).

DEBUG: Stampfile 
/buildarea/kkang/yocto/noarch-verify-build-Aug13/tmp/stamps/x86_64-linux/autoconf-archive-native/2018.03.13-r0.do_populate_sysroot_setscene.41bdb37fee4fb443715e1c84a5de281f 
not available
DEBUG: Normal stamp current for task 
virtual:native:/buildarea/kkang/yocto/poky/meta/recipes-devtools/autoconf-archive/autoconf-archive_2018.03.13.bb:do_populate_sysroot
DEBUG: Found task 
virtual:native:/buildarea/kkang/yocto/poky/meta/recipes-devtools/autoconf-archive/autoconf-archive_2018.03.13.bb:do_populate_sysroot 
which could be accelerated

I have been working on it but not get the root cause yet.

Sorry for the inconvenience.

Regards,
Kai

>
>
> Cheers,
>
> Richard
>

-- 
Regards,
Neil | Kai Kang


