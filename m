Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C396FC44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 09:54:37 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44328.1784714076440053462
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 02:54:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=KLrSMhDy;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5511; q=dns/txt;
  s=iport01; t=1784714076; x=1785923676;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5I9RFiO7ZF90MQZyBjx+nkSTBkgYoI0A2zOo8W0JFiU=;
  b=KLrSMhDyl0DvWZrz4nL91o3LJXM8OfeuRKvsZYtxE+Jt30RTNHsvZORR
   bMR3I55zVPxmCn3b6a2b4hXGKUM1k+DFjAesOWfsj8uhRiRKa4+mWZfVk
   QHZGM9jTiWVv55rH3aZ4bhnE1PPqTN06lEQVas/1M9OqHnUBYT7oGltwZ
   0Ou94u2rsMWnSypPak7Rn1HSLLU08PA3KNezQoyRvBEfzSzM8LvWT9KCu
   wstLp01o4zqEZviqIYX56kS1TjmR5/T83n/YoHgwhhrxgAtv2/lYw7Wrn
   i9/KO18aLjFW50bTbZVRQV+Ze3X30ei++6Y4fEjfhd7Cn7oL3V2WzBBiy
   Q==;
X-CSE-ConnectionGUID: CoCwUuCOT32g7qYhsZu6UA==
X-CSE-MsgGUID: 0pY2VNXrQYmUWKnJGns01g==
X-IPAS-Result: =?us-ascii?q?A0BHAgDCkmBq/4v/Ja1aglmCV3ReQ0mWSgOeG4F+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYUFAo1XAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhloBAgEDJwsBGAEtEBwDAQIvKyMIGYMCAYJ0AxHAcYF5M4EBgygBP?=
 =?us-ascii?q?wJDUNsuAQsUAQWBM4U/iCBcGAGEfCcbG4FyhAh2gQWBXAEDGIENhn4EgiKBD?=
 =?us-ascii?q?IFaGAZQj1JIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQwbBwWBHYEug?=
 =?us-ascii?q?QKEbiMfAzl/gS91SnctaQESF4EmghSBOgKBAwMLGA1IESw3FBkEPm4HjWkjg?=
 =?us-ascii?q?kABgQ0BBySVPZBEgiGhDwoog3WMIZU6GjOqbAuYfY4KhRyRNIRpgWg8gSgfC?=
 =?us-ascii?q?wdwFYJuAQEBMQlKGQ+OOIVqgxQuyEUnMgIBAQcyAQEHAgcOAwuBaJAAgX4BA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:M0TxOq/ox6QuleA6qq9GDrUD0X+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 2scW2qPbv3YZmH1KN8kbdzgp0xTvZCAytZnQFQ5q3xEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsbThOs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kdOqYHx/tcJl0Vr
 /NHMQENdSKe2d+flefTpulE3qzPLeHxN48Z/3UlxjbDALN+G9bIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZOEwn1lQ/UPrSmM+khXT7ejxJoXqepLE85C7YywkZPL3FbYOOJIzQGZ4E9qqej
 jrezj7HJCEADe2a9AWm9FCDgPSXxCyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjJCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:8tnesasrwnkG2mt1kV6h6Fc47skDrtV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1MmZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWIeeAa2SS9fyKgzWQIpIH3MSN9ryuiKP1yndgShwvVoRbhj0Jczpy1iZNNXJ77V1TLu
 vl2vZ6
X-Talos-CUID: 9a23:qR64g25t14byi2Kuqtss30k/Bf04WVrhly3ffFaJCX1bVeOoYArF
X-Talos-MUID: 9a23:vb/3VQti6X5LgTdl9s2n3ClTbvlO076XOUUwrrYAmeaCLnQpNGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,178,1779148800"; 
   d="scan'208";a="513682439"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 22 Jul 2026 09:54:33 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id B1DA4180007C9;
	Wed, 22 Jul 2026 09:54:33 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 58F1FCAB20F; Wed, 22 Jul 2026 02:54:33 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 4/4] gawk: Fix CVE-2026-40553
Date: Wed, 22 Jul 2026 02:54:30 -0700
Message-Id: <20260722095430.1416791-4-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260722095430.1416791-1-dkelaiya@cisco.com>
References: <20260722095430.1416791-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 09:54:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241638

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [3], using the
commit shown in [1]. It also applies the corrective follow-up [2],
which fixes the snprintf() truncation boundary check. Both commits
are included in gawk 5.4.1, identified as the fixed release in [4].

[1] https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=cca0366144336b49aaa7d5d949966ce8e2c70843
[2] https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=bfa2e4b890a44100a99d26b54af385479528b12e
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-40553
[4] https://cert.pl/en/posts/2026/07/CVE-2026-40467/

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../gawk/gawk/CVE-2026-40553_p1.patch         | 50 +++++++++++++++++++
 .../gawk/gawk/CVE-2026-40553_p2.patch         | 44 ++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.4.0.bb      |  2 +
 3 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40553_p1.patch
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40553_p2.patch

diff --git a/meta/recipes-extended/gawk/gawk/CVE-2026-40553_p1.patch b/meta/recipes-extended/gawk/gawk/CVE-2026-40553_p1.patch
new file mode 100644
index 0000000000..81e2efd6b9
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40553_p1.patch
@@ -0,0 +1,50 @@
+From 6e7695c994aa45c0f7e9f8b80aa6f99717bbaf60 Mon Sep 17 00:00:00 2001
+From: "Arnold D. Robbins" <arnold@skeeve.com>
+Date: Wed, 15 Apr 2026 09:39:02 +0300
+Subject: [PATCH] Avoid buffer overflow in extension/readdir.c.
+
+CVE: CVE-2026-40553
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=cca0366144336b49aaa7d5d949966ce8e2c70843]
+
+(cherry picked from commit cca0366144336b49aaa7d5d949966ce8e2c70843)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ extension/ChangeLog | 6 ++++++
+ extension/readdir.c | 6 +++++-
+ 2 files changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/extension/ChangeLog b/extension/ChangeLog
+index b11e83ac..6f88eb19 100644
+--- a/extension/ChangeLog
++++ b/extension/ChangeLog
+@@ -1,3 +1,9 @@
++2026-04-15         Arnold D. Robbins     <arnold@skeeve.com>
++
++	* readdir.c (ftype): Use snprintf() to check for buffer
++	overflow in the file name before calling stat(). Thanks to
++	Marcin Wyczechowski <mwyczechowski@afine.com> for the report.
++
+ 2026-02-22         Arnold D. Robbins     <arnold@skeeve.com>
+ 
+ 	* 5.4.0: Release tar ball made.
+diff --git a/extension/readdir.c b/extension/readdir.c
+index f876e168..5bbee261 100644
+--- a/extension/readdir.c
++++ b/extension/readdir.c
+@@ -118,8 +118,12 @@ ftype(struct dirent *entry, const char *dirname)
+ #endif
+ 	char fname[PATH_MAX];
+ 	struct stat sbuf;
++	int count;
++
++	count = snprintf(fname, sizeof(fname), "%s/%s", dirname, entry->d_name);
++	if (count > sizeof(fname))
++		return "u";	// buffer overflow. skip stat() call.
+ 
+-	sprintf(fname, "%s/%s", dirname, entry->d_name);
+ 	if (stat(fname, &sbuf) == 0) {
+ 		if (S_ISBLK(sbuf.st_mode))
+ 			return "b";
+-- 
+2.53.0
+
diff --git a/meta/recipes-extended/gawk/gawk/CVE-2026-40553_p2.patch b/meta/recipes-extended/gawk/gawk/CVE-2026-40553_p2.patch
new file mode 100644
index 0000000000..84bfdc5418
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40553_p2.patch
@@ -0,0 +1,44 @@
+From a98440e83cb19b042958a179293bd637c400a35b Mon Sep 17 00:00:00 2001
+From: "Arnold D. Robbins" <arnold@skeeve.com>
+Date: Fri, 17 Apr 2026 11:48:19 +0300
+Subject: [PATCH] Small fix in extension/readdir.c.
+
+CVE: CVE-2026-40553
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=bfa2e4b890a44100a99d26b54af385479528b12e]
+
+(cherry picked from commit bfa2e4b890a44100a99d26b54af385479528b12e)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ extension/ChangeLog | 5 +++++
+ extension/readdir.c | 2 +-
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/extension/ChangeLog b/extension/ChangeLog
+index 6f88eb19..9fe216e6 100644
+--- a/extension/ChangeLog
++++ b/extension/ChangeLog
+@@ -1,3 +1,8 @@
++2026-04-15         Arnold D. Robbins     <arnold@skeeve.com>
++
++	* readdir.c (ftype): Use >= in check of snprintf() return
++	value. Thanks to Andrew Schorr <aschorr@telemetry-investments.com>.
++
+ 2026-04-15         Arnold D. Robbins     <arnold@skeeve.com>
+ 
+ 	* readdir.c (ftype): Use snprintf() to check for buffer
+diff --git a/extension/readdir.c b/extension/readdir.c
+index 5bbee261..3cb31834 100644
+--- a/extension/readdir.c
++++ b/extension/readdir.c
+@@ -121,7 +121,7 @@ ftype(struct dirent *entry, const char *dirname)
+ 	int count;
+ 
+ 	count = snprintf(fname, sizeof(fname), "%s/%s", dirname, entry->d_name);
+-	if (count > sizeof(fname))
++	if (count >= sizeof(fname))
+ 		return "u";	// buffer overflow. skip stat() call.
+ 
+ 	if (stat(fname, &sbuf) == 0) {
+-- 
+2.53.0
+
diff --git a/meta/recipes-extended/gawk/gawk_5.4.0.bb b/meta/recipes-extended/gawk/gawk_5.4.0.bb
index a7c88224dd..f44d82b37c 100644
--- a/meta/recipes-extended/gawk/gawk_5.4.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.4.0.bb
@@ -31,6 +31,8 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.xz \
            file://CVE-2026-40467.patch \
            file://CVE-2026-40468.patch \
            file://CVE-2026-40469.patch \
+           file://CVE-2026-40553_p1.patch \
+           file://CVE-2026-40553_p2.patch \
            "
 
 SRC_URI[sha256sum] = "3dd430f0cd3b4428c6c3f6afc021b9cd3c1f8c93f7a688dc268ca428a90b4ac1"
-- 
2.35.6


