Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2550C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 17:26:39 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web08.830.1643909196395744388
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 09:26:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sigma-chemnitz.de header.s=v2012061000 header.b=OX6K/BZ9;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67,
 mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-2.intern.sigma-chemnitz.de
 (mail-mta-2.intern.sigma-chemnitz.de [192.168.12.70])
	by mail-out-3.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 213HQW1u108198
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 3 Feb 2022 18:26:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1643909193;
	bh=hPnN6eCcjRnIyuR8WHyCAbgR0syECT8J4M60Cl1iTVo=; l=1438;
	h=From:To:Cc:Subject:Date;
	b=OX6K/BZ9ArL4P9jNIJkAnv3jxdrq/rSyTI8sx++VQPsCos8AYLXSM87wurfBBzCC4
	 DORxGX+eHPfSJBrc7BVwQd8/BI/nf3FLUuLbRUFnh9WWtaAoljHm0+wd6JGAUbWMNi
	 DCJ9RTl8yP+JttX7s/iPIYAsUocfxvDoOsAGD37o=
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local
 [192.168.16.32])
	by mail-mta-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTP id
 213HQUAp140004
	for <openembedded-core@lists.openembedded.org> from
 enrico.scholz@sigma-chemnitz.de; Thu, 3 Feb 2022 18:26:31 +0100
Received: from mail-msa-3.intern.sigma-chemnitz.de ( [192.168.12.73]) by
 reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 3A0B362DF7A; Thu, 3 Feb 2022 18:26:29 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
 (ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-3.intern.sigma-chemnitz.de (8.15.2/8.15.2) with ESMTPS id
 213HQSCA105873
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 3 Feb 2022 18:26:29 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
 4.94.2)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1nFfsK-005S2t-Ii; Thu, 03 Feb 2022 18:26:28 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] gcc: enable zstd compression of LTO bytecode
Date: Thu,  3 Feb 2022 18:26:19 +0100
Message-Id: <20220203172619.1299363-1-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 17:26:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161292

gcc-10+ supports zstd compression of LTO bytecode.  Install the
corresponding package to enable this feature in a deterministic way.

NOTE: previously built LTO object files (without this compression)
must be regenerated; gcc will fail else with

  | lto1: internal compiler error: original not compressed with zstd

in this case.

NOTE: it seems to be possible that zstd support is enabled non
deterministically (perhaps by host system pollution).

I had the problem that the SDK gcc was built with zstd while the
cross gcc was built without it.  Libraries (built by cross gcc and
uncompressed hence) could not be used with the SDK gcc.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/recipes-devtools/gcc/gcc-11.2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtools/gcc/gcc-11.2.inc
index f07a5be507b3..62db035760aa 100644
--- a/meta/recipes-devtools/gcc/gcc-11.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
@@ -11,7 +11,7 @@ BINV = "11.2.0"
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
 
 DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
-NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native"
+NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native zstd-native"
 
 LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
 
-- 
2.34.1


