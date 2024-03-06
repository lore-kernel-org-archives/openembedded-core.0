Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77CBEC54E63
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:10 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.14856.1709739722268115377
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jMftifh6;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a3122b70439so273629166b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739721; x=1710344521; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZboWBw14IJQsfnSVrEVmUgiLrSu1nFQwOaX4+Tqs5U=;
        b=jMftifh68HCb0PvnN8T2NwXw44eIKM8839Z5VgJtZSCFBUuSxX3msULV3n5gfgJd4r
         BnZWgSkbfisvEqLom6zbTy8uvj5b3U0ea7dMY4c+VMCWsB15O+Qoqqq3/ehQenQHLZxX
         33JzAPP/Eb+psdMKCzYtWzVpdxZ4Pxr1daWxVpuN5XUfwAgC2J/rVUGGCLfEiVLJidUX
         U2K69JRZnB0AFnJR2akefGimcodMdaSYPHO45KCGXGq/9dO7ariRFKkrg3hJimFNJgT9
         q1ojsD+3K2PeXHxbAa6PW7neNarvaWZpzMrCwE/KvLh9XllYw3B1XuG6OHi5h41eIxeM
         NV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739721; x=1710344521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SZboWBw14IJQsfnSVrEVmUgiLrSu1nFQwOaX4+Tqs5U=;
        b=vdFyjzd69MgLPJGn/rda8b+Xy8DJver5rGyWsfhRz3fxaBqK3N6GPVEX9VgOigGT6H
         G4u2azH5IVMdxo04YebFLBBEvs2QuiDU+sesORZemfQ2eR3veG3vVUoVTQYOlLXq89UI
         mlIDXCnLOQLJSKp/oHCHr5sPgMQAMqASZx/Evpo+8e6/+8/zQDUnFPHQfa7j13nd5OtL
         f+wdDIqcNtqgbZmyDXyEQi+pQpelvUpCqFvBvFInPA+gArGN1HLK1EvmefwISmkPVemJ
         YwQUaPgXPtEMKAVAvZzDnlNWxy7FR9c71JKghsmdRy5znpP9Bq/cg9+dlD+mnhfH/7oT
         h2tA==
X-Gm-Message-State: AOJu0Yyrj/i75uFt2Hq+sAKJv/4PZHd3fMe1CIdaX4tIi/NbuuGO65Nq
	w6VySLwNgiDtB/DJlF99yOicbvsHfGcSyYNYPIir4kkTO43YA4eztf6UaWgz
X-Google-Smtp-Source: AGHT+IE6ShiIcb4SXM4g2f4Lu/kmZ/jlGdcH5Zwtlgvasfgn7RLSGDe1h9/cvQn84qkJY19mhd3ySA==
X-Received: by 2002:a17:906:fcc2:b0:a45:b6b3:dc29 with SMTP id qx2-20020a170906fcc200b00a45b6b3dc29mr1760424ejb.4.1709739720564;
        Wed, 06 Mar 2024 07:42:00 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:00 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/47] acl: upgrade 2.3.1 -> 2.3.2
Date: Wed,  6 Mar 2024 16:41:06 +0100
Message-Id: <20240306154151.3741709-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196685

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...rtable-version-of-dirent-and-readdir.patch | 39 -------------------
 .../0001-test-patch-out-failing-bits.patch    |  5 +--
 ...dcode-the-build-path-into-a-helper-l.patch |  6 +--
 .../attr/{acl_2.3.1.bb => acl_2.3.2.bb}       |  3 +-
 4 files changed, 5 insertions(+), 48 deletions(-)
 delete mode 100644 meta/recipes-support/attr/acl/0001-chacl-Use-portable-version-of-dirent-and-readdir.patch
 rename meta/recipes-support/attr/{acl_2.3.1.bb => acl_2.3.2.bb} (94%)

diff --git a/meta/recipes-support/attr/acl/0001-chacl-Use-portable-version-of-dirent-and-readdir.patch b/meta/recipes-support/attr/acl/0001-chacl-Use-portable-version-of-dirent-and-readdir.patch
deleted file mode 100644
index 775675e1f2e..00000000000
--- a/meta/recipes-support/attr/acl/0001-chacl-Use-portable-version-of-dirent-and-readdir.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 1a5671a4eb13b81b98c3e71f00370781563f66d8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 10 Nov 2022 17:57:24 -0800
-Subject: [PATCH] chacl: Use portable version of dirent and readdir
-
-Using 64bit versions on 32bit architectures should be enabled with
---enable-largefile, this makes it portable across musl and glibc
-
-Upstream-Status: Backport [https://git.savannah.nongnu.org/cgit/acl.git/commit/?id=2b42f64737adf6a2ddd491213580d6e9cdd2f5af]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tools/chacl.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/tools/chacl.c b/tools/chacl.c
-index 525a7ff..8fff875 100644
---- a/tools/chacl.c
-+++ b/tools/chacl.c
-@@ -320,7 +320,7 @@ walk_dir(acl_t acl, acl_t dacl, const char *fname)
- {
- 	int failed = 0;
- 	DIR *dir;
--	struct dirent64 *d;
-+	struct dirent *d;
- 	char *name;
- 
- 	if ((dir = opendir(fname)) == NULL) {
-@@ -332,7 +332,7 @@ walk_dir(acl_t acl, acl_t dacl, const char *fname)
- 		return(0);	/* got a file, not an error */
- 	}
- 
--	while ((d = readdir64(dir)) != NULL) {
-+	while ((d = readdir(dir)) != NULL) {
- 		/* skip "." and ".." entries */
- 		if (strcmp(d->d_name, ".") == 0 || strcmp(d->d_name, "..") == 0)
- 			continue;
--- 
-2.38.1
-
diff --git a/meta/recipes-support/attr/acl/0001-test-patch-out-failing-bits.patch b/meta/recipes-support/attr/acl/0001-test-patch-out-failing-bits.patch
index ba2ffee5d27..219feaccd07 100644
--- a/meta/recipes-support/attr/acl/0001-test-patch-out-failing-bits.patch
+++ b/meta/recipes-support/attr/acl/0001-test-patch-out-failing-bits.patch
@@ -1,4 +1,4 @@
-From 9e08219e0e99ee2589cf35fa8d52cef3515accce Mon Sep 17 00:00:00 2001
+From 7dec6fa3b3494a55120402ff1ea3eb96b67138e8 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 12 Dec 2019 15:47:49 +0100
 Subject: [PATCH] test: patch out failing bits
@@ -58,6 +58,3 @@ index 8f8f825..21e8a95 100644
  	$ : > f
  	$ : <> f
  	>~ .*f: Permission denied$
--- 
-2.17.1
-
diff --git a/meta/recipes-support/attr/acl/0001-tests-do-not-hardcode-the-build-path-into-a-helper-l.patch b/meta/recipes-support/attr/acl/0001-tests-do-not-hardcode-the-build-path-into-a-helper-l.patch
index 57ef0bb728c..748f37f3e7e 100644
--- a/meta/recipes-support/attr/acl/0001-tests-do-not-hardcode-the-build-path-into-a-helper-l.patch
+++ b/meta/recipes-support/attr/acl/0001-tests-do-not-hardcode-the-build-path-into-a-helper-l.patch
@@ -1,4 +1,4 @@
-From 39d332a8801de5d9ef09dacb3dba85c208b7b2ad Mon Sep 17 00:00:00 2001
+From 42ae3f8a5e32ba0681ccd1552a203ddad8748a6e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 12 Dec 2019 13:45:52 +0100
 Subject: [PATCH] tests: do not hardcode the build path into a helper library
@@ -10,7 +10,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/test/Makemodule.am b/test/Makemodule.am
-index 17d4927..015de7f 100644
+index e1d715d..cffe732 100644
 --- a/test/Makemodule.am
 +++ b/test/Makemodule.am
 @@ -30,7 +30,7 @@ EXTRA_DIST += \
@@ -21,4 +21,4 @@ index 17d4927..015de7f 100644
 +libtestlookup_la_CFLAGS = -DBASEDIR=\"/tmp/acl-ptest\"
  libtestlookup_la_LDFLAGS = -rpath $(abs_builddir)
  
- AM_TESTS_ENVIRONMENT = PATH="$(abs_top_builddir):$$PATH";
+ # Make sure translations don't break tests when matching output.
diff --git a/meta/recipes-support/attr/acl_2.3.1.bb b/meta/recipes-support/attr/acl_2.3.2.bb
similarity index 94%
rename from meta/recipes-support/attr/acl_2.3.1.bb
rename to meta/recipes-support/attr/acl_2.3.2.bb
index 9badd332546..61784738738 100644
--- a/meta/recipes-support/attr/acl_2.3.1.bb
+++ b/meta/recipes-support/attr/acl_2.3.2.bb
@@ -19,10 +19,9 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/acl/${BP}.tar.gz \
            file://run-ptest \
            file://0001-tests-do-not-hardcode-the-build-path-into-a-helper-l.patch \
            file://0001-test-patch-out-failing-bits.patch \
-           file://0001-chacl-Use-portable-version-of-dirent-and-readdir.patch \
            "
 
-SRC_URI[sha256sum] = "760c61c68901b37fdd5eefeeaf4c0c7a26bdfdd8ac747a1edff1ce0e243c11af"
+SRC_URI[sha256sum] = "5f2bdbad629707aa7d85c623f994aa8a1d2dec55a73de5205bac0bf6058a2f7c"
 
 inherit autotools gettext ptest
 
-- 
2.39.2


