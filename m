Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40ABDC04FFE
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 12:53:38 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.20352.1714395213720995773
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Apr 2024 05:53:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=R/Z4ChPH;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5d8b887bb0cso3655794a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Apr 2024 05:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1714395213; x=1715000013; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q2Bq/xhSF3NDYjUZ9nVNXTR3S4Vsc7z1eMyeGGEJBIo=;
        b=R/Z4ChPHtDlSs5RNX9QkbPsayPoTvn1+S1RXOp21Tk7wKuyX+ednslSm/wpKWxWH8F
         /97ShY27PEfNSwaPnvPY9cMo7sJ3GHbC5L8+iHhLkjcKUJzvajtCbzq/hpwiCrRPqTKP
         lg9t4zY2t6JMUMATDGP9VQVXH04prw7p4+hM56ylk92QQ7P6kZLOVzNZVm633++gr9G1
         4QoKMnoklIawNYPJhpfCZjNA3/Ycyl3LsZZyrf1jEk5eVgMv15gNzsp5xkDZE7N/2xGV
         FAGA11ezGW3mIn6m2Ky2gyLZfunIu4NZi9zHzVF/EWOmsGyg2/YXS7zdl3CA4gq3aBrf
         y1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714395213; x=1715000013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q2Bq/xhSF3NDYjUZ9nVNXTR3S4Vsc7z1eMyeGGEJBIo=;
        b=XdDumxjevsEB0XKVW1mkJR/nC+JbDOwd3nHDXXN+iNxfd06ddNyBpHR7E4YzFikqYh
         JHFvwnpEJ4AvSSEWeGpRvtTgcM9zAa8iQzrgqG2+vigah6M/JH3OswpyyyZ94Lp8XG5n
         +hMj0EUkM0bdTKJVPRq6ydr2HYsHO6zJ/w695HWYadtWXaDLZCPUhVN9iTBo4kZ7dVCS
         21PMwWeuKPwZky0WTSvUDfyGgdvJ9UJOYvWFA51SwO41mJG9WjdtBKMTE0YUT/3YuatS
         LzTZpUFuX8KEAFKAFAoMVmLOgq3SCc4KZkXT8vT5FzBncDG6Y56uT2Lfnt83eSRulc3o
         oHZQ==
X-Gm-Message-State: AOJu0YzGFcNL2BgHva5jBrfBiDFK9F7I3/qEVWe8hlWYCsEDKOq0hTSA
	BFAMHX9s+thDywvQie/g9/eo8JoK+RBT8QgTguYRvJKNycBYGO8nL4e4NDXKgG86JcqwcUEvtuX
	oROIwLw==
X-Google-Smtp-Source: AGHT+IFP+aXMfmOe6ZjfbQG0m3Y5uZyPmUCx2NGBC4F46YFJHqKDivJmZc5GrTnhObs7tLOW/0a1Gg==
X-Received: by 2002:a17:902:784f:b0:1e5:1158:74f6 with SMTP id e15-20020a170902784f00b001e5115874f6mr11358521pln.66.1714395212564;
        Mon, 29 Apr 2024 05:53:32 -0700 (PDT)
Received: from xps13.. ([209.237.67.158])
        by smtp.gmail.com with ESMTPSA id h8-20020a170902704800b001e868e29fabsm20184399plt.251.2024.04.29.05.53.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 05:53:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/5] Patch review
Date: Mon, 29 Apr 2024 05:53:20 -0700
Message-Id: <cover.1714394934.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Apr 2024 12:53:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198737

Please review this set of changes for kirkstone and have comments back by
end of day Wednesday, May 1

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6857

The following changes since commit b7182571242dc4e23e5250a449d90348e62a6abc:

  build-appliance-image: Update to kirkstone head revision (2024-04-22 16:57:58 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Archana Polampalli (2):
  gnutls: fix CVE-2024-28834
  gnutls: fix CVE-2024-28835

Michael Glembotzki (1):
  rootfs-postcommands.bbclass: Only set DROPBEAR_RSAKEY_DIR once

Peter Marko (1):
  glibc: Update to latest on stable 2.35 branch

Vijay Anusuri (1):
  go: Fix for CVE-2023-45288

 meta/classes/rootfs-postcommands.bbclass      |   4 +-
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 meta/recipes-core/glibc/glibc_2.35.bb         |   2 +-
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.18/CVE-2023-45288.patch           |  95 ++++
 .../gnutls/gnutls/CVE-2024-28834.patch        | 457 ++++++++++++++++++
 .../gnutls/gnutls/CVE-2024-28835.patch        | 406 ++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.7.4.bb   |   2 +
 8 files changed, 966 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2023-45288.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2024-28834.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2024-28835.patch

-- 
2.34.1


