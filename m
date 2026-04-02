Return-Path: <pavel@loebl.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87214D39413
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 10:58:12 +0000 (UTC)
Received: from mxb.seznam.cz (mxb.seznam.cz [77.75.76.89])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13089.1775127476192869931
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 03:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@emailprofi.seznam.cz header.s=szn1 header.b=YBYI+eqk;
 spf=none, err=permanent DNS error (domain: loebl.cz, ip: 77.75.76.89, mailfrom: pavel@loebl.cz)
Received: from email.seznam.cz
	by smtpc-mxb-798b96f97c-rckl8
	(smtpc-mxb-798b96f97c-rckl8 [2a02:598:96:8a00::1200:515])
	id 4c8a7fc75718f213486fc645;
	Thu, 02 Apr 2026 12:57:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=emailprofi.seznam.cz; s=szn1; t=1775127472;
	bh=GpIHbUMZV0QpWEo4Eq5ApkKvbqbKWBjGqOOstorUf/M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=YBYI+eqkoY90UBrtVEKNGbRSQn7/lm1cQwlkucn+eJCAqo1e0IXOSbE/vFHIzULGx
	 Ct9UE/v/1BZJhbpDt0JEr8zKUwX+DcUoAMw5DG1c2rwwJLtAgIWHTb/nZViKxn3rRu
	 DcPJi5bcI8TT1ApveYdd1qNGOVo81HHtwCI2QmRagjsDFHOyPO6+gDQbBZ8VRL8t0G
	 YU947fgezHP1gHgg1qfd4VxGQ2DRbf+p9u6LYffi2cFUtlHbvL7bnkCM4CmegSbynf
	 Mbf0eZbgmnMToUqbLziNV6V/TdoGj7g4P74PPIooVE8/YQUlIjnJHtx6Uz9VDwTiu9
	 Bh/UwAsbbrmAg==
Received: from localhost ([2a03:a900:1020:47::f71])
	by smtpd-relay-789d8dfb5c-bffz6 (szn-email-smtpd/2.0.71) with ESMTPA
	id 23be7990-94ea-4eb0-9937-07879257f7c5;
	Thu, 02 Apr 2026 12:57:52 +0200
From: =?UTF-8?q?Pavel=20L=C3=B6bl?= <pavel@loebl.cz>
To: openembedded-core@lists.openembedded.org
Cc: Michelle Lin <michelle.linto91@gmail.com>,
	Mikko Rapeli <mikko.rapeli@linaro.org>,
	=?UTF-8?q?Pavel=20L=C3=B6bl?= <pavel@loebl.cz>
Subject: [PATCH] uki.bbclass: handle undefined KERNEL_DEVICETREE variable
Date: Thu,  2 Apr 2026 12:54:40 +0200
Message-ID: <20260402105450.2672139-1-pavel@loebl.cz>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 10:58:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234516

When kernel DTB is provided by firmware, KERNEL_DEVICETREE can be
undefined. This the case when U-Boot provides the devicetree (compiled
from it's own sources) via EFI configuration table.

Currently this case results in following error:

    do_uki: ERROR: cannot find
...build/tmp/deploy/images/machine/${KERNEL_DEVICETREE}

Therefore handle undefined variable as empty to skip DTB inclusion.

Signed-off-by: Pavel Löbl <pavel@loebl.cz>
---
 meta/classes-recipe/uki.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bbclass
index 326697a06660..d16f3c95561e 100644
--- a/meta/classes-recipe/uki.bbclass
+++ b/meta/classes-recipe/uki.bbclass
@@ -80,7 +80,7 @@ UKI_CONFIG_FILE ?= "${UNPACKDIR}/uki.conf"
 UKI_FILENAME ?= "uki.efi"
 UKI_KERNEL_FILENAME ?= "${KERNEL_IMAGETYPE}"
 UKI_CMDLINE ?= "rootwait root=LABEL=root"
-UKI_DEVICETREE ?= "${KERNEL_DEVICETREE}"
+UKI_DEVICETREE ?= "${@d.getVar('KERNEL_DEVICETREE') or ''}"
 # secure boot keys and cert, needs sbsign-tools-native (meta-secure-core)
 #UKI_SB_KEY ?= ""
 #UKI_SB_CERT ?= ""
-- 
2.53.0


