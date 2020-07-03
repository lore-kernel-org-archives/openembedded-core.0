Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web12.9856.1593781827405628093
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 06:10:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GUWfIIfN;
 spf=pass (domain: gmail.com, ip: 209.85.167.68, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f68.google.com with SMTP id o4so18455048lfi.7
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2020 06:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=iV6HQbTnqc88jlGf6WPJvx88U4HXyaWmkN7NwKBEBEU=;
        b=GUWfIIfNtFLSYgR57cTaNbEQkcrMcocb0wxXOQESuKicIa2Iimuul/v4oJ1DbIoHeS
         /sO88Wy1HR76G5ULrjoNPJ8MBdX0nlpAcWaR7yYGrMn9XB+EggqLVKB/Rvudx69q3RLQ
         h9lyWeIgxe0mEhtC3Vm0UF68+QOS3DJnmsRtw+plXNbQTu8OvMkqPrhQr69omBU/cVpx
         qza97EbPXelMIdFjXE85v4MjFFoqQJjgWHLdJQKkRhktwjyoOX21sdKO0syPemt+G1RN
         12wVP1HnegWPSlGF+Up+foQTVchHSfISC5eAzYCZXVJCRftzwk0ClnfVER8m7IX8ge4G
         hVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iV6HQbTnqc88jlGf6WPJvx88U4HXyaWmkN7NwKBEBEU=;
        b=hUi/acEAFYDwM/fIzZ+11Ny8xIq5HC7e48+Ln2sB0IbSGZhflp85ZiNJBCIRCW+N46
         bD3ckL+iiwJ+ErQjz62YE2e0aOpzflJIezjKpEZB33O76bGEVmcnJoRbNFWf+JXfc/eV
         +1x+O1Sy/OmFQZcuyrDRCQM669Ozq2Qx8VlIj6QdADjLi49ND7sUCsRE4b3X2bBq8UMV
         batdMX/IkXAEZhw4fpVRYGVSZhOZOemb9F0TvZGJ66c3hYRuhz4xCeNk14j6KOl+hq8L
         Jq2ykdqSSlDQN1/O6sVjs1duIVrsdliJB9eAbzklC8eONMAKaFyHO6eHv+AY5Qpvv5aB
         bVBA==
X-Gm-Message-State: AOAM531AaI6LMMiBSzMZDa5uSz7P/yx86RsIp+7p3YnQA6TqqrEULrP/
	aDFc6ln8h2IZcG00E5QQXfqZ54QZ
X-Google-Smtp-Source: ABdhPJzjuJY/Pa2yMrVSyOfx0Z5zmB5WVTtSNeG6cTgU+zHc+9qWJGsdesphGKixI5BKuTMRJQWVmg==
X-Received: by 2002:ac2:558f:: with SMTP id v15mr21958421lfg.187.1593781825099;
        Fri, 03 Jul 2020 06:10:25 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id d23sm4623668lfm.85.2020.07.03.06.10.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2020 06:10:24 -0700 (PDT)
Subject: Re: [OE-core] [PATCH v2] kernel.bbclass: add lz4 dependency and fix the call to lz4
From: "Jacob Kroon" <jacob.kroon@gmail.com>
To: "T. Ulrich" <timon.ulrich@kabelmail.de>,
 openembedded-core@lists.openembedded.org
References: <140262> <20200703123940.24779-1-timon.ulrich@kabelmail.de>
 <ba256db6-8174-c98d-e145-0ee358afef63@gmail.com>
Message-ID: <d457e91e-8345-b9ea-49c0-e4654b64398a@gmail.com>
Date: Fri, 3 Jul 2020 15:10:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <ba256db6-8174-c98d-e145-0ee358afef63@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 7/3/20 2:46 PM, Jacob Kroon wrote:
> On 7/3/20 2:39 PM, T. Ulrich wrote:
>> From: Timon Ulrich <t.ulrich@anapur.de>
>>
>> If the initramfs image is type lz4, then a native lz4 is needed.
>>
>> Additionally an output filename needs to be specified when calling lz4,
>> otherwise STDOUT will be used implicitly.
>>
>> Signed-off-by: Timon Ulrich <t.ulrich@anapur.de>
>> ---
>>   meta/classes/kernel.bbclass | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 6d07b29e2d..9e3c34ad48 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -5,6 +5,7 @@ KERNEL_DEPLOYSUBDIR ??= "${@ "" if 
>> (d.getVar("KERNEL_PACKAGE_NAME") == "kernel")
>>   PROVIDES += "${@ "virtual/kernel" if 
>> (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else "" }"
>>   DEPENDS += "virtual/${TARGET_PREFIX}binutils 
>> virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native 
>> bison-native"
>> +DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lz4", 
>> "lz4-native", "", d)}"
> 
> Should/Could we do a similar thing for "lzop-native" above ? To me it 
> looks like that would be possible, assuming I interpreted my taskexp 
> correctly.
> 

I took the liberty of doing some more history digging, lzop-native 
dependency was added in OE-Core commit

ee0640cb0c32b959ffaaac6752d582ed1d76e313
kernel.bbclass: add lzop dependency

and it looks to me it'd be worth doing the same fix.

Jacob
