Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E33CAC5B0
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 15:23:28 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.12074.1759418604234507131
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 08:23:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UIwpeaGI;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-80ff41475cdso15610036d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 08:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759418603; x=1760023403; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fy0bLxUO/yIStJaCYpzwBvdtnXUJv54o2Rfvdxm2D4w=;
        b=UIwpeaGI/Ma5hT3wTM1waw4WMJcuK0aFuD/Dml4fLYoJqwhGds30Y01pZLCmgF0lHJ
         cicBCDhrKDmfsKxSq9kgUQyGZe42NccPt19yxSGVSNiu9n7dhjt4h0dHyH20O7+njBsN
         sLWE6OzY8mPXl89/gzfZXTtHi3jXpc7/M8+MWCM8Lc+hPt35hUeq7Qd2ThBpuig+eh13
         FP6RHYJJTISnL2bVQBpUsKYsNMqc1VXwsqkf6irUeuSW0nWdXb5OaJ5tofqquYh29Uhc
         ecnkmBahf7yHBOqndSvYFc81hDxucvapK2+bj4fjXZDhSSgZfoD7u0j6Uhckh64dghzz
         kr1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759418603; x=1760023403;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fy0bLxUO/yIStJaCYpzwBvdtnXUJv54o2Rfvdxm2D4w=;
        b=I76gFZfmJ95SiyiBHq7hrEJDDKvXXWBKcchZjYTmLHU4z2v97Z916p/5p3MmLbvpTK
         byqUz3ltsM3jpb9FMK6woMaYVM3oQ/Wyal10PPC2oFuE0Fe8mncEBTaTdtGxPpNpybQZ
         eakQn66/VHwuFN46p5o43IEVRvbAyjbGE3xydv8xxV9If3N8MLqH9HbJ0Y2Oc7N6CyLX
         DPv4Z2qTi91HIfjrp3pOjpT1BHNbdavZO1lZYXBO3GMPkOULcqGfEez47y+fc8Q/5xbH
         Y6JLainQqusWf8Ux9N+MlbepHnGnxPNGETYS8ZZFEP/eEjxpT7N4ilNKQeCnq9xfKz6n
         ZhMw==
X-Forwarded-Encrypted: i=1; AJvYcCVwsGHRkBkTo+6VX9plXNW7CqDSZ8Z/Q/5YK1yjfxAsylsAlCmZSBcsJyUYC6vLGRGznnyaPvlfrLCqJCTiA01AwQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy6NOetlIF0xcdhm+kzL7ddKCdVoz4Fu7syGh/cRTlFee6ZhUES
	E0+R4tVRtz+tGNl/rWHam/zPqq5BMhljoqA0kbYtKb5FIKl5Qc9HjbdalmcMDtVsrohIdZNASyr
	m3fhfG+48+Wj5ZgmYeHvSuvz/k3Aqyhk=
X-Gm-Gg: ASbGncvM7qc7byancLlaurmFHzf4koF2MDxZqBR9lqRYr6lI2WYsNvgb8up6vihmR2p
	Vk9BV8iId930F1UShtglpNGnXvMoZLn0FOjlFDSK/+deuJPl2p93Vk720708bKfVcLDxPtHr99q
	nn0m1SFqCoet+u0n4+1+QXxFNHwghq/l2eFC45udPjq61ZvI38Bj5pCz+A9RIoPHSCcmCn3PTR3
	dXOUHzhil7d915owVhADBJTi4sFXkx1BPcxcT8JhlptwsdY1eDkBUw0SSUZwFolEedPDtwxcq6G
	dm1g6PlZa4Svm+FNCpRanliyk5OjVsC6BHk1p1a4YU6Q5HL6GNbhdYdIoReNiEhj
X-Google-Smtp-Source: AGHT+IGo1pCkPiXu3XVjtU3h5TEakhggJM897A7EsXumpaWsHqAOticZgqXekqCyGCcFR7ZNvX1C2rnOujsmimLiNQg=
X-Received: by 2002:a05:6214:da7:b0:785:c22a:95e5 with SMTP id
 6a1803df08f44-873a9890c62mr113466526d6.58.1759418603016; Thu, 02 Oct 2025
 08:23:23 -0700 (PDT)
MIME-Version: 1.0
References: <20251001152850.1342075-1-anna-lena.marx@inovex.de> <20251002151353.88813-1-anna-lena.marx@inovex.de>
In-Reply-To: <20251002151353.88813-1-anna-lena.marx@inovex.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 2 Oct 2025 17:23:11 +0200
X-Gm-Features: AS18NWB19V3PxvpAOlWhq1hdZaieTMcdU_8tCQPbXjoXp0piAi4MenN96Uht4G8
Message-ID: <CANNYZj8-unZ3Qhn54Pn2Wf0toqtKtX7UxWRF1Mj_4Pfw-8Vy3g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] sqlite3: upgrade 3.48.0 -> 3.50.4
To: anna-lena.marx@inovex.de
Cc: mathieu.dubois-briand@bootlin.com, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 15:23:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224369

On Thu, 2 Oct 2025 at 17:14, Anna-Lena Marx via lists.openembedded.org
<anna-lena.marx=inovex.de@lists.openembedded.org> wrote:
> +Subject: [PATCH] hack: disable rpath in sqlite3
> +
> +sqlite3 does not implement disabling rpath as an option right now.
> +This hack uncomments parts of the partially existing structure
> +to do so for disabling it for Yocto.
> +
> +Upstream-Status: Pending

This seems to indicate the patch is a work in progress? Will there be
a non-hack version, suitable for upstream submission? Should there be
an upstream ticket at least?

Please do not misuse Pending by not putting any further comment into
it; it must have an explanation of what is pending, or better yet,
develop the patch so it can have a different status, e.g.
Inappropriate [reason] or Submitted [where].

Alex

