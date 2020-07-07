Received: from smtp-out01.xworks.net (smtp-out01.xworks.net [31.25.48.218])
 by mx.groups.io with SMTP id smtpd.web10.25066.1594152780689638196
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2020 13:13:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kabelmail.de header.s=mail header.b=CsVazqXY;
 spf=pass (domain: kabelmail.de, ip: 31.25.48.218, mailfrom: timon.ulrich@kabelmail.de)
Received: from mailbackend5 (cluster06.xworks.net [10.100.1.80])
	by smtp-out01.xworks.net (Postfix) with ESMTP id 8F4B86139C;
	Tue,  7 Jul 2020 22:12:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kabelmail.de;
	s=mail; t=1594152777;
	bh=sO50/ZwWZ8RbgMNWv/NYD4KjpZl+rBx8BUjyqkmzULQ=;
	h=Subject:To:References:From:Date:MIME-Version:In-Reply-To:
	 Content-Type;
	b=CsVazqXYdNQjqAxmdcbtx95+cbQuylfPHdkNxseiZDzcNwAt2d4knDsfygu4TVJdN
	 JjBUv69bKqyv32f0B0DOedX3KBykvv4HCKCzWwCQikecNfqmUvFKQv5YLhTuE9gkzJ
	 nFM33nHpdYRyKn14Mu5Kfj7ZgPtO69p8Mm7Vyd60=
Received: from [192.168.1.2] (x4db51e0e.dyn.telefonica.de [77.181.30.14])
	(authenticated bits=0)
	by smtp.kabelmail.de  with ESMTP id 067KCsFO028351
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 7 Jul 2020 22:12:55 +0200
X-mediaBEAM-Originating-IP: [77.181.30.14]
X-mediaBEAM-AUTHID: [timon.ulrich@kabelmail.de]
Subject: Re: [OE-core] [PATCH] kernel.bbclass: make dependency on lzop-native conditional
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>,
        Timon Ulrich <t.ulrich@anapur.de>
References: <20200707092511.7781-1-timon.ulrich@kabelmail.de>
 <CAJ86T=XYCDAD1jG2JTODSc-Oz9JmpPeNd0jXg9aeJbo88pciWw@mail.gmail.com>
From: "T. Ulrich" <timon.ulrich@kabelmail.de>
Message-ID: <7eeb7370-b3ee-475b-c6f4-4c05b87a6159@kabelmail.de>
Date: Tue, 7 Jul 2020 22:12:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=XYCDAD1jG2JTODSc-Oz9JmpPeNd0jXg9aeJbo88pciWw@mail.gmail.com>
X-mediaBEAM-AuthCheck: route13
X-mediaBEAM-AuthScore: 0.0/5.0, scanned in 1.221sec
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

> Is the logic actually that native lzop is only needed if an lzo
> compressed initramfs is present AND and a plain .cpio or .cpio.gz is
> NOT present?
Yes, that is the case. If a plain cpio is present then there's no
need to uncompress, hence there's no need for lzop-native.

IMO this patch still improves the behavior:
before lzop-native would be built regardless,
now it gets if it _might_ be necessary.

Am 07.07.2020 um 21:47 schrieb Andre McCurdy:
> On Tue, Jul 7, 2020 at 2:25 AM T. Ulrich <timon.ulrich@kabelmail.de> wrote:
>> From: Timon Ulrich <t.ulrich@anapur.de>
>>
>> a native lzop is only needed when an lzo compressed initramfs is actually present
> Is the logic actually that native lzop is only needed if an lzo
> compressed initramfs is present AND and a plain .cpio or .cpio.gz is
> NOT present?
>
>> Signed-off-by: Timon Ulrich <t.ulrich@anapur.de>
>> ---
>>   meta/classes/kernel.bbclass | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index c834aad033..3230c12ccf 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -4,7 +4,8 @@ KERNEL_PACKAGE_NAME ??= "kernel"
>>   KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else d.getVar("KERNEL_PACKAGE_NAME") }"
>>
>>   PROVIDES += "${@ "virtual/kernel" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else "" }"
>> -DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native bison-native"
>> +DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native bison-native"
>> +DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lzo", "lzop-native", "", d)}"
>>   DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lz4", "lz4-native", "", d)}"
>>   PACKAGE_WRITE_DEPS += "depmodwrapper-cross"
>>
>> --
>> 2.17.1
>>
>>
>> 
> .



