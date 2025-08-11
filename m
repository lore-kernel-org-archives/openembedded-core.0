Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C24D2C87FD2
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 07:33:24 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.42742.1754897595705009881
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Aug 2025 00:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=elD+XzlM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b794a013bcso3459021f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 00:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1754897594; x=1755502394; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UT5hvNmaGDjPUHDVA5In2pJIMlskw8DTZpHW8DK0U2c=;
        b=elD+XzlM1GXeFtHds6UC8YLnzRHz3Wu+m0CoWztemxl4erXuXobzMx5gcM+HH2RjrR
         ABBTyG55HgOa9897FJNFsAz7zoizuBzc2q97nkEAqnC3g9BDpb7I3MZ3ebrJyXmKKWzP
         SWpMJX2ffjhIaVR5US252WMR5pRLB1/PLsBSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754897594; x=1755502394;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UT5hvNmaGDjPUHDVA5In2pJIMlskw8DTZpHW8DK0U2c=;
        b=vR4PXH7eR/QigzSE7yO0BPSPxfHN5lEEXRoyx45ZpBs+CfPweIRpGaRMimRJ8ZMUqD
         4hXWwVK27HBrA3NSrrfm1OzPFNyODqnBhyGtFbnGh2WrZuKAf+y/Ce85826dORNf2BGT
         VFtSlAEDscaCiPVETPmctE0Fy2tgVXrJxv42w/8JTG2CNRIKJE0vLFHmuKnP0Ol1X5ON
         zKLmdNSth3kNUs4DyLzDPMXRPQhlgYRD+Pmj37gYP0hSqF4iDa/huRS01Ow2RMW2prWY
         9Zk2XVixy+nB6eefNHE5zfe5rQf5nTqnwEMHiqQy3LEMmOkJiAVcUxGSAaWhEAOnRIUe
         AUhw==
X-Forwarded-Encrypted: i=1; AJvYcCWB77/nwd/Eg8RU+WIdwu5A15/cN9kBEtPwmCFS8b8SuQKpBY7LRpLfy1Ob0TRbxYLaRM5ey8QyPP550t6J3E/CvA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyAaHdiE2Wcl5eQt/d8HjCu/E96cYD06TAWcCkRm09LyaYafBe5
	N3KnRAQXwjyCTju6dFM2AHi0Sds3xK4eAcRS9ju9RwulxVu8tmQJKKaMyZ5MnuTzzuw=
X-Gm-Gg: ASbGncvbLPvszznOOynTRJao666ktvrvMrnTYSyVc/URie3xB4Jo4fXLa0wlEN/N8JJ
	PIsiqBhp5BgG8jeh0+lAMPYhZcA+LaxMl/dVMDqRou1l1CjAbkUmVxRNVpmq0DsOneyq5TIKO1y
	eQ4c/irhgxREUqC5QmqsKsFAc5d9Ru5GmXukaxu/3BGaNEYCNLaXNgrjpH+jchExQkQ4pUqf4uX
	rGyRU3FTl1hvuh8n/P0ZVvTUAtZeM+CYnpzNKXe7r4bUar3hiaPb1ATHF/Zk2wYn/RqWHkaKouB
	XXzDRCxz+zGJos5zLAdFuy+46fHWsCFC9Qw3iaWk79az8b7f1lmVNYtYUg/fvCJJDeelLDFHMfF
	LgQumawWAgaSoJXmkXu3KiesRCTlLUSi0yb8uu0o5rpWwOr/17wy0i6nFVJrlUhN6KzyioZnFH+
	AIKPoxhu5l
X-Google-Smtp-Source: AGHT+IHWaEK7mgj93R0/DNu8bcGjqZUoMyZi621EBiL7iV9g9kRfTxuQZ3FQ97Wq4DB3F6/jf56v+g==
X-Received: by 2002:a05:6000:420e:b0:3b7:dd87:d741 with SMTP id ffacd0b85a97d-3b900b78c90mr8833082f8f.42.1754897594037;
        Mon, 11 Aug 2025 00:33:14 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9048:ef1:b71f:8c96? ([2001:8b0:aba:5f3c:9048:ef1:b71f:8c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a053a9019sm53043645e9.21.2025.08.11.00.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 00:33:13 -0700 (PDT)
Message-ID: <f61229847498d7aa8fea40d0e494e97362fb1943.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] machine/arch-arm: Append TUNE_CCARGS_MARCH to
 TUNE_CCARGS conditionally
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jon.mason@arm.com, Khem Raj <raj.khem@gmail.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: Ryan Eatmon <reatmon@ti.com>
Date: Mon, 11 Aug 2025 08:33:12 +0100
In-Reply-To: <DBAPR08MB57986297CB7002A0526D376BF022A@DBAPR08MB5798.eurprd08.prod.outlook.com>
References: <20250805171619.1357193-1-raj.khem@gmail.com>
	 <DBAPR08MB57986297CB7002A0526D376BF022A@DBAPR08MB5798.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 07:33:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221721

On Tue, 2025-08-05 at 18:55 +0000, Jon Mason via lists.openembedded.org wro=
te:
> The patch below corrects the error we were seeing in our CI.

I think I need to step in here.

Just because a patch fixes a regression, it doesn't always follow it is
the right thing to do.

I'm worried we're creating a mess of various "rules" about what can and
can't go into variables and we're going to end up pinning ourselves
into something unmaintainable.

Yes, the tune files have some complex "rules" already which need to be
followed when changing them or writing new ones but I'm not convinced
this patch improves the situation, I think the opposite, it adds more
rules (most of which aren't documented).

As such I think I'd favour a revert of the original patch until this
gets fixed in a way which doesn't involve changing every tune file and
inline conditional python. I appreciate the original patch was needed
for clang issues but that doesn't mean we can't find a better solution.

I need people to help step up and maintain things like this but it
involves thinking about the overall structure, not just that a given
patch patches up some CI jobs.

Cheers,

Richard


