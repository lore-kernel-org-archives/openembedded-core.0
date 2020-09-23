Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.1425.1600882286452123230
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2020 10:31:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LTkLyVqj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id y15so910618wmi.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2020 10:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=AQPZ0u8nt1biNiE5Nh20YLYy8FykXph3fkH04xBXsO8=;
        b=LTkLyVqjtfpyQMbSGMfNVEmvHuPqPNTUJIIwETjzKyu+B0LuY/ZksxQEWdH0C6RtCm
         yM/wYi9+Bi+E4e30arrOUsMmvTwYHJmLcN68vjzd0LbXHQF92xL/HxZc9o4Wk/Tu0YqK
         ebDZtUC0TX1QwLYGFPYgUCV/i5niisw6g1jK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=AQPZ0u8nt1biNiE5Nh20YLYy8FykXph3fkH04xBXsO8=;
        b=XeJCDkBpIE+heOHhYEYcGuednzCtW2QzzKVKW7SFDtqFdyjwHXJuvHeXDYwU2I+H+s
         pD4cHHYUu8zRr8VPM3PHPcrXY5HaFx7jsL6VHaSWl8Y0ain/z79vRv8pkGzplSZneSOE
         IK+fvK51PcqYYQ4Xjs0siyvkTiolttR2U1VouGqoMlj3hz5GVcfYfk/QVCzrZr2GZ2O+
         sZL02GzGvInKlSlBHlDI5/DpRnqXBQzhWc1DDZyU+60SQ2mkjjgSdchZDiBvBuVzkSzN
         U7DSDYvuiR2sFzCxby+65FMGybYnDbL1XuwT23cNSqav5pldnm0UJ/syrKesMkRX2KS/
         iiMQ==
X-Gm-Message-State: AOAM532o1jNbBfhv0LqNpRpPfoW6EnuX4AXhyYV3kEj207KQ7XDFdafM
	8DITyMuxuVRCyzMRsXhd7Xpi4g==
X-Google-Smtp-Source: ABdhPJzLqad8h6gvYStdhNzMSPSTxnxSvTqBJMUQkqaHg7+T5UphJGrF0fnqOs2gZMSdbtlgjqvj3Q==
X-Received: by 2002:a7b:c151:: with SMTP id z17mr651292wmi.53.1600882284803;
        Wed, 23 Sep 2020 10:31:24 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 3.5.b.6.d.4.1.e.4.a.2.6.1.0.d.4.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (3.5.b.6.d.4.1.e.4.a.2.6.1.0.d.4.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:4d01:62a4:e14d:6b53])
        by smtp.gmail.com with ESMTPSA id 92sm541247wra.19.2020.09.23.10.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 10:31:24 -0700 (PDT)
Message-ID: <41ff899812cb865575969872e09217fc56e7d8ee.camel@linuxfoundation.org>
Subject: Re: [OE-core] RFC: Upgrading rt-tests requires numactl
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Randy Witt <randy.e.witt@linux.intel.com>, Patches and discussions
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Cc: alex.kanavin@gmail.com
Date: Wed, 23 Sep 2020 18:31:21 +0100
In-Reply-To: <711dd8de-1ea7-e3cd-d606-5f69faa7c8a3@linux.intel.com>
References: <711dd8de-1ea7-e3cd-d606-5f69faa7c8a3@linux.intel.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-09-23 at 10:22 -0700, Randy Witt wrote:
> While looking into upgrading rt-tests to the latest version, on IRC, John 
> Kacur(the maintainer of rt-tests), recommended "that they use 
> unstable/devel/latest as the maintained stable branch".
> 
> I updated the recipes in 
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rewitt/rt-tests-upgrade&id=551b25918d06c903fff22d76d5683b548c4f2e6f. 
> However, I know this won't work as is, due to the issues below.
> 
> The latest version of rt-tests requires the numa libraries for compilation via 
> this patch https://marc.info/?l=linux-rt-users&m=158335896221530&w=2. rt-tests 
> exists in oe-core, but numactl which provides libnuma/numa.h exists in 
> meta-openembedded.
> 
> Another issue is that ARM is removed from COMPATIBLE_HOST in 
> http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/numactl/numactl_git.bb?h=master#n27. 
> This may be for legacy reasons, but libnuma can be installed on most 
> distributions running on an ARM host. Regardless, it would need to be changed to 
> allow for rt-tests on ARM.
> 
> I'm therefore trying to determine how to proceed to upgrade rt-tests. These are 
> the options I thought of, which are most likely not exhaustive.
> 
> 1. Bring numactl into oe-core
> 2. move rt-tests out of oe-core
> 3. TMy to patch out the numa requirement and carry it forever(doesn't appear to 
> be a small task)

I'd probably lean to 1, we do need to figure out the situation on arm
support though...

Cheers,

Richard

