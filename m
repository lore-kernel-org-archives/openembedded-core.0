Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6782BC38A2D
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 02:37:06 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web08.2240.1666838216277475335
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 19:36:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ixnSCDzL;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id g16so78458pfr.12
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 19:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XfhkqKczNJNjwAftC1+lbl95SDR26n/lUchRma9Dbf8=;
        b=ixnSCDzLWhyEp+8BwKMiWPUwhOG3WbNqIR+R64620mZRZug/bVYCk5zEuXofn5NTM6
         IG7Md6wW2gFWB6JbilV42zFjJ+V7W27p3M/Y4y7dFySMjnsVN4y6H3qAvW+aFE2bdJVs
         YSaMWDdtWgriq4ma0a7VsxBJ274gjtmLKdmLLOJlqOvFp0wcyCEcFoQ6ASJMrCJBK9ed
         2auEq7/QgczAW16S8Lqqd7ANtVC96s9qbDXPCVIIr9oDipJlAkUeuABItw3J7DWlKXfN
         9VafY74r3mijTUcSp0dWcv8oiRz/Z6F31EBLnYEQs3UwJD4gG1AsGISWOp55XcrVfQRj
         h5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XfhkqKczNJNjwAftC1+lbl95SDR26n/lUchRma9Dbf8=;
        b=40BWhq9g33J50mAZUZlYd2EIc524pl5wdNPtCcGxfkYigKPzrNQDlINC38LxUDKMrt
         miZrYC6852fkWpbX1TrsYMyZwA/FLOPbUC1c93ecmjOeaooKFb3VWHFzmTFz4nHTiQkJ
         maZ+NTe8DNysEG/40bEOWps9ydNYrQhv+cyWMrbYH1Ek94jETzg+N22JmvFMv95ECoNA
         ch2NgLiUFoHQOPWGe/y41EIo48ukk3s+0qfdfAbMdt8Qd1LohCYziBb9QKDmizFsUjo+
         vR1M2eZcBxkv6mDghGCttxY3W/au4GW4tK0priQozr+egnRqN+y/tQTLFc8UHoTSEHiL
         NooA==
X-Gm-Message-State: ACrzQf1bgi+EgzOLVfLKT96B53f5QLX037wYpW00KUheLztspMZeUmBv
	lxpv+REkz9vkk+o+Ussva99LRse9Lq7a/zcC
X-Google-Smtp-Source: AMsMyM6IM7lpbNven2A/lYY8a7FYHSJ2fRzgMh462B9Aqo6mKxRLSgkVTDVQQum9RdA8yamJ0OiB8A==
X-Received: by 2002:a05:6a00:1785:b0:56c:71d4:ffb9 with SMTP id s5-20020a056a00178500b0056c71d4ffb9mr4737496pfg.69.1666838214922;
        Wed, 26 Oct 2022 19:36:54 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id b1-20020a62cf01000000b0056246403534sm81088pfg.88.2022.10.26.19.36.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 19:36:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/8] Patch review
Date: Wed, 26 Oct 2022 16:36:33 -1000
Message-Id: <cover.1666825041.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 02:37:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172179

Please review this set of patches for kirkstone and have comments back by
end of day Friday.

This should be the final set of patches for the 4.0.5 release.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4380

The following changes since commit 4781fee6aea9512b7cb390b76e6f9f0a86a5bd11:

  lttng-modules: Fix crash on powerpc64 (2022-10-17 04:30:43 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Bruce Ashfield (2):
  linux-yocto/5.10: update to v5.10.147
  linux-yocto/5.10: update to v5.10.149

Steve Sakoman (1):
  Revert "lttng-tools: Upgrade 2.13.4 -> 2.13.8"

Tim Orling (1):
  git: upgrade 2.35.4 -> 2.35.5

Vyacheslav Yurkov (2):
  files: overlayfs-etc: refactor preinit template
  classes: files: Extend overlayfs-etc class

Yash Shinde (2):
  binutils: stable 2.38 branch updates
  glibc: stable 2.35 branch updates.

 meta/classes/overlayfs-etc.bbclass            |  5 +++-
 meta/files/overlayfs-etc-preinit.sh.in        | 23 ++++++++++++++----
 meta/recipes-core/glibc/glibc-version.inc     |  2 +-
 .../binutils/binutils-2.38.inc                |  2 +-
 .../git/{git_2.35.4.bb => git_2.35.5.bb}      |  2 +-
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 ...-tools_2.13.8.bb => lttng-tools_2.13.4.bb} |  2 +-
 9 files changed, 45 insertions(+), 29 deletions(-)
 rename meta/recipes-devtools/git/{git_2.35.4.bb => git_2.35.5.bb} (98%)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.13.8.bb => lttng-tools_2.13.4.bb} (98%)

-- 
2.25.1


