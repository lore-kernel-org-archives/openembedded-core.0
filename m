Return-Path: <nora.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31281C44533
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 14:09:02 +0000 (UTC)
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23750.1784642932475978911
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 07:08:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ew.tq-group.com header.s=default2602 header.b=VkisCbjF;
 spf=pass (domain: ew.tq-group.com, ip: 188.40.3.216, mailfrom: nora.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=DgDyAVzKJ0eWze+UdunnnvXsduUuBwYI877E9br7/Vk=; b=VkisCbjFptjjUzx0Kz3uti7Q9P
	izcvl2NlUROrkdsGaRzMHZg9eqlLX5MLKeqWer31wXlQyP0VDCL3D2/3uETB6bo94QAN3Z9iETtg0
	Ww9Lxv/wDIk5cGnearEpt9G2z5FrrlRxSYYVgr+gvUvVPCNSaV+1X2TTdJ9AB8iETqURU5g77OlYH
	b/Z9/JI/U5TBLAvrvJlWt4q+jlPpDJOywCeI2r4pmi6E35mIFhBTO6+S4dn4AQ0LSpjTsQbfY4aQd
	orMLC4m5b5CDK4IHwY4k2y94fy+XWfRD37eSFFhNtbZhUjjI6XuYvnIA+XSuVjlA1Moh8GTEHnau6
	5xJ3Wqng==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wmB9O-000Hmi-1M;
	Tue, 21 Jul 2026 16:08:50 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wmB9N-000GRg-2N;
	Tue, 21 Jul 2026 16:08:50 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Cc: oss@ew.tq-group.com,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH v2 2/3] kernel-fit-image: avoid shadowing os stdlib import
Date: Tue, 21 Jul 2026 16:08:07 +0200
Message-ID: <c0c00a8027e843801d108b5a396774080cdd3c63.1784642607.git.nora.schiffer@ew.tq-group.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241533

Avoid using os as an argument name, as shadowing the import of the os
stdlib module may be confusing.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 meta/lib/oe/fitimage.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
index 81d18f6c91..9cde6cedc4 100644
--- a/meta/lib/oe/fitimage.py
+++ b/meta/lib/oe/fitimage.py
@@ -401,12 +401,12 @@ class ItsNodeRootKernel(ItsNode):
         )
         self._ramdisk = ramdisk_node
 
-    def fitimage_emit_section_loadable(self, name, filepath, type=None, description=None, compression=None, arch=None, os=None, load=None, entry=None):
+    def fitimage_emit_section_loadable(self, name, filepath, type=None, description=None, compression=None, arch=None, fit_os=None, load=None, entry=None):
         """Emit one fitImage ITS loadable section"""
         opt_props = {
             "data": '/incbin/("' + filepath + '")',
             "arch": arch if arch is not None else self._arch,
-            "os": os if os is not None else "linux",
+            "os": fit_os if fit_os is not None else "linux",
         }
 
         if load:
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


