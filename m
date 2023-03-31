Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D57EDC76196
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 07:50:36 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.49302.1680249032817046539
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Mar 2023 00:50:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112 header.b=g+5ez1J8;
 spf=pass (domain: baylibre.com, ip: 209.85.128.53, mailfrom: lrannou@baylibre.com)
Received: by mail-wm1-f53.google.com with SMTP id l15-20020a05600c4f0f00b003ef6d684102so9461965wmq.3
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 00:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680249031;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kM+wSS5+g3NImDhJBnnMHYSyu6CCNag62kQtKVrNs7w=;
        b=g+5ez1J8XgdS+57AfULnazPhEdbIAzRZMM+862FM/1ZzdjFBRUYjnGaKFT7grXQ/b2
         peZTSzNl+19biVfZIvRtvzGFgX7DWZ1FN07XLXvAG7AOj5sjs0/PRFnxm3rjg8J9b/HB
         J28NMQuQRjnMN6eAugPdBYspbD+c2QIttRIRXFYgkmmSyQ1t6jvmlp/GCPwWrOrtGI/K
         DkRXzGEZ5SwzL5ba6sHcp54IDLqSHD4OQPsPjRaZpRlQ+X/O6Utw9z1v91qJWjGQswRf
         PiBAJEy4b6XUpvtY5w3dG1dcg/MIKYNrbmBMcSeFmf6f+JlUynL4uHVk06ZG44qST2dm
         vk7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680249031;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kM+wSS5+g3NImDhJBnnMHYSyu6CCNag62kQtKVrNs7w=;
        b=6FOJAPwnxLxKfW27DhBKLE3lEGdCNjJ4SXItKxT9ys42tHtiF2ixEOqzm/uvMxSEet
         KTSxjgEl2RLa0XFy2h+gqwFZDRDQBIkvw+kEJ/bWITDWQCse7doXiPaCayFv09cDLwha
         PyXWCqkBz0a/VyVyqenyxG2BKCwPOTAhopsmk52j3snGSwM4VYIO5UPriUvaW/yokpzd
         C0BxtyByZUD2ypF9wqa8ls5XERdDKZwSRi8sTZm1tA3mu6+lpt0eVZEkDoftm9c+x9b1
         UrNjDItALIcHLksdvadbzGxZ5nDyo+YUns9kphJT4KVQ87y+xGKwbqTXKZ2EDucbvHZ7
         Ml3Q==
X-Gm-Message-State: AAQBX9ecZDzMu4QroDRcibQIpzITY9q3217iusXfOfiOhcahhhNp+3qu
	ekT5X7OXwBwHZjL+sYnJEa2bzA==
X-Google-Smtp-Source: AKy350ZG9ZcsSq7UOtrvZ/p1scKh9EuVJAij7QGMC4vZmtL7+MUaR1OPLwTDBazdSAR4hngvEJSrdg==
X-Received: by 2002:a05:600c:1c0e:b0:3f0:3144:89d9 with SMTP id j14-20020a05600c1c0e00b003f0314489d9mr4516425wms.20.1680249030920;
        Fri, 31 Mar 2023 00:50:30 -0700 (PDT)
Received: from [172.30.105.10] (lmontsouris-658-1-109-35.w92-154.abo.wanadoo.fr. [92.154.6.35])
        by smtp.gmail.com with ESMTPSA id g19-20020a05600c311300b003ee74c25f12sm8797948wmo.35.2023.03.31.00.50.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 00:50:30 -0700 (PDT)
Message-ID: <1c449008-fc52-4111-847d-00d3604e2bef@baylibre.com>
Date: Fri, 31 Mar 2023 09:50:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [OE-core] [PATCH v2 0/1] Change the serial runner usage
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: khilman@baylibre.com
References: <20230303090139.207454-1-lrannou@baylibre.com>
 <8cb5371cbfacac03d340142b36511a73834669d0.camel@linuxfoundation.org>
From: Louis Rannou <lrannou@baylibre.com>
In-Reply-To: <8cb5371cbfacac03d340142b36511a73834669d0.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 07:50:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179403

On 29/03/2023 12:53, Richard Purdie wrote:
> On Fri, 2023-03-03 at 10:01 +0100, Louis Rannou wrote:
>> The actual serial runner has a different usage compare to the ssh runner. The
>> return status is different and failure are not raised as exceptions.
>>
>> Initially, I wanted to create a new run_serial_socket and modify the old
>> run_serial to use the former. And there was a second patch that changed every
>> call to run_serial to run_serial_socket. But that is not easy as each test
>> can have a different manner to handle the exception.
>>
>> Therefore, this patch only suggest a new runner and add a comment to deprecate
>> the former runner.
>>
>> Louis Rannou (1):
>>    oeqa/utils/qemurunner: change the serial runner usage
>>
>>   meta/lib/oeqa/targetcontrol.py    |  3 ++
>>   meta/lib/oeqa/utils/qemurunner.py | 57 +++++++++++++++++++++++++++++++
>>   2 files changed, 60 insertions(+)
> 
> Sorry about the late reply to this. I think the idea of the new runner
> is great and we should improve and clean this up.
> 
> As the patch stands, it creates a largely duplicate function with no
> users. Experience shows this tends to bitrot quickly.
> 
> For that reason I'm reluctant to take just this change without
> converting at least some of the existing users to use the new API.
> 
> Ideally we'd convert everything but at the very least the new function
> should be usable by a decent chunk of the existing code, even if we
> have to adjust it to make that work.

Hello,
You're right. I'll send a v3 changing some tests using that serial runner.

Thanks,
Louis

