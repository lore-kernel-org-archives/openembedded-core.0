Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A3F7C4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 16:30:33 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.23307.1713889829018164246
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Apr 2024 09:30:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=YxUL4MY1;
 spf=pass (domain: mvista.com, ip: 209.85.222.171, mailfrom: vkumbhar@mvista.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-78f043eaee9so374138285a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 09:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1713889827; x=1714494627; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8ES+t/UpNcfHPBt0m0qOJUDxoX53uWXLH/1DLrf8Tl8=;
        b=YxUL4MY1JZwHhRtt6vNQTEglN1NNy4mz1AW2Y/ORVNyl1Alz0fm4Tg3VGotnkMm1eu
         LdtSRw0wIgWg0UXpf69Wel2bDBWELps1XhVmR0oeVy/5O6pxxoikSq1g2YnGj4bS9Xla
         8pcG/TmEwWBKdtaIQ04gr2CytLRUEDukCIczE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713889827; x=1714494627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ES+t/UpNcfHPBt0m0qOJUDxoX53uWXLH/1DLrf8Tl8=;
        b=aCw6FElweCeCQ0VKR0oHEfHX7L9xXYpCMwOOB2q81gjh/58rsvlX5jG4q+rf03wYFm
         3hkdnfIcDNaB75E9sZWMaKlCggtRyqhXM5U4clbfB5oI4DfBJsVCXT+NC2YYq3rIGR65
         eHU7GboZzLZQAfA9BscTk5UddL9piITCOO8sMkH8RbYqgB3PYfFpjNWy3OdZoV9kOqvB
         hYSKjQmiNESPGKYTKodwqO9KcEQpKS23hCpkCDJDW8YhYPGlL84PdtqQAMW0AQyRByZw
         nkGmRIQnbSR62aRrj4SoiHCFeIJJX0sFlPDwasO7eDK5Z70tJGJXA4nJnEi5Qg22AOww
         kEZA==
X-Gm-Message-State: AOJu0Yyz0C+2YMP92mWZeL30mthyIzonLi17vGz7QJVr4ZXoEeQsXk+X
	RNEBVdAH3VA81o+OZ3R2qZsoSw0AFARSl38zi2/a7wzEKzPIZxn6oeJNTB6gmETEqsMhxGr87ll
	Y
X-Google-Smtp-Source: AGHT+IGtFtrE/a2ItRb8iUfMKH5yVFDvIXWaJ/+0T/V7SW/UYwcT73fln31ZzbGcjiSYBvAceZb0LQ==
X-Received: by 2002:a05:620a:7f6:b0:78d:3d3e:1ad4 with SMTP id k22-20020a05620a07f600b0078d3d3e1ad4mr15191903qkk.54.1713889826878;
        Tue, 23 Apr 2024 09:30:26 -0700 (PDT)
Received: from localhost.localdomain.com ([116.73.94.94])
        by smtp.googlemail.com with ESMTPSA id de28-20020a05620a371c00b0078d6b2b6fdbsm5330279qkb.133.2024.04.23.09.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 09:30:26 -0700 (PDT)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][kirkstone][PATCH] rpm: Backport fix CVE-2021-35939
Date: Tue, 23 Apr 2024 21:58:44 +0530
Message-Id: <20240423162844.1563233-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 16:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198630

Upstream-Status: Backport https://github.com/rpm-software-management/rpm/commit/96ec957e281220f8e137a2d5eb23b83a6377d556
                          https://github.com/rpm-software-management/rpm/commit/fb13f7fd9eff012cb7b9dbf94ac5381c69404055

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../rpm/files/CVE-2021-35939.patch            | 378 ++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.17.1.bb       |   1 +
 2 files changed, 379 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/CVE-2021-35939.patch

diff --git a/meta/recipes-devtools/rpm/files/CVE-2021-35939.patch b/meta/recipes-devtools/rpm/files/CVE-2021-35939.patch
new file mode 100644
index 0000000000..b60cc0e5ce
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/CVE-2021-35939.patch
@@ -0,0 +1,378 @@
+From 96ec957e281220f8e137a2d5eb23b83a6377d556 Mon Sep 17 00:00:00 2001
+From: Panu Matilainen <pmatilai@redhat.com>
+Date: Thu, 10 Feb 2022 14:32:43 +0200
+Subject: [PATCH] Validate intermediate symlinks during installation,
+ CVE-2021-35939
+
+Whenever directory changes during unpacking, walk the entire tree from
+starting from / and validate any symlinks crossed, fail the install
+on invalid links.
+
+This is the first of step of many towards securing our file operations
+against local tamperers and besides plugging that one CVE, paves the way
+for the next step by adding the necessary directory fd tracking.
+This also bumps the rpm OS requirements to a whole new level by requiring
+the *at() family of calls from POSIX-1.2008.
+
+This necessarily does a whole lot of huffing and puffing we previously
+did not do. It should be possible to cache secure (ie root-owned)
+directory structures to avoid validating everything a million times
+but for now, just keeping things simple.
+
+Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/commit/96ec957e281220f8e137a2d5eb23b83a6377d556]
+CVE: CVE-2021-35939
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ INSTALL              |   2 +
+ configure.ac         |   3 +-
+ lib/fsm.c            | 144 +++++++++++++++++++++++++++++++++++++++++--
+ lib/rpmfi.c          |  27 +++++++-
+ lib/rpmfi_internal.h |  17 +++++
+ 5 files changed, 183 insertions(+), 10 deletions(-)
+
+diff --git a/INSTALL b/INSTALL
+index 358e5ae0d..9a9c7b0d0 100644
+--- a/INSTALL
++++ b/INSTALL
+@@ -103,6 +103,8 @@ option to configure).  For GCC, OpenMP 4.5 is fully supported since GCC 6.1,
+ which is available from
+     http://www.gnu.org/
+ 
++Rpm requires a POSIX.1-2008 level operating system.
++
+ To compile RPM:
+ --------------
+ 
+diff --git a/configure.ac b/configure.ac
+index 78c555f90..4ddacdfe2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -570,7 +570,8 @@ AC_CHECK_FUNCS([secure_getenv __secure_getenv])
+ 
+ AC_CHECK_FUNCS(
+    [mkstemp getcwd basename dirname realpath setenv unsetenv regcomp lchown \
+-    utimes getline localtime_r statvfs getaddrinfo ],
++    utimes getline localtime_r statvfs getaddrinfo \
++    openat mkdirat fstatat ],
+    [], [AC_MSG_ERROR([function required by rpm])])
+ 
+ AC_LIBOBJ(fnmatch)
+diff --git a/lib/fsm.c b/lib/fsm.c
+index 935a0a5c6..0b29284e8 100644
+--- a/lib/fsm.c
++++ b/lib/fsm.c
+@@ -8,6 +8,7 @@
+ #include <inttypes.h>
+ #include <utime.h>
+ #include <errno.h>
++#include <fcntl.h>
+ #if WITH_CAP
+ #include <sys/capability.h>
+ #endif
+@@ -20,6 +21,7 @@
+ #include "rpmio/rpmio_internal.h"	/* fdInit/FiniDigest */
+ #include "lib/fsm.h"
+ #include "lib/rpmte_internal.h"	/* XXX rpmfs */
++#include "lib/rpmfi_internal.h" /* rpmfiSetOnChdir */
+ #include "lib/rpmplugins.h"	/* rpm plugins hooks */
+ #include "lib/rpmug.h"
+ 
+@@ -406,17 +408,118 @@ static int fsmRmdir(const char *path)
+     return rc;
+ }
+ 
+-static int fsmMkdir(const char *path, mode_t mode)
++static int fsmMkdir(int dirfd, const char *path, mode_t mode)
+ {
+-    int rc = mkdir(path, (mode & 07777));
++    int rc = mkdirat(dirfd, path, (mode & 07777));
+     if (_fsm_debug)
+-	rpmlog(RPMLOG_DEBUG, " %8s (%s, 0%04o) %s\n", __func__,
+-	       path, (unsigned)(mode & 07777),
++	rpmlog(RPMLOG_DEBUG, " %8s (%d %s, 0%04o) %s\n", __func__,
++	       dirfd, path, (unsigned)(mode & 07777),
+ 	       (rc < 0 ? strerror(errno) : ""));
+     if (rc < 0)	rc = RPMERR_MKDIR_FAILED;
+     return rc;
+ }
+ 
++static int fsmOpenat(int dirfd, const char *path, int flags)
++{
++    struct stat lsb, sb;
++    int sflags = flags | O_NOFOLLOW;
++    int fd = openat(dirfd, path, sflags);
++
++    /*
++     * Only ever follow symlinks by root or target owner. Since we can't
++     * open the symlink itself, the order matters: we stat the link *after*
++     * opening the target, and if the link ownership changed between the calls
++     * it could've only been the link owner or root.
++     */
++    if (fd < 0 && errno == ELOOP && flags != sflags) {
++	int ffd = openat(dirfd, path, flags);
++	if (ffd >= 0 && fstatat(dirfd, path, &lsb, AT_SYMLINK_NOFOLLOW) == 0) {
++	    if (fstat(ffd, &sb) == 0) {
++		if (lsb.st_uid == 0 || lsb.st_uid == sb.st_uid) {
++		    fd = ffd;
++		} else {
++		    close(ffd);
++		}
++	    }
++	}
++    }
++    return fd;
++}
++
++static int fsmDoMkDir(rpmPlugins plugins, int dirfd, const char *dn,
++			int owned, mode_t mode)
++{
++    int rc;
++    rpmFsmOp op = (FA_CREATE);
++    if (!owned)
++	op |= FAF_UNOWNED;
++
++    /* Run fsm file pre hook for all plugins */
++    rc = rpmpluginsCallFsmFilePre(plugins, NULL, dn, mode, op);
++
++    if (!rc)
++	rc = fsmMkdir(dirfd, dn, mode);
++
++    if (!rc) {
++	rc = rpmpluginsCallFsmFilePrepare(plugins, NULL, dn, dn, mode, op);
++    }
++
++    /* Run fsm file post hook for all plugins */
++    rpmpluginsCallFsmFilePost(plugins, NULL, dn, mode, op, rc);
++
++    if (!rc) {
++	rpmlog(RPMLOG_DEBUG,
++		"%s directory created with perms %04o\n",
++		dn, (unsigned)(mode & 07777));
++    }
++
++    return rc;
++}
++
++static int ensureDir(rpmPlugins plugins, const char *p, int owned, int create)
++{
++    char *path = xstrdup(p);
++    char *dp = path;
++    char *sp = NULL, *bn;
++    int oflags = O_RDONLY;
++
++    int dirfd = fsmOpenat(-1, "/", oflags);
++    int fd = dirfd; /* special case of "/" */
++
++    while ((bn = strtok_r(dp, "/", &sp)) != NULL) {
++	struct stat sb;
++	fd = fsmOpenat(dirfd, bn, oflags);
++
++	if (fd < 0 && errno == ENOENT && create) {
++	    mode_t mode = S_IFDIR | (_dirPerms & 07777);
++	    if (fsmDoMkDir(plugins, dirfd, bn, owned, mode) == 0) {
++		fd = fsmOpenat(dirfd, bn, oflags|O_NOFOLLOW);
++	    }
++	}
++
++	if (fd >= 0 && fstat(fd, &sb) == 0 && !S_ISDIR(sb.st_mode)) {
++	    close(fd);
++	    errno = ENOTDIR;
++	    fd = -1;
++	}
++
++	close(dirfd);
++	if (fd >= 0) {
++	    dirfd = fd;
++	} else {
++	    dirfd = -1;
++	    rpmlog(RPMLOG_ERR, _("failed to open dir %s of %s: %s\n"),
++				bn, p, strerror(errno));
++	    break;
++	}
++
++	dp = NULL;
++    }
++
++    free(path);
++    return dirfd;
++}
++
+ static int fsmMkfifo(const char *path, mode_t mode)
+ {
+     int rc = mkfifo(path, (mode & 07777));
+@@ -507,7 +610,7 @@ static int fsmMkdirs(rpmfiles files, rpmfs fs, rpmPlugins plugins)
+ 		rc = rpmpluginsCallFsmFilePre(plugins, NULL, dn, mode, op);
+ 
+ 		if (!rc)
+-		    rc = fsmMkdir(dn, mode);
++		    rc = fsmMkdir(-1, dn, mode);
+ 
+ 		if (!rc) {
+ 		    rc = rpmpluginsCallFsmFilePrepare(plugins, NULL, dn, dn,
+@@ -874,6 +977,21 @@ static void setFileState(rpmfs fs, int i)
+     }
+ }
+ 
++struct diriter_s {
++    int dirfd;
++};
++
++static int onChdir(rpmfi fi, void *data)
++{
++    struct diriter_s *di = data;
++
++    if (di->dirfd >= 0) {
++	close(di->dirfd);
++	di->dirfd = -1;
++    }
++    return 0;
++}
++
+ int rpmPackageFilesInstall(rpmts ts, rpmte te, rpmfiles files,
+               rpmpsm psm, char ** failedFile)
+ {
+@@ -890,6 +1008,7 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te, rpmfiles files,
+     char *tid = NULL;
+     struct filedata_s *fdata = xcalloc(fc, sizeof(*fdata));
+     struct filedata_s *firstlink = NULL;
++    struct diriter_s di = { -1 };
+ 
+     /* transaction id used for temporary path suffix while installing */
+     rasprintf(&tid, ";%08x", (unsigned)rpmtsGetTid(ts));
+@@ -929,6 +1048,7 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te, rpmfiles files,
+         rc = RPMERR_BAD_MAGIC;
+         goto exit;
+     }
++    rpmfiSetOnChdir(fi, onChdir, &di);
+ 
+     /* Detect and create directories not explicitly in package. */
+     if (!rc)
+@@ -943,6 +1063,16 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te, rpmfiles files,
+ 	    if (!fp->suffix) {
+ 		rc = fsmBackup(fi, fp->action);
+ 	    }
++
++	    if (di.dirfd == -1) {
++		di.dirfd = ensureDir(plugins, rpmfiDN(fi), 0,
++				    (fp->action == FA_CREATE));
++		if (di.dirfd == -1) {
++		    rc = RPMERR_OPEN_FAILED;
++		    break;
++		}
++	    }
++
+ 	    /* Assume file does't exist when tmp suffix is in use */
+ 	    if (!fp->suffix) {
+ 		if (fp->action == FA_TOUCH) {
+@@ -977,7 +1107,7 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te, rpmfiles files,
+                     mode_t mode = fp->sb.st_mode;
+                     mode &= ~07777;
+                     mode |=  00700;
+-                    rc = fsmMkdir(fp->fpath, mode);
++                    rc = fsmMkdir(di.dirfd, fp->fpath, mode);
+                 }
+             } else if (S_ISLNK(fp->sb.st_mode)) {
+ 		if (rc == RPMERR_ENOENT) {
+@@ -1019,6 +1149,8 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te, rpmfiles files,
+ 	fp->stage = FILE_UNPACK;
+     }
+     fi = rpmfiFree(fi);
++    close(di.dirfd);
++    di.dirfd = -1;
+ 
+     if (!rc && fx < 0 && fx != RPMERR_ITER_END)
+ 	rc = fx;
+diff --git a/lib/rpmfi.c b/lib/rpmfi.c
+index 33b657aa2..740e257fe 100644
+--- a/lib/rpmfi.c
++++ b/lib/rpmfi.c
+@@ -55,6 +55,9 @@ struct rpmfi_s {
+     int intervalStart;		/*!< Start of iterating interval. */
+     int intervalEnd;		/*!< End of iterating interval. */
+ 
++    rpmfiChdirCb onChdir;	/*!< Callback for directory changes */
++    void *onChdirData;		/*!< Caller private callback data */
++
+     rpmfiles files;		/*!< File info set */
+     rpmcpio_t archive;		/*!< Archive with payload */
+     unsigned char * found;	/*!< Bit field of files found in the archive */
+@@ -309,6 +312,17 @@ int rpmfiDI(rpmfi fi)
+ }
+ #endif
+ 
++int rpmfiSetOnChdir(rpmfi fi, rpmfiChdirCb cb, void *data)
++{
++    int rc = -1;
++    if (fi != NULL) {
++	fi->onChdir = cb;
++	fi->onChdirData = data;
++	rc = 0;
++    }
++    return rc;
++}
++
+ int rpmfiFX(rpmfi fi)
+ {
+     return (fi != NULL ? fi->i : -1);
+@@ -319,9 +333,17 @@ int rpmfiSetFX(rpmfi fi, int fx)
+     int i = -1;
+ 
+     if (fi != NULL && fx >= 0 && fx < rpmfilesFC(fi->files)) {
+-	i = fi->i;
++	int dx = fi->j;
++	i = fi->i;    
+ 	fi->i = fx;
+ 	fi->j = rpmfilesDI(fi->files, fi->i);
++	i = fi->i;
++
++	if (fi->j != dx && fi->onChdir) {
++	    int chrc = fi->onChdir(fi, fi->onChdirData);
++	    if (chrc < 0)
++		i = chrc;
++	}
+     }
+     return i;
+ }
+@@ -1816,10 +1838,9 @@ static rpmfi initIter(rpmfiles files, int itype, int link)
+ 
+     if (files && itype>=0 && itype<=RPMFILEITERMAX) {
+ 	fi = xcalloc(1, sizeof(*fi)); 
+-	fi->i = -1;
++	fi->j = -1;
+ 	fi->files = link ? rpmfilesLink(files) : files;
+ 	fi->next = nextfuncs[itype];
+-	fi->i = -1;
+ 	if (itype == RPMFI_ITER_BACK) {
+ 	    fi->i = rpmfilesFC(fi->files);
+ 	} else if (itype >=RPMFI_ITER_READ_ARCHIVE
+diff --git a/lib/rpmfi_internal.h b/lib/rpmfi_internal.h
+index dccc6ccbe..37f1d45f5 100644
+--- a/lib/rpmfi_internal.h
++++ b/lib/rpmfi_internal.h
+@@ -13,6 +13,23 @@
+ extern "C" {
+ #endif
+ 
++/** \ingroup rpmfi
++ * Callback on file iterator directory changes
++ * @param fi		file info
++ * @param data		caller private callback data
++ * @return		0 on success, < 0 on error (to stop iteration)
++ */
++typedef int (*rpmfiChdirCb)(rpmfi fi, void *data);
++
++/** \ingroup rpmfi
++ * Set a callback for directory changes during iteration.
++ * @param fi		file info
++ * @param cb		callback function
++ * @param data		caller private callback data
++ * @return		string pool handle (weak reference)
++ */
++int rpmfiSetOnChdir(rpmfi fi, rpmfiChdirCb cb, void *data);
++
+ /** \ingroup rpmfi
+  * Return file info set string pool handle
+  * @param fi		file info
+-- 
+2.39.3
+
diff --git a/meta/recipes-devtools/rpm/rpm_4.17.1.bb b/meta/recipes-devtools/rpm/rpm_4.17.1.bb
index 9b6446f265..aad8f2468f 100644
--- a/meta/recipes-devtools/rpm/rpm_4.17.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.17.1.bb
@@ -40,6 +40,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.17.x;protoc
            file://0001-docs-do-not-build-manpages-requires-pandoc.patch \
            file://0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch \
            file://0001-configure.ac-add-linux-gnux32-variant-to-triplet-han.patch \
+           file://CVE-2021-35939.patch \
            "
 
 PE = "1"
-- 
2.39.3


