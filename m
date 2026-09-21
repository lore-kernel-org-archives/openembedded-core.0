Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C21EEC982FB
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 21:53:11 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8002.1790027587756606590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 14:53:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=fgohhsLQ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-20260921215304e4d9a9ac3f00020770-0mtj9g@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260921215304e4d9a9ac3f00020770
        for <openembedded-core@lists.openembedded.org>;
        Mon, 21 Sep 2026 23:53:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=wJvlNXpzG8jPBgp/l4uapy+Oa7dupV7gmLRjYP41i8g=;
 b=fgohhsLQ2DbJA3eV5hPEV5GGpITRxzGHRJwDEWa9OuVZBv9u6JFfrVC4gIc7vHIp8F6o8e
 bT2sxvFvHJiy5xx7zdbxDurXxHfNS1ToF272YQhnXQwVTZp2a7nsYku9wNTOWeThJG7Iw4CK
 WGwBIzQ1MBqPJM9xncHB0UUpHuJS6absXLOCBkTqSLCwzc/Ac1dhCvx+oVawGks/vqJmtDt/
 fw9DOHHkH58GYs7QHPIxTf2+NmoGwytG3W7IkLviVSZjUB6rQuZGlTNJV+3nuAxxX/M6ooi/
 jVlY2bTozs6cQynNg6WUbe6th5s/yp5QmQK4FThyPqdusAE2tFqBVPgw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 0/2] Fix kernel complementary package installation
Date: Mon, 21 Sep 2026 23:50:57 +0200
Message-ID: <20260921215300.582692-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 21:53:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246365

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Recipes usually name the standard packages based on PN. However, the kernel
uses ${KERNEL_PACKAGE_NAME} as the base name for its packages. This causes
inconsistent -src package naming and prevents complementary package
installation from finding the expected kernel packages. For example, a kernel
can produce kernel-dbg and linux-yocto-src, causing rootfs-dbg to include the
linux-yocto-src package but not kernel-dbg.

Introduce PACKAGE_BASENAME so recipes whose package names are based on
something other than PN can generate consistent -src package names and expose
the base name in pkgdata. Update oe-pkgdata-util to use PACKAGE_BASENAME when
resolving complementary package globs, with a fallback to PN for existing
pkgdata.

This is one possible way to handle the kernel-specific package naming. Other
approaches may be possible too. Some ideas:

- Do we really need this KERNEL_PACKAGE_NAME special feature for kernel
  packages? Or would it be possible to stick to ${PN} as any other recipe
  does?
- Is installing the kernel's complementary packages via standard
  complementary package installation the right mechanism for kernel
  packages? Or should there be a different mechanism which is more in line
  with how the kernel usually gets installed where installing it into the
  rootfs as a package is only one way out of many.

Adrian Freihofer (2):
  package: introduce PACKAGE_BASENAME for consistent kernel -src naming
  oe-pkgdata-util: use PACKAGE_BASENAME for glob PN-substitution
    fallback

 meta/classes-global/package.bbclass | 2 +-
 meta/classes-recipe/kernel.bbclass  | 3 +++
 meta/conf/bitbake.conf              | 6 ++++++
 meta/lib/oe/package.py              | 4 +++-
 scripts/oe-pkgdata-util             | 7 ++++++-
 5 files changed, 19 insertions(+), 3 deletions(-)

-- 
2.55.0


