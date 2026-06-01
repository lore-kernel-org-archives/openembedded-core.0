Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A55CCD5BD1
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 07:55:11 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22946.1780298289545376440
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 00:18:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=mjsnICfD;
 spf=pass (domain: kernel.org, ip: 172.234.252.31, mailfrom: devnull+rouven.czerwinski.linaro.org@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C2C0540206;
	Mon,  1 Jun 2026 07:13:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A550DC2BCB8;
	Mon,  1 Jun 2026 07:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780297983;
	bh=Edi49FmuxF7FRRimEZBIR+9Rdk0eXhHDi7yyvuVGiFg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=mjsnICfDPoU6Ua/gnhLRTbJhS9QpKRvXG+ItzzHBApXUFJ2cDyaR+IOqLX/lfn1Hd
	 zPJcB/P2su83Xp77nzwjBwx28jI842XCYiIXHBE35olbX4uQZxBVDtLTPiyXCQN5Fv
	 YZrLEwq7x4nKtCj9yByLZeeLeDyIaLfu4dOwYvcS3kIsOaCm92miCf8AccsEH8Qj/w
	 Ktmaemxs7KbTA6vGqdY86ZbMC7FUmq4VKybMUlY1uteyhtaVJd/Dy4Vowgy+JA4j1Z
	 8kQou5x40JzFwlAAuNhEsKqMcPKZ3SvOJCdvER4ZaRYiCK19vzME+iVPTnMGtIqK7g
	 eHJYI0LMqDziw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD42CD6E56;
	Mon,  1 Jun 2026 07:13:03 +0000 (UTC)
From: Rouven Czerwinski via B4 Relay <devnull+rouven.czerwinski.linaro.org@kernel.org>
Subject: [PATCH 0/6] Small package manager cleanup series
Date: Mon, 01 Jun 2026 09:13:01 +0200
Message-Id: <20260601-topic-packagemanager-cleanup-v1-0-926e4d5b724d@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAP0wHWoC/x3MTQqEMAxA4atI1hOoP1T0KjKLkEYNztTSqgji3
 S1uHnybd0GSqJKgLy6IcmjS1WeUnwJ4Jj8JqsuGylTWWFPitgZlDMQLTfInnxuRf0J+D1izNF3
 bOOu4g7wIUUY93/3wve8HywKT6G4AAAA=
X-Change-ID: 20260601-topic-packagemanager-cleanup-3ce4974d6dc9
To: openembedded-core@lists.openembedded.org
Cc: Rouven Czerwinski <rouven.czerwinski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780297982; l=1346;
 i=rouven.czerwinski@linaro.org; s=20260126; h=from:subject:message-id;
 bh=Edi49FmuxF7FRRimEZBIR+9Rdk0eXhHDi7yyvuVGiFg=;
 b=CgtLhjHH9ukmSwrHuDeq4WwsmuQSjz+vN8mlzW0rZlgGx3Ta9eNou46vVStZSEkMIzZOpln8a
 RlBnq14x3/xBnePDuMIhhCMkksdc4piO4HyIaBg1e/n0/+IoxwitEDc
X-Developer-Key: i=rouven.czerwinski@linaro.org; a=ed25519;
 pk=/5pmUK/XIAIIo8JA0axgfy1k8NRhRTQkxVwZYa1ga7U=
X-Endpoint-Received: by B4 Relay for rouven.czerwinski@linaro.org/20260126
 with auth_id=616
X-Original-From: Rouven Czerwinski <rouven.czerwinski@linaro.org>
Reply-To: rouven.czerwinski@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 07:55:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237817

Small cleanups I collected while writing my APK package manager talk.
These should introduce no functional changes.

Smoke tested by building core-image-minimal with all package managers
enabled.

Signed-off-by: Rouven Czerwinski <rouven.czerwinski@linaro.org>
---
Rouven Czerwinski (6):
      package_manager: sdk: remove install_order
      package_manager: rootfs: remove install_order
      package_manager: sdk: remove sdk_host_sysroot
      package_manager: remove [True, False] list eval
      documentation.conf: remove do_package_write_tar doc
      nopackages: remove do_package_write_tar deltask

 meta/classes-recipe/nopackages.bbclass    | 1 -
 meta/conf/documentation.conf              | 1 -
 meta/lib/oe/package_manager/deb/rootfs.py | 4 ++--
 meta/lib/oe/package_manager/deb/sdk.py    | 6 +++---
 meta/lib/oe/package_manager/ipk/rootfs.py | 4 ++--
 meta/lib/oe/package_manager/ipk/sdk.py    | 8 ++++----
 meta/lib/oe/package_manager/rpm/sdk.py    | 2 +-
 meta/lib/oe/rootfs.py                     | 2 --
 meta/lib/oe/sdk.py                        | 5 +----
 9 files changed, 13 insertions(+), 20 deletions(-)
---
base-commit: 31edc0b82a3dc7b1dd0338da4a8d0d8f5a1dc138
change-id: 20260601-topic-packagemanager-cleanup-3ce4974d6dc9

Best regards,
-- 
Rouven Czerwinski <rouven.czerwinski@linaro.org>



