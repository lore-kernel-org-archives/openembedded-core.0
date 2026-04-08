Return-Path: <martin.vonwillebrand@doubleopen.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 027761073CB9
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 13:19:29 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.106037.1775654364997535461
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 06:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@doubleopen.io header.s=google header.b=eLhWNE4V;
 spf=pass (domain: doubleopen.io, ip: 209.85.218.50, mailfrom: martin.vonwillebrand@doubleopen.io)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b9c04152730so986727866b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 06:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=doubleopen.io; s=google; t=1775654363; x=1776259163; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x3/NX7rL7ghznIkkbAWDcAbCWLmwQCUiLg9BxDNNvJc=;
        b=eLhWNE4V0jV7JGhr5JTEmc4LcrP8xhWPZpVMbvqCe8qVbep01mWpb7fA4jPs8W3Zkx
         UcP0mbV5iG+YFrwFi4pt/7kzegB116gWXZZ5DCe0q9EImcsW+FmueEQwan74LjNFJPN/
         V5DmBapxwRrJ0qylLCgV1VluuRUbYlHPyGDJZdSZtDDnSGwJL2gzYri13q+IoIQDLNRE
         xUnXvpScUKtt1pfETMbME0PLefTnTXgdzFAkYHFDD5fw+DSTTaz5MfYyOPKejGcTKQ98
         Ybx2nozEDIxVSStAHyjWqu2Mv3sMomRklfq1zVeYOcoqqR9umuGEkVGiyMax/4YE/4Xv
         cU3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775654363; x=1776259163;
        h=content-transfer-encoding:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x3/NX7rL7ghznIkkbAWDcAbCWLmwQCUiLg9BxDNNvJc=;
        b=rl3Z1E9tbhSPky5doQhmkl1r0bT39v40UprGefw+tUhTpnvlncVyeuzM/AsOesPpxw
         l1A0j7jQUMnXXmkNI82EOGfro2tuAOQNXEnE+GcDESZN3yLvpun5N+E0fPJfFkGhrZr5
         8N+jQXPCB1Wpo7sL/f1gL0DsKpwsyMrgk0nLg2GkwkNSahUPWQgjQR3zASY8gp9N75Ey
         Ie+1DenwUDRjM5KlmT7fOQkDNEu19gnJMtkZ8ckpBkcxHDWPMPx9eSciRINovLMwJggR
         85wr9T9t7OAH/vE51bKDNDZKZxZoytwQh0+TqtE3MGQq5Vo6KTxjcLiIc8MHpqiS8zHv
         gZjA==
X-Gm-Message-State: AOJu0YwnLGV10pM+3Dju1p3Ee1BAK5lxoi+39HqkgtZcFfPnHSEcrU3H
	atFpm0sGpcYpu6A1fgzh45RoRUPFb/JqhTxM0s0g6HvWPILVminUyQ4tzOHY8aUfLKMevfQ/A2/
	bWlsK
X-Gm-Gg: AeBDievSJRcKpOlpJgzIaJ/9H8XAZZnSFOSwymIeVSCROabYBFhlc6s8ZAh1Z8mV5dS
	554QdLITYvYKg2hex44V2mDBeS9mYRpf0hKe4Ufw4VI138paOFwTmVtgxeJ3I/5/SPrW/J07cQ3
	GX4dZOFT8/KVDi3+7wKHWlExOPJxiMYcWi+K5QqfcKnoOYRa4LRM6sAAPzuIlmxBaznTo72Lteo
	G41SRS2LqMvPKIEuKw3S/179RytR7+Q75MLKKp0Wuf19laMZrnw1F8Rxez3JqSFPqf764vfEfGi
	g8yoSHZwSa960eOWPEY4iyWs8hczY7Rg378Z4eAu/pj5lcwmk5bw6Efm0GynqzDG54pQMDoF8Gl
	0n0VLF508SrgXG31Ht/1ZEwKlyutjQ/d+AhfksoMvSYA64zjsfNRcwdlusZCeTsBjQkn3tQfBlt
	3VAB7RwxJbo7boA4egY7JnpJzU1hJ8cXqJ5snRODAFEfO5v4VEfHLd65BqOt89x4fwP3wCtALxf
	1KYuPQfdupSIOZTEpTqpLgn
X-Received: by 2002:a17:907:3f90:b0:b9c:648f:7d3d with SMTP id a640c23a62f3a-b9c679e5a11mr847681366b.45.1775654362275;
        Wed, 08 Apr 2026 06:19:22 -0700 (PDT)
Received: from [172.25.100.66] (79-134-115-210.cust.suomicom.net. [79.134.115.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d3823c3edsm31405666b.59.2026.04.08.06.19.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 06:19:21 -0700 (PDT)
Message-ID: <e615740d-eff9-4125-a6e6-e6b58ee29225@doubleopen.io>
Date: Wed, 8 Apr 2026 16:19:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: sv-SE
From: Martin von Willebrand <martin.vonwillebrand@doubleopen.io>
Subject: [RFC] Adding PURL identifiers to SPDX 3.0.1 install package elements
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 13:19:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234838

Hi all,

While working with ORT (OSS Review Toolkit) to analyse Yocto-generated 
SPDX 3.0.1 documents for ongoing vulnerability management and 
monitoring, I noticed that install package elements 
(`software_primaryPurpose: install`) carry only a wildcard CPE 
identifier, e.g.:

cpe:2.3:*:*:busybox:1.36.1:*:*:*:*:*:*:*

ORT recently released an SPDX analyzer (since ORT 83.0) targeting Yocto 
5.0 generated SPDX 3.0.1 documents, which makes this gap more visible: 
the analyzer can consume the package graph, but the identifiers 
available are not sufficient to drive post-release CVE monitoring 
against external vulnerability databases such as NVD or VulnerableCode, 
since wildcard CPEs cannot be used directly as query keys.

If I understand correctly, sbom-cve-check faces the same underlying 
limitation. In our understanding it would benefit from this change too, 
though the two approaches are complementary rather than overlapping.

The upstream download URL for tarball-based packages is available at 
build time and is already derived from SRC_URI via `fetch_data_to_uri()` 
in `spdx30_tasks.py`. A PURL constructed from that URL and placed 
directly as an `externalIdentifier` on the install package element would 
give downstream consumers a durable, canonical identifier for 
post-release vulnerability monitoring.

Before drafting a patch I wanted to ask:

1. Is there a specific reason PURL is not currently emitted on install 
package elements — policy, technical constraint, or simply not yet done?
2. Would a contribution adding PURL for example as an 
`externalIdentifier` on install packages (derived from SRC_URI fetch 
data) be welcome in OE-Core master?

Happy to hear comments, and discuss scope and approach before writing code.

Thanks,
Martin von Willebrand
Double Open

-- 
Double Open Oy
c/o HH Partners, Attorneys-at-law
Eteläesplanadi 22 A
00130 Helsinki, Finland
Registered Office: Helsinki
Trade Register: Finnish Trade Register (PRH)
Business ID: FI33824962
Managing Director: Martin von Willebrand


