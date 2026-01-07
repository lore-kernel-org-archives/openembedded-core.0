Return-Path: <louis.rannou@non.se.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D19E7CD5857
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:41:14 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3217.1767782473708515066
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:41:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=hfutVTDr;
 spf=pass (domain: kernel.org, ip: 172.105.4.254, mailfrom: devnull+louis.rannou.non.se.com@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5899F60007;
	Wed,  7 Jan 2026 10:41:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0DF7DC4CEF7;
	Wed,  7 Jan 2026 10:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767782472;
	bh=b/q85BkYIhY/IQQDm8i7EPkR7Agq6t1mY39ZaaBatj8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=hfutVTDr9B9lwp7AqzxWUl1KbEcF0FHoDgdg1cQBTw1FD6OyxMwCC0YZVbpgJUprz
	 u9oa+8sy6DwGUrbNRL9o9nAk6Yq2HKpMtT372GlzskokU3t5EJvumWBqYj7YhdAkkj
	 cNBv2bdBak0Cj/AcjhJL2HtaLzfcCrKRNtLaWjEc+xeIkrDDdJoV+tJpFMi3AzkOde
	 2qqEBFNrY/W0IFmQlvVCkcBkr8cj7Dl1tp2XtYkug+5nkmKuGvkQcVhab4TdAtTzUJ
	 9OC6SaRkozxuxtNwEGCWwjWXM2CPvR9qGvzDzTR9nrloWmd/NQgZarIeWddfDKK1MA
	 tJpeovoXfaLog==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04289CD5853;
	Wed,  7 Jan 2026 10:41:12 +0000 (UTC)
From: Louis Rannou via B4 Relay <devnull+louis.rannou.non.se.com@kernel.org>
Subject: [PATCH 0/2] wic: extra-partitions: new variable to be combined
 with sourceparams
Date: Wed, 07 Jan 2026 11:40:49 +0100
Message-Id: <20260107-extrafiles-v1-0-a4ddd07df231@non.se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADE4XmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQwNz3dSKkqLEtMyc1GLdxBTLRCNTUyPLJCMDJaCGgqLUtMwKsGHRsbW
 1APiCmy1cAAAA
To: openembedded-core@lists.openembedded.org
Cc: Louis Rannou <louis.rannou@non.se.com>, pierre-loup.gosse@smile.fr
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767782471; l=1626;
 i=louis.rannou@non.se.com; s=20250630; h=from:subject:message-id;
 bh=b/q85BkYIhY/IQQDm8i7EPkR7Agq6t1mY39ZaaBatj8=;
 b=MDIhPX3BpPnJCozd7SWQhW+cDnvNwgVULFAjqI5FWBRVASB0hI3zSJRnGSSeNKIe8nSHiLgqs
 y+BZpUByw4CCjBGYMu2JJzyg8PHhsxhrWvmQi4JCnib8JDxubufAe2m
X-Developer-Key: i=louis.rannou@non.se.com; a=ed25519;
 pk=WWYN5/DFKqyCKdv6oTYNuq0gROqwZVfNfw2OMI3tUlc=
X-Endpoint-Received: by B4 Relay for louis.rannou@non.se.com/20250630 with
 auth_id=446
X-Original-From: Louis Rannou <louis.rannou@non.se.com>
Reply-To: louis.rannou@non.se.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 10:41:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228987

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

The second commit allows the new suffix _sourceparams_foo to be appended
to IMAGE_EXTRA_PARTITION_FILES. This variable will be preferred whenever
the .wks specifies a name in the --sourceparams option.

For example:
  an image may define:
    IMAGE_EXTRA_PARTITION_FILES_sourceparams_foo = "bar.conf"
  and the .wks line have line:
    part --source extra_partition --sourceparams "name=foo"

Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
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



