Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web09.2659.1612005236246063660
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Jan 2021 03:13:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HnhriD3/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id f16so8713997wmq.5
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Jan 2021 03:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=KlKQqfzrleVerrNRrCB/wRgIC+pKkfaxmB4IhLg5ApA=;
        b=HnhriD3/aPczqvwk9Wdghf6rTz9jbSPEkaUD1FSLapa0KiTlY7knwt7ZHO9Y0TnrO6
         EYpJFZhc1LCKhBw3IN0oRnHRJQwWgvpM5wi76L4fzTgMrbSxxT6jfCy3ECg6rB6AAUED
         tKiA59+jna6d4ZmBkXGMmrKDgdyWGfgHF3CPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=KlKQqfzrleVerrNRrCB/wRgIC+pKkfaxmB4IhLg5ApA=;
        b=XQZ7SYVS/a0s40pcsK0+aTkj/+CNFIThChvFguH9zSP09ATGJriJTC1YEtYD3mz1a3
         B7o+0jlFswSli4uDdH6xPqmrmAiUnsarH1q/LmLrTFFCfYmvTabXK19I9/BRHS9KKnIj
         yOhAfyKIwUHvrtKV56sLaBKhvPJtP8eqMK0MZ+1/sdpci/8HU9BPWqmqZ0xIVUepmDPn
         Z+1P3oybyjiSgRpbIal4svGNeWgffZyyI9v2tU1IIgD/8Pgd5CZP9NkWADIkPs8QVZpE
         tCcUTqP64ibPNOxmSnJa0coVOyTo/xOaGQzh3pD7N/dyPMnXhz79PI5+U9fK3pBN/J1U
         rPXw==
X-Gm-Message-State: AOAM530Hbz9yE72G1ziHVHDT4j2biZkYf9TDy7nFrtcFOf3y6dvNBAre
	yeF76q0fDhSMzk0gCJ3BpbHLQg==
X-Google-Smtp-Source: ABdhPJw29ENdxQYNrWrkCKkBmkeuM0+U+rodfgjbpAkAzFN2W2dYWdt/9l+iQL3sfl2/cp1NbX+ZoQ==
X-Received: by 2002:a1c:f312:: with SMTP id q18mr7447846wmq.79.1612005234677;
        Sat, 30 Jan 2021 03:13:54 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1e22:34f6:7a80:adbb? ([2001:8b0:aba:5f3c:1e22:34f6:7a80:adbb])
        by smtp.gmail.com with ESMTPSA id m82sm13951907wmf.29.2021.01.30.03.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jan 2021 03:13:54 -0800 (PST)
Message-ID: <38ac3474d3115a65dae518b8577a81ae9f872042.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 1/3] pseudo: use PSEUDO_CONSIDER_PATHS for path filetering
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Cc: Mark Hatle <mghatle@gmail.com>, Seebs <seebs@seebs.net>
Date: Sat, 30 Jan 2021 11:13:52 +0000
In-Reply-To: <20210129083352.13305-1-Qi.Chen@windriver.com>
References: <20210129083352.13305-1-Qi.Chen@windriver.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-01-29 at 16:33 +0800, Chen Qi wrote:
> Patch pseudo to only take into consideration paths we care about.
> Use PSEUDO_CONSIDER_PATHS to hold the paths. The behavior of this
> var is the opposite of PSEUDO_IGNORE_PATHS.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  ...DO_CONSIDER_PATHS-for-path-filtering.patch | 55 +++++++++++++++++++
>  meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
>  2 files changed, 56 insertions(+)
>  create mode 100644 meta/recipes-devtools/pseudo/files/0001-pseudo-use-PSEUDO_CONSIDER_PATHS-for-path-filtering.patch

This is interesting but these patches would need more work before we
could consider this.

a) It no longer supports PSEUDO_IGNORE_PATHS and we have code widely
using that. We'd probably need to support both options.

b) There are a load of references to PSEUDO_IGNORE_PATHS in OE-Core
which this series doesn't touch in the following files:

meta/lib/oeqa/selftest/cases/runtime_test.py
meta/classes/sanity.bbclass
meta/classes/sanity.bbclass
meta/classes/sanity.bbclass
meta/classes/base.bbclass
meta/classes/image_types_wic.bbclass
meta/classes/populate_sdk_base.bbclass
meta/classes/license.bbclass
scripts/lib/wic/partition.py

We'd need to do something with those. Was wic tested? Were oe-selftests
run?

c) Has the output been compared before and after this change to ensure
permissions/ownership is correctly being handled in all cases?

d) The pseudo authors explicitly asked we implement exclusions, not an
inclusion list like this. I'd want to understand more about why they
made such a strong recommendation. FWIW I'd originally hoped to do
something like this patch but they dissuaded me.

e) The name PSEUDO_CONSIDER_PATHS doesn't sound right to me, if we did
this I'd like to find a better one.

Cheers,

Richard




