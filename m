Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC544CA0EFA
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 16:10:59 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.42757.1756138249635001535
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Aug 2025 09:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=cRE0bM/W;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20250825161047d5853a0de00b200bfe-dn2dgt@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250825161047d5853a0de00b200bfe
        for <openembedded-core@lists.openembedded.org>;
        Mon, 25 Aug 2025 18:10:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Qjt7fMl9AaGm4ikajQYK3Rm01sVzTrJ/cIjiyaHUIzo=;
 b=cRE0bM/WvwTSMXlYJ4b+tCm7g95d5oljJCOT08NdA2W2+GvNvTemDUjKXEOZTMap4zFgB3
 SkgD8Su+AEvISSy5t+j/wV3S1wGXBhUN3o49Zer6AKBDoRLXuiu+GyIaibSpZMjJG0wJGR0u
 Ws/eBtp2RyDk0bk/ECd+aXiYQdaQjoUvyx23kxbpaJrQnYcUzfQ2UryaGST7THOC5BvbyfSi
 qVJN+DMg+B+XWJaZFoixenDt6YkSqybVv9ztc+pS8d8BJ8F6ftisU1oYTwfhV9OS44a87B3g
 3dOFp2aqO4A2nUfDXF1KTLM+DDRR15so+4TIfpiTVIIKjctIvOWQHGMg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] ibarchive: patch regression of patch for CVE-2025-5918
Date: Mon, 25 Aug 2025 18:10:00 +0200
Message-Id: <20250825161000.2593497-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 16:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222413

From: Peter Marko <peter.marko@siemens.com>

Picked commit per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2025-5918

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...2025-5918.patch => CVE-2025-5918-01.patch} |  0
 .../libarchive/CVE-2025-5918-02.patch         | 51 +++++++++++++++++++
 .../libarchive/libarchive_3.6.2.bb            |  3 +-
 3 files changed, 53 insertions(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/libarchive/{CVE-2025-5918.patch => CVE-2025-5918-01.patch} (100%)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5918-02.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-5918.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5918-01.patch
similarity index 100%
rename from meta/recipes-extended/libarchive/libarchive/CVE-2025-5918.patch
rename to meta/recipes-extended/libarchive/libarchive/CVE-2025-5918-01.patch
diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-5918-02.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5918-02.patch
new file mode 100644
index 0000000000..223cd01c0d
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5918-02.patch
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
+@@ -133,7 +133,7 @@ FILE_skip(struct archive *a, void *client_data, int64_t request)
+ #else
+ 	long skip = (long)request;
+ #endif
+-	int64_t old_offset, new_offset;
++	int64_t old_offset, new_offset = -1;
+ 	int skip_bits = sizeof(skip) * 8 - 1;
+ 
+ 	(void)a; /* UNUSED */
+@@ -171,11 +171,14 @@ FILE_skip(struct archive *a, void *client_data, int64_t request)
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
diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
index bfd4df8ad1..65b4649147 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -41,7 +41,8 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://CVE-2025-5917.patch \
            file://0001-FILE-seeking-support-2539.patch \
            file://0001-Improve-lseek-handling-2564.patch \
-           file://CVE-2025-5918.patch \
+           file://CVE-2025-5918-01.patch \
+           file://CVE-2025-5918-02.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 

