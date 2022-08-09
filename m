Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 113A4C3F6B0
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 21:28:06 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web12.393.1660080480244394659
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 14:28:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=8SA/vdDY;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id g13so5571367plo.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 14:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=icLDWT3rKOLgIzjie/vNwfR85zmteWlquzTQVbY3EW4=;
        b=8SA/vdDYfd8px/zxQCtFbvQdQeueyfQJMSTkPPXxbjO07/FqMkjX19IAwAKHab41n2
         xRAzB7dePVNsHqLZC0hnphs4T+KzWicdYKYJDy8/gP8Q7LiHOiCgQVmPeCd6HEBDsBIm
         OsnHmyJzs7fk4/kjSvl99ERTil8JIklCjeXsWUZgfIvuTpIrLJc57fPEM3iL6Q+zK05g
         61QEX8iwRSSfB/0+bqMJMEsAX7Abj899PTQWQu1bBkzb6HAIbzC9VpZ29RLGJLNRVGD9
         z++OqqPOj4+5wVobalDC1/X7yST0vELsgs/4adAJzVMe6WoThCeQofZCSOtuS/g9M2Qu
         0EeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=icLDWT3rKOLgIzjie/vNwfR85zmteWlquzTQVbY3EW4=;
        b=0YpgF98eJdjwGQ1BO6U7/qbmQXo8+GaDi7AKOkIWNuOHFs1TNmt8Dd/u5e2Cg2FweT
         795pLfV/W5xASh4/KRM47jvTJBUzfI4msIUpZLSg3Q0Re97/lnHYVl+wuIVD0OVRYTxg
         ZSLtNKoj+7LtKdUL1qYCiGplcJb4fG7e1s7xq377H36nsdgHESK+hdYGLAiGQb0DdlrF
         CnsgfrJM/97Mib8z8+knuBeVIiZAonJchyedtq88+5me5y2hHvyFEV90pPvecRupSTZQ
         sxCJt84OLI8LGdaES9/brfY5pRVHJ7qESitCen9zUQT6sQsC8UVuCN/hzQJgpBtDi9Oe
         250Q==
X-Gm-Message-State: ACgBeo11ETVYFryJ6aaLF65dnGsYV2H/SCUeVYLLfS4X2Z4wgBTWfTA4
	zubeGMQML5b36HU/dSzTG7RJh09DmEsjJD3N
X-Google-Smtp-Source: 
 AA6agR6b0PZFMSUe20mSjOMJ+iA9PtAGZn5iasRBjLhWGpmL0dnnVcVvkrjecXqMBQ0KF6JLAFIJ2Q==
X-Received: by 2002:a17:90b:1807:b0:1f5:7835:7fbc with SMTP id
 lw7-20020a17090b180700b001f578357fbcmr411860pjb.170.1660080478958;
        Tue, 09 Aug 2022 14:27:58 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g12-20020a17090a4b0c00b001f4d711e165sm62273pjh.11.2022.08.09.14.27.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 14:27:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/8] Patch review
Date: Tue,  9 Aug 2022 11:27:34 -1000
Message-Id: <cover.1660080350.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 21:28:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169163

Please review this set of patches for the kirkstone 4.0.3 release.

The following changes since commit c33eb7fb1d1e91a005b22b65d221d4b899ec69dc:

  openssh: Add openssh-sftp-server to openssh RDEPENDS (2022-08-02 12:32:44 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alexander Kanavin (1):
  lttng-modules: update 2.13.3 -> 2.13.4

Bruce Ashfield (5):
  linux-yocto/5.10: update to v5.10.135
  linux-yocto/5.15: update to v5.15.58
  linux-yocto-rt/5.15: update to -rt48 (and fix -stable merge)
  linux-yocto/5.15: update to v5.15.59
  linux-yocto/5.15: fix reproducibility issues

He Zhe (1):
  lttng-modules: Fix build failure for kernel v5.15.58

Sundeep KOKKONDA (1):
  glibc : stable 2.35 branch updates

 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +--
 ...x-compaction-migratepages-event-name.patch |  37 ----
 ...oduce-kfree_skb_reason-v5.15.58.v5.1.patch |  53 +++++
 ...emove-unused-tracepoints-v5.10-v5.15.patch |  44 -----
 ...g-Append-prev_state-to-tp-args-inste.patch |  59 ------
 ...vent-allow-same-provider-and-event-n.patch |  48 -----
 ...g-Don-t-re-read-p-state-when-emittin.patch | 183 ------------------
 .../0004-fix-block-remove-genhd.h-v5.18.patch |  45 -----
 ...emove-REQ_OP_WRITE_SAME-support-v5.1.patch |  79 --------
 ...ndom-remove-unused-tracepoints-v5.18.patch |  47 -----
 ...rethook-for-kretprobe-if-possible-v5.patch |  72 -------
 ...ore-Remove-scsi-scsi_request.h-v5.18.patch |  44 -----
 ...n-cleanup-the-compaction-trace-event.patch | 106 ----------
 ...ules_2.13.3.bb => lttng-modules_2.13.4.bb} |  16 +-
 20 files changed, 95 insertions(+), 816 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-compaction-migratepages-event-name.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-random-remove-unused-tracepoints-v5.10-v5.15.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-sched-tracing-Append-prev_state-to-tp-args-inste.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-Fix-tracepoint-event-allow-same-provider-and-event-n.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-fix-sched-tracing-Don-t-re-read-p-state-when-emittin.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-fix-block-remove-genhd.h-v5.18.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0005-fix-scsi-block-Remove-REQ_OP_WRITE_SAME-support-v5.1.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0006-fix-random-remove-unused-tracepoints-v5.18.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0007-fix-kprobes-Use-rethook-for-kretprobe-if-possible-v5.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0008-fix-scsi-core-Remove-scsi-scsi_request.h-v5.18.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0010-fix-mm-compaction-cleanup-the-compaction-trace-event.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.3.bb => lttng-modules_2.13.4.bb} (60%)

-- 
2.25.1


