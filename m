Return-Path: <nora.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C216C44529
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 14:09:02 +0000 (UTC)
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23752.1784642932511092305
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 07:08:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ew.tq-group.com header.s=default2602 header.b=i1sTbUmM;
 spf=pass (domain: ew.tq-group.com, ip: 188.40.3.216, mailfrom: nora.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=jFM/dktKQR311qKd32jI6YF+ff8zp4JgkWeLbtIOwhE=; b=i1sTbUmMcf1LGjM4kElOCtbcla
	ivXL5IbLUJxBH0mrSxLh90camzROea+/Omunhkt/Z5k7WDmjk9PzrxD9Y36U78Wqxpp/bn8sd8B2U
	v/QHDeYFu1riXfQ3KgU4+1HtV48/DbsiB0ZT7DGuB8JGXimDgpivZSNiUt8o4jnofbCoZxw1A5s9D
	v3FtK3VjAsgMBnNj709IwTDS2eoo1KLtNdC3u9wM22unxd747NTuFBUws1dEZjiBPJNjIT27jUfRH
	IPjHbyeMQggOOpMYU7v0Bx6b1vAg7RxZZJo4yRao2H4Erj2dphfn1iC2p4cfgZsuXgqWDQTdyNPV9
	mDVS8TNg==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wmB9O-000Hlm-0P;
	Tue, 21 Jul 2026 16:08:50 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wmB9N-000GRg-1R;
	Tue, 21 Jul 2026 16:08:49 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Cc: oss@ew.tq-group.com,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH v2 1/3] kernel-fit-image: make kernel entry point and load address optional
Date: Tue, 21 Jul 2026 16:08:06 +0200
Message-ID: <50f6548ace45b09d9aa5958b5868cf04e114b93a.1784642607.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784642607.git.nora.schiffer@ew.tq-group.com>
References: <cover.1784642607.git.nora.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28067/Tue Jul 21 08:23:56 2026)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 14:09:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241532

With image type kernel_noload, these are not used, and with [1] and
[2], U-Boot will not require them anymore for this image type. Allow
omitting them from image generation.

[1] https://git.u-boot-project.org/u-boot/u-boot/-/commit/c2abc606653e7eb1e8dbdbaaf1eac392689875ea
[2] https://git.u-boot-project.org/u-boot/u-boot/-/commit/c63051237f2bc79838a27473709948408acdf38b

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 meta/lib/oe/fitimage.py | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
index 79ac88966f..81d18f6c91 100644
--- a/meta/lib/oe/fitimage.py
+++ b/meta/lib/oe/fitimage.py
@@ -276,18 +276,22 @@ class ItsNodeRootKernel(ItsNode):
                 if len(parts) == 3 and parts[2] == entrysymbol:
                     entrypoint = "<0x%s>" % parts[0]
                     break
+        opt_props = {
+            "data": '/incbin/("' + kernel_path + '")',
+            "arch": self._arch,
+            "os": "linux",
+        }
+        if load:
+            opt_props["load"] = f"<{load}>"
+        if entrypoint:
+            opt_props["entry"] = f"<{entrypoint}>"
+
         kernel_node = self.its_add_node_image(
             kernel_id,
             "Linux kernel",
             mkimage_kernel_type,
             compression,
-            {
-                "data": '/incbin/("' + kernel_path + '")',
-                "arch": self._arch,
-                "os": "linux",
-                "load": f"<{load}>",
-                "entry": f"<{entrypoint}>"
-            }
+            opt_props,
         )
         self._kernel = kernel_node
 
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


