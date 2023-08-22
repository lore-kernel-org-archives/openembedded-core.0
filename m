Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C074EE49A6
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 01:56:26 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.8437.1692669378177668119
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 18:56:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=H0TkSDOn;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1bf078d5f33so30920345ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 18:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692669377; x=1693274177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pBv3cB72wiR6pwWIVKhDjyGxkIHYK8u5X+iMBDWqRbw=;
        b=H0TkSDOn8pIFPp4hvQQ0ALpS/xBfNOGqYeJRB2CARLLmr+rJFOKAmu77URuMLuPsKl
         ok8+0TfGSZYP2YDqgzgqHCZdCsbMQlG+spC1l/vqoRhHZkfVJBe6OC7Pj5EcAObH+o8g
         bQtmdqOqxk9pMsMfHTpUGizWnoOISaacbif6PjO0olXIHFcrVAEPzufDsc2KO88wlMP4
         KUad/G/pal7WyQSN44CYBgJRn1n1CL4lN2ASTOHA3+sykgK5XkNc9ABo1NpYSmD3Sfkw
         pfsWa7CncoKLbS+vzYhj1QlkuHeooqbbM2EoW9VUDqlPfstDQ1x1HkimODr9TdJ5/gIL
         79Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692669377; x=1693274177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pBv3cB72wiR6pwWIVKhDjyGxkIHYK8u5X+iMBDWqRbw=;
        b=h+PZhZHns6rUwluCx5NQIeiiSphgrBmcss3CVtFPQeU2AGxFGvTyIT0GY7Jwxo/grE
         ysM7eUGc7Y/sk8ibVGYKc0eA6WtdEuVdnIzf4cWPjp4xMr59Rp5CQduBxFoX6XR/4gjt
         4DtdPXqQzJsSL7m5hKw47H96HsUzb/sV/OeIWfsH3ZeAt8CvSLbSnabm/YrlFvAmTWWX
         Tpetj1p/v7mUZ98/Il4CufRSI8QF9lYgpsnLigMFA+YHr32TTbKMJbbfmCbj9rC2jkTh
         UkhX2wmDpCLVvSzOrGS6xwJFaZvfI7r9Fx8OM6KI0p3TVggoStznKp7Y5tKfbubO7xPz
         Nszg==
X-Gm-Message-State: AOJu0YzyMim7SiMh7iR+CgCodw0L63zbG9fhi0QfOfPoJCS6R3LdzjTw
	AY2AsXkCK22FiyTQbqqqU/+RvFQd1Lw=
X-Google-Smtp-Source: AGHT+IEuZFs4Yb+O2p/zs9bWcZT4OXzFPLSuAEfeZAZy8BnYRBykR1wpK2bliBthgaL7AZQa+3XhmA==
X-Received: by 2002:a17:902:d2ce:b0:1b8:b285:ec96 with SMTP id n14-20020a170902d2ce00b001b8b285ec96mr10493637plc.23.1692669377115;
        Mon, 21 Aug 2023 18:56:17 -0700 (PDT)
Received: from L-18076.kpit.com ([2401:4900:1c42:10c7:9a74:1bc8:8728:f4c7])
        by smtp.gmail.com with ESMTPSA id a8-20020a170902ecc800b001bb97e51ad5sm7700375plh.99.2023.08.21.18.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 18:56:16 -0700 (PDT)
From: virendra thakur <thakur.virendra1810@gmail.com>
X-Google-Original-From: virendra thakur <virendrak@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: Virendra Thakur <virendrak@kpit.com>
Subject: [OE-core][dunfell][PATCH] openssh: Fix CVE-2023-38408
Date: Tue, 22 Aug 2023 07:25:57 +0530
Message-Id: <20230822015557.1791146-1-virendrak@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 01:56:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186488

From: Virendra Thakur <virendrak@kpit.com>

Add patch to fix CVE-2023-38408

Upstream-Status: Backport [https://launchpadlibrarian.net/680920377/openssh_8.2p1-4ubuntu0.9.debian.tar.xz]

Signed-off-by: Virendra Thakur <virendrak@kpit.com>
---
 .../openssh/openssh/CVE-2023-38408-1.patch    |  31 ++++
 .../openssh/openssh/CVE-2023-38408-3.patch    | 161 ++++++++++++++++++
 .../openssh/openssh_8.2p1.bb                  |   2 +
 3 files changed, 194 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-1.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-3.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-1.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-1.patch
new file mode 100644
index 0000000000..3d7c7bd357
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-1.patch
@@ -0,0 +1,31 @@
+From 892506b13654301f69f9545f48213fc210e5c5cc Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Wed, 19 Jul 2023 13:55:53 +0000
+Subject: [PATCH] upstream: terminate process if requested to load a PKCS#11
+ provider
+
+that isn't a PKCS#11 provider; from / ok markus@
+
+OpenBSD-Commit-ID: 39532cf18b115881bb4cfaee32084497aadfa05c
+CVE: CVE-2023-38408
+Upstream-Status: Backport [https://launchpadlibrarian.net/680920377/openssh_8.2p1-4ubuntu0.9.debian.tar.xz]
+Signed-off-by: Virendra Thakur <virendrak@kpit.com>
+---
+ ssh-pkcs11.c | 8 +++-----
+ 1 file changed, 3 insertions(+), 5 deletions(-)
+
+--- a/ssh-pkcs11.c
++++ b/ssh-pkcs11.c
+@@ -1504,10 +1504,8 @@ pkcs11_register_provider(char *provider_
+ 		error("dlopen %s failed: %s", provider_id, dlerror());
+ 		goto fail;
+ 	}
+-	if ((getfunctionlist = dlsym(handle, "C_GetFunctionList")) == NULL) {
+-		error("dlsym(C_GetFunctionList) failed: %s", dlerror());
+-		goto fail;
+-	}
++	if ((getfunctionlist = dlsym(handle, "C_GetFunctionList")) == NULL)
++		fatal("dlsym(C_GetFunctionList) failed: %s", dlerror());
+ 	p = xcalloc(1, sizeof(*p));
+ 	p->name = xstrdup(provider_id);
+ 	p->handle = handle;
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-3.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-3.patch
new file mode 100644
index 0000000000..6a94b8715c
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-3.patch
@@ -0,0 +1,161 @@
+Backport of:
+
+From 29ef8a04866ca14688d5b7fed7b8b9deab851f77 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Wed, 19 Jul 2023 14:02:27 +0000
+Subject: [PATCH] upstream: Ensure FIDO/PKCS11 libraries contain expected
+ symbols
+
+This checks via nlist(3) that candidate provider libraries contain one
+of the symbols that we will require prior to dlopen(), which can cause
+a number of side effects, including execution of constructors.
+
+Feedback deraadt; ok markus
+
+OpenBSD-Commit-ID: 1508a5fbd74e329e69a55b56c453c292029aefbe
+CVE: CVE-2023-38408
+Upstream-Status: Backport [https://launchpadlibrarian.net/680920377/openssh_8.2p1-4ubuntu0.9.debian.tar.xz]
+Signed-off-by: Virendra Thakur <virendrak@kpit.com>
+---
+ misc.c       | 78 +++++++++++++++++++++++++++++++++++++++++++++++++++-
+ misc.h       |  3 +-
+ ssh-pkcs11.c |  6 +++-
+ ssh-sk.c     |  8 ++++--
+ 4 files changed, 89 insertions(+), 6 deletions(-)
+
+--- a/misc.c
++++ b/misc.c
+@@ -28,6 +28,7 @@
+ 
+ #include <sys/types.h>
+ #include <sys/ioctl.h>
++#include <sys/mman.h>
+ #include <sys/socket.h>
+ #include <sys/stat.h>
+ #include <sys/time.h>
+@@ -41,6 +42,9 @@
+ #ifdef HAVE_POLL_H
+ #include <poll.h>
+ #endif
++#ifdef HAVE_NLIST_H
++#include <nlist.h>
++#endif
+ #include <signal.h>
+ #include <stdarg.h>
+ #include <stdio.h>
+@@ -2314,3 +2318,75 @@ ssh_signal(int signum, sshsig_t handler)
+ 	}
+ 	return osa.sa_handler;
+ }
++
++/*
++ * Returns zero if the library at 'path' contains symbol 's', nonzero
++ * otherwise.
++ */
++int
++lib_contains_symbol(const char *path, const char *s)
++{
++#ifdef HAVE_NLIST_H
++	struct nlist nl[2];
++	int ret = -1, r;
++
++	memset(nl, 0, sizeof(nl));
++	nl[0].n_name = xstrdup(s);
++	nl[1].n_name = NULL;
++	if ((r = nlist(path, nl)) == -1) {
++		error("nlist failed for %s", path);
++		goto out;
++	}
++	if (r != 0 || nl[0].n_value == 0 || nl[0].n_type == 0) {
++		error("library %s does not contain symbol %s", path, s);
++		goto out;
++	}
++	/* success */
++	ret = 0;
++ out:
++	free(nl[0].n_name);
++	return ret;
++#else /* HAVE_NLIST_H */
++	int fd, ret = -1;
++	struct stat st;
++	void *m = NULL;
++	size_t sz = 0;
++
++	memset(&st, 0, sizeof(st));
++	if ((fd = open(path, O_RDONLY)) < 0) {
++		error("open %s: %s", path, strerror(errno));
++		return -1;
++	}
++	if (fstat(fd, &st) != 0) {
++		error("fstat %s: %s", path, strerror(errno));
++		goto out;
++	}
++	if (!S_ISREG(st.st_mode)) {
++		error("%s is not a regular file", path);
++		goto out;
++	}
++	if (st.st_size < 0 ||
++	    (size_t)st.st_size < strlen(s) ||
++	    st.st_size >= INT_MAX/2) {
++		error("%s bad size %lld", path, (long long)st.st_size);
++		goto out;
++	}
++	sz = (size_t)st.st_size;
++	if ((m = mmap(NULL, sz, PROT_READ, MAP_PRIVATE, fd, 0)) == MAP_FAILED ||
++	    m == NULL) {
++		error("mmap %s: %s", path, strerror(errno));
++		goto out;
++	}
++	if (memmem(m, sz, s, strlen(s)) == NULL) {
++		error("%s does not contain expected string %s", path, s);
++		goto out;
++	}
++	/* success */
++	ret = 0;
++ out:
++	if (m != NULL && m != MAP_FAILED)
++		munmap(m, sz);
++	close(fd);
++	return ret;
++#endif /* HAVE_NLIST_H */
++}
+--- a/misc.h
++++ b/misc.h
+@@ -86,6 +86,7 @@ const char *atoi_err(const char *, int *
+ int	 parse_absolute_time(const char *, uint64_t *);
+ void	 format_absolute_time(uint64_t, char *, size_t);
+ int	 path_absolute(const char *);
++int	 lib_contains_symbol(const char *, const char *);
+ 
+ void	 sock_set_v6only(int);
+ 
+--- a/ssh-pkcs11.c
++++ b/ssh-pkcs11.c
+@@ -1499,6 +1499,10 @@ pkcs11_register_provider(char *provider_
+ 		    __func__, provider_id);
+ 		goto fail;
+ 	}
++	if (lib_contains_symbol(provider_id, "C_GetFunctionList") != 0) {
++		error("provider %s is not a PKCS11 library", provider_id);
++		goto fail;
++	}
+ 	/* open shared pkcs11-library */
+ 	if ((handle = dlopen(provider_id, RTLD_NOW)) == NULL) {
+ 		error("dlopen %s failed: %s", provider_id, dlerror());
+--- a/ssh-sk.c
++++ b/ssh-sk.c
+@@ -119,10 +119,12 @@ sshsk_open(const char *path)
+ #endif
+ 		return ret;
+ 	}
+-	if ((ret->dlhandle = dlopen(path, RTLD_NOW)) == NULL) {
+-		error("Provider \"%s\" dlopen failed: %s", path, dlerror());
++	if (lib_contains_symbol(path, "sk_api_version") != 0) {
++		error("provider %s is not an OpenSSH FIDO library", path);
+ 		goto fail;
+ 	}
++	if ((ret->dlhandle = dlopen(path, RTLD_NOW)) == NULL)
++		fatal("Provider \"%s\" dlopen failed: %s", path, dlerror());
+ 	if ((ret->sk_api_version = dlsym(ret->dlhandle,
+ 	    "sk_api_version")) == NULL) {
+ 		error("Provider \"%s\" dlsym(sk_api_version) failed: %s",
diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
index 79dba121ff..98cabbe937 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
@@ -27,6 +27,8 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2020-14145.patch \
            file://CVE-2021-28041.patch \
            file://CVE-2021-41617.patch \
+           file://CVE-2023-38408-1.patch \
+           file://CVE-2023-38408-3.patch \
            "
 SRC_URI[md5sum] = "3076e6413e8dbe56d33848c1054ac091"
 SRC_URI[sha256sum] = "43925151e6cf6cee1450190c0e9af4dc36b41c12737619edff8bcebdff64e671"
-- 
2.25.1


