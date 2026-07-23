Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F9CC531CD
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 08:49:19 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19173.1784796555935065538
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 01:49:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=TjdcN0Md;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4145; q=dns/txt;
  s=iport01; t=1784796555; x=1786006155;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lMRg+ZISRgiYL6mJ/L+GBND8Oezlq6CF4iYA7RQfJwA=;
  b=TjdcN0MdG1X49ffmcX8YWPyoHxxffB1pvnRw3HMa/R9lpG4sv8z08VBm
   PXNworbkeBS+bVumXEPnpPXlJHrPQiG8sFYoahMLSA64V+Xv25dZZUO3l
   OkOjNYEFjGhzIh4Adj45U/eYezNpoMHLm7XhREU45Po4ScVbxjUnw4bFy
   DkxiimwFCnJho0OM4030IMv8FJdHVu1ZUTH6ZNq0Q6jUBA0wknyTVEvaB
   VVcfz1KlAV9psSU2HSei4UxhW9ncMn/ntaJLQXu+Ddfr7pydgfvxaKnFq
   ZhDvONbLxUGAstEIBlXvD4TpWvhUijbGjhQQ/JPTX0RGpF81+hgdN2llW
   g==;
X-CSE-ConnectionGUID: JHL2/DNhTPKUmXScTrkItg==
X-CSE-MsgGUID: RFpv4YH4QEGwjkQYEgKF6w==
X-IPAS-Result: =?us-ascii?q?A0BJAgCL1GFq/5H/Ja1aglmCV3ReQ0mEV5FzA4oQlAuBf?=
 =?us-ascii?q?g8BAQEPRA0EAQGFBQKNWgImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDYZaAQIBAyMPAUYQHAMBAgMCJgICKyMIEAmDAgGCdAMRwUR6g?=
 =?us-ascii?q?TKBAYNoAkNQ2y4BCxQBBYEFLoU/gx0BhQJcGAGEegInGxuBcoEVg2mBBYFRC?=
 =?us-ascii?q?wEDGIENhBSCagSCIoEMgVoeUIEAjmZIgQIcA1ksAVUTDQoLBwWBZgM1EioVb?=
 =?us-ascii?q?jIdgSM+FzRYGwcFgR2BLoEChFwjHwM5f4EwdUp3LWkBEheBJoIUgToCgR0DC?=
 =?us-ascii?q?xgNSBEsNxQZBD0BbgeNcCOCO4EOASoBgUWTeJJliQuYBAoog3WMIZU6GjOFW?=
 =?us-ascii?q?6URC5h9jgqVaGiEaYFoPIFHCwdwFYMiCUoZD444hWqDFMkBJzICAQEHMgEBB?=
 =?us-ascii?q?wIHAgwDC4FokACBfgEB?=
IronPort-Data: A9a23:n5dyyaCrAp/XaRVW/3/iw5YqxClBgxIJ4kV8jS/XYbTApG8ghTIGx
 mEdDT3TOvzYMWLwc9B1PYXn8BsE7ZfRytBkOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYAD/gGYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE4dVKVgYaG40kwsVKBFF1/
 sACKxERYUXW7w626OrTpuhEnM8vKozveYgYoHwllWGfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGYyBPjDS0Un1lM/CI4+leShnFH0ciZTrxSeoq9fD237kVUqgOmxbYqKEjCMbf97hljEl
 0KaxknWHRMZDe2yxhmrrG3504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWspBUQXZ9UVuY98gzIkvqS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6dV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:0W6lra0BgRIU99x3PYL22wqjBGwkLtp133Aq2lEZdPWaSKOlfq
 eV7ZImPH7P+VEssR4b+OxoVJPsfZqYz+8W3WBzB8bHYOCZgguVxehZhOOIqQEIWReOk9K1vp
 0PT0ERMrHN5HFB/L/HCXGDYrUd6ejC1ry0juHDyHooZwRrZ6Z8qzpdMG+gYzVLrM0sP+tCKH
 JajfA33AadRQ==
X-Talos-CUID: 9a23:DdKFIm8rhe7eKE8kLJeVv2w0PppiXlvd8E/zHkqIMm1VUr60VVDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3A+7sDBg6OunNoxIPLiN+XRRZvxoxSzbywVHEtzaw?=
 =?us-ascii?q?rlNaGNhVBFji+omqoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,180,1779148800"; 
   d="scan'208";a="513894587"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Jul 2026 08:49:14 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id BD31618000593;
	Thu, 23 Jul 2026 08:49:14 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 64BDECD144F; Thu, 23 Jul 2026 01:49:14 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH 2/2] patch: Fix CVE-2026-56288
Date: Thu, 23 Jul 2026 01:49:14 -0700
Message-Id: <20260723084914.2718150-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260723084914.2718150-1-hthakar@cisco.com>
References: <20260723084914.2718150-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 08:49:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241799

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
index 738bec038d..a9675d53b4 100644
--- a/meta/recipes-devtools/patch/patch.inc
+++ b/meta/recipes-devtools/patch/patch.inc
@@ -6,7 +6,9 @@ SECTION = "utils"
 HOMEPAGE = "http://savannah.gnu.org/projects/patch/"
 
 SRC_URI = "${GNU_MIRROR}/patch/patch-${PV}.tar.gz \
-	   file://CVE-2026-56289.patch"
+	   file://CVE-2026-56289.patch \
+	   file://CVE-2026-56288.patch"
+
 
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
2.35.6


