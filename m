Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBFD7CA0FE7
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 16:10:49 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.42754.1756138244035198002
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Aug 2025 09:10:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Nn81N2C6;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202508251610393f04199b1c80919fbd-_p9qmd@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202508251610393f04199b1c80919fbd
        for <openembedded-core@lists.openembedded.org>;
        Mon, 25 Aug 2025 18:10:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=nbUBebIqnt/dS9pqqnaRNWWKuKtq+FB/OnHp0iGP/JA=;
 b=Nn81N2C6yagkgf/qAMKGV0HkJPcf1gcYx9zgr6nleUtgRsDttMElcrBumPXx171PSYByyk
 URDo7Rf/Bxt6nS9MlpEPwpHWmOmSBoVUsYSETUkmcM1ObwXz+5mrzAPNwWh8P0ci96YUyvup
 ez2ELWEBRIqDIY+c+3WsPrFyt9nrt+P8E8FnTTWtlKNsIS9EwhJmEJZG+m5GUSbwUgDOMy+s
 9ZolCvmB0/DCRosVm6s7APo1iiW1aqgrxrUhlIrzYAOOerQQ2G5MaosNzBspQXh7wOYJbYdr
 LElbgn5QSMtX3ES3qGl52lXnnyWGdKB8yMjTaBCMwUVxzqniNdz4qb4A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] libarchive: patch regression of patch for CVE-2025-5918
Date: Mon, 25 Aug 2025 18:09:52 +0200
Message-Id: <20250825160952.2586119-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 16:10:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222412

From: Peter Marko <peter.marko@siemens.com>

Picked commit per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2025-5918

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libarchive/CVE-2025-5918-0003.patch       | 51 +++++++++++++++++++
 .../libarchive/libarchive_3.7.9.bb            |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5918-0003.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-5918-0003.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5918-0003.patch
new file mode 100644
index 0000000000..bc6903d41c
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5918-0003.patch
@@ -0,0 +1,51 @@
+From 51b4c35bb38b7df4af24de7f103863dd79129b01 Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <tobias@stoeckmann.org>
+Date: Tue, 27 May 2025 17:09:12 +0200
+Subject: [PATCH] Fix FILE_skip regression
+
+The fseek* family of functions return 0 on success, not the new offset.
+This is only true for lseek.
+
+Fixes https://github.com/libarchive/libarchive/issues/2641
+Fixes dcbf1e0ededa95849f098d154a25876ed5754bcf
+
+Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
+
+CVE: CVE-2025-5918
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/51b4c35bb38b7df4af24de7f103863dd79129b01]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libarchive/archive_read_open_file.c | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/libarchive/archive_read_open_file.c b/libarchive/archive_read_open_file.c
+index 6ed18a0c..742923ab 100644
+--- a/libarchive/archive_read_open_file.c
++++ b/libarchive/archive_read_open_file.c
+@@ -132,7 +132,7 @@ FILE_skip(struct archive *a, void *client_data, int64_t request)
+ #else
+ 	long skip = (long)request;
+ #endif
+-	int64_t old_offset, new_offset;
++	int64_t old_offset, new_offset = -1;
+ 	int skip_bits = sizeof(skip) * 8 - 1;
+ 
+ 	(void)a; /* UNUSED */
+@@ -170,11 +170,14 @@ FILE_skip(struct archive *a, void *client_data, int64_t request)
+ #ifdef __ANDROID__
+ 			new_offset = lseek(fileno(mine->f), skip, SEEK_CUR);
+ #elif HAVE__FSEEKI64
+-			new_offset = _fseeki64(mine->f, skip, SEEK_CUR);
++			if (_fseeki64(mine->f, skip, SEEK_CUR) == 0)
++				new_offset = _ftelli64(mine->f);
+ #elif HAVE_FSEEKO
+-			new_offset = fseeko(mine->f, skip, SEEK_CUR);
++			if (fseeko(mine->f, skip, SEEK_CUR) == 0)
++				new_offset = ftello(mine->f);
+ #else
+-			new_offset = fseek(mine->f, skip, SEEK_CUR);
++			if (fseek(mine->f, skip, SEEK_CUR) == 0)
++				new_offset = ftell(mine->f);
+ #endif
+ 			if (new_offset >= 0)
+ 				return (new_offset - old_offset);
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
index f08673ea3b..f4b1be2337 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -37,6 +37,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://CVE-2025-5917.patch \
            file://CVE-2025-5918-0001.patch \
            file://CVE-2025-5918-0002.patch \
+           file://CVE-2025-5918-0003.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 

