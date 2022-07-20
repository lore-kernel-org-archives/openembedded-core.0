Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D52ACCA486
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:44:55 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.51612.1658306689959011333
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:44:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pkRqQ7NL;
 spf=pass (domain: gmail.com, ip: 209.85.218.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id l23so31812947ejr.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NdK505DpRoP1SwH9zDO5mJCeSWgz4AzEvy9KlLu5kIs=;
        b=pkRqQ7NLYr1npHQ/JS5WoTN7k18Js9WY8ykmtnZLDx5CNBEdmnB1ZrRCUUxZWCHfy5
         mReC7bXcs9Ja9Rv4FHz9hYaX2YNEJpMxLEH0nY1Rhm4+U490fXQsFmrhcPfeJwiMCqjk
         5RKTRgwEfMlgGghfXW7Y0s/jZLFAQVHeIUnm5Ej9VONELd4Pqhk70VTR4GdGLA1FVxeI
         bfurJdMpx2BrY5l70IrCmRnmJmyWVbcl3Us9D9rU7dMVgXeI/GSSLrwh6cMZclGtoGFP
         7w2nfQRyPYpNIXlQGmLFC9ClJNk8xrVzVFKAqb6POTZJ+yI3g6PbI5a68oWhMalU0Uyw
         d2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NdK505DpRoP1SwH9zDO5mJCeSWgz4AzEvy9KlLu5kIs=;
        b=gccavW9n2w2QgbW/LxYNeuZTqeNM3xR0+EoZ02ueQuVVc+Md/hz6h9VuHZwwcrCnzb
         NA1MsuHSbgEHPii4d7V3p6K8DmhgRCmxwG/cRElyzkIL9bwiJF3JO0aDstMWB0ZDquqG
         gSimSko23O26l/BVqafvKiwRvIsIYjlJiobg87u736QnkdMVt3JRqTBv84H4ecC2Mlth
         aiko4svidl5KJQIEhYghFNBkX6o3GLPqo1X2Figrs/0ZWPrUNlKkeftszNb1mivSl7Zm
         3iXNHzPCeV3OJELbx4JPxvuBDavMZ+W2+a+MFHVZYiW+BUR1529UQX+p+ngcLMES7GA3
         t7Uw==
X-Gm-Message-State: AJIora+OlwxwFE7yaR1LKiG7JuORZISq15z5l6y2JQsd3OknalZjkZen
	+zBlZlIkZ+HYg/NyHpYa8CT2y5bhQ2Y=
X-Google-Smtp-Source: 
 AGRyM1sKDClKmT20ZpS96fUiD76Lp9lvOchOLmxrpcJNqRU82V9Yw+Pa3l+FlNv/6qXg2lNkliIObA==
X-Received: by 2002:a17:906:6a0f:b0:72b:64ce:289d with SMTP id
 qw15-20020a1709066a0f00b0072b64ce289dmr33112083ejc.663.1658306688208;
        Wed, 20 Jul 2022 01:44:48 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:44:47 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/51] efibootmgr: update 17 -> 18
Date: Wed, 20 Jul 2022 10:43:54 +0200
Message-Id: <20220720084442.2940187-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:44:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168297

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../efibootmgr/0001-remove-extra-decl.patch   | 31 -------
 ...1-src-make-compatible-with-efivar-38.patch | 47 -----------
 ...8ae0bce776a36ea2001dea63d376be8274ac.patch | 83 -------------------
 .../{efibootmgr_17.bb => efibootmgr_18.bb}    |  8 +-
 4 files changed, 2 insertions(+), 167 deletions(-)
 delete mode 100644 meta/recipes-bsp/efibootmgr/efibootmgr/0001-remove-extra-decl.patch
 delete mode 100644 meta/recipes-bsp/efibootmgr/efibootmgr/0001-src-make-compatible-with-efivar-38.patch
 delete mode 100644 meta/recipes-bsp/efibootmgr/efibootmgr/97668ae0bce776a36ea2001dea63d376be8274ac.patch
 rename meta/recipes-bsp/efibootmgr/{efibootmgr_17.bb => efibootmgr_18.bb} (75%)

diff --git a/meta/recipes-bsp/efibootmgr/efibootmgr/0001-remove-extra-decl.patch b/meta/recipes-bsp/efibootmgr/efibootmgr/0001-remove-extra-decl.patch
deleted file mode 100644
index 42f3a8182d..0000000000
--- a/meta/recipes-bsp/efibootmgr/efibootmgr/0001-remove-extra-decl.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 99b578501643377e0b1994b2a068b790d189d5ad Mon Sep 17 00:00:00 2001
-From: Peter Jones <pjones@redhat.com>
-Date: Wed, 13 Jun 2018 09:41:01 -0400
-Subject: [PATCH] remove extra decl
-
-Signed-off-by: Peter Jones <pjones@redhat.com>
-
-Upstream-Status: Backport [git://github.com/rhinstaller/efibootmgr.git]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
----
- src/efibootmgr.c | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/src/efibootmgr.c b/src/efibootmgr.c
-index de38f01..4e1a680 100644
---- a/src/efibootmgr.c
-+++ b/src/efibootmgr.c
-@@ -1536,9 +1536,6 @@ parse_opts(int argc, char **argv)
- 					       "invalid numeric value %s\n",
- 					       optarg);
- 			}
--                        /* XXX efivar-36 accidentally doesn't have a public
--                         * header for this */
--			extern int efi_set_verbose(int verbosity, FILE *errlog);
- 			efi_set_verbose(opts.verbose - 2, stderr);
- 			break;
- 		case 'V':
--- 
-2.7.4
-
diff --git a/meta/recipes-bsp/efibootmgr/efibootmgr/0001-src-make-compatible-with-efivar-38.patch b/meta/recipes-bsp/efibootmgr/efibootmgr/0001-src-make-compatible-with-efivar-38.patch
deleted file mode 100644
index f8d912391e..0000000000
--- a/meta/recipes-bsp/efibootmgr/efibootmgr/0001-src-make-compatible-with-efivar-38.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 07f080184d067c1ebc3fec1b53dd4a06d1a2566a Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Mon, 17 Jan 2022 23:24:34 +0100
-Subject: [PATCH] src: make compatible with efivar 38
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/efibootdump.c | 2 +-
- src/efibootmgr.c  | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/efibootdump.c b/src/efibootdump.c
-index eceffd6..09bd76e 100644
---- a/src/efibootdump.c
-+++ b/src/efibootdump.c
-@@ -69,7 +69,7 @@ print_boot_entry(efi_load_option *loadopt, size_t data_size)
- 	text_path = alloca(text_path_len);
- 	if (!text_path)
- 		error(100, "Couldn't allocate memory");
--	rc = efidp_format_device_path(text_path, text_path_len,
-+	rc = efidp_format_device_path((unsigned char *)text_path, text_path_len,
- 				      dp, pathlen);
- 	if (rc < 0) {
- 		printf("<bad device path>");
-diff --git a/src/efibootmgr.c b/src/efibootmgr.c
-index 4e1a680..b77b1fb 100644
---- a/src/efibootmgr.c
-+++ b/src/efibootmgr.c
-@@ -949,7 +949,7 @@ show_vars(const char *prefix)
- 			pathlen = efi_loadopt_pathlen(load_option,
- 						      boot->data_size);
- 			dp = efi_loadopt_path(load_option, boot->data_size);
--			rc = efidp_format_device_path(text_path, text_path_len,
-+			rc = efidp_format_device_path((unsigned char *)text_path, text_path_len,
- 						      dp, pathlen);
- 			if (rc < 0)
- 				error(18, "Could not parse device path");
-@@ -960,7 +960,7 @@ show_vars(const char *prefix)
- 			if (!text_path)
- 				error(19, "Could not parse device path");
- 
--			rc = efidp_format_device_path(text_path, text_path_len,
-+			rc = efidp_format_device_path((unsigned char *)text_path, text_path_len,
- 						      dp, pathlen);
- 			if (rc < 0)
- 				error(20, "Could not parse device path");
diff --git a/meta/recipes-bsp/efibootmgr/efibootmgr/97668ae0bce776a36ea2001dea63d376be8274ac.patch b/meta/recipes-bsp/efibootmgr/efibootmgr/97668ae0bce776a36ea2001dea63d376be8274ac.patch
deleted file mode 100644
index 9525ed8c54..0000000000
--- a/meta/recipes-bsp/efibootmgr/efibootmgr/97668ae0bce776a36ea2001dea63d376be8274ac.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From 97668ae0bce776a36ea2001dea63d376be8274ac Mon Sep 17 00:00:00 2001
-From: Peter Jones <pjones@redhat.com>
-Date: Wed, 6 Mar 2019 13:08:33 -0500
-Subject: [PATCH] Make sure PKGS= is propogated into the submake for "make
- deps"
-
-When we're doing make deps with "$(CC) -MF", gcc and clang have different
-behavior, both broken in different ways, which we're hitting because of a
-missing -I argument for libefivar's includes.  On clang, when a header can't
-be found, it emits a rule with the header as a prerequisite without a path,
-such as efivar.h here:
-
-efibootmgr.o: efibootmgr.c fix_coverity.h efivar.h efiboot.h \
-  /home/pjones/devel/github.com/efibootmgr/master/src/include/list.h \
-  /home/pjones/devel/github.com/efibootmgr/master/src/include/efi.h \
-  /home/pjones/devel/github.com/efibootmgr/master/src/include/unparse_path.h \
-  /home/pjones/devel/github.com/efibootmgr/master/src/include/efibootmgr.h \
-  error.h
-
-Then the build that utilizes that rule will fail to find the
-prerequisite and tell you something like:
-
-make[1]: *** No rule to make target 'efivar.h', needed by 'efibootmgr.o'.  Stop.
-make[1]: Leaving directory '/home/pjones/devel/github.com/efibootmgr/master/src'
-
-With gcc, when a header can't be found, it emits a rule without that header
-as a prerequisite, as such (again with efivar.h):
-
-efibootmgr.o: efibootmgr.c fix_coverity.h \
- /home/pjones/devel/github.com/efibootmgr/master/src/include/list.h \
- /home/pjones/devel/github.com/efibootmgr/master/src/include/efi.h \
- /home/pjones/devel/github.com/efibootmgr/master/src/include/unparse_path.h \
- /home/pjones/devel/github.com/efibootmgr/master/src/include/efi.h \
- /home/pjones/devel/github.com/efibootmgr/master/src/include/efibootmgr.h \
- error.h
-
-And then your build will fail if you haven't adjusted CFLAGS to tell it
-where to find the header.
-
-Both of these would be better just erroring, but at least gcc's doesn't
-insert a *wrong* dependency.
-
-This patch adds "PKGS=efivar efibootmgr popt" for all deps under src/.
-Technically that's overkill, as efibootmgr itself doesn't need popt, but it
-doesn't hurt anything to have the extra part there.  The resulting
-.efibootmgr.d file has the prerequisites expressed correctly:
-
-efibootmgr.o: efibootmgr.c fix_coverity.h /usr/include/efivar/efivar.h \
- /usr/include/efivar/efiboot.h \
- /home/pjones/devel/github.com/efibootmgr/master/src/include/list.h \
- /home/pjones/devel/github.com/efibootmgr/master/src/include/efi.h \
- /home/pjones/devel/github.com/efibootmgr/master/src/include/unparse_path.h \
- /home/pjones/devel/github.com/efibootmgr/master/src/include/efi.h \
- /home/pjones/devel/github.com/efibootmgr/master/src/include/efibootmgr.h \
- error.h
-
-This fixes the issue described in github PR #96
-
-Signed-off-by: Peter Jones <pjones@redhat.com>
-Upstream-Status: Backport [https://github.com/rhboot/efibootmgr/commit/97668ae0bce776a36ea2001dea63d376be8274ac]
----
- src/Makefile | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index 258bac1..32fa188 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -31,8 +31,13 @@ efibootdump : PKGS=efivar efiboot popt
- efibootnext : $(call objects-of,$(EFIBOOTNEXT_SOURCES))
- efibootnext : PKGS=efivar efiboot popt
- 
-+deps : PKGS=efivar efiboot popt
- deps : $(ALL_SOURCES)
--	$(MAKE) -f $(TOPDIR)/Make.deps deps SOURCES="$(ALL_SOURCES)" SUBDIR_CFLAGS="$(SUBDIR_CFLAGS)"
-+	$(MAKE) -f $(TOPDIR)/Make.deps \
-+		SOURCES="$(ALL_SOURCES)" \
-+		SUBDIR_CFLAGS="$(SUBDIR_CFLAGS)" \
-+		PKGS="$(PKGS)" \
-+		deps
- 
- clean :
- 	@rm -rfv *.o *.a *.so $(TARGETS)
diff --git a/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb b/meta/recipes-bsp/efibootmgr/efibootmgr_18.bb
similarity index 75%
rename from meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
rename to meta/recipes-bsp/efibootmgr/efibootmgr_18.bb
index 11d8b9061d..cbcaac1e97 100644
--- a/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
+++ b/meta/recipes-bsp/efibootmgr/efibootmgr_18.bb
@@ -10,12 +10,8 @@ DEPENDS = "efivar popt"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
-SRC_URI = "git://github.com/rhinstaller/efibootmgr.git;protocol=https;branch=master \
-           file://0001-remove-extra-decl.patch \
-           file://97668ae0bce776a36ea2001dea63d376be8274ac.patch \
-           file://0001-src-make-compatible-with-efivar-38.patch \
-           "
-SRCREV = "e067160ecef8208e1944002e5d50b275733211fb"
+SRC_URI = "git://github.com/rhinstaller/efibootmgr.git;protocol=https;branch=main"
+SRCREV = "c3f9f0534e32158f62c43564036878b93b9e0fd6"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


