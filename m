Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61410C5B572
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 11:27:46 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10943.1786706862784423872
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 04:27:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=YOU4e64/;
 spf=pass (domain: linaro.org, ip: 209.85.216.41, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38759bcd877so1054739a91.2
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 04:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786706862; x=1787311662; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/dnT4esdwXxBizb8ySbDXQ8Eu0RgXGEhQVNyFc8RD00=;
        b=YOU4e64/CUXneQfWv4ISTcQf0Xl9pB+uzlEgBsynD5/SaTamn/9XOZs0KhesmW3H1H
         GVEftZ1J5f8+tPerZ6ji0vKGtPCAIRtAsgLlmIQ8N5wV4ih+Mb0MXzyhdOPbyQeACOJH
         t/rOGvrwPSf163++LGO7QB1Il2KrHzkNEPr+bPTXv8r6SyS4Jxi3fnc0mTEFzthhF/Hi
         MbNdm1EX9vVikVupD9K1Omb18krYCCwoBD3gaA+BWwG8sOH1pHGQ8PsV15FU4/WbR2m2
         d+stIk/MzWvgZFmpSmrawIY2/s/X6WbiM1hXoG9hC3mFS0qGHclW9PmmQKFFjk6p78Dz
         W/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786706862; x=1787311662;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/dnT4esdwXxBizb8ySbDXQ8Eu0RgXGEhQVNyFc8RD00=;
        b=h1MQE77KLsRvHBxepiCMYI6IPQI6gv1rxnAS0d6Wi4M5ijIBWVUbjjcJPYE8BUTVtD
         SEfMg8S+DYaNiovSgWo9L4FWZa+NCfq690H7G9ZpC+TShM6JJ7Lzi3upKOUg7maJHH3Y
         4zWHXGoP7yXyYGkwjWyh1q/Ke5338ZxflI9yJerVeH54x9YXlTJYLc9odbIBMNgOPcZ8
         id/ZL6On9Xxj7RRaJ/hdVQfojCk9RAPflT48TNRLBaeJUxNsTScWU3tIONMFVQlmwb+Q
         Scj4zw+08pho/uSUZBqW9Nwe/Z6QYnJT67c/xHFRMniu5L69OrrF44jec33T7sn5PfhQ
         791A==
X-Gm-Message-State: AOJu0YwUXqcnJipChJjEuZz3C4hqlgXlh6REqaRLWXQcpDYIxRXiq/Dy
	o4fa9RP1adolO2CE3zktggk2lMx7f2PQP+wJ2fLXwhDXThiIbk0KJgyZQWtR8brM9eI=
X-Gm-Gg: AR+sD13QhklzB6JB/LFaI91rJGuRHXXcgCWa1lCdXkmqI4aQsqItCurhisfWNG9mi+u
	z2zneeHl9ceChISLw17EZht89vtx2RaeIho3Wptvvq+LDY4yApoFi8M3K4jYlLr/RqdBnf+Nbcb
	esi6lNYXBIP1rauN1Kku3u8UaFODygFPs5Jitwi/OeRwjf2v6x1pik98sLKXa4CkXTQUBVgvosA
	EyS2itqpyBn+6u6IuvmB7loNmDIvVHsB//CMMZVmxZIxsH1acAqMkDKAJFT19etExHQqJWGnemw
	gGdi5XpWJUIYTFS6UpU8PCA1JbUchkHL/LsBWr0S7RFvWKLUVvaET7+ZWfcunGLP9kIzA9PnDMR
	KwutxrVkxJOYVhLJD9v6PAP5L0Ox1JLFVGYeBp5Vx+PU8JnVju9e9EDpNJa0bfUFagX49pnwxjV
	pdvcqHVf+EJ7mUPyCclHXKSJu669yaVb8DQB1KHYyaAger55qpIKZaPfqlbFOLP1FI8ldp1Ipxr
	yKrDyjLinYZ5ses1ZQSYyvKSodziKw=
X-Received: by 2002:a17:90b:5803:b0:38f:18f9:785 with SMTP id 98e67ed59e1d1-3933cb3b889mr5703896a91.8.1786706861953;
        Fri, 14 Aug 2026 04:27:41 -0700 (PDT)
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ea9a12ddsm2486064a91.6.2026.08.14.04.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 04:27:41 -0700 (PDT)
Date: Fri, 14 Aug 2026 14:27:37 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] lttng-modules: update from 2.15.2 to
 2.16.0-rc2
Message-ID: <an77qXLFBuw245kW@nuoska>
References: <20260814064812.1071873-1-mikko.rapeli@linaro.org>
 <20260814064812.1071873-2-mikko.rapeli@linaro.org>
 <2b6fbd07547d07ddb00539fc0bf7b8434633f26e.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b6fbd07547d07ddb00539fc0bf7b8434633f26e.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 11:27:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243446

Hi,

On Fri, Aug 14, 2026 at 11:48:32AM +0100, Richard Purdie wrote:
> On Fri, 2026-08-14 at 09:48 +0300, Mikko Rapeli via lists.openembedded.org wrote:
> > To support kernel version 7.2. Fixes build error:
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
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> > �.../{lttng-modules_2.15.2.bb => lttng-modules_2.16.0-rc2.bb} | 5 +++--
> > �1 file changed, 3 insertions(+), 2 deletions(-)
> > �rename meta/recipes-kernel/lttng/{lttng-modules_2.15.2.bb => lttng-modules_2.16.0-rc2.bb} (94%)
> 
> This probably needs to have a PV of 2.16.0~rc2 else the version sorting
> when we upgrade to the release won't work...

Then the version is different compared to upstream tags. For CVEs I can set
CVE_VERSION.

> Do we know how far off the final release is?

Honestly I don't know. Past releases seem to have around six weeks between
last release candidate and actual release. v2.16.0-rc1 was tagged 7 weeks ago,
v2.16.0-rc2 just two weeks ago so feels like it is quite close now.

Cheers,

-Mikko

