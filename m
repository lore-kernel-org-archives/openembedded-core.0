Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A707C4332F
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 16:27:03 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.153829.1698683218154730189
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Oct 2023 09:26:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=0SfMoH/y;
 spf=pass (domain: baylibre.com, ip: 209.85.219.51, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-66d0252578aso31170586d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 09:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698683217; x=1699288017; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fjcNXCIbf1kdwPErIqq5jSJCUgDr7fOc1Oof+jrtVAQ=;
        b=0SfMoH/yyxmOsHNHTqEhfgKgZmTvojvwquHTp2zEE8jAAnzvvGrS3dTv8B/abJQVEm
         2URdCCq4XsQHfCGNJO3Ad5U3J3yLCuVNk/UzI6+yyLbmW/N7ZZgkebZkJfkZsCMcDwzY
         otoEJfKgvc4bEC4PEIjs/9GlrLJ/d22yZtXGHWgSCS9xAOGVofDUweszC69hBaVJGY+O
         C2MWSjvOf17mCVeRvqrkpZPKo9LhrhTEMtK0YSciFFNcWTd6GmTqEZKqlnj5+KXORrk/
         EO8dUKdD1FZlv5gQxjfoL/2Q4vDFjuHOR+n6b8Mln+w+2f1e3+yIc2jS6Rx1MgPSgyRl
         GnJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698683217; x=1699288017;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fjcNXCIbf1kdwPErIqq5jSJCUgDr7fOc1Oof+jrtVAQ=;
        b=kflTCbnMYmuxTghS6tDFDq34PRlFYHXrkdtWmiXjOmPMy1DBJ8a0FSdzn7hzPUMh0z
         ZOre9KnB+uNsjQHtIRf/Kn9l9bIdwBFsvr6QKR+4LxHdbijnnkmx6UBnH213R1tQ68Xc
         jbfry/RU+hbTfOtbOLBP9UGmljzoUvopufipu+Oq0EWm49c6WcruSEjlPAZcLkmJln4d
         CYjGEqwLxchuoDhCy20yMjE0eOQKokDx2Y4c4CjMPi2Jlivkaod49TyOTQtQRmEP6jYI
         RGjJqBz1EiM/11pWT5imp65fbnq3HhZlryGU6EOptEgCA1h/GfdCRpiffNAu3mNVW8xT
         vynA==
X-Gm-Message-State: AOJu0YzyWn/Tku876S5xnjis6FqM3LAx5NEieG5EMBpFefoiCfi7Uyum
	Cht1v8C9mGDLzcNiBSwi0OslNlFc1eiA0lhPWuR+8w==
X-Google-Smtp-Source: AGHT+IEF10YtVFGQ3dO7Z2ZxWXtHydolNqgMGSkWT/yFRyveCCyZdgMORTpJlOntdSahYkFgkvf6nA==
X-Received: by 2002:a05:6214:246b:b0:66d:1d92:c694 with SMTP id im11-20020a056214246b00b0066d1d92c694mr14840386qvb.58.1698683216668;
        Mon, 30 Oct 2023 09:26:56 -0700 (PDT)
Received: from ?IPV6:2001:1970:5b1f:ab00:d875:6297:4e81:e577? ([2001:1970:5b1f:ab00:d875:6297:4e81:e577])
        by smtp.gmail.com with ESMTPSA id mi8-20020a056214558800b0066d05ed3778sm3548507qvb.56.2023.10.30.09.26.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Oct 2023 09:26:56 -0700 (PDT)
Message-ID: <5a4f2512-1ff4-45f6-8327-e7eb0533fdf8@baylibre.com>
Date: Mon, 30 Oct 2023 12:26:55 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: openembedded-core <openembedded-core@lists.openembedded.org>,
 Yocto-mailing-list <yocto@lists.yoctoproject.org>
From: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [yocto][OE-core] Notification: Patchtest service going live
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 16:27:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189802

Hello all,

This is to notify the community that the Patchtest service will be going 
live today to provide patch feedback. For now, this is exclusive to 
submissions related to the openembedded-core mailing list, but support 
for other lists is planned in the future. If/when the service detects 
issues with a submission, a reply will be sent to the submitter (CCing 
the openembedded-core list) with a list of failing, passing, and skipped 
tests. If you have feedback or suggestions for patchtest, please submit 
an issue via Bugzilla (https://bugzilla.yoctoproject.org/) under the 
"Yocto Project Subprojects" -> "Patchtest" category.

For more information on patchtest, see the READMEs or the Wiki page:

1. 
https://git.openembedded.org/openembedded-core/tree/scripts/patchtest.README

2. https://git.yoctoproject.org/meta-patchtest/tree/README.md

3. https://wiki.yoctoproject.org/wiki/Patchtest

- Trevor



