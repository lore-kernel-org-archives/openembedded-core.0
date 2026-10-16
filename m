Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5EBDCCA46D
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 03:52:44 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14418.1792122758622947280
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 20:52:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=jP7x/8G0;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2909; q=dns/txt;
  s=iport01; t=1792122758; x=1793332358;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vao6Mv73d3WyGcbUVByNSr2Xh9wp6Edc4q1N3cIH3vY=;
  b=jP7x/8G0hdpW0Pw+VYzS+6JRz2NfVrAoX7AWWYE8UbpvHVUo3uDPJ8Pd
   2hkrshY/K3As2JUQmxkeKpDZzER2bB5KMikgWkQPKYMJzxZkS/1kNrda0
   YFbvnCw5aZbU8aRkhY0rTne6cmtk52w2qsiDOMXYrCR0QUVaVTpdBMs9z
   ugIgAV6SntIIkJaofOwsomtKMhexuFFkkVgNNZBG12IPuv7IYEis1Av7V
   OTrIsT5YDgXbcCDLWblHN89ToSg17yVwIsgvO9i5NJ4KbUisFbXeVCzpy
   w7TJtq5GXuuUA0r6XEYWzSDJGP/etPLVQdLih9GtyHNcjsuVfhJFS9Rt8
   g==;
X-CSE-ConnectionGUID: AfsPbhZLTk2gR2frddhkNQ==
X-CSE-MsgGUID: veIpcpwzQ+O8qFS6baYfig==
X-IPAS-Result: =?us-ascii?q?A0BIAgCwntFq/5H/Ja1aglmCV3VgQ0kDlkqeHIF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYQ/RgKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEgECAQMyARgBLRAcAwECFxgrIwgZgwIBgnQDEbxwgiyBAYMpA?=
 =?us-ascii?q?T8CQ1DbMgELFAEFgTOFQIgjXRgBhHwnGxuBcoEVg2mBBYFcAgOCJQULhW0Eg?=
 =?us-ascii?q?iJ6EoFaHpUpSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFgR2BI?=
 =?us-ascii?q?IIWIxk2eoEJXoErKWABEBeBCYIHAoJUggACAUlBDgdFUwklQxJHJiIIEgkBE?=
 =?us-ascii?q?xowC4EbODwJKEEXDHMMHQVyCAINCQcpGA1IESw3FRkEPm4HkhQegmWBDgErg?=
 =?us-ascii?q?iwcoziCIaEPCiiDdowilToaM6pvC5h9jgqWT4RpgWg8gVlwFYMiCUoZD445g?=
 =?us-ascii?q?2uFE8lHJzILAy8BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:40vvNqJQHxe6Xnh5FE+Rh5QlxSXFcZb7ZxGr2PjKsXjdYENS1DJTy
 2YfXzvSbPyJZjHyfNEgb9yy8EsBvsfczNdgTgod+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8g2cqajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1HAloON40q3tp0W250r
 /ICJDwNbTa60rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBXbAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEmojx5nYj/7DLo+gOehhXDlWzZZs1mS46Ew5gA/ySQsiuG8b4eNI43iqcN9gEu5v
 mne4HbAQTZKLfKklzCMw3ytibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++Ms0CSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXJIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:F0Pe8KlTkRODth+KNYaZ9VhBjgjpDfL03DAbv31ZSRFFG/FwWf
 rAoB19726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKIjOHhILAFugLhuHfKn/bakjDH4Vmu5
 uIHZITNDTYNykdsS+D2njaL/8QhP+a7auvmeDSi11pTQ1sduVcyj0RMHfjLqWzLzM2fqbQ0/
 Gnl7J6mwY=
X-Talos-CUID: 9a23:jDY/t2/W25rbCy2w6eqVv2caAfgvck/58HSKLHXiB3xlRL2Wb2bFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AQOMIDA25HraX6RvqDVQbiM4KFDUj/amPEEsVjoc?=
 =?us-ascii?q?/+O7ULAJLZT2UvTq2Tdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="521975019"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 03:52:37 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id A9CC318000443;
	Fri, 16 Oct 2026 03:52:37 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 0C4BFCBEFAB; Thu, 15 Oct 2026 20:52:37 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH 08/10] openssh: Fix CVE-2026-106583
Date: Thu, 15 Oct 2026 20:52:34 -0700
Message-Id: <20261016035236.442896-9-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016035236.442896-1-hthakar@cisco.com>
References: <20261016035236.442896-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 03:52:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247917

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1]. The two other commits linked by [2] only add and
adjust regression tests; they contain no functional security fix.

[1] https://github.com/openssh/openssh-portable/commit/0c4c9a7b320bd7ff61c4a2dc345cb2e27e9663b2
[2] https://ubuntu.com/security/CVE-2026-106583

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../openssh/openssh/CVE-2026-106583.patch     | 35 +++++++++++++++++++
 .../openssh/openssh_10.3p1.bb                 |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106583.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106583.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106583.patch
new file mode 100644
index 0000000000..094f4bad63
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106583.patch
@@ -0,0 +1,35 @@
+From 0c4c9a7b320bd7ff61c4a2dc345cb2e27e9663b2 Mon Sep 17 00:00:00 2001
+From: "dtucker@openbsd.org" <dtucker@openbsd.org>
+Date: Mon, 5 Oct 2026 06:03:40 +0000
+Subject: [PATCH] upstream: Further restrict the characters allowed in a command-line
+
+supplied user name, disallowing '$' and '\'. Reported by SecBuddyF KeenLab
+Tencent (CodeBuddy Security).
+
+OpenBSD-Commit-ID: 13671c178f492af63b5c1296f284818c7809ed9a
+
+CVE: CVE-2026-106583
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/0c4c9a7b320bd7ff61c4a2dc345cb2e27e9663b2]
+
+Backport Changes:
+- Omitted the upstream readconf.c OpenBSD revision-only hunk and retained
+  the Wrynose OpenSSH 10.3p1 revision.
+
+(cherry picked from commit 0c4c9a7b320bd7ff61c4a2dc345cb2e27e9663b2)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ readconf.c | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/readconf.c b/readconf.c
+--- a/readconf.c
++++ b/readconf.c
+@@ -3452 +3452 @@ ssh_valid_ruser(const char *s)
+-		if (strchr("'`\";&<>|(){}", s[i]) != NULL)
++		if (strchr("'`\";&<>|(){}$\\", s[i]) != NULL)
+@@ -3457,3 +3457,0 @@ ssh_valid_ruser(const char *s)
+-		/* Disallow \ in last position */
+-		if (s[i] == '\\' && s[i + 1] == '\0')
+-			return 0;
+-- 
+2.43.0
diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index cd8b7169a8..4d9fd0c164 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -41,6 +41,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://CVE-2026-106587.patch \
            file://CVE-2026-106582.patch \
            file://CVE-2026-106585.patch \
+           file://CVE-2026-106583.patch \
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 
-- 
2.35.6


