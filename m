Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C42C48BEB
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 11:51:16 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.12244.1707997873357124325
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 03:51:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=llYz93VD;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5114fa38434so859672e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 03:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707997871; x=1708602671; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A9FU3hVOtLcNup6UzQ1ArUkpdBKMO1XZ9K7hStDj5tA=;
        b=llYz93VDNfu9IRhbf/oa0wH0GYoQVP6nUPFfQDAZTochY6MP55wEdu4yUl7/mIu+Na
         qC11/1XWHwQEd5TR3mzZP5sxkHAIWI1nEtfB5iiw2mxL1IL/zKMvYbn+2uJVr5Bz9fU3
         r5FSVEhggtZC5N8/STtGQxLqvkmDt4StmYnkz8OJ6Gu/m2yVU1t6XDnfgZ+l+0uEzacB
         Gq1gkm4wB31tGRJ89Ne9QQ3m6nug7qiNSRX1kpMxNd42aPZzsG+qFq36ph/7L11nQy94
         CI97T5GaD+gG1mb6/jb5k3rCu030IjXRSQTp9xc59bCNguUoRTIRlMKy3jDgBbehubas
         Y1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707997871; x=1708602671;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A9FU3hVOtLcNup6UzQ1ArUkpdBKMO1XZ9K7hStDj5tA=;
        b=VDygstbutQkqg1Q6WIsfxxLSLMgkxeAeEAP3GygpTP67F32BUAHC02Q9Fxf0igkBsK
         Kx/UdJQ3Eod0yXZxGFxOIjLVh7KXtu0oDzH1mlOKvkBkYyEvfXaM6t9wriqTfh3DTo7Y
         HNrRWNX1WrfzU7JgMX3EobvCmyfAq+pw/iLDCsnwGLbD0rRpVrCA0eMHzmutMV0kvSCU
         w/FBFr1vmzeV1hMeqAQ9vdCXL7FmtKjSxVDuHLDJrxX0Ra39litwuhmaqm/6dGSFv7WZ
         gB/w1fQe1Syencm8Lx2mos3F7PbgzFmOrLEpgBKBTl+qfGsT1p/mditH8YTsCgLSofN+
         UClA==
X-Forwarded-Encrypted: i=1; AJvYcCUWYWRPozyxCtaYBV9xr0Rz+4dsF5J2d7Sybu+No1ixwFh797noUF3BIWdgxusRGw3Yr/UMhJ35nWSlmaqKTU5g74lTmOLBzfC9WaW+6JQQ+Mx4ytBXPh3q
X-Gm-Message-State: AOJu0Yw2FELtdtxiR7j+6MMb0s12Kq8WsGNHYSsT04Yfz5Q6IK0tBHrL
	u91pVAwwXZvBHZbtNXAow1Mr2tJsI7Yq0rNAfJkHjW9uC/Q540YNlvtwIloinwxxOBNWumnFEyO
	6Wezlblf1eH1nbL1oPRhrb8DUNlc=
X-Google-Smtp-Source: AGHT+IFAndkNwhPj4GvbDtX6xN7tBQ0ZCsvLjqRjZWuBNZ6n+1xZN2nzsEZtYu3MqM3afeMACVfS3PEY7mR4/kqLFVk=
X-Received: by 2002:a05:6512:3144:b0:511:84fe:8dcd with SMTP id
 s4-20020a056512314400b0051184fe8dcdmr1359282lfi.1.1707997871353; Thu, 15 Feb
 2024 03:51:11 -0800 (PST)
MIME-Version: 1.0
References: <20240214181453.795654-1-f_l_k@t-online.de> <1A350816-2A84-452F-B41D-E99BE46C4D82@arm.com>
 <c2fbb0a0028b90afef28f92b3b8e9c37746bc4c1.camel@linuxfoundation.org>
In-Reply-To: <c2fbb0a0028b90afef28f92b3b8e9c37746bc4c1.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 15 Feb 2024 12:50:59 +0100
Message-ID: <CANNYZj-UK3F=xkVCgPWDqJBq_PMMqfQzXd8AmOM14RCJREj1XQ@mail.gmail.com>
Subject: Re: [oe-core][PATCH] mesa: update 23.3.5 -> 24.0.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@arm.com>, Markus Volk <f_l_k@t-online.de>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 11:51:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195512

On Thu, 15 Feb 2024 at 12:44, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > Mesa 24.0.0 is - as clearly indicated on the web site - a development
> > snapshot.  24.0.1 is now out, can you upgrade to that?
>
> FWIW I did take this knowing that it was a development snapshot and
> they we'd be very likely to be able to update to the .1 before release!
>
> The timing of this and the llvm release is always tricky.

Mesa upstream does describe .0 releases this as 'development' in
release notes but that description isn't hand written and comes from a
template somewhere.

.0 are always preceded by multiple release candidates[1], and .1
always follows quickly. I don't think there's a real problem taking
.0.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/tags

Alex

