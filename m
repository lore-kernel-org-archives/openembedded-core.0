Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CABF8C6FA85
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 07:21:51 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.9308.1662016899520612081
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 00:21:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pnq6zSPn;
 spf=pass (domain: gmail.com, ip: 209.85.128.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id d5so8509494wms.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 00:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=k4524APJBOFiySu8QdgrIA4lW5TbIuKaD1dgkU2chDk=;
        b=pnq6zSPnpBvkXmpzgWrJfoQT3iTbiQZMZcGGgkQClKKs8TYFuRZTM8riHlijKYc2S4
         TmTe1UMoZz0B33Caee+eXQF4nlU8p4bM81sCR8NogSLX9b2QdppAJeoTIf7Y8Kers3Di
         9WI+d4rIvQcsSkbtysMJPuaj+beKZJxrxVnc588gLtEcjDDSA9Tz8MMcgX2BcDYzqGkc
         xLRL93DXV9NFLjT4RtTvw/j5OC4+pd8xrilUxmc78bQ1bs5cWf1DlyfJt0HHdemJPfT8
         aQugdson0pPAWA+kDgKN+EAAv9PhhLcKtxzjxIksUqHqUukrmUZRCSRxU9WXvV3DHb71
         O/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=k4524APJBOFiySu8QdgrIA4lW5TbIuKaD1dgkU2chDk=;
        b=WeyaSQebk4wztwnDj3iAZHYO6z17Dm52h2BFxTbElO6BO6g5OGUtDvsuz351lg6dzp
         13FwxzZOcRm/w28xmFJveulGL5FwZC/uz9omc2mlqlJcNMzE7GbCA1pXPGomlzVVvncX
         KjXEqZd2IQ8xVO7o0f9Cnwz+ECRhVruN4CdG7P+ll+yoUyRkL91mv1GzVuUYuvFSqbu4
         kGnWmQL0Zhe0Zvp3dLj3qqPR4I2CEqrEIdpokbSSDkQshQ/vshWbcl/KgIG4w6usZpWh
         MmHLe9wBe6Dlct0y9qRG58zGgTtpg2RwohGjowCt9hb/RDJt7Aynk5GXah7WJhZFUjbf
         G5tA==
X-Gm-Message-State: ACgBeo2DRjm6SX3d0YlGoSbaYgFI/ckHmzsx4mqQQHp2pESBsBJGGW0T
	wEySeZ/zk9HgD13VqQC4PJNRRI+Y7As=
X-Google-Smtp-Source: 
 AA6agR4GHtH4mNj5Ejk4hvavaVCObJp+MRr8u4sRutOVDyuhIz3QWMe1C0YbMLVFYD+py0INO0KaPA==
X-Received: by 2002:a05:600c:1d94:b0:3a5:e341:fc66 with SMTP id
 p20-20020a05600c1d9400b003a5e341fc66mr4135991wms.156.1662016897622;
        Thu, 01 Sep 2022 00:21:37 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 c18-20020adffb52000000b00225239d9265sm14022982wrs.74.2022.09.01.00.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 00:21:36 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/14] mtd-utils: remove patch that adds -I option
Date: Thu,  1 Sep 2022 09:21:14 +0200
Message-Id: <20220901072125.3366367-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220901072125.3366367-1-alex@linutronix.de>
References: <20220901072125.3366367-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 07:21:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170145

The patch was added in https://git.yoctoproject.org/poky/commit/?id=f594a1145eb5b952265a3fdf6b158ef41b148b12
with no explanation for the use case or metadata.

As there are no uses of the option in poky or meta-oe, it can be removed.
In the (unlikely) event that someone is using the option privately, please cherry-pick
into a product layer, and send upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../add-exclusion-to-mkfs-jffs2-git-2.patch   | 105 ------------------
 meta/recipes-devtools/mtd/mtd-utils_git.bb    |   1 -
 2 files changed, 106 deletions(-)
 delete mode 100644 meta/recipes-devtools/mtd/mtd-utils/add-exclusion-to-mkfs-jffs2-git-2.patch

diff --git a/meta/recipes-devtools/mtd/mtd-utils/add-exclusion-to-mkfs-jffs2-git-2.patch b/meta/recipes-devtools/mtd/mtd-utils/add-exclusion-to-mkfs-jffs2-git-2.patch
deleted file mode 100644
index 5d874d9810..0000000000
--- a/meta/recipes-devtools/mtd/mtd-utils/add-exclusion-to-mkfs-jffs2-git-2.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-Upstream-Status: Pending
-
-Index: git/jffsX-utils/mkfs.jffs2.c
-===================================================================
---- git.orig/jffsX-utils/mkfs.jffs2.c
-+++ git/jffsX-utils/mkfs.jffs2.c
-@@ -100,6 +100,11 @@ struct filesystem_entry {
- 	struct rb_node hardlink_rb;
- };
- 
-+struct ignorepath_entry {
-+	struct ignorepath_entry* next;  /* Points to the next ignorepath element */
-+	char name[PATH_MAX];        /* Name of the entry */
-+};
-+static struct ignorepath_entry* ignorepath = 0;
- struct rb_root hardlinks;
- static int out_fd = -1;
- static int in_fd = -1;
-@@ -309,7 +314,7 @@ static struct filesystem_entry *recursiv
- 	char *hpath, *tpath;
- 	struct dirent *dp, **namelist;
- 	struct filesystem_entry *entry;
--
-+	struct ignorepath_entry* element = ignorepath;
- 
- 	if (lstat(hostpath, &sb)) {
- 		sys_errmsg_die("%s", hostpath);
-@@ -318,6 +323,15 @@ static struct filesystem_entry *recursiv
- 	entry = add_host_filesystem_entry(targetpath, hostpath,
- 			sb.st_uid, sb.st_gid, sb.st_mode, 0, parent);
- 
-+	while ( element ) {
-+		if ( strcmp( element->name, targetpath ) == 0 ) {
-+			printf( "Note: ignoring directories below '%s'\n", targetpath );
-+			return entry;
-+			break;
-+		}
-+		element = element->next;
-+	}
-+
- 	n = scandir(hostpath, &namelist, 0, alphasort);
- 	if (n < 0) {
- 		sys_errmsg_die("opening directory %s", hostpath);
-@@ -1359,6 +1373,7 @@ static struct option long_options[] = {
- 	{"root", 1, NULL, 'r'},
- 	{"pagesize", 1, NULL, 's'},
- 	{"eraseblock", 1, NULL, 'e'},
-+	{"ignore", 1, NULL, 'I'},
- 	{"output", 1, NULL, 'o'},
- 	{"help", 0, NULL, 'h'},
- 	{"verbose", 0, NULL, 'v'},
-@@ -1409,6 +1424,7 @@ static const char helptext[] =
- "  -L, --list-compressors  Show the list of the available compressors\n"
- "  -t, --test-compression  Call decompress and compare with the original (for test)\n"
- "  -n, --no-cleanmarkers   Don't add a cleanmarker to every eraseblock\n"
-+"  -I, --ignore=PATH       Ignore sub directory and file tree below PATH when recursing over the file system\n"
- "  -o, --output=FILE       Output to FILE (default: stdout)\n"
- "  -l, --little-endian     Create a little-endian filesystem\n"
- "  -b, --big-endian        Create a big-endian filesystem\n"
-@@ -1566,6 +1582,7 @@ int main(int argc, char **argv)
- 	char *compr_name = NULL;
- 	int compr_prior  = -1;
- 	int warn_page_size = 0;
-+	struct ignorepath_entry* element = ignorepath;
- 
- 	page_size = sysconf(_SC_PAGESIZE);
- 	if (page_size < 0) /* System doesn't know so ... */
-@@ -1576,7 +1593,7 @@ int main(int argc, char **argv)
- 	jffs2_compressors_init();
- 
- 	while ((opt = getopt_long(argc, argv,
--					"D:d:r:s:o:qUPfh?vVe:lbp::nc:m:x:X:Lty:i:", long_options, &c)) >= 0)
-+					"D:d:r:s:I:o:qUPfh?vVe:lbp::nc:m:x:X:Lty:i:", long_options, &c)) >= 0)
- 	{
- 		switch (opt) {
- 			case 'D':
-@@ -1600,6 +1617,28 @@ int main(int argc, char **argv)
- 				warn_page_size = 0; /* set by user, so don't need to warn */
- 				break;
- 
-+			case 'I':
-+				printf( "Note: Adding '%s' to ignore Path\n", optarg );
-+				element = ignorepath;
-+				if ( !ignorepath ) {
-+					ignorepath = xmalloc( sizeof( struct ignorepath_entry ) );
-+					ignorepath->next = 0;
-+					strcpy( &ignorepath->name[0], optarg );
-+				} else {
-+					while ( element->next ) element = element->next;
-+					element->next = xmalloc( sizeof( struct ignorepath_entry ) );
-+ 					element->next->next = 0;
-+					strcpy( &element->next->name[0], optarg );
-+				}
-+				printf( "--------- Dumping ignore path list ----------------\n" );
-+				element = ignorepath;
-+				while ( element ) {
-+					printf( "  * '%s'\n", &element->name[0] );
-+					element = element->next;
-+				}
-+				printf( "---------------------------------------------------\n" );
-+				break;
-+
- 			case 'o':
- 				if (out_fd != -1) {
- 					errmsg_die("output filename specified more than once");
diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index d5dfbcdf7a..943666e529 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -15,7 +15,6 @@ PV = "2.1.4"
 
 SRCREV = "c7f1bfa44a84d02061787e2f6093df5cc40b9f5c"
 SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master \
-           file://add-exclusion-to-mkfs-jffs2-git-2.patch \
            file://0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch \
            "
 
-- 
2.30.2


