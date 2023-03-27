Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DFB2C7619A
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 08:12:48 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.29696.1679904760570899601
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 01:12:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SnZOqqEz;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso4595357wmo.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 01:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679904758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KTt9FUeJntsQH9SD4uN2XxtyEzqREofYi/vyFa0VJi0=;
        b=SnZOqqEzCavuX8dM7fj47BCaTAO68y7l81ksLJ26pnNnvDQEHgluNP1Uovpl4k+nd5
         rI/RFnwMoZnadBg9H5F+AQiFRBC2lQXc1Zp8xFFHXriCiVMejSWl724d/Oq11nZKVtJc
         dKPxUlC6EAd07YcXxqOZSxCCJYehiQEFDd4Ud+yUcYljVspfKdjXFDkXHVs/7Q8oRk7I
         mVZvqkFPz7bg2R+9j0Rv8wmSvvjPcTbWGs4+K6zXWTU2uRMjOSfpveOZ3wvbGYpP3JCJ
         LNYmOAJV0uVtuEpkBXHRPCMuiNQREtuvPP+vjgOYuH6Rytmn5VQGwVpMUeww0tLCxlRi
         3TnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679904758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KTt9FUeJntsQH9SD4uN2XxtyEzqREofYi/vyFa0VJi0=;
        b=pwLMfszZ6mPt9ZTH4gB/Mfyutu+G/kx5O79JgUtbclGD5naNoBgRsuiDFlOc0SctlB
         9JwZFw4EZ8oeeY6bTASc0/lEpU7OX65iz1ih5MVmOX0/V2WIsPHz7xPMiUiMEUJ7mJu/
         x73nVWiJSTHjUjoYxr74BUVWNZ2/VHr895g6EIN7/mx4D4mttxTRlbXenjVF43bcFwYI
         c8ojHFINUwlMesRz9Im1kDcu8ZAVzeyuCdd/MWt9NWhY3DjyysvjHH0FgLHSqh8gWLPJ
         i1gFz7Oa0k4wUH+VN05E6xZPDJljXcMacgNHqgZy8XBocDrCEpEdsFI70ZN9WTI+dAlJ
         TcYg==
X-Gm-Message-State: AO0yUKUhye/VmWu1zHLqvxNFXtJFLccV3IQWLZJYuOPmwpAP7tk2E+s9
	dH7ngPf7xouqkYGmCZqaOWhO0cicCv8=
X-Google-Smtp-Source: AK7set+Rerxq/gU2pqX0ACtyIZ6cKBkU+JWHzd9qhMB2zK4oybJz54LPMgtuzk/zDdNNoUJoFGPSuw==
X-Received: by 2002:a1c:7714:0:b0:3ee:3f7:35aa with SMTP id t20-20020a1c7714000000b003ee03f735aamr9389649wmi.19.1679904758483;
        Mon, 27 Mar 2023 01:12:38 -0700 (PDT)
Received: from work-pc.core.sigfox.net ([2a01:e0a:8d5:c6c0:e313:787e:85a7:511b])
        by smtp.gmail.com with ESMTPSA id t14-20020a05600c198e00b003ef6708bc1esm6186380wmq.43.2023.03.27.01.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 01:12:38 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kiernan@gmail.com
Subject: [PATCHV3 0/4] Extend cargo based recipe support
Date: Mon, 27 Mar 2023 10:12:31 +0200
Message-Id: <cover.1679904677.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 08:12:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179140

From: Frederic Martinsons <frederic.martinsons@gmail.com>

This series brings the support of local git repository inside
a cargo based recipe.

It also enables devtool capacity on it.

The following changes since commit 4876189dd2ae5a04a296b11b537b9f613159c6bf:

  xcb-proto: Fix install conflict when enable multilib. (2023-03-23 22:38:41 +0000)

are available in the Git repository at:

  https://gitlab.com/fmartinsons/openembedded-core cargo-extend-support-git-and-devtool

Alex Kiernan (1):
  cargo_common.bbclass: Support local github repos

Frederic Martinsons (3):
  cargo_common.bbclass: add support of user in url for patch
  devtool: add support for multiple git url inside a cargo based recipe
  patch: support of git patches when the source uri contained subpath
    parameter

 meta/classes-recipe/cargo_common.bbclass | 33 ++++++++++++++
 meta/classes/externalsrc.bbclass         |  4 +-
 meta/lib/oe/patch.py                     | 57 ++++++++++++++++++------
 3 files changed, 78 insertions(+), 16 deletions(-)

-- 
2.34.1


