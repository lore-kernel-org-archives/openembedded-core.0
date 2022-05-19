Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 424C8C4332F
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 10:06:28 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web11.5730.1652954775949905931
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 03:06:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=XjFjjULR;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67,
 mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-2.intern.sigma-chemnitz.de
 (mail-mta-2.intern.sigma-chemnitz.de [192.168.12.70])
	by mail-out-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 24JA6Dn7621385
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 12:06:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1652954773;
	bh=VmwgavAtPRYHUT/zyI/ocYsOHhOAATi0Dqy7gsgrQj0=; l=753;
	h=From:To:Cc:Subject:Date;
	b=XjFjjULR7nti0XFeFQhWF9J7G7KPPSPHzczCqYeusm996UCz10lZ4biCm14bfiBpx
	 8GPRzH3WR4qdloQVU7GY/UCEa0ptvNY4/tce2q4M6jxOrNVenL2bCkvPVpGNtR+sba
	 YBEC7FT3UMiNj7dQI11scNnMJOfKH1MJtsUpkCsv+cdHUeLh+02RlYDt2bGcV9SUm2
	 FXUCgTNg44pH1UyGVnLZFHdCDZpUmVD6iJyqJfstW5VlcmN963OY5a+hp2+emy5rBA
	 RT/+foJHFPimhzBBQXLXimGHV0bmSGf166fN8zRKBRzmmdfgOUwFO9dOlhb//33gvj
	 7JTmgSTVRbsxw==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local
 [192.168.16.32])
	by mail-mta-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTP id
 24JA68N7791536
	for <openembedded-core@lists.openembedded.org> from
 enrico.scholz@sigma-chemnitz.de; Thu, 19 May 2022 12:06:08 +0200
Received: from mail-msa-3.intern.sigma-chemnitz.de ( [192.168.12.73]) by
 reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 75B1C2CAE53; Thu, 19 May 2022 12:06:06 +0200
Received: from ensc-pc.intern.sigma-chemnitz.de
 (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-3.intern.sigma-chemnitz.de (8.15.2/8.15.2) with ESMTPS id
 24JA66tN856492
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 19 May 2022 12:06:06 +0200
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.95)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1nrd2k-004ImB-Fm;
	Thu, 19 May 2022 12:06:06 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 0/6] npm.bbclass: work with nodejs 16
Date: Thu, 19 May 2022 12:05:50 +0200
Message-Id: <cover.1652954597.git.enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 10:06:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165878

nodejs 16 changed internal caching significantly which breaks the
existing npm.bblcass.

Simulate parts of the npm registry and cache data in the way as
expected.

This patchset requires an additional one in the oe-meta layer.

Enrico Scholz (6):
  npm: replace 'npm pack' call by 'tar czf'
  npm: return content of 'package.json' in 'npm_pack'
  npm: take 'version' directly from 'package.json'
  npm: disable 'audit' + 'fund'
  lib:npm_registry: initial checkin
  npm: use npm_registry to cache package

 meta/classes/npm.bbclass    |  65 +++++++++-----
 meta/lib/oe/npm_registry.py | 169 ++++++++++++++++++++++++++++++++++++
 2 files changed, 213 insertions(+), 21 deletions(-)
 create mode 100644 meta/lib/oe/npm_registry.py

-- 
2.36.1


