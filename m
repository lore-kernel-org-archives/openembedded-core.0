Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.7220.1613734484157737180
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Feb 2021 03:34:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K3FoD1Id;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id l17so6766066wmq.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Feb 2021 03:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=OKIC5OakdPgndioAcfA5tev6ZLxMOE4X+biKgHwGr+E=;
        b=K3FoD1IdUZukVC2vbQFLqHCxq7g9PmtUj94LEi8vydmTYq3Y9Dttl+uYjPw2GgMqy0
         ORjZG8uHXc1Sbqyd1LfnaQ7Bg9KNwrL6CfbbJnt8ZRkren+6O0bnqbVGAvSjlGVkMEbI
         MszWs/oaHTbsYJoGoTatcE1DFYb/bWVSpHB+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=OKIC5OakdPgndioAcfA5tev6ZLxMOE4X+biKgHwGr+E=;
        b=pmpxPxuCr/F7Ybk6cEvr+FEWgUeRWIIu8t88h0OVA7kR+Oi4wTvR+upvXj1S+Sg6zl
         J06YvQYRSkZKRicFwu0CctfGZeWjQdw6cqXMeDpfofVkLUu7EOb1Rb2Y9eY/qSUH5Kh5
         memO8/l9UAxeb8xtX6k7Xv/nssWTpo07BywLfCrJQGqZWYp2JEHsyQA/t3/Pm3wo7gJv
         EDfceA0m3c2tRciK6RMhh/H7RMQ3l35pRQ/Whn3Uk2eAKRLkNcq8eoI3EZl93xkqULV9
         7NVb5f2bP3ue14oC7YoWsdUFqAVDVc+RezjTiB4FT68U2Cq5ZQfQF3UB4nxd7sqtQU4H
         BwWA==
X-Gm-Message-State: AOAM530cOfkHNGL1BgEDzQ5xJF2camUkmUAPBUzBiTbWFEKbRkguyv3U
	m7sQPmYzZft5JJmGxTpJ3iPofA==
X-Google-Smtp-Source: ABdhPJx+FRrMMDLzio0IAt6Ul22FTRES6wZ3T6sZ/nq9+iuZeoZuwBKj3N3e4famVR4FmcCKexbQiw==
X-Received: by 2002:a05:600c:22c8:: with SMTP id 8mr7683102wmg.108.1613734482465;
        Fri, 19 Feb 2021 03:34:42 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:569e:86b4:55e2:a2e9? ([2001:8b0:aba:5f3c:569e:86b4:55e2:a2e9])
        by smtp.gmail.com with ESMTPSA id o13sm15881726wrs.45.2021.02.19.03.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 03:34:42 -0800 (PST)
Message-ID: <617da916aa05ce7cb4c8c0d6367ea02bf1d1ffec.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/2] iputils: Use STAGING_DIR_NATIVE for setcap detection
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Jate Sujjavanich
	 <jatedev@gmail.com>, OE-core <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Feb 2021 11:34:41 +0000
In-Reply-To: <CANPvuRkeiwD0ngL8Ang-v4X2iHUxU9aVK5feDGAQ3kYqST-hdA@mail.gmail.com>
References: <20210218192138.39449-1-jatedev@gmail.com>
	 <20210218192138.39449-2-jatedev@gmail.com>
	 <CANNYZj9W4N0VeTi2WOQYG0c_XzwYX0EwEXD-GVkoUz_ciaoUCw@mail.gmail.com>
	 <623d1b0df8dec2247f9d0c41ca8372cfb0af59e8.camel@linuxfoundation.org>
	 <CANPvuRkeiwD0ngL8Ang-v4X2iHUxU9aVK5feDGAQ3kYqST-hdA@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-02-19 at 11:26 +0000, Jose Quaresma wrote:
> The only change needed on the recipe are:
> 
> -PACKAGECONFIG[libcap] = "-DUSE_CAP=true, -DUSE_CAP=false, libcap"
> +PACKAGECONFIG[libcap] = "-DUSE_CAP=true, -DUSE_CAP=false, libcap libcap-native"
> 
> The patch 0001-Add-support-for-setcap-in-STAGING_DIR_NATIVE.patch is not need because
> with the addition of the libcap-native the meson find_program will find the setcap binary on the native
> sysroot and will use it.

Ok, we can take that change.

I'm assuming you still want/need the revert (patch 1/2) as well 
though?

That does give us a problem since on systems where libcap
isn't in PACKAGECONFIG, the binaries will be non-deterministic 
again.

Cheers,

Richard


