Return-Path: <nora.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2829C5321C
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 09:06:35 +0000 (UTC)
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27293.1785143188306891535
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 02:06:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ew.tq-group.com header.s=default2602 header.b=c424bpvM;
 spf=pass (domain: ew.tq-group.com, ip: 188.40.3.216, mailfrom: nora.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=f5cqh2D8urS0LQhcatNPuziw4jv9I79zoscugTRbC/8=; b=c424bpvMl6vK8HgySB6A7TF1g+
	ltuTrxjiInmItq4oR1V8nubsxVPsX6NFPkKcwjukSOhGv1qmMhFpQrReKlwpt8i/21o2uHcw59yYo
	sGK9ZRu7nzd+pTHKOdbZn8ilgkOhEZ3lLX8m+ZuUEkbCQW+TT/4lhiurAOBnnE/zq0LMeh/5parEy
	LHQjRVNZI7Hi8S5/O2huJ0svPAj2nOi4zybw6fMLNxxFCw8Tqi1vvh7n8NJNLqOUovcWsJOoYU7ag
	vPxBRh5MbnOE6TVv+lyn3VDM1tkizYrwXlIvAjyScA8wQkAjgeEBNUkfKbXc6eZ41rO+Aehg+GzwT
	u61XmLIA==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1woHI2-000AQv-0D;
	Mon, 27 Jul 2026 11:06:26 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1woHI2-000A13-18;
	Mon, 27 Jul 2026 11:06:25 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Cc: oss@ew.tq-group.com,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH v2 0/3] kernel-fit-image: allow replacing kernel, handle compression in FIT recipe
Date: Mon, 27 Jul 2026 11:05:58 +0200
Message-ID: <20260727090601.489155-1-nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28074/Mon Jul 27 08:25:14 2026)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 09:06:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242068

Add support for building alternative kernel images into a FIT image instead of
using linux.bin. An incomplete solution with a similar goal was added in in
commit 9c8ef2119949 ("kernel-fit-image: control kernel section with
FIT_LINUX_BIN") and subsequently reverted in commit 6eae261b6f52 ("Revert
"kernel-fit-image: control kernel section with FIT_LINUX_BIN"") due to missing
features, lack of tests and the submitter having abandoned their approach.

With the new approach, compression is now either handled as part of the
FIT image (KERNEL_FILENAME) or the image is considered to be compressed already
(KERNEL_FILENAME_COMPRESSED). The option to let the kernel recipe do the
compression and store the result in the image deploydir as linux.bin is
preserved for backwards compatibility, but will result in a deprecation warning.

Our main use case for this is to support building a FIT image with an EFI
application as kernel (with FIT_OS = "efi").


v2: do not hardcode kernel filename to bzImage in
    fitimage.KernelFitImageRecipeTests.test_fit_image_kernel_filename selftest
    to fix build on non-x86 machines in PATCH 2/3


Nora Schiffer (3):
  kernel-uboot: move FIT_KERNEL_COMP_ALG to image-fitimage.conf
  kernel-fit-image: reintroduce option to replace kernel image
  kernel-fit-extra-artifacts: skip building linux.bin if unneeded

 .../kernel-fit-extra-artifacts.bbclass        |  4 +-
 meta/classes-recipe/kernel-fit-image.bbclass  | 53 ++++++++--
 meta/classes-recipe/kernel-uboot.bbclass      |  3 +-
 meta/conf/image-fitimage.conf                 | 27 +++++-
 meta/lib/oeqa/selftest/cases/fitimage.py      | 96 ++++++++++++++++++-
 5 files changed, 166 insertions(+), 17 deletions(-)

-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/

