Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF461C3600C
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 17:54:27 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.2813.1743098064165643293
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 10:54:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y0fN+fSZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6e8efefec89so10321386d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 10:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743098063; x=1743702863; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tMndSBKrv6uuSCV+dsqvHZldSsxdjWH15AE5UaII7Tw=;
        b=Y0fN+fSZ4Zl9gPwqAkyqoNz69CuA9FO/mTS3X4r7MHrohJVs+JmMBfJ1ebibNcQ84U
         Hpa8fl409spqjix+kBxjozy8B/83Dhnld1kYW0IWB+0dvxKieKZn/Dvj2fmrLZh3MK/X
         R7RY2RjU08k+pNb3H2+Xy1sfGjso9LBGSMWFK/4yeIDNT/cXCKkufzCKgTJXJ7EoVbOS
         zsWSyq3mi8m79W0in8DA2fwvyy452ewOh1ViPfoDxpt+vqbOXzz70HmEWFMa6cXQ/mIk
         dZzIo32ozPFy15R1QRY9qcqeq4DEDil8Gb0iUJryHGkqXHhK/29VPi8OFMx3wfmEgakV
         8hhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743098063; x=1743702863;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tMndSBKrv6uuSCV+dsqvHZldSsxdjWH15AE5UaII7Tw=;
        b=bGaDoNhchPigBH9z+li5ud+s1uIs7ES3WOVG2AowuKZqsjznANft6hGAdyqO95IpT5
         vXReGoRGezXd7V+UcO0waaKOaImgv2ZqhaQHbJN1tTvGcJcwmtDn6POHzwQnt7P0s0QC
         J/MvzFuqysZxjzioLupRkwETzFPbh23UPqoWH0bGKAeChbK7t3wBEU/3/sHdaO0AAqGr
         umpoz1t0oTwSPmEIzwJAhlqe1z0Icxv0FURYlVThJPzzd8DTIZErrG6Ey1oK4RP6RERT
         7wGE2BkTSPiaZgFTudROuog4hqBqD9pgi27QMr14SijMZJmetG31vzpU1imud3jgbket
         1HUw==
X-Gm-Message-State: AOJu0Ywoc0gkUYd8sWBLrRCTMNPudKwbWwhH7txRm/TAlUKDlLn0USiL
	tG5SKBjEyn0FWkgNQ7H1HD0tm0qJh6EVDoAt9nJA8tBdZmpMghOfl6RHgGUupXmNKFzc206LMEM
	j49+S9PaqVmb1fy49vc1xa7rhcDI=
X-Gm-Gg: ASbGncvE+4uvhfQTrjY9+hEKMdUXI+UXROnaGQOp1S64z5mfU7Orx80R33BiIFceCPN
	F5AZmd+BAjWf+QmKoyVDWAwbwqS6QtXroTAcg8gvyrkSZxQSNLRsrkOHuJytDiqXlP3uIGt1EVe
	EZINi/mvy6E2gmcECBFWU2mqeGrDAMkvplbHmUy7JwiKJocU4Nh0+tbYchXBuj
X-Google-Smtp-Source: AGHT+IFiWMw+yloqlhfBa2GbCnKgIov6TzmOzqe9yP1eXFrenJ1RkoYAhaMPfkteYGkigoCsFLm5RuRC790Wl6RTyME=
X-Received: by 2002:ad4:5c42:0:b0:6e8:fcc9:a29c with SMTP id
 6a1803df08f44-6ed238be16fmr74276836d6.19.1743098062984; Thu, 27 Mar 2025
 10:54:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250327123701.3906604-1-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250327123701.3906604-1-dmitry.baryshkov@oss.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 27 Mar 2025 18:54:11 +0100
X-Gm-Features: AQ5f1JokY4pRWZr6_4cXyvEuqvzqI9ReGyn1UanXpfFCvA_3VWa8gBxMpBvFJs4
Message-ID: <CANNYZj-MktGQNmmejNBici+8wjPWRCZJfLCYV0T+2ETrBWEArw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/8] mesa: upgrade to 25.0.2
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 17:54:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213773

On Thu, 27 Mar 2025 at 15:20, Dmitry Baryshkov via
lists.openembedded.org
<dmitry.baryshkov=oss.qualcomm.com@lists.openembedded.org> wrote:
> I think this approach provides a good balance between OE-Core being
> stuck with the outdated Mesa release and being able to upgrade it,
> bringing support for new hardware.

I like the approach, but I don't particularly like the volume and
amount of 'Inappropriate' patches this set brings in. This will
complicate future maintenance, and particularly version updates.

In addition to what Ross said, can you see what can be reworked for
upstream submission, and what can be at least reported to upstream?

Alex

