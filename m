Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 671CCCA5FED
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 16:43:29 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.627.1791304999034768859
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 09:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=BDuPVASv;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202610061643164a17b7ee6c00020783-tizcbd@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202610061643164a17b7ee6c00020783
        for <openembedded-core@lists.openembedded.org>;
        Tue, 06 Oct 2026 18:43:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=aJO8CmhnNARYHSFOhEFxfdi0DIZSRTENSSeotATMaTs=;
 b=BDuPVASvSCr67RRF4oFsJqF8qEoBWRboCQrc0MXNDJPT7hFrqmmt9YNHIiH3mvxfY1pj/1
 YNrVwG8ZBBwF86Qiny117kQTws9FDIbeg5cup1tRwSxiZ+YiN/agKksgwynag2yrtqZuZb/l
 6PN656GhfOLaTZMwYtYs3GT4W4JjL0FgpClc+dPA6sHmpj2T698uhqq4XRVWVeNexuDWQSR1
 Q0lBhaWw6/upKpQtC+m6/Z57bBFF57mZCatBdtU59RxcAeVZsNiC+jQMiI2qV9RMttWaIH5d
 euGpq63YvUqza7SE6JID3ZRDSWAXHZhy3CKHxIOSweF46h8ADZa9dcfQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH] libsolv: patch CVE-2026-48863
Date: Tue,  6 Oct 2026 18:42:53 +0200
Message-ID: <20261006164253.110211-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 16:43:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247313

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-48863

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libsolv/libsolv/CVE-2026-48863.patch      | 25 +++++++++++++++++++
 .../libsolv/libsolv_0.7.28.bb                 |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-extended/libsolv/libsolv/CVE-2026-48863.patch

diff --git a/meta/recipes-extended/libsolv/libsolv/CVE-2026-48863.patch b/meta/recipes-extended/libsolv/libsolv/CVE-2026-48863.patch
new file mode 100644
index 00000000000..131d035b408
--- /dev/null
+++ b/meta/recipes-extended/libsolv/libsolv/CVE-2026-48863.patch
@@ -0,0 +1,25 @@
+From 44f8c085045b1f771641091bbb2b810d12cff9e8 Mon Sep 17 00:00:00 2001
+From: Michael Schroeder <mls@suse.de>
+Date: Tue, 26 May 2026 10:30:31 +0200
+Subject: [PATCH] Fix wrong variable being used in solv_pgpvrfy
+
+CVE: CVE-2026-48863
+Upstream-Status: Backport [https://github.com/openSUSE/libsolv/commit/44f8c085045b1f771641091bbb2b810d12cff9e8]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ ext/solv_pgpvrfy.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ext/solv_pgpvrfy.c b/ext/solv_pgpvrfy.c
+index 9f1bd72e..9358558b 100644
+--- a/ext/solv_pgpvrfy.c
++++ b/ext/solv_pgpvrfy.c
+@@ -589,7 +589,7 @@ solv_pgpvrfy(const unsigned char *pub, int publ, const unsigned char *sig, int s
+ 	if (rlen)
+ 	  memcpy(sigdata + 32 - rlen, r, rlen);
+ 	if (slen)
+-	  memcpy(sigdata + 64 - slen, s, rlen);
++	  memcpy(sigdata + 64 - slen, s, slen);
+ 	res = mped25519(pub + 1 + 10 + 2 + 1, sigdata, sig + 2, hashl);
+ 	break;
+       }
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.28.bb b/meta/recipes-extended/libsolv/libsolv_0.7.28.bb
index 4ad8a20e2f4..827b6210a69 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.28.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.28.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https \
            file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
            file://CVE-2026-9150.patch \
            file://CVE-2026-9149.patch \
+           file://CVE-2026-48863.patch \
 "
 
 SRCREV = "c8dbb3a77c86600ce09d4f80a504cf4e78a3c359"

