Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web12.948.1588830979149341614
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 22:56:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mfBi1cvh;
 spf=pass (domain: gmail.com, ip: 209.85.208.193, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f193.google.com with SMTP id l19so4922840lje.10
        for <openembedded-core@lists.openembedded.org>; Wed, 06 May 2020 22:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=H4lC1xVLPwPoDAg7Hu8b4bhjvmXnwQib6uoaD5evRxk=;
        b=mfBi1cvhM3I6C4Iw+m7FPBMmnau+l3bVaQ8Q8BiSuN2U4M9tI+PlDTukejXQimNibt
         2NFoKVcjTaDZtPWaacSh4dL+EIwWNXOz/jCZRNesWlU8xadt4n3D/ZhMR9rXos4921jY
         gy0+hNlERlnfCmb6ji5Neb9gwHyzJ54ay8KvHixful+QzXWPuvbxIa/ulMOxeY0paoG/
         EOEgTCXXPIDsoMr6fLdd50CvnurLvyTIwqASfKfhpW+YXVgpstemdhtilrT/PalfCW9t
         fIDMIh8RERCrTEWy1APqMZMQ/o9AqMlVdJZX0T5C2/SHCQr7Lme7udCRNMpMFz3ZZn/j
         J0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=H4lC1xVLPwPoDAg7Hu8b4bhjvmXnwQib6uoaD5evRxk=;
        b=TaVcp5Nt4oUcq3o9TlmRvksPS7v2SB5A7lgR5EVKvV+1B9pIIVjfwMu4uXOcUWHTvN
         f2sBGKfcO4/Yd86EFtyQPitBLfXNqxycUTGyKnSR5Y8+TpN2lMi/h1G1EU+IBvqRJELn
         aMLkYYOS47YsY94d2UyUPhkV4CNhow9k/qY2W5ELXCOM41FmfmUbCu1lt1LQh5AKQJPD
         +p7+cx69SgNozwrjSqNV/FFxS5uSL+QxP1WDVh36CPSA/geW8HeXXpUTahr8QaXPb+NN
         T48ZP344Am0GrPdZOacr5ZurfescuSZkxGegsqd9M0tpIR8CtNq4UwPXHkk1KuJFD/sD
         hQmw==
X-Gm-Message-State: AGi0PuaGTP3qOHFijafA0lA4P4I+J1dJQ1wpg1hhlN/5elRedGT4d5HV
	e934L3hf8hhKTgWNen7n3MX/IBK0WYI=
X-Google-Smtp-Source: APiQypLSAuA+tKzKpIQMik2lzRDvxOM/lGF9lkqpuhj6jwaQVhMPefSgs/5bMnoE1l+QYWld7kjQ7Q==
X-Received: by 2002:a05:651c:291:: with SMTP id b17mr7497136ljo.166.1588830977058;
        Wed, 06 May 2020 22:56:17 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id 12sm2967554ljq.0.2020.05.06.22.56.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2020 22:56:16 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] iproute2.inc: clean .o before do_configure
To: Changqing Li <changqing.li@windriver.com>,
 openembedded-core@lists.openembedded.org
References: <1588817159-434433-1-git-send-email-changqing.li@windriver.com>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
Message-ID: <015c4b93-6ca1-0668-0c1d-2a3150c65a38@gmail.com>
Date: Thu, 7 May 2020 07:56:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1588817159-434433-1-git-send-email-changqing.li@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/7/20 4:05 AM, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> Reproduce steps:
> 1. add 'DISTRO_FEATURES_append = ' usrmerge'' in local.conf
> 2. bitbake iproute2
> 3. remove 'DISTRO_FEATURES_append = ' usrmerge'' from local.conf
> 4. bitbake iproute2
> 
> In step4, since CLEANBROKEN is set, files generated in step2 is not
> cleaned and rebuilded. Check after step4:
> 
> file /sbin/ip.iproute2
> /sbin/ip.iproute2: ELF 64-bit LSB pie executable, x86-64, version 1
> (SYSV), dynamically linked, interpreter /usr/lib64/ld-linux-x86-64.so.2,
> 
> interpreter path is wrong, it should be  /lib64/ld-linux-x86-64.so.2
> 
> This will make run ip.iproute2 report error:
> -sh: /sbin/ip.iproute2: No such file or directory
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   meta/recipes-connectivity/iproute2/iproute2.inc | 4 ++++
>   1 file changed, 4 insertions(+)
> 

Isn't this a general problem, and not specific to just iproute2 ?
