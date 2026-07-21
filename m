Return-Path: <nora.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57FACC44536
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 14:09:02 +0000 (UTC)
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23753.1784642932511304288
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 07:08:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ew.tq-group.com header.s=default2602 header.b=L6iD2Duy;
 spf=pass (domain: ew.tq-group.com, ip: 188.40.3.216, mailfrom: nora.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=sFu8jsG0us6apSftDxZ90RtcA1a7HV0jRmjeIKjTWyU=; b=L6iD2DuypT3DR4jfmAIumWjvp1
	PDOWkw7D5EuG1zK5HBJPqk10BNz3zNcO2U6gTH+U5LwslNzVkMRqjUs3jJ6knTAexPbyOb1HrYYa5
	H29gZEbb6nez6KwvqP/xjr0ZNDOLjltJlXWqub7A/UTE4CBlwLOaxSzCtmAKaSlHJM0e3k9Ym3hpi
	qzEmh5zvgKlSjhTiTcLUJtvOyyCsrEKNaIKpEOwYg16SBK8bmWVFvStHmtvk1gNCj4CdZ1ViJbVDJ
	kMeAYU4bXVOdhPNsyAxdrFveSqzVWMPNdOMPTCoNS/pMFIsMWXtLtm9/DrCR6ezIT4f1M6wz3pJyz
	9aCsDVZA==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wmB9N-000Hkp-2r;
	Tue, 21 Jul 2026 16:08:49 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wmB9N-000GRg-0Z;
	Tue, 21 Jul 2026 16:08:49 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Cc: oss@ew.tq-group.com,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH v2 0/3] kernel-fit-image: optional addresses for kernel_noload, OS override
Date: Tue, 21 Jul 2026 16:08:05 +0200
Message-ID: <cover.1784642607.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28067/Tue Jul 21 08:23:56 2026)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 14:09:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241531

These patches are preparation for giving Yocto the ability to create FIT images
containing an EFI application as kernel (so U-Boot can give the OS access to its
EFI services while preserving other benefits of FIT image boot).

Support for actually replacing the kernel with a different file from the image
deploy dir will be submitted as a separate series, but I'd like to get some less
controversial changes out of the way first.

Changes in v2:

- Avoid shadowing os import (new patch 2/3, changes in patch 3/3)
- Updated U-Boot git repository URL in commit message 1/3


Nora Schiffer (3):
  kernel-fit-image: make kernel entry point and load address optional
  kernel-fit-image: avoid shadowing os stdlib import
  kernel-fit-image: introduce FIT_OS variable to override 'os' field

 meta/classes-recipe/kernel-fit-image.bbclass |  3 +-
 meta/conf/image-fitimage.conf                |  4 +++
 meta/lib/oe/fitimage.py                      | 29 ++++++++++++--------
 meta/lib/oeqa/selftest/cases/fitimage.py     | 13 +++++++--
 4 files changed, 34 insertions(+), 15 deletions(-)

-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/

