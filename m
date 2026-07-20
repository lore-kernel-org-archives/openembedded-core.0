Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56CCBC44530
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:57:09 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3616.1784570226559015720
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:57:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=EldXLSwl;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3124; q=dns/txt;
  s=iport01; t=1784570226; x=1785779826;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2+O6FIpodsKcUy1aZrB5prTR27v54ZYSm2MhXZzs33M=;
  b=EldXLSwleeVRTYNdKTl1/EIRiKSIaSd2xrH3vz+VLHzKY9jR4uMER//2
   yf0k/NosLVI8b8Zvr6Hk1J1l9tuNCDIy1MyVuQW1p6TJsUXi7dqvFHbn2
   qFg/HH6ITBl6d3KAaGNcR0DFBoGRpkrGdQQd6Soyb7166StHyOaE0eZHf
   cD5pgdgDWjxQ6WHDeTSQesAzgi+FoRBNXOKg0GgZnjOLRLZmHb0y1FNZm
   fa5L5GScBtq0p3zbbLXkRDxF1faHMOfLyZwNuUTZ0S296qMFBl5OLfFIo
   95i1925Q3UGVue5BEGqx+JbApGxLKuO79AdOQsF0ST+yFEZi9SGnv3zxt
   g==;
X-CSE-ConnectionGUID: NwljhpAfTr69o9MhJsVYgA==
X-CSE-MsgGUID: lGNumj9ASNK9NhNn9d0A5Q==
X-IPAS-Result: =?us-ascii?q?A0BIAgCzYF5q/5H/Ja1aglmCV3RfQkmWSgOeG4F+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYQ/RgKNUwImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZaAQIBAzIBGAEbEhAcAwECLysjCBmDAgGCdAIBEbsrGjeCLIEBg?=
 =?us-ascii?q?ygBPwJDUNsuAQsUAQWBM4U/iCBcGAGEfCcbG4FygRWDaYEFgVwCAgEXgS6GX?=
 =?us-ascii?q?QSCInoSgVoeUI8kSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFg?=
 =?us-ascii?q?R2BOoEChHQjHwM5f4EvdUp3LWkBEheBJoISAoE7Ag4DCxgNSBEsNxQZBD5uB?=
 =?us-ascii?q?41AI4I/AYEOARMYgiyTEZJloQ8KKIN1jCGVOhozqmwLmH2OCpZQhGmBaDyBW?=
 =?us-ascii?q?XAVgyIJShkPjjiDa4UTyUckNQsyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:DY+3jKrFhxrXLY9bZ0FXH3h5kBleBmJJZBIvgKrLsJaIsI4StFCzt
 garIBmOPffYM2T1f9sjbo3noBlT6JXUx9VlTgNvqys2EHxE8ePIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrc8ks34pwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0sBoBWNO7
 dUWFCpTPxfSouKU24yKRcA506zPLOGzVG8ekmtrwTecCbMtRorOBv2ao9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LVfrSn8/w7pX7WzFVtluTvqovy2PS1wd2lrPqNbI5f/TXHJ8LxRnF+
 z6uE2LRBj48KdmdmBO+1FH9oO/pm3L3AKtPLejtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZOJottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvoUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:ot/WfKGthVp/u7dKpLqEMMeALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1/J
 0QFZSWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaEp2JK2xCe32m+oocfng/OaYE
X-Talos-CUID: 9a23:k393fW5ky1ZSAN6ggNss0lEQGMA9W3Ph1imBJB6dCURydoyaYArF
X-Talos-MUID: 9a23:0E84nQk+wpXyFQ7Bm4BGdnpmG+F15qb/IXsrssQgu++CZCAoEmqk2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,175,1779148800"; 
   d="scan'208";a="512637554"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 17:57:05 +0000
Received: from sjc-ads-20746.cisco.com (sjc-ads-20746.cisco.com [171.70.189.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 78747180001D4;
	Mon, 20 Jul 2026 17:57:05 +0000 (GMT)
Received: by sjc-ads-20746.cisco.com (Postfix, from userid 1887503)
	id 0FEC7CEC316; Mon, 20 Jul 2026 10:57:05 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Devansh Patel <devanshp@cisco.com>
Subject: [OE-core][wrynose][PATCH 5/8] openssh: Fix CVE-2026-59995
Date: Mon, 20 Jul 2026 10:55:15 -0700
Message-Id: <20260720175518.3546447-5-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260720175518.3546447-1-devanshp@cisco.com>
References: <20260720175518.3546447-1-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-20746.cisco.com [171.70.189.245];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 171.70.189.245, sjc-ads-20746.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:57:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241471

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream OpenSSH 10.4p1 backport for
CVE-2026-59995. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/openssh/openssh-portable/commit/1b39f39657d2e58f8ec57341581a39bbf0be645b
[2] https://www.cve.org/CVERecord?id=CVE-2026-59995

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../openssh/openssh/CVE-2026-59995.patch      | 44 +++++++++++++++++++
 .../openssh/openssh_10.3p1.bb                 |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-59995.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-59995.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59995.patch
new file mode 100644
index 0000000000..ac1712eec2
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59995.patch
@@ -0,0 +1,44 @@
+From 02e4b3cfd0bef64381921cdb9d6a21b1f50fdb74 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Mon, 29 Jun 2026 01:47:21 +0000
+Subject: [PATCH] upstream: avoid download to server-controlled path when
+ performing
+
+download on the commandline. From Swival scanner
+
+OpenBSD-Commit-ID: d1b2c44305fdfe6d51eed9ecc727e59478bf311f
+
+CVE: CVE-2026-59995
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/1b39f39657d2e58f8ec57341581a39bbf0be645b]
+
+Backport Changes:
+- Omitted the upstream OpenBSD revision-only hunk in sftp.c and retained
+  the Wrynose OpenSSH 10.3p1 revision because this stable backport carries
+  only the functional security change.
+
+(cherry picked from commit 1b39f39657d2e58f8ec57341581a39bbf0be645b)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ sftp.c | 9 ++-------
+ 1 file changed, 2 insertions(+), 7 deletions(-)
+
+diff --git a/sftp.c b/sftp.c
+index eebb166e8..33c8364e3 100644
+--- a/sftp.c
++++ b/sftp.c
+@@ -2287,13 +2287,8 @@ interactive_loop(struct sftp_conn *conn, char *file1, char *file2)
+ 				return (-1);
+ 			}
+ 		} else {
+-			/* XXX this is wrong wrt quoting */
+-			snprintf(cmd, sizeof cmd, "get%s %s%s%s",
+-			    global_aflag ? " -a" : "", dir,
+-			    file2 == NULL ? "" : " ",
+-			    file2 == NULL ? "" : file2);
+-			err = parse_dispatch_command(conn, cmd,
+-			    &remote_path, startdir, 1, 0);
++			err = process_get(conn, dir, file2, remote_path, 0, 0,
++			    global_aflag, 0);
+ 			free(dir);
+ 			free(startdir);
+ 			free(remote_path);
diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index 807e718ffb..4aa81214e0 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -28,6 +28,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://CVE-2026-59997.patch \
            file://CVE-2026-59998.patch \
            file://CVE-2026-59996.patch \
+           file://CVE-2026-59995.patch \
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 
-- 
2.35.6


