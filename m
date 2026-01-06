Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD345CEFD08
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 20:47:02 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.100226.1767732415388619901
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 12:46:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nVoMfYCJ;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id af79cd13be357-8b6691baa33so20173785a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 12:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767732414; x=1768337214; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KRknPBa5M5+iXohaDXnhAr8vwNCiaBDHUZhujZ1SObs=;
        b=nVoMfYCJDdAQ9mZXgDq3jz4diIYjsu98ryf64Ec9Ao47XiRIqYcG6vyD7YLN1pH0Mi
         xIICx/4qPGgrNYQvGn2YQr5GAgQzpSg8tbx6rba40FugkzscHhLxmXwMugqRL+KTg/+6
         6Dg6Rtn9+1rG9T4SyFo1qV+grjqy2+rh1lcNfzivuS8cfFAEo1/hj1R+Tp5pr753quNS
         oO0qwQyT6JCOpi8Bqus+f8XfS6aYwBodGVfOr1FR4eXhC6z7rKdx2g5MsnyXtEbP2MSc
         syLs6s0J6TVvbroniYbTTcl1mWSMoxkmo5Wz7Ma7OYwFyCAxxvJgUaJtAnLJbXkJRGqj
         lNmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767732414; x=1768337214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KRknPBa5M5+iXohaDXnhAr8vwNCiaBDHUZhujZ1SObs=;
        b=d/fF9M2R1Y21i4ANYGyaRldugpOica/kwwPX0Q+5eB557OIew8TcE9Q1OUilGIs3Za
         73Y/wmJ/o5mFBJAgZm30AJQks1tbGJt/SC8v5ZC6sL5W/VjNQAeX5VvFxAvFwpczEL+W
         0imvGo0RphpHThQGVg2Ud5mX+6x8EGSwhh8ZK+8/2DhDa1xT/GWCzbayMpCe2FQ7Imnh
         8xH7YmUrEL8FWvbVYLkVR4b/4KaDILgh4u/z5CgN56rYxaI/vO6AlsXtb41sYMP9icTM
         dKLgNSe4EpMgUkvnb/tlroP+SV35Sniy4nLoWDBrfVm11E8IedKS/4YH0GyZY2JkB0uw
         0eIg==
X-Gm-Message-State: AOJu0YzF0Sp7zC0fV3zoxW69UhwNsZGOGMunWED8mWCih6oyqT5Zu3vk
	L5qMoyaJQ1EOhagmFW7eygewascluIpTTdXimSD10NpFz52Q0zH8PZ3Tk4qopkwgsB3xtA==
X-Gm-Gg: AY/fxX4bPU0udSbfNSJV8Y3N3RPqK48sqjGgPiC4AXnKDrl86gd5PPs8r9IMiNeJGaC
	OSah2ii3zIJ/F+Qk1HnZC9fW+vyAAynJ7QakYsTarr5cIT7rFY34W3uJ7JFfq3HUZ5rfwiRY52b
	Rfu2IM292ytLFW0oCqtI7TqUAfGA/6oKquXbmyR5tvzyKiPEKOchdf545G+FTlsKLQE9Z1mnefe
	ETd1veVpiliR3O7+d1qjr97lE31BaG8N91Tz+m1+lExzmWwkfKx6tlSeq4Ckj6VYm+dwzVKigs2
	WNWUG6pdjGxtmj1WOyAb1keqQK01aW/L/ITlZ3Ih9etAKmTgXJ1wt/SfdlUV5QM3jOo//NT7+SR
	G9HsjduwnXhUF7Mw7ViVQvD2DoCYK25h+HbPeCtwoqtPXFnL9Lzk+wEywUih6tyMWcOD/BxZdnR
	8hiTPlCUBrWSD/Wu76Id+6kgbgBzn8yCNQwPJ//E4vwoghZEDyvMu9Ewg=
X-Google-Smtp-Source: AGHT+IEoW1b4tNQ9hMdRP5ZbSbyFIdIcxrDLJFy2qMRvYWvjqsLpW6mozJ1jbzpy98lk+CHMVTUfgA==
X-Received: by 2002:ad4:5ca2:0:b0:880:4f69:e598 with SMTP id 6a1803df08f44-8908424f66cmr3247926d6.4.1767732414298;
        Tue, 06 Jan 2026 12:46:54 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770ce298sm20361976d6.8.2026.01.06.12.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 12:46:54 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH v3 0/4] generate-cve-exclusions: Add a new bbclass
Date: Tue,  6 Jan 2026 15:46:42 -0500
Message-ID: <20260106204646.3417382-1-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 20:47:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228924

Use the script generate-cve-exclusions.py in a class to generate kernel CVE
exclusion from cvelistV5 and integrates it into linux-yocto.

Changes since v2:
- Patch 4/4: Inherit the new bbclass in linux-yocto.inc instead of
  individual recipes.

Changes since v1:
- Patch 2/4: Removed the mandatory execution of the
  generate-cve-exclusions class on every build. It now needs to be
  manually run using:
    bitbake -c generate-cve-exclusions <kernel-recipe>

ValentinBoudevin (4):
  generate-cve-exclusions: Add --output-json option
  generate-cve-exclusions: Add a .bbclass
  generate-cve-exclusions: Move python script
  linux: Add inherit on generate-cve-exclusions

 meta/classes/generate-cve-exclusions.bbclass  | 67 +++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto.inc     |  3 +
 .../contrib}/generate-cve-exclusions.py       | 64 ++++++++++++++----
 3 files changed, 120 insertions(+), 14 deletions(-)
 create mode 100644 meta/classes/generate-cve-exclusions.bbclass
 rename {meta/recipes-kernel/linux => scripts/contrib}/generate-cve-exclusions.py (71%)


