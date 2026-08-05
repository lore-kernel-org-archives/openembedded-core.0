Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82CFDC55ABA
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 19:55:57 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4180.1785959746009670948
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 12:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=YQ1vJbX3;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20260805195542105b43531a00020768-ysalef@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260805195542105b43531a00020768
        for <openembedded-core@lists.openembedded.org>;
        Wed, 05 Aug 2026 21:55:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=J7lKor4GJNF069yY5cvcWJgzhaVaYW5lHHZ5KXg+uDc=;
 b=YQ1vJbX3R/yagknoO9F67YkHvF3Vg3Dwi7Uh2039JwIURzkpcgNkXLNnIzdSpe+Kk00lhZ
 +Ny6gdMYLJaqVo2WGc6IFGA2tVY6pGKBE8fdprLdEBQuoDo8QQgMacr3ZtqhmTb+NVr3NVCc
 b3l90p84f6qoG92IkzKV2xEt97I3uktUXnRNqV5mukp1s07uCYhV0m7o29mL8LBU+A7GC6Qt
 q0GqcmTu+dQh1CfUzaNQOeFeuYY92QNnoIF2rLGJtfBbtt2ENuDtpePI7jx9Yv/5yTiiYpVQ
 rr9M2v5D7k75XTQSrdL3nrM2Fxoi1/fecWYr0dskxLMnMANwaSL3AnnA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] libsndfile1: patch CVE-2026-37555
Date: Wed,  5 Aug 2026 21:55:11 +0200
Message-ID: <20260805195511.1923188-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 19:55:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242891

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-37555

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libsndfile1/CVE-2026-37555.patch          | 44 +++++++++++++++++++
 .../libsndfile/libsndfile1_1.2.2.bb           |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2026-37555.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2026-37555.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2026-37555.patch
new file mode 100644
index 0000000000..bac8476ee8
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2026-37555.patch
@@ -0,0 +1,44 @@
+From c32c090ff9bb45e1dae637957c9c9b47b3967623 Mon Sep 17 00:00:00 2001
+From: Alb3e3 <74142887+Alb3e3@users.noreply.github.com>
+Date: Sat, 27 Jun 2026 14:34:16 +0200
+Subject: [PATCH] sds: avoid divide-by-zero in sds_byterate for zero-frame
+ files
+
+sds_read_header() sets psf->sf.frames directly from the file's 3-byte
+data-length field without a lower bound, so a crafted .sds file can
+leave psf->sf.frames == 0. SDS never sets psf->bytewidth, so
+sf_current_byterate() falls through to psf->byterate (sds_byterate),
+which computes
+
+    (psf->datalength * psf->sf.samplerate) / psf->sf.frames
+
+dividing by zero -> SIGFPE crash (denial of service) when an
+application calls the public sf_current_byterate() on such a file.
+
+Guard the division with psf->sf.frames > 0, returning -1 (the same
+'unknown' value already used for the write path) otherwise.
+
+Reproduced with a 21-byte crafted .sds (data-length field = 0) under
+AddressSanitizer: 'FPE ... in sds_byterate src/sds.c:761' before the
+fix; returns -1 cleanly after.
+
+CVE: CVE-2026-37555
+Upstream-Status: Backport [https://github.com/libsndfile/libsndfile/commit/c32c090ff9bb45e1dae637957c9c9b47b3967623]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/sds.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/sds.c b/src/sds.c
+index 2a0f164c..1070e653 100644
+--- a/src/sds.c
++++ b/src/sds.c
+@@ -757,7 +757,7 @@ sds_seek (SF_PRIVATE *psf, int mode, sf_count_t seek_from_start)
+ static int
+ sds_byterate (SF_PRIVATE * psf)
+ {
+-	if (psf->file.mode == SFM_READ)
++	if (psf->file.mode == SFM_READ && psf->sf.frames > 0)
+ 		return (psf->datalength * psf->sf.samplerate) / psf->sf.frames ;
+ 
+ 	return -1 ;
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
index c1fb522306..a26f57d7f4 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
@@ -14,6 +14,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libsndfile-${PV}.tar.xz \
            file://0001-Include-stdbool.h-instead-of-redefining-bool-true-an.patch \
            file://CVE-2025-56226-01.patch \
            file://CVE-2025-56226-02.patch \
+           file://CVE-2026-37555.patch \
           "
 GITHUB_BASE_URI = "https://github.com/libsndfile/libsndfile/releases/"
 

