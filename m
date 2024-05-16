Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 018A4C25B74
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 07:30:45 +0000 (UTC)
Received: from esa2.hc324-48.eu.iphmx.com (esa2.hc324-48.eu.iphmx.com [207.54.68.120])
 by mx.groups.io with SMTP id smtpd.web10.7530.1715844632664882372
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 00:30:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=Gw+szgnb;
 spf=pass (domain: bmw.de, ip: 207.54.68.120, mailfrom: prvs=859c909c3=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1715844632; x=1747380632;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8KlgjrsRQ4OclFJMPFKoq7WczPdQlUmhlgd1nfyzy90=;
  b=Gw+szgnbvuhMM64thaSryzsacTQjYQ09o9zoKn5whlwwx2yBApn3tXPw
   /OSd77duqXFo2pi35EM3fqCKhU/erbqg4lyueNzxMwoLMRrwOVWLdO96c
   /QJlV2+bG51YcBobBJpkRCJG5qB6V5UTu2JIhCOt0AbpnPa0ataLja5xN
   w=;
X-CSE-ConnectionGUID: NDfHLSr1QRahCdEtVoMR4Q==
X-CSE-MsgGUID: XjisLGRgTSC7kQfBucrvjA==
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
 esa2.hc324-48.eu.iphmx.com with ESMTP/TLS; 16 May 2024 09:30:25 +0200
Received: from esabb5.muc ([160.50.100.47])  by esagw3.muc with ESMTP/TLS;
 16 May 2024 09:26:25 +0200
Received: from smucmp10e.bmwgroup.net (HELO SMUCMP10E.europe.bmw.corp) ([10.30.13.87])
 by esabb5.muc with ESMTP/TLS; 16 May 2024 09:26:26 +0200
Received: from localhost.localdomain (10.30.85.215) by SMUCMP10E.europe.bmw.corp
 (2a03:1e80:a15:58f::2027) with Microsoft SMTP Server (version=TLS;
 Thu, 16 May 2024 09:26:25 +0200
From: Philip Lorenz <philip.lorenz@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Philip Lorenz <philip.lorenz@bmw.de>
Subject: [PATCH 0/3] package_manager: Clean up shared deb / ipk helpers
Date: Thu, 16 May 2024 09:24:36 +0200
Message-ID: <20240516072439.2998567-1-philip.lorenz@bmw.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SMUCMP12F.europe.bmw.corp (2a03:1e80:a15:58f::1:2b0) To
 SMUCMP10E.europe.bmw.corp (2a03:1e80:a15:58f::2027)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 07:30:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199440

This patch series fixes one issue which I missed in
"lib/package_manager/ipk: Do not hardcode payload compression algorithm"
(2ad05635a6da403b4fadcc126fe7734067c12c73). Default configurations using
zstd are not affected but I'd still like to make sure that things are
cleaned up.

Additionally, this series cleans up some deb / ipk related code by
moving their common base class to a shared location. This originally
used to be the case, but as part of a larger refactoring, the class was
duplicated into the individual packages. If there was some kind of
rationale for doing this (I couldn't think of one and couldn't figure
this out based on the commit history), please let me know.

As part of this clean up, the `extract` method is moved into the common
base class to ensure that future adaptations apply to both
specializations.

Philip Lorenz (3):
  ipk: Fix clean up of extracted IPK payload
  package_manager: Move OpkgDpkgPM into common module
  package_manager: Share more common DEB / IPK code

 meta/lib/oe/package_manager/common_deb_ipk.py | 97 +++++++++++++++++++
 meta/lib/oe/package_manager/deb/__init__.py   | 85 +---------------
 meta/lib/oe/package_manager/ipk/__init__.py   | 95 +-----------------
 3 files changed, 101 insertions(+), 176 deletions(-)
 create mode 100644 meta/lib/oe/package_manager/common_deb_ipk.py

-- 
2.44.0


