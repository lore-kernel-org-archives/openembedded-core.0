Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.235.1608559782875442757
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Dec 2020 06:09:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I7+8dDrl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id c133so10004896wme.4
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Dec 2020 06:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=McQL+lo3am7sB9tgfdsnksaAfrRcfYCjyh9AgwOuGF8=;
        b=I7+8dDrl9BbpT7N00QRv9L8+1SJG711ERPGa3BcsIPFZGNxVmknXmhb+9Ly1ZkaNOh
         73ioXpzg3nLWr1MvSEDoG3OG6ERZ7kczb0PACYJkdo74QmsulYCor5YLBXALF/BQSom0
         Ta8Bz/KksVuirO0RI6l3q2l52AHRE8Smxt/rs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=McQL+lo3am7sB9tgfdsnksaAfrRcfYCjyh9AgwOuGF8=;
        b=ByLHqhcxeHdz1hzLMn153nhUGbZDmKAToA4k5UeV5Hkw8CUCSCkL780CsMa0dI9YHn
         apEuIcCeNMCdexelEMWpw1cf/c5TBQ2XkcvNB5sfIsC57p0qe8jkgzgWK+a+SU12kNmh
         t2LpR2QPXBG9QC4Z4b5X0vcSPyny00R95SGNz/gc0veS//PvUiKZ4+UYfdliu3RiHot+
         g16q4FjW9cKalqLFHPhrHkT8ctMjD3gAMP4s3kcThyIf/CymoKEGHbMCZIJJQDtDuntb
         e/uPke903lKWlVu8Dc6eKe6gEPAv7nTR4jRNfdLrFFfEsGaKX9S7BhHDNyl9A225tW6X
         KswQ==
X-Gm-Message-State: AOAM5338Kzwvv8PMXJdAyQw/O1ku6sKRwkCE0MciDPS4GYQyXfqMmbV3
	zdSesyj5Nacx2xLpjZ5PoCurrQ==
X-Google-Smtp-Source: ABdhPJyUfS8yZ+IdRajRtbBfChx3KFaojjnIhe0breytRhqclAA3dknwo/VnMKW+grHGOdHcWnirWA==
X-Received: by 2002:a05:600c:2106:: with SMTP id u6mr17088991wml.4.1608559781429;
        Mon, 21 Dec 2020 06:09:41 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from b.b.4.9.2.e.e.0.9.c.7.7.e.d.7.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (b.b.4.9.2.e.e.0.9.c.7.7.e.d.7.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:67de:77c9:ee2:94bb])
        by smtp.gmail.com with ESMTPSA id i4sm30548266wri.88.2020.12.21.06.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 06:09:40 -0800 (PST)
Message-ID: <b5eaed3ad23e95d46438d6fc5451186a38100a5c.camel@linuxfoundation.org>
Subject: Re: [OE-core] Process for backports
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, "OE Core
	(openembedded-core@lists.openembedded.org)"
	 <openembedded-core@lists.openembedded.org>
Cc: Anuj Mittal <anuj.mittal@intel.com>, Steve Sakoman <steve@sakoman.com>
Date: Mon, 21 Dec 2020 14:09:40 +0000
In-Reply-To: <6a47db6d94714b2f9d306d540218c7c9@XBOX03.axis.com>
References: <6a47db6d94714b2f9d306d540218c7c9@XBOX03.axis.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-12-21 at 13:30 +0000, Peter Kjellerstedt wrote:
> I thought the process for backporting changes in OE-Core was:
> 
> master -> gatesgarth -> dunfell -> ...
> 
> However, I just noticed that the latest Gatesgarth release (24.0.1) 
> is still at 2020b of timezone, whereas Dunfell (23.0.4) has 2020d.
> Am I missing something here, or is this just a miss in communication?

We're working through what the processes mean in practise and there are
a few issues:

* Steve doesn't have the bandwidth to handle Gatesgarth and Dunfell
* Blocking Dunfell on Gatesgarth isn't fair to Steve or running the LTS

The intent is to keep both roughly in sync but I've not made it a
"hard" stop as it was just going to cause things to grind to a halt and
help nobody.

If people spot things like this please flag them up and we'll get them
resolved.

Cheers,

Richard


