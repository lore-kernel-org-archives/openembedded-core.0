Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576F6CF6495
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 01:58:16 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.45300.1727661495267463347
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Sep 2024 18:58:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BmAzW00k;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7db54269325so2932354a12.2
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 18:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727661494; x=1728266294; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NAsx+KYbQvd8H5fRwPlcc1Sp8SxlIt6E3TKY7f74qOY=;
        b=BmAzW00kUT/PNnTyhXCCppm7jmTTIftB5Xy6U4TJKGl3HCiwjgHMdE2LxhsfVPxbbt
         0OSCCrVaS/2z2E2XQLB+/JjS/7uCuhuAqM8WZR+x0HnWrBpPjMFFpcJi0IPU1MBj3Qj3
         hxyJvBfmezaQ9Ubt61o166bn4Br4v8Ewfpey8d2qdweaIIOQmeyFEJovtgWXyDNjQfPm
         SlJdnMvuB2e/9yZmsHlpHWguYoWzd8RBkPSNc3s8cuXIy0Sl4jXADG3EW/Fj3sHhzI66
         FapJ7sPetM9RWdtz9WO/qlcuqnhUyCxeQWqV8rC8pbqeV6bfmUblON2dTU+Iz8UWE5vF
         s4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727661494; x=1728266294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NAsx+KYbQvd8H5fRwPlcc1Sp8SxlIt6E3TKY7f74qOY=;
        b=Ed+gYokijxKeZ+K9qrN8thPgdpWVtwcyIxbci1woNfXJ43PQPGCqj1V2cYNeZyLL6E
         rb9MNt9SHBsOT8DFKo37ebWOl8cdoG3jRNw2KPrqlnZc6/gABNhEkuOvSwmCG/pJEGwf
         Y9QH7gB3uHTebKNx8/UjSFfyJQivONKjePVJL9CBP3UidO2EPxna6QGHyUaG4/Q8xKeO
         jKBzft1qdoD5bSl68saPWqUO8WWjwWkX2lcbc99N2WbZz+ocV309rq45SFBnW3TntNBo
         eYIlqOYdDBNJcrtArJXxkTxM/J0WI4MMM1as/4OayWXT+Nm/ZZeOO3oWDnKBNmn/uVH6
         apQA==
X-Gm-Message-State: AOJu0Yxo7a7Hj4RWsyTSTZBgmJ2CcmMsMymYUpvz+6nVfLLmwj+WPAaj
	VCuyeRI8sRUyvqU76uitMj6HOwaeAFaAhXaQkbi3XvpIXobBiP9qsUeq6gBaTb1QtFL8No/sWwK
	fUoI=
X-Google-Smtp-Source: AGHT+IH0kqy4Jlc9vzT6zLy17EaAdz9ctlyF48nCtpD8QGmHQh8tYc3lySGo2vHEvBF5gvnYaf8AOA==
X-Received: by 2002:a17:90a:4b06:b0:2e0:a77e:82f7 with SMTP id 98e67ed59e1d1-2e0b8ec8fc3mr12139334a91.36.1727661494551;
        Sun, 29 Sep 2024 18:58:14 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0d4af744bsm5496070a91.23.2024.09.29.18.58.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 18:58:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 27/27] makedevs: Fix issue when rootdir of / is given
Date: Sun, 29 Sep 2024 18:57:22 -0700
Message-Id: <3d894863f442188bad446095bd7fdd82665bb54b.1727661284.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727661284.git.steve@sakoman.com>
References: <cover.1727661284.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 01:58:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205089

From: Jaeyoon Jung <jaeyoon.jung@lge.com>

Treating rootdir "/" as "" leads an error in parse_devtable(). Preserve
it as it is given and use a separate variable for path name prepending.
Another minor fix is to add a return statement at the end of
convert2guid() to avoid an error with -Werror=return-type.

Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4d52e6276c687a8950bde21850072ddf14893fb2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../makedevs/makedevs/makedevs.c              | 21 +++++++++++--------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/makedevs/makedevs/makedevs.c b/meta/recipes-devtools/makedevs/makedevs/makedevs.c
index df2e3cfad5..2254b54891 100644
--- a/meta/recipes-devtools/makedevs/makedevs/makedevs.c
+++ b/meta/recipes-devtools/makedevs/makedevs/makedevs.c
@@ -36,6 +36,7 @@ static const char *const app_name = "makedevs";
 static const char *const memory_exhausted = "memory exhausted";
 static char default_rootdir[]=".";
 static char *rootdir = default_rootdir;
+static char *rootdir_prepend = default_rootdir;
 static int trace = 0;
 
 struct name_id {
@@ -217,6 +218,9 @@ static unsigned long convert2guid(char *id_buf, struct name_id *search_list)
 		}
 		error_msg_and_die("No entry for %s in search list", id_buf);
 	}
+
+	// Unreachable, but avoid an error with -Werror=return-type
+	return 0;
 }
 
 static void free_list(struct name_id *list)
@@ -379,8 +383,8 @@ static int interpret_table_entry(char *line)
 		error_msg_and_die("Device table entries require absolute paths");
 	}
 	name = xstrdup(path + 1);
-	/* prefix path with rootdir */
-	sprintf(path, "%s/%s", rootdir, name);
+	/* prefix path with rootdir_prepend */
+	sprintf(path, "%s/%s", rootdir_prepend, name);
 
 	/* XXX Why is name passed into all of the add_new_*() routines? */
 	switch (type) {
@@ -406,11 +410,11 @@ static int interpret_table_entry(char *line)
 
 			for (i = start; i < start + count; i++) {
 				sprintf(buf, "%s%d", name, i);
-				sprintf(path, "%s/%s%d", rootdir, name, i);
+				sprintf(path, "%s/%s%d", rootdir_prepend, name, i);
 				/* FIXME:  MKDEV uses illicit insider knowledge of kernel
 				 * major/minor representation...  */
 				rdev = MKDEV(major, minor + (i - start) * increment);
-				sprintf(path, "%s/%s\0", rootdir, buf);
+				sprintf(path, "%s/%s\0", rootdir_prepend, buf);
 				add_new_device(buf, path, uid, gid, mode, rdev);
 			}
 		} else {
@@ -541,12 +545,11 @@ int main(int argc, char **argv)
 			} else {
 				closedir(dir);
 			}
-			/* If "/" is specified, use "" because rootdir is always prepended to a
-			 * string that starts with "/" */
-			if (0 == strcmp(optarg, "/"))
-				rootdir = xstrdup("");
+			rootdir = xstrdup(optarg);
+			if (0 == strcmp(rootdir, "/"))
+				rootdir_prepend = xstrdup("");
 			else
-				rootdir = xstrdup(optarg);
+				rootdir_prepend = xstrdup(rootdir);
 			break;
 
 		case 't':
-- 
2.34.1


