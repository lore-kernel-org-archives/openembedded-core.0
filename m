Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9157CC04A6A
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 20:23:28 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.28128.1691699004691978405
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 13:23:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=BofGuUmX;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202308102023202465585d5a875cb709-losbaz@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202308102023202465585d5a875cb709
        for <openembedded-core@lists.openembedded.org>;
        Thu, 10 Aug 2023 22:23:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=YI4mG/6F3T4sbS80uKjw1yFH4xrNlbGyuGlclEU4l1c=;
 b=BofGuUmX5+mWrIWTfpx2nxgF1HB+51BswHjK4esTGxUsAGCmWUmjUKgg3HPJUjKJB5Tr62
 lRDjsi/6A+ewZev/L4kZ5/MvX2MVjZTE8Hhbt32WjuTh+WhRW0qoYBM1QopAji3VRG1tRzNC
 YkNQZ5Hg9W7jpQu2vj0lNBNvR1Vs4=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][dunfell][PATCH] procps: patch CVE-2023-4016
Date: Thu, 10 Aug 2023 22:22:37 +0200
Message-Id: <20230810202237.2818113-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 20:23:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185825

From: Peter Marko <peter.marko@siemens.com>

Backport patch from upstream master.

There were three changes needed to apply the patch:
* move NEWS change to start of the file
* change file location from src/ps/ to ps/
* change xmalloc/xcmalloc to malloc/cmalloc

The x*malloc functions were introduced in commit in future version.
https://gitlab.com/procps-ng/procps/-/commit/584028dbe513127ef68c55aa631480454bcc26bf
They call the original function plus additionally throw error when out of memory.
https://gitlab.com/procps-ng/procps/-/blob/v4.0.3/local/xalloc.h?ref_type=tags
So this replacement is correct in context of our version.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../procps/procps/CVE-2023-4016.patch         | 85 +++++++++++++++++++
 meta/recipes-extended/procps/procps_3.3.16.bb |  1 +
 2 files changed, 86 insertions(+)
 create mode 100644 meta/recipes-extended/procps/procps/CVE-2023-4016.patch

diff --git a/meta/recipes-extended/procps/procps/CVE-2023-4016.patch b/meta/recipes-extended/procps/procps/CVE-2023-4016.patch
new file mode 100644
index 0000000000..50582a8649
--- /dev/null
+++ b/meta/recipes-extended/procps/procps/CVE-2023-4016.patch
@@ -0,0 +1,85 @@
+From 2c933ecba3bb1d3041a5a7a53a7b4078a6003413 Mon Sep 17 00:00:00 2001
+From: Craig Small <csmall@dropbear.xyz>
+Date: Thu, 10 Aug 2023 21:18:38 +1000
+Subject: [PATCH] ps: Fix possible buffer overflow in -C option
+
+ps allocates memory using malloc(length of arg * len of struct).
+In certain strange circumstances, the arg length could be very large
+and the multiplecation will overflow, allocating a small amount of
+memory.
+
+Subsequent strncpy() will then write into unallocated memory.
+The fix is to use calloc. It's slower but this is a one-time
+allocation. Other malloc(x * y) calls have also been replaced
+by calloc(x, y)
+
+References:
+ https://www.freelists.org/post/procps/ps-buffer-overflow-CVE-20234016
+ https://nvd.nist.gov/vuln/detail/CVE-2023-4016
+ https://gitlab.com/procps-ng/procps/-/issues/297
+ https://bugs.debian.org/1042887
+
+Signed-off-by: Craig Small <csmall@dropbear.xyz>
+
+CVE: CVE-2023-4016
+Upstream-Status: Backport [https://gitlab.com/procps-ng/procps/-/commit/2c933ecba3bb1d3041a5a7a53a7b4078a6003413]
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+
+---
+ NEWS        | 1 +
+ ps/parser.c | 8 ++++----
+ 2 files changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/NEWS b/NEWS
+index b9509734..64fa3da8 100644
+--- a/NEWS
++++ b/NEWS
+@@ -1,3 +1,5 @@
++  * ps: Fix buffer overflow in -C option CVE-2023-4016     Debian #1042887, issue #297
++
+ procps-ng-3.3.16
+ ----------------
+   * library: Increment to 8:2:0
+diff --git a/ps/parser.c b/ps/parser.c
+index 248aa741..15873dfa 100644
+--- a/ps/parser.c
++++ b/ps/parser.c
+@@ -184,7 +184,6 @@ static const char *parse_list(const char *arg, const char *(*parse_fn)(char *, s
+   const char *err;       /* error code that could or did happen */
+   /*** prepare to operate ***/
+   node = malloc(sizeof(selection_node));
+-  node->u = malloc(strlen(arg)*sizeof(sel_union)); /* waste is insignificant */
+   node->n = 0;
+   buf = strdup(arg);
+   /*** sanity check and count items ***/
+@@ -205,6 +204,7 @@ static const char *parse_list(const char *arg, const char *(*parse_fn)(char *, s
+   } while (*++walk);
+   if(need_item) goto parse_error;
+   node->n = items;
++  node->u = calloc(items, sizeof(sel_union));
+   /*** actually parse the list ***/
+   walk = buf;
+   while(items--){
+@@ -1031,15 +1031,15 @@ static const char *parse_trailing_pids(void){
+   thisarg = ps_argc - 1;   /* we must be at the end now */
+ 
+   pidnode = malloc(sizeof(selection_node));
+-  pidnode->u = malloc(i*sizeof(sel_union)); /* waste is insignificant */
++  pidnode->u = calloc(i, sizeof(sel_union)); /* waste is insignificant */
+   pidnode->n = 0;
+ 
+   grpnode = malloc(sizeof(selection_node));
+-  grpnode->u = malloc(i*sizeof(sel_union)); /* waste is insignificant */
++  grpnode->u = calloc(i,sizeof(sel_union)); /* waste is insignificant */
+   grpnode->n = 0;
+ 
+   sidnode = malloc(sizeof(selection_node));
+-  sidnode->u = malloc(i*sizeof(sel_union)); /* waste is insignificant */
++  sidnode->u = calloc(i, sizeof(sel_union)); /* waste is insignificant */
+   sidnode->n = 0;
+ 
+   while(i--){
+-- 
+GitLab
+
diff --git a/meta/recipes-extended/procps/procps_3.3.16.bb b/meta/recipes-extended/procps/procps_3.3.16.bb
index 3a8289b359..ac27734a6f 100644
--- a/meta/recipes-extended/procps/procps_3.3.16.bb
+++ b/meta/recipes-extended/procps/procps_3.3.16.bb
@@ -14,6 +14,7 @@ inherit autotools gettext pkgconfig update-alternatives
 
 SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https;branch=master \
            file://sysctl.conf \
+           file://CVE-2023-4016.patch \
            "
 SRCREV = "59c88e18f29000ceaf7e5f98181b07be443cf12f"
 
-- 
2.30.2


