Return-Path: <staffan.ryden@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73066EB64DC
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 11:03:35 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.10285.1689851010944878205
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 04:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=otbv0JeH;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: staffan.ryden@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1689851011;
  x=1721387011;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WerbdudgyCQUs4p4cjZJ4MkLMcAjKN+LSbHNwB0yqP0=;
  b=otbv0JeHyvwR4iGOExB32p84s8IXsUHtUxvry2UsiDJb3Z065ZFlaZpt
   SZIdOb3n0KC9yTollivvTpIktfxdSgMnjxJVSFUv69//2iWSWEp+gQ6/q
   SuJmE7vpEOtU3YR8Yv4uQIYWvzHLID3KlVePb43EKQJDYfzccLp7CYc/G
   ShitcJQSWJCJBboUGDJ9gwayi7zcTLPj6uXR8UTVZrXb5EIKHHoRNvbh1
   Mb/9fhuRbokhIRIZIcoTzJnrWtDtDJERy0c2BtC++Od5nmFhDc33r7gdd
   LKTZ/4cBEDGPYe1ouVr1SsjHfgFGgcJmZp+C+HSUZPdd16IDoiJF6lrrL
   Q==;
From: =?UTF-8?q?Staffan=20Ryd=C3=A9n?= <staffan.ryden@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] kernel: Fix path comparison in kernel staging dir symlinking
Date: Thu, 20 Jul 2023 13:02:56 +0200
Message-ID: <20230720110256.166442-1-staffan.ryden@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 11:03:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184632

Due to an oversight in the do_symlink_kernsrc function, the path
comparison between "S" and "STAGING_KERNEL_DIR" is broken. The code
obtains both variables, but modifies the local copy of "S" before
comparing them, causing the comparison to always return false.

This can cause the build to fail when the EXTERNALSRC flag is enabled,
since the code will try to create a symlink even if one already exists.

This patch resolves the issue by comparing the variables before they are
modified.

Signed-off-by: Staffan Rydén <staffan.ryden@axis.com>
---
 meta/classes-recipe/kernel.bbclass | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 2aedf3a31b..ea0ab491f0 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -181,13 +181,14 @@ do_unpack[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KERNEL_BUILD
 do_clean[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KERNEL_BUILDDIR}"
 python do_symlink_kernsrc () {
     s = d.getVar("S")
-    if s[-1] == '/':
-        # drop trailing slash, so that os.symlink(kernsrc, s) doesn't use s as directory name and fail
-        s=s[:-1]
     kernsrc = d.getVar("STAGING_KERNEL_DIR")
     if s != kernsrc:
         bb.utils.mkdirhier(kernsrc)
         bb.utils.remove(kernsrc, recurse=True)
+        if s[-1] == '/':
+            # drop trailing slash, so that os.symlink(kernsrc, s) doesn't use s as
+            # directory name and fail
+            s = s[:-1]
         if d.getVar("EXTERNALSRC"):
             # With EXTERNALSRC S will not be wiped so we can symlink to it
             os.symlink(s, kernsrc)
-- 
2.30.2


