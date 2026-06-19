Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58488CD98F6
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 09:39:28 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38957.1781861961879836837
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 02:39:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aHp3wqXI;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8dd17d7308bso12616546d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 02:39:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781861961; cv=none;
        d=google.com; s=arc-20240605;
        b=AOkyQHVqFsesXIres2F+a7zddaXbS9UEX7fRqD+PqvOnDXdvStGvjtcPcH4XSMdil2
         QJu3U1WHarFOgNAFEWKCcF4czft0OjxEFeuCZO1wTIVt15pPHMipxmT4JgT19RDxNXy3
         bDteuo+jFMgMLGg28vgvAwya9byfTtJj5An5gpxhZc0K+QZLF4DXEnM3lGcDcG9cWg5K
         Jl+GbId4eF9MOhjhQxYGX8TpQUC151cU/PolaDkOAc71/qxOBH/cJP7LmcfT5fv1LdbC
         hh7boe3oMZJ+ANkNHZJ5DSC4Npt0YTt0Aaesej36rUw++9/T9pRS/8gzSYundkpx1Ijt
         WCMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NBxRO8AdHHzb0haVI+s+g3yENFQSJTBxD/2VpDnpi6U=;
        fh=L34c8inDkxOW+Oa6gn4/qepDMbsVQsk08jNdn71Z0fQ=;
        b=Aothx5TFQ9W2RITtf0kX4ClIxt+sBFm+7M4CxJzvceUYkmJXAtJpcqmQOh7MIUI27u
         Ijz50I5dUXv9WVX/dte8oLNEIXx+S7f/IExyorfW5mXAUXK7t8fjxpdPJnCG76Vq8ivn
         ZXJjQjWyhhiZMytVO3SSIBuvMwoG0s+tDjPi5Az1zmty39UoQx0e6fLdCHJTLS5yefRf
         jt5a3D/PxkNUusn3/5PscUuq73dtqyEexUmh2KE26+G3LqcPzA2NO1x8tiF5VCf5YkPo
         6QsMXiJsngk0rekgvuLnGrhkRB8/mKqReHAYVlcffnmUpngId6e+jgB62WvjkkNUPy+j
         rtvg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781861961; x=1782466761; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NBxRO8AdHHzb0haVI+s+g3yENFQSJTBxD/2VpDnpi6U=;
        b=aHp3wqXIj9Q/7gIGcCdFRzc0OGAqOEN0H0ocWJZfHZ5T4zyofYkO/pkwQVDXtcIv3v
         fMh/6gIUwsaOyOKQnK4IwIXFKcduOHGSvkvcGEQcJB7TDwhVSWxyt7exKsPqK77AI++d
         Ul7EqsaLSLqV4DtaOp20zXG3uJuxXtGlCrsNuDX4PuGXswYeqaFz5bJxuSDISxCNuJqT
         zqzTE/oDfSJrPAxb1sCh0t9jhCiuVIiMJffoSA16y300wYXOs/TKzuqTv0U3fGvV3hqn
         y0mWtnBmOhmoC7YCp0wO/6+bN9aT36AUe1WCdzyFOt0r0jQmb+I/1xPNvanYDY3Jjucf
         v4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781861961; x=1782466761;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NBxRO8AdHHzb0haVI+s+g3yENFQSJTBxD/2VpDnpi6U=;
        b=WutCuBuevBGCZ/LYhFx6A9BlaljPUuxx8E2n5NlvNDE/OISr9TVxcGzRahDcoSiT0e
         ec1MJRKyuglIk6rbeziZAaRnOtSMSsjBeOUj7HAZFdzX1KCkGIncdAgk0zM9zBQa6ZkJ
         j60L1qEVKU3ZO9gjKkZdZ6oqlldlQg50/ymTJh4neS74PIks1w4cjVcWAPehRlwee8LC
         /dt1OKr7qjzkH8eYPaelE2L+8ytcgatNpnjYKvoBgs5SDYeX0XwYVEvDby/3NwGpGHFQ
         5eTL97RH7aT+sdkcXnZr8xUb/6TfLxZcwUfBtLe8Yx/qf4idMPWo16BSPowz5HGfTnyc
         77tQ==
X-Forwarded-Encrypted: i=1; AFNElJ+G4tC+tJf86kby39qQFpw9VrLvzkpAopwCYWJoGF7CEvz7STRyFa/YXuybg/b1CD5rfMK3W6edixikKTKo7nL5Pw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw8DXo6vNkBqOQmAjQUvrSXW824501hqCxMY00/OrtxtzruAkjL
	yfNou2Q9/QGAxUCPqUMtJKG4XtGrbedCmQfcWEXEFnL8vTHg91fBxMXBMUFTwShoIX9md4WfNXn
	LRyMSx93NhWjpkEau3fNNOGL7stqW3qU=
X-Gm-Gg: AfdE7cnmRItPh1sK1BTUUZLtvA+WjAGzHjSaeevVyWhJOstTuexqb+YJzPKEYb5dX3M
	/XGjk4o1ZZCMBpEVkbnctxpfz4Xaq59zGRrsbgEP98S5jn2mGg262ATjkZm7ISwKiXEDHACJpKL
	/jXUpI1r0PagHP9s7Q9r0FFqdAYcCgdnoB7gy7NZufi5vzfKjstKTC9tbe5U4SFFoxibumG9i8Q
	vHjx8WGqNvnBqJKBF18RiceY5wYyU7VIjC/9B30RvhVIF2KwHPFaZA0HkpLLHFDCsENIVq1+YDj
	CBlvviZZxlVUImeUPGZ7TFoFmrntJVM=
X-Received: by 2002:a05:6214:478a:b0:8dd:2138:5ef8 with SMTP id
 6a1803df08f44-8de3d45ca70mr46653766d6.1.1781861960786; Fri, 19 Jun 2026
 02:39:20 -0700 (PDT)
MIME-Version: 1.0
References: <SN7PR11MB770572B1859AB0B7EB592DE3CD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <CANNYZj9Y0Fk_DHxTcP-2cqmYnzcD4_VSg5eihwXp1Vc10HbREg@mail.gmail.com>
 <SN7PR11MB770587ED31BE8EE18D973740CD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <SN7PR11MB77056419029EAA594968E1DECD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <CANNYZj8uCJWnkhvh=CecWiawWd57k15wdqcfzc3mtbxoMFqSHg@mail.gmail.com>
 <SN7PR11MB77053FF5985F085C57270866CD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <f2209b0a-c297-463c-97bc-7139732c498c@windriver.com> <SN7PR11MB7705A4E28D635E7CA5B10512CD47A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <CAHDQB6Nc+0tCWyxVxtWfAtGqsFgVbLfwjA-aqH7E7w_p+WTK+w@mail.gmail.com>
In-Reply-To: <CAHDQB6Nc+0tCWyxVxtWfAtGqsFgVbLfwjA-aqH7E7w_p+WTK+w@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 19 Jun 2026 11:39:09 +0200
X-Gm-Features: AVVi8CfXId7yBuDKOveQKtWdvc09t6I9wuIngCQTqRbguxDyA3P_QaeCbuyRTvE
Message-ID: <CANNYZj-XF+OyzDgqaDsAN9kWE=zKMrWkx0xOwMQaO0rQxc0=Sg@mail.gmail.com>
Subject: Re: [OE-core] RPM 6 in Wrynose
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: "Matthew Ware (mattware)" <mattware@cisco.com>, Robert Yang <liezhi.yang@windriver.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Elliot Sparling (esparlin)" <esparlin@cisco.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 09:39:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239157

On Thu, 12 Mar 2026 at 12:30, Adam Duskett
<adam.duskett@amarulasolutions.com> wrote:
> I could use some help with dnf5 actually!
> The last patch series has two problems:
>   - Systemd packaging errors when usrmerge isn't selected (fixed)
>   - Segfaults when musl is built
>
> I have fixed the first problem but the second one is a bit too much for me to track down given
> my current workload.
>
> I can throw up a patch series today if anyone is willing to help with the segfaults!

Hello Adam,

and same question to you as I just asked Robert: how is the current
situation with dnf5? Can you get it finished? Maybe you can just send
the patches as they are, so that someone can pick them up?

Alex

