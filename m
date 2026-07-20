Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08DA0C44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:57:09 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3657.1784570226506229953
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:57:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=IGFFdCmK;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3048; q=dns/txt;
  s=iport01; t=1784570226; x=1785779826;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r86+/VG8cUZMsplC3s+SmD0k+D3GQbtkz8s1Bts+7lc=;
  b=IGFFdCmK1R1ZTX7PSSW+PVZqibUWJ5o9p24se1acM5erxpN5wSY6FKZ1
   Rl01Nh0zgspUIDZXAkdHLE5ds7q/BPgamvqFtYjCYjC0BhR5V0ich+Pcg
   9q3ieqv7+eN9sT8Gjk9qe1wPCI8hjsKlD6nDItz1ZfWahkAtmRQaB8sh6
   +faVtLiDFpEYk90H8EuZiR3y7p8j2eSVMYkYyAmg1iDGR5k2zGKqx18R9
   zTOqSXWjRI+S8NXfPTY/JqVB0b4yzGEcaLZgODryVaL/HwH8HuSaz/644
   QVOlzD+XvI4UoD6jtsjhKh2BiXFnkZQXHmKsl+EvN//WpdhpJ0glCkplb
   w==;
X-CSE-ConnectionGUID: yAyTH9YBSxSyz8JpQJaTFQ==
X-CSE-MsgGUID: W7fF8+8GRkmm5VD73fqLhg==
X-IPAS-Result: =?us-ascii?q?A0BIAgCzYF5q/5L/Ja1aglmCV3RfQkmWTZ4bgX4PAQEBD?=
 =?us-ascii?q?0QNBAEBhD9GAo1TAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhloBAgEDMgEYARsSEBwDAQIvKx0BBQgZgwIBgnQCARG7fIIsgQGDK?=
 =?us-ascii?q?AE/AkNQ2y4BCxQBBYEzhT+IIFwYAYR8JxsbgXKEfoEFgVwCAgEXiAsEgiJ6E?=
 =?us-ascii?q?oFaHoF9PY06SIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFgR2BO?=
 =?us-ascii?q?oEChHQjHwM5f4EvdUp3LWkBEheBJoISAoE7Ag4DCxgNSBEsNxQZBD5uB41AI?=
 =?us-ascii?q?4JAaiQBK4IspXahDwoog3WMIZU6GjOqbAuYfY4KlTaBGoRpgWg8gVlwFTuCZ?=
 =?us-ascii?q?wlKGQ+OOINrhRPJRyQ1CzIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:4HGDZqikINOtYIEicyDKTTb3X161MREKZh0ujC45NGQN5FlHY01je
 htvDD+Ea/zeYmL2Kdlxb4zkoE1XsMWHz9JiSQJv/C88RC9jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMtPjb8E0HUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUJ0/dLITB/3
 8cIEyEfPjKbvsC//JyCH7wEasQLdKEHPasFsX1miDWcBvE8TNWbEuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgl/5JEWxI9EglHzfiNRrkmVvYI84nPYy0p6172F3N/9J4XQH58ExxjBz
 o7A11umDD9Kd4yw8zmA9y+SqrCUkzrfWI1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFm8HY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn2891te5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:U19jkqtCbxFJt3xYB5+d1kD+7skDrtV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1MmZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWIeeAa2SS9fyKgzWQIpIH3MSN9ryuiKP1yndgShwvVoRbhj0Jczpy1iZNNXJ77V1TLu
 vl2vZ6
X-Talos-CUID: 9a23:1pMHV2BlrNXgSo76EzhO5XI0S/EPSW3m3WWAAVeBK29VZoTAHA==
X-Talos-MUID: 9a23:mOJvGgmkjKHzFwWJovpgdnpda8lGs+f+J3oOlJBbheXbbiJpHzeS2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,175,1779148800"; 
   d="scan'208";a="512229161"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 17:57:05 +0000
Received: from sjc-ads-20746.cisco.com (sjc-ads-20746.cisco.com [171.70.189.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 61C0218000238;
	Mon, 20 Jul 2026 17:57:05 +0000 (GMT)
Received: by sjc-ads-20746.cisco.com (Postfix, from userid 1887503)
	id 00FCCCEC314; Mon, 20 Jul 2026 10:57:05 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Devansh Patel <devanshp@cisco.com>
Subject: [OE-core][wrynose][PATCH 3/8] openssh: Fix CVE-2026-59998
Date: Mon, 20 Jul 2026 10:55:13 -0700
Message-Id: <20260720175518.3546447-3-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260720175518.3546447-1-devanshp@cisco.com>
References: <20260720175518.3546447-1-devanshp@cisco.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241475

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream OpenSSH 10.4p1 backport for
CVE-2026-59998. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/openssh/openssh-portable/commit/8058c5bdb507591b79ec926221fbe6fcc296d432
[2] https://www.cve.org/CVERecord?id=CVE-2026-59998

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../openssh/openssh/CVE-2026-59998.patch      | 36 +++++++++++++++++++
 .../openssh/openssh_10.3p1.bb                 |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-59998.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-59998.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59998.patch
new file mode 100644
index 0000000000..3e15fe19fa
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59998.patch
@@ -0,0 +1,36 @@
+From 94a089cd331eeea77ffd6fd715e61d281c3b97c3 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Wed, 24 Jun 2026 06:55:12 +0000
+Subject: [PATCH] upstream: mention a caveat regarding
+ GSSAPIStrictAcceptorCheck in
+
+some environments
+
+OpenBSD-Commit-ID: aa7158d8f22cb34063c1c2d3cbcf30a9489847c2
+
+CVE: CVE-2026-59998
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/8058c5bdb507591b79ec926221fbe6fcc296d432]
+
+Backport Changes:
+- Omitted the upstream OpenBSD revision and Mdocdate-only hunks in
+  sshd_config.5 and retained the Wrynose OpenSSH 10.3p1 values because
+  this stable backport carries only the security-relevant documentation.
+
+(cherry picked from commit 8058c5bdb507591b79ec926221fbe6fcc296d432)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ sshd_config.5 | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/sshd_config.5 b/sshd_config.5
+index 3f5e29812..22b9039d2 100644
+--- a/sshd_config.5
++++ b/sshd_config.5
+@@ -769,6 +769,7 @@ machine's default store.
+ This facility is provided to assist with operation on multi homed machines.
+ The default is
+ .Cm yes .
++This option may not be effective in Windows Active Directory environments.
+ .It Cm HostbasedAcceptedAlgorithms
+ Specifies the signature algorithms that will be accepted for hostbased
+ authentication as a list of comma-separated patterns.
diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index 87bd417b2d..b9f2a37c57 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            file://CVE-2026-59999.patch \
            file://CVE-2026-59997.patch \
+           file://CVE-2026-59998.patch \
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 
-- 
2.35.6


