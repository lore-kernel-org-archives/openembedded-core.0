Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30245CA5FB5
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 06:00:39 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6932.1790748028764497158
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 23:00:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=E1MjKvSQ;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3126; q=dns/txt;
  s=iport01; t=1790748028; x=1791957628;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=brxDgz5ueeSOQlm4tm10RJS+8tWJnNW68PIR6ToR4/0=;
  b=E1MjKvSQHSymK4LTK21azdPE3nShEHJvZOkM3Vo1FlgMU4rIpPYw+2nQ
   mcEi7VhWRVCkXz+/ZqaiTuFdKomO+P3pjUNxngnmx4f6Ya4NWntVBU0dJ
   xDedt4k32wJcKAK96HP1b/e6aIDmp3WcLmiguCCouIqESRj2xhDH/RyqH
   0qCFLOmIIYgjLmcVV4XMP/vMm9Ne/AD/XH05sseXeGn7FBQt3PQxaaLhr
   M0Wd2XdRXgC7DXtK6VPKVpsr6GE56aTgRH6OknmNocJOfB2BErELqfIAi
   MkZJyVONqcRfeoor3Pgx47NffAsqNd5prtGUe98uZ6c3GseZa7eCNOTtm
   g==;
X-CSE-ConnectionGUID: wWeMLMQbT12sHkD+566Ngw==
X-CSE-MsgGUID: WIFVejmoRreGS1wnWDmlAg==
X-IPAS-Result: =?us-ascii?q?A0BFAgCHpLxq/5L/Ja1aHgEBCxIMggULgld1YUJJlkqeH?=
 =?us-ascii?q?YF+DwEBAQ9EDQQBAYQ/Ro4KAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDZASAQIBKgsBGAEtLAMBAlojIYMCAYJ0AgERuy+BeTOBA?=
 =?us-ascii?q?YMpAT8CQ1DbMgELFAEFgTOFQIgjXRgBhHwnGxuBcoEVg2mBBYFcAgIBF4ENI?=
 =?us-ascii?q?YZdBIIiehKBWh6TMkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBBxsGB?=
 =?us-ascii?q?YEdgSCCGSMZNnqBCV6BKylgARAXgQeCBwKCVIIAAgFJQQ4HRVMJJUUSRyYiC?=
 =?us-ascii?q?BIJARMaMAuBGzg+CSg+GA1IESw3FRkEPm4HkDcegmBaNAEqAYINkzZZkgaBN?=
 =?us-ascii?q?Z9aCiiDdowikjCDChozhASmawuYfYJZizGWUIRpgWg8gVlwFYMiCUoZD445g?=
 =?us-ascii?q?2uFE8cmJDULMgEBBwIHDgMLgWiQAIF+AQE?=
IronPort-Data: A9a23:HLy2d6gpWgITFFLtqYlHqjI/X161NhEKZh0ujC45NGQN5FlHY01je
 htvCm6POfiPYGT3e9sgaoSx9U1Qu8DWz9FmGlFkpSw3HiJjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxMuvnb8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUHxetSJUR3/
 8BBcistbTzA2rzo5r2kH7wEasQLdKEHPasFsX1miDWcBvE8TNWbEuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgl/5JEWxI9EglH/bz1Rq1uPjaE2+GPUigd21dABNfKIII3aHpsIzhrwS
 mTuwEXXPBwYMdul0zeqySuzgNDjmCfSV9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cH3hKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Oxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:OplpyKx4I4VWjNG2kPBFKrPwAL1zdoMgy1knxilNoNJuHfBw8P
 re+cjzuiWUtN98YhwdcLO7Scu9qA3nlaKdiLN5VdzJYOCMggWVxe9ZgbcK6geQfxEWjtQttp
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: 9a23:CTC6gGM2K2OPVu5DRxZq0WoxI8oZKyfG7HT8YBLmV0BmV+jA
X-Talos-MUID: 9a23:qnMyxwvcpYiZNEzeEc2nuxBMCspq5qOUEk0iqswZvfaoMChZNGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,132,1787011200"; 
   d="scan'208";a="529836584"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 30 Sep 2026 06:00:27 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id B0E0C18000480;
	Wed, 30 Sep 2026 06:00:27 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 57F85CC1292; Tue, 29 Sep 2026 23:00:27 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH 1/3] openssh: fix CVE-2026-73283
Date: Tue, 29 Sep 2026 23:00:25 -0700
Message-Id: <20260930060027.1560262-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 06:00:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246916

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix that makes the authorized_keys
restrict keyword apply to tunnel forwarding. The upstream fix commit
is referenced in [1], and the public CVE advisory is referenced in [2].

[1] https://github.com/openssh/openssh-portable/commit/d322f2ccf7da095ce94d1d99cb563246f61487b
[2] https://www.cve.org/CVERecord?id=CVE-2026-73283

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../openssh/openssh/CVE-2026-73283.patch      | 42 +++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-73283.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-73283.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-73283.patch
new file mode 100644
index 0000000000..c9acb8dd13
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-73283.patch
@@ -0,0 +1,42 @@
+From d322f2ccf7da095ce94d1d99cb563246f61487b0 Mon Sep 17 00:00:00 2001
+From: djm@openbsd.org <djm@openbsd.org>
+Date: Tue, 14 Jul 2026 01:05:05 +0000
+Subject: [PATCH] upstream: make authorized_keys "restrict" keyword apply
+ correctly
+
+to tunnel forwarding (which is administratively disabled by default).
+
+Reported by Erichen, Institute of Computing Technology,
+Chinese Academy of Sciences
+
+OpenBSD-Commit-ID: 5b3cc987a64749c94b20e12755db32a83f8f01e6
+
+CVE: CVE-2026-73283
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/d322f2ccf7da095ce94d1d99cb563246f61487b0]
+
+Backport Changes:
+- Omitted the upstream OpenBSD RCS revision header update because it does
+  not apply to the OpenSSH 9.6p1 source revision.
+
+(cherry picked from commit d322f2ccf7da095ce94d1d99cb563246f61487b0)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ serverloop.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/serverloop.c b/serverloop.c
+index c1fe99d1..56d8be75 100644
+--- a/serverloop.c
++++ b/serverloop.c
+@@ -531,7 +531,8 @@ server_request_tun(struct ssh *ssh)
+ 		ssh_packet_send_debug(ssh, "Unsupported tunnel device mode.");
+ 		return NULL;
+ 	}
+-	if ((options.permit_tun & mode) == 0 || options.disable_forwarding) {
++	if ((options.permit_tun & mode) == 0 || options.disable_forwarding ||
++	    auth_opts->restricted) {
+ 		ssh_packet_send_debug(ssh, "Server has rejected tunnel device "
+ 		    "forwarding");
+ 		return NULL;
+-- 
+2.43.0
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index b48e262c72..f660e78dba 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -44,6 +44,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2026-60001.patch \
            file://CVE-2026-60002.patch \
            file://CVE-2026-60000.patch \
+           file://CVE-2026-73283.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 
-- 
2.35.6


