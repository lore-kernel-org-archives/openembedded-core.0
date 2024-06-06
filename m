Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D35C25B75
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 14:06:33 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web10.15349.1717682788119846521
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jun 2024 07:06:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bKu8r5tN;
 spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7eb12b2bf78so42860939f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 07:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717682786; x=1718287586; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RRsCjyasCJC/BQ0C31ljdA+9Xk591uXf/bNi8K9Sz+o=;
        b=bKu8r5tNjlowjIvcNz9v+efQjWCfgn0UTklCwM8QMdbzcxvKTK0IBhL05l43lNgLp8
         QyVNXp6hJn2vOaXY1Jg+V9FMjVa5e8jUAetEWIybi9MBLLw2lJxxXkBkYbDljb6W9682
         lghrTSUF5i+bZabCsf+c8FQ5fvnFzKlUTRKhpU57W5mcheobcTiQzakSjEEcdr3DXain
         VNFMdvAGCTzByRrG9Ng68IxtH7NU2QTyyUvn6x5NiUw0K/o+kyeSfroIeALE6x4jDxKY
         /fxCEDMTLZvoJhOVPCzcloytRTyCbrYCcMjfmpIN1EkKRmQRaAh6kVqacJZhVTwN21E1
         EJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717682786; x=1718287586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RRsCjyasCJC/BQ0C31ljdA+9Xk591uXf/bNi8K9Sz+o=;
        b=Wvx5ifnuTYhz9MYFFAl4KHks3MLzshH0CF+psvoDLS5yLbPZWeNvbhp85JnoTKYVE8
         cV03ZQFmOBzp8Ihrat3pPskgdxEpv3Z/gMuGXoYmpQ1GzdgMwTYa5yp6wVN/iKD/ttY0
         RiKPs0m4H94GUMWOqLsT3uBIAADnFg2Wty5Hk+egp2YDX44JdSw5W17nYeE6pufNHyjS
         XrF4RYLGyEe/X4uNTxc4QOdzz8fGjAW4FgvOsuNK/WXT/D4uiCiQANnu05Lv8XxUo2yq
         TgWgW5Bseop9T7ARkGK+b+Bs4bvB6sluf9vQ/uwwO5ng3iBp6LwTT7nG71i0FATc4+op
         IQvQ==
X-Gm-Message-State: AOJu0YzxKy0to8Ood0J1Jnn9dIace95cJMaccIt3J84DsGp5ttLeurFt
	n3AcQEPNhTDN/swk24FZaOWjWMugjv9N9uaxSBuoPLjsXiN3K6bR8W2RJw==
X-Google-Smtp-Source: AGHT+IFt4J3MH+PivCdfNLQBfARKvRv/nw3HXqTbbHqnMPnxz0m3f7quEasCDO74Z/Bw0Wr69M1vMQ==
X-Received: by 2002:a05:6e02:1a8c:b0:374:a6a3:333b with SMTP id e9e14a558f8ab-374b1f5a45emr64367385ab.28.1717682786233;
        Thu, 06 Jun 2024 07:06:26 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::3969])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b7a2070f95sm346411173.0.2024.06.06.07.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 07:06:25 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][RFC 0/2] Write out file manifest in do_unpack
Date: Thu,  6 Jun 2024 08:03:02 -0600
Message-ID: <20240606140622.2494668-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 14:06:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200402

This patch series implements a mechanism for do_unpack to write out a
manifest of unpacked files, which is now possible due to the UNPACKDIR
changes. This manifest can be consumed by downstream tasks to report the
source files for the recipe; specifically SPDX can use this instead of
the current behavior where it re-runs do_unpack on it's own.


Joshua Watt (2):
  utils: Add write_files_manifest helper
  classes-global/base: Add manifest to do_unpack

 meta/classes-global/base.bbclass |  4 +-
 meta/lib/oe/utils.py             | 67 ++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+), 1 deletion(-)

-- 
2.43.2


