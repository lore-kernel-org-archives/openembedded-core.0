Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A51FC44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 18:58:12 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4977.1784573885168214092
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 11:58:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=bq9Lk5E+;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3061; q=dns/txt;
  s=iport01; t=1784573885; x=1785783485;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=afCZkoXkv3cv1cxNIfrc+ADjkH8bLpc6qA+LzNSlwO8=;
  b=bq9Lk5E+GxMWjp1UQkxx6SIShxqjppitiwqWQ0AcZBuEnglv+R45kkAH
   e2V3r8W0pT6MXOsoeQVX6jRyLg+fjytPbsMi4f9em1wYOT+M69PntVjfk
   2VXUnM5YfipOqh7+lvgYfkueBOFv+mk+SuPc7Hzsf4TUKRXP1xHH+/9Lm
   2LS4w0QEmKd5T7Sw1NuHTjT0sNY+BluDr8bZ7SP8uzcQmcukTs7hv5yOK
   f1vYw1dZtqzhk5G+ZXvLWRTJKfniduwv87j9QbYu8zM9yZsAubHhbrpgt
   M0ftxd0vGD83LYgERg/4QR5/gW5297rXCScQYwVepBeSmG10zaY4OCwFX
   Q==;
X-CSE-ConnectionGUID: qWp7seqkRIOAeissx/kl6w==
X-CSE-MsgGUID: Xsv2Wt30Tna0i9bz6cxaTA==
X-IPAS-Result: =?us-ascii?q?A0BHAgAQb15q/4v/Ja1aglmCV3ReQ0mWSgOeG4F+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYQ/RgKNVQImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZaAQIBAzIBGAEtEBwDAQIvKyMIGYMCAYJ0AxG7NBo3giyBAYMoA?=
 =?us-ascii?q?T8CQ1DbLgELFAEFgTOFP4ggXBgBhHwnGxuBcoEVg2mBBYFcAQEDgUWGXQSCI?=
 =?us-ascii?q?noSgVoeUI8pSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFgR2BO?=
 =?us-ascii?q?oEChHQjHwM5f4EvdUp3LWkBEheBJoISAoE7AhMDCxgNSBEsNxQZBD5uB41BI?=
 =?us-ascii?q?4JAgQ4BExcBlT2SZaEPCiiDdYwhlToaM6psC5h9jgqWUIRpgWg8gUcLB3AVg?=
 =?us-ascii?q?yIJShkPjjiDa4F/gxTJRycyCzIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:Llr+qKkFwtatbRqN+uAhu4Xo5gzRJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLWWyEOfreazOkLohzPI2w8BlU7ZXVyNM1TAA6qi0wRVtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpLsfrb9nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FZQn4rlsDHhNz
 90/AT0MdQuTwOGynq3uH4GAhux7RCXqFJkUtnclyXTSCuwrBMiZBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQUaz/7C7pm9AusrnXybTRes1KNjaE2+GPUigd21dABNfKII4bbGJ0JwhfwS
 mTuz3/nWC4Gb4SjzzPd8yOmlLHEjSrHcddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cFHhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/E9lte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:q4+hN6r0CChJbUUUvyeuPxEaV5rzeYIsimQD101hICG9vPb2qy
 nIpoV96faaslcssR0b9OxofZPwI080lqQFhbX5X43DYOCOggLBR+tfBMnZsljd8kbFmNK1u5
 0NT0FWMqyXMbEDt7eY3CCIV/A93dKA7Kekwc3az3trUEVWTpsI1XYBNu5eeXcGPzWvwvECZe
 Kh2vY=
X-Talos-CUID: =?us-ascii?q?9a23=3A4y5P3mi6Exb5yvkzFCAVHDIb/DJua0LFk2zdOky?=
 =?us-ascii?q?CKEFARbyOUk/X+6c6jJ87?=
X-Talos-MUID: 9a23:TgI4FQmFPl+r5KwTprwXdnpSL9ky3Lj1UHwLmM0H6sOWaydgMgu02WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,175,1779148800"; 
   d="scan'208";a="512950449"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 18:57:53 +0000
Received: from sjc-ads-9357.cisco.com (sjc-ads-9357.cisco.com [10.30.212.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id D8C1318000203;
	Mon, 20 Jul 2026 18:57:52 +0000 (GMT)
Received: by sjc-ads-9357.cisco.com (Postfix, from userid 1887503)
	id 3588FCC124B; Mon, 20 Jul 2026 11:57:52 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Devansh Patel <devanshp@cisco.com>
Subject: [OE-core][scarthgap][PATCH 5/8] openssh: Fix CVE-2026-59995
Date: Mon, 20 Jul 2026 11:57:46 -0700
Message-ID: <20260720185749.4098075-6-devanshp@cisco.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20260720185749.4098075-1-devanshp@cisco.com>
References: <20260720185749.4098075-1-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-9357.cisco.com [10.30.212.121];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.212.121, sjc-ads-9357.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 18:58:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241485

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream OpenSSH 10.4 backport for
CVE-2026-59995. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/openssh/openssh-portable/commit/1b39f39657d2e58f8ec57341581a39bbf0be645b
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-59995

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../openssh/openssh/CVE-2026-59995.patch      | 42 +++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-59995.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-59995.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59995.patch
new file mode 100644
index 0000000000..9b6fee198f
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59995.patch
@@ -0,0 +1,42 @@
+From b340eaa274a7e7dffea03bcb62169249bbddab37 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Mon, 29 Jun 2026 01:47:21 +0000
+Subject: [PATCH] upstream: avoid download to server-controlled path when
+ performing
+
+download on the commandline. From Swival scanner
+
+CVE: CVE-2026-59995
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/1b39f39657d2e58f8ec57341581a39bbf0be645b]
+
+Backport Changes:
+- Retained the Scarthgap sftp.c OpenBSD revision identifier because the
+  10.4 identifier does not describe the older source baseline.
+
+OpenBSD-Commit-ID: d1b2c44305fdfe6d51eed9ecc727e59478bf311f
+(cherry picked from commit 1b39f39657d2e58f8ec57341581a39bbf0be645b)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ sftp.c | 9 ++-------
+ 1 file changed, 2 insertions(+), 7 deletions(-)
+
+diff --git a/sftp.c b/sftp.c
+index c609b4153..487e53976 100644
+--- a/sftp.c
++++ b/sftp.c
+@@ -2268,13 +2268,8 @@ interactive_loop(struct sftp_conn *conn, char *file1, char *file2)
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
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index c2e172c8d6..b4885ab151 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -41,6 +41,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2026-59997.patch \
            file://CVE-2026-59998.patch \
            file://CVE-2026-59996.patch \
+           file://CVE-2026-59995.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 
-- 
2.44.4


