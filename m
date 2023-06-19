Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DCF1EB64DB
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 12:28:43 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.6218.1687177720206936133
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jun 2023 05:28:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=gEZA4uFE;
 spf=pass (domain: baylibre.com, ip: 209.85.221.52, mailfrom: lrannou@baylibre.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-31121494630so3945959f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 05:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1687177718; x=1689769718;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b0+t6UCAISCMcFuElmPLECsnFRx7V43DFryO6xH0EUo=;
        b=gEZA4uFEl4z9yEuaDCVdAOARjkiaygRs0ZE43f13UToRVZe4u+aZ+1g62DKt3aAU3I
         gZQbBl2Hm0Xyvh12qc+5mdnioG50G5yoOGg09mkx6a8fPxo1KYfFIipJT5eDzR36Isrk
         mG2IYN1+Mj6+9vPVQBey/sIJa0tX074KH15/K6k4TTWVR19Gx/zrsgXRHUpCvFIAlgD2
         0y/9w6gwrSJlgbrwIt+oD/4g4oshysfMxBW0J5HNbFnF8ZcmnXcRXg5q97zQKP96Kuz0
         TC+7GIExunGmJmd49I6ODugzYGbI/eAPcsE5JbK7PHthdbnr6J1+FjnJ2HUZM746/2m6
         TnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687177718; x=1689769718;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b0+t6UCAISCMcFuElmPLECsnFRx7V43DFryO6xH0EUo=;
        b=jJo5MHWl2LBFfJML52nnmuSEPi6ArDrRFtnIM/5e/nQSy64Lp53qq9OUTKMyB6QItj
         FKZGJodGlK/DWbd2X/npmJvjVZruz9IXxIQD8JiG7slg/5inb3bOCOO0oGq/FgT4ZNYQ
         MNcqE1erc0AwtTak1UW2BitWbQ/BFxIZtAXu+3DgMQFXpo7HFFLkCv8+chRzx5ZHMeXa
         kUEFkJg2VQYNXDTHQlpau4epWvfFrVGOMMz0PzyYom/CYdqqwlv7hVFs3n03T9hYS7B2
         AcEeLLoWkzZUvZpfh/Q+eiFR7Nv7aOwj5o7QEpLkT2eDkdiLSv+Qv5R4avswU06eut6j
         Wl/w==
X-Gm-Message-State: AC+VfDz/OxO+HbjS8aIoHPIMB7RzCiMynlUCP67QmbbWAAbrhEu2ja3H
	HA8NdjQezBePNSCbOt7t/TdH3w==
X-Google-Smtp-Source: ACHHUZ4e/afXJY9ax8KZoNjwDruzBSxg28YyjD0VUUJMceWSqapFaDw94goHtB+DNTsaIXPnKKBQXg==
X-Received: by 2002:a5d:4643:0:b0:30e:4a21:808b with SMTP id j3-20020a5d4643000000b0030e4a21808bmr7918521wrs.55.1687177718568;
        Mon, 19 Jun 2023 05:28:38 -0700 (PDT)
Received: from [172.30.105.10] (lmontsouris-658-1-109-35.w92-154.abo.wanadoo.fr. [92.154.6.35])
        by smtp.gmail.com with ESMTPSA id q7-20020adff947000000b0030af72bca98sm31332210wrr.103.2023.06.19.05.28.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 05:28:38 -0700 (PDT)
Message-ID: <ee772c69-22a6-9add-afbe-89c55e0026c7@baylibre.com>
Date: Mon, 19 Jun 2023 14:28:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [OE-core] [PATCH 3/3] base-passwd: add the wheel group
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, anuj.mittal@intel.com
References: <20230613-sysusersd-v1-0-eaddf3179773@baylibre.com>
 <20230613-sysusersd-v1-3-eaddf3179773@baylibre.com>
 <20230618093724c7508d8b@mail.local>
From: Louis Rannou <lrannou@baylibre.com>
In-Reply-To: <20230618093724c7508d8b@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 12:28:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183105



On 18/06/2023 11:37, Alexandre Belloni wrote:
> On 15/06/2023 13:43:55+0200, Louis Rannou wrote:
>> The wheel group is not declared while it can be used to access the systemd
>> journal and to configure printers in CUPS. It can also be used for su and sudo
>> permissions.
>>
>> So far it was created later in the rootfs postcommand systemd_create_users.
>>
>> Signed-off-by: Louis Rannou <lrannou@baylibre.com>
>> ---
>>   .../base-passwd/0007-Add-wheel-group.patch           | 20 ++++++++++++++++++++
>>   meta/recipes-core/base-passwd/base-passwd_3.6.1.bb   |  1 +
>>   2 files changed, 21 insertions(+)
>>
>> diff --git a/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch b/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch
>> new file mode 100644
>> index 0000000000..00eaec38a2
>> --- /dev/null
>> +++ b/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch
>> @@ -0,0 +1,20 @@
>> +
>> +We need to have a wheel group which has some system privileges to consult the
>> +systemd journal or manage printers with cups.
>> +
>> +Upstream status says the group does not exist by default.
> 
> This should be rephrased because it causes:
> 
> Malformed Upstream-Status 'Upstream status' (meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch)
> Unknown Upstream-Status value 'says' (meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch)
> Patches missing Upstream-Status: 0 (0%)
> Patches with malformed Upstream-Status: 1 (0%

Sorry for that. I didn't expect it would parse any line starting with 
Upstream status...

> 
> 
>> +
>> +Upstream-Status: Inappropriate [enable feature]
>> +
>> +Signed-off-by: Louis Rannou <lrannou@baylibre.com>
>> +Index: base-passwd-3.5.26/group.master
>> +===================================================================
>> +--- base-passwd-3.5.29.orig/group.master
>> ++++ base-passwd-3.5.29/group.master
>> +@@ -38,5 +38,6 @@
>> + staff:*:50:
>> + games:*:60:
>> + shutdown:*:70:
>> ++wheel:*:80:
>> + users:*:100:
>> + nogroup:*:65534:
>> diff --git a/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb b/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb
>> index 853717176d..204016b3e7 100644
>> --- a/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb
>> +++ b/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb
>> @@ -12,6 +12,7 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
>>              file://0004-Add-an-input-group-for-the-dev-input-devices.patch \
>>              file://0005-Add-kvm-group.patch \
>>              file://0006-Make-it-possible-to-configure-whether-to-use-SELinux.patch \
>> +           file://0007-Add-wheel-group.patch \
>>              "
>>   
>>   SRC_URI[sha256sum] = "6ff369be59d586ba63c0c5fcb00f75f9953fe49db88bc6c6428f2c92866f79af"
>>
>> -- 
>> 2.41.0
>>
> 
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#182849): https://lists.openembedded.org/g/openembedded-core/message/182849
>> Mute This Topic: https://lists.openembedded.org/mt/99546759/3617179
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
> 
> 

Louis

