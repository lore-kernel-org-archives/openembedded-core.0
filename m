Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E97ECCA48B
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 03:52:45 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14167.1792122758432712248
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 20:52:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=DogiDpb1;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2904; q=dns/txt;
  s=iport01; t=1792122758; x=1793332358;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gHC2yEz6QTknnqM21C7tC5AjbPcgOkxzyMcLLOtsPZI=;
  b=DogiDpb1Iv7wGBLjmCygY/QgeVAbf0oqxDRTi+CForoKCwmXK/HGkme7
   TAUZ5d6NBoKNRShqVjqN6cXBN7Yqm1GxQfOm962NipgoxT0AFxuaND9AR
   i2q5uZnB2STc/Fs97MaW9taWqrew05W+PhBfJhLTxDcRZ93NCSwQudBt8
   zolAFDmCwSuBeALpT1uVv4ycb2erDMBopUmeCZ+6sE4BgQMaZ69P7NcAP
   /ini/tx6kD7q+fOjkG2NrFKIrjok1Uh9aATnu9wBpW9ilK1K6prXp0Mx8
   jrho3YigpUEvWvvBk2baW61tDyoPG/8E7sBPa8xWSmuhqWa6UnNjB2Y4Z
   w==;
X-CSE-ConnectionGUID: ILzDJJRvQBehHy82nZ7b2Q==
X-CSE-MsgGUID: h3dTcBzSSIWAQq+RRaa90A==
X-IPAS-Result: =?us-ascii?q?A0BJAgCwntFq/43/Ja1aglmCV3VgQ0kDlkcDnhyBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGEP0YCjhUCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkBIBAgEDJwsBGAEtEBwDAQIvKyMIGYMCAYJ0AxG8cIF5M4EBg?=
 =?us-ascii?q?ykBPwJDUNsyAQsUAQWBM4VAiCNdGAGEfCcbG4FyhH6BBYFcAgOCKoV4BIIie?=
 =?us-ascii?q?hKBWh6VKUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdgSCCF?=
 =?us-ascii?q?iMZNnqBCV6BKylgARAXgQmCBwKCVIIAAgFJQQ4HRVMJJUMSRyYiCBIJARMaM?=
 =?us-ascii?q?AuBGzg8CShBFwxzDB0FcggCDQkHKRgNSBEsNxUZBD5uB5IUHoJeBwF6EwErg?=
 =?us-ascii?q?iyTOJI9oQ8KKIN2jCKVOhozqm8LmH2OCpVnaIRpgWg8gVlwFYMiCUoZD445g?=
 =?us-ascii?q?2uFE8lHJzILAy8BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:9A72cKjg4kjC0eM7KFDEL+HCX161NhEKZh0ujC45NGQN5FlHY01je
 htvDWmHaP6PYGT0Ld92OY2woEkBsMfVytAwQAc+/iE2QytjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNs/vd8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqU53vRbI0N06
 8UyJTAtf0DZgdDpyuiCH7wEasQLdKEHPasFsX1miDWcBvE8TNWbH+PB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZg5/5JEWxI9EglH/bz1Rq1uPjaE2+GPUigd21dABNfKIIYHbFJ4MxxbwS
 mTu/z/1PhowJuek6AWsy2vvvNXGlHKjcddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cEnhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Oxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:cXtYjKOECSMheMBcThmjsMiBIKoaSvp037Dk7S9MoHtuA6ulfq
 +V/cjzuSWYtN9VYgBDpTniAtjlfZqjz/5ICOAqVN/INjUO+lHYSb2KhrGN/9SPIUHDH8dmpM
 FdmtBFeb7NJGk/q9rm6w+lFNtl6tyG/Ke0wdr69R5WPHhXg2UK1XYDNu5deXcGPDV7OQ==
X-Talos-CUID: 9a23:d+SsKWGcCrTD6VV0qmJG0Fw4OOIfbET3wXfwMh/iD1Q2QuesHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3Ad2463Q35rCwuzFGvZwdZlHHXkjUj4/+iNEsng64?=
 =?us-ascii?q?9mvatDDUzAQ2UhWXva9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="535993118"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 03:52:37 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id A476D18000182;
	Fri, 16 Oct 2026 03:52:37 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 0151BCBF21E; Thu, 15 Oct 2026 20:52:37 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH 05/10] openssh: Fix CVE-2026-106585
Date: Thu, 15 Oct 2026 20:52:31 -0700
Message-Id: <20261016035236.442896-6-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016035236.442896-1-hthakar@cisco.com>
References: <20261016035236.442896-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 03:52:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247919

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/openssh/openssh-portable/commit/e0f85d83ccc15b1b218fa8a000fc29a2e3d2defd
[2] https://ubuntu.com/security/CVE-2026-106585

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../openssh/openssh/CVE-2026-106585.patch     | 44 +++++++++++++++++++
 .../openssh/openssh_10.3p1.bb                 |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106585.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106585.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106585.patch
new file mode 100644
index 0000000000..08f992f54c
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106585.patch
@@ -0,0 +1,44 @@
+From e0f85d83ccc15b1b218fa8a000fc29a2e3d2defd Mon Sep 17 00:00:00 2001
+From: "job@openbsd.org" <job@openbsd.org>
+Date: Tue, 22 Sep 2026 22:51:43 +0000
+Subject: [PATCH] upstream: Check that compressed payloads don't inflate beyond the
+
+maximum payload length
+
+From a report by Oleh Konko (1seal)
+
+OK djm@
+
+OpenBSD-Commit-ID: a0d3e7aa432777c28bfe23e5447ac117d6c151d9
+
+CVE: CVE-2026-106585
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/e0f85d83ccc15b1b218fa8a000fc29a2e3d2defd]
+
+Backport Changes:
+- Omitted the upstream packet.c OpenBSD revision-only hunk and retained
+  the Wrynose OpenSSH 10.3p1 revision.
+
+(cherry picked from commit e0f85d83ccc15b1b218fa8a000fc29a2e3d2defd)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ packet.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/packet.c b/packet.c
+--- a/packet.c
++++ b/packet.c
+@@ -907,10 +907,12 @@ uncompress_buffer(struct ssh *ssh, struct sshbuf *in, struct sshbuf *out)
+ 		switch (status) {
+ 		case Z_OK:
+ 			if ((r = sshbuf_put(out, buf, sizeof(buf) -
+ 			    ssh->state->compression_in_stream.avail_out)) != 0)
+ 				return r;
++			if (sshbuf_len(out) >= PACKET_MAX_SIZE)
++				return SSH_ERR_INVALID_FORMAT;
+ 			break;
+ 		case Z_BUF_ERROR:
+ 			/*
+ 			 * Comments in zlib.h say that we should keep calling
+ 			 * inflate() until we get an error.  This appears to
+-- 
+2.43.0
diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index 129c62090f..3e927154f5 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -40,6 +40,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://CVE-2026-106586_p3.patch \
            file://CVE-2026-106587.patch \
            file://CVE-2026-106582.patch \
+           file://CVE-2026-106585.patch \
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 
-- 
2.35.6


