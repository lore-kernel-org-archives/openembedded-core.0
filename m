Return-Path: <junjie.cao@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF4E4C5DF97
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 02:23:42 +0000 (UTC)
Received: from mta0.migadu.com (mta0.migadu.com [91.218.175.104])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8457.1787538213511796482
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 19:23:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.dev header.s=key1 header.b=siSW86hx;
 spf=pass (domain: linux.dev, ip: 91.218.175.104, mailfrom: junjie.cao@linux.dev)
X-Envelope-To: openembedded-core@lists.openembedded.org
DKIM-Signature: a=rsa-sha256; bh=YuzcV3cpAkWBYxsF++ENJKXzEd/h+DU4NZgBxOQCE3g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787538211; v=1; x=1788143011;
 b=siSW86hxVNC9AXhMD7LChTQQPyhNx2C3LJdbXAJF6/YiG9nwOq+yEro6FsE+TmGe/P6z+c/5
 xjSd9csU8TG843xOL0Q01LnhMv6dWbnojVm6IOATOS9ju0CpNWOcsULq1JCTd8l8aKS6rf1QvaN
 N3avmHa3sHoWGn/poW343fPU=
X-Envelope-To: openembedded-core@lists.openembedded.org
Received: from localhost (2408:8806:52:f8ea:5de6:8d95:1672:70f3)
	by smtp.migadu.com with ESMTPS id 71a6d3be8ebede7c;
	Mon, 24 Aug 2026 02:23:31 +0000
X-Mizu-Trace-ID: 71a6d3be8ebede7c
X-Migadu-Flow: FLOW_OUT
From: Junjie Cao <junjie.cao@linux.dev>
To: openembedded-core@lists.openembedded.org
Cc: paul@pbarker.dev
Subject: [OE-core][PATCH v4 8/8] cve-exclusions: set status for CVE-2023-6240
Date: Sun, 23 Aug 2026 23:21:23 -0500
Message-ID: <20260824042123.1456876-9-junjie.cao@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824042123.1456876-1-junjie.cao@linux.dev>
References: <20260824042123.1456876-1-junjie.cao@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 02:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244054

"Marvin" is Hubert Kario's Bleichenbacher-style timing oracle research:

  https://people.redhat.com/~hkario/marvin/

The affected code is the generic software RSA PKCS#1 v1.5 unpadding in
crypto/rsa-pkcs1pad.c. pkcs1pad_decrypt_complete() has three
secret-dependent early exits (leading zero byte, block type, minimum
padding length) and a loop whose trip count depends on the position of
the separator, so the time taken reveals padding validity. There is no
constant-time unpadding or implicit-rejection fallback in the tree.

Red Hat classifies it CWE-203 and has shipped fixes only in RHEL errata
(RHSA-2024:2758, RHSA-2024:3618 and others); the bugzilla is still NEW.
Ubuntu records "appears unfixed in upstream as of 2024.08.24" and
Debian lists src:linux vulnerable in all suites:

  https://access.redhat.com/security/cve/CVE-2023-6240
  https://ubuntu.com/security/CVE-2023-6240
  https://security-tracker.debian.org/tracker/CVE-2023-6240

CC: Paul Barker <paul@pbarker.dev>
AI-Generated: Uses Claude (claude-opus-5)
Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
---
v4:
- drop the practical-exposure paragraph; use the review's comment and
  status wording
- quote Ubuntu's note verbatim

v3: https://lore.kernel.org/openembedded-core/20260812072842.1176341-1-junjie.cao@linux.dev/

 meta/recipes-kernel/linux/cve-exclusion.inc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-kernel/linux/cve-exclusion.inc
index 4729191a..8714173c 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -250,3 +250,13 @@ CVE_STATUS[CVE-2023-3397] = "unpatched: Proposed fix was withdrawn"
 # https://ubuntu.com/security/CVE-2023-6238
 # https://lore.kernel.org/linux-nvme/20231016060519.231880-1-joshi.k@samsung.com/
 CVE_STATUS[CVE-2023-6238] = "unpatched: Proposed fix was not merged"
+
+# Triaged August 2026 - "Marvin" attack, Red Hat reports this fixed but the
+# exact patch is unidentified (see RHSA-2024:2758, RHSA-2024:3618 & others).
+# Unfixed in Debian, "Needs evaluation" in Ubuntu.
+# https://people.redhat.com/~hkario/marvin/
+# https://access.redhat.com/security/cve/cve-2023-6240
+# https://security-tracker.debian.org/tracker/CVE-2023-6240
+# https://ubuntu.com/security/CVE-2023-6240
+CVE_STATUS[CVE-2023-6240] = "unpatched: Fixed in RHEL but patch not identified \
+publicly"
-- 
2.43.0


