Return-Path: <nora.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B4EC43602
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 11:29:35 +0000 (UTC)
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.171245.1783423764438544167
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 04:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ew.tq-group.com header.s=default2602 header.b=iXcz9rnw;
 spf=pass (domain: ew.tq-group.com, ip: 188.40.3.216, mailfrom: nora.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=9xSZcwXNcbCDKNogDXqT0XnTylacMQEobXv5CI3a96I=; b=iXcz9rnwNdayV/5WW2SFhC1Uyp
	iQrVtBOKRk7CJNW06mULiwEtmdNhXBM+yvrFN6cOgkuBAe6yUSxDWYzw67dhHIJ0ygBlHKsqmplVj
	aOVGGS+8jyVrDtzNY/1Kj4ztURrg/qkGae4iKsbgOR9bORBmqclz4c/uqV+CGvN+bHUI42fhWCgfa
	BeMVCejgEPcu/uTzpO5loSHOS7BC8azhzIXpY5JY+Slas6vbpzU7JBkLpFh+j9Ht+dDW3SFhoCpI8
	VJpMRloJ4G1tfi4JaPcul+e7m8EUJ1/brO24AAiAr3vFZ0X5ekwOiTqJR3Q+F+B6n3/G6ManmRAxe
	uJA9eaFA==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wh3zN-000F5q-2O;
	Tue, 07 Jul 2026 13:29:21 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wh3zO-0000yf-1G;
	Tue, 07 Jul 2026 13:29:21 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Cc: oss@ew.tq-group.com,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH 1/2] kernel-fit-image: make kernel entry point and load address optional
Date: Tue,  7 Jul 2026 13:29:06 +0200
Message-ID: <3414943142b334cdc35b5f345c110418d2925d1b.1783422721.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783422721.git.nora.schiffer@ew.tq-group.com>
References: <cover.1783422721.git.nora.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28053/Tue Jul  7 08:24:37 2026)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 11:29:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240381

With image type kernel_noload, these are not used, and with [1] and
[2], U-Boot will not require them anymore for this image type. Allow
omitting them from image generation.

[1] https://source.denx.de/u-boot/u-boot/-/commit/c2abc606653e7eb1e8dbdbaaf1eac392689875ea
[2] https://source.denx.de/u-boot/u-boot/-/commit/c63051237f2bc79838a27473709948408acdf38b

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


