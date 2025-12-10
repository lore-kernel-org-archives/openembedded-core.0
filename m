Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0E02D3E774
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 19:08:04 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4092.1765393673628172167
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 11:07:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=f68Wg4TE;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20251210190750b24cffcd9900020731-_3kuog@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20251210190750b24cffcd9900020731
        for <openembedded-core@lists.openembedded.org>;
        Wed, 10 Dec 2025 20:07:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ogC6xRAHQccbRX4poQWLhUZjjFjUCF+NYHnxAOuxdVk=;
 b=f68Wg4TEeaVo6bk9x+W9Bd6sl7VOyZW2oJQectBCuJ0jyuhOoRd6eD9W+vlekjrNEcwd7K
 TS0vsKTg6I8P7uhUist8ih0fYegnjzNvdd8nJGGBgG4rQK1rSiBtlZHJWIDf1xUNp8YF/TOM
 b7d9OOAwnzoI6EJ8XWstSmv11cY95nw/56jbTUrlgTvonpW/Ot/3VJ1YL1/c+ldPLF1dKS1t
 fTKwU+4ZihXUPtc2PwXxr4Ve5zsrbaGF9jLx44E1kqOZuaWKUH6tRzuelISKe6cfgxEUr74c
 SZiMkYp8UcoRyzD4bXx6eaTzHvbLdcTodLC9aFBs83nDd7i73DqdkhwQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] Revert "lib/oe/go: document map_arch, and raise an error on unknown architecture"
Date: Wed, 10 Dec 2025 20:07:46 +0100
Message-Id: <20251210190746.6670-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 19:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227505

From: Peter Marko <peter.marko@siemens.com>

This reverts commit e6de433ccb2784581d6c775cce97f414ef9334b1.

This introduced a breaking change which is not suitable for backport to
stable LTS branches.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/lib/oe/go.py | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/lib/oe/go.py b/meta/lib/oe/go.py
index 4559dc63b28..dfd957d157a 100644
--- a/meta/lib/oe/go.py
+++ b/meta/lib/oe/go.py
@@ -7,10 +7,6 @@
 import re
 
 def map_arch(a):
-    """
-    Map our architecture names to Go's GOARCH names.
-    See https://github.com/golang/go/blob/master/src/internal/syslist/syslist.go for the complete list.
-    """
     if re.match('i.86', a):
         return '386'
     elif a == 'x86_64':
@@ -35,4 +31,4 @@ def map_arch(a):
         return 'riscv64'
     elif a == 'loongarch64':
         return 'loong64'
-    raise KeyError(f"Cannot map architecture {a}")
+    return ''

