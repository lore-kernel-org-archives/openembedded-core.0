Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2206.1795642743104947585
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 13:39:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=aeyPdsQb;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-2026112521390168002d13cf00020737-ns1szy@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 2026112521390168002d13cf00020737
        for <openembedded-core@lists.openembedded.org>;
        Wed, 25 Nov 2026 22:39:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=a4uUw+r33TDbqiDYiXqTOc1UrujwxQqcjo7k2N3N/C0=;
 b=aeyPdsQbrnnIvVHYW+b+wzPvS6qGWR4LpjJ8RCc3qTnuYJcHZHrgRFUXyg2TAcObMeOqt/
 UAZj1AOkWVrQHbuEk3kLoc2Gb/MBpXMqFigqBmwK1Ebx1TUPbF7M2LD7gwgw4U4JNx48hJ+H
 /k52af4imXYywbMuzV+aD7rLnIwU/fQx2wJVkYK1Uvshp+Qc3h8bOMBcMnDuglhe8cJn854Q
 yPpcSgwAPtjU1ENLPMb0lYLO6wS9CCYKQs6pJm34X602OWZH3eDOwMzlq5rSMzSyU7C4OkZB
 R1imIpmHykGfD9yuDQQiHfAvKIcQLnFgI+CXp2AukcV7yPqHVO1NbjEQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH 1/3] zip: fix a buffer overflow detected issue
Date: Wed, 25 Nov 2026 22:38:50 +0100
Message-ID: <20261125213850.3585122-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 21:39:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251265
Content-Type: text/plain; charset="utf-8"

From: Ming Liu <liu.ming50@gmail.com>

A "buffer overflow detected" issue was observed as follows:
| *** buffer overflow detected ***: terminated
|
| zip error: Interrupted (aborting)

This issue is addressed by:
https://bugzilla.redhat.com/show_bug.cgi?id=2165653

Port the fix.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(From OE-Core rev: e2f3eeaedc0ea896f5f5b23f756056331b1647cf)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...fix-a-buffer-overflow-detected-issue.patch | 38 +++++++++++++++++++
 meta/recipes-extended/zip/zip_3.0.bb          |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-extended/zip/zip-3.0/0001-fileio.c-fix-a-buffer-overflow-detected-issue.patch

diff --git a/meta/recipes-extended/zip/zip-3.0/0001-fileio.c-fix-a-buffer-overflow-detected-issue.patch b/meta/recipes-extended/zip/zip-3.0/0001-fileio.c-fix-a-buffer-overflow-detected-issue.patch
new file mode 100644
index 00000000000..d760dfcec5a
--- /dev/null
+++ b/meta/recipes-extended/zip/zip-3.0/0001-fileio.c-fix-a-buffer-overflow-detected-issue.patch
@@ -0,0 +1,38 @@
+From 23b4ed82bff20c737fe2e95d5b035e92a9522ca2 Mon Sep 17 00:00:00 2001
+From: Ming Liu <liu.ming50@gmail.com>
+Date: Thu, 15 May 2025 13:58:45 +0200
+Subject: [PATCH] fileio.c: fix a buffer overflow detected issue
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fix a following issue:
+| *** buffer overflow detected ***: terminated
+|
+| zip error: Interrupted (aborting)
+
+Reference: https://bugzilla.redhat.com/show_bug.cgi?id=2165653
+
+Upstream-Status: Inactive-Upstream [the fix is from Redhat but not the official project]
+
+Signed-off-by: Ming Liu <liu.ming50@gmail.com>
+---
+ fileio.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/fileio.c b/fileio.c
+index 1847e62..5a2959d 100644
+--- a/fileio.c
++++ b/fileio.c
+@@ -3502,7 +3502,7 @@ zwchar *local_to_wide_string(local_string)
+   if ((wc_string = (wchar_t *)malloc((wsize + 1) * sizeof(wchar_t))) == NULL) {
+     ZIPERR(ZE_MEM, "local_to_wide_string");
+   }
+-  wsize = mbstowcs(wc_string, local_string, strlen(local_string) + 1);
++  wsize = mbstowcs(wc_string, local_string, wsize + 1);
+   wc_string[wsize] = (wchar_t) 0;
+ 
+   /* in case wchar_t is not zwchar */
+-- 
+2.43.0
+
diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index 58144baa149..9ef9a9074f9 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -19,6 +19,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/Zip%203.x%20%28latest%29/3.0/zip30.tar.
            file://0001-configure-Specify-correct-function-signatures-and-de.patch \
            file://0001-unix-configure-use-_Static_assert-to-do-correct-dete.patch \
            file://0001-configure-Include-dirent.h-for-closedir-opendir-APIs.patch \
+           file://0001-fileio.c-fix-a-buffer-overflow-detected-issue.patch \
            "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
