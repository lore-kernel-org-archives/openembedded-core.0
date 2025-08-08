Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29451C87FD2
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 15:07:00 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.24560.1754665616947584169
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 08:06:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=HnMSnEJu;
 spf=pass (domain: baylibre.com, ip: 209.85.222.176, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7e346ab52e9so346215785a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 08:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1754665616; x=1755270416; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oRfYOb/EjLXsMgA8EG1DvNV6MxI4gS0+38JDNJW32Bs=;
        b=HnMSnEJu+1tQGp5BD/FfgK+j72vmF+c06Tjo8g6jbUNt5QOAZn8S2DSZfapaB5onYk
         eYMiyrnil+qf+coTSKM0MSCXInaVuoIjNV2I39t8/kYxAOTftv1/W1PXzfgYYEYXBigM
         w7Vi+cvtFohWVN4mhSE3grZ1Y4KC3l/KsPsRcn4dU/0lelPIUzndpsk/6l1ji5bFqYxB
         ySzaCf/VIvORLl5YsfUhYDh5QEqaBVzW1Ge09rDKzlgIDSVsFeXt8TFTLqtYyvOJlUyh
         YwEUHN2e2ntVfwmtWIgm0t/+YQq4/H7PBA+iqyFcy/kOgCCoAVeXg6FxZEqUQIBAcjwW
         3laA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754665616; x=1755270416;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oRfYOb/EjLXsMgA8EG1DvNV6MxI4gS0+38JDNJW32Bs=;
        b=Ekq/VUznVBevcEfAQuQGX/VfC5e1/+sdIuvIbHLGUBcNhH1WYCwpN8vJKKp3mP50Or
         UAiMfbuTjJ7DJyoPP0m/ArN12J96+f+ewM0yQrRdbMoczMK+IgECIueS2dPj9ao+gbCN
         MfvpmfKeZaqc0d7glFsoil4QBhFj//wQ95uGtWlV6k4mUCiDNmeTrrMq7NKtoXJCxHip
         nG5DfDTqJBhN04VRMJorEFsbh+fFpg8+xHM78MD8B0r4TiUiVS4AntyitPBLMJjqBKlQ
         tKa6wJw5OB53QDmGxE8fQNNb4TM3t3C0utR/jaQD7QZw05uh3PCdN/ElhzcA1GzG4E0p
         WVHw==
X-Forwarded-Encrypted: i=1; AJvYcCXMoPjzEmniCLWl1Ik5m//22ay/4YhxbHXudN/HNqBEao7vpOEYT6xOI8s5c8krxRKTUtLNf0r+m+IOGGyTlLEr8A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxP5zATiwJtX2rjxtvy/OEAqZ/IdjDlh2wf54Urd7xYZ2Nz+6Ra
	p3AhVjbISPPcIAUoolWt1/ihp435xRJUbKLVFI2Tf4qiIcDBWh1J7uewVg+bq0a8Yj4=
X-Gm-Gg: ASbGncu0OswmF6+vTYA+C1bXWkyYxWfFnQKQCzTcqDgY7ZQQp5Rt4jJ6UI2oPAunEyq
	cCmeg3PK/7e1tbs+sAGA3LK4CfhxGxM0kGvVnoAAEhz2umLgT4F6MBEgCIobGpltENi2U8tn4aP
	9Qj0F5bMlbxPOYxCuTkEgsCSJ9PmTQO8ahEZKN3OO8j+6HZTDzuReNQBdYmkgPCepSvKu8vWXyZ
	frbDkagocLFq6fB3+RTsMnpD0Y+jPBrjwrf6awD167pWZaSGABGMbg5E4eOH6a9sx8MH/p8/h4m
	lG/yvMys38yf0SqpgAoxLSifldNlWqghxVT2Z8FTjyRe3gEHRQhqA7V6yqocE0/5h6micfgP9qG
	SjraR7xtyvX+ZbTASsuf2zKXXKup8hYVpOs916ijRvhKV9GnmjfT5Gw8bYFOuJ50TqQ==
X-Google-Smtp-Source: AGHT+IGapYy7t+ehHeMVY5NDC472gCsYii8/YOL9e19yPcEyf5JzaXeUIvKGtGOAnO8U/Q48snIKRQ==
X-Received: by 2002:a05:620a:f11:b0:7e6:30f3:83df with SMTP id af79cd13be357-7e82c793b3amr513115185a.60.1754665615822;
        Fri, 08 Aug 2025 08:06:55 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e82f5fbe48sm114195985a.56.2025.08.08.08.06.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 08:06:55 -0700 (PDT)
Message-ID: <a9fa5eba-c6f7-483f-8e3c-5a5c4c1022e9@baylibre.com>
Date: Fri, 8 Aug 2025 11:06:52 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 19/37] libpng: upgrade 1.6.48 -> 1.6.49
To: richard.purdie@linuxfoundation.org, wangmy@fujitsu.com,
 openembedded-core@lists.openembedded.org
References: <20250630091315.1897-1-wangmy@fujitsu.com>
 <20250630091315.1897-19-wangmy@fujitsu.com>
 <30ec5f57f0be328fb0a1ae21b1eb299af91777f7.camel@linuxfoundation.org>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <30ec5f57f0be328fb0a1ae21b1eb299af91777f7.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 15:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221661


On 2025-07-05 15:04, Richard Purdie via lists.openembedded.org wrote:
> On Mon, 2025-06-30 at 17:12 +0800, wangmy via lists.openembedded.org wrote:
>> From: Wang Mingyu <wangmy@fujitsu.com>
>>
>> Changelog:
>> ==========
>> - Added SIMD-optimized code for the RISC-V Vector Extension (RVV).
>> - Added various fixes and improvements to the build scripts and to
>>    the sample code.
>>
>> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>> ---
>>   .../libpng/{libpng_1.6.48.bb => libpng_1.6.49.bb}               | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>   rename meta/recipes-multimedia/libpng/{libpng_1.6.48.bb => libpng_1.6.49.bb} (97%)
>>
>> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.48.bb b/meta/recipes-multimedia/libpng/libpng_1.6.49.bb
>> similarity index 97%
>> rename from meta/recipes-multimedia/libpng/libpng_1.6.48.bb
>> rename to meta/recipes-multimedia/libpng/libpng_1.6.49.bb
>> index e603df1edd..c4af30be80 100644
>> --- a/meta/recipes-multimedia/libpng/libpng_1.6.48.bb
>> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.49.bb
>> @@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
>>              file://run-ptest \
>>   "
>>   
>> -SRC_URI[sha256sum] = "46fd06ff37db1db64c0dc288d78a3f5efd23ad9ac41561193f983e20937ece03"
>> +SRC_URI[sha256sum] = "43182aa48e39d64b1ab4ec6b71ab3e910b67eed3a0fff3777cf8cf40d6ef7024"
>>   
>>   MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
>>   
> This breaks qemuriscv64:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/207
FYI, there is a more recent upgrade to 1.6.50 on the list that passes 
the tests:
https://lists.openembedded.org/g/openembedded-core/message/220753
>
> Cheers,
>
> Richard
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219960): https://lists.openembedded.org/g/openembedded-core/message/219960
> Mute This Topic: https://lists.openembedded.org/mt/113904846/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

