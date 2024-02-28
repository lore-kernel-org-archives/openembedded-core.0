Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E2E0C47DD9
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 06:22:20 +0000 (UTC)
Received: from esa2.hc324-48.eu.iphmx.com (esa2.hc324-48.eu.iphmx.com [207.54.68.120])
 by mx.groups.io with SMTP id smtpd.web11.7502.1709101339329179674
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 22:22:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=EMS6rZM6;
 spf=pass (domain: bmw.de, ip: 207.54.68.120, mailfrom: prvs=781c072f5=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1709101339; x=1740637339;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tzzzIi1tdKwGva+/Dx19pOUlthlURb1z0sDr86sHi0k=;
  b=EMS6rZM67in3KyYn3nZ+yNcQDiIc5/AY/851MT58lG7/SIYbdI3+Pn/N
   Qcm6ls2R2xI3qsNlHz5ChPgpNKAhENepvvL/aSXqU9m5flvQRXihQS08I
   c/EnNm+K9rgRxvyZaS6DC1RVBrXM1NXccawxBKumXe9ZJhJtD/IXTWy1i
   Q=;
X-CSE-ConnectionGUID: j2ruPmb3R6iYigR49a7YiQ==
X-CSE-MsgGUID: /dEg9nk1QxaX2iaiBQkrxw==
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa2.hc324-48.eu.iphmx.com with ESMTP/TLS; 28 Feb 2024 07:22:16 +0100
Received: from esabb4.muc ([160.50.100.33])  by esagw4.muc with ESMTP/TLS;
 28 Feb 2024 07:22:05 +0100
Received: from smucmp10e.bmwgroup.net (HELO SMUCMP10E.europe.bmw.corp) ([10.30.13.87])
 by esabb4.muc with ESMTP/TLS; 28 Feb 2024 07:22:05 +0100
Received: from localhost.localdomain (10.30.85.210) by SMUCMP10E.europe.bmw.corp
 (10.30.13.87) with Microsoft SMTP Server (version=TLS;
 Wed, 28 Feb 2024 07:22:05 +0100
From: Philip Lorenz <philip.lorenz@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Philip Lorenz <philip.lorenz@bmw.de>
Subject: [RFC PATCH 0/1] package.bbclass: Expose list of split out debug files
Date: Wed, 28 Feb 2024 07:21:38 +0100
Message-ID: <20240228062139.473528-1-philip.lorenz@bmw.de>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp18h.europe.bmw.corp (10.30.13.166) To
 SMUCMP10E.europe.bmw.corp (10.30.13.87)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 06:22:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196324

With the introduction of debuginfod ([1]), providing debug symbols to
developers has been greatly simplified. Initial support for spawning a
debuginfod server is already available as part of poky.

However, this relies on debuginfod scraping the debug packages for their
build IDs. This is not only inefficient (as all packages need to be
extracted again), but it also does not scale well when covering a large
number of builds.

To mitigate this, we are currently working on an approach to extract the
metadata needed to provide debug symbols as part of the bitbake build.
This metadata includes the mapping of the GNU build ID to the package
holding the debug symbol. The metadata will be treated as another build
artifact and can be consumed by a daemon implementing the debuginfod
HTTP API to serve debug symbol file requests from the package feed
produced by the bitbake build.

Initially, we considered implementing the generation of debug metadata
directly as part of emit_pkgdata() in package.bbclass (disabled by
default). However, we discarded this idea as introducing a configuration
option would increase maintenance effort for a feature that would
potentially only be enabled in very few builds.  Instead, we opted to
extend package.bbclass to expose the minimal information needed to
reliably identify debug symbol files, which can then be consumed by a
packaging hook.

Is this extension something that is viable to be merged? We are
considering open-sourcing the other parts needed to implement the setup
described above, but as those parts are still in the prototyping phase,
it will require some more time.

[1] https://sourceware.org/elfutils/Debuginfod.html

Philip Lorenz (1):
  package.bbclass: Expose list of split out debug files

 meta/classes-global/package.bbclass |  4 ++++
 meta/lib/oe/package.py              | 19 ++++++++++---------
 2 files changed, 14 insertions(+), 9 deletions(-)

-- 
2.43.2


