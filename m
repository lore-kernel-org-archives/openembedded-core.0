Return-Path: <louis.rannou@non.se.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 037F7D2504E
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 08:30:02 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28962.1768206599568127200
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jan 2026 00:29:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=lxme2YKH;
 spf=pass (domain: kernel.org, ip: 172.105.4.254, mailfrom: devnull+louis.rannou.non.se.com@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 76AE060179;
	Mon, 12 Jan 2026 08:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2AC7EC19422;
	Mon, 12 Jan 2026 08:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768206598;
	bh=HbnQ1hOFFK/7CF89MCQYjGsU/lvVCpxQ0m+j4WJSFUg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=lxme2YKHcSSEQk1e4f/WjrkWX3zCq/GZ1fJCYiVrUXwZOreJxXGMzBOEMrc6sXz6k
	 dA2NVnIDVl6ye+SS3XN6QHFzWAr+4UvEKjX0swM2pxJ+P7lkXhFCYYt0cCwCA4EJN+
	 KmGarthn3TeH4/OTcdPRt6c3DXvf27tzocJOmqXk9loc8/ET/8FGSifIgijYL00ROb
	 m9HvBDAXgJcILd4U9gWbJWVgFaCBz/ryzvZuPGYCBoTPqudpaDnK3dPJM7QIS5CQ4+
	 /PwVFl1vdHdfYyuCYiwgplgNvGqlE4uNlhlBSD+OKcV+4eDWy+p1TID9u6E0pDPptu
	 MSeJxG9i/3JcQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B5DDD25036;
	Mon, 12 Jan 2026 08:29:58 +0000 (UTC)
From: Louis Rannou via B4 Relay <devnull+louis.rannou.non.se.com@kernel.org>
Subject: [PATCH v2 0/2] wic: extra-partitions: new variable to be combined
 with sourceparams
Date: Mon, 12 Jan 2026 09:29:54 +0100
Message-Id: <20260112-extrafiles-v2-0-67f0f6c37c4e@non.se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAKxZGkC/23MQQrCMBCF4auUWZuSjNZSV95DuoidiR3QRJISK
 iV3N3bt8n/wvg0SR+EEl2aDyFmSBF8DDw1Ms/UPVkK1ATWetdG94nWJ1smTk7I0WOw6HO6ooR7
 ekZ2sO3Yba8+SlhA/u53Nb/3LZKO0sici0j05PJqrD75N3E7hBWMp5QtjVCOVpQAAAA==
To: openembedded-core@lists.openembedded.org
Cc: Louis Rannou <louis.rannou@non.se.com>, pierre-loup.gosse@smile.fr
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768206597; l=1768;
 i=louis.rannou@non.se.com; s=20250630; h=from:subject:message-id;
 bh=HbnQ1hOFFK/7CF89MCQYjGsU/lvVCpxQ0m+j4WJSFUg=;
 b=eDcvDUBI3RAGrPdV27/8J5ICgzqRDIvuwUK9PvoodsrMkF5ODl3mcJbBhbXxfsNZA2BftmTkq
 uNhaieVJJA+D7W39h/hxMmda6+SThHpwbEhCPLd5Xl6M89FvfNgpdIo
X-Developer-Key: i=louis.rannou@non.se.com; a=ed25519;
 pk=WWYN5/DFKqyCKdv6oTYNuq0gROqwZVfNfw2OMI3tUlc=
X-Endpoint-Received: by B4 Relay for louis.rannou@non.se.com/20250630 with
 auth_id=446
X-Original-From: Louis Rannou <louis.rannou@non.se.com>
Reply-To: louis.rannou@non.se.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 08:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229193

The current extra_partition plugin uses predictable variable names (the
configuration must predict the image partition label or uuid). This has two
inconveniences:

- an extra partition that has a specific label (or uuid) is doomed with the
  associated variable. The partition cannot be configured unless the label
  (or uuid) is changed.
- two partitions with same label from distincts .wks cannot have different
  content.

The first commit increases the tests. It now tests several files can be included
and that the file system type can be specified. It also simplifies the 'wic ls'
command by removing unneeded pipes.

The second commit allows the new suffix _name-%s to be appended to
IMAGE_EXTRA_PARTITION_FILES. This variable will be preferred whenever the
.wks specifies a name in the --sourceparams option.

For example:
  an image may define:
    IMAGE_EXTRA_PARTITION_FILES_name-foo = "bar.conf"
  and the .wks line have line:
    part --source extra_partition --sourceparams "name=foo"

Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
---
Changes in v2:
- change suuffix _sourceparam-%s to _name-%s
- Link to v1: https://lore.kernel.org/r/20260107-extrafiles-v1-0-a4ddd07df231@non.se.com

---
Louis Rannou (2):
      oeqa/selftest: wic: improve extra-partition plugin tests
      wic: extra-partition: introduce variable matching sourceparams

 meta/lib/oeqa/selftest/cases/wic.py               | 55 ++++++++++++++++-------
 scripts/lib/wic/plugins/source/extra_partition.py | 24 +++++++---
 2 files changed, 57 insertions(+), 22 deletions(-)
---
base-commit: 0ed4776533145c901611d7f4f942490e33481335
change-id: 20260107-extrafiles-ad9a25529b20

Best regards,
-- 
Louis Rannou <louis.rannou@non.se.com>



