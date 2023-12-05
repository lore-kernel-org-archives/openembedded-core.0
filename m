Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C7A3C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 04:27:16 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.92121.1701750427519006754
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 20:27:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gHuzkR8s;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-42552cfee32so13802931cf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 20:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701750426; x=1702355226; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yrs44AfL8SLkTNP8vJwCh9sb0Xl+PuTMwlK88B5kWqE=;
        b=gHuzkR8stcIhRjcelVBP0cLMmO48iE2CeHhC4ys9mL27hpYMQ8mKAVviAhSFfnYgok
         GjATupa/eiqvY/IjdBjqR6no+e8gG7lIPxKyptY1xyoG1Mc58ucp/SgVND/23I9rFOAq
         sdbdg/HnRapMSd29C7DnOv8L2JcSnhnUyZFD8Y2xTsOdTWkQ2TIN8StOqkPI7inQWsoH
         ixPFnoTXdnBLpaiDvxjJEIn3n+om3rYk7RbKHYLeP5uX4kmqZ9CguhAqkHDnbAcV4XVg
         C5Ebk67wTrY4CIUaUgFfBXGaWC3lKl+E4KL1J5CjA5+gHZsNgJ8X8ujDTR2Za7oa3LfD
         7Zyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701750426; x=1702355226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yrs44AfL8SLkTNP8vJwCh9sb0Xl+PuTMwlK88B5kWqE=;
        b=sK8aloK5Q/k/M8RAOg6wUcvT093dNywvbF9QIHtjvyoDaFO5PmAniIwVtw+enG1vD4
         zUiMPhye2DOHiXr6AiOURooobE+TY9wv89ZkKAyV+9YU/Caq47h01gKtwdWZQsQADAZ3
         yeXgBZCLBBhLNGqsvKYETiOXHjAC6F507CSU9q3zk//tupd1b+6cxcGdb2XG+GuKpqt/
         gNnZ0CcMKUItPNb5GFMKifhc4hjr5Q9LX+Da+x3bvhExkqZF5RHCJrDnigQ/YQauEPSZ
         1HGlD2jCgF6uYlFmje+5QZkuYcX9Ajw3WIalnDPnewSTFF/6PE/5Rr5iVtXyWWDdJjzX
         7qOw==
X-Gm-Message-State: AOJu0YxC9LQsLcz/bWDbtjd279fhGImzrtraDMcFdKcbFgcwyQt+0mNO
	39xIkHez7fs+ZooUoylWALk=
X-Google-Smtp-Source: AGHT+IHtLoil3UGVu7M/3A3qDOfX7zMybd0AmO6YJk2WRHUTwZFeMqzQn1D84BQf9QWBbcHrc4ij8g==
X-Received: by 2002:a05:622a:189f:b0:425:4043:5f0b with SMTP id v31-20020a05622a189f00b0042540435f0bmr836885qtc.73.1701750426441;
        Mon, 04 Dec 2023 20:27:06 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id bz17-20020a05622a1e9100b0042542160fd0sm2963298qtb.20.2023.12.04.20.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 20:27:03 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/7] linux-yocto: consolidated pull request
Date: Mon,  4 Dec 2023 23:26:55 -0500
Message-Id: <cover.1701750230.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 04:27:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191777

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's my latest -stable updates for 6.1 and 6.5 as well as the bump
of the dev kernel to v6.7

I have more pending changes: the 6.6 reference kernel and associated
libc-headers updates, as well as the eventual drop of 6.1 from the
tree.

But this is my first full cycle on my new configured and cobbled
together builder after my disk failure. So to keep things simple,
I've limited this first pull request to try and see if anything
has been missed in my setup.

Bruce

The following changes since commit f89d9240b1208e9df28afed840376ca91842e5dd:

  vte: Separate out gtk4 pieces of vte into individual packages (2023-12-04 12:45:27 +0000)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (7):
  linux-yocto/6.5: cfg: split runtime and symbol debug
  linux-yocto/6.5: update to v6.5.11
  linux-yocto/6.1: update to v6.1.62
  linux-yocto-dev: bump to v6.7
  linux-yocto/6.5: update to v6.5.12
  linux-yocto/6.5: update to v6.5.13
  linux-yocto/6.1: update to v6.1.65

 meta/recipes-kernel/linux/linux-yocto-dev.bb  |  4 +--
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-rt_6.5.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 .../linux/linux-yocto-tiny_6.5.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_6.5.bb  | 28 +++++++++----------
 7 files changed, 42 insertions(+), 42 deletions(-)

-- 
2.39.2


