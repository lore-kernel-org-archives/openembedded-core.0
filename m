Return-Path: <liu.ming50@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id D3DA2601D3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 May 2017 09:51:39 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id o12so7759555iod.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 May 2017 02:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=aoeTSF9ZrmXjsoxoVi9gM0XdV/fu/ieL9PyrQ75lXS0=;
	b=E9zthtYk+mc7HvdY4ZbDG881qb3Q1tZxTmZ/ozWFvc6gio2uwC4E51eGsC9p2TqT31
	6KRVFJjbozTrOWKlvpdrKZbqTyNrOPP3uVmkDWQt67eHyyTwsNB97TVBob7yMy0eXwzu
	Dl3yKjWKvYsBrr29i8zq97//73S7kDKroFasUD122cGZ5mIV6zz+mN3aiA1Ji1f8GP4c
	qxkU4xw97uY/kRtaN9tDhUwQx2hb5wGvVxmAFHuqcZr+beC2m8Yskrlz+Cs6wiqu034G
	WTRETiC6cKXrzqlyPM+Hfzj0tT6P/SalgrCOYXUNfC3nC93HBb6mvb2qlFKBqfR0RVAq
	8pbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aoeTSF9ZrmXjsoxoVi9gM0XdV/fu/ieL9PyrQ75lXS0=;
	b=PEadU7KyykYNsCH2nDW7f7JC88V5ZpZoN2arDs1uy41yx/k3zM7CPIm2SnT82OZ5Fe
	whwmxAqiDywXvh4l8CYb5OMEQ4baAJWrYAhb5RhLHii3P+tKq5GX5oyMpIO8JO1hpJw5
	LTdqTkXfXwaOddYNHNklfHXBy6hevnLrvqzHdj29l4MSnlgOQEU2EoFcJ301JjHnrUql
	SWVUZ1iH+L8aORY7MTlXsOvmJZFivAaggipJiyHqPjGaFqDVWP7K/Fzw7d0LTNxRJro6
	zc8eG/4L9QdpJTWYt8ZVfmdZsxM+1S17OtG/yg11DUJIZRpCdHrYzja9GYxdFmqQuhDW
	Ozww==
X-Gm-Message-State: AODbwcB6zln1sb/VgXm8wZqnvLza5b3CxfEpU/kbp0BScbV0vLYrQkif
	OsqbEZY0gapP8g==
X-Received: by 10.107.47.66 with SMTP id j63mr7201031ioo.203.1494669100749;
	Sat, 13 May 2017 02:51:40 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.119.199.218]) by smtp.gmail.com with ESMTPSA id
	g202sm2516596ioe.46.2017.05.13.02.51.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 13 May 2017 02:51:40 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 May 2017 11:51:27 +0200
Message-Id: <1494669087-708-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] musl: fix a invalid conversion from 'void*' to 'char*'
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 13 May 2017 09:51:40 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

A compiling warning is observed with gcc -Wconversion option, fixed
by casting 'void*' to 'char*'.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 ...ix-a-invalid-conversion-from-void-to-char.patch | 31 ++++++++++++++++++++++
 meta/recipes-core/musl/musl_git.bb                 |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-core/musl/files/0001-fix-a-invalid-conversion-from-void-to-char.patch

diff --git a/meta/recipes-core/musl/files/0001-fix-a-invalid-conversion-from-void-to-char.patch b/meta/recipes-core/musl/files/0001-fix-a-invalid-conversion-from-void-to-char.patch
new file mode 100644
index 0000000..1eb2a92
--- /dev/null
+++ b/meta/recipes-core/musl/files/0001-fix-a-invalid-conversion-from-void-to-char.patch
@@ -0,0 +1,31 @@
+From 12a3c6d7f53667bbcec585d69e17a5503cc060cb Mon Sep 17 00:00:00 2001
+From: Peter Liu <peter.x.liu@external.atlascopco.com>
+Date: Sat, 13 May 2017 06:04:10 +0200
+Subject: [PATCH] fix a invalid conversion from 'void*' to 'char*'
+
+A compiling warning is observed with gcc -Wconversion option, fixed
+by casting 'void*' to 'char*'.
+
+Upstream-Status: Pending
+
+Signed-off-by: Peter Liu <peter.x.liu@external.atlascopco.com>
+---
+ include/string.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/string.h b/include/string.h
+index ff9badb..b6b2d82 100644
+--- a/include/string.h
++++ b/include/string.h
+@@ -85,7 +85,7 @@ size_t strlcpy (char *, const char *, size_t);
+ #endif
+ 
+ #ifdef _GNU_SOURCE
+-#define	strdupa(x)	strcpy(alloca(strlen(x)+1),x)
++#define	strdupa(x)	strcpy((char*)alloca(strlen(x)+1),x)
+ int strverscmp (const char *, const char *);
+ int strcasecmp_l (const char *, const char *, locale_t);
+ int strncasecmp_l (const char *, const char *, size_t, locale_t);
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index a88bc4d..1604ad1 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -11,6 +11,7 @@ PV = "1.1.16+git${SRCPV}"
 
 SRC_URI = "git://git.musl-libc.org/musl \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
+           file://0001-fix-a-invalid-conversion-from-void-to-char.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


