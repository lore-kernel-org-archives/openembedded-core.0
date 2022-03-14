Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9691BC433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 22:54:47 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.3320.1647298486892008815
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:54:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fyFE8Fcb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id
 r190-20020a1c2bc7000000b0038a1013241dso427868wmr.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=x2Sk7d+/1OoAS+DkgJZwzUkL0yJaRPXmsxybzozT2LU=;
        b=fyFE8FcbV2ouZrdwLP1Aem1oTXCjaG8VZgU0uRy1pOkbdNx5MDihB1OotO+fKb9+mn
         X+zUOSDSIx6RTmq2A+SKUUVRcDaq1Z/bJb/w520yaWCJb0Ix1qQq46pv0s+ZXwGf6DI8
         VO8mHbraIZMquiuWbUw3rYy19cmgqwF2OR5vs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=x2Sk7d+/1OoAS+DkgJZwzUkL0yJaRPXmsxybzozT2LU=;
        b=CEG5W4RzO09u5pOZEdrHmTVYkhz3lOCjTHxWft/ivoNXkU2woP2QAjBZpwYCFLuldM
         DECyNnGBatYk6oHgrYZ1DN9ncJe25cE4QkRvWaXLLniIzWzsgFAVxL/0d1J627g9Fvxc
         3kJcolswLa8mIX9rTwHrMlsE82Up6+2rqFzi0iZoA9etyNRFzAPRjZbC2H8z8mg50sEI
         B1CWfdTSbP4YWz9uy+6QwpL1JINr/TeQjic/ek/OerdbXPKQk2WSuMcu1D/AYdd2J8Qt
         ylI0UIdjEAizCHvD1GZyi/FLMJWj0PsyR4WGIiDJVnvdI4vJKMmVk6X2jkrayDN/yov5
         eXUw==
X-Gm-Message-State: AOAM53330IKWtK/UxIbKzOlGpJDoNZl4XOKwn0t/4UZe8zL78YDuPhWn
	AtKWAep2Zvv4NmAMukZuI14gZvDxlks4aJ9N
X-Google-Smtp-Source: 
 ABdhPJwx+iOmw0vOB1JwHbmoMsz3QRyuo04k72tZ5tNc3BPNWrC5w/XXuhUkSVfTVYsX2Sz/Us+muQ==
X-Received: by 2002:a1c:f315:0:b0:381:1f6d:6ca6 with SMTP id
 q21-20020a1cf315000000b003811f6d6ca6mr997715wmq.25.1647298484994;
        Mon, 14 Mar 2022 15:54:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58?
 ([2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58])
        by smtp.gmail.com with ESMTPSA id
 i1-20020a1c5401000000b00389f76c1325sm611486wmb.47.2022.03.14.15.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 15:54:44 -0700 (PDT)
Message-ID: 
 <426ed1452a5cc0c052c0218ce4865bf935e4aac1.camel@linuxfoundation.org>
Subject: [OE-core] [PATCH 00/33] Add python3-cryptography from meta-oe
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Date: Mon, 14 Mar 2022 22:54:43 +0000
In-Reply-To: <16DC60EA44823A9F.11325@lists.openembedded.org>
References: <16DC60EA44823A9F.11325@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 22:54:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163200

It is late in the cycle but is has become apparent that the dependencies we're
weaving with layers and meta-arm was reaching a point where it wasn't working
well for anyone. BSPs and hardware layers needing to pull in meta-oe/meta-python
isn't a good situation. Whilst late, it does seem better to sort this now before
the LTS ships rather than live with it for much longer.

This series brings in python3-cryptography and it's dependencies to OE-Core,
bringing everything to the standard needed (maintainers entries, homepages,
reproducibility), tweaks to match the recent python changes and some ptest
fixes.

It also namespaces the classes with a python_ prefix since this makes it much
more obvious in core what area of the system the classes belong to.

Cheers,

Richard






