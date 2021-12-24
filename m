Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0410C433EF
	for <webhook@archiver.kernel.org>; Fri, 24 Dec 2021 08:30:22 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.43268.1640334621285365712
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Dec 2021 00:30:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UdCxFdYD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id v7so16171064wrv.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Dec 2021 00:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=wdCUY/eVfC+1WI2qeJG1i3DE28kqeY5dDTmFUHlhqAY=;
        b=UdCxFdYDlKFb/1elzpqaTmLClhK9Jr2bPcp3TT0bZ3tG+Uytgdgj25lhSszkkY+HNT
         Hvx5VZc/KY8Ed76Ld2esm+j6Hu6ntD65bTw8/HsMzBu8RVbEKgTUZRPQWzWwbjzwr/ud
         5wnvp1aeYvHGfU7WZxoHWdD0eybEVdfZ6l/co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=wdCUY/eVfC+1WI2qeJG1i3DE28kqeY5dDTmFUHlhqAY=;
        b=iYkPAE8XQ7I0FKzNQCPnqJihW07ATfG4Dwvo12vwDDKb3baOJjOqL5f1MbrWcWYxlO
         e4esyxlnmgULn6XZibHGTLs9U4917Iq+1mhn0lDofdsGhN9c37WI2VQWAqCzRINFZBkP
         T0y57RTk+z6SEQwyaWGnS7NMlAxYB3x1iXocp22UqEm3IapX89ObNfOCYHqUAXK4SLCy
         em/ttBnJc0tU68Kgwt9dnduFas5HVAA5AslpCszvMbTHUEFX5yMBnHYOJS+b1s9W79Lt
         yshHe2Ql0csaV6VhQHkl479B7gnuAicM1rVMRpGHsFe2pqcFpLPLI/yiM4wwHHSZZBU2
         mE6w==
X-Gm-Message-State: AOAM5309jiW37ngUj7wpSnlrDhV1aNCR+VZr7eTCqsVetFRKx/ArD+9v
	3i/U/UgzRU7+huOy1y2QAIHc/g==
X-Google-Smtp-Source: 
 ABdhPJzYg63gzcuRU3eBC3Vw01LYneB41eSj2sgklVRDqQP01i/sjILuoBYqYrbj9iwtbly3dKAkCg==
X-Received: by 2002:a5d:460d:: with SMTP id t13mr4166640wrq.44.1640334619555;
        Fri, 24 Dec 2021 00:30:19 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:5bfd:8b91:9aac:f2f4?
 ([2001:8b0:aba:5f3c:5bfd:8b91:9aac:f2f4])
        by smtp.gmail.com with ESMTPSA id
 r11sm8937190wrz.78.2021.12.24.00.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Dec 2021 00:30:19 -0800 (PST)
Message-ID: 
 <3cf5e25c0e49befed250ec01f58a6ed086e4b65c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] base/patch: Disable network for
 unpack/patch/configure/compile/install
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Dec 2021 08:30:15 +0000
In-Reply-To: 
 <CAMKF1sotV_QuheVfSyCBndQiKr_suBEnzDuWfExf=LgfT0yRww@mail.gmail.com>
References: <20211222232035.1036830-1-richard.purdie@linuxfoundation.org>
	 <CAMKF1sotV_QuheVfSyCBndQiKr_suBEnzDuWfExf=LgfT0yRww@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Dec 2021 08:30:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159996

On Thu, 2021-12-23 at 22:00 -0800, Khem Raj wrote:
> is this list of failures due to this patch ?
> https://errors.yoctoproject.org/Errors/Build/137579/

Looks likely, yes. Recipes shouldn't be attempting downloads in do_compile :(

Cheers,

Richard


