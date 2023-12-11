Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FEBEC10DC3
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 08:02:31 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.3571.1702281748739612459
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Dec 2023 00:02:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=Wg40Sg92;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3335397607dso4752241f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 00:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1702281747; x=1702886547; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O3Z0tSdBvyg91c8ijH5LpGkaWdFXCbmbpC6pGdUgUaU=;
        b=Wg40Sg92KsJ1hsAe6dR6Sjki1Ha7ig8/+Is8MbKjhWPEoKuep4iCsZ9BU3q4VZcy7k
         kf714sFIvkelG5bz8+ooEoQEUAYBY3rRbuqUCC/WVrme+IhX6S0BKj3IpRZlIJc4FJ0d
         oSSBH/KtOaR75R5uDjIjg97+T3Hl8YNGpP14lj7ZaKzYACqVwuxvZqKOvJbCWPVGz6Bn
         F5wfCxI2b2DtuiaYeshBpfdW1V7q0VDkD7Fo+tXGp0fkG5m3KiOVpnRNxPX+2dIYEtzH
         yb5wmv4Z9uSek2GBh3q4RpunMs4KfFe7SVgp4p6VlJzC2oGM2pRZYMwUaIM2RaFejGm5
         lpGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702281747; x=1702886547;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O3Z0tSdBvyg91c8ijH5LpGkaWdFXCbmbpC6pGdUgUaU=;
        b=IxmJHIPz5J07NFbazPITe7I9nAVZ80jkiYDKkaibRZXgnCUTlpLRefst9iQMFfkPUe
         ABk9q+CF+ukCnFqu60gyxcIl53Rt7jl1M10F3kaYJsrXws5NlX+qGkZ+uDKcBh6OeMhV
         blHWPO3Jvq3ox2wFFjOUWwoIzAPdOaHI5Y8JL7iFdM95Qc5raFzBd0ID7hF0p9eQuQO4
         lpZnPeRXa65lUE1O3UmHlcUbrJsbgsOax3hrVgrvto1wPMNLNqVqs9g1hOIL4XK7dfGC
         F7Ngo7Z3cKSxQgNjftUqzR51JPfvUYiIxeeLxEFnOYSmkdk+hnUiujh9UhLXNUSF5h9O
         Iqsw==
X-Gm-Message-State: AOJu0YzpF81ix4Yj8IQZpciNVFVwciOmTZqe/TB+FypDZM8/ur7iRwnU
	9HtA3N1/gh1XOfJPr/TJCPkcNQ==
X-Google-Smtp-Source: AGHT+IGaqrXGWmYVQDJK+XsWJ/o1e+lna1D3A/Mbw/d4J5kpAQ2BKKtHBWrPpbw5snV/ui3OjQWLPQ==
X-Received: by 2002:a5d:4887:0:b0:333:2fd2:2f0a with SMTP id g7-20020a5d4887000000b003332fd22f0amr1730245wrq.131.1702281747090;
        Mon, 11 Dec 2023 00:02:27 -0800 (PST)
Received: from [192.168.0.28] ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id q1-20020a5d5741000000b0033334c3acb6sm7865916wrw.98.2023.12.11.00.02.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 00:02:26 -0800 (PST)
Message-ID: <a11d36d5-5151-404d-8065-f68cb2eadd19@smile.fr>
Date: Mon, 11 Dec 2023 09:02:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [master] [PATCH] cve-update-nvd2-native: increase the
 delay between subsequent request failures
Content-Language: en-US
To: Yuta Hayama <hayama@lineo.co.jp>, dnagodra@cisco.com,
 openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
References: <20231208050439.461257-1-dnagodra@cisco.com>
 <581f915c-39e0-41fe-8258-84739b5ace41@lineo.co.jp>
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <581f915c-39e0-41fe-8258-84739b5ace41@lineo.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 08:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192146

Hello,

Le 11/12/2023 à 08:51, Yuta Hayama a écrit :
> Hi,
> 
> On 2023/12/08 14:04, Dhairya Nagodra via lists.openembedded.org wrote:
>> Sometimes NVD servers are unstable and return too many errors.
>> There is an option to have higher fetch attempts to increase the chances
>> of successfully fetching the CVE data.
>>
>> Additionally, it also makes sense to progressively increase the delay
>> after a failed request to an already unstable or busy server.
>> The increase in delay is reset after every successful request and
>> the maximum delay is limited to 30 seconds.
>>
>> Also, the logs are improved to give more clarity.
>>
>> Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>
> 
> I was just working on a similar issue.
> As a specific example, multiple cve-update-nvd2-native:do_fetch runs in
> parallel can easily reach the rate limit. It can be assumed that this situation
> will occur if several people run bitbake in one office. (often unaware of each
> other...)
> 
> I have observed the do_fetch logs and found that HTTP 403 errors are returned
> if the request is blocked, probably due to rate limitation.

Shouldn't we ask the NVD to return "429 Too Many Requests" instead?
https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/429

> NOTE: Requesting https://services.nvd.nist.gov/rest/json/cves/2.0?startIndex=6000
> NOTE: CVE database: received error (HTTP Error 403: Forbidden), retrying
> NOTE: CVE database: received error (HTTP Error 403: Forbidden), retrying
> NOTE: CVE database: received error (HTTP Error 403: Forbidden), retrying
> NOTE: CVE database: received error (HTTP Error 403: Forbidden), retrying
> NOTE: CVE database: received error (HTTP Error 403: Forbidden), retrying
> WARNING: CVE database update failed
> DEBUG: Python function do_fetch finished
> 
> Other times a request may fail with IncompleteRead, but this is clearly
> distinguishable from an HTTP error.
> 
> Here, we can think of the following ideas.
> If an HTTP error occurs, assume that the rate limit has already been reached
> and wait 30 seconds to ensure that the next window starts. The patch will be
> something like this.
> 
> ---
>  meta/recipes-core/meta/cve-update-nvd2-native.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Regards,

-- 
Yoann Congal
Smile ECS - Tech Expert

