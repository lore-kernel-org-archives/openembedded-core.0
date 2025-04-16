Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA657C369B1
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 09:00:12 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.14579.1744794003855233149
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 02:00:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B2yhgQQ7;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso1205873966b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 02:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744794002; x=1745398802; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cU77IeQn9FucfJHpUKZsr4waWPmp8tLWRfJcWXLk0zk=;
        b=B2yhgQQ7+STdVDvnJ2XaRhCHbal6zJbe4CJdnDwcErrhPskQSJvIKtaTO4U6kt0PTI
         m8B1/sMQZdqmHxEil8mChkEchY3p8Wq3ytfZoEjzrPVIPHLnY5b2wk186hTLgISziz0Z
         yrrUGkEHQW/c9yb77yVokD5Pry8HCexaA5zixBbfrI2+y9x18BBMTgqnwIkQBhvVNqju
         Z6wx8k3846ctBcD+XcTuBSc+4wwo+dRfx0O7fbojCM/sPZaDLdMK68k+3a37lNxd2xJi
         g+4OaopEcjkgGqi/Ef8x3ovZVM6GUQHsb86mSk/fGczAf4SKzquUIC8Rade73jQNUbFT
         U4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744794002; x=1745398802;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cU77IeQn9FucfJHpUKZsr4waWPmp8tLWRfJcWXLk0zk=;
        b=AxNbsEQzUpTDa1qExSEt0PDgya2U/6dei70nY7MAkYVeNL9av3GFSUCo51PrhMnzWm
         1jXyQIzkLWPsiI8XbNfZ7xwox/EosR2C0LjerJgURp66lmdUkNSJFm1jEIbmMSR9ucRw
         hGtz3+TgTHszZvcJN1cggpqB6oVyPaVWfBPnpT0ShSf+RFxgAy3PEwQ8F7eN2ff9nSa1
         +ySy/sLNJMs2BxQrNVKnDQSUEK2Z3o3Fg7MSj/sDNJEOQRbrWy82MBRqTreTieQ0e1uo
         0zHaoCJJbS39uuNs/dMeMXgOv39m06y+LVui4/OlkbiTXwd0kzolANbQmr/fcaST7a9t
         lsEA==
X-Forwarded-Encrypted: i=1; AJvYcCVN9ltsd0a+EhowVtrExXdMVIGVb/uC56k7HM2L4V/ENzZrwzxwtKnWVqPK0fUeWb7M6tQu/5+fN5suMPrGSENRaw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzjGff1BZfrYm2o6b2PgdX3QjuS8oxpYkRVKG/yMkbkDhlyCvgW
	2ezfICsTLuLf83XBECfEBFAe4Mbe8e75IqkHZIdP4VgvEKDG4rI4
X-Gm-Gg: ASbGnctKlxAs/Cru3GbWbPqzI9ml3dPNCywR6MinCAGwoboWAke6ma+g6iE8rGbPJ6L
	Xe4/W3CbSzk+skpaLtSGWDw2XTtmPpvD8iZleCWPRe4+9JsbxfW9PoVTi5H9I4KuQ1gcVEmd6Zk
	01wCaxSgFAsMgWCdfSDO16shqfgRkJFG1rC2w2KjHY0lZRZnwsJ2eBC/XzMOSgfZJz9AJQfytil
	Vo8XBVCKVtAC074eXu2ppgsBfP7eerrEThlMMTpK+kNm/vzCmLcnk93klU+Wpsp6vIUrs0rmtNY
	ZEnDf+3zV6QEhCPosn8nNkvE9qEx/ii4QQGmZf6obz1dhnvM
X-Google-Smtp-Source: AGHT+IFh8hHZfX2SghmNBJQ7PlT5g6QbYN7hYdAFIkP6CrP10cUYXhXty4AEEIIjoRO21wuPIg1EHw==
X-Received: by 2002:a17:907:7da3:b0:ac7:f3a6:5af0 with SMTP id a640c23a62f3a-acb428752e1mr78872466b.10.1744794001652;
        Wed, 16 Apr 2025 02:00:01 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cd6381bsm87317466b.7.2025.04.16.02.00.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 02:00:01 -0700 (PDT)
Message-ID: <e73787dc-03f3-469a-a37a-8a06cf7b8042@gmail.com>
Date: Wed, 16 Apr 2025 11:00:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][scarthgap][PATCH 1/5] libsoup: Fix CVE-2025-32910
To: vanusuri@mvista.com, openembedded-core@lists.openembedded.org
References: <20250416051314.96105-1-vanusuri@mvista.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250416051314.96105-1-vanusuri@mvista.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 09:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214981

On 4/16/25 07:13, Vijay Anusuri via lists.openembedded.org wrote:
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/ea16eeacb052e423eb5c3b0b705e5eab34b13832]
> +CVE: CVE-2025-32910
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + libsoup/auth/soup-auth-digest.c | 1 +
>
This seems to be only a part of the fix.

Looking at the CVE details[1], it is about a null pointer exception in
case some parameters are missing, but this backported commit fixes a
memory leak, which seems to be mostly incidentally (?) added to the same
merge request. The full fix seems to be contained in this MR[2],
comprising of 3 commits.

Or am I misreading something?

[1]: https://gitlab.gnome.org/GNOME/libsoup/-/issues/432

[2]: https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/417


