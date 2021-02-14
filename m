Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.17958.1613315854793256277
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Feb 2021 07:17:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DWE/zJiH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id r21so5581357wrr.9
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Feb 2021 07:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=On4fex0F0VZbC+hc4ffzLnF467wYpx/I+qhbudLdNWQ=;
        b=DWE/zJiHmU1rZwWIalhbbpEl6+oYWfQQ/c2A8lQYNoOCv2a3DF9Tzfl/g9pNAUD6iS
         9/jl1mCKUh8Thze1JDC88DtIskDIjvalNHd/S/W83JwdtWUdamcwfK13up3Dp1IbDTSO
         Q8hoEMa8XfxxmJwgAD6HyMvgYBhEc/zmtQXRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=On4fex0F0VZbC+hc4ffzLnF467wYpx/I+qhbudLdNWQ=;
        b=VMr4jz2BPqUWUlG0UfVKiImEb2ALSa/ixMZaObZAQcp9DjXwlGp0AGfZoqP1AL3w8z
         FD7yMHO48sgJ/r0yYKAt+jY51j/uVryZpv3/SAmuS+N5IKdIrfEsKJ4OUsCLZi2R9Z+J
         iWdK7DoXK5hMnib4rJkxznBdx/UYGurEp4uny5XorUeBZEuQ7RB0vSGVr7j7xLMcAJjM
         8p4Sg5efUEJkYznc66S8SU4dSeYL1PLRqEt9vCD5YpNAx/vcHrdXkVj0vvN0ANku5LF8
         VYLMfqllLI/8MfUrUlRYXgZJzU1Y46gPd7mEodG4VgzQu1V3IDVxznKW5Wu2M7pdgxcj
         Bo7g==
X-Gm-Message-State: AOAM531l2G2M7XI8vK6o33IJ43VH7bG68cNCXvTZjjXKIlFhH8OQ0l/4
	pfjpQiMoU6bzov+sp1JchLBUcQ==
X-Google-Smtp-Source: ABdhPJyIPFw1k8ueiznJJl9c+E3UwbLyRVPKH7F6b44iBKCbDiRBFdqVu2CFfppEU3NRKzVfAqQjSQ==
X-Received: by 2002:adf:f00c:: with SMTP id j12mr13854419wro.160.1613315853332;
        Sun, 14 Feb 2021 07:17:33 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6c46:cb67:3902:3f00? ([2001:8b0:aba:5f3c:6c46:cb67:3902:3f00])
        by smtp.gmail.com with ESMTPSA id m1sm11677587wmq.36.2021.02.14.07.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 07:17:33 -0800 (PST)
Message-ID: <679f3ccb6bea88cd72132ba9ea51547e81bcf0d8.camel@linuxfoundation.org>
Subject: Re: Autobuilder reproducibility target changes
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, swat
 <swat@lists.yoctoproject.org>, "Mittal, Anuj" <anuj.mittal@intel.com>,
 Steve Sakoman <steve@sakoman.com>, Joshua Watt <jpewhacker@gmail.com>
Date: Sun, 14 Feb 2021 15:17:29 +0000
In-Reply-To: <CANNYZj-cpgjuvUikfCrYCnBqTLdsNsY-5PUBji7PqJhkrbuHzg@mail.gmail.com>
References: 
	<80c70797943e52fa430d2f9f65bffe7a90730dec.camel@linuxfoundation.org>
	 <CANNYZj-cpgjuvUikfCrYCnBqTLdsNsY-5PUBji7PqJhkrbuHzg@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2021-02-14 at 16:04 +0100, Alexander Kanavin wrote:
> Cheers :) If there's something else I could help, tell.

I'm going to try and get diffs of the remaining big package differences
and see where we stand. The two big ones I know of are go as a language
for reproducibility and perf. Perf will just be a shear pain to fix,
hopefully the kernel will take patches.

> One item is getting to the bottom of why it takes diffoscope beyond
> the heat death of the universe to render its verdict on some items.

That would be really helpful to get to the bottom of. The vim-common
difference is actually really simple:

https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210213-0djxo1sn/packages/diff-html/

so I don't know why it took 5 hours to compute that. It suggests
something really silly/stupid is going on. diffoscope should be
amenable to fixes so it would be worth talking to them too...

(I have a fix for the locale problem in vim brewing, it needs a new
buildtools-extended-tarball)

Cheers,

Richard



