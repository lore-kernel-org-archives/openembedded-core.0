Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45063EB64D7
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 16:52:38 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.38940.1687515692908944762
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 03:21:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=NrSa2g3Z;
 spf=pass (domain: baylibre.com, ip: 209.85.128.47, mailfrom: pidge@baylibre.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3f90b4ac529so6353745e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 03:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1687515691; x=1690107691;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vmIxaNW5FVAWCrm5PkxdrMR+CiW4sqa9Ln6cw2lKwSA=;
        b=NrSa2g3ZlVdkUUz2bTvTjZ28hT0Vdx421SR1Lj9CaEnd08Tgev8GWuKFNkUfCjbzlx
         aSKyy6RfVI2uuwQzf+Azge2kfWsVieL5k6cXOeYBYqnLY0s+Tedgj3fOtxu8IZILCjgT
         KPxK/jAgW4HU7x3HQJBEl18ZVL21ZymPbTahscHrA37DQxyUkn6QzZy73U3/LMIX4HuN
         APwK6wFu9bRf900VNjFybSPpg8yjn+j/Nb/Pzv3KPJYubNbDWeDNWiJmPvuhytLF5H5+
         80cKw3sECRR8fjuORRsftYOB79/7dxDG6yslG8XyIQ41ywsS4T5468ynToOeuwA34l9g
         nX6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687515691; x=1690107691;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vmIxaNW5FVAWCrm5PkxdrMR+CiW4sqa9Ln6cw2lKwSA=;
        b=g1QqezLVNoD5ZEUw4D1krZR4LAgzeK0hiZ5dNQvOQUBHPXYvm+ZdkskgLAxwSCEd6k
         tVZ97oT0stTVcfh1nw98GLxjC+82a7A0Bl+zjArqpqROejmBLkvwaBayZnuT/w8DSUGI
         A5dB7mu9/oEpcuFBVxfbmV5rqok/069CkrZchkTaSWQGA+BlPIp1RkXQHC2nZBQl8we0
         rBVwgD5gU/Ju8SfscInPuipLBKNo03xBVyapvQynGfS+TSrWSPBv8KBLK1AwJ0z7g7bN
         xr1Xxkm0n+WislTGivpRBkkX+jPxqvV41eEU88YMHMj2dgSdZurzvWqCh1bp+06AHe1d
         GZOw==
X-Gm-Message-State: AC+VfDxtCWAZfi+RcSTo2B+XOCtVxX4GrnMn60Ar96DuLzc5diDVgqR3
	BQg5SLXfV69uF/NWehcq2uLi+WX0uBHG7NcpFs8=
X-Google-Smtp-Source: ACHHUZ7wDF4mfLxJNKkkk0KpUKm5Ff7hMwyGEwH6AIic9Qx5k4ll04lsxgqoDJmFQjXy5nihotptYg==
X-Received: by 2002:a7b:c399:0:b0:3f9:b827:cbcc with SMTP id s25-20020a7bc399000000b003f9b827cbccmr8613394wmj.30.1687515690882;
        Fri, 23 Jun 2023 03:21:30 -0700 (PDT)
Received: from [192.168.178.55] ([194.110.145.167])
        by smtp.gmail.com with ESMTPSA id z10-20020a7bc7ca000000b003f5ffba9ae1sm1938410wmk.24.2023.06.23.03.21.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 03:21:30 -0700 (PDT)
Message-ID: <fbbc9e99-a727-ad08-42f3-06d4ec15cbd2@baylibre.com>
Date: Fri, 23 Jun 2023 11:21:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [OE-core] [PATCH v2 0/3] wayland/weston upgrades
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
References: <cover.1687444823.git.pidge@baylibre.com>
 <20230623104629.2cbf4a53@booty>
From: =?UTF-8?B?RWlsw61zICdwaWRnZScgTsOtIEZobGFubmFnw6Fpbg==?= <pidge@baylibre.com>
In-Reply-To: <20230623104629.2cbf4a53@booty>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 16:52:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183348

On 23/06/2023 09:46, Luca Ceresoli wrote:
> Hello Eilís,
> 
> On Thu, 22 Jun 2023 15:42:14 +0100
> Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com> wrote:
> 
>> Nothing really surprising here, except we should note that launcher-logind is
>> being depreciated so some thought on how that is dealt with will need to occur
> 
> Should we file a bug in bugzilla to avoid forgetting about this?

Yes, I'll assign it to myself. Alex had suggested we just require seatd 
which to me makes the most sense.

-e

> 
> Luca
> 

-- 
Eilís 'pidge' Ní Fhlannagáin
BayLibre - At the Heart of Embedded Linux
www.baylibre.com


