Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9834DCDE001
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 17:12:57 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16454.1782407571056918866
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 10:12:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PiKPxDrj;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8dc544dda2fso558566d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 10:12:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782407570; cv=none;
        d=google.com; s=arc-20260327;
        b=DX0gGGD2roNi4X3fnOWvR873u+fPZZ/BQAoZc/DYvfBWFJsUIXruj6VFwtmO4tJ89e
         MVgt1OCqx4BUxAWDd949wbtk0FTjY5aRig8Q48zFkpuz85qe6/s7zDJUy6wTKFM+IF8T
         gq8YU1+1MZK2OAdFe0gk/sxIic3gGcDtoAwT66rOgr/MG4PhK8j7RdFfv/i90uDHmyzq
         JXQcrpXsRjMfdKp5HOXxMWWJM7+pVivKw5tAglvJM+z+fLIYwK0+tBxucqorUnoCZdie
         nMttnFRrsyMLUzYjPndCE7XEYBH7zQIN/gS0jgIVs+rvM/hVC82IzbAcgiGhKhwL/usr
         xxUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=er4M6lFLf5F6KPxbfAxjfJlywKJbpXMJhtx5WlmUk+4=;
        fh=NMdwUY13f9taNGOP3h9KMSg345J+EAfBYC0xcAnQ8HQ=;
        b=ltr+uEASIWXQJbOvvZog68mQdSUNJeODDyN0V8w2ME/bLEOhBWRSY67DAJEa9zh686
         5MvncxEDVVAlne1VR5zmxHwEHoBwqF3hwXm/ecLC5JM9is13JWre3W2D1VCPHanN147N
         kfK2NQTNZWAww4pdiGjp3n5ATtMr6IAxiR9TWPRU3p7aNlm3xHbmCFtGnLQ+1cHvluhT
         qPHcvORvYwW9zDLYbPtn4ksRC+IDjsLorXDmEqQPCMsY3y0nGZ//WUGPIEx1xagJApz/
         hsPMgNZW25Jj35C1v3P9NDSKvLCjqG5MDP7/K5m3VOavA2jhSDTk1oweMrJ5oYe3cTya
         YXDg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782407570; x=1783012370; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=er4M6lFLf5F6KPxbfAxjfJlywKJbpXMJhtx5WlmUk+4=;
        b=PiKPxDrjyKUh55g2J/4w+sZw83LrW+H1ih1BLUYwUMklBTeME5Qee88CZCSAWUl/9V
         L7lSkhN9ac0ZGemuK0uoAWMGHuTbPayZSvfFGGKHR01aOYCAAj83/E+lHjo7lvoRRYsr
         PohqHS49xdiWDdiXT2B5y5D3wILRlamAn9xg6oqXbV1wnqWSx2+OB9FNAyOt6LgZR3Y3
         x8vfmSI1lQ77hbvYFlu8pXztRVFt86z1Z2SWy6WP3b6Gy1k37q1gkeeDzG2OJn2P5Hpl
         +P2LaBZzdtuk8cyGyF1YAvZv9h5VHzL4+HjQVkhVkiQw1VgVPDDVWvnSElv6qSk/WTQC
         di9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782407570; x=1783012370;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=er4M6lFLf5F6KPxbfAxjfJlywKJbpXMJhtx5WlmUk+4=;
        b=hyWBRHzMEzlEa6SLGRNKIyrqxJdIvDSDF+4PVHFAiyHVSJclhlzFb7trys+/hnMcZl
         CPNiJrWaarKpn3Y5RaFTVbqD+DH9+FwE/y++2zUQMhRZAZabRSksXxD3wJN8+lhhFdsd
         MgUqvGUUxaw4qoLXV76hHiRu/CoqK+qX9Qmb/4wHSHzecjnHx+f0Fh/L/e3YWlREfeQF
         rzYh3LsfP0EfWkSQjcDvRBmsGrQ7q1ptVpLhS792qYnMJfnEkTyEMoAYyedwxKufWtO8
         WGo9CWYB7yzVpHsEdcv33Zw76zGKKYfh7A16xRzdCt2dn3WQHPk/h+OLKoFjqQMGzwB6
         kNFg==
X-Gm-Message-State: AOJu0YyoOjy7ZD4xeWrIobgsD2sK2B5enSm1SDR82eL1ACkFU5qp37OH
	a1vQhQBirOfHxmMqhihIGLnwzbKVv7DJsZPWLQC4QPTUoHjjNkcYK5yJ+fHOmn8+Ib5Z+e0g9lk
	WRD0eFliUwyiZz4eikGdW3LmuX/JmBvw=
X-Gm-Gg: AfdE7cmtkbz8ESteGIbvwb1aJTweruqBJlUcojlDEHE/u97Z82aMULrRxxvyKJVGyjC
	digSo/Z0I86AvqUFEV73Lr9e2ljOXGQZnzMH3PcH6n9IZasSGgks0RCntAMoQAl/qmNRKodunXh
	TkWjKFUx+1D/FXhetegUcY4uQeSf82RWCn0loWrYebLc3rYLqkrTEBTAOEikBbu8jQ3SLTOaM/L
	oAbdk0Cf7ABeqb7rcLHL0FG4EUANFJHnysV0UDLrZ6E9GTMGiR6FSBB6hst0BS0hsNCGUkiEg==
X-Received: by 2002:a05:6214:e62:b0:8de:9230:7c77 with SMTP id
 6a1803df08f44-8e6d4bfd327mr59411686d6.25.1782407569927; Thu, 25 Jun 2026
 10:12:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260625134210.4046622-1-daniel.turull@ericsson.com>
 <20260625134210.4046622-3-daniel.turull@ericsson.com> <CANNYZj-YEH6Nbk5A+ste7RNa0MyATwFZHO91Q1iC-+Qaf50JYA@mail.gmail.com>
 <PA3PR07MB10721D0B5720F489999AF31FE8AEC2@PA3PR07MB10721.eurprd07.prod.outlook.com>
 <PA3PR07MB10721EC942E3A6F2418A9953F8AEC2@PA3PR07MB10721.eurprd07.prod.outlook.com>
In-Reply-To: <PA3PR07MB10721EC942E3A6F2418A9953F8AEC2@PA3PR07MB10721.eurprd07.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 25 Jun 2026 19:12:37 +0200
X-Gm-Features: AVVi8CdpfH_CK1rlaiuAMcF_ZWNLI5hBZxAYXUnHkJ552t7fhx86poe0wBA0HZQ
Message-ID: <CANNYZj9H=r7hScOW3+dn3jeD2ek=fpm+ghLDdziJ+8Lvt=FGAg@mail.gmail.com>
Subject: Re: [PATCH 2/3] systemd: upgrade to 261
To: Daniel Turull <daniel.turull@ericsson.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"anders.heimer@est.tech" <anders.heimer@est.tech>, "qi.chen@windriver.com" <qi.chen@windriver.com>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 17:12:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239585

On Thu, 25 Jun 2026 at 17:53, Daniel Turull <daniel.turull@ericsson.com> wrote:
> Hi, regarding the tag, Should we add the check in the patchtest as well so it will be catched there? Or in some qa?

It's the first time I've seen it removed accidentally, so I'm not sure
a check for that is worthwhile. If you have cycles to spare, I'd
prefer you adding tag= to remaining recipes that fetch from git and
track releases (rather than latest commits). Those have been gradually
added over time, but there hasn't been a dedicated effort to cover
100% oe-core recipes.

Alex

