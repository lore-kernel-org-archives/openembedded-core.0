Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2451F6E7FD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 23:43:16 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id c13so4423283eek.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 15:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OlZq0rqnlvQXlUTmvtfbKVUantE+U8zQ2AEr6jlmcRk=;
	b=JkeuEIFeJFE+oUHm6pPC+nryaLnmUq6J5a0w2r9uLck5JDvaLWBAQ46e8T/XHpbJ4A
	BQxrYUtFmQVHDayPxWu7KYv/O+YcfWltenLmHI9cEMk6bbUZzgfTe/bkX8IzwIL74xGm
	ip5Ca4lvEUyBdcAw8DVfPTlDmsCiVh0u2QsTrLlk/1XQq6r0GBDTyTYkE3nIekPDBIc3
	3NLDQPgHHUAPj2ZpydC3ooK0CFpHGx/zUNVSCgCcrYZHO5Dm0+bYNE2hoMdRw7ZWBc6U
	/smhTIO9aq8QyEc0N8PWiqcGHxWBU/FfjBc1ZKv+A2rtyA25Wjcpj8ojKgl7VIHH8qzB
	QGgg==
X-Received: by 10.14.39.3 with SMTP id c3mr26761545eeb.4.1390347797497;
	Tue, 21 Jan 2014 15:43:17 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	z49sm20233970eeo.10.2014.01.21.15.43.16 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Jan 2014 15:43:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2014 00:43:12 +0100
Message-Id: <1390347792-24649-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <1390347792-24649-1-git-send-email-Martin.Jansa@gmail.com>
References: <1390347792-24649-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] feature-arm-thumb: Fix missing t2 suffix for armv7a MACHINEs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Jan 2014 23:43:18 -0000

* unfortunatelly that note about armv7 matching also armv7a is no
  longer valid since armv7 include in armv7 was replaced with
  armv6+neon in this commit:

  commit 75b8adbc042e0f65fb1286bc550d02becd3b6aea
  Author: Khem Raj <raj.khem@gmail.com>
  Date:   Tue Mar 27 18:37:45 2012 -0700

    tune/armv7: Delete

  since then thumb and arm feeds had the same architecture
* be aware that this will rename lots of feeds

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/feature-arm-thumb.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
index bd754be..fa3a4e5 100644
--- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
@@ -9,11 +9,10 @@ ARM_THUMB_M_OPT = "${@['-marm', '-mthumb'][d.getVar('ARM_INSTRUCTION_SET', True)
 TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "thumb", " ${ARM_THUMB_M_OPT}", "", d)}"
 OVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "thumb", ":thumb", "", d)}"
 
-# Note armv7 will hit on armv7a as well
 ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv4", "thumb" ], "t", "", d)}"
 ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv5", "thumb" ], "t", "", d)}"
 ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv6", "thumb" ], "t", "", d)}"
-ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv7", "thumb" ], "t2", "", d)}"
+ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv7a", "thumb" ], "t2", "", d)}"
 
 # Whether to compile with code to allow interworking between the two
 # instruction sets. This allows thumb code to be executed on a primarily
-- 
1.8.5.3


