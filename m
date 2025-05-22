Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B82C54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 11:15:59 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.21664.1747912556616909771
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 04:15:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=RzCga/R0;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54d6f93316dso9430430e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 04:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747912555; x=1748517355; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bjQ3DjD+qRWpVF+4WWtJQdEy6/SrDy1xyV7yIaWWi1c=;
        b=RzCga/R0OLwkPE6CSW8DBceUjFKNNWYANc1ZxyfqBt6Mo9BFZirJptc07EilU3wYtb
         re4ik3QBhiYiG3hxfzODwFpmFSSr47waGjD0Bi5dq6yD1CziyXjSsaQQ4cVRE14P0ctx
         nP9QJcL5DvhPRjDbXMD/euqutBjLP9y7Lkk5eSvyHbW/QRyks4bnnTlaq1I5FlIc7Xys
         +v0RIUF55e0q3Tl2VmBi4O9i8ktpFgK0mPJSCyLu+s6zNTpuhabU8kLkT9B6myWCnMfh
         K4DvH1MfwllfVGSQnziobaVzG47YP6yFRyaSULBq4I9qjchdniz8usJhKx/YPcY+Y1z4
         8zLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747912555; x=1748517355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bjQ3DjD+qRWpVF+4WWtJQdEy6/SrDy1xyV7yIaWWi1c=;
        b=Qkd1X9p3IMygwpr95r07Uc0r291PfVXLUr6NR5kR5uHjmu762Yt/EQbZwiftZ/R0D6
         7AuYb90/rrpGli+zw4Tuk5zqwS/aK/kuA4dLOE+j6kLdhvMi+O/Ti8I6RKMxLNsc4TT5
         4ZAPfU0TqBCimZ5mCNDOVhReq/ig6ICqfp87Aei0pDBUR11Lyaw2Mqwmb5BwgeK6A+Az
         tqJfj1qoKz6hoZ2YH6TND242oY7ZZ4vuA3lsmrKfN9IsweNoFOFTQHSFmmnwjfTNA1Oz
         RUaeyF+S+4WdMfJzg2MKF4liGyGPFwCQDa/B0JWUiTeR5zCat6GJQ2weV+mmb/QPxxMo
         TDww==
X-Gm-Message-State: AOJu0YzM/X3X9bVtYg8obggDZrI1TrGhd9AWbrU4oBXDdHvrAgw1xsRq
	ijtRSjPsbAv2Bb8fl31RdqpYMRFyEVQDSkNPjRsmIefPYOun+/8ZDB4EORjt6i3IFzE=
X-Gm-Gg: ASbGncsJOjUn/rxp/q7cUJFbzaoaa9/nUEHXVbiqg+fMOCGfzd+m3h9mfqy8X5GF/Lu
	kSGognawId9wEqOhkbMnuAKbbH+614WV2w5McdqhLi5WD2dokAaL56ztxioTQCXyrbLBkqETH5g
	QpCjBW7vbNkGFyDZW2VLcz6F9tKwRQW1vXs7fiIvxAvVxxxMB+zVyThnW55lF/uwQUG9ttjF2rh
	gnj5CKbrNwIK/CsgCNDh7BqOkH96F5naHkicWQIvHVAM+tBuL/c57qk4BP+QwInxAyT2xGJLI9g
	3pMKTzaZ6IOQZ7YpGb5zZCfKayq715pU4wUb3E3NOX+Hgyvfz/N8UibVEjtUQ8myxcIpoGfvPUi
	K4GQ4OPlQJzYbPuzrzjo=
X-Google-Smtp-Source: AGHT+IG4Rh3471H3tF6mzmRCj2uedR+fxnCPEfbkrmaAdK1BwN57qzCkAwX+ys3i9tzqipm5WzFC2A==
X-Received: by 2002:a05:6512:6287:b0:545:e2e:843a with SMTP id 2adb3069b0e04-550e72323damr7289343e87.38.1747912554716;
        Thu, 22 May 2025 04:15:54 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551f77d0542sm1708874e87.256.2025.05.22.04.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 04:15:54 -0700 (PDT)
Date: Thu, 22 May 2025 14:15:53 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [OE-core] [PATCH v2] u-boot: disable CONFIG_BLOBLIST on
 genericarm64 and qemuarm64
Message-ID: <aC8HaWApJK-u7ml5@nuoska>
References: <20250521184906.181219-1-mikko.rapeli@linaro.org>
 <CANNYZj-8WFy0CWocfy911Gqc4nKYOfyZt4cPKx8PizOZxPNc+Q@mail.gmail.com>
 <aC8DFDTWfC_xGQ8s@nuoska>
 <CANNYZj9kdZm5JhoH50w6DfEWP_AxK5_8dqrEhzCnx-c+-fX0nA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj9kdZm5JhoH50w6DfEWP_AxK5_8dqrEhzCnx-c+-fX0nA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 11:15:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217088

Hi,

On Thu, May 22, 2025 at 01:08:05PM +0200, Alexander Kanavin wrote:
> On Thu, 22 May 2025 at 12:57, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> > We're following this up with u-boot upstream maintainers.
> 
> Confidence in the patch would be greatly improved if the link to this
> upstream conversation is provided in it :)

Sorry, I will add this in v3. It's linked in yocto bugzilla
entry:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=15872
-> https://lists.denx.de/pipermail/u-boot/2025-May/590103.html

Cheers,

-Mikko

