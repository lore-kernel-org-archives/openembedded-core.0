Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.2265.1592847422926703319
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 10:37:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Knx5r83a;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id f18so374655wml.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 10:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=LROUktLHY6lt5bvB/kNu990exvOZHCnKmTkz/AxEM2E=;
        b=Knx5r83aQpxSPwaSjadJjA0YPzTice7tlWJGihNlZYcLrGRyJeYAhfzHinGOhlPDTa
         RpwkVsPRCzDNKZ0ru8VqHmSoILSvSl54pi3bn7d5OsNHVLY46KsqPq1qdp7xxuKsPXH7
         y2Rf1EtDncQE4dQjxYVvUgN6DG1dMr0pOcOMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=LROUktLHY6lt5bvB/kNu990exvOZHCnKmTkz/AxEM2E=;
        b=mlruv4JDYJL4CVvF9JNMJ2Z7yqg9JgW6o5kghT0UHNNAXuYE9bhsWLS0//fxE8RZjX
         oD5EIfwlEHuIUlnjqNk/br9cCNc5m+DtZW3ySMS5RXjtb1Lpz/m+WJEdVS50kHOaSs88
         JW+G5K2+yen9N9shTv7/8XUNMLwMbo39mgT4F3IWwHsiwSo8w+Sw0LWxhmXuIa8RWEvQ
         9EQuYDnxqmDnrqiphsi3sHXH565ngWxoI8TyRnA/G2l4thD2UJGRTq5SKcazg63/XV3X
         e/OJSFNKMRHlIyQ56w3Xq2/P36zxNY36gSjf08CQ15Dd5LAxDTQuVWX0HaN2xYfCSgDe
         gfGA==
X-Gm-Message-State: AOAM530LC88C6rzTwO9G5yrdMNMLBbIDNyzxaAEEZV2Hnu3GJe94vpVT
	XRWhTiTM/kidJO0WvS3bqns4WA==
X-Google-Smtp-Source: ABdhPJxZH6naFY/UG1PtQjo7yjx8l+Fkifc0LtWGz4X/PMYl389VuGddtuFNHfQoJWSDnU2dSDSg+g==
X-Received: by 2002:a1c:a7c4:: with SMTP id q187mr1998159wme.0.1592847421487;
        Mon, 22 Jun 2020 10:37:01 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id t5sm7395486wrp.84.2020.06.22.10.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 10:37:00 -0700 (PDT)
Message-ID: <2c5679d5c03b85eb57f47422220cbc50d1d55e7a.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH V2] qemu: uprev v4.2.0 -> v5.0.0
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Sakib Sajal <sakib.sajal@windriver.com>, 
	openembedded-core@lists.openembedded.org
Cc: Joe Slater <joe.slater@windriver.com>
Date: Mon, 22 Jun 2020 18:36:59 +0100
In-Reply-To: <20200619181259.39059-1-sakib.sajal@windriver.com>
References: <20200619181259.39059-1-sakib.sajal@windriver.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-06-19 at 14:12 -0400, Sakib Sajal wrote:
> Major update after v4.2.
> 
> Changes:
>   - os_find_datadir() was changed after the v4.2 release
>     causing v5.0 to not find the bios and not boot the
>     image. Fix is sent to upstream qemu.
>     See: qemu/find_datadir.patch
>   - v5.0 binary had host contamination for dynamically linked
>     libraries, "--extra-ldflags='${LDFLAGS}'" in EXTRA_OECONF
>     resolved the issue
>   - bluetooth code was removed: qemu.git$ git show 1d4ffe8dc7
>     hence removed PACKAGECONFIG[bluez]
>   - -show-cursor qemu option is now deprecated, updated
>     scripts/runqemu to use updated option instead
>   - added PACKAGECONFIG definitions
>   - added qemu-ptest to conf/distro/include/ptest-packagelists.inc
>   - increased support for ARM architecture, cpu and board
>   - removed patches merged upstream and refreshed
>     existing ones
> 
> Testing:
> Build core-image-minimal against the machines in
> openembedded-core/meta/conf/machine and succesfully
> booted with qemu v5.0
> 
> Ran qemu-ptest on x86-64 and arm64 with identical results:
> PASS: 1166
> SKIP:    0
> FAIL:    0
> 
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>

This is in general looking good but we did see one error:

https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/2050

which is strange as its only on the edgerouter.

Cheers,

Richard

