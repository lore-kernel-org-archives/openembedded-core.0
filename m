Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED1EFC25B08
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 21:51:10 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.19.1660081855470605568
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 14:50:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=h0U/jgU+;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id gj1so12998155pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 14:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2NYpFNApSETLrfWmf6d7ArEbaCOgA7lfeMRUKQWBm9Q=;
        b=h0U/jgU+EHJQwQA8QnjT067ygbxRt221Rkv8BM6p+61lfdqdW1yawLSINuihlmw5Zd
         e1oOvlGEoIjl84Xos6F5zhwKks0iQefHkV5ZRgGtDWcYTwUKEPMZZSRZ50AA3LBhKE3g
         B+rajVgsHyNtmwr4aDi8ySDcsM/dIwLG8I5EdcGb+rpkOvzY3hq84j62E1Gv5R7eX8WI
         foAMKQVdrQCFVKJoPu5GN+CLI2wLJn6gZh7f65aaktNBUWkvq2bIRfiIjy8Fgl4ZVO+6
         RxbPkRP5svm5xVAPzyMgCK+7Co2k69mK2ldimTjp1iyb9AugkLrXsN4IJEL1vOJz0f9Z
         bcVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2NYpFNApSETLrfWmf6d7ArEbaCOgA7lfeMRUKQWBm9Q=;
        b=pHCE2nWvcI4i2Eb0iB/EJ9GZS3762lH4RE0MQGSHVY/EqDyiV+5ULsYNlc18hKRG2C
         WM9EyxbRMTPqia1V0h033IvyPiG7RgeHCf8tGtN0Y7BrCvW5ZCAxntUfSyP0X8mEUihX
         XLsPsGrzRH0fnYsGqzzfGqf35aCRoRLuS1E031SMlmpefuIwnY3W5z+i1DWPiR2O7GKL
         SztbLG2mB6AUoBAibehteUpm65xUXnmb6FnALQ187+RKX2P6Cjt/2oIABHcv7JMi9M4F
         zyAXf/kxacRxEiBv8t2hwWh8vfNobsWSj7q+1PVkG2UBP0dniGTNrbFsZTrC4Ucs0vif
         xpFw==
X-Gm-Message-State: ACgBeo11+jJ1WPZ02GxBV/bvPxRAXUVwsmEKes0H2kEW0KhnKL1T8o6E
	bjWhN9FXPrKytZOBglG8GaWNBTJUfivTcXLa
X-Google-Smtp-Source: 
 AA6agR7NthXYXHEdXQy0jwJaI+bl8OQWAi1GVFwMFE+XnufFCb9z1/HD1U/Uc6YZ4E2YHwyp24GZuQ==
X-Received: by 2002:a17:90b:3a81:b0:1f7:2103:a8d6 with SMTP id
 om1-20020a17090b3a8100b001f72103a8d6mr460537pjb.105.1660081854195;
        Tue, 09 Aug 2022 14:50:54 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 u125-20020a626083000000b0052c7ff2ac74sm402219pfb.17.2022.08.09.14.50.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 14:50:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone V2 0/9] Patch review
Date: Tue,  9 Aug 2022 11:50:30 -1000
Message-Id: <cover.1660081510.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 21:51:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169172

Please review this set of patches for the kirkstone 4.0.3 release.

V2: includes the inadvertently omitted "glibc: revert one upstream change to work around broken DEBUG_BUILD build"
 
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

Martin Jansa (1):
  glibc: revert one upstream change to work around broken DEBUG_BUILD
    build

Sundeep KOKKONDA (1):
  glibc : stable 2.35 branch updates

 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 ...lement-a-useful-version-of-_startup_.patch | 128 ++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   2 +
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
 22 files changed, 225 insertions(+), 816 deletions(-)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch
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


