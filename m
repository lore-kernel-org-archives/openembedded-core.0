Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7CC6C982D2
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 18:38:47 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.620.1789670320882230074
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 11:38:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=lJqcMGcG;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-2026091718383711485881b500020757-dobtfu@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2026091718383711485881b500020757
        for <openembedded-core@lists.openembedded.org>;
        Thu, 17 Sep 2026 20:38:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=N1eLta8zv1KrJNcY9Gur+j4ch3nCLODcqWv0xlalU2U=;
 b=lJqcMGcG4BbU2Cc3DbpNVpU5pYxyHkAyKxufNrZPs1yGcIZif5nXHmHRkRSsEk1c0ZMiHD
 Mp1UuaexxP3LHVfAFSyF4w7te1QKlaNe4JrKh+LyA+T5CYgfUPxxjH5JUrLVJ6V9oAshy3wL
 dvs1bnYI5ZFWmSfCaDYICigh9EdgiYxfMy5WIcZIVk5D063u5kPBNXaRGpC9Yb15pxl9R7Tq
 KcOtECKvsTns08CbwLhzh4gUpcJmlUGm12cFhExMO22cXFfVTa6SMwlKCQX5p3oMmEuM7+P4
 adJWhJ2EJbRVI6YZMqHpfqJ6XPcuBD4QZQ8rFyjwEfx4pEXiXth1S4Wg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 0/7] oe-selftest: devtool ide-sdk: make slirp tests port collision proof
Date: Thu, 17 Sep 2026 20:37:52 +0200
Message-ID: <20260917183832.998361-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 18:38:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246080

From: Adrian Freihofer <adrian.freihofer@siemens.com>

This is a first, minimally invasive attempt to fix the flaky devtool
ide-sdk debug-server tests on the autobuilder: parallel oe-selftest
workers race for the same qemu slirp host ports, and runqemu silently
remaps a taken debug-server port instead of failing, which lldb-server/
gdbserver cannot recover from. The fix reserves a block of free host
ports up front (via its own lock directory) and bakes them into
QB_SLIRP_OPT so runqemu doesn't need to remap them.

Planned follow-ups, not included here:
- Two more commits improving runqemu's slirp MAC address allocation,
  which was also found to fail under the same kind of parallel-worker
  race.
- A more invasive change: allocate the ports dynamically via QEMU's
  QMP API once the instance is running, instead of reserving them
  ahead of time with flock files.

Preview probably for the next release is here:
https://git.openembedded.org/openembedded-core-contrib/log/?h=adrianf/ide-sdk-improvements

