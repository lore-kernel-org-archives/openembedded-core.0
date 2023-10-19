Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18029CDB483
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 14:35:11 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.29557.1697726107228283228
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 07:35:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=zSctaxf2;
 spf=pass (domain: baylibre.com, ip: 209.85.222.182, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-77386822cfbso537147185a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 07:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697726106; x=1698330906; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aI12+1u62rTUPKDlar/0HkPLX6Ev1oe+wUPHvlh7WUw=;
        b=zSctaxf2l3N7w84QE0no0xEgI8b3TJ8pvgqSVGtWV+RRdJbs5bXqYKTa3LbP76XqqW
         x8s10IHVwLOeBmW25P0W0I7P7/Y3p+Kg4nlb5OpJXxGIFxZuSB0rnc88Jz95rdbanqrT
         4MhLVrfEWXv8CggX+7D3w37UnMapSI9jNbJuzkSZ3dPQVtj6chhxiHnAHP/PElMqJYAH
         Gti9XAiCBrY3n1gPrPcmf5iFNAGOsyx1RLzZtr7S0U1KLeKiMmgPsiOxA1Twrd/n+mau
         TTV3aGuXct6qZc6u6W+wo0psx2ITDRD8B5UkgiepFhlnkzp5693SNVne3+uXbj/0jVlp
         SlzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697726106; x=1698330906;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aI12+1u62rTUPKDlar/0HkPLX6Ev1oe+wUPHvlh7WUw=;
        b=ZATq2cq0FgA2u5O6leUV5i8Ykp7bNwzVlgnxkf2vN9Kzb0cPLxW9BxtAiPOp/T/trk
         vOIoyTn4oMIhbRZST8SVYKeSm6Tx5/4cuJ2lnddHUxPObkWTQw2KCl/VbGIdlhi+AuPy
         QOJKUB43Ao16SIShUTxthdeRnTokSgeP2fSpWhsXblyBbeo4ptqo/qo2swUUjWwo/BiR
         O7ZBKgrgshWKBcTOSblO0SOksHXW1NjpZ5Qz3wFbLuzDGcfc4Vc8ZNn9c0ysHEzWn1+1
         akklsdnd9ru5XFNpkqRObWYx/ApiHjQ90sUcuqKyTcOq7tGrpYsZOtMXNd7IFlY9+XI5
         Vhyg==
X-Gm-Message-State: AOJu0YxlJtJu3uuuWAhw7RcQxMrlgE2WPLbXMTWIQPs7FNJqMh5qeokN
	1DRHu1LUAw25TBtUGWIm4egRew==
X-Google-Smtp-Source: AGHT+IGAU2G+rbb8f9rhdWZo/qg9t25WhexBse7TQOLJEhsiHiy/L9DzLvo426yfQ53/GMZZQSomCg==
X-Received: by 2002:ad4:4eae:0:b0:66d:2064:c7ee with SMTP id ed14-20020ad44eae000000b0066d2064c7eemr3370222qvb.20.1697726106200;
        Thu, 19 Oct 2023 07:35:06 -0700 (PDT)
Received: from ?IPV6:2001:1970:5b1f:ab00:d875:6297:4e81:e577? ([2001:1970:5b1f:ab00:d875:6297:4e81:e577])
        by smtp.gmail.com with ESMTPSA id z14-20020a0cf24e000000b0066d1e71e515sm805246qvl.113.2023.10.19.07.35.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 07:35:05 -0700 (PDT)
Message-ID: <6081c7f6-0aa2-4c55-9ab4-beb5a00bf892@baylibre.com>
Date: Thu, 19 Oct 2023 10:35:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] patchtest: sort when reading patches from a
 directory
To: Ross Burton <ross.burton@arm.com>,
 openembedded-core@lists.openembedded.org
Cc: nd@arm.com
References: <20231019134054.2524949-1-ross.burton@arm.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20231019134054.2524949-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 14:35:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189465


On 2023-10-19 09:40, Ross Burton wrote:
> From: Ross Burton <ross.burton@arm.com>
>
> When reading patches from a directory it's important to sort the output
> of os.listdir(), as that returns the files in an effectively random
> order.  We can't test the patches apply if they're applied in the wrong
> order, and typically patch filenames are prefixed with a counter to
> ensure the order is correct.
Thanks for the patch. I like this as a general improvement and 
preparation for future fixes, but this might not have the results you're 
expecting (right now) - patchtest currently has a known limitation where 
it only tests patches one-at-a-time, so if you have multiple patches 
depending on previous entries in the series, they will not apply them in 
the sequence and you may get erroneous failures for the merge-on-head 
test. That's on the roadmap for upcoming improvements.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   scripts/patchtest | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/patchtest b/scripts/patchtest
> index 642486b8c7f..c47b05b7d47 100755
> --- a/scripts/patchtest
> +++ b/scripts/patchtest
> @@ -172,7 +172,7 @@ def main():
>       patch_list = None
>   
>       if os.path.isdir(patch_path):
> -        patch_list = [os.path.join(patch_path, filename) for filename in os.listdir(patch_path)]
> +        patch_list = [os.path.join(patch_path, filename) for filename in sorted(os.listdir(patch_path))]
>       else:
>           patch_list = [patch_path]
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189459): https://lists.openembedded.org/g/openembedded-core/message/189459
> Mute This Topic: https://lists.openembedded.org/mt/102060105/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

