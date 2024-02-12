Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 364E5C48297
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 13:54:49 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web10.6783.1707746088875367263
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 05:54:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=j/uemTca;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.52, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-59d11e0b9e1so2013540eaf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 05:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1707746088; x=1708350888; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=41SXOgT+4JGs/AtCMMuLv+XqRx+FTIPoFI77ecFWIXY=;
        b=j/uemTcaf4uQNid0GvPINKtsbgPcoHhgw9nFutcgnS8Ac/IBrmi92jnR+d9ZZb/xSu
         XIA9d+9ESQ3NowIHtTkuP5whztnqbvwajAjCvyWI2UBO898INJsHU6HHpEFePEXRW+F8
         IWvX9fmldYZI+EMTWn3plXvwqikTP7Q+4gQY1fUG8clWNiRz9vjIgARWU8Vuti0M8dtd
         /JereFla8xewqqOPBTDB9cc4KVWLZ8MpshPSDBNZMTeKqEhoi2Cn4LC8odiWvKNk3buH
         1KLHXN7abHrtcfpRzDDb87EIHEXHmRYFGi7GfcZZBEfBv6AizDS1tq1roqK5HHaAbNqT
         ayaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707746088; x=1708350888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41SXOgT+4JGs/AtCMMuLv+XqRx+FTIPoFI77ecFWIXY=;
        b=aN0b2D/R+lzhbv7s3tl6lBvj6x42cnsPlHeie8KsyIa7EGDNpnP5fWy9rBBaK/SY8j
         +Vh6Im/jy1fqwxovNml/ghP2VqGSdSvNUglc4q+vPl6VKekDleFZMmOeW4My5SDtLf90
         RlJIX0Vbl3DDFR+oGRvLh+3tbj0I/ucIxRBzw8K5q2UQANjPH/E7Jow3JNd60XiNqNK4
         TqUvzlG1T7QtR1jk5lIz8epu7j4yn+04tHXF1SjPCcarUcWNOn2+wLTswjd5yzjXrR/s
         NJJanXoBoPaaUpRTPw2TOa1wRbQpi0jOJLHYkNSQaSqMzYZbdHCy+kPYqDKFT/cbnM7Q
         /ziQ==
X-Gm-Message-State: AOJu0YwRgin6p+tGsubHvK5shIqks3IOZJQ+3P8vCGQT5uVnuk2CA/r7
	wRQAJ1IYxKY8Dl0OWvVkbFOjKR8N0m+2Wm8Urb1Yt0XE9qGMjC3tLjq0dYfaIguj0u0ElBr38YM
	GgGg=
X-Google-Smtp-Source: AGHT+IGbs7fHk6ygAinU97XSPAFkHzBwPrzUuqRjRikmxxknaRNWzEQz5TbZQaan0iDoxkEn4MR93w==
X-Received: by 2002:a05:6358:9894:b0:178:7630:fb46 with SMTP id q20-20020a056358989400b001787630fb46mr10364344rwa.29.1707746087800;
        Mon, 12 Feb 2024 05:54:47 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id k69-20020a638448000000b005dc421f8889sm439889pgd.26.2024.02.12.05.54.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 05:54:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/8] libgit2: Fix CVE-2024-24575 and CVE-2024-24577
Date: Mon, 12 Feb 2024 03:54:15 -1000
Message-Id: <942254eb3ef29c8672a35015c086721c4fbe5a4f.1707745886.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1707745886.git.steve@sakoman.com>
References: <cover.1707745886.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 13:54:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195325

From: Soumya Sambu <soumya.sambu@windriver.com>

CVE-2024-24575:
libgit2 is a portable C implementation of the Git core methods provided
as a linkable library with a solid API, allowing to build Git functionality
into your application. Using well-crafted inputs to `git_revparse_single`
can cause the function to enter an infinite loop, potentially causing a
Denial of Service attack in the calling application. The revparse function
in `src/libgit2/revparse.c` uses a loop to parse the user-provided spec
string. There is an edge-case during parsing that allows a bad actor to
force the loop conditions to access arbitrary memory. Potentially, this
could also leak memory if the extracted rev spec is reflected back to the
attacker. As such, libgit2 versions before 1.4.0 are not affected. Users
should upgrade to version 1.6.5 or 1.7.2.

CVE-2024-24577:
libgit2 is a portable C implementation of the Git core methods provided
as a linkable library with a solid API, allowing to build Git functionality
into your application. Using well-crafted inputs to `git_index_add` can
cause heap corruption that could be leveraged for arbitrary code execution.
There is an issue in the `has_dir_name` function in `src/libgit2/index.c`,
which frees an entry that should not be freed. The freed entry is later
used and overwritten with potentially bad actor-controlled data leading to
controlled heap corruption. Depending on the application that uses libgit2,
this could lead to arbitrary code execution. This issue has been patched
in version 1.6.5 and 1.7.2.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-24575
https://security-tracker.debian.org/tracker/CVE-2024-24575
https://nvd.nist.gov/vuln/detail/CVE-2024-24577
https://security-tracker.debian.org/tracker/CVE-2024-24577

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libgit2/libgit2/CVE-2024-24575.patch      | 56 +++++++++++++++++++
 .../libgit2/libgit2/CVE-2024-24577.patch      | 52 +++++++++++++++++
 meta/recipes-support/libgit2/libgit2_1.4.5.bb |  5 +-
 3 files changed, 112 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libgit2/libgit2/CVE-2024-24575.patch
 create mode 100644 meta/recipes-support/libgit2/libgit2/CVE-2024-24577.patch

diff --git a/meta/recipes-support/libgit2/libgit2/CVE-2024-24575.patch b/meta/recipes-support/libgit2/libgit2/CVE-2024-24575.patch
new file mode 100644
index 0000000000..d3957ac5d0
--- /dev/null
+++ b/meta/recipes-support/libgit2/libgit2/CVE-2024-24575.patch
@@ -0,0 +1,56 @@
+From c9d31b711e8906cf248566f43142f20b03e20cbf Mon Sep 17 00:00:00 2001
+From: Edward Thomson <ethomson@edwardthomson.com>
+Date: Fri, 17 Nov 2023 16:54:47 +0000
+Subject: [PATCH] revparse: fix parsing bug for trailing `@`
+
+When parsing a revspec that ends with a trailing `@`, explicitly stop
+parsing. Introduce a sentinel variable to explicitly stop parsing.
+
+Prior to this, we would set `spec` to `HEAD`, but were looping on the
+value of `spec[pos]`, so we would continue walking the (new) `spec`
+at offset `pos`, looking for a NUL. This is obviously an out-of-bounds
+read.
+
+Credit to Michael Rodler (@f0rki) and Amazon AWS Security.
+
+CVE: CVE-2024-24575
+
+Upstream-Status: Backport [https://github.com/libgit2/libgit2/commit/c9d31b711e8906cf248566f43142f20b03e20cbf]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/revparse.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/revparse.c b/src/revparse.c
+index 9bc28e9fc..d3bbe840b 100644
+--- a/src/revparse.c
++++ b/src/revparse.c
+@@ -685,6 +685,7 @@ static int revparse(
+	git_object *base_rev = NULL;
+
+	bool should_return_reference = true;
++	bool parsed = false;
+
+	GIT_ASSERT_ARG(object_out);
+	GIT_ASSERT_ARG(reference_out);
+@@ -694,7 +695,7 @@ static int revparse(
+	*object_out = NULL;
+	*reference_out = NULL;
+
+-	while (spec[pos]) {
++	while (!parsed && spec[pos]) {
+		switch (spec[pos]) {
+		case '^':
+			should_return_reference = false;
+@@ -801,6 +802,8 @@ static int revparse(
+				break;
+			} else if (spec[pos+1] == '\0') {
+				spec = "HEAD";
++				identifier_len = 4;
++				parsed = true;
+				break;
+			}
+			/* fall through */
+--
+2.40.0
diff --git a/meta/recipes-support/libgit2/libgit2/CVE-2024-24577.patch b/meta/recipes-support/libgit2/libgit2/CVE-2024-24577.patch
new file mode 100644
index 0000000000..3469f9d099
--- /dev/null
+++ b/meta/recipes-support/libgit2/libgit2/CVE-2024-24577.patch
@@ -0,0 +1,52 @@
+From eb4c1716cd92bf56f2770653a915d5fc01eab8f3 Mon Sep 17 00:00:00 2001
+From: Edward Thomson <ethomson@edwardthomson.com>
+Date: Sat, 16 Dec 2023 11:19:07 +0000
+Subject: [PATCH] index: correct index has_dir_name check
+
+`has_dir_name` is used to check for directory/file collisions,
+and attempts to determine whether the index contains a file with
+a directory name that is a proper subset of the new index entry
+that we're trying to add.
+
+To determine directory name, the function would walk the path string
+backwards to identify a `/`, stopping at the end of the string. However,
+the function assumed that the strings did not start with a `/`. If the
+paths contain only a single `/` at the beginning of the string, then the
+function would continue the loop, erroneously, when they should have
+stopped at the first character.
+
+Correct the order of the tests to terminate properly.
+
+Credit to Michael Rodler (@f0rki) and Amazon AWS Security.
+
+CVE: CVE-2024-24577
+
+Upstream-Status: Backport [https://github.com/libgit2/libgit2/commit/eb4c1716cd92bf56f2770653a915d5fc01eab8f3]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/index.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/src/index.c b/src/index.c
+index aa97c6421..e8ff82e1a 100644
+--- a/src/index.c
++++ b/src/index.c
+@@ -1148,10 +1148,13 @@ static int has_dir_name(git_index *index,
+		size_t len, pos;
+
+		for (;;) {
+-			if (*--slash == '/')
+-				break;
++			slash--;
++
+			if (slash <= entry->path)
+				return 0;
++
++			if (*slash == '/')
++				break;
+		}
+		len = slash - name;
+
+--
+2.40.0
diff --git a/meta/recipes-support/libgit2/libgit2_1.4.5.bb b/meta/recipes-support/libgit2/libgit2_1.4.5.bb
index aadfe4ad02..ad8b9a536a 100644
--- a/meta/recipes-support/libgit2/libgit2_1.4.5.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.4.5.bb
@@ -5,7 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e5a9227de4cb6afb5d35ed7b0fdf480d"
 
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
-SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.4;protocol=https"
+SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.4;protocol=https \
+           file://CVE-2024-24575.patch \
+           file://CVE-2024-24577.patch \
+           "
 SRCREV = "cd6f679af401eda1f172402006ef8265f8bd58ea"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


