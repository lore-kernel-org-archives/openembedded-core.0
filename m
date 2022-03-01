Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B37BFC433FE
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 01:37:29 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web09.3428.1646098648953623804
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 17:37:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57,
 mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net (ip203.trans.bevcomm.net
 [76.164.132.203] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 2211bRbQ020212
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 19:37:27 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] FIPS host support
Date: Mon, 28 Feb 2022 19:37:25 -0600
Message-Id: <20220301013726.1381053-1-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 01:37:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162521

The patch here, and one sent to bitbake-devel together enable basic support
for a FIPS-140 host system.

What was identified were a few users of md5, which is not allowed for any
security part of the system.  It can still be used to identify changes and
similar non-security activities.  (OE already uses sha256 for file
integrity.)

In addition to this, it's possible that a recipe may attempt to use md5
during the build process.  In oe-core, the only user is 'ovmf'.  At this
time I don't intend to provide a fix for ovmf, but everything else in core
works properly now.

Mark Hatle (1):
  insane.bbclass: Update insane.bbclass to work on FIPS enabled hosts

 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.25.1


