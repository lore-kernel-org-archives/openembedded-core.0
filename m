Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8207C60684
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 09:52:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w789pMNG030022
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 8 Aug 2018 02:51:37 -0700
Received: from localhost.corp.ad.wrs.com (128.224.162.161) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Wed, 8 Aug 2018 02:51:09 -0700
To: Khem Raj <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>, 
	Bruce Ashfield <bruce.ashfield@windriver.com>
References: <20180717201021.1640-1-raj.khem@gmail.com>
	<cca1b343-50cd-b445-b838-897063d6b8b8@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <247fe669-dbbb-cd41-9b10-cd1a6a06f255@windriver.com>
Date: Wed, 8 Aug 2018 17:54:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <cca1b343-50cd-b445-b838-897063d6b8b8@windriver.com>
Subject: Re: [PATCH] binutils: Upgrade to 2.31 release branch
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
X-List-Received-Date: Wed, 08 Aug 2018 09:52:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 08/07/2018 04:28 PM, Robert Yang wrote:
> commit 67f846b59b32f3d704c601669409c2584383fea9
> Author: John Darrington <john@darrington.wattle.id.au>
> Date:   Thu Apr 12 15:07:02 2018 +0100
> 
>      Stop the assembler from overwriting its output file.
> 
> [snip]
> +             if (sib.st_ino == sob.st_ino)

I've figured out the root cause, the input and output files maybe on different
devices, so different files may have the same ino, we need check whether
sib.st_dev == sob.st_dev, too.

I will send a patch to fix it after more testing.

// Robert

> +               {
> +                 /* Don't let as_fatal remove the output file!  */
> +                 out_file_name = NULL;
> +                 as_fatal (_("The input and output files must be distinct"));
> [snip]
> 
> 
> I can't reproduce this problem locally, but it can be reproduced in our daily
> build. Yocto doesn't have this problem atm since it use linux-yocto (not -dev).
> 
> Do you have any suggestions, please ?
> 
> // Robert
> 
> On 07/18/2018 04:10 AM, Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   meta/conf/distro/include/tcmode-default.inc   |    2 +-
>>   .../{binutils-2.30.inc => binutils-2.31.inc}  |    2 +-
>>   ....30.bb => binutils-cross-canadian_2.31.bb} |    0
>>   ...s-cross_2.30.bb => binutils-cross_2.31.bb} |    0
>>   ...ssdk_2.30.bb => binutils-crosssdk_2.31.bb} |    0
>>   ...s-crosssdk-Generate-relocatable-SDKs.patch |   12 +-
>>   ...o-not-generate-linker-script-directo.patch |   22 +-
>>   ...iden-the-regexp-for-SH-architectures.patch |   12 +-
>>   ...004-Point-scripts-location-to-libdir.patch |   10 +-
>>   ...-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch |   10 +-
>>   .../binutils/0006-Use-libtool-2.4.patch       | 2296 +++++++++--------
>>   ...-the-armv5e-architecture-to-binutils.patch |    8 +-
>>   ...stro-compiler-point-to-the-wrong-ins.patch |    4 +-
>>   ...-system-directories-when-cross-linki.patch |   50 +-
>>   ...h-in-libtool-when-sysroot-is-enabled.patch |    4 +-
>>   ...e-default-emulation-for-mips64-linux.patch |   12 +-
>>   .../0012-Add-support-for-Netlogic-XLP.patch   |   80 +-
>>   ...ect-assembling-for-ppc-wait-mnemonic.patch |   10 +-
>>   .../0014-Detect-64-bit-MIPS-targets.patch     |    4 +-
>>   .../0015-sync-with-OE-libtool-changes.patch   |    4 +-
>>   .../{binutils_2.30.bb => binutils_2.31.bb}    |    0
>>   21 files changed, 1327 insertions(+), 1215 deletions(-)
>>   rename meta/recipes-devtools/binutils/{binutils-2.30.inc => 
>> binutils-2.31.inc} (97%)
>>   rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.30.bb => 
>> binutils-cross-canadian_2.31.bb} (100%)
>>   rename meta/recipes-devtools/binutils/{binutils-cross_2.30.bb => 
>> binutils-cross_2.31.bb} (100%)
>>   rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.30.bb => 
>> binutils-crosssdk_2.31.bb} (100%)
>>   rename meta/recipes-devtools/binutils/{binutils_2.30.bb => binutils_2.31.bb} 
>> (100%)
>>

