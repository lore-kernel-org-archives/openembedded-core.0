Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F09DECD6E4C
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 07:55:30 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22945.1780298289543785884
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 00:18:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=T0ExDIVe;
 spf=pass (domain: kernel.org, ip: 172.234.252.31, mailfrom: devnull+rouven.czerwinski.linaro.org@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2245240470;
	Mon,  1 Jun 2026 07:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03B7EC2BCF7;
	Mon,  1 Jun 2026 07:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780297984;
	bh=4gp22awYq8gbHRcpmPQqG2nZzs2a0/OWFV3fIrYLivw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=T0ExDIVeMvpFHnChe38QjCW5E7qVMo0GQJvaVKkeOFNV/JSr2MIZM/iAOauVWkH99
	 oZ2ODE6EuobZFcP45VOSLTGPDP6O4hFXP0fLc4Zyp7kfnhrhqh3sv7mAQ9Q90Dz1IY
	 U/b3C4nSUJ8g36SfZU4ROdV6g+oJq5Sw0IKcitbVb/eXcQVc5CpqJim4FsPKNDmJcl
	 C735+PxPwOXZdBmewjOiJdmk4TxnDUoUUgPDVwAql8wCOapa0OMZ6+cBVuABA4EGed
	 jvLNjDJiRA4PLzn3Qy6jMwFREEgn/LEq8ov8OhLzqooI7vNCLbmm+XpLpAn60qzm+B
	 ZnJAe2XjNp5Fg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1824CD6E4C;
	Mon,  1 Jun 2026 07:13:03 +0000 (UTC)
From: Rouven Czerwinski via B4 Relay <devnull+rouven.czerwinski.linaro.org@kernel.org>
Date: Mon, 01 Jun 2026 09:13:07 +0200
Subject: [PATCH 6/6] nopackages: remove do_package_write_tar deltask
MIME-Version: 1.0
Message-Id: <20260601-topic-packagemanager-cleanup-v1-6-926e4d5b724d@linaro.org>
References: <20260601-topic-packagemanager-cleanup-v1-0-926e4d5b724d@linaro.org>
In-Reply-To: <20260601-topic-packagemanager-cleanup-v1-0-926e4d5b724d@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Rouven Czerwinski <rouven.czerwinski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780297982; l=789;
 i=rouven.czerwinski@linaro.org; s=20260126; h=from:subject:message-id;
 bh=DOK9GWkLP0QWTJCQRcbnEmJ/60AChxh34Rz0QgASB+M=;
 b=PXevJkGuSb8g+A5nZwPN13srTem2uyOFFWIUwWxMOHTo+lTlC8q/zktV2ifw6GOsQ2nqB9OxE
 1d6KhuJK5y2CdzjjSsevJNTpkK4vhwFmG7sXseXRcLg83OqgBIpW9oL
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
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 07:55:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237819

From: Rouven Czerwinski <rouven.czerwinski@linaro.org>

The package_tar class was removed in 90ce19122802
("meta/classes-global: remove package_tar.bbclass"), remove the deltask
for the nopackages class as well.

Signed-off-by: Rouven Czerwinski <rouven.czerwinski@linaro.org>
---
 meta/classes-recipe/nopackages.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes-recipe/nopackages.bbclass b/meta/classes-recipe/nopackages.bbclass
index 9ea7273530..8c433a285f 100644
--- a/meta/classes-recipe/nopackages.bbclass
+++ b/meta/classes-recipe/nopackages.bbclass
@@ -8,7 +8,6 @@ deltask do_package
 deltask do_package_write_rpm
 deltask do_package_write_ipk
 deltask do_package_write_deb
-deltask do_package_write_tar
 deltask do_package_qa
 deltask do_packagedata
 deltask do_package_setscene

-- 
2.52.0



