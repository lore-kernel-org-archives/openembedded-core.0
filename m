Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A37DC87FCB
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 10:07:26 +0000 (UTC)
Received: from esa9.hc324-48.eu.iphmx.com (esa9.hc324-48.eu.iphmx.com [207.54.69.27])
 by mx.groups.io with SMTP id smtpd.web11.78165.1753697237256644382
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jul 2025 03:07:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=MVnWe1hl;
 spf=pass (domain: bmw.de, ip: 207.54.69.27, mailfrom: prvs=2978930ce=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1753697237; x=1785233237;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jK67ReojaYzeRRKQVDaVOeDvJnQ4k5AliE6/CNGC4Pw=;
  b=MVnWe1hlGt2+DZ05YjjPEy/iSRF1LN9Qp4GtkNxBJzkxWhz4eq+akwBK
   6zikgnOncxnQ0DPI4QZl987BlsRm9mWeENClq5NrWFihpQ/pwcLtHkP2H
   tQo3V0OYZgwYkXaeVXqspHDPKOK+K+sn87pHKJhGc+MgRv8SgZaUkQR+w
   k=;
X-CSE-ConnectionGUID: y3+/7qz0TvyGoU46bgUsFg==
X-CSE-MsgGUID: zk2D7X+kSvWeSyi+slCXTw==
Received: from 160.46.252.35.spf.bmwgroup.com.bmwgroup.com (HELO esagw3.muc)
 ([160.46.252.35]) by esa9.hc324-48.eu.iphmx.com with ESMTP/TLS;
 28 Jul 2025 12:07:15 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw3.muc with ESMTP/TLS;
 28 Jul 2025 12:07:15 +0200
Received: from smucmp19d.bmwgroup.net (HELO smucmp19d.europe.bmw.corp)
 ([10.30.13.170]) by esabb1.muc with ESMTP/TLS; 28 Jul 2025 12:07:15 +0200
Received: from marvin-ws (10.30.85.214) by smucmp19d.europe.bmw.corp
 (2a03:1e80:a15:58f::205d) with Microsoft SMTP Server (version=TLS;
 Mon, 28 Jul 2025 12:07:14 +0200
X-CSE-ConnectionGUID: tTR6e5w3Sy6bcveMJW+cIA==
X-CSE-MsgGUID: 4bX7jn5HTV+avtdyz7UgYw==
X-CSE-ConnectionGUID: sba+hbAaQS23liBlSlO/tQ==
X-CSE-MsgGUID: 48ShH/QyRjSlFo/QZV82UA==
From: Philip Lorenz <philip.lorenz@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Philip Lorenz <philip.lorenz@bmw.de>
Subject: [PATCH 0/4] Improve handling of build qa issues
Date: Mon, 28 Jul 2025 11:59:28 +0200
Message-ID: <20250728095936.1495441-1-philip.lorenz@bmw.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SMUCMP12F.europe.bmw.corp (2a03:1e80:a15:58f::1:2b0) To
 smucmp19d.europe.bmw.corp (2a03:1e80:a15:58f::205d)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 10:07:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220995

This patch series fixes a number of issues related to the handling of QA
errors that I found while analyzing current master when it comes to
correctly handling and escalating QA issues detected during the build.

Generally speaking, the requirement that tasks raising QA issues also
need to call `exit_if_errors` in all exit paths turns out to be quite
error prone (there's a number of different issues across the LTS
branches for which I will send dedicated patch series) so it may be
worthwhile to find a way to always invoke `exit_if_errors` once task
execution finishes. However, I couldn't find a straightforward way to
accomplish this with the current infrastructure so I've settled on
fixing the identified issues and proposing some improvements for now.

I'll send out the corresponding documentation updates once the series
was merged.

Philip Lorenz (4):
  package: Drop var-undefined QA check
  setuptools3: Add missing call to exit_if_errors
  insane: Explicitly fail parsing if QA errors were raised
  license_image: Make use of exit_if_errors consistent

 meta/classes-global/base.bbclass          | 4 ++++
 meta/classes-global/insane.bbclass        | 4 +---
 meta/classes-global/package.bbclass       | 3 +--
 meta/classes-recipe/license_image.bbclass | 3 ++-
 meta/classes-recipe/setuptools3.bbclass   | 1 +
 5 files changed, 9 insertions(+), 6 deletions(-)


