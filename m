Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D75EB64DD
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 20:00:26 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.279.1689883218154038371
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 13:00:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=y/bwiorq;
 spf=pass (domain: baylibre.com, ip: 209.85.222.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-76754b9eac0so118403185a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 13:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689883217; x=1690488017;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S8+u+6OkmcaHMbvL+IC5cH7oK/sUg+tHz53h/Q5HpUI=;
        b=y/bwiorq1EgLP2VXrYtL0dt9JP9t01SgQlsdfRf8VU+OKlNbmSK5rf8Kj8PwPN6VT6
         kS14TNc4bqqeAZ5QmHVnqUwSkN6Ku5jx2dtXLyk/m3zhYXlpOTMscVAQf5BkIIaoT+VD
         RLDkr8Jedc5QDVtguNOd8FP0pl2FjvGtWLziSWPPSUJ5FSKOZZhNW06Sq5NZsHBnCEW3
         RnWRmO5t+RQf+vH7g5fMiEi17zP/rTMXmQV8Ia0LkwCHIQXdMCd51S8fbpBudhdQ8kl4
         ne3hFiX2dQvmJP1xY8GUXrqrJPFaGotX5uqMQ3MBlx9JPQht5WvBmZxTx0X69DDuKNTj
         k35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689883217; x=1690488017;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S8+u+6OkmcaHMbvL+IC5cH7oK/sUg+tHz53h/Q5HpUI=;
        b=UrAc+HvqIt6K5MWfHKmSywDptd20Hdd0UH584bObgISW7oh9grXfHiCmrllJ4efBLJ
         9Er6gFV5ZweGviE2pKTTz14v4K00FFRVMdcwFaOZUex0vzdcjaogwZAh1brQJPonzj/x
         +kLSZf/heoh67R9Yo+XMEKvhxg7YbgvXNwuCR9xxjm8lssvK9eVoQIVLUdp3RJyjLk1N
         0BHZLlEJovJ9wfFVCZv79YSXv0I/OM/jRKjxiiVEI1oGReKd2mbr8fTVPAYmUTDlEtMh
         8rCCli09xr2GrXYT3QVBjCZvIvHxghXsNJRQ7rINpahuEUBnzZEyOEusELJX/Kh/YnbM
         9cXQ==
X-Gm-Message-State: ABy/qLbhaL7GwVJRcZve3Wj62LRmGyheODhrjzkQWSTn7qk8nywzosJC
	3r9VOXUJwjLI+cH1AzIc64JwiA==
X-Google-Smtp-Source: APBJJlHLyPH/32yEuNOj1Mb0s3I0lEpRasmmlFlOZV7vANN5o2LKt02z7fcuaC9UKFrB//KR5RIo3g==
X-Received: by 2002:a37:ad16:0:b0:75b:23a0:e7e7 with SMTP id f22-20020a37ad16000000b0075b23a0e7e7mr6118302qkm.72.1689883216795;
        Thu, 20 Jul 2023 13:00:16 -0700 (PDT)
Received: from ?IPV6:2001:1970:5b1f:ab00:d875:6297:4e81:e577? ([2001:1970:5b1f:ab00:d875:6297:4e81:e577])
        by smtp.gmail.com with ESMTPSA id z9-20020a0cf249000000b005ef81cc63ccsm680483qvl.117.2023.07.20.13.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 13:00:16 -0700 (PDT)
Message-ID: <eb956cf6-5c78-b4bc-3b05-5eb396217b93@baylibre.com>
Date: Thu, 20 Jul 2023 16:00:15 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [OE-core][PATCH] iproute2: upgrade 6.3.0 -> 6.4.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230720192620.1853222-1-tgamblin@baylibre.com>
 <CANNYZj91P7JLE_Gk0pGi6sJqZDfXo28SFw1W7e1faLTYP=6ZRQ@mail.gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CANNYZj91P7JLE_Gk0pGi6sJqZDfXo28SFw1W7e1faLTYP=6ZRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 20:00:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184658


On 2023-07-20 15:46, Alexander Kanavin wrote:
> Please do not add Pending patches, if they're not actually pending
> anything. You should submit upstream ahead of submitting to oe-core.
I'm going to attempt submitting it upstream, but I should've clarified 
that I am going to do so. I talked to the author and they said to go ahead.
>
> Alex
>
> On Thu, 20 Jul 2023 at 21:26, Trevor Gamblin <tgamblin@baylibre.com> wrote:
>> Changelog: https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/log/
>>
>> Added a patch for including limits.h with musl builds, or else
>> we get failures such as:
>>
>> | mdb.c: In function 'mdb_parse_vni':
>> | mdb.c:666:47: error: 'ULONG_MAX' undeclared (first use in this function)
>> |   666 |         if ((endptr && *endptr) || vni_num == ULONG_MAX)
>> |       |                                               ^~~~~~~~~
>> | mdb.c:666:47: note: 'ULONG_MAX' is defined in header '<limits.h>'; did you forget to '#include <limits.h>'?
>>
>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> ---
>>   .../0001-bridge-mdb.c-include-limits.h.patch  | 31 +++++++++++++++++++
>>   .../{iproute2_6.3.0.bb => iproute2_6.4.0.bb}  |  3 +-
>>   2 files changed, 33 insertions(+), 1 deletion(-)
>>   create mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-bridge-mdb.c-include-limits.h.patch
>>   rename meta/recipes-connectivity/iproute2/{iproute2_6.3.0.bb => iproute2_6.4.0.bb} (95%)
>>
>> diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-bridge-mdb.c-include-limits.h.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-bridge-mdb.c-include-limits.h.patch
>> new file mode 100644
>> index 0000000000..0330163ae5
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/iproute2/iproute2/0001-bridge-mdb.c-include-limits.h.patch
>> @@ -0,0 +1,31 @@
>> +From 3d6fee6b55992d185f3af4f254b86ea1ac11acfe Mon Sep 17 00:00:00 2001
>> +From: Trevor Gamblin <tgamblin@baylibre.com>
>> +Date: Thu, 20 Jul 2023 14:32:23 -0400
>> +Subject: [PATCH] bridge/mdb.c: include limits.h
>> +
>> +Upstream-Status: Pending
>> +
>> +Based on
>> +https://git.alpinelinux.org/aports/commit/main/iproute2/include.patch?id=bd46efb8a8da54948639cebcfa5b37bd608f1069,
>> +but the author has no plans to submit it upstream.
>> +
>> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> +---
>> + bridge/mdb.c | 1 +
>> + 1 file changed, 1 insertion(+)
>> +
>> +diff --git a/bridge/mdb.c b/bridge/mdb.c
>> +index fbb4f704..18793458 100644
>> +--- a/bridge/mdb.c
>> ++++ b/bridge/mdb.c
>> +@@ -15,6 +15,7 @@
>> + #include <string.h>
>> + #include <arpa/inet.h>
>> + #include <netdb.h>
>> ++#include <limits.h>
>> +
>> + #include "libnetlink.h"
>> + #include "utils.h"
>> +--
>> +2.41.0
>> +
>> diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb
>> similarity index 95%
>> rename from meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb
>> rename to meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb
>> index 892fa854da..32e2f8176b 100644
>> --- a/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb
>> +++ b/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb
>> @@ -13,9 +13,10 @@ DEPENDS = "flex-native bison-native iptables libcap"
>>
>>   SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
>>              file://0001-libc-compat.h-add-musl-workaround.patch \
>> +           file://0001-bridge-mdb.c-include-limits.h.patch \
>>              "
>>
>> -SRC_URI[sha256sum] = "dfb2a98db96e7a653cffc6693335a1a466e29a34b6ac528be48f35e1d2766732"
>> +SRC_URI[sha256sum] = "4c51b8decbc7e4da159ffb066f590cfb93dbf9af7ff86b1647ce42b7c179a272"
>>
>>   inherit update-alternatives bash-completion pkgconfig
>>
>> --
>> 2.41.0
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#184656): https://lists.openembedded.org/g/openembedded-core/message/184656
>> Mute This Topic: https://lists.openembedded.org/mt/100263035/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

