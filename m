Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC270C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 14:04:19 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web08.9682.1646921058684915991
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 06:04:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=mVQxhQwc;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id n2so4974173plf.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 06:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HPj8cJu2rR1dsZuyMO+Na4AisnthZigzpwRNSTsGNms=;
        b=mVQxhQwcSicYzVNDkxoq00rFejTYNUWNZ0t2D6dW2P2mHNSFsbMQXOiPcM8EifR0e0
         7u6OHARGEfnyOvL85N8k7CDr5os4cET6Rf3LHzShSRg+edPqhW1r+ql0Puv2fowSKzyF
         nO5XXxMArau1KhUyFACsWzckRTs/XwEzEJFgyRio9SS9gx7F0W+6yreKbBUX8AGRNh4a
         1z7p8dNa0uQlCxLVZ13og/y8el3evUt9FQ4bXvx+ah5fR8/y+lnmWjUDkzF28lLw6QmX
         7vg4mxmrbFQdNWBWHWX7aSY67y1yfKgiy02J4g3DYpBGXunQqFLzFBIt6zoNxnqEgBlB
         U29Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HPj8cJu2rR1dsZuyMO+Na4AisnthZigzpwRNSTsGNms=;
        b=IIlrVbrlqJpIa7BA3opmqeKWo6iwxdg/1Go61+qWPcFnWVYIEKAJzt0+cOc/3SRiHQ
         Tpkk/brxFPLPVoYIgJgF7XjLfEAST4QLFTrjZKw5cfhJ9GUdcoWUQhBLlnHVlAFD/jrV
         2WRIP2wzyLI9zSLAC9H3MinCyfYomJ96AtckvxEo2H6MMjfpI6BfTMRMGCTUrd9GLPBs
         DnG6xI52viUs7Gj6IRmbSNEmUbfRPuzpp5amWAqy598KVu+1Yp8aSlOjVWrpJYyaDSCq
         kDTNKd3s1sHjRQQXtqPXg1w7EOlQNGwN4C1Jvb/B1t9ed0cd/nmi4gxBoDksVjes2G50
         xBOA==
X-Gm-Message-State: AOAM532liJ6KQU8mHF17/hEy9e2/7Slz41u6UDg+re/YaAA6DdiLOeo2
	0Axm11GQ3+hkroKY+qfc4ZdRol47gAOYvzeSFDg=
X-Google-Smtp-Source: 
 ABdhPJzzSAwUXDMMCzURqWT6TmuCmTLwbcL5jB6BrvtifHDALfSysznbIuqbjG0wiDLwa/d62+i8Nw==
X-Received: by 2002:a17:90a:3d44:b0:1bf:584d:7fa with SMTP id
 o4-20020a17090a3d4400b001bf584d07famr5144306pjf.217.1646921057197;
        Thu, 10 Mar 2022 06:04:17 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 d11-20020a056a00198b00b004dfc6b023b2sm7291927pfl.41.2022.03.10.06.04.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 06:04:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/3] Patch review
Date: Thu, 10 Mar 2022 04:04:01 -1000
Message-Id: <cover.1646881254.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 14:04:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163024

Please review this set of patches for dunfell and have comments back by end
of day Friday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3344

The following changes since commit 604146a242c3d5f5a9872bb756910f4bd1b58406:

  sstate: inside the threadedpool don't write to the shared localdata (2022-03-07 07:05:33 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Bruce Ashfield (1):
  perf-tests: add bash into RDEPENDS (v5.12-rc5+)

Richard Purdie (1):
  vim: Update to 8.2.4524 for further CVE fixes

sana kazi (1):
  tiff: Add backports for two CVEs from upstream

 meta/recipes-kernel/perf/perf.bb              |  2 +-
 ...99c99f987dc32ae110370cfdd7df7975586b.patch | 28 +++++++++++++++++
 ...0712f4c3a5b449f70c57988260a667ddbdef.patch | 30 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |  2 ++
 meta/recipes-support/vim/vim.inc              |  4 +--
 5 files changed, 63 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/561599c99f987dc32ae110370cfdd7df7975586b.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/eecb0712f4c3a5b449f70c57988260a667ddbdef.patch

-- 
2.25.1


