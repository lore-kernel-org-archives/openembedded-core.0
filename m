Return-Path: <nora.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B1BC43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 11:29:35 +0000 (UTC)
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.171246.1783423764438849270
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 04:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ew.tq-group.com header.s=default2602 header.b=MaGasCLV;
 spf=pass (domain: ew.tq-group.com, ip: 188.40.3.216, mailfrom: nora.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=rLdcgRDjgRCbFQlANXSDPsZlGiTvzphbn+9WLBPXBA8=; b=MaGasCLVTwL1SF2Y6RNpInw+LQ
	wL/lLPvLKzoskm1wtR/mjjo+K2C6BI6o8Cf29PhmV11yVbo1nq93KOfbdLzcHBGSVd5+nLYlyjHvd
	0+rnRyyZfedKTF82t04JBM9NK4wTyBqWi9x2E0+nRc38ucvY0ht60gnsdswv5OYa+8mLwS634zwQ9
	P3pubYDgd4ibU7IXqdkxb/ZJbXsKBOwC2h589BpaQP2ZfAlzjfVRx4AEzI0q9Cdol3CaQ3sIBvVTD
	8PDyjiceNST4CX7EhiMIhWZEkI5cOBav1pizVmogu6DwnI+MgUHEtO4mGmvOl1lPi7diCxiO/LeIF
	WtwD6lhA==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wh3zN-000F5p-1u;
	Tue, 07 Jul 2026 13:29:21 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wh3zO-0000yf-0k;
	Tue, 07 Jul 2026 13:29:21 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Cc: oss@ew.tq-group.com,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH 0/2] kernel-fit-image: optional addresses for kernel_noload, OS override
Date: Tue,  7 Jul 2026 13:29:05 +0200
Message-ID: <cover.1783422721.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28053/Tue Jul  7 08:24:37 2026)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 11:29:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240382

These patches are preparation for giving Yocto the ability to create FIT images
containing an EFI application as kernel (so U-Boot can give the OS access to its
EFI services while preserving other benefits of FIT image boot).

I'm working on a third patch that reintroduces the option to replace the kernel
image itself (instead of using `linux.bin`), but while it is working locally,
that one is a bit more complex and I'm inclined to post it as an RFC rather than
a final patch once I have given it a bit more polish. I consider these first 2
patches ready and useful on their own.

Nora Schiffer (2):
  kernel-fit-image: make kernel entry point and load address optional
  kernel-fit-image: introduce FIT_OS variable to override 'os' field

 meta/classes-recipe/kernel-fit-image.bbclass |  3 ++-
 meta/conf/image-fitimage.conf                |  4 +++
 meta/lib/oe/fitimage.py                      | 27 ++++++++++++--------
 meta/lib/oeqa/selftest/cases/fitimage.py     | 13 ++++++++--
 4 files changed, 33 insertions(+), 14 deletions(-)

-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/

