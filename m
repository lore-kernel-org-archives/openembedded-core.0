Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBCE9C83F15
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 17:07:49 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.177.1693415260160084250
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 10:07:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=k0dKWjHp;
 spf=pass (domain: baylibre.com, ip: 209.85.221.54, mailfrom: pidge@baylibre.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-31c615eb6feso4905494f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 10:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1693415258; x=1694020058; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kGgeEt/JF0p0Tlq0MGErtpbFqYiRbz4ozTYZ0QUPsBo=;
        b=k0dKWjHpIcytvg2DJaicX0NqHtL6so/L5yHhGEcSxLQdrHNZqcgkGpr55tW/gAQdxu
         qCLcl+4PM5EftD3X9voVye3JuocFYpLMDRjFG7tid4knINelEnR2og8eBhb5HN6f2d3r
         Gq0bNAhBkiek1ibrzMXscbHapmNfVOWi/KpMQ0f1nX46ckV1jtAUivw7h4Tb7CGyEWfs
         9XFLxLFkIo0iz1P1Qelr9UDqLv2tGbKu/aqV5mXJ6f8dkXC16FIUvcMtpLDybsey81cu
         YmrBvBw71p+Nx1wG54Rb6+HyEVb/PSpgKWVxv4TR/1BUrpugwAldjQqUALEu+FaCPcuW
         O8Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693415258; x=1694020058;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kGgeEt/JF0p0Tlq0MGErtpbFqYiRbz4ozTYZ0QUPsBo=;
        b=ZI4Pfa2JsAcufKr18Lqs2RIWUjuaRHXfZLaRfm1puXZJreyQ6DyZrlqhcPwJhPXq62
         zV6okODWBqVeuKkeG9htOA6W8w1FXUphk9EBooWsINWwDGp7uu/RufpMq5hWYYCyvucQ
         Q8M8PIqKc8xg7pShGqayysXLSfiucy6sxxR5g+88FpRY7DlVu9odtL1Sa+quBfBJ+u5H
         fziNNSQLdoYnBMGfsE9WOfYF/ugX0jEYTkxFsOBOywkH9VCSpBYzMklo9hyLp3VZVebS
         eDmyP1PiiOG8M3Gs7P9MU9LJOyBDoGpXC2csJngvaAK6HQxFPtKXuuCaH0ztHsIv/Vgn
         QDvw==
X-Gm-Message-State: AOJu0YyCKZV+6oK3h1Y2K2mIiAcqQxLxKR3c1szdgdaQu3Ck+9xSnBXF
	G0osUrXynO/o70K7x+jYi2K6Yg==
X-Google-Smtp-Source: AGHT+IFUKa/RY8fO/YjBrUgTqzwnwJ+OBnTxB4w30/+bFj+w6fknHepFSiSRyDBKa79jhSb25Ji09Q==
X-Received: by 2002:a5d:5508:0:b0:31a:dc27:dfd with SMTP id b8-20020a5d5508000000b0031adc270dfdmr1874355wrv.6.1693415258338;
        Wed, 30 Aug 2023 10:07:38 -0700 (PDT)
Received: from [192.168.178.55] ([194.110.145.184])
        by smtp.gmail.com with ESMTPSA id n12-20020a5d67cc000000b00317afc7949csm17168336wrw.50.2023.08.30.10.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 10:07:37 -0700 (PDT)
Message-ID: <66ee8cdb-967d-ced7-8247-53a38416b708@baylibre.com>
Date: Wed, 30 Aug 2023 18:07:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core] [PATCH] update_mandb: Point to correct /etc/passwd with
 man
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20230830123912.2052665-1-pidge@baylibre.com>
 <6965c5634e674335fcfc02e2540d5c2e0bd1caf3.camel@linuxfoundation.org>
 <1923dbe0-a0a6-275d-459d-895aecdd2463@baylibre.com>
 <54cfce0bb884640b5bf1e40bfd7dab5d419fa1be.camel@linuxfoundation.org>
From: =?UTF-8?B?RWlsw61zICdwaWRnZScgTsOtIEZobGFubmFnw6Fpbg==?=
 <pidge@baylibre.com>
In-Reply-To: <54cfce0bb884640b5bf1e40bfd7dab5d419fa1be.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 17:07:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186900

On 30/08/2023 15:08, Richard Purdie wrote:
> On Wed, 2023-08-30 at 15:04 +0100, Eilís 'pidge' Ní Fhlannagáin wrote:
>> On 30/08/2023 14:19, Richard Purdie wrote:
>>> On Wed, 2023-08-30 at 12:39 +0000, Eilís 'pidge' Ní Fhlannagáin wrote:
>>>> [YOCTO #15023]
>>>>
>>>> In this instance (do_populate_sdk with api-documentation turned on),
>>>> pseudo is going to end up finding the passwd/groups files in
>>>> recipe-sysroot-native which is incorrect and does not have man. The
>>>> solution here should be to ensure that pseudo points to the passwd/groups
>>>> files in recipe-sysroot (which does have man:man).
>>>>
>>>> Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
>>>> ---
>>>>    scripts/postinst-intercepts/update_mandb | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/scripts/postinst-intercepts/update_mandb b/scripts/postinst-intercepts/update_mandb
>>>> index a061bb426a6..6bc073bfff5 100644
>>>> --- a/scripts/postinst-intercepts/update_mandb
>>>> +++ b/scripts/postinst-intercepts/update_mandb
>>>> @@ -13,4 +13,4 @@ PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D $D${bindir}/mandb --config-file $C
>>>>    
>>>>    rm -f $CONFIG
>>>>    
>>>> -chown -R man:man $D${localstatedir}/cache/man/
>>>> +PSEUDO_PASSWD=$D chown -R man:man $D${localstatedir}/cache/man/
>>>
>>> Is there a more general problem here? Wouldn't this issue apply to
>>> other postinst scripts too?
>>
>> Yes and No. The other postinst scripts if they do attempt to chown, are
>> trying to do it for root:root (which recipe-native-sysroot's passwd and
>> groups obviously have). We could add this to the others as well, just to
>> maintain consistency.
>>
>> This is all because in image.bbclass, we're setting PSEUDO_PASSWD to
>> STAGING_DIR_NATIVE which I believe normally should be correct, except in
>> an instance like this.
> 
> image.bbclass sets it to:
> 
> meta/classes-recipe/image.bbclass:PSEUDO_PASSWD = "${IMAGE_ROOTFS}:${STAGING_DIR_NATIVE}"
> 
> so it should look at IMAGE_ROOTFS first, which I think is the same as
> $D here?
> 
> Something isn't quite adding up...

In this case, IMAGE_ROOTFS and D are not the same, either at the start 
of do_populate_sdk or when the postinst script runs:

bitbake -e yields:

IMAGE_ROOTFS="/home/pidge/poky/build/tmp/work/qemux86_64-poky-linux/core-image-base/1.0/rootfs"

Passing IMAGE_ROOTFS into the update-mandb postinst scripts yields this:

D="/home/pidge/poky/build/tmp/work/qemux86_64-poky-linux/core-image-base/1.0/sdk/image/usr/local/oe-sdk-hardcoded-buildpath/sysroots/core2-64-poky-linux"
IMAGE_ROOTFS="/home/pidge/poky/build/tmp/work/core2-64-poky-linux/eudev/3.2.12/rootfs"

Even if we were relying on an IMAGE_ROOTFS that pointed to what we 
expected, it is probably the wrong option here because there is no 
assurance it's populated with a passwd file when we run bitbake 
core-image-base -f -c do_populate_sdk. I've checked on my setup and have 
verified that it doesn't contain anything at that stage.

In my patch $D is actually set to ${SDK_OUTPUT}/${SDKPATHNATIVE} (not 
recipe-sysroot, I'll correct this in the log) which incidentally is also 
the same place we're running mandb from.

Cheers,

-e

> 
> Cheers,
> 
> Richard

-- 
Eilís 'pidge' Ní Fhlannagáin
BayLibre - At the Heart of Embedded Linux
www.baylibre.com


