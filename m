Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B16CCA473
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 03:52:44 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14419.1792122758652496697
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 20:52:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ZgJkRClj;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3721; q=dns/txt;
  s=iport01; t=1792122758; x=1793332358;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eey1suPdeZI2ro+s2TPk6JuXjqhp907Qt9Um0PSuZ9Q=;
  b=ZgJkRCljFgG/vechZ7dXAjSdOkQj9UEIx1NgpvRm9GUpD/J2RC+Bm+m4
   b86kDCUQ7AJ+IRhE8YoXDorHLK/uI4asbHDqxLSH5dBagGRuvBYL0VTDk
   sblmwkMf0HhYOlX+pb0JNWohrAfe4y9PP8ha0M3NGJDdC4GY1l08WofyK
   mgQUcGSfH3wxqBLlcf1Ae4KLDSVnLRMdRqDXAIfwpJ4C0L13L3lhTeEjV
   Ph4TThF03WQ8FQzqOICIlNx94oBwPkN+7ml6zocLnT4YE+J/h1gqvOYlQ
   MFkwE+uxjl77JFZE/rTZXfh+TSeitRgCmNNqFUu3MxrggKMUAXQfCXTKK
   w==;
X-CSE-ConnectionGUID: JYojjdhPSAK6onnkUCp2Xg==
X-CSE-MsgGUID: fxUJZk2PQaGn5eWSo9T6yA==
X-IPAS-Result: =?us-ascii?q?A0AAAwAbntFq/4z/Ja1aglmCV3VgQ0kDlkcDnhyBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGEP0YCjhUCJjYHDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkBIBAgEDMgEYAS0QHAMBAi8rIwgQCYMCAYJ0AxG8HRs3giyBA?=
 =?us-ascii?q?YMpAT8CQ1DbMgELFAEFgTOFQIgjXRgBgkmCMycbG4FygRWDaYEFgVwCA4FFh?=
 =?us-ascii?q?l0EgiJ6EoFaHpUpSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFg?=
 =?us-ascii?q?R2BIIIWIxk2eoEJXoErKWABEBeBCYIHAoJUggACAUlBDgdFUwklQxJHJiIIE?=
 =?us-ascii?q?gkBExowC4EbODwJKEEXDHMMHQVyCAINCQcpGA1IESw3FRkEPm4HkhQegmV7E?=
 =?us-ascii?q?wErgiwGpW+hDwoog3aMIpU6GjOqbwuYfY4Klk+EaYFuATWBWXAVgyIJShkPj?=
 =?us-ascii?q?jmDa4UTyUcnMgsDLwEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:6+CVzaJo+Kp1RN+qFE+Rh5QlxSXFcZb7ZxGr2PjKsXjdYENS3zVSn
 2oXUTuCP63ZZWv9e9h/PI2xo0kG65TXmoRjTwYd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8g2cqajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1MPUY0P4EYwt1eIj9J8
 /obFRsVNCCM0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBVrAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEyojx5nYj/7DLo+gOehhXDlWzZZs1mS46Ew5gA/ySQsi+WwboqIK4biqcN9kFalh
 FDFpVzACz4cadGg8j3Uziy9r7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MuECSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXPIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:T3qzyqsVBhSYSYN+1ev2VmBN7skDrtV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1MmZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWIeeAa2SS9fyKgzWQIpIH3MSN9ryuiKP1yndgShwvVoRbhj0Jczpy1iZNNXJ77V1TLu
 vl2vZ6
X-Talos-CUID: 9a23:nlbHWWF77liZLAoHqmJFxUkWGMwlSkb07ynXJUm7NE1xEo2aHAo=
X-Talos-MUID: 9a23:hd1Y1gsVl3M1RH3rts2niiFfFvVruZyXAW8LzJg5gM7VCXJhEmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="535568592"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 03:52:37 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id AAF8718000618;
	Fri, 16 Oct 2026 03:52:37 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 10869CBEFBF; Thu, 15 Oct 2026 20:52:37 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH 09/10] openssh: Fix CVE-2026-106552
Date: Thu, 15 Oct 2026 20:52:35 -0700
Message-Id: <20261016035236.442896-10-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016035236.442896-1-hthakar@cisco.com>
References: <20261016035236.442896-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 03:52:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247918

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/openssh/openssh-portable/commit/c07ea2180adebd6019a6ebdd89becb9d9f4b4897
[2] https://ubuntu.com/security/CVE-2026-106552

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../openssh/openssh/CVE-2026-106552.patch     | 63 +++++++++++++++++++
 .../openssh/openssh_10.3p1.bb                 |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106552.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106552.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106552.patch
new file mode 100644
index 0000000000..a44d70a24f
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106552.patch
@@ -0,0 +1,63 @@
+From c07ea2180adebd6019a6ebdd89becb9d9f4b4897 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Thu, 1 Oct 2026 03:11:49 +0000
+Subject: [PATCH] upstream: sftp: be stricter in accepting paths returned by the
+
+server for SSH_FXP_REALPATH or SSH2_FXP_READDIR replies, as these can be used
+in some situations to decide the destination path for recursive transfers.
+
+Report and patch from Junghoon Cho
+
+OpenBSD-Commit-ID: ad357002a1b75c87113f01086a9f0c12c36082d8
+
+CVE: CVE-2026-106552
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/c07ea2180adebd6019a6ebdd89becb9d9f4b4897]
+
+Backport Changes:
+- Omitted upstream OpenBSD revision-only hunks and retained the Wrynose
+  OpenSSH 10.3p1 context.
+
+(cherry picked from commit c07ea2180adebd6019a6ebdd89becb9d9f4b4897)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ sftp-client.c |  3 ++-
+ sftp.c        | 12 +++++++++---
+ 2 files changed, 11 insertions(+), 4 deletions(-)
+
+diff --git a/sftp-client.c b/sftp-client.c
+--- a/sftp-client.c
++++ b/sftp-client.c
+@@ -785,7 +785,8 @@ sftp_lsreaddir(struct sftp_conn *conn, const char *path,
+ 			 * These can be used to attack recursive ops
+ 			 * (e.g. send '../../../../etc/passwd')
+ 			 */
+-			if (strpbrk(filename, SFTP_DIRECTORY_CHARS) != NULL) {
++			if (*filename == '\0' ||
++			    strpbrk(filename, SFTP_DIRECTORY_CHARS) != NULL) {
+ 				error("Server sent suspect path \"%s\" "
+ 				    "during readdir of \"%s\"", filename, path);
+ 			} else if (dir) {
+diff --git a/sftp.c b/sftp.c
+--- a/sftp.c
++++ b/sftp.c
+@@ -676,9 +676,15 @@ process_get(struct sftp_conn *conn, const char *src, const char *dst,
+ 			goto out;
+ 		}
+ 
+-		/* Special handling for dest of '..' */
+-		if (strcmp(filename, "..") == 0)
+-			filename = "."; /* Download to dest, not dest/.. */
++		/*
++		 * Special handling for destinations of '..' and remote roots.
++		 * In particular, never select the local root as an implicit
++		 * destination for a remote root.
++		 */
++		if (strcmp(filename, "..") == 0 ||
++		    (filename[0] != '\0' &&
++		    filename[strspn(filename, "/")] == '\0'))
++			filename = ".";
+ 
+ 		if (g.gl_matchc == 1 && dst) {
+ 			if (local_is_dir(dst)) {
+-- 
+2.43.0
diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index 4d9fd0c164..a2a5a3b924 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -42,6 +42,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://CVE-2026-106582.patch \
            file://CVE-2026-106585.patch \
            file://CVE-2026-106583.patch \
+           file://CVE-2026-106552.patch \
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 
-- 
2.35.6


