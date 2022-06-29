Return-Path: <peter@berginkonsult.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E349AC433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 08:06:52 +0000 (UTC)
Received: from mailrelay1-2.pub.mailoutpod1-cph3.one.com
 (mailrelay1-2.pub.mailoutpod1-cph3.one.com [46.30.212.0])
 by mx.groups.io with SMTP id smtpd.web09.8955.1656490011154873789
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 01:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa2 header.b=Yf5tAW5a;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.212.0,
 mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=rsa2;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=q/nZhvXlU8iy1rU/VTinDRQeglQTVbyVMMhY6QqLe3w=;
	b=Yf5tAW5ak9wqeN5Lv3kOn9MXteGEeoGvqsqhPMOJcKbfowBYqc9ifKMQiiifzf8ITwtDAVO37eoTP
	 eqq9/RfxynEOJm6etf6Ac/hLPZyp8L/2Gf9M6j/rXMO0wpRdotPda9AKsht7s0y0JXi4PHDfzKUkJ3
	 J+IAmqOMuhi223dG6X7mclNdQl7glDxYUOeTkySNoOEStzVuEFrB0SZRKa2eWLZlAMczVKzmljrZY/
	 xnpZMWAMSbeMf93Ue2SlRdT78HkVZzukfx6SUWS1vuuuCpiXmsNlIjWbQm06jEaYtLDq2b7zkLpRIp
	 Vkl4TTMR6exPJYaOGtvUylRLijEWOwg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=ed2;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=q/nZhvXlU8iy1rU/VTinDRQeglQTVbyVMMhY6QqLe3w=;
	b=PBkLYDt3wsuzhvJAor2EC5QljEuibOrVpz/ODaDRnxnHQqdCZaRPaWrL9mY8mf50ym81YrAnaKOpZ
	 03c/vpyDg==
X-HalOne-Cookie: 8609112c4e15d67baf74b0f5ecc5e092276d339d
X-HalOne-ID: 6ad1ca74-f782-11ec-a6c5-d0431ea8a283
Received: from pbergin-7420.. (h-79-136-99-68.na.cust.bahnhof.se
 [79.136.99.68])
	by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 6ad1ca74-f782-11ec-a6c5-d0431ea8a283;
	Wed, 29 Jun 2022 08:06:48 +0000 (UTC)
From: Peter Bergin <peter@berginkonsult.se>
To: openembedded-core@lists.openembedded.org
Cc: Peter Bergin <peter@berginkonsult.se>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] rust: fix issue building cross-canadian tools for aarch64 on
 x86_64
Date: Wed, 29 Jun 2022 10:06:36 +0200
Message-Id: <20220629080636.12101-1-peter@berginkonsult.se>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jun 2022 08:06:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167368

Commit bd36593ba3db758b3eacc974e48468a665967961 did introduce a
regression when building package rust-cross-canadian-aarch64
on a x86_64 host. This commit will fix that configuration.

Suggested-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Bergin <peter@berginkonsult.se>
---
 meta/recipes-devtools/rust/rust-common.inc | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-devtools/rust/rust-common.inc
index 621cd4ad57..ef70c48d0f 100644
--- a/meta/recipes-devtools/rust/rust-common.inc
+++ b/meta/recipes-devtools/rust/rust-common.inc
@@ -309,10 +309,7 @@ def rust_gen_target(d, thing, wd, features, cpu, arch, abi=""):
 
     # build tspec
     tspec = {}
-    if bb.data.inherits_class('cross-canadian', d):
-        tspec['llvm-target'] = d.getVar('RUST_HOST_SYS', arch_abi)
-    else:
-        tspec['llvm-target'] = d.getVar('RUST_TARGET_SYS', arch_abi)
+    tspec['llvm-target'] = d.getVar('RUST_TARGET_SYS', arch_abi)
     tspec['data-layout'] = d.getVarFlag('DATA_LAYOUT', arch_abi)
     tspec['max-atomic-width'] = int(d.getVarFlag('MAX_ATOMIC_WIDTH', arch_abi))
     tspec['target-pointer-width'] = d.getVarFlag('TARGET_POINTER_WIDTH', arch_abi)
-- 
2.34.1


