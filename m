Received: from 13.mo1.mail-out.ovh.net (13.mo1.mail-out.ovh.net [178.33.253.128])
 by mx.groups.io with SMTP id smtpd.web10.6446.1606403867612771209
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2020 07:17:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: 3mdeb.com, ip: 178.33.253.128, mailfrom: norbert.kaminski@3mdeb.com)
Received: from player735.ha.ovh.net (unknown [10.108.4.72])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 8656C1E5181
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2020 16:17:45 +0100 (CET)
Received: from 3mdeb.com (178235223047.warszawa.vectranet.pl [178.235.223.47])
	(Authenticated sender: norbert.kaminski@3mdeb.com)
	by player735.ha.ovh.net (Postfix) with ESMTPSA id 5E4B618520E0C;
	Thu, 26 Nov 2020 15:17:42 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-106R0065ee08f5f-bfba-42a2-a368-ae075ffcfdf4,
                    637D313A34A7FE78C7459B71C1419970C707AA62) smtp.auth=norbert.kaminski@3mdeb.com
Subject: Re: [OE-core] [PATCH] grub: Add support for RISC-V
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
 Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
References: <20201125172249.1067599-1-norbert.kaminski@3mdeb.com>
 <CAMKF1spgmRqX-rmy-tV+a5VwRCTT6-UpjWejAq2UL5nhbB9-kQ@mail.gmail.com>
From: "Norbert Kaminski" <norbert.kaminski@3mdeb.com>
Message-ID: <0925f3b7-4b36-f4a3-8d5e-e0deb5bc2b5d@3mdeb.com>
Date: Thu, 26 Nov 2020 16:17:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spgmRqX-rmy-tV+a5VwRCTT6-UpjWejAq2UL5nhbB9-kQ@mail.gmail.com>
X-Ovh-Tracer-Id: 14346498088966134062
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudehvddgjeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomheppfhorhgsvghrthgpmfgrmhhiknhskhhiuceonhhorhgsvghrthdrkhgrmhhinhhskhhiseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpedtffejvdffvedugfejffdvfffggeeuveelffefteeiudeghfektdevtddttddvleenucffohhmrghinhepghhnuhdrohhrghdpohhpvghnvghmsggvugguvggurdhorhhgnecukfhppedtrddtrddtrddtpddujeekrddvfeehrddvvdefrdegjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejfeehrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepnhhorhgsvghrthdrkhgrmhhinhhskhhiseefmhguvggsrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 25.11.2020 19:54, Khem Raj wrote:
> Thanks for your contribution.
>
> On Wed, Nov 25, 2020 at 9:23 AM Norbert Kaminski
> <norbert.kaminski@3mdeb.com> wrote:
>> This patch adds RISC-V to the COMPATIBLE_HOST. Since GRUB 2.04,
>> the source code supports the RISC-V, thanks to Alexander Graf.
>>
>> Adding the GRUBPLATFORM for RISC-V prevents autoconf problems.
>> Also, the patch appends the __anonymous method with RISC-V architecture.
>>
>> Signed-off-by: Norbert Kaminski <norbert.kaminski@3mdeb.com>
>> ---
>>   meta/recipes-bsp/grub/grub-efi_2.04.bb | 4 ++++
>>   meta/recipes-bsp/grub/grub2.inc        | 4 +++-
>>   2 files changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-bsp/grub/grub-efi_2.04.bb b/meta/recipes-bsp/grub/grub-efi_2.04.bb
>> index 30d95f95e0..f80afd95cb 100644
>> --- a/meta/recipes-bsp/grub/grub-efi_2.04.bb
>> +++ b/meta/recipes-bsp/grub/grub-efi_2.04.bb
>> @@ -26,6 +26,10 @@ python __anonymous () {
>>           grubtarget = 'arm64'
>>       elif re.match('arm', target):
>>           grubtarget = 'arm'
>> +    elif re.match('riscv64', target):
>> +        grubtarget = 'riscv64'
>> +    elif re.match('riscv32', target):
>> +        grubtarget = 'riscv32'
> RV64 is file but does it also support RV32 ?
I see that there are some changes for RV32:

https://git.savannah.gnu.org/cgit/grub.git/tree/configure.ac?h=grub-2.04#n186

And I'm able to build the grub and grub-native package for RV32.
There is a problem with grub-mkimage for RV32 in grub-efi,
it fails with the error:

grub-mkimage: error: target 1f46 not reachable from pc=10b6.

This points to the line:
https://git.savannah.gnu.org/cgit/grub.git/tree/util/grub-mkimagexx.c?h=grub-2.04&id=3562536fd5e5cc3d40942f3e8ac53d4f0ee5c220#n1300

I guess for now, we should leave the support only for the RV64,
which is tested and works well.

>>       else:
>>           raise bb.parse.SkipRecipe("grub-efi is incompatible with target %s" % target)
>>       grubimage = prefix + d.getVar("EFI_BOOT_IMAGE")
>> diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
>> index ff17dbe8b7..d020103605 100644
>> --- a/meta/recipes-bsp/grub/grub2.inc
>> +++ b/meta/recipes-bsp/grub/grub2.inc
>> @@ -33,7 +33,7 @@ SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e503165
>>
>>   DEPENDS = "flex-native bison-native gettext-native"
>>
>> -COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freebsd.*)'
>> +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|riscv.*)-(linux.*|freebsd.*)'
>>   COMPATIBLE_HOST_armv7a = 'null'
>>   COMPATIBLE_HOST_armv7ve = 'null'
>>
>> @@ -42,6 +42,8 @@ COMPATIBLE_HOST_armv7ve = 'null'
>>
>>   GRUBPLATFORM_arm = "efi"
>>   GRUBPLATFORM_aarch64 = "efi"
>> +GRUBPLATFORM_riscv32 = "efi"
>> +GRUBPLATFORM_riscv64 = "efi"
>>   GRUBPLATFORM ??= "pc"
>>
>>   inherit autotools gettext texinfo pkgconfig
>> --
>> 2.25.1
>>
>>
>> 
>>
