Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FB35C433FE
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 17:03:46 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.12847.1634663024758487744
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 10:03:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=PGRBXPET;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1634663025;
  x=1666199025;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jUG3kqR5dNUtIXiMhig3gdXOAtN5USTRag9SKEXmAVI=;
  b=PGRBXPETzZtpbBmxk89UBaPoXtx+/1lEjQyiS+Fj+QYA/vEP6jeklYm0
   0h9ZgqCkui2E+vsleyWiTF6gjz6JP3EzcBSRk6tItWwOJ7/m4lA8ziWCQ
   uNR8YUVa+lJmEUByf3xneEedfVbAGYRKWhj2kbwebyv+B9Ek5ocKMKJJX
   HWWKmWc+40xyBlgf0x4/LJ0JgMeYjvXJr2FSQSZFWT+kZAVAeWwmJGuIN
   e7bmz5R9E9Ys8JKsXcDZZvyJqd8Uxe4nHIWUKgdcIuTiCApjszOqWgXj1
   V53l8q2zL5BFkTKhiHuyouuYuel7RH04+mljIvNDkCECxhBbXNljOZj1n
   w==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] externalsrc.bbclass: Allow externalsrc to be extended with
 extra classes
Date: Tue, 19 Oct 2021 19:03:21 +0200
Message-ID: <20211019170321.18270-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 17:03:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157190

The EXTERNALSRC_EXTENSIONS variable holds a list of additional classes
that will be inherited when externalsrc is inherited.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

We have had a local copy of this class for a long time since we need
to make it suppport a local class when checking BBCLASSEXTEND. And
now we wanted to add some more functionality that should be active
when externalsrc is in use. So instead of forking the class even
more, I thought it would be better to make the upstream class
extendable. The solution was inspired by USERADDEXTENSION in
useradd.bbclass.

 meta/classes/externalsrc.bbclass | 5 +++++
 meta/conf/documentation.conf     | 1 +
 2 files changed, 6 insertions(+)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index abfe24bace..488d75760f 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -265,3 +265,8 @@ def srctree_configure_hash_files(d):
     return ' '.join(out_items)
 
 EXPORT_FUNCTIONS do_buildclean
+
+# Use the following to extend externalsrc with custom functionality
+EXTERNALSRC_EXTENSIONS ??= ""
+
+inherit ${EXTERNALSRC_EXTENSIONS}
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 80ad8e10d5..6d5b734b02 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -160,6 +160,7 @@ EXTENDPE[doc] = "Used with file and pathnames to create a prefix for a recipe's
 EXTENDPKGV[doc] = "The full package version specification as it appears on the final packages produced by a recipe."
 EXTERNALSRC[doc] = "If externalsrc.bbclass is inherited, this variable points to the source tree, which is outside of the OpenEmbedded build system."
 EXTERNALSRC_BUILD[doc] = "If externalsrc.bbclass is inherited, this variable points to the directory in which the recipe's source code is built, which is outside of the OpenEmbedded build system."
+EXTERNALSRC_EXTENSIONS[doc] = "A list of additional classes that will be inherited when externalsrc is inherited."
 EXTRA_IMAGE_FEATURES[doc] = "The list of additional features to include in an image. Configure this variable in the conf/local.conf file in the Build Directory."
 EXTRA_IMAGEDEPENDS[doc] = "A list of recipes to build that do not provide packages for installing into the root filesystem. Use this variable to list recipes that are required to build the final image, but not needed in the root filesystem."
 EXTRA_OECMAKE[doc] = "Additional cmake options."

