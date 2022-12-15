Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9406BC4708D
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 08:46:00 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.128336.1671093952569947442
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 00:45:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LHDnHjhQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id m4so6142215pls.4
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 00:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nkkuB68168ItzixAuKDo1BraSx+ThM4RqzNiLsvKXaQ=;
        b=LHDnHjhQyTxKpNZyxCjqHozvFLr5te01ehmTZAYXdCr2Ug2HBtYcBJaJD7JaGzEvc2
         xFLVlapc07u6w5QbNv9HslNWMiUmYEOHBefmygZs/yhPPjYkgVnvGKOhAqbr7EDyLSKe
         s1/simSeEUq1uWgTiKKM/p7Vhyur43hvmEZj2fWByS2i/3NFMUGSLtB1TgNyMabxN1+r
         eQWKn3u5+++2avrIUdi0YEY+PRerJV0vaBtCVqXRqPfmBm83jrClL4+ovaa2LyG/KQpW
         uJFzMV+uQCt8LQXf/p0mrwR5vdUil3N5WCVaMcA+syxXSBK6X2WrHdY7A1DMF5VBk1Hq
         ch7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nkkuB68168ItzixAuKDo1BraSx+ThM4RqzNiLsvKXaQ=;
        b=yvhmFW8e+jl6BntOyUDnCEW9foa7UbVAs/gx9uuHkxhsipm17t+AtLWRvp6lQ76fHt
         TDeIKAoG966Ph8mfOcnE78NBqyYgX17qddlVTcFy+LDVaj5OVQcHhivGRm+2zk1hnQQq
         OxEIzf2Xvfv/q24byrnoIlFxp1LfihcxIcD4j3gIPYaWH3DVIj9D3Q+0E42aEnjkCZMX
         L2mwA+SlD6pUL1qNjq9yWE7hgxYCyxQr7U7AvuA/SCM4zA58u9B4kGEf9Xm+Xrhyb8Z9
         bTPJPCouomozhQjX0NAxXWCZ2QLJXNN0PsUOs+dME5JVa/mDFg1v72HCTlW4wq504S2q
         6olQ==
X-Gm-Message-State: ANoB5pkkiLu4GdlOg7wMQs4CgnCy3kMe7k3PEFau1T4M52iwKwPFL3Ms
	Rn3vm2Fu62Ko2zHWpjBYj60MujrX1mI=
X-Google-Smtp-Source: AA0mqf6Va7eRgNDL7wsotlS7oBXkvvk4mJr6SHZ/6geWHnK/tBH5mjhawwYNgx595J/ZymlX6jHD/A==
X-Received: by 2002:a17:902:7e47:b0:18f:5bc0:5893 with SMTP id a7-20020a1709027e4700b0018f5bc05893mr20532477pln.0.1671093953450;
        Thu, 15 Dec 2022 00:45:53 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::7d9c])
        by smtp.gmail.com with ESMTPSA id z14-20020a170903018e00b00188ea79fae0sm3255723plg.48.2022.12.15.00.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 00:45:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 07/11] acl: Enable largefile support by default
Date: Thu, 15 Dec 2022 00:45:42 -0800
Message-Id: <20221215084546.125368-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221215084546.125368-1-raj.khem@gmail.com>
References: <20221215084546.125368-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 08:46:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174569

This ensures right flags are passed so enable it. Musl and decoupled
these APIs from _GNU_SOURCE and now are only available when
_LARGEFILE64_SOURCE macro is enabled

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...rtable-version-of-dirent-and-readdir.patch | 39 +++++++++++++++++++
 meta/recipes-support/attr/acl_2.3.1.bb        |  3 ++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-support/attr/acl/0001-chacl-Use-portable-version-of-dirent-and-readdir.patch

diff --git a/meta/recipes-support/attr/acl/0001-chacl-Use-portable-version-of-dirent-and-readdir.patch b/meta/recipes-support/attr/acl/0001-chacl-Use-portable-version-of-dirent-and-readdir.patch
new file mode 100644
index 0000000000..775675e1f2
--- /dev/null
+++ b/meta/recipes-support/attr/acl/0001-chacl-Use-portable-version-of-dirent-and-readdir.patch
@@ -0,0 +1,39 @@
+From 1a5671a4eb13b81b98c3e71f00370781563f66d8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 10 Nov 2022 17:57:24 -0800
+Subject: [PATCH] chacl: Use portable version of dirent and readdir
+
+Using 64bit versions on 32bit architectures should be enabled with
+--enable-largefile, this makes it portable across musl and glibc
+
+Upstream-Status: Backport [https://git.savannah.nongnu.org/cgit/acl.git/commit/?id=2b42f64737adf6a2ddd491213580d6e9cdd2f5af]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tools/chacl.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tools/chacl.c b/tools/chacl.c
+index 525a7ff..8fff875 100644
+--- a/tools/chacl.c
++++ b/tools/chacl.c
+@@ -320,7 +320,7 @@ walk_dir(acl_t acl, acl_t dacl, const char *fname)
+ {
+ 	int failed = 0;
+ 	DIR *dir;
+-	struct dirent64 *d;
++	struct dirent *d;
+ 	char *name;
+ 
+ 	if ((dir = opendir(fname)) == NULL) {
+@@ -332,7 +332,7 @@ walk_dir(acl_t acl, acl_t dacl, const char *fname)
+ 		return(0);	/* got a file, not an error */
+ 	}
+ 
+-	while ((d = readdir64(dir)) != NULL) {
++	while ((d = readdir(dir)) != NULL) {
+ 		/* skip "." and ".." entries */
+ 		if (strcmp(d->d_name, ".") == 0 || strcmp(d->d_name, "..") == 0)
+ 			continue;
+-- 
+2.38.1
+
diff --git a/meta/recipes-support/attr/acl_2.3.1.bb b/meta/recipes-support/attr/acl_2.3.1.bb
index aca04a9aac..5fb8f9ae35 100644
--- a/meta/recipes-support/attr/acl_2.3.1.bb
+++ b/meta/recipes-support/attr/acl_2.3.1.bb
@@ -19,12 +19,15 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/acl/${BP}.tar.gz \
            file://run-ptest \
            file://0001-tests-do-not-hardcode-the-build-path-into-a-helper-l.patch \
            file://0001-test-patch-out-failing-bits.patch \
+           file://0001-chacl-Use-portable-version-of-dirent-and-readdir.patch \
            "
 
 SRC_URI[sha256sum] = "760c61c68901b37fdd5eefeeaf4c0c7a26bdfdd8ac747a1edff1ce0e243c11af"
 
 inherit autotools gettext ptest
 
+EXTRA_OECONF += "--enable-largefile"
+
 PACKAGES =+ "lib${BPN}"
 
 FILES:lib${BPN} = "${libdir}/lib*${SOLIBS}"
-- 
2.39.0


