Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A9F2D277D9
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 13:06:44 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8179.1768050392430800780
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Jan 2026 05:06:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=eqLeoo2T;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20260110130629c0b07380a300020725-pw0q7j@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260110130629c0b07380a300020725
        for <openembedded-core@lists.openembedded.org>;
        Sat, 10 Jan 2026 14:06:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=B+BmVi/RSlIEI/gBVyPXr8DdQYZYPJUzvhp9ThsCz5U=;
 b=eqLeoo2TQTfQbBJqLLmKi07qnso+9lyKUBCnS8OwzJmJ6f4epa8/cyyH9L0e8dAb6eBDoB
 iQOn5zr2Zi2uo1PVVyJabGHGnNC7MdyEFaA7HuqKSvrkdR4Q4WBKFuG3FmcRbM5/WHkr/EqG
 L0Q1vzzKobz/IKLtN1i8Cp1OU0K3+Z0r9Tfrb4/OFHOg0LI1Y31MhYkPBckpT53h8gzapJBv
 wZLa59yqtnVGC+RwCaf5PXv++WV024iODzY1WhOGenBCY+KAUf3vIss7rjeIYZo9nsuoBxvt
 Vm/EKD14qAuDz/PphOfiG2TlFkY1qjYs9EdVaeDQEp0Yjy4/FO4Ae89Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] libarchive: fix CVE-2025-60753 regression
Date: Sat, 10 Jan 2026 14:06:19 +0100
Message-Id: <20260110130619.1260392-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Jan 2026 13:06:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229149

From: Peter Marko <peter.marko@siemens.com>

Pick patch from PR mentioned in v3.8.5 release notes.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...25-60753.patch => CVE-2025-60753-01.patch} |  0
 .../libarchive/CVE-2025-60753-02.patch        | 46 +++++++++++++++++++
 .../libarchive/libarchive_3.7.9.bb            |  3 +-
 3 files changed, 48 insertions(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/libarchive/{CVE-2025-60753.patch => CVE-2025-60753-01.patch} (100%)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-60753-02.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-60753.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-60753-01.patch
similarity index 100%
rename from meta/recipes-extended/libarchive/libarchive/CVE-2025-60753.patch
rename to meta/recipes-extended/libarchive/libarchive/CVE-2025-60753-01.patch
diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-60753-02.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-60753-02.patch
new file mode 100644
index 00000000000..637162b8946
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2025-60753-02.patch
@@ -0,0 +1,46 @@
+From cfb02de558d843dc5355c4aa2aeb4af49f88bdb9 Mon Sep 17 00:00:00 2001
+From: Martin Matuska <martin@matuska.de>
+Date: Mon, 8 Dec 2025 21:40:46 +0100
+Subject: [PATCH] tar: fix off-bounds read resulting from #2787 (3150539ed)
+
+CVE: CVE-2025-60753
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/cfb02de558d843dc5355c4aa2aeb4af49f88bdb9]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ tar/subst.c | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/tar/subst.c b/tar/subst.c
+index a466f653..53497ad0 100644
+--- a/tar/subst.c
++++ b/tar/subst.c
+@@ -237,7 +237,7 @@ apply_substitution(struct bsdtar *bsdtar, const char *name, char **result,
+ 
+ 		char isEnd = 0;
+ 		do {
+-            isEnd = *name == '\0';
++			isEnd = *name == '\0';
+ 			if (regexec(&rule->re, name, 10, matches, 0))
+ 				break;
+ 
+@@ -293,13 +293,13 @@ apply_substitution(struct bsdtar *bsdtar, const char *name, char **result,
+ 
+ 			realloc_strcat(result, rule->result + j);
+ 			if (matches[0].rm_eo > 0) {
+-                name += matches[0].rm_eo;
+-            } else {
+-                // We skip a character because the match is 0-length
+-                // so we need to add it to the output
+-                realloc_strncat(result, name, 1);
+-                name += 1;
+-            }
++				name += matches[0].rm_eo;
++			} else if (!isEnd) {
++				// We skip a character because the match is 0-length
++				// so we need to add it to the output
++				realloc_strncat(result, name, 1);
++				name += 1;
++			}
+ 		} while (rule->global && !isEnd); // Testing one step after because sed et al. run 0-length patterns a last time on the empty string at the end
+ 	}
+ 
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
index 86ba53aaf2a..b62c3d69b95 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -42,7 +42,8 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://0001-Merge-pull-request-2749-from-KlaraSystems-des-tempdi.patch \
            file://0001-Merge-pull-request-2753-from-KlaraSystems-des-temp-f.patch \
            file://0001-Merge-pull-request-2768-from-Commandoss-master.patch \
-           file://CVE-2025-60753.patch \
+           file://CVE-2025-60753-01.patch \
+           file://CVE-2025-60753-02.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 

