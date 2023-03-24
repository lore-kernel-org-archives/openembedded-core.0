Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 718F0C6FD20
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 15:08:57 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.104392.1679670532583753224
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 08:08:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cuQHl44q;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id m16so1711157qvi.12
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 08:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679670531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qjdMToaVXOwpksBOU8uXUE4RnU345OwXFzksXbTs2/c=;
        b=cuQHl44qA/j+BcWNPajlcnrWrA0UjjJ1JMZ6K/KTNLvVmArpKdnXVSNd2MsH3xRcoo
         KeenKJGfTIdIIymxcJCPuVDSG764hO+WDJv4hoyKAuCzDQJb6rRoLssqXCzvSD9cPhHf
         M6iscDJ5bfGTSDkqD0M+PWBzWzwBrjV62QCuleC5HWpRADXsbtauP6LOp2Z11YOihY9l
         an+OtzBzGKvGwGcY7orjO4eEFKUhEjO/jgXRIIQ6BzKY7W9fG1dbBJQ98TlN7DMZ2NuC
         20Ov1YabsgKTt15oBPRMRFl4mTXIFwz3z24QGNpx3NnwR9aBMHGkn3b0+PthRzaKBHP2
         BDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679670531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qjdMToaVXOwpksBOU8uXUE4RnU345OwXFzksXbTs2/c=;
        b=qae9VHhgE8hVXh5tTva3J9Hx+mj1Yjnm6ByHs8piDwz3LC+3PTQlcS6ZPEitDH+wM8
         NOHmGVX4YcFS0xG0tjKkAgjVTVQER2wX0JHgJQg4yTUfWwaJGYMsUexnuMVbXUC7EU+Z
         7MTAhMiWpmCCE0BbJrsgmNOTx8OxIu4/SbfRLpGMNPB+xIdaO4HDQVgdjEFRmWy2jzOT
         faJsWzjZULljZyH6FqHPUWtkuxixkp4YEU65pQYYCyTA1Fa/1CUYre7nrGh7CUpfu6EJ
         G5CZVPvNO2zPBGWfF5jcQBQrHUKn6g9jDUsFtLJQXztb+8BxWXKnyhYulqKbgXKYFNOk
         Hmbg==
X-Gm-Message-State: AAQBX9dmA2p8/aWmut+XQ5NGGX7wgsF/LnB2IYnZd0rbnGWU07F9u8xM
	0UddFTzXlz4vy/BDZrqsIftlq7uViKd4Gg==
X-Google-Smtp-Source: AKy350Z6LSj6dOHUtjDsk4kYHCGmTkGKdgBnWIlNMxTWHNsV/4RARnFpgpS2kr0PsX79zV1PZYFzrg==
X-Received: by 2002:a05:6214:ac4:b0:5a1:d44:79a7 with SMTP id g4-20020a0562140ac400b005a10d4479a7mr5696512qvi.20.1679670531364;
        Fri, 24 Mar 2023 08:08:51 -0700 (PDT)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id mf10-20020a0562145d8a00b005dd8b9345e8sm746219qvb.128.2023.03.24.08.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 08:08:50 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/7] kernel: consolidated pull request
Date: Fri, 24 Mar 2023 11:08:41 -0400
Message-Id: <cover.1679670268.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 15:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179041

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the latest round of -stable updates. Along with them, there's
some fixes for on-target/SDK builds with kernel-devsrc and fixes to
ensure that 6.3+ works against the upcoming release.

I was out of the office last week, or these would have been avialable
sooner .. I already have more -stable updates pending.

I'll be sending hardware reference bumps, and updates to the LTS
releases in separate series.

Bruce

The following changes since commit f5c671e201e98f071a7e5e4cbd83af9751c34201:

  lttng-modules: fix for v6.3+ kernels (2023-03-22 23:17:27 +0000)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (7):
  linux-yocto/6.1: update to v6.1.15
  linux-yocto/5.15: update to v5.15.98
  linux-yocto/6.1: update to v6.1.20
  linux-yocto/5.15: update to v5.15.103
  kernel-devsrc: fix mismatched compiler warning
  linux-yocto-dev: bump to v6.3
  kernel/kernel-devsrc: powerpc: add elfutils dependency

 meta/recipes-kernel/linux/kernel-devsrc.bb    |  9 ++++++
 meta/recipes-kernel/linux/linux-yocto-dev.bb  |  5 ++--
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++--
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 ++++++++---------
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 8 files changed, 51 insertions(+), 41 deletions(-)

-- 
2.34.1


