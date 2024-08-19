Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3EDBC3DA4A
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 11:21:46 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.208277.1724066499274388616
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 04:21:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JG3JKxZv;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ef23d04541so50781631fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 04:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724066497; x=1724671297; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/TI+qsBTli20jBojck7FuG9DBj0g1yYBRnMcaQPxhss=;
        b=JG3JKxZvyuKQVvETJ1qGxVaWaeFaTJ2os1STmU7rLz0QMCDXWwDKKeP2bZsJ1fApD/
         qn4+OHYO9H3Gy5KVbepqXDPR7NaYR+8ZyypiHfLHOReajaBsQh41xKnDZ+MD5GDlnxTi
         Eefl5lJhcDdPGUDVziMCLpfPdzHVz43444pqbjoA29Li7MpfrgN6Vhjw6pe+HOZ9cPZ5
         gKb8dh4OMFfNB0vmIV6XLzc+vmwuox+i+09QQ8Lmd8eLutJBJLSbhkSUnThsKJEmPXr0
         2dRoGoq7NLX1eIvW7zsiCC0E+aHxUVBwPHKgzDnKCfpO5lrJRlB9YUDa7l2hn8Hoz59p
         +p5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724066497; x=1724671297;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/TI+qsBTli20jBojck7FuG9DBj0g1yYBRnMcaQPxhss=;
        b=uhzMdiryyhvLyWXsG12XMNXWGAY1gz8hMtoeN5t5QUMhlxpKR/rXNqrGxhhV3bgyGd
         5WGy+fcv7DHrDzLELmqBiUKQAdUV5njkr81yhCUAfR819Qbef4omU/NaVTKFprSoa00q
         Wnr/57EA9iMKGIgfhlt9E8+XvGNEqYa+njsIUdLzl9UwAdWCEgCYGXhSe9ybHtz4oL0n
         L12N/qL9EGKm5YX/kLL0wCCA5Fh+TolQSBUe/kqey2+WRQ2BcOEVdN2h5peg/EdK9VF+
         WEVCcClzZLSo4Yuebna7Rp1iBerwlensPd9jxgdCqlh8dd/1pRdR4ElvOrZtmVuAYN3m
         e1gw==
X-Gm-Message-State: AOJu0Ywx3AgWDfLVk8Vmg/Pq+rFG794YCamnO4m7OxnGr20O1LtSvZPy
	hpb7nSTKTpWao/RbczPtZggxWCnPy9i7zCQme5vUDymygQylT6d+2l5uPEPqY5hVlx+zaM9IVRe
	vwMfQDUwUYXCw9KTTybUufJnu6V4=
X-Google-Smtp-Source: AGHT+IFZ9f03jyduYw+Zc/mpZLiEm4sC4bXowofL/nju21Aae+GlGh5+2Vst5koEYovu1uYssT7MvUAfaTC0JY2g/Rk=
X-Received: by 2002:a05:651c:504:b0:2ec:568e:336e with SMTP id
 38308e7fff4ca-2f3be575a3cmr72249491fa.1.1724066496657; Mon, 19 Aug 2024
 04:21:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240819094701.27210-1-Deepesh.Varatharajan@windriver.com>
 <CANNYZj9MxBgY-v=vDyhqMn_euNAtT7Am1EJN9Xc4s_7t=jD8qQ@mail.gmail.com>
 <IA1PR11MB73203EA21C1DC3257EE94C80908C2@IA1PR11MB7320.namprd11.prod.outlook.com>
 <CANNYZj9yDyd984X8rD7VuxsvUezLXMJq35hAN_b=Lqq8q7eggA@mail.gmail.com> <IA1PR11MB73208F20FD47C2F6B27F39D2908C2@IA1PR11MB7320.namprd11.prod.outlook.com>
In-Reply-To: <IA1PR11MB73208F20FD47C2F6B27F39D2908C2@IA1PR11MB7320.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 19 Aug 2024 13:21:25 +0200
Message-ID: <CANNYZj9at0jEj9AcjmOOZnZYNkSNHDiw3g6FeZ2y4B_UeZB7JQ@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] rust: rustdoc reproducibility issue fix
To: "Varatharajan, Deepesh" <Deepesh.Varatharajan@windriver.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>, "Gowda, Naveen" <Naveen.Gowda@windriver.com>, 
	"Moodalappa, Shivaprasad" <Shivaprasad.Moodalappa@windriver.com>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 11:21:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203506

On Mon, 19 Aug 2024 at 13:14, Varatharajan, Deepesh
<Deepesh.Varatharajan@windriver.com> wrote:
> Yes, but the rustdoc reproducibility changes from this patch are not there in the  Scarthgap branch. So, the missed changes are backported from master branch.

Why do we need to backport them, if reproducibility test is already
passing and rust is not excluded from the test? This does not make
sense, and needs to be looked into.

I would suggest looking at the point where scarhgap and master
diverges, and checking what changes to meta/recipes-devtools/rust
happened since in master. I just did this, and I'm certain you need to
backport additional commits from master, but I'm reluctant to tell you
which ones exactly - you'd learn more by doing this exercise.

Alex

