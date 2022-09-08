Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C20C38145
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 02:28:58 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web09.706.1662604134308655087
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 19:28:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=gAhI3lxs;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id x1so12078829plv.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 19:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=d/wRPgigM2m7Q/eu4CgfYuqkqGl7oxDYdIuM/l62hGw=;
        b=gAhI3lxsRlP9VFjczsUtrfvs0+2pnGHgNs4W7uc8PE/wDeSJDikLHIcLFgH/+KFjIF
         gucxplCTsTQzjFuG7OJXiNK3Hiyza7wrafohuDqR/TjahhOor07prGarXKy3aQKco+jM
         eLmGYR+A0H9Gn87tALvEZYmxw78KGo+Pnp47LRNS7rCXMDe1xOtHfAPIFHAnOvEiGgf3
         JEF6svVtXJ9UhKGY7tBjAt+qqdp39cexo1aEMwGg92877ETuWnIB4bH2bFZ9+Ba8+Jsf
         kpmvKV1G2gvXglDxonMeZSStYvFI2TkgsogO3Fi2D8QAiNqoLXLZXsnsalzxQ5rR9msv
         foTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=d/wRPgigM2m7Q/eu4CgfYuqkqGl7oxDYdIuM/l62hGw=;
        b=KqkyAaPqtbIIdUNM9A1qgoMYd/l93GzE0ze/+ikOMK0PfvOSJnmiDGGdrUFJltMgAG
         kSZA9KJAthUxg8XnRZy05hAyEjI6l+Z3ggJyQueqx49cgxGc5LbLgsnE0nrnNQ1EAktL
         iuT1/wO/gf7GSQ8IRYd+f4llS01jw41zseGR/b5Zvr9JkmYom4dVxP60u6LODO4Y7vMl
         evqGh7nFdb5IJv8iATC1yg4Bx/TZoLEt1zg46dSmX1pN0f0GqCFXKIYWbtkEvERBte1r
         kssz/wUF82yljYEhR4kVKMtijSV2z8XZ62IyvM3RS2MrMBMp22AnkNmcXmMPcGCEvxdI
         0kcQ==
X-Gm-Message-State: ACgBeo0LiOUNYivu3udWYi71TR0yDI7MopPqAvHoPXDfZtQlYWTj4Eg6
	pxgUasiQKdy9AFLVj0zARlUjwRfigutz3XrX
X-Google-Smtp-Source: 
 AA6agR5jC49NTCPSA30wwMNnR/XmRXvu1F+HAPNS4xTMHQGlvBnjcnwCANr/YcDJzwIt+IfZwBMFFg==
X-Received: by 2002:a17:902:cec4:b0:176:be0f:5c79 with SMTP id
 d4-20020a170902cec400b00176be0f5c79mr7064048plg.40.1662604133220;
        Wed, 07 Sep 2022 19:28:53 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 b11-20020a170902d50b00b0016c0c82e85csm1901398plg.75.2022.09.07.19.28.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 19:28:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/7] libarchive: Fix CVE-2021-23177 issue
Date: Wed,  7 Sep 2022 16:28:28 -1000
Message-Id: 
 <01d7e2c7a0da55a7c00aebed107c1338f5f032b1.1662603861.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662603861.git.steve@sakoman.com>
References: <cover.1662603861.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Sep 2022 02:28:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170442

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Add patch to fix CVE-2021-23177 issue for libarchive
Link: http://deb.debian.org/debian/pool/main/liba/libarchive/libarchive_3.4.3-2+deb11u1.debian.tar.xz

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libarchive/CVE-2021-23177.patch           | 183 ++++++++++++++++++
 .../libarchive/libarchive_3.4.2.bb            |   1 +
 2 files changed, 184 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2021-23177.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2021-23177.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2021-23177.patch
new file mode 100644
index 0000000000..555c7a47f7
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2021-23177.patch
@@ -0,0 +1,183 @@
+Description: Fix handling of symbolic link ACLs
+ Published as CVE-2021-23177
+Origin: upstream, https://github.com/libarchive/libarchive/commit/fba4f123cc456d2b2538f811bb831483bf336bad
+Bug-Debian: https://bugs.debian.org/1001986
+Author: Martin Matuska <martin@matuska.org>
+Last-Updated: 2021-12-20
+
+CVE: CVE-2021-23177
+Upstream-Status: Backport [http://deb.debian.org/debian/pool/main/liba/libarchive/libarchive_3.4.3-2+deb11u1.debian.tar.xz]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+--- a/libarchive/archive_disk_acl_freebsd.c
++++ b/libarchive/archive_disk_acl_freebsd.c
+@@ -319,7 +319,7 @@
+ 
+ static int
+ set_acl(struct archive *a, int fd, const char *name,
+-    struct archive_acl *abstract_acl,
++    struct archive_acl *abstract_acl, __LA_MODE_T mode,
+     int ae_requested_type, const char *tname)
+ {
+ 	int		 acl_type = 0;
+@@ -364,6 +364,13 @@
+ 		return (ARCHIVE_FAILED);
+ 	}
+ 
++	if (acl_type == ACL_TYPE_DEFAULT && !S_ISDIR(mode)) {
++		errno = EINVAL;
++		archive_set_error(a, errno,
++		    "Cannot set default ACL on non-directory");
++		return (ARCHIVE_WARN);
++	}
++
+ 	acl = acl_init(entries);
+ 	if (acl == (acl_t)NULL) {
+ 		archive_set_error(a, errno,
+@@ -542,7 +549,10 @@
+ 	else if (acl_set_link_np(name, acl_type, acl) != 0)
+ #else
+ 	/* FreeBSD older than 8.0 */
+-	else if (acl_set_file(name, acl_type, acl) != 0)
++	else if (S_ISLNK(mode)) {
++	    /* acl_set_file() follows symbolic links, skip */
++	    ret = ARCHIVE_OK;
++	} else if (acl_set_file(name, acl_type, acl) != 0)
+ #endif
+ 	{
+ 		if (errno == EOPNOTSUPP) {
+@@ -677,14 +687,14 @@
+ 	    & ARCHIVE_ENTRY_ACL_TYPE_POSIX1E) != 0) {
+ 		if ((archive_acl_types(abstract_acl)
+ 		    & ARCHIVE_ENTRY_ACL_TYPE_ACCESS) != 0) {
+-			ret = set_acl(a, fd, name, abstract_acl,
++			ret = set_acl(a, fd, name, abstract_acl, mode,
+ 			    ARCHIVE_ENTRY_ACL_TYPE_ACCESS, "access");
+ 			if (ret != ARCHIVE_OK)
+ 				return (ret);
+ 		}
+ 		if ((archive_acl_types(abstract_acl)
+ 		    & ARCHIVE_ENTRY_ACL_TYPE_DEFAULT) != 0)
+-			ret = set_acl(a, fd, name, abstract_acl,
++			ret = set_acl(a, fd, name, abstract_acl, mode,
+ 			    ARCHIVE_ENTRY_ACL_TYPE_DEFAULT, "default");
+ 
+ 		/* Simultaneous POSIX.1e and NFSv4 is not supported */
+@@ -693,7 +703,7 @@
+ #if ARCHIVE_ACL_FREEBSD_NFS4
+ 	else if ((archive_acl_types(abstract_acl) &
+ 	    ARCHIVE_ENTRY_ACL_TYPE_NFS4) != 0) {
+-		ret = set_acl(a, fd, name, abstract_acl,
++		ret = set_acl(a, fd, name, abstract_acl, mode,
+ 		    ARCHIVE_ENTRY_ACL_TYPE_NFS4, "nfs4");
+ 	}
+ #endif
+--- a/libarchive/archive_disk_acl_linux.c
++++ b/libarchive/archive_disk_acl_linux.c
+@@ -343,6 +343,11 @@
+ 		return (ARCHIVE_FAILED);
+ 	}
+ 
++	if (S_ISLNK(mode)) {
++		/* Linux does not support RichACLs on symbolic links */
++		return (ARCHIVE_OK);
++	}
++
+ 	richacl = richacl_alloc(entries);
+ 	if (richacl == NULL) {
+ 		archive_set_error(a, errno,
+@@ -455,7 +460,7 @@
+ #if ARCHIVE_ACL_LIBACL
+ static int
+ set_acl(struct archive *a, int fd, const char *name,
+-    struct archive_acl *abstract_acl,
++    struct archive_acl *abstract_acl, __LA_MODE_T mode,
+     int ae_requested_type, const char *tname)
+ {
+ 	int		 acl_type = 0;
+@@ -488,6 +493,18 @@
+ 		return (ARCHIVE_FAILED);
+ 	}
+ 
++	if (S_ISLNK(mode)) {
++		/* Linux does not support ACLs on symbolic links */
++		return (ARCHIVE_OK);
++	}
++
++	if (acl_type == ACL_TYPE_DEFAULT && !S_ISDIR(mode)) {
++		errno = EINVAL;
++		archive_set_error(a, errno,
++		    "Cannot set default ACL on non-directory");
++		return (ARCHIVE_WARN);
++	}
++
+ 	acl = acl_init(entries);
+ 	if (acl == (acl_t)NULL) {
+ 		archive_set_error(a, errno,
+@@ -727,14 +744,14 @@
+ 	    & ARCHIVE_ENTRY_ACL_TYPE_POSIX1E) != 0) {
+ 		if ((archive_acl_types(abstract_acl)
+ 		    & ARCHIVE_ENTRY_ACL_TYPE_ACCESS) != 0) {
+-			ret = set_acl(a, fd, name, abstract_acl,
++			ret = set_acl(a, fd, name, abstract_acl, mode,
+ 			    ARCHIVE_ENTRY_ACL_TYPE_ACCESS, "access");
+ 			if (ret != ARCHIVE_OK)
+ 				return (ret);
+ 		}
+ 		if ((archive_acl_types(abstract_acl)
+ 		    & ARCHIVE_ENTRY_ACL_TYPE_DEFAULT) != 0)
+-			ret = set_acl(a, fd, name, abstract_acl,
++			ret = set_acl(a, fd, name, abstract_acl, mode,
+ 			    ARCHIVE_ENTRY_ACL_TYPE_DEFAULT, "default");
+ 	}
+ #endif	/* ARCHIVE_ACL_LIBACL */
+--- a/libarchive/archive_disk_acl_sunos.c
++++ b/libarchive/archive_disk_acl_sunos.c
+@@ -443,7 +443,7 @@
+ 
+ static int
+ set_acl(struct archive *a, int fd, const char *name,
+-    struct archive_acl *abstract_acl,
++    struct archive_acl *abstract_acl, __LA_MODE_T mode,
+     int ae_requested_type, const char *tname)
+ {
+ 	aclent_t	 *aclent;
+@@ -467,7 +467,6 @@
+ 	if (entries == 0)
+ 		return (ARCHIVE_OK);
+ 
+-
+ 	switch (ae_requested_type) {
+ 	case ARCHIVE_ENTRY_ACL_TYPE_POSIX1E:
+ 		cmd = SETACL;
+@@ -492,6 +491,12 @@
+ 		return (ARCHIVE_FAILED);
+ 	}
+ 
++        if (S_ISLNK(mode)) {
++                /* Skip ACLs on symbolic links */
++		ret = ARCHIVE_OK;
++		goto exit_free;
++        }
++
+ 	e = 0;
+ 
+ 	while (archive_acl_next(a, abstract_acl, ae_requested_type, &ae_type,
+@@ -801,7 +806,7 @@
+ 	if ((archive_acl_types(abstract_acl)
+ 	    & ARCHIVE_ENTRY_ACL_TYPE_POSIX1E) != 0) {
+ 		/* Solaris writes POSIX.1e access and default ACLs together */
+-		ret = set_acl(a, fd, name, abstract_acl,
++		ret = set_acl(a, fd, name, abstract_acl, mode,
+ 		    ARCHIVE_ENTRY_ACL_TYPE_POSIX1E, "posix1e");
+ 
+ 		/* Simultaneous POSIX.1e and NFSv4 is not supported */
+@@ -810,7 +815,7 @@
+ #if ARCHIVE_ACL_SUNOS_NFS4
+ 	else if ((archive_acl_types(abstract_acl) &
+ 	    ARCHIVE_ENTRY_ACL_TYPE_NFS4) != 0) {
+-		ret = set_acl(a, fd, name, abstract_acl,
++		ret = set_acl(a, fd, name, abstract_acl, mode,
+ 		    ARCHIVE_ENTRY_ACL_TYPE_NFS4, "nfs4");
+ 	}
+ #endif
diff --git a/meta/recipes-extended/libarchive/libarchive_3.4.2.bb b/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
index b7426a1be8..d8ed80686b 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
@@ -36,6 +36,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://CVE-2021-36976-1.patch \
            file://CVE-2021-36976-2.patch \
            file://CVE-2021-36976-3.patch \
+           file://CVE-2021-23177.patch \
 "
 
 SRC_URI[md5sum] = "d953ed6b47694dadf0e6042f8f9ff451"
-- 
2.25.1


