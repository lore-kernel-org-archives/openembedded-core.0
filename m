Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 212C6C6FA8F
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 14:04:23 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.14783.1693404253374023362
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 07:04:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=L+2QPrtM;
 spf=pass (domain: baylibre.com, ip: 209.85.221.42, mailfrom: pidge@baylibre.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-31ae6bf91a9so4694622f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 07:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1693404251; x=1694009051; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TgxqNf0Rw88dq9yLg2aKyrOKDiJtLQQf2mlhIIEkbP4=;
        b=L+2QPrtMmLNZNzNXgRg4EDFF3DXcjQkuaJpQ/laZgZp8KkSe7E+nyAxX5nbeI/Qm3O
         PzbdfG1kQV2TuCn9lqCR+vT4wvZtG4tllIZahIh+DGgcwHf42zi7Y93e06R+ZggxCr9s
         U6l1QJEydruapQBNtSiLaaj4MWeDa3+d4fovWRIaaDnLyYH4jLNJjDlB1b8T2S3SnQEP
         qKQABWtvE4kDy7CyglasfRmUV6D1oQzEuaNN4r08SJ9z1HcmUQ4CE0YBwYMNmZYBPTTj
         5BCk/2LDrBIytaeQ38kaNQE/juIqJ17wcE+DlPOiUz4TKKlEhiQECag8TX8BGudndkQF
         qpBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693404251; x=1694009051;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TgxqNf0Rw88dq9yLg2aKyrOKDiJtLQQf2mlhIIEkbP4=;
        b=c3okGjnya4AP8wOlT13XNYlb+QkhSs9eqosgNzbdjWgS19dQe7FdwB38fBl50J6A5o
         Oi4lPmyCr/cEo2A49/+34dzrtSJ0AYq6xltyVqAA+J3uijoWGPzmKd7UYf3VYSreibDf
         y7YlVIpj8tWWSleTNGNtIowKzHP80Qcg0nh5Lk29X4Vt/e/n6JJ+9hYHIFMRD2WJ5lUA
         JJsVZXad+0eQ59CcKU3vVVz+m5WSeUVEdLASht2WZAExhoVnBZ2BFPJI7RA2p80G1WWD
         bn+V9XmG+21rPMSy0SKguXk0d0hSALgq6q18wK7Lv5Y5ePsn8TvhLd6eTRQ0HdzFegZo
         9GIA==
X-Gm-Message-State: AOJu0YxdnvAyA0ouJv4wLpBZoku1tV69V8ldFK9180g5rDviW3EDeuUV
	hY0lmEMikJ17ETMiZc7Q1AgO2w==
X-Google-Smtp-Source: AGHT+IF5pODgXuP+kn+k7XfJIb/heEsPMuJ/P0ScikGvspcj+m1nSxEP9q2qgtYGJiXeug7w5300pA==
X-Received: by 2002:a05:6000:110e:b0:313:e88d:e6cf with SMTP id z14-20020a056000110e00b00313e88de6cfmr1529510wrw.69.1693404251189;
        Wed, 30 Aug 2023 07:04:11 -0700 (PDT)
Received: from [192.168.178.55] ([194.110.145.184])
        by smtp.gmail.com with ESMTPSA id m17-20020a5d6a11000000b003141a3c4353sm16713344wru.30.2023.08.30.07.04.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 07:04:10 -0700 (PDT)
Message-ID: <1923dbe0-a0a6-275d-459d-895aecdd2463@baylibre.com>
Date: Wed, 30 Aug 2023 15:04:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core] [PATCH] update_mandb: Point to correct /etc/passwd with
 man
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20230830123912.2052665-1-pidge@baylibre.com>
 <6965c5634e674335fcfc02e2540d5c2e0bd1caf3.camel@linuxfoundation.org>
Content-Language: en-US
From: =?UTF-8?B?RWlsw61zICdwaWRnZScgTsOtIEZobGFubmFnw6Fpbg==?=
 <pidge@baylibre.com>
In-Reply-To: <6965c5634e674335fcfc02e2540d5c2e0bd1caf3.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 14:04:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186889

On 30/08/2023 14:19, Richard Purdie wrote:
> On Wed, 2023-08-30 at 12:39 +0000, Eilís 'pidge' Ní Fhlannagáin wrote:
>> [YOCTO #15023]
>>
>> In this instance (do_populate_sdk with api-documentation turned on),
>> pseudo is going to end up finding the passwd/groups files in
>> recipe-sysroot-native which is incorrect and does not have man. The
>> solution here should be to ensure that pseudo points to the passwd/groups
>> files in recipe-sysroot (which does have man:man).
>>
>> Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
>> ---
>>   scripts/postinst-intercepts/update_mandb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/scripts/postinst-intercepts/update_mandb b/scripts/postinst-intercepts/update_mandb
>> index a061bb426a6..6bc073bfff5 100644
>> --- a/scripts/postinst-intercepts/update_mandb
>> +++ b/scripts/postinst-intercepts/update_mandb
>> @@ -13,4 +13,4 @@ PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D $D${bindir}/mandb --config-file $C
>>   
>>   rm -f $CONFIG
>>   
>> -chown -R man:man $D${localstatedir}/cache/man/
>> +PSEUDO_PASSWD=$D chown -R man:man $D${localstatedir}/cache/man/
> 
> Is there a more general problem here? Wouldn't this issue apply to
> other postinst scripts too?

Yes and No. The other postinst scripts if they do attempt to chown, are 
trying to do it for root:root (which recipe-native-sysroot's passwd and 
groups obviously have). We could add this to the others as well, just to 
maintain consistency.

This is all because in image.bbclass, we're setting PSEUDO_PASSWD to 
STAGING_DIR_NATIVE which I believe normally should be correct, except in 
an instance like this.

-e

> 
> Cheers,
> 
> Richard

-- 
Eilís 'pidge' Ní Fhlannagáin
BayLibre - At the Heart of Embedded Linux
www.baylibre.com


