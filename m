Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0314FEB4907
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 11:25:24 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43330.1770895519031403779
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 03:25:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=AE6/9qa6;
 spf=pass (domain: smile.fr, ip: 209.85.221.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-4358fb60802so1355960f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 03:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770895517; x=1771500317; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTt2ZiB6uPVQU9GfcND7PKUxamVVQkxydtRkwMbrwj4=;
        b=AE6/9qa6I55nMmNm9qUEZB6i91i13sfUUGoQ5TGk4j0LEj/px7bPPV3ItTAkbNaRDN
         G4D0Kd71cKeOaw8dGkYFRVBjHNVGd91jgUPkGnUyl0aI9T4a5kogM0g6M28aeFDzamPZ
         rkWNCzVRMPZ2gkiG1OY9Ry2f7goYmIpg5JhEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770895517; x=1771500317;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xTt2ZiB6uPVQU9GfcND7PKUxamVVQkxydtRkwMbrwj4=;
        b=sUGATC98ZIi8KcWocTHEYk38LMEgnLz+dCAG9wPaNQvbuy+qO8S1KTVRydYoX6yB4i
         4aIPg+zYJLVrbZqZPahfcxnY9UGhl1mWX57ZmLCcaxjB6Iqv80LYFJc0XSmotU7byUui
         lr5hj2xWVTJ6t1rpSjUPYeYc7uhoBpcjGH41MOOsJGd/E6wVc0YB1cT6JFYy8+ZP9oJu
         ELKLt3GNPN2mkANeXzBbfWBSndVVR1TNzg6Nh9JZlcaFIhigFded+hM4uncqOXcFYvos
         nuDMyw47QzDoG54fJ3MEBff+dCHTW1IyLF0BSafh9Kmzyrvha+wDYxXKTPlU1uJrI2FN
         Dt0A==
X-Forwarded-Encrypted: i=1; AJvYcCXmEapISIrMxSaYBioFUw6c3aPaqO8IJay8tIqZ/W7e80zVgc01UPwqBigSsvrB7shVviW+giM2NpRLCx697EDAiw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxb43t0i93q/dx8u68kxubZXO8XX2clXCbaHVqMvs9JxAg8zFjB
	uvlUQOYoujDiMnOyIYGKYJxV5ioCUTk2tEFmG4BfQCrxwaOUEujflnUPsSW8f8QLZYc=
X-Gm-Gg: AZuq6aIQYLCilckgNRcOO6VXlHzPIjNvmP1Td2lEWD+CB/FP15d8FXBLIFHEXHEMtn0
	L+dJEsLc7uNXBDkTV8/na9fzwRvqu9NYZNme5ncd2lTRnRETAriS6lHwrrmpvK3Fx2ibDrHspMO
	UkZCiSIBCr0jPnP/P0iWaaZMH6IoEa0QXbDvlDE227mEb4DmIX15zXRUG6CGnaCRulOYPA5pPOG
	owdhJyPbaFBRZPkR+cVdPmecciwXWw5Neab9UhuJnwZnESKy4FshrymMB1KVRkCE32AL7kjY8aD
	JWBe47tX0FjTmQbdEt/gr0w46emU83O6iPi52ms1oB1z0NHPEIiBfbL+N1WWN93WdGmbZ8aKh8l
	O1SSKo6CiuqOMmVvSy6b5+YznhYSQ0WfrK/O4/BPovCbZVtPbYkDDgwSFOjc5Cf3M7KmbGrxAqq
	TUcZQKQqqPiZVtC90z5gtwXF1yVCPZSf8SWTqPfce3YvcwuLcnotACIe1W/zHu919sp7yDwXUZw
	RGY/TQj8wnMwzo=
X-Received: by 2002:a05:6000:1849:b0:436:142d:b9ae with SMTP id ffacd0b85a97d-4378e6d4bb2mr3722176f8f.10.1770895517029;
        Thu, 12 Feb 2026 03:25:17 -0800 (PST)
Received: from localhost (2a01cb001331aa0091410e731fc6f0fa.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:9141:e73:1fc6:f0fa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43783e5c93asm10321694f8f.39.2026.02.12.03.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 03:25:16 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Feb 2026 12:25:16 +0100
Message-Id: <DGCY2H440Y82.34J28P87KRA06@smile.fr>
Subject: Re: [OE-core] [PATCH v5 11/15] kernel.bbclass: Export artifacts
 needed for out-of-tree Rust compilation
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <Randy.MacLeod@windriver.com>, <Sundeep.Kokkonda@windriver.com>,
 <alistair.francis@wdc.com>, <bruce.ashfield@gmail.com>,
 <elmehdi.younes@smile.fr>, <richard.purdie@linuxfoundation.org>
To: "Harish Sadineni" <Harish.Sadineni@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260129163910.2612040-1-Harish.Sadineni@windriver.com>
 <188F412032A5A3F8.3408700@lists.openembedded.org>
 <e191dda3-0c66-4cc6-93be-c09152173138@windriver.com>
In-Reply-To: <e191dda3-0c66-4cc6-93be-c09152173138@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 11:25:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231023

On Wed Feb 11, 2026 at 5:19 PM CET, Harish Sadineni wrote:
>
> On 1/29/2026 10:09 PM, Sadineni, Harish via lists.openembedded.org wrote:
>> From: Yoann Congal <yoann.congal@smile.fr>
>>
>> Publish artifacts from kernel compilation to allow out-of-tree Rust
>> compilation:
>> * scripts/target.json: target definition: architecture, ABI, compiler
>>    options, ...
>> * rust/: the crates compiled by the kernel available to
>>    out-of-tree-modules
> Hi Yoann,
>
> I am dropping this patch =E2=80=9Ckernel.bbclass: Export artifacts needed=
 for=20
> out-of-tree Rust compilation=E2=80=9D from my v6 patch series.
>
> Without this patch, target.json and the rust/ directory were already=20
> getting published for x86_64. On arm64, target.json will not be created,=
=20
> yet the module is still generated and works fine.
>
> When building rust-out-f-tree-module for arm64 with this patch applied,=
=20
> it emits a warning that Out-of-tree rust modules build will fail due to=
=20
> a missing target.json in kernel. However, in practice, the build=20
> completes successfully.
>
> I have tested without this patch on both arm64 and x86_64, both tests=20
> were successful.
>
> So, this patch does not appear to be necessary. Are you OK with dropping=
=20
> this patch?

Yes, as long as it builds without warnings and test succesfully, I'm fine w=
ith it.

> I have pushed the updated changes to the below oe-contrib branch:
> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Ddeepesh/r=
ust-in-kernel-v6
>
> Additionally, I have extended the ccache disabling to make-mod-scripts=20
> (as part of "kernel: Disable ccache when kernel rust support is enabled"=
=20
> patch) and updated "meta-skeleton: Add rust-out-of-tree-module recipe"=20
> to align with the new changes.

Shouldn't the KERNEL_RUST_SUPPORT check in
rust-out-of-tree-module_git.bb be moved to the module-rust class?

Generally, If you think that you rewrote some patches, I'm OK with you
taking authorship (leaving me as Co-developed-by). That should allow you
to edit patches more freely.

Regards,

> Thanks,
> Harish
>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
>> ---
>>   meta/classes-recipe/kernel.bbclass | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ke=
rnel.bbclass
>> index 30a10b0801..dfb8604a68 100644
>> --- a/meta/classes-recipe/kernel.bbclass
>> +++ b/meta/classes-recipe/kernel.bbclass
>> @@ -632,6 +632,24 @@ do_shared_workdir () {
>>   		cp -r scripts/gcc-plugins ${kerneldir}/scripts
>>   	fi
>>  =20
>> +	if ${@bb.utils.contains("DISTRO_FEATURES", "rust-kernel", "true", "fal=
se", d)}; then
>> +		# Copy target.json file needed for out-of-tree rust modules
>> +		if [ -e scripts/target.json ]; then
>> +			bbnote "Copying scripts/target.json"
>> +			mkdir -p ${kerneldir}/scripts
>> +			cp scripts/target.json ${kerneldir}/scripts
>> +		else
>> +			bbwarn "scripts/target.json not found in compiled kernel. Out-of-tre=
e rust modules will fail to build."
>> +		fi
>> +
>> +		# Copy rust/ needed by out-of-tree module (firstly for the core rust =
crate)
>> +		if [ -e rust/ ]; then
>> +			bbnote "Copying rust/"
>> +			cp -r rust ${kerneldir}/
>> +		else
>> +			bbwarn "rust/ not found in compiled kernel. Out-of-tree rust modules=
 will fail to build."
>> +		fi
>> +	fi
>>   }
>>  =20
>>   # We don't need to stage anything, not the modules/firmware since thos=
e would clash with linux-firmware
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#230151): https://lists.openembedded.org/g/openembedd=
ed-core/message/230151
>> Mute This Topic: https://lists.openembedded.org/mt/117528980/8054390
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [H=
arish.Sadineni@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


--=20
Yoann Congal
Smile ECS


