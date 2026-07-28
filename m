Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9445BC53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 12:31:29 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10347.1785241879348293336
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 05:31:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=DgurWVqf;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4148; q=dns/txt;
  s=iport01; t=1785241883; x=1786451483;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K6x+W8g5RzcJlp/E8VR6Gbqx6+QmMv08jAHAh2Of+QA=;
  b=DgurWVqfgpIUwsrd8Hz5Zt+behdlvraFnD7d2O3D0c32lbzqLmujn91x
   6Ry4hRMaBJPepdyoyoIakvFMJHHDrf9Lftz/oOn+k6FP+BGL5gaqvZL+P
   gcejTD1xHzPvF2QuNgp+QgUBlGQLMkouBXfK5p8FypM5WNqHZKpPsXJN1
   XGUFT3Ndy+PNViZHeL3kL8d/Iokfw/tpKrvmPtOLa1yWQTDNEhYgDpCz+
   X9DjMzyD4sRj2o6F96UDC3KHR8e4bCPwQp3dmNJUGJtFt+v5RpAws9b23
   w0ZrItSmJUGH9t1SHKERQ+vk6V1CbcyRES2oCCT2ONaxH5ElckMw4ZkIc
   Q==;
X-CSE-ConnectionGUID: EVzZ6G8oTYGNLiYnaiAWew==
X-CSE-MsgGUID: UfhbA9TSQA2aDDb7rQQC/g==
X-IPAS-Result: =?us-ascii?q?A0BJAgAHoGhq/4sQJK1aglmCV3RfQkmEV5FzA4oQlAuBf?=
 =?us-ascii?q?g8BAQEPRA0EAQGFBQKNYwImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDYZaAQIBAyMPAUYQHAMBAgMCJgICKyMIEAmDAgGCdAIBEcFie?=
 =?us-ascii?q?oEygQGDaAJDUNsuAQsUAQWBBS6FP4MdAYUCXBgBhHoCJxsbgXKBFYNpgQWBU?=
 =?us-ascii?q?QsBAxiBDYQUgmoEgiKBDIFaHlBmjxRIgQIcA1ksAVUTDQoLBwWBZgM1EioVb?=
 =?us-ascii?q?jIdgSM+FzRYGwcFgR2BLGGEWCMZOX+BMXVKdy1pARIXgRqDPAKCFQMLGA1IE?=
 =?us-ascii?q?Sw3FBkEPQFuB411IoI9gQ4BKgGBRZN4kmWJC5gECiiDdYwhlToaM4VbpRELm?=
 =?us-ascii?q?H2OCpVoaIRpgWg8gUcLB3AVgyIJShkPjjiFaoMUyUIkNQIBAQczAQcCBwIMA?=
 =?us-ascii?q?4FzkACBfgEB?=
IronPort-Data: A9a23:1UlNOKIeVSfUf1LSFE+RhpQlxSXFcZb7ZxGr2PjKsXjdYENS1zIGx
 mUXW2mHa/uMazH8fY13Yd6yp0oE75DXy9YxTgQd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9hGQkajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1DMlMEY6JI/dpGLkdq9
 M0eITEkUR2c0rfeLLKTEoGAh+wqKM3teYdasXZ6wHSBV7AtQIvIROPB4towMDUY358VW62AI
 ZNHL2M0PXwsYDUXUrsTIJIinO6rj2PXeDxDo1XTrq0yi4TW5FMhgem1boOOI7RmQ+1okEaSj
 zP6xF3QWBg2GNbA0wO82TWj07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcYX9wVF6gx7xuAj/KOpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:C1GfRaFFsUqq+xu8pLqENseALOsnbusQ8zAXPo5KJiC9Ffbo8f
 xG/c5rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1NWZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWIeeAdGSS9fyKgzWQIpIH3MSN9ryuiKP1yndgShwvVoRbhj0Jcjpy1iZNNXN77V1TLu
 vm2vZ6
X-Talos-CUID: 9a23:ZGOJzGEdvfGoFli7qmJKylwmRO91dUHs41H0In6+AGdAd7CKHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AkxKQQQ10RoFF2N29AbUKnxTdBDUj3qquAmlcra4?=
 =?us-ascii?q?/kpONGQB6ZC2ktR/wTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,190,1779148800"; 
   d="scan'208";a="789906131"
Received: from alln-l-core-02.cisco.com ([173.36.16.139])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Jul 2026 12:31:21 +0000
Received: from sjc-ads-8351.cisco.com (sjc-ads-8351.cisco.com [171.68.209.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-02.cisco.com (Postfix) with ESMTPS id 543891800016F;
	Tue, 28 Jul 2026 12:31:21 +0000 (GMT)
Received: by sjc-ads-8351.cisco.com (Postfix, from userid 1887505)
	id EF389CC12A6; Tue, 28 Jul 2026 05:31:20 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][PATCH 2/2] patch: Fix CVE-2026-56288
Date: Tue, 28 Jul 2026 05:31:04 -0700
Message-ID: <20260728123113.3485106-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260728123113.3485106-1-hthakar@cisco.com>
References: <20260728123113.3485106-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-8351.cisco.com [171.68.209.139];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.209.139, sjc-ads-8351.cisco.com
X-Outbound-Node: alln-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 12:31:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242190

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix referenced by NVD in [2], using
the commit shown in [1].

[1] https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=e6d6a4e021660679d7fc9150f981d4920f722313
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56288

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 meta/recipes-devtools/patch/patch.inc         |  4 +-
 .../patch/patch/CVE-2026-56288.patch          | 75 +++++++++++++++++++
 2 files changed, 78 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/patch/patch/CVE-2026-56288.patch

diff --git a/meta/recipes-devtools/patch/patch.inc b/meta/recipes-devtools/patch/patch.inc
index 738bec038d..ecbb070ec4 100644
--- a/meta/recipes-devtools/patch/patch.inc
+++ b/meta/recipes-devtools/patch/patch.inc
@@ -6,7 +6,9 @@ SECTION = "utils"
 HOMEPAGE = "http://savannah.gnu.org/projects/patch/"
 
 SRC_URI = "${GNU_MIRROR}/patch/patch-${PV}.tar.gz \
-	   file://CVE-2026-56289.patch"
+ 	   file://CVE-2026-56289.patch \
+ 	   file://CVE-2026-56288.patch \
+   	   "
 
 S = "${UNPACKDIR}/patch-${PV}"
 
diff --git a/meta/recipes-devtools/patch/patch/CVE-2026-56288.patch b/meta/recipes-devtools/patch/patch/CVE-2026-56288.patch
new file mode 100644
index 0000000000..7219f5a3c7
--- /dev/null
+++ b/meta/recipes-devtools/patch/patch/CVE-2026-56288.patch
@@ -0,0 +1,75 @@
+From 101a805510356092a6d2a864bb18d440fec57f0a Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Tue, 21 Apr 2026 10:05:02 -0700
+Subject: [PATCH] Avoid null pointer derefence with bad hunks
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Problem reported by Michał Majchrowicz.
+* src/pch.c (another_hunk): Keep chars_read positive
+even with malformed hunks.
+
+CVE: CVE-2026-56288
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=e6d6a4e021660679d7fc9150f981d4920f722313]
+
+(cherry picked from commit e6d6a4e021660679d7fc9150f981d4920f722313)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/pch.c | 15 ++++++++++-----
+ 1 file changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/src/pch.c b/src/pch.c
+index d9f5c61..41150fe 100644
+--- a/src/pch.c
++++ b/src/pch.c
+@@ -1694,7 +1694,8 @@ another_hunk (enum diff difftype, bool rev)
+ 		    p_end = filldst-1;
+ 		    malformed ();
+ 		}
+-		chars_read -= fillsrc == p_ptrn_lines && incomplete_line ();
++		chars_read -= (1 < chars_read && fillsrc == p_ptrn_lines
++			       && incomplete_line ());
+ 		p_Char[fillsrc] = ch;
+ 		p_line[fillsrc] = s;
+ 		p_len[fillsrc++] = chars_read;
+@@ -1711,7 +1712,8 @@ another_hunk (enum diff difftype, bool rev)
+ 		    malformed ();
+ 		}
+ 		context++;
+-		chars_read -= fillsrc == p_ptrn_lines && incomplete_line ();
++		chars_read -= (1 < chars_read && fillsrc == p_ptrn_lines
++			       && incomplete_line ());
+ 		p_Char[fillsrc] = ch;
+ 		p_line[fillsrc] = s;
+ 		p_len[fillsrc++] = chars_read;
+@@ -1725,7 +1727,8 @@ another_hunk (enum diff difftype, bool rev)
+ 		    p_end = fillsrc-1;
+ 		    malformed ();
+ 		}
+-		chars_read -= filldst == p_end && incomplete_line ();
++		chars_read -= (1 < chars_read && filldst == p_end
++			       && incomplete_line ());
+ 		p_Char[filldst] = ch;
+ 		p_line[filldst] = s;
+ 		p_len[filldst++] = chars_read;
+@@ -1808,7 +1811,8 @@ another_hunk (enum diff difftype, bool rev)
+ 	      fatal (("'<' followed by space or tab expected"
+ 		      " at line %td of patch"),
+ 		     p_input_line);
+-	    chars_read -= 2 + (i == p_ptrn_lines && incomplete_line ());
++	    chars_read -= 2 + (3 < chars_read && i == p_ptrn_lines
++			       && incomplete_line ());
+ 	    p_len[i] = chars_read;
+ 	    p_line[i] = savebuf (patchbuf + 2, chars_read);
+ 	    p_Char[i] = '-';
+@@ -1833,7 +1837,8 @@ another_hunk (enum diff difftype, bool rev)
+ 	      fatal (("'>' followed by space or tab expected"
+ 		      " at line %td of patch"),
+ 		     p_input_line);
+-	    chars_read -= 2 + (i == p_end && incomplete_line ());
++	    chars_read -= 2 + (3 < chars_read && i == p_end
++			       && incomplete_line ());
+ 	    p_len[i] = chars_read;
+ 	    p_line[i] = savebuf (patchbuf + 2, chars_read);
+ 	    p_Char[i] = '+';
-- 
2.51.0


