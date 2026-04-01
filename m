Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D133D3516D
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 10:04:19 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9540.1775037853877250955
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 03:04:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=gdGqFZVN;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2402; q=dns/txt;
  s=iport01; t=1775037853; x=1776247453;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=M1BVO84MA3Hve7OPRU+ATsxUPH2z7p1hGl6MM8hsXpM=;
  b=gdGqFZVNeudfowSzBnnjZmrRu9pmlK5W97EJiCnCK/BayBKrFezOF+He
   rhw4lNulhFXBq9Z2S8A75SFnpZDiRiAHUVW6mX+P72AXwD01MyWh5+582
   QvBTTNkRv7L+KTpba07KAV5fv+LKDrFJ6IoXYOKO0iNypIEmcvZWlcyvG
   bJBih871QCCwesLLLHGyqJM6tj0yxMzB2Nt/1S2APZZDXIwQtIFmXocjD
   Mk4y+o0I7pup0WgaP7gpiSTGFOPtNCyxxWcRW3Lo28xODtOQOu+cu7cJH
   F8QqTZ3jJxaXdAb9vuuEpEIG7InL8aSY1Nj0zcMPYOGEACDdvSd1GcbtJ
   w==;
X-CSE-ConnectionGUID: jQe2ZOTnTc6k6z/26Jbq3g==
X-CSE-MsgGUID: U4TV+LHCTzeU6hb6ZO1cBw==
X-IPAS-Result: =?us-ascii?q?A0AmCQBr7Mxp/5H/Ja1agjQQGoJED3FfQkmUKoIki2SSN?=
 =?us-ascii?q?oF/DwEBAQ9EDQQBAYUHAo0lAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQEBC?=
 =?us-ascii?q?gEBBQEBAQIBBwWBDhOGTw2GWgECAQMnCwFWHAMBAi8gCyMIGYMCAYI6AzYCA?=
 =?us-ascii?q?RGzfoF5M4EBg2gCQ0+yKQ2CUgEFBhQBgTiFPoJ5hSNbGAGEeicbG4FygRWBO?=
 =?us-ascii?q?4ItgQWBGkIBAxiCE4V3BIIigQ6BYY8LSIEeA1ksAVUTDQoLBwWBZgM1EioVb?=
 =?us-ascii?q?jIdgSM+F4EMGwcFgUuHXHRtgRODfkUDCxgNSBEsNxQbBD5uB4trKYI1gQ4sq?=
 =?us-ascii?q?CCgHXEKKIN0jB6PPoV8GjOqawuYe44JhAmSR4RogWg8gUcLB3AVgyJSGQ+OO?=
 =?us-ascii?q?IVogxTBLSM1AgkzAQcCBw4CgXORfQEB?=
IronPort-Data: A9a23:3aJO/K915jOJZx42aPiaDrUDxH+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 jcYXjvXPqvcYjPzLYtxYIy/9UMG7ZXVmIU1TAM5pC9EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/raea7xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mpyyHjEAX9gWAsbjpNs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dgJtb
 7+epF0R1jqxEyYFUrtJoJ6iGqE5auK60Ty1t5Zjc/PKbi6uCcAF+v1T2PI0MS+7gtgS9jx74
 I0lWZeYEW/FMkBQ8QgQe0EwLs1wAUFJ0L3+LCKNlvCV80aYcCX+hK8wLksvZoJNr46bAUkWn
 RAZACoGYhbGg6e9x6i2D7E8wM8iN8LseogYvxmMzxmAUq1gGs+FGfiXo4YEgV/chegWdRraT
 8YUZCBmcBTHSxZOIVwQTpk5mY9Eg1GgKWcJ8Q3M/vBfD2778VBN7vvJEPHpaNG3G8VfwHS//
 2ns4DGsav0dHJnFodafyVqrnuLJkCbxVY4eGbH9/flwjXWXx3cPE1sRTVa9rPyzh0KyVt4ZL
 FYbkhfCtoAo/0CtC924VBqirTvc7lgXWsFbFKsx7wTlJrfo3jt1z1MsFlZpAOHKfudtLdD2/
 jdlR+/UOAE=
IronPort-HdrOrdr: A9a23:YCjTKqukBMHKXC9/VmgThyc+7skDd9V00zEX/kB9WHVpm6uj5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5SXzLbLfD5HZQGQ2njeL+od
X-Talos-CUID: =?us-ascii?q?9a23=3Au7zaX2iM1IffeEf3bBSCskx6GDJucETQlkX3H0m?=
 =?us-ascii?q?EAjhqFq/SEwGy8ro/nJ87?=
X-Talos-MUID: 9a23:S7/RvwpQDCJ499pr5y4ezww+CPkrx4SFNFIArMsGsZe2EnV7ESjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,153,1770595200"; 
   d="scan'208";a="722917132"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 01 Apr 2026 10:04:13 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id F28D2180001C0
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Apr 2026 10:04:12 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id A07C0CC12B5; Wed,  1 Apr 2026 03:04:12 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter][PATCH v3 4/4] binutils: Fix CVE-2025-69652
Date: Wed,  1 Apr 2026 03:04:07 -0700
Message-Id: <20260401100407.1177079-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260317041229.2932275-1-deeratho@cisco.com>
References: <20260317041229.2932275-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 10:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234338

From: Deepak Rathore <deeratho@cisco.com>

Pick the patch [1] as mentioned in [2].

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=44b79abd0fa12e7947252eb4c6e5d16ed6033e01
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-69652

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index 2f34037eed..3dc73c3ad0 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -49,4 +49,5 @@ SRC_URI = "\
      file://CVE-2025-69648.patch \
      file://CVE-2025-69644_CVE-2025-69647.patch \
      file://CVE-2025-69649.patch \
+     file://CVE-2025-69652.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69652.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-69652.patch
new file mode 100644
index 0000000000..5de94820d1
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69652.patch
@@ -0,0 +1,40 @@
+From 5a2f57ab03067f6622c19983e1e31207bd2293a6 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 8 Dec 2025 16:04:44 +1030
+Subject: [PATCH] PR 33701, abort in byte_get_little_endian
+
+	PR 33701
+	* dwarf.c (process_debug_info): Set debug_info_p NULL when
+	DEBUG_INFO_UNAVAILABLE.
+
+CVE: CVE-2025-69652
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=44b79abd0fa12e7947252eb4c6e5d16ed6033e01]
+
+(cherry picked from commit 44b79abd0fa12e7947252eb4c6e5d16ed6033e01)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ binutils/dwarf.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c
+index 2462e6540a7..0d88ea94619 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -4248,9 +4248,11 @@ process_debug_info (struct dwarf_section * section,
+ 	      break;
+ 	    }
+ 
+-	  debug_info *debug_info_p = ((debug_information
+-				       && unit < alloc_num_debug_info_entries)
+-				      ? debug_information + unit : NULL);
++	  debug_info *debug_info_p = NULL;
++	  if (debug_information
++	      && num_debug_info_entries != DEBUG_INFO_UNAVAILABLE
++	      && unit < alloc_num_debug_info_entries)
++	    debug_info_p = debug_information + unit;
+ 
+ 	  assert (!debug_info_p
+ 		  || (debug_info_p->num_loc_offsets
+-- 
+2.35.6
+
-- 
2.35.6


