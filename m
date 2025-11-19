Return-Path: <jester@theyoctojester.info>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C64CF34A4
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 12:45:36 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6022.1763556329190228306
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 04:45:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theyoctojester-info.20230601.gappssmtp.com header.s=20230601 header.b=Dd/BItks;
 spf=neutral (domain: theyoctojester.info, ip: 209.85.215.174, mailfrom: jester@theyoctojester.info)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-bc17d39ccd2so3417135a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 04:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20230601.gappssmtp.com; s=20230601; t=1763556328; x=1764161128; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PXDaTzyeZoCGVFqI5q+/dYmHatY3aqouBemn14cGQ8k=;
        b=Dd/BItksFqzOa898rFTGmf6PJG4djpMePSxPcuHUQXPDpr98x0R4JCLHl59+j1Sj69
         yZrA10GqaAe7bj3IOnLHYuyd3K0l1jEuqGdaQohDnG7f6N5Qx2IIyoNcXKMMPYJ+JUoT
         YqjS2EpILcn0VAzxJR3Lho06KeccZuY+v9lVoF0hEXTcxntbWFVhoglaE+r0rdH0w+qN
         Sdveb6cRqVSrmEUrI49PuPuqp8jUdo3pkVHxl+GsS8mO/Lm6luwCb88BrV7rz4yOdLC8
         Rd5JXUUIZrXzj148xyVoLFlYdZKRvF7wiNOU8SAOC5fq0vJ3UXEod/lgLA4jr7NcAYfn
         PzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763556328; x=1764161128;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PXDaTzyeZoCGVFqI5q+/dYmHatY3aqouBemn14cGQ8k=;
        b=g2mf2gdoJSBwuSOaiUVcYZ/ruLz1KKGrIY4XvMteQIrhN8kZWz3bkK0PqVuMxyRFeW
         U6he+orXHcx1MLDVhEx/zHnxPPw0QI34qGVSt/HGVSLVV3e20fYY7WBJZ7t20ZIyiUB7
         98fqEgLw5qk0lpEGfr4VBYFybFBbJVQU0SdntY86vQD72Qt0kBlIlJ81DfF68XUpvN/O
         GIDVN3fKg639vhGfLuJ30QWKFCLsVnTlCfi80Eq1I0ZWJ2VjWFJBfvgV5JptRRoFPpaC
         J1dO1PqSeRLMBxR9CxLSh9ESot1/3Sqi1jK2yUgCSg56ap5HO2AfOHi3HVvluhAdFNGF
         PE9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUFnwM+XuUyX5h9ZYL3Ijj64VlURBP3e3TLGMblwULZEywiw5SvsEr9P96prce0JPjOYM/1lavNhii1ltC1z5FxMw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyMSk1clmiObjnxdlqHE4vedQVshs7+GHbDejKcImWHyQvO/qb1
	EVyCDVPY4pMSXaNhiby0YIjtnRi4qF5ZAHv44o++Zx80S5ArDSWKfxe/ClNSL0UfIYZwkJC6TF6
	8EH43tubyGjYoy/Eei/3eXghAn6v7UFf1VVf39FoFFA==
X-Gm-Gg: ASbGncvo2qFOCoXwbJ4IRfTrVmyfS1+qUaZNsMIo2zTC1xDMjl2gKUEAti7BF4dqKpP
	jq/NmDNgKp05xR+bDjMUpObz7SOs8o+Z69j4MN9lgHHprDqzoll4BO1+6lZuOYq1D8vMPi9P+/3
	syBUoOeliDXfMcxt4iNf4X27/3+GKgMtHA1dquD8MWT19kS433t3ak77SOEx0LQFNyDulPECyCe
	q8ue5oUR8vzxOc2imFwRhEbIskY/un/7W1J1fMoF7B0/DjKuw7JiOKUMnZSfPMsu8Pesg==
X-Google-Smtp-Source: AGHT+IE0QKcwgymWqf0OW65vCCMWCJiOOtiwHWi86Co4ZDNjIADj5ZDi82ZDY45qcjOrjuyWEl5PIHEr0WQn+MTvRJY=
X-Received: by 2002:a05:7300:d193:b0:2a4:7b58:1a25 with SMTP id
 5a478bee46e88-2a4abdd0975mr6735592eec.27.1763556328274; Wed, 19 Nov 2025
 04:45:28 -0800 (PST)
MIME-Version: 1.0
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Wed, 19 Nov 2025 13:45:02 +0100
X-Gm-Features: AWmQ_bm_PxmIVsr1uEgK1X4tXsJ4ytdlEO2p0jJDFFQoTXLHG4lWjgwsXBnFig0
Message-ID: <CAEt6Nwp4wFFFcouMdu4srk_TZb32cYVe-aQonyQmK4t=aitA5w@mail.gmail.com>
Subject: OpenEmbedded Workshop 2026 CFP
To: openembedded-members@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 12:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226554

The workshop will take place on February 2, the Monday after FOSDEM in
Brussels, and the CFP is open, waiting for YOUR submission:
https://pretalx.com/openembedded-workshop-2026-2025/cfp

Here's a few ideas:

Product lifecycle management
Long Term Support stories
Real world case studies
Reproducible builds
Creating layers that work well in the ecosystem
Board Support package best practices
Workflow techniques for projects
Automated testing
Supporting customer needs
Supply chain integrity
Multi configuration builds
Systems beyond traditional embedded
New user and developer's experience reports
Software bill of materials
What can OpenEmbedded and the Yocto Project do better?

We have two time slots available:

30 minutes (20 minute talk, 5 minutes for questions and 5 for setting
up the next talk).
45 minutes (30 minute talk, 10 minutes for in depth questions and
discussion, and 5 for setting up the next talk).

Questions? Mail me or philip@balister.org :-)

Greetz,
Josef

