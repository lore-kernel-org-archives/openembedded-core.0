Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web09.5132.1614903219868342376
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 16:13:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UMjw1sJk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id m1so168346wml.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Mar 2021 16:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=nd47TCSLQIrdMyP2KYfy4qUnJHUpHUUTp4AdfDXVyyo=;
        b=UMjw1sJkkZH8AfRVLS651Ur90l97HsndK1P/KyCc8rx7K5pbVKh+zkImkyzG5KP5CA
         cbP2pqmyiNd2G1g68EAqGXYzkymOca3zihvchpS19nBNEf7j9QBLG5m7NMBecjJd5nrM
         8anz95Iy1QzinciYQT4VCshYN8vFb88Tlih7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=nd47TCSLQIrdMyP2KYfy4qUnJHUpHUUTp4AdfDXVyyo=;
        b=AJBQ7qF6vw4L/6smfq7vV1nivDAQE2AKZugJjG2tOz8mWOp/1ftexmFkDKDfY+gD4S
         gOGuraWSaYYvdbggQN3efYpChnuDpH4j6gzUl2FNtK1GYZhBAS4Kz3JqoKQFRkJXeQhv
         XDGZfSg+5p/sUc8WFvDmaIVMLRlqyJUnPFKwyrJPbK6uHukdDu4yLz7gU+LXsWJkPLdA
         2TUPIGjnNfSJO5FJY2zCwUwimi6kyFEAw++VFi1DhsRZeqOOnB2e+ZdIV7rmEn29JEaH
         Jd/sI+TOgIElX8l2qxUkz9oQXTkn1536MOA7BDnMO5zBGbi9ffDZ7PAhIeDW088p41n9
         89wg==
X-Gm-Message-State: AOAM532FAE34332XqtSNX1/k582uKhuJk2p7I+FBrFP+3HrGRfal1unw
	7b8VsmY/2Fbqj6c9n0D6iClP6w==
X-Google-Smtp-Source: ABdhPJywOGfuOIaWHhFJ3QDI9PxtJ+H0cgqcxgPAWfw4R35uGt5Ihip10bTWJga47nNo98SyLwf0IQ==
X-Received: by 2002:a05:600c:49aa:: with SMTP id h42mr6328430wmp.49.1614903218327;
        Thu, 04 Mar 2021 16:13:38 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:a6be:e9e5:bd97:feaa? ([2001:8b0:aba:5f3c:a6be:e9e5:bd97:feaa])
        by smtp.gmail.com with ESMTPSA id s3sm1306764wrt.93.2021.03.04.16.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 16:13:37 -0800 (PST)
Message-ID: <cd951f10bfdf495c3dd21495e36e2142cf5ca763.camel@linuxfoundation.org>
Subject: Re: [PATCH v6] util-linux: split uuid in separate recipe to allow bootstrapping
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: luca.boccassi@gmail.com, openembedded-core@lists.openembedded.org
Cc: bluelightning@bluelightning.org
Date: Fri, 05 Mar 2021 00:13:36 +0000
In-Reply-To: <20210304122732.2659524-1-luca.boccassi@gmail.com>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
	 <20210304122732.2659524-1-luca.boccassi@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-03-04 at 12:27 +0000, luca.boccassi@gmail.com wrote:
> 
> -RPROVIDES_${PN}-dev = "${PN}-libblkid-dev ${PN}-libmount-dev ${PN}-libuuid-dev"
> +RDEPENDS_${PN}_append += " util-linux-libuuid"
> +RDEPENDS_${PN}-dev_append += " util-linux-libuuid-dev"

The mysterious libgcov.a issues which appeared in builds when this patch
was added are due to the lines above. Changing them to:

RDEPENDS_${PN} += " util-linux-libuuid"
RDEPENDS_${PN}-dev += " util-linux-libuuid-dev"

resolves the issue. To illustrate, have a look at "bitbake glibc -g" in
the task-depends.dot file before and after that change.

The problem is the native BBCLASSEXTEND code can't handle the
RDEPENDS_${PN}_append correctly and it means in the native case it
adds a dependency on util-linux-libuuid rather than a native
version.

Why does that cause the gcov error? Its because there are early toolchain
util-linux-native dependencies which ends up meaning glibc sees a libgcc 
dependency. It usually uses libgcc-initial and that has overlapping files
with libgcc and libgcov.a is the first in the sorted list.

Again, we should have better errors for a native recipe depending upon
a target one and show better errors for this configuration issue. It 
does at least explain the seemingly strange errors.

Cheers,

Richard


