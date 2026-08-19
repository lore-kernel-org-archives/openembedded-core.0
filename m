Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 336C6C5B572
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 06:33:23 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1425.1787121197895276219
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 23:33:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=hti1AZkx;
 spf=pass (domain: linaro.org, ip: 209.85.167.42, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b14d1f9315so667517e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 23:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787121196; x=1787725996; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TX5ZnCXDhlG5eLwTk09XpO/Wf28X1HPcrU0XGuYgZTc=;
        b=hti1AZkxoD4YHR4CbrnojPqVxAO3tT96yrOLyeBTSkSKi1Mb0JSuRbiInvsTP6w1CO
         Y/MLaHy145J8ofeTchyzt8Sn0ZKUlRjFjKZsdGJHs+mauN3s8OA+/ADOMOO+L56TgjMR
         SP5VarZ3n2/JQnyXt2fqQo0tS5f1s7Y6YWXQsBe7Zjo7bn/XyN4g2arFaU8R/moh31Lh
         iWhZJxcFqBTC5M1Ix/hARPhGX4+VfF4k32ajH7hzGgWOJ2EU1K0Z6xx+1e/A+lWsENem
         ZDD4WFLpeJm3UOdcr6+E64UbPkBOXYI75vmCSVEs4VDJVccImBV2OHubTSX7Q25cPSMS
         NpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787121196; x=1787725996;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TX5ZnCXDhlG5eLwTk09XpO/Wf28X1HPcrU0XGuYgZTc=;
        b=arsjSf87iBZKHzJm52h3VgrVsxGs2fqWqZn5JgCMSdG/MWp8ww2aTTcdca5fuEPa7E
         XsG35w6+VnqvyMWVBfcNYvkWIzh8K5fFS6NE/1/Mr4HjReBTkhFLyyXKrAzTove3kVr9
         Lrf6HE+HmRdAfOPMRyLrHa92KpIwz8e9LaZm0B04KzhISKDxoK5iP0nihSlUjNrp1y/5
         y4rGEANRrzSaN54YZjBEbndzFno4nr7p2pQZLhnkMi3rKkcqRuzO4L3TrgmAbfLVJxXs
         MVVIO7MgSBPZg6sdQiYF+sZs5Fe8T6JqEUoiA48ZsjaOs1RI8VUQzQhbhW4M5+tqoN0V
         dXMg==
X-Gm-Message-State: AOJu0YwFvS/ZVwgb1jId5/dKFCc0grnjuvo2f4X0nyhmjqDpQJN3wUsv
	H2EPXwaJIPCnlMiDedPzFSaoC2u08ks7Hp+wybEinh8kXoCb28DyWTpnjhmX8pX2FGc=
X-Gm-Gg: AR+sD13obTevrdA3NeyqYgOxteRjB1Bug+o5Ux+Ld1i+XyLMvDhxD4KuWYEXhMYQ8Qb
	PvW3hUPBlTxX/6wBgPaJV0/NsVhbEgoNJ+bv4g0Fbdp7rlMi+i5sdilce+zf2XonoT4hDYcjhIn
	UhabZPz4nelXnt0ShKC4yzf6zNzFZTNOmk1S4ISLHPecdZmmAC193LKvNjy3G0x13ayTdPqs9ue
	NW1poZqR+6KHxREDK7ge5gR0SRoZcNGwkTOMQVAL96CTLezMAy/qXOc518z2ZOeimx7SYUeOYEF
	7xaPZ9hGV4AwsLtmgvLOQlon0PgaCSv2KrI/rXd8aEfy1Mgc8FXD9Njp7XepZEmH5BrtCF9xwMq
	+N8GGIx/6nlJvUWFDMSnMBRRQoIDNBjJBOFNrRhjb4bIJHDPgXNXhaus0xaBTzy/SRO2fDtiOkM
	yWEzWlHxapk48DKoDt3QOPWnlkdP65CzXOUoUYD2uStOHg2Fqt3OLBD+YmSLZqjur8AFuQJwTUX
	Q8UcI+MohYv/OM=
X-Received: by 2002:a05:6512:1382:b0:5b2:a74d:8c52 with SMTP id 2adb3069b0e04-5b478bd05demr649764e87.18.1787121195501;
        Tue, 18 Aug 2026 23:33:15 -0700 (PDT)
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a189cf6d51sm2323481fa.10.2026.08.18.23.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 23:33:14 -0700 (PDT)
Date: Wed, 19 Aug 2026 09:33:12 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/4] lttng-modules: fix build with kernel 7.2
Message-ID: <aoVOKKiuD8nvUqZR@nuoska>
References: <20260817112129.1271154-1-mikko.rapeli@linaro.org>
 <20260817112129.1271154-2-mikko.rapeli@linaro.org>
 <83662673baa05f5459809f9eecf886fc3b978b33.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <83662673baa05f5459809f9eecf886fc3b978b33.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 06:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243714

Hi,

On Tue, Aug 18, 2026 at 01:21:20PM +0100, Richard Purdie wrote:
> On Mon, 2026-08-17 at 14:21 +0300, Mikko Rapeli via lists.openembedded.org wrote:
> > With patches from upstream 2.15 stable branch.
> > Fixes build error:
> > 
> > > lttng-syscalls.c: In function 'lttng_syscall_event_enabler_create_event':
> > > lttng-syscalls.c:612:17: error: implicit declaration of function 'strncpy' [-Wimplicit-function-declaration]
> > > � 612 |���������������� strncpy(ev.name, desc->event_name, LTTNG_KERNEL_ABI_SYM_NAME_LEN - 1);
> > > ����� |���������������� ^~~~~~~
> > > lttng-syscalls.c:101:1: note: include '<string.h>' or provide a declaration of 'strncpy'
> > > � 100 | #include <instrumentation/syscalls/syscalls_unknown.h>
> > > � +++ |+#include <string.h>
> > > � 101 | #undef TRACE_SYSTEM
> > > lttng-syscalls.c:612:17: warning: incompatible implicit declaration of built-in function 'strncpy' [-Wbuiltin-declaration-mismatch]
> > > � 612 |���������������� strncpy(ev.name, desc->event_name, LTTNG_KERNEL_ABI_SYM_NAME_LEN - 1);
> > > ����� |���������������� ^~~~~~~
> > > lttng-syscalls.c:612:17: note: include '<string.h>' or provide a declaration of 'strncpy'
> > > lttng-syscalls.c:704:17: warning: incompatible implicit declaration of built-in function 'strncpy' [-Wbuiltin-declaration-mismatch]
> > > � 704 |���������������� strncpy(ev.name, desc->event_name, LTTNG_KERNEL_ABI_SYM_NAME_LEN - 1);
> > > ����� |���������������� ^~~~~~~
> > > lttng-syscalls.c:704:17: note: include '<string.h>' or provide a declaration of 'strncpy'
> 
> I think 2.15.3 has released now!

Right, sent v3 with minor version update. Rest of the patches are already in master-next
so not sending them again.

Cheers,

-Mikko

