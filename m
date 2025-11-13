Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE78BCD6E45
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 12:28:37 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22635.1763036913409039357
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 04:28:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=hBxWcYBQ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20251113122831dafa08459000020740-rjjaoa@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20251113122831dafa08459000020740
        for <openembedded-core@lists.openembedded.org>;
        Thu, 13 Nov 2025 13:28:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=VMtJ3Aun6qNvjNjz14YZgr7VmVGmkaHa6QsXFSoKmoQ=;
 b=hBxWcYBQvdEHBgknbIn0ZQPFvcFmuuZ6NGg72i4hgk9up/QC3fcT+n5oRNd2LO5taZn3/U
 iSPmOFqYVnuXl08D7NQ7d4XOs9Ko7+r+QJmJS5M/3mEdH1swm9WEzVVnbwXEiHr2X6gk02aX
 EsDZHa2I8U55KoA6P7wxBxTZKeTRm6kqJBI1VqR1Rv9idU927Xh92uopw2qwj/h8Oz+SLSxU
 ASzRQBPvnGsU6zDRAE/gC933DqHQ63TMDcrUTk/cDj5BLT4rjS4u7MzX7Anl6+xBSZV/mWB3
 rtPH86GJd/I5CjVE3BPUa2GHeaVSR+BNJEOyHBlH0eB2kmT9KJQpZkMg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 3/9] lib/oe/go: document map_arch, and raise an error on unknown architecture
Date: Thu, 13 Nov 2025 13:28:00 +0100
Message-Id: <20251113122806.16769-4-peter.marko@siemens.com>
In-Reply-To: <20251113122806.16769-1-peter.marko@siemens.com>
References: <20251113122806.16769-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 12:28:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226241

From: Ross Burton <ross.burton@arm.com>

Add a comment explaining what this function does and where the values
come from.

If the architecture isn't know, instead of returning an empty string
which could fail mysteriously, raise a KeyError so it fails quickly.

(From OE-Core rev: 025414c16319b068df1cd757ad9a3c987a6b871d)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/lib/oe/go.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/go.py b/meta/lib/oe/go.py
index dfd957d157a..4559dc63b28 100644
--- a/meta/lib/oe/go.py
+++ b/meta/lib/oe/go.py
@@ -7,6 +7,10 @@
 import re
 
 def map_arch(a):
+    """
+    Map our architecture names to Go's GOARCH names.
+    See https://github.com/golang/go/blob/master/src/internal/syslist/syslist.go for the complete list.
+    """
     if re.match('i.86', a):
         return '386'
     elif a == 'x86_64':
@@ -31,4 +35,4 @@ def map_arch(a):
         return 'riscv64'
     elif a == 'loongarch64':
         return 'loong64'
-    return ''
+    raise KeyError(f"Cannot map architecture {a}")

