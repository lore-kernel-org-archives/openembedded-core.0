Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A89E7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 12:59:49 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web11.2158.1733801418055699075
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 19:30:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KhXeu9b5;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: majortomtosourcecontrol@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-841a9366b5eso359583939f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 19:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733801417; x=1734406217; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VoHRjWxReqCTkq1bf4O3YRHY5i9wwt1VW45wjvRMUh8=;
        b=KhXeu9b5gVDRMtzJM6JCvYKfB/R/DXxSmWcuh9CP8HlEEgl+swyxMc3/CpVRMqgyuO
         iEsduWTSGJ3+4N+0PTe+EpV9cPD5JA+HxGVg/ThAdX88a5RbcOxxkKB73gPmmiFWhSW5
         WEajoK19YbCL9q9Ubgh3PKYwa0RZTosxgmOIrYDGp4EX6iXnjbk+3wvGkCIpvQvla6lN
         0SGgflGEDrpUUZ4Pt1zQHPSQxMoNMmFDquCVRSSmf6yTZ2fi4boLC+VY8AZnLKCyS/W3
         bLDqey1dh9jUwo2rt8V80B2J16d4EjI1Ym8GGuBqg1g9GLV8tFWAfAtOyzAbIYGpqo09
         VqXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733801417; x=1734406217;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VoHRjWxReqCTkq1bf4O3YRHY5i9wwt1VW45wjvRMUh8=;
        b=RZJavbujBtRVF8LtnQ+XUVHEv9Tfsft1MmWL0Y2I7elU7AVmtAJVaxI8AG9ABpkiKI
         Fb26dhpRiNQp1ggExCywz0GGlDsV90/u1lsKxZPcQ2S/lWGqNkSW0QfCb55Wr9Awg/2p
         j9Z6DeuyLDKFhDpGRYHNwWyOCgPhHVrVlPDwTO2XE+VXIWvhvza5dgkcYO22cKiX6wrQ
         LQxz40jRInEsoI7xjKRB9FgsFmcgglTdBdNcLGUfA2f6Y/8mj4AdC8/N0ylLegdISxUP
         zB/ZbrRoKHOo58cSk6ifMG4muqcUOiUXWxh2F+fvVy/hmr7mWCB80jd1391ijzg0fkGj
         yrOw==
X-Forwarded-Encrypted: i=1; AJvYcCXbs6/P7gVHZjkLQxzM61PfvX7X1Nm6zbKTNonK81++K9xuK5JPCVF0Q8DPy3ims5FZ8o+r+v8z0/jAT0vhEwH5xA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzQf5LR6m2q+1bjkEgBR5R+/KejnRB4Fxg5JjweBTnpOoJac8qo
	Xvpt0O7+TZKA4Eh7c6mTnhI4c5KHC2nUC90IcP+3JFOMa1/Fc4Kh
X-Gm-Gg: ASbGnctN3c5dVNvw6e+D80qVchqXu0MZtZOEjO2U/1uZyhnkRvXvbMnqRWxTWVNOp5p
	ZoJdQSq/djfI/mHDO2o2IHVopu+pXtV1FI2KVwEmtgNgjPx5AIav10oDFkC0olUR7/Jp3/QJpmC
	lJl0+QXTW9JprTyjxzruQypgOuYpNb9Nd40VWnRsEmbVVuh77cnn7+coHdnbAvpCLmPKyYOu01N
	uazCwW5C8h/LzNxyT+/FfF91WMwfuW+nptXnzdUCfx1D7W7uPek/8ZE7LAcdGkn2pqSx/fg9ajH
	EcICIYLQCN5yxzigEOBYM39W6W/nfG4=
X-Google-Smtp-Source: AGHT+IHe5TXySfVT/c4rMbGz/+d1HhXiISbcfaVoj+23/p7cBnEOTy8dXozwil7hIQJ+symcObHv/w==
X-Received: by 2002:a05:6602:1355:b0:844:7956:df9c with SMTP id ca18e2360f4ac-844b4e6a4f2mr420999839f.0.1733801417078;
        Mon, 09 Dec 2024 19:30:17 -0800 (PST)
Received: from [172.26.252.3] (174-29-210-206.hlrn.qwest.net. [174.29.210.206])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e2c72a1246sm557849173.37.2024.12.09.19.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 19:30:16 -0800 (PST)
Message-ID: <07df4d74-e0b2-48c3-b9a0-95c762b267ca@gmail.com>
Date: Mon, 9 Dec 2024 20:30:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [BACKPORT] uboot-sign: fix U-Boot binary with public key
To: Denys Dmytriyenko <denis@denix.org>
Cc: steve@sakoman.com, openembedded-core@lists.openembedded.org
References: <6c59a659-d47e-48d5-81af-a729b8533f62@gmail.com>
 <20241206233052.GD23825@denix.org>
From: Clayton Casciato <majortomtosourcecontrol@gmail.com>
In-Reply-To: <20241206233052.GD23825@denix.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 12:59:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208534

On 12/6/24 4:30 PM, Denys Dmytriyenko wrote:
> Clayton,

Hi, Denys

> 
> This is not the way to request backports. Please just read the list for past 
> submissions and it will be clear how those should be made.

Steve has previously communicated this is an acceptable format.
Please see https://lists.openembedded.org/g/openembedded-core/message/207185

I take it you would prefer to see a distinct request for each branch.

> 
> 
> Steve,
> 
> Please do NOT backport this change to stable releases, as it seems incorrect 
> and causes issues downstream and should probably get reverted from master.

I agree given the feedback.

> 
> Thanks.

Thank you!

> 
> 
> 
> On Tue, Nov 26, 2024 at 08:17:34AM -0700, Clayton Casciato via lists.openembedded.org wrote:
>> Hi, Steve!
>>
>> I would like to backport this from master to Styhead and Scarthgap.
>>
>> Thank you!
>>
>> Clayton Casciato
>>
>> --
>>
>> commit 0d14e99aa18ee38293df63d585fafc270a4538be
>> Author: Clayton Casciato <majortomtosourcecontrol@gmail.com>
>> Date:   Fri Nov 22 08:00:00 2024 -0700
>>
>>     uboot-sign: fix U-Boot binary with public key
>>     
>>     Fixes [YOCTO #15649]
>>     
>>     The U-Boot binary in the "deploy" directory is missing the public key
>>     when the removed logic branch is used.
>>     
>>     The simple concatenation of the binary and DTB with public key works as
>>     expected on a BeagleBone Black.
>>     
>>     Given:
>>     MACHINE = beaglebone-yocto
>>     UBOOT_SIGN_KEYNAME = "dev"
>>     
>>     Post-patch (poky/build/tmp/deploy/images/beaglebone-yocto):
>>     $ hexdump -e "16 \"%_p\" \"\\n\"" u-boot-beaglebone-yocto.dtb \
>>     | tr -d '\n' | grep -o 'key-dev'
>>     key-dev
>>     
>>     $ hexdump -e "16 \"%_p\" \"\\n\"" u-boot.img \
>>     | tr -d '\n' | grep -o 'key-dev'
>>     key-dev
>>     
>>     Non-Poky BeagleBone Black testing (Scarthgap):
>>     U-Boot 2024.01 [...]
>>     [...]
>>     Using 'conf-ti_omap_am335x-boneblack.dtb' configuration
>>     Verifying Hash Integrity ... sha256,rsa4096:dev+ OK
>>     Trying 'kernel-1' kernel subimage
>>     [...]
>>     
>>     Signed-off-by: Clayton Casciato <majortomtosourcecontrol@gmail.com>
>>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
>> index a17be745ce..7ee73b872a 100644
>> --- a/meta/classes-recipe/uboot-sign.bbclass
>> +++ b/meta/classes-recipe/uboot-sign.bbclass
>> @@ -122,13 +122,7 @@ concat_dtb() {
>>  	# If we're not using a signed u-boot fit, concatenate SPL w/o DTB & U-Boot DTB
>>  	# with public key (otherwise U-Boot will be packaged by uboot_fitimage_assemble)
>>  	if [ "${SPL_SIGN_ENABLE}" != "1" ] ; then
>> -		if [ "x${UBOOT_SUFFIX}" = "ximg" -o "x${UBOOT_SUFFIX}" = "xrom" ] && \
>> -			[ -e "${UBOOT_DTB_BINARY}" ]; then
>> -			oe_runmake EXT_DTB="${UBOOT_DTB_SIGNED}" ${UBOOT_MAKE_TARGET}
>> -			if [ -n "${binary}" ]; then
>> -				cp ${binary} ${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX}
>> -			fi
>> -		elif [ -e "${UBOOT_NODTB_BINARY}" -a -e "${UBOOT_DTB_BINARY}" ]; then
>> +		if [ -e "${UBOOT_NODTB_BINARY}" -a -e "${UBOOT_DTB_BINARY}" ]; then
>>  			if [ -n "${binary}" ]; then
>>  				cat ${UBOOT_NODTB_BINARY} ${UBOOT_DTB_SIGNED} | tee ${binary} > \
>>  					${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX}
>>


