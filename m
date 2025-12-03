Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B62D1BDE5
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 21:28:20 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27192.1764797291959623869
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 13:28:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L4Qitug5;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4ee2014c228so1930501cf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 13:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764797291; x=1765402091; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=faY5VKohD3UPvarq4R2SkbJ1hx5TlU1C+wH26qgE0ds=;
        b=L4Qitug5xsxGizDTCIkCjQP24AWuga3HdTmHVwWhh7IID2GDo98yWp3feXX6Vs0xEK
         DM8CfqxoezpbWht0iCXc8JA0pDE1c/dXByDsbOBJobymeduGF8x3e50rVLoBbiBdieEm
         +c8kN020drkGrDy999Hf1Bm4XA4RpUiRKPN+43tIh+7TvbZJtylc4ttY4IaFDgu1m4Gt
         oNUhSrM39iG5cdpdcxm2C2mx3UuYCBAceW6tbzgFmaLPNptfME0Z0qw9R5rckP931hcB
         wwZpRT6QV7JFEYMBr15NfsJwrstfY09iYhzhoaCLo1Jyz08JQWFXlCJ6aGBa+wWNrdRy
         4MNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764797291; x=1765402091;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=faY5VKohD3UPvarq4R2SkbJ1hx5TlU1C+wH26qgE0ds=;
        b=MGVY3D1r1QSYgVVc7rzIpUVP7iYqSZF/Q00mLQJdwLu2ldh6dGWNzIb0YqzVVA+CO+
         hNlz4LObYZLVZ84kJ05FQb7zlH+/MPlkW+2rHeMTvIMuu7mprUkdD1jFSZXhHS8zpFrU
         QCwaDbRGprNqmYZhlbGETjYfU7lXRGS2nuqU/GFKQ/tXF+JBKmlQmnmrXRYCDk4o2srg
         m0711/bloNs2RJs+PTb4rfPK+UnRDWWZRMEpm1UnZdsWmAs8U9SECgmwkxIqKUsBXsMM
         Usszxuum237HufGEirVATA1yI9Gtdpm5kEZoDIdDIulYy8y+PehuZoBOZcBvUafsABjU
         +GrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNr8CDpwkhtlaKcNDlEFruH/JgClhMLSu7gk3tLL6N2XQzi5Ljzddl/J+KOo2Hwxq7fHL9DTyATixI53iT2PB4cA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzyLIY16IHYWScjYnjg7w3vBxDRdkp8Du4NdruSng9Y93DzKHX3
	KXuoH85vQ55i1e/2LrIAc270jGFl2Hioou/4kG+KqaInFAFmtjrcztdBhlf+UX0TRTPE50fK1yr
	HfzVZ5pl0PFo9v+9U53iaNR/lXbDkr/o=
X-Gm-Gg: ASbGnctlZSWYjcKJzUMuI0q7I5apPMl1d8v/2bDfa6amyESdmojENVNJSd0Q7jE0j0c
	elYwNMSvMBVIi3C30DgDKsNX+vMdRo3ysGtiWTbNR3A/lEAUjAjcgwhz6X65HYz9G8aUY2hV7rV
	+UXvM0MU1elc3SQp+hqEWcCiYMS1lZAiY+Iveh0OOB86gScBUwDqLDR0gl5nPASIsrVyUBtc8Sm
	vaGxCRu30fiPWCrPBE2BDIR1W/14CXBQDByqZnUU4bMBSbDoBovD56DXh3d6eg=
X-Google-Smtp-Source: AGHT+IHmM/Zryy7fbPLOntJD6pBeH54lRz3dyPXzntbSwxjKQTpZXtSQE49jiqdQUrWd41bFawqMSu6r3O0GYUp2ts8=
X-Received: by 2002:ac8:5d11:0:b0:4ee:b4b:a4db with SMTP id
 d75a77b69052e-4f023ad3527mr9662921cf.82.1764797290954; Wed, 03 Dec 2025
 13:28:10 -0800 (PST)
MIME-Version: 1.0
References: <f5199a88-ed0b-0423-3aae-61f882f8e6ca@crashcourse.ca> <187DD190577A0B45.489296@lists.openembedded.org>
In-Reply-To: <187DD190577A0B45.489296@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 3 Dec 2025 22:27:58 +0100
X-Gm-Features: AWmQ_bm1VdGFSHMKNKIRuvXE-R_8Dz88JwyrfaFGOC2FYuXDZJWwmJHw67F66ss
Message-ID: <CANNYZj8oVUERS6_+eBe48+Z=d6UeyZCNDNNzmiC8u6BZDdJ8fg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cpio_2.15.bb: delete superfluous ptest RDEPENDS
 on "ptest-runner"
To: alex.kanavin@gmail.com
Cc: rpjday@crashcourse.ca, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 21:28:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227242

On Wed, 3 Dec 2025 at 22:24, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> > This appears to be the only recipe in all of oe-core that had this.
>
> I see it in meta/recipes-devtools/quilt/quilt.inc as well.

Ah nevermind, that's DEPENDS/PACKAGE_WRITE_DEPS to be able to use the
ptest user.

Alex

