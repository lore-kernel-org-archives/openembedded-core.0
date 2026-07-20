Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E3DAC44532
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:57:09 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3615.1784570226377132936
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:57:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=iNPbBIDb;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3053; q=dns/txt;
  s=iport01; t=1784570226; x=1785779826;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NVk6BTlbcX/IAKxULjQKZ7HaZPD6o89b+ZogtpPMB+I=;
  b=iNPbBIDbBdTulwU4+bWED2sFAygrVhQS3Y3Gae0Jd2+K29GMOD5dakUT
   MGWeRHAdsKGEm5lfCsYVmvi5+PpZYMAq9ubh6QZFE3RUP7FIu21xeyyvg
   rHjM8U7vLjUcmirSv7Jipx2SK9OdAw9N48dYWL1wiK3Qm9Em+2GfSb2PM
   68eMZCVdZLHE0Zpc/RGg2D8rJwxY8fYLoM0YBrTHDCrLVWSjYp0n0fpgK
   R9hOmRR+jmio3GtUZiuqiE+0SOBNbEPhbMgFhqlE18ySsY9ak0Lu2RACs
   Ozktoo98FAmVfydBhN5qBmFYPl3WDwhYWfVAlfCoMpp5vok3jxxIWm7Eb
   A==;
X-CSE-ConnectionGUID: 9QU+3/seQM6kJ6AKRRLySw==
X-CSE-MsgGUID: GE+IWk2WQxeS/8PBp3YNSw==
X-IPAS-Result: =?us-ascii?q?A0BFAgA1YF5q/5L/Ja1aglmCV3RfQkmWSp4egX4PAQEBD?=
 =?us-ascii?q?0QNBAEBhD9GjVUCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGTw2GWgECATUBGAEbEiwDAQJaIyGDAgGCdAIBEbt4giyBAYMoAT8CQ1DbL?=
 =?us-ascii?q?gELFAEFgTOFP4ggXBgBhHwnGxuBcoEVg2mBBYFcAgIBF4ENIYZdBIIiehKBW?=
 =?us-ascii?q?h6PdEiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHBYEdgTqBAoR0I?=
 =?us-ascii?q?x8DOX+BL3VKdy1pARIXgSaCEgKBOwIOAwsYDUgRLDcUGQQ+bgeNQCOCPwGBD?=
 =?us-ascii?q?gErgiyTcJIGgTWfWgoog3WMIZU6GjOqbAuYfY4KllCEaYFoPIFZcBWDIglKG?=
 =?us-ascii?q?Q+OOINrhRPJRyQ1CzIBAQcCBw4DC4FokACBfgEB?=
IronPort-Data: A9a23:/MAifKKVwfuRBlhnFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENS0GNUz
 zZJUGvVOfzcN2ekfd9+Oomw9k5Tu5bXxtUxQAEd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9hGQsajx8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN0/NXx1ZsoD999SX2Jsq
 9U7Egopfyuc0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBXLAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEqojx5nYj/7DLoykfmhgGL/axVTqUmeouw85G27IAlZjeG3YYCOJITQLSlTtmm15
 UP5/D7GOwEXD5vP8RCdqUOKvfCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1ffDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9ExpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:D2TrIqCMIYdjYqPlHemA55DYdb4zR+YMi2TDGXofdfUzSL38qy
 nAppUmPHPP5Qr5O0tQ++xoRpPhfZq0z/cciuMs1NyZMjUO1lHFEGhK1/qH/9SZIVycysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: 9a23:1Y8rIWM1t5KIPe5DCRBatxVTAc0cVyPe7in5AHWCLXdSV+jA
X-Talos-MUID: 9a23:UIxIKgZl8b/v9OBTmBKvpQ5hbvhR86mVTxA1u41diu+/Knkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,175,1779148800"; 
   d="scan'208";a="512923602"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 17:57:05 +0000
Received: from sjc-ads-20746.cisco.com (sjc-ads-20746.cisco.com [171.70.189.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 5A50718000497;
	Mon, 20 Jul 2026 17:57:05 +0000 (GMT)
Received: by sjc-ads-20746.cisco.com (Postfix, from userid 1887503)
	id EE4DDCEC30E; Mon, 20 Jul 2026 10:57:04 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Devansh Patel <devanshp@cisco.com>
Subject: [OE-core][wrynose][PATCH 1/8] openssh: Fix CVE-2026-59999
Date: Mon, 20 Jul 2026 10:55:11 -0700
Message-Id: <20260720175518.3546447-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-20746.cisco.com [171.70.189.245];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 171.70.189.245, sjc-ads-20746.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:57:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241468

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream OpenSSH 10.4p1 backport for
CVE-2026-59999. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/openssh/openssh-portable/commit/8dfe7ed6e2fd988de08df508355a196b956b2753
[2] https://www.cve.org/CVERecord?id=CVE-2026-59999

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../openssh/openssh/CVE-2026-59999.patch      | 38 +++++++++++++++++++
 .../openssh/openssh_10.3p1.bb                 |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-59999.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-59999.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59999.patch
new file mode 100644
index 0000000000..5907a991b9
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59999.patch
@@ -0,0 +1,38 @@
+From a83dd105dc407d95c42140ea6f04a1e247aaf2f9 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Sun, 31 May 2026 04:47:29 +0000
+Subject: [PATCH] upstream: DisableForwarding=yes didn't override
+ PermitTunnel=yes
+
+Reported independently by Huzaifa Sidhpurwala of Redhat and Marko
+Jevtic; ok markus@
+
+OpenBSD-Commit-ID: b5c13f0746cf079b21f8deba47407fad49ccbf4c
+
+CVE: CVE-2026-59999
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/8dfe7ed6e2fd988de08df508355a196b956b2753]
+
+Backport Changes:
+- Omitted the upstream OpenBSD revision-only hunk in serverloop.c and
+  retained the Wrynose OpenSSH 10.3p1 revision because this stable
+  backport carries only the functional security change.
+
+(cherry picked from commit 8dfe7ed6e2fd988de08df508355a196b956b2753)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ serverloop.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/serverloop.c b/serverloop.c
+index 8e63480ec..42c3ce9fe 100644
+--- a/serverloop.c
++++ b/serverloop.c
+@@ -523,7 +523,7 @@ server_request_tun(struct ssh *ssh)
+ 		ssh_packet_send_debug(ssh, "Unsupported tunnel device mode.");
+ 		return NULL;
+ 	}
+-	if ((options.permit_tun & mode) == 0) {
++	if ((options.permit_tun & mode) == 0 || options.disable_forwarding) {
+ 		ssh_packet_send_debug(ssh, "Server has rejected tunnel device "
+ 		    "forwarding");
+ 		return NULL;
diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index a050475532..2c3b839442 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -24,6 +24,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://run-ptest \
            file://sshd_check_keys \
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
+           file://CVE-2026-59999.patch \
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 
-- 
2.35.6


