Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C56CC5B543
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 17:39:09 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.1256.1748626745804071495
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 10:39:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=K7pI5Rt1;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-afc857702d1so1853163a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 10:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748626745; x=1749231545; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FFH5gxu3JLrVG41Kk96CQHTxmQR+mCHQZhHr+WP4qQo=;
        b=K7pI5Rt1GX3V1SG1a/hAjw6QxJ8oa+asA5IOgc3BNwp0s2OUMm12pBI7Ytp6JGRd7m
         KZPmvB7lZHWpdo8L7BUReWFPtJtSXPpIOHLIugdaq2sBt3LWFIdhdFruuAaxU5JRKCeQ
         R7i19CAXPzF5rrgPanNC9D6op5QVC5Ni866o+Wtl2TYmy+vdbJDmrV4xzieImQkW9ve6
         BgWHejO4DtCFojEhsVptk0I+nm6ggMOV3UoCDGgpMBZa59sxZKcKXKc1qZxqlj06C7y1
         t+ugkWea/Fn7FKLVTcqxBDG3MN1UqK4LNQA+hXkRb3XHIX9nRe6y51bFxLLSeHUubKtT
         j7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748626745; x=1749231545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FFH5gxu3JLrVG41Kk96CQHTxmQR+mCHQZhHr+WP4qQo=;
        b=RXRJXF6X77oN2lxuisVNk17nKrEt7Gn6ghUDvaLCYRh+SPl/X+qBi0vjGHZZqKoiMI
         bvGIHmfDE+jWw20EVIsgP8EEg++hjRKRFUwMuKj56kFye7GMEuhpAVXLCIzxjhq6DKY4
         jqRupg1JBKMO4rljDb4EZKDuHSBEgO7m9hv1yRpOYDVqQYtwdS2jw+6sqyMVb1THE+sq
         iMkmaYhUyPwhXEBUNUSkIbpMVGWIMPrO+DfAwb0LaOh9gS/hShRCXnYf2G+NNtPBve8C
         ltgHl7XOxR3eq0j8Xeu4v6xKpzDOJYf0un6rGyM3WcZKyK1eHhgsoGG3n4q0j3T7ZmmT
         vZGQ==
X-Gm-Message-State: AOJu0YyWPA9Jsc+sZvomuX+q3n6qYu4qfTYqsXELYC8OtkC9ZHHiPBTv
	WQBaBFBHndeJbpp4KL6NFBErrgViE3wVPvEXXwXtbwYZqzyehxdeHdX5GiWd1orVMkE+xOG+PZs
	fGIzg
X-Gm-Gg: ASbGnctuoUF7uLX4u+YayV8CmVlELXtBFPtA8aFYKeAYxT1iQT9cEDyJxGd/Aj1b09W
	2CwENg3pRF/WDC42KxllIdGm02UcRXVPZxNg25fRJFViFqeXFXm40AuREOpzZrSvsjnOsrQR+ZL
	DAeM81BSgAlGSVsndZZ0QDcdLOTBg1CxvVst+ueF6EoqTmy2i9Jw5r4ZWDJTGvAk3i9ZvAmiTix
	DfqeCwL/xb3RGceUZUejnR7J93P9GVIoNrs4dwjttYyiDtuf3O1eVIzfCWK1NonBLj9vInRFSyx
	3vAFf+l3+owbp2sPtPS6QyS/3iNBTYQc/k3M9Tkzga0brfNya2xB6Q==
X-Google-Smtp-Source: AGHT+IEaj14fG7haeP3YLVNw+kcGN0ANsISbi5NQoayQ6Xe5c/v2epb0MEBAUQ+MOb6440+DNxgP6Q==
X-Received: by 2002:a05:6a20:3d83:b0:1ee:efa5:6573 with SMTP id adf61e73a8af0-21ad94e20d8mr7152486637.8.1748626744910;
        Fri, 30 May 2025 10:39:04 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c9d8:e2d0:bfbc:3a26])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2ecebb5f40sm1554314a12.67.2025.05.30.10.39.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 10:39:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 00/12] Patch review
Date: Fri, 30 May 2025 10:38:47 -0700
Message-ID: <cover.1748626640.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 17:39:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217523

Please review this set of changes for walnascar and have comments back by
end of day Tuesday, June 3

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1692

The following changes since commit e3fa9ef3239e8bc113e211f5258f84d08284872a:

  python3-pygobject: RDEPENDS on gobject-introspection (2025-05-27 09:58:23 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/walnascar-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/walnascar-nut

Bruce Ashfield (9):
  linux-yocto/6.12: update to v6.12.24
  linux-yocto/6.12: update to v6.12.25
  linux-yocto/6.12: bsp/genericarm64: modular configuration updates
  linux-yocto/6.12: update to v6.12.27
  linux-yoto/6.12: bsp/arm: fix CONFIG_CRYPTO_LIB_CHACHA
  linux-yocto/6.12: update to v6.12.28
  linux-yocto/6.12: update to v6.12.29
  linux-yocto/6.12: riscv config sync
  linux-yocto/6.12: update to v6.12.30

Harish Sadineni (1):
  binutils: Fix CVE-2025-1182

NeilBrown (1):
  nfs-utils: don't use signals to shut down nfs server.

Richard Purdie (1):
  sstatetests: Switch to new CDN

 meta/lib/oeqa/selftest/cases/sstatetests.py   |  2 +-
 .../nfs-utils/nfs-utils/nfsserver             | 28 +++------------
 .../binutils/binutils-2.44.inc                |  1 +
 .../binutils/binutils/CVE-2025-1182.patch     | 36 +++++++++++++++++++
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++--------
 7 files changed, 62 insertions(+), 45 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1182.patch

-- 
2.43.0


