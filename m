Return-Path: <jeremy.rosen@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23CCFCD98DC
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 14:26:49 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71888.1781274400169903798
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 07:26:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RkmEyDrC;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: jeremy.rosen@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b2b037d2so8976705e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 07:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781274398; x=1781879198; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2NzR+jo5/d07wSnBj2KIdUYTYoLwcmYKe6UPOwiHCk=;
        b=RkmEyDrCNVNqdq95ndFK2/F+3xKHHDntt0UqHiVqUPPp3WaJvpH5fMnWyWhZ3XbAFd
         zYyBZQaOkb08Qwk5XpDDAWwJHUwsWw73yEfLvpoLlkoUKRrnf+s5JVXKjo6jwyibQam7
         YbHbZkvcEjDTP48M0WM2xla9eqUh1Clf9SAEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274398; x=1781879198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E2NzR+jo5/d07wSnBj2KIdUYTYoLwcmYKe6UPOwiHCk=;
        b=dki3AtTag/odK5SiALrrjZfxolqrbJJWOByAsFKK09p+y9+aQA2vetdoUlut0oDdAN
         z8MwlfhC1DwwSpHmz7xCvI0iT4u1SUH5p7EtyBSUiyrc0Qic/3iwgIWvhxAMA1y1e+a6
         XMQyZV8n7S5zqQCYmCW1t9rP7TTz0Ebwe2bvBaGDRQ+Pk/jICP5ljz77ug32uk8EYoqX
         vSNYncnR29hu2SHRDLOsRvVPhakOvwrRcW85EMTZkUF+T+LEYNu0mpBQGNxhtSIZ9sj/
         z0AZv4/S4sEG7r7O06jQ1q5WRok9QmAlUtS4FNS+p0XqinNkZYAKaPgkajeMM9iCTGQ0
         XT2Q==
X-Gm-Message-State: AOJu0YxFiOFCXYSSLzx9DFZ33MMKeib+CEwk9vW8s2a0EcHB7srB5a18
	2ClwkOwQduNtB7OMh7PWhkARwlvMCo5wkfkbNmaf4cjc1S9oPQ/BqlBs703iCJGg3vYJBD77Uar
	iRxHuRw==
X-Gm-Gg: Acq92OHPmC1ObTRdjEA9Ho7dPUMFvTSJwdWeRBB3Fm6p2sIlgH/TQk4CQqeTxYc4pub
	a7aBjBVFeJS7H9TUEznTBh8hgK6/HO9W58/u8CPDyH24UHkB4astH8cPt3AZnRA+GR2tzbXyd1k
	zZWfcceksPWYAFqnbDmMA3H94SnpaCr5FWRhGS2XJHgWwFckAyP5QwOx+/eQRVg8HSKEnLTyhzY
	g7gkFJGxoBH3nvuhBhgxJZ47EvYYQ4SPr2fhkGMalNfImyjQ/gNspp4lb4HGFR92K3G8TyHMEai
	zeRODTHm84PK+0qNa9EmwJ2ZPBakczBtJm+pSuHjLSOPlDdV/Ko/mF4Pb3eqt+B9lf3WG+dXGdy
	BzB7ERfA5TTx2EymTw7+zNwdKoUUrGUXBc/RM0NZQiSW0Pah/Y/aiajsJv4s5enppfsTr7bhN41
	bPgpdVJsMoaIdDeQdJIHFcoic=
X-Received: by 2002:a05:600c:a219:b0:490:b58a:dcc1 with SMTP id 5b1f17b1804b1-490ec50af2dmr24785655e9.29.1781274398189;
        Fri, 12 Jun 2026 07:26:38 -0700 (PDT)
Received: from Logrus.lan ([2001:861:560f:240:8dd0:2c2:7492:641b])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4606f20e77asm6798747f8f.0.2026.06.12.07.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:26:37 -0700 (PDT)
From: Jeremy Rosen <jeremy.rosen@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 03/21] nfs-utils: fix CVE-2025-12801
Date: Fri, 12 Jun 2026 16:25:53 +0200
Message-ID: <33321e687cf18e03bb1d824d58214d758b02078f.1781270474.git.jeremy.rosen@smile.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1781270474.git.jeremy.rosen@smile.fr>
References: <cover.1781270474.git.jeremy.rosen@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 14:26:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238625

From: Sudhir Dumbhare <sudumbha@cisco.com>

- This patch applies the upstream fix [5] as referenced in [7].
- To successfully apply the fixed commit, apply the dependent commits [2] to [4]
  which are included in v2.8.6, as referenced in [7].
- Additionally, include dependent commit [1] from v2.8.3, as referenced in [8]
  under the [2.5.4-38.2] description, along with compilation fix commit [6]
  from v2.7.1
- Reference:
  [1] https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=cd90f2925790
  [2] https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=7e8b36522f58
  [3] https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=42f01e6a78fe
  [4] https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=51738ae56d92
  [5] https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=f36bd900a899
  [6] https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=a2c95e4f557a
  [7] https://security-tracker.debian.org/tracker/CVE-2025-12801
  [8] https://linux.oracle.com/errata/ELSA-2026-3940.html

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
Signed-off-by: Jeremy Rosen <jeremy.rosen@smile.fr>
---
 .../nfs-utils/CVE-2025-12801-build-fix.patch  |  44 ++
 .../CVE-2025-12801-dependent_p1.patch         |  71 +++
 .../CVE-2025-12801-dependent_p2.patch         |  81 +++
 .../CVE-2025-12801-dependent_p3.patch         | 185 +++++++
 .../CVE-2025-12801-dependent_p4.patch         | 468 ++++++++++++++++++
 .../nfs-utils/nfs-utils/CVE-2025-12801.patch  | 254 ++++++++++
 .../nfs-utils/nfs-utils_2.6.4.bb              |   6 +
 7 files changed, 1109 insertions(+)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-build-fix.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p1.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p2.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p3.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p4.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801.patch

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-build-fix.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-build-fix.patch
new file mode 100644
index 0000000000..d7aaca2242
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-build-fix.patch
@@ -0,0 +1,44 @@
+From 30e0f57fff545b0bb3071fa071c7b12c2923bac8 Mon Sep 17 00:00:00 2001
+From: Steve Dickson <steved@redhat.com>
+Date: Mon, 22 Jan 2024 13:23:57 -0500
+Subject: [PATCH] reexport.c: Some Distros need the following include to
+ avoid the following error
+
+reexport.c: In function ‘connect_fsid_service’:
+reexport.c:41:28: error: implicit declaration of function ‘offsetof’ [-Werror=implicit-function-declaration]
+   41 |                 addr_len = offsetof(struct sockaddr_un, sun_path) + strlen(addr.sun_path);
+      |                            ^~~~~~~~
+reexport.c:19:1: note: ‘offsetof’ is defined in header ‘<stddef.h>’; did you forget to ‘#include <stddef.h>’?
+   18 | #include "xlog.h"
+  +++ |+#include <stddef.h>
+   19 |
+reexport.c:41:37: error: expected expression before ‘struct’
+   41 |                 addr_len = offsetof(struct sockaddr_un, sun_path) + strlen(addr.sun_path);
+      |                                     ^~~~~~
+cc1: some warnings being treated as errors
+
+CVE: CVE-2025-12801
+Upstream-Status: Backport [https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=a2c95e4f557a71b482bb62bad6d93ddde51e5dc6]
+
+Signed-off-by: Steve Dickson <steved@redhat.com>
+(cherry picked from commit a2c95e4f557a71b482bb62bad6d93ddde51e5dc6)
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ support/reexport/reexport.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/support/reexport/reexport.c b/support/reexport/reexport.c
+index 78516586..16dde0fb 100644
+--- a/support/reexport/reexport.c
++++ b/support/reexport/reexport.c
+@@ -8,6 +8,7 @@
+ #include <sys/types.h>
+ #include <sys/vfs.h>
+ #include <errno.h>
++#include <stddef.h>
+ 
+ #include "nfsd_path.h"
+ #include "conffile.h"
+-- 
+2.44.4
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p1.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p1.patch
new file mode 100644
index 0000000000..223249a9d6
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p1.patch
@@ -0,0 +1,71 @@
+From 647c9cb3ac3cbdf9ffd9e29f7d5dd04da84afdbc Mon Sep 17 00:00:00 2001
+From: Christopher Bii <christopherbii@hyub.org>
+Date: Wed, 15 Jan 2025 12:10:48 -0500
+Subject: [PATCH] NFS export symlink vulnerability fix
+
+Replaced dangerous use of realpath within support/nfs/export.c with
+nfsd_realpath variant that is executed within the chrooted thread
+rather than main thread.
+
+Implemented nfsd_path.h methods to work securely within chrooted
+thread using nfsd_run_task() help
+
+CVE: CVE-2025-12801
+Upstream-Status: Backport [https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=cd90f29257904f36509ea5a04a86f42398fbe94a]
+
+Backport Changes:
+- In support/misc/nfsd_path.c file, only nfsd_run_task() and the
+  struct nfsd_task_t have been included to resolve a compilation
+  issue. All other non-essential changes were excluded.
+- The non-required file support/export/cache.c and support/nfs/exports.c
+  has been excluded.
+
+Signed-off-by: Christopher Bii <christopherbii@hyub.org>
+Signed-off-by: Steve Dickson <steved@redhat.com>
+(cherry picked from commit cd90f29257904f36509ea5a04a86f42398fbe94a)
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ support/include/nfsd_path.h |  1 +
+ support/misc/nfsd_path.c    | 14 +++++++++++++-
+ 2 files changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/support/include/nfsd_path.h b/support/include/nfsd_path.h
+index aa1e1dd0..4f5fc44e 100644
+--- a/support/include/nfsd_path.h
++++ b/support/include/nfsd_path.h
+@@ -8,6 +8,7 @@
+ 
+ struct file_handle;
+ struct statfs;
++struct nfsd_task_t;
+ 
+ void 		nfsd_path_init(void);
+ 
+diff --git a/support/misc/nfsd_path.c b/support/misc/nfsd_path.c
+index c3dea4f0..fa908f7c 100644
+--- a/support/misc/nfsd_path.c
++++ b/support/misc/nfsd_path.c
+@@ -19,7 +19,19 @@
+ #include "nfsd_path.h"
+ #include "workqueue.h"
+ 
+-static struct xthread_workqueue *nfsd_wq;
++static struct xthread_workqueue *nfsd_wq = NULL;
++
++struct nfsd_task_t {
++        int             ret;
++        void*           data;
++};
++/* Function used to offload tasks that must be ran within the correct
++ * chroot environment.
++ */
++static void
++nfsd_run_task(void (*func)(void*), void* data){
++        nfsd_wq ? xthread_work_run_sync(nfsd_wq, func, data) : func(data);
++};
+ 
+ static int
+ nfsd_path_isslash(const char *path)
+-- 
+2.35.6
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p2.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p2.patch
new file mode 100644
index 0000000000..f088eadb4b
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p2.patch
@@ -0,0 +1,81 @@
+From a6ddd0e9594884cf61816478e8c561f1b3aac709 Mon Sep 17 00:00:00 2001
+From: Trond Myklebust <trond.myklebust@hammerspace.com>
+Date: Mon, 10 Nov 2025 11:26:03 -0500
+Subject: [PATCH] mountd: Minor refactor of get_rootfh()
+
+Perform the mountpoint checks before checking the user path.
+
+CVE: CVE-2025-12801
+Upstream-Status: Backport [https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=7e8b36522f58657359c6842119fc516c6dd1baa4]
+
+Reviewed-by: Jeff Layton <jlayton@kernel.org>
+Signed-off-by: Trond Myklebust <trond.myklebust@hammerspace.com>
+Signed-off-by: Steve Dickson <steved@redhat.com>
+(cherry picked from commit 7e8b36522f58657359c6842119fc516c6dd1baa4)
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ utils/mountd/mountd.c | 34 +++++++++++++++++-----------------
+ 1 file changed, 17 insertions(+), 17 deletions(-)
+
+diff --git a/utils/mountd/mountd.c b/utils/mountd/mountd.c
+index dbd5546d..39afd4aa 100644
+--- a/utils/mountd/mountd.c
++++ b/utils/mountd/mountd.c
+@@ -412,6 +412,23 @@ get_rootfh(struct svc_req *rqstp, dirpath *path, nfs_export **expret,
+ 		*error = MNT3ERR_ACCES;
+ 		return NULL;
+ 	}
++	if (nfsd_path_stat(exp->m_export.e_path, &estb) < 0) {
++		xlog(L_WARNING, "can't stat export point %s: %s",
++		     p, strerror(errno));
++		*error = MNT3ERR_NOENT;
++		return NULL;
++	}
++	if (exp->m_export.e_mountpoint &&
++		   !check_is_mountpoint(exp->m_export.e_mountpoint[0]?
++				  exp->m_export.e_mountpoint:
++				  exp->m_export.e_path,
++				  nfsd_path_lstat)) {
++		xlog(L_WARNING, "request to export an unmounted filesystem: %s",
++		     p);
++		*error = MNT3ERR_NOENT;
++		return NULL;
++	}
++
+ 	if (nfsd_path_stat(p, &stb) < 0) {
+ 		xlog(L_WARNING, "can't stat exported dir %s: %s",
+ 				p, strerror(errno));
+@@ -426,12 +443,6 @@ get_rootfh(struct svc_req *rqstp, dirpath *path, nfs_export **expret,
+ 		*error = MNT3ERR_NOTDIR;
+ 		return NULL;
+ 	}
+-	if (nfsd_path_stat(exp->m_export.e_path, &estb) < 0) {
+-		xlog(L_WARNING, "can't stat export point %s: %s",
+-		     p, strerror(errno));
+-		*error = MNT3ERR_NOENT;
+-		return NULL;
+-	}
+ 	if (estb.st_dev != stb.st_dev
+ 	    && !(exp->m_export.e_flags & NFSEXP_CROSSMOUNT)) {
+ 		xlog(L_WARNING, "request to export directory %s below nearest filesystem %s",
+@@ -439,17 +450,6 @@ get_rootfh(struct svc_req *rqstp, dirpath *path, nfs_export **expret,
+ 		*error = MNT3ERR_ACCES;
+ 		return NULL;
+ 	}
+-	if (exp->m_export.e_mountpoint &&
+-		   !check_is_mountpoint(exp->m_export.e_mountpoint[0]?
+-				  exp->m_export.e_mountpoint:
+-				  exp->m_export.e_path,
+-				  nfsd_path_lstat)) {
+-		xlog(L_WARNING, "request to export an unmounted filesystem: %s",
+-		     p);
+-		*error = MNT3ERR_NOENT;
+-		return NULL;
+-	}
+-
+ 	/* This will be a static private nfs_export with just one
+ 	 * address.  We feed it to kernel then extract the filehandle,
+ 	 */
+-- 
+2.44.4
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p3.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p3.patch
new file mode 100644
index 0000000000..59b28b557a
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p3.patch
@@ -0,0 +1,185 @@
+From 0c2561328ce5e09636663ac2312b5f1f52fc0111 Mon Sep 17 00:00:00 2001
+From: Trond Myklebust <trond.myklebust@hammerspace.com>
+Date: Mon, 10 Nov 2025 11:28:39 -0500
+Subject: [PATCH] mountd: Separate lookup of the exported directory and the
+ mount path
+
+When the caller asks to mount a path that does not terminate with an
+exported directory, we want to split up the lookups so that we can
+look up the exported directory using the mountd privileged credential,
+and the remaining subdirectory lookups using the RPC caller's
+credential.
+
+CVE: CVE-2025-12801
+Upstream-Status: Backport [https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=42f01e6a78fed98f12437ac8b28cfb12b6bad056]
+
+Backport Changes:
+- In support/misc/nfsd_path.c, the closing brace of struct
+  nfsd_read_data was adjusted from line 320 to 282.
+
+Reviewed-by: Jeff Layton <jlayton@kernel.org>
+Signed-off-by: Trond Myklebust <trond.myklebust@hammerspace.com>
+Signed-off-by: Steve Dickson <steved@redhat.com>
+(cherry picked from commit 42f01e6a78fed98f12437ac8b28cfb12b6bad056)
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ support/include/nfsd_path.h |  1 +
+ support/misc/nfsd_path.c    | 31 ++++++++++++++++++
+ utils/mountd/mountd.c       | 63 +++++++++++++++++++++++++++++++------
+ 3 files changed, 86 insertions(+), 9 deletions(-)
+
+diff --git a/support/include/nfsd_path.h b/support/include/nfsd_path.h
+index 4f5fc44e..be2dc38d 100644
+--- a/support/include/nfsd_path.h
++++ b/support/include/nfsd_path.h
+@@ -18,6 +18,7 @@ char *		nfsd_path_prepend_dir(const char *dir, const char *pathname);
+ 
+ int 		nfsd_path_stat(const char *pathname, struct stat *statbuf);
+ int 		nfsd_path_lstat(const char *pathname, struct stat *statbuf);
++int		nfsd_openat(int dirfd, const char *path, int flags);
+ 
+ int		nfsd_path_statfs(const char *pathname,
+ 				   struct statfs *statbuf);
+diff --git a/support/misc/nfsd_path.c b/support/misc/nfsd_path.c
+index fa908f7c..1c5aa3f3 100644
+--- a/support/misc/nfsd_path.c
++++ b/support/misc/nfsd_path.c
+@@ -280,6 +280,37 @@ struct nfsd_read_data {
+ 	int err;
+ };
+ 
++struct nfsd_openat_t {
++	const char *path;
++	int dirfd;
++	int flags;
++	int res_fd;
++	int res_error;
++};
++
++static void nfsd_openatfunc(void *data)
++{
++	struct nfsd_openat_t *d = data;
++
++	d->res_fd = openat(d->dirfd, d->path, d->flags);
++	if (d->res_fd == -1)
++		d->res_error = errno;
++}
++
++int nfsd_openat(int dirfd, const char *path, int flags)
++{
++	struct nfsd_openat_t open_buf = {
++		.path = path,
++		.dirfd = dirfd,
++		.flags = flags,
++	};
++
++	nfsd_run_task(nfsd_openatfunc, &open_buf);
++	if (open_buf.res_fd == -1)
++		errno = open_buf.res_error;
++	return open_buf.res_fd;
++}
++
+ static void
+ nfsd_readfunc(void *data)
+ {
+diff --git a/utils/mountd/mountd.c b/utils/mountd/mountd.c
+index 39afd4aa..f43ebef5 100644
+--- a/utils/mountd/mountd.c
++++ b/utils/mountd/mountd.c
+@@ -392,7 +392,10 @@ get_rootfh(struct svc_req *rqstp, dirpath *path, nfs_export **expret,
+ 	struct nfs_fh_len *fh;
+ 	char		rpath[MAXPATHLEN+1];
+ 	char		*p = *path;
++	char		*subpath;
+ 	char		buf[INET6_ADDRSTRLEN];
++	size_t		epathlen;
++	int		dirfd;
+ 
+ 	if (*p == '\0')
+ 		p = "/";
+@@ -412,12 +415,21 @@ get_rootfh(struct svc_req *rqstp, dirpath *path, nfs_export **expret,
+ 		*error = MNT3ERR_ACCES;
+ 		return NULL;
+ 	}
+-	if (nfsd_path_stat(exp->m_export.e_path, &estb) < 0) {
+-		xlog(L_WARNING, "can't stat export point %s: %s",
++
++	dirfd = nfsd_openat(AT_FDCWD, exp->m_export.e_path, O_PATH);
++	if (dirfd == -1) {
++		xlog(L_WARNING, "can't open export point %s: %s",
+ 		     p, strerror(errno));
+ 		*error = MNT3ERR_NOENT;
+ 		return NULL;
+ 	}
++	if (fstat(dirfd, &estb) == -1) {
++		xlog(L_WARNING, "can't stat export point %s: %s",
++		     p, strerror(errno));
++		*error = MNT3ERR_ACCES;
++		close(dirfd);
++		return NULL;
++	}
+ 	if (exp->m_export.e_mountpoint &&
+ 		   !check_is_mountpoint(exp->m_export.e_mountpoint[0]?
+ 				  exp->m_export.e_mountpoint:
+@@ -426,18 +438,51 @@ get_rootfh(struct svc_req *rqstp, dirpath *path, nfs_export **expret,
+ 		xlog(L_WARNING, "request to export an unmounted filesystem: %s",
+ 		     p);
+ 		*error = MNT3ERR_NOENT;
++		close(dirfd);
+ 		return NULL;
+ 	}
+ 
+-	if (nfsd_path_stat(p, &stb) < 0) {
+-		xlog(L_WARNING, "can't stat exported dir %s: %s",
+-				p, strerror(errno));
+-		if (errno == ENOENT)
+-			*error = MNT3ERR_NOENT;
+-		else
+-			*error = MNT3ERR_ACCES;
++	epathlen = strlen(exp->m_export.e_path);
++	if (epathlen > strlen(p)) {
++		xlog(L_WARNING, "raced with change of exported path: %s", p);
++		*error = MNT3ERR_NOENT;
++		close(dirfd);
+ 		return NULL;
+ 	}
++	subpath = &p[epathlen];
++	while (*subpath == '/')
++		subpath++;
++	if (*subpath != '\0') {
++		int fd;
++
++		/* Just perform a lookup of the path */
++		fd = nfsd_openat(dirfd, subpath, O_PATH);
++		close(dirfd);
++		if (fd == -1) {
++			xlog(L_WARNING, "can't open exported dir %s: %s", p,
++			     strerror(errno));
++			if (errno == ENOENT)
++				*error = MNT3ERR_NOENT;
++			else
++				*error = MNT3ERR_ACCES;
++			return NULL;
++		}
++		if (fstat(fd, &stb) == -1) {
++			xlog(L_WARNING, "can't open exported dir %s: %s", p,
++			     strerror(errno));
++			if (errno == ENOENT)
++				*error = MNT3ERR_NOENT;
++			else
++				*error = MNT3ERR_ACCES;
++			close(fd);
++			return NULL;
++		}
++		close(fd);
++	} else {
++		close(dirfd);
++		stb = estb;
++	}
++
+ 	if (!S_ISDIR(stb.st_mode) && !S_ISREG(stb.st_mode)) {
+ 		xlog(L_WARNING, "%s is not a directory or regular file", p);
+ 		*error = MNT3ERR_NOTDIR;
+-- 
+2.44.4
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p4.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p4.patch
new file mode 100644
index 0000000000..4ef529e737
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p4.patch
@@ -0,0 +1,468 @@
+From 7eef498b6bd01adc45415b03ddf321c84f82aa45 Mon Sep 17 00:00:00 2001
+From: Trond Myklebust <trond.myklebust@hammerspace.com>
+Date: Mon, 10 Nov 2025 12:18:38 -0500
+Subject: [PATCH] support: Add a mini-library to extract and apply RPC
+ credentials
+
+Add server functionality to extract the credentials from the client RPC
+call, and apply them. This is needed in order to perform access checking
+on the requested path in the mountd daemon.
+
+CVE: CVE-2025-12801
+Upstream-Status: Backport [https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=51738ae56d922d4961e60dad73ad1c2d97d8d99b]
+
+Backport Changes:
+- In support/misc/Makefile.am, the non-essential file.c was omitted
+  as it does not exist in the current nfs-utils version.
+
+Reviewed-by: Jeff Layton <jlayton@kernel.org>
+Signed-off-by: Trond Myklebust <trond.myklebust@hammerspace.com>
+Signed-off-by: Steve Dickson <steved@redhat.com>
+(cherry picked from commit 51738ae56d922d4961e60dad73ad1c2d97d8d99b)
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ aclocal/libtirpc.m4         |  11 +++
+ support/include/Makefile.am |   1 +
+ support/include/nfs_ucred.h |  44 ++++++++++
+ support/misc/Makefile.am    |   2 +-
+ support/misc/ucred.c        | 162 ++++++++++++++++++++++++++++++++++++
+ support/nfs/Makefile.am     |   2 +-
+ support/nfs/ucred.c         | 147 ++++++++++++++++++++++++++++++++
+ 7 files changed, 367 insertions(+), 2 deletions(-)
+ create mode 100644 support/include/nfs_ucred.h
+ create mode 100644 support/misc/ucred.c
+ create mode 100644 support/nfs/ucred.c
+
+diff --git a/aclocal/libtirpc.m4 b/aclocal/libtirpc.m4
+index bddae022..84e18f7e 100644
+--- a/aclocal/libtirpc.m4
++++ b/aclocal/libtirpc.m4
+@@ -26,6 +26,17 @@ AC_DEFUN([AC_LIBTIRPC], [
+                                     [Define to 1 if your tirpc library provides libtirpc_set_debug])],,
+                          [${LIBS}])])
+ 
++     AS_IF([test -n "${LIBTIRPC}"],
++           [AC_CHECK_LIB([tirpc], [rpc_gss_getcred],
++                         [AC_DEFINE([HAVE_TIRPC_GSS_GETCRED], [1],
++                                    [Define to 1 if your tirpc library provides rpc_gss_getcred])],,
++                         [${LIBS}])])
++
++     AS_IF([test -n "${LIBTIRPC}"],
++           [AC_CHECK_LIB([tirpc], [authdes_getucred],
++                         [AC_DEFINE([HAVE_TIRPC_AUTHDES_GETUCRED], [1],
++                                    [Define to 1 if your tirpc library provides authdes_getucred])],,
++                         [${LIBS}])])
+   AC_SUBST([AM_CPPFLAGS])
+   AC_SUBST(LIBTIRPC)
+ 
+diff --git a/support/include/Makefile.am b/support/include/Makefile.am
+index 1373891a..631a84f8 100644
+--- a/support/include/Makefile.am
++++ b/support/include/Makefile.am
+@@ -10,6 +10,7 @@ noinst_HEADERS = \
+ 	misc.h \
+ 	nfs_mntent.h \
+ 	nfs_paths.h \
++	nfs_ucred.h \
+ 	nfsd_path.h \
+ 	nfslib.h \
+ 	nfsrpc.h \
+diff --git a/support/include/nfs_ucred.h b/support/include/nfs_ucred.h
+new file mode 100644
+index 00000000..d58b61e4
+--- /dev/null
++++ b/support/include/nfs_ucred.h
+@@ -0,0 +1,44 @@
++#ifndef _NFS_UCRED_H
++#define _NFS_UCRED_H
++
++#include <sys/types.h>
++
++struct nfs_ucred {
++	uid_t uid;
++	gid_t gid;
++	int ngroups;
++	gid_t *groups;
++};
++
++struct svc_req;
++struct exportent;
++
++int nfs_ucred_get(struct nfs_ucred **credp, struct svc_req *rqst,
++		  const struct exportent *ep);
++
++void nfs_ucred_squash_groups(struct nfs_ucred *cred,
++			     const struct exportent *ep);
++int nfs_ucred_reload_groups(struct nfs_ucred *cred, const struct exportent *ep);
++int nfs_ucred_swap_effective(const struct nfs_ucred *cred,
++			     struct nfs_ucred **savedp);
++
++static inline void nfs_ucred_free(struct nfs_ucred *cred)
++{
++	free(cred->groups);
++	free(cred);
++}
++
++static inline void nfs_ucred_init_groups(struct nfs_ucred *cred, gid_t *groups,
++					 int ngroups)
++{
++	cred->groups = groups;
++	cred->ngroups = ngroups;
++}
++
++static inline void nfs_ucred_free_groups(struct nfs_ucred *cred)
++{
++	free(cred->groups);
++	nfs_ucred_init_groups(cred, NULL, 0);
++}
++
++#endif /* _NFS_UCRED_H */
+diff --git a/support/misc/Makefile.am b/support/misc/Makefile.am
+index 8b0e9db9..ea970064 100644
+--- a/support/misc/Makefile.am
++++ b/support/misc/Makefile.am
+@@ -2,6 +2,6 @@
+ 
+ noinst_LIBRARIES = libmisc.a
+ libmisc_a_SOURCES = tcpwrapper.c from_local.c mountpoint.c misc.c \
+-		    nfsd_path.c workqueue.c xstat.c
++		    nfsd_path.c ucred.c workqueue.c xstat.c
+ 
+ MAINTAINERCLEANFILES = Makefile.in
+diff --git a/support/misc/ucred.c b/support/misc/ucred.c
+new file mode 100644
+index 00000000..92d97912
+--- /dev/null
++++ b/support/misc/ucred.c
+@@ -0,0 +1,162 @@
++#ifdef HAVE_CONFIG_H
++#include <config.h>
++#endif
++
++#include <alloca.h>
++#include <errno.h>
++#include <pwd.h>
++#include <stdlib.h>
++#include <unistd.h>
++#include <grp.h>
++
++#include "exportfs.h"
++#include "nfs_ucred.h"
++
++#include "xlog.h"
++
++void nfs_ucred_squash_groups(struct nfs_ucred *cred, const struct exportent *ep)
++{
++	int i;
++
++	if (!(ep->e_flags & NFSEXP_ROOTSQUASH))
++		return;
++	if (cred->gid == 0)
++		cred->gid = ep->e_anongid;
++	for (i = 0; i < cred->ngroups; i++) {
++		if (cred->groups[i] == 0)
++			cred->groups[i] = ep->e_anongid;
++	}
++}
++
++static int nfs_ucred_init_effective(struct nfs_ucred *cred)
++{
++	int ngroups = getgroups(0, NULL);
++
++	if (ngroups > 0) {
++		size_t sz = ngroups * sizeof(gid_t);
++		gid_t *groups = malloc(sz);
++		if (groups == NULL)
++			return ENOMEM;
++		if (getgroups(ngroups, groups) == -1) {
++			free(groups);
++			return errno;
++		}
++		nfs_ucred_init_groups(cred, groups, ngroups);
++	} else
++		nfs_ucred_init_groups(cred, NULL, 0);
++	cred->uid = geteuid();
++	cred->gid = getegid();
++	return 0;
++}
++
++static size_t nfs_ucred_getpw_r_size_max(void)
++{
++	long buflen = sysconf(_SC_GETPW_R_SIZE_MAX);
++
++	if (buflen == -1)
++		return 16384;
++	return buflen;
++}
++
++int nfs_ucred_reload_groups(struct nfs_ucred *cred, const struct exportent *ep)
++{
++	struct passwd pwd, *pw;
++	uid_t uid = cred->uid;
++	gid_t gid = cred->gid;
++	size_t buflen;
++	char *buf;
++	int ngroups = 0;
++	int ret;
++
++	if (ep->e_flags & (NFSEXP_ALLSQUASH | NFSEXP_ROOTSQUASH) &&
++	    (int)uid == ep->e_anonuid)
++		return 0;
++	buflen = nfs_ucred_getpw_r_size_max();
++	buf = alloca(buflen);
++	ret = getpwuid_r(uid, &pwd, buf, buflen, &pw);
++	if (ret != 0)
++		return ret;
++	if (!pw)
++		return ENOENT;
++	if (getgrouplist(pw->pw_name, gid, NULL, &ngroups) == -1 &&
++	    ngroups > 0) {
++		gid_t *groups = malloc(ngroups * sizeof(groups[0]));
++		if (groups == NULL)
++			return ENOMEM;
++		if (getgrouplist(pw->pw_name, gid, groups, &ngroups) == -1) {
++			free(groups);
++			return ENOMEM;
++		}
++		free(cred->groups);
++		nfs_ucred_init_groups(cred, groups, ngroups);
++		nfs_ucred_squash_groups(cred, ep);
++	} else
++		nfs_ucred_free_groups(cred);
++	return 0;
++}
++
++static int nfs_ucred_set_effective(const struct nfs_ucred *cred,
++				   const struct nfs_ucred *saved)
++{
++	uid_t suid = saved ? saved->uid : geteuid();
++	gid_t sgid = saved ? saved->gid : getegid();
++	int ret;
++
++	/* Start with a privileged effective user */
++	if (setresuid(-1, 0, -1) < 0) {
++		xlog(L_WARNING, "can't change privileged user %u-%u. %s",
++		     geteuid(), getegid(), strerror(errno));
++		return errno;
++	}
++
++	if (setgroups(cred->ngroups, cred->groups) == -1) {
++		xlog(L_WARNING, "can't change groups for user %u-%u. %s",
++		     geteuid(), getegid(), strerror(errno));
++		return errno;
++	}
++	if (setresgid(-1, cred->gid, sgid) == -1) {
++		xlog(L_WARNING, "can't change gid for user %u-%u. %s",
++		     geteuid(), getegid(), strerror(errno));
++		ret = errno;
++		goto restore_groups;
++	}
++	if (setresuid(-1, cred->uid, suid) == -1) {
++		xlog(L_WARNING, "can't change uid for user %u-%u. %s",
++		     geteuid(), getegid(), strerror(errno));
++		ret = errno;
++		goto restore_gid;
++	}
++	return 0;
++restore_gid:
++	if (setresgid(-1, sgid, -1) < 0) {
++		xlog(L_WARNING, "can't restore privileged user %u-%u. %s",
++		     geteuid(), getegid(), strerror(errno));
++	}
++restore_groups:
++	if (saved)
++		setgroups(saved->ngroups, saved->groups);
++	else
++		setgroups(0, NULL);
++	return ret;
++}
++
++int nfs_ucred_swap_effective(const struct nfs_ucred *cred,
++			     struct nfs_ucred **savedp)
++{
++	struct nfs_ucred *saved = malloc(sizeof(*saved));
++	int ret;
++
++	if (saved == NULL)
++		return ENOMEM;
++	ret = nfs_ucred_init_effective(saved);
++	if (ret != 0) {
++		free(saved);
++		return ret;
++	}
++	ret = nfs_ucred_set_effective(cred, saved);
++	if (savedp == NULL || ret != 0)
++		nfs_ucred_free(saved);
++	else
++		*savedp = saved;
++	return ret;
++}
+diff --git a/support/nfs/Makefile.am b/support/nfs/Makefile.am
+index 2e1577cc..f6921265 100644
+--- a/support/nfs/Makefile.am
++++ b/support/nfs/Makefile.am
+@@ -7,7 +7,7 @@ libnfs_la_SOURCES = exports.c rmtab.c xio.c rpcmisc.c rpcdispatch.c \
+ 		   xcommon.c wildmat.c mydaemon.c \
+ 		   rpc_socket.c getport.c \
+ 		   svc_socket.c cacheio.c closeall.c nfs_mntent.c \
+-		   svc_create.c atomicio.c strlcat.c strlcpy.c
++		   svc_create.c atomicio.c strlcat.c strlcpy.c ucred.c
+ libnfs_la_LIBADD = libnfsconf.la
+ libnfs_la_CPPFLAGS = $(AM_CPPFLAGS) $(CPPFLAGS) -I$(top_srcdir)/support/reexport
+ 
+diff --git a/support/nfs/ucred.c b/support/nfs/ucred.c
+new file mode 100644
+index 00000000..6ea8efdf
+--- /dev/null
++++ b/support/nfs/ucred.c
+@@ -0,0 +1,147 @@
++#ifdef HAVE_CONFIG_H
++#include <config.h>
++#endif
++
++#include <errno.h>
++#include <stdlib.h>
++#include <unistd.h>
++#include <rpc/rpc.h>
++
++#include "exportfs.h"
++#include "nfs_ucred.h"
++
++#ifdef HAVE_TIRPC_GSS_GETCRED
++#include <rpc/rpcsec_gss.h>
++#endif /* HAVE_TIRPC_GSS_GETCRED */
++#ifdef HAVE_TIRPC_AUTHDES_GETUCRED
++#include <rpc/auth_des.h>
++#endif /* HAVE_TIRPC_AUTHDES_GETUCRED */
++
++static int nfs_ucred_copy_cred(struct nfs_ucred *cred, uid_t uid, gid_t gid,
++			       const gid_t *groups, int ngroups)
++{
++	if (ngroups > 0) {
++		size_t sz = ngroups * sizeof(groups[0]);
++		cred->groups = malloc(sz);
++		if (cred->groups == NULL)
++			return ENOMEM;
++		cred->ngroups = ngroups;
++		memcpy(cred->groups, groups, sz);
++	} else
++		nfs_ucred_init_groups(cred, NULL, 0);
++	cred->uid = uid;
++	cred->gid = gid;
++	return 0;
++}
++
++static int nfs_ucred_init_cred_squashed(struct nfs_ucred *cred,
++					const struct exportent *ep)
++{
++	cred->uid = ep->e_anonuid;
++	cred->gid = ep->e_anongid;
++	nfs_ucred_init_groups(cred, NULL, 0);
++	return 0;
++}
++
++static int nfs_ucred_init_cred(struct nfs_ucred *cred, uid_t uid, gid_t gid,
++			       const gid_t *groups, int ngroups,
++			       const struct exportent *ep)
++{
++	if (ep->e_flags & NFSEXP_ALLSQUASH) {
++		nfs_ucred_init_cred_squashed(cred, ep);
++	} else if (ep->e_flags & NFSEXP_ROOTSQUASH && uid == 0) {
++		nfs_ucred_init_cred_squashed(cred, ep);
++		if (gid != 0)
++			cred->gid = gid;
++	} else {
++		int ret = nfs_ucred_copy_cred(cred, uid, gid, groups, ngroups);
++		if (ret != 0)
++			return ret;
++		nfs_ucred_squash_groups(cred, ep);
++	}
++	return 0;
++}
++
++static int nfs_ucred_init_null(struct nfs_ucred *cred,
++			       const struct exportent *ep)
++{
++	return nfs_ucred_init_cred_squashed(cred, ep);
++}
++
++static int nfs_ucred_init_unix(struct nfs_ucred *cred, struct svc_req *rqst,
++			       const struct exportent *ep)
++{
++	struct authunix_parms *aup;
++
++	aup = (struct authunix_parms *)rqst->rq_clntcred;
++	return nfs_ucred_init_cred(cred, aup->aup_uid, aup->aup_gid,
++				   aup->aup_gids, aup->aup_len, ep);
++}
++
++#ifdef HAVE_TIRPC_GSS_GETCRED
++static int nfs_ucred_init_gss(struct nfs_ucred *cred, struct svc_req *rqst,
++			      const struct exportent *ep)
++{
++	rpc_gss_ucred_t *gss_ucred = NULL;
++
++	if (!rpc_gss_getcred(rqst, NULL, &gss_ucred, NULL) || gss_ucred == NULL)
++		return EINVAL;
++	return nfs_ucred_init_cred(cred, gss_ucred->uid, gss_ucred->gid,
++				   gss_ucred->gidlist, gss_ucred->gidlen, ep);
++}
++#endif /* HAVE_TIRPC_GSS_GETCRED */
++
++#ifdef HAVE_TIRPC_AUTHDES_GETUCRED
++int authdes_getucred(struct authdes_cred *adc, uid_t *uid, gid_t *gid,
++		     int *grouplen, gid_t *groups);
++
++static int nfs_ucred_init_des(struct nfs_ucred *cred, struct svc_req *rqst,
++			      const struct exportent *ep)
++{
++	struct authdes_cred *des_cred;
++	uid_t uid;
++	gid_t gid;
++	int grouplen;
++	gid_t groups[NGROUPS];
++
++	des_cred = (struct authdes_cred *)rqst->rq_clntcred;
++	if (!authdes_getucred(des_cred, &uid, &gid, &grouplen, &groups[0]))
++		return EINVAL;
++	return nfs_ucred_init_cred(cred, uid, gid, groups, grouplen, ep);
++}
++#endif /* HAVE_TIRPC_AUTHDES_GETUCRED */
++
++int nfs_ucred_get(struct nfs_ucred **credp, struct svc_req *rqst,
++		  const struct exportent *ep)
++{
++	struct nfs_ucred *cred = malloc(sizeof(*cred));
++	int ret;
++
++	*credp = NULL;
++	if (cred == NULL)
++		return ENOMEM;
++	switch (rqst->rq_cred.oa_flavor) {
++	case AUTH_UNIX:
++		ret = nfs_ucred_init_unix(cred, rqst, ep);
++		break;
++#ifdef HAVE_TIRPC_GSS_GETCRED
++	case RPCSEC_GSS:
++		ret = nfs_ucred_init_gss(cred, rqst, ep);
++		break;
++#endif /* HAVE_TIRPC_GSS_GETCRED */
++#ifdef HAVE_TIRPC_AUTHDES_GETUCRED
++	case AUTH_DES:
++		ret = nfs_ucred_init_des(cred, rqst, ep);
++		break;
++#endif /* HAVE_TIRPC_AUTHDES_GETUCRED */
++	default:
++		ret = nfs_ucred_init_null(cred, ep);
++		break;
++	}
++	if (ret == 0) {
++		*credp = cred;
++		return 0;
++	}
++	free(cred);
++	return ret;
++}
+-- 
+2.44.4
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801.patch
new file mode 100644
index 0000000000..3381d6e645
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801.patch
@@ -0,0 +1,254 @@
+From e22a15eb39c88367c35bfd4e057bccbddc6519d4 Mon Sep 17 00:00:00 2001
+From: Trond Myklebust <trond.myklebust@hammerspace.com>
+Date: Thu, 5 Mar 2026 10:41:02 -0500
+Subject: [PATCH] Fix access checks when mounting subdirectories in NFSv3
+
+If a NFSv3 client asks to mount a subdirectory of one of the exported
+directories, then apply the RPC credential together with any root
+or all squash rules that would apply to the client in question.
+
+CVE: CVE-2025-12801
+Upstream-Status: Backport [https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=f36bd900a899088ca1925de079bd58d6205a1f3c]
+
+Reviewed-by: Jeff Layton <jlayton@kernel.org>
+Signed-off-by: Trond Myklebust <trond.myklebust@hammerspace.com>
+Signed-off-by: Scott Mayhew <smayhew@redhat.com>
+Signed-off-by: Steve Dickson <steved@redhat.com>
+(cherry picked from commit f36bd900a899088ca1925de079bd58d6205a1f3c)
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ nfs.conf                    |  1 +
+ support/include/nfsd_path.h |  9 ++++++++-
+ support/misc/nfsd_path.c    | 32 ++++++++++++++++++++++++++++++--
+ utils/mountd/mountd.c       | 28 ++++++++++++++++++++++++++--
+ utils/mountd/mountd.man     | 26 ++++++++++++++++++++++++++
+ 5 files changed, 91 insertions(+), 5 deletions(-)
+
+diff --git a/nfs.conf b/nfs.conf
+index 323f072b..e08cd9a9 100644
+--- a/nfs.conf
++++ b/nfs.conf
+@@ -45,6 +45,7 @@
+ # ttl=1800
+ [mountd]
+ # debug="all|auth|call|general|parse"
++# apply-root-cred=n
+ # manage-gids=n
+ # descriptors=0
+ # port=0
+diff --git a/support/include/nfsd_path.h b/support/include/nfsd_path.h
+index be2dc38d..834925ec 100644
+--- a/support/include/nfsd_path.h
++++ b/support/include/nfsd_path.h
+@@ -9,6 +9,7 @@
+ struct file_handle;
+ struct statfs;
+ struct nfsd_task_t;
++struct nfs_ucred;
+ 
+ void 		nfsd_path_init(void);
+ 
+@@ -18,7 +19,8 @@ char *		nfsd_path_prepend_dir(const char *dir, const char *pathname);
+ 
+ int 		nfsd_path_stat(const char *pathname, struct stat *statbuf);
+ int 		nfsd_path_lstat(const char *pathname, struct stat *statbuf);
+-int		nfsd_openat(int dirfd, const char *path, int flags);
++int		nfsd_cred_openat(const struct nfs_ucred *cred, int dirfd,
++				 const char *path, int flags);
+ 
+ int		nfsd_path_statfs(const char *pathname,
+ 				   struct statfs *statbuf);
+@@ -31,4 +33,9 @@ ssize_t		nfsd_path_write(int fd, const char *buf, size_t len);
+ int		nfsd_name_to_handle_at(int fd, const char *path,
+ 				       struct file_handle *fh,
+ 				       int *mount_id, int flags);
++
++static inline int nfsd_openat(int dirfd, const char *path, int flags)
++{
++	return nfsd_cred_openat(NULL, dirfd, path, flags);
++}
+ #endif
+diff --git a/support/misc/nfsd_path.c b/support/misc/nfsd_path.c
+index 1c5aa3f3..a2083989 100644
+--- a/support/misc/nfsd_path.c
++++ b/support/misc/nfsd_path.c
+@@ -17,6 +17,7 @@
+ #include "xstat.h"
+ #include "nfslib.h"
+ #include "nfsd_path.h"
++#include "nfs_ucred.h"
+ #include "workqueue.h"
+ 
+ static struct xthread_workqueue *nfsd_wq = NULL;
+@@ -281,6 +282,7 @@ struct nfsd_read_data {
+ };
+ 
+ struct nfsd_openat_t {
++	const struct nfs_ucred *cred;
+ 	const char *path;
+ 	int dirfd;
+ 	int flags;
+@@ -297,15 +299,41 @@ static void nfsd_openatfunc(void *data)
+ 		d->res_error = errno;
+ }
+ 
+-int nfsd_openat(int dirfd, const char *path, int flags)
++static void nfsd_cred_openatfunc(void *data)
++{
++	struct nfsd_openat_t *d = data;
++	struct nfs_ucred *saved = NULL;
++	int ret;
++
++	ret = nfs_ucred_swap_effective(d->cred, &saved);
++	if (ret != 0) {
++		d->res_fd = -1;
++		d->res_error = ret;
++		return;
++	}
++
++	nfsd_openatfunc(data);
++
++	if (saved != NULL) {
++		nfs_ucred_swap_effective(saved, NULL);
++		nfs_ucred_free(saved);
++	}
++}
++
++int nfsd_cred_openat(const struct nfs_ucred *cred, int dirfd, const char *path,
++		     int flags)
+ {
+ 	struct nfsd_openat_t open_buf = {
++		.cred = cred,
+ 		.path = path,
+ 		.dirfd = dirfd,
+ 		.flags = flags,
+ 	};
+ 
+-	nfsd_run_task(nfsd_openatfunc, &open_buf);
++	if (cred)
++		nfsd_run_task(nfsd_cred_openatfunc, &open_buf);
++	else
++		nfsd_run_task(nfsd_openatfunc, &open_buf);
+ 	if (open_buf.res_fd == -1)
+ 		errno = open_buf.res_error;
+ 	return open_buf.res_fd;
+diff --git a/utils/mountd/mountd.c b/utils/mountd/mountd.c
+index f43ebef5..6e6777cd 100644
+--- a/utils/mountd/mountd.c
++++ b/utils/mountd/mountd.c
+@@ -31,6 +31,7 @@
+ #include "nfsd_path.h"
+ #include "nfslib.h"
+ #include "export.h"
++#include "nfs_ucred.h"
+ 
+ extern void my_svc_run(void);
+ 
+@@ -40,6 +41,7 @@ static struct nfs_fh_len *get_rootfh(struct svc_req *, dirpath *, nfs_export **,
+ 
+ int reverse_resolve = 0;
+ int manage_gids;
++int apply_root_cred;
+ int use_ipaddr = -1;
+ 
+ /* PRC: a high-availability callout program can be specified with -H
+@@ -74,9 +76,10 @@ static struct option longopts[] =
+ 	{ "log-auth", 0, 0, 'l'},
+ 	{ "cache-use-ipaddr", 0, 0, 'i'},
+ 	{ "ttl", 1, 0, 'T'},
++	{ "apply-root-cred", 0, 0, 'c' },
+ 	{ NULL, 0, 0, 0 }
+ };
+-static char shortopts[] = "o:nFd:p:P:hH:N:V:vurs:t:gliT:";
++static char shortopts[] = "o:nFd:p:P:hH:N:V:vurs:t:gliT:c";
+ 
+ #define NFSVERSBIT(vers)	(0x1 << (vers - 1))
+ #define NFSVERSBIT_ALL		(NFSVERSBIT(2) | NFSVERSBIT(3) | NFSVERSBIT(4))
+@@ -453,11 +456,27 @@ get_rootfh(struct svc_req *rqstp, dirpath *path, nfs_export **expret,
+ 	while (*subpath == '/')
+ 		subpath++;
+ 	if (*subpath != '\0') {
++		struct nfs_ucred *cred = NULL;
+ 		int fd;
+ 
++		/* Load the user cred */
++		if (!apply_root_cred) {
++			nfs_ucred_get(&cred, rqstp, &exp->m_export);
++			if (cred == NULL) {
++				xlog(L_WARNING, "can't retrieve credential");
++				*error = MNT3ERR_ACCES;
++				close(dirfd);
++				return NULL;
++			}
++			if (manage_gids)
++				nfs_ucred_reload_groups(cred, &exp->m_export);
++		}
++
+ 		/* Just perform a lookup of the path */
+-		fd = nfsd_openat(dirfd, subpath, O_PATH);
++		fd = nfsd_cred_openat(cred, dirfd, subpath, O_PATH);
+ 		close(dirfd);
++		if (cred)
++			nfs_ucred_free(cred);
+ 		if (fd == -1) {
+ 			xlog(L_WARNING, "can't open exported dir %s: %s", p,
+ 			     strerror(errno));
+@@ -681,6 +700,8 @@ read_mountd_conf(char **argv)
+ 	ttl = conf_get_num("mountd", "ttl", default_ttl);
+ 	if (ttl > 0)
+ 		default_ttl = ttl;
++	apply_root_cred = conf_get_bool("mountd", "apply-root-cred",
++					apply_root_cred);
+ }
+ 
+ int
+@@ -794,6 +815,9 @@ main(int argc, char **argv)
+ 			}
+ 			default_ttl = ttl;
+ 			break;
++		case 'c':
++			apply_root_cred = 1;
++			break;
+ 		case 0:
+ 			break;
+ 		case '?':
+diff --git a/utils/mountd/mountd.man b/utils/mountd/mountd.man
+index a206a3e2..f4f1fc23 100644
+--- a/utils/mountd/mountd.man
++++ b/utils/mountd/mountd.man
+@@ -242,6 +242,32 @@ can support both NFS version 2 and the newer version 3.
+ Print the version of
+ .B rpc.mountd
+ and exit.
++.TP
++.B \-c " or " \-\-apply-root-cred
++When mountd is asked to allow a NFSv3 mount to a subdirectory of the
++exported directory, then it will check if the user asking to mount has
++lookup rights to the directories below that exported directory. When
++performing the check, mountd will apply any root squash or all squash
++rules that were specified for that client.
++
++Performing lookup checks as the user requires that the mountd daemon
++be run as root or that it be given CAP_SETUID and CAP_SETGID privileges
++so that it can change its own effective user and effective group settings.
++When troubleshooting, please also note that LSM frameworks such as SELinux
++can sometimes prevent the daemon from changing the effective user/groups
++despite the capability settings.
++
++In earlier versions of mountd, the same checks were performed using the
++mountd daemon's root privileges, meaning that it could authorise access
++to directories that are not normally accessible to the user requesting
++to mount them. This option enables that legacy behaviour.
++
++.BR Note:
++If there is a need to provide access to specific subdirectories that
++are not normally accessible to a client, it is always possible to add
++export entries that explicitly grant such access. That ability does
++not depend on this option being enabled.
++
+ .TP
+ .B \-g " or " \-\-manage-gids
+ Accept requests from the kernel to map user id numbers into  lists of
+-- 
+2.44.4
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
index 2f2644f9a8..91c74fe5ef 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
@@ -33,6 +33,12 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch \
            file://0001-tools-locktest-Use-intmax_t-to-print-off_t.patch \
            file://0001-reexport.h-Include-unistd.h-to-compile-with-musl.patch \
+           file://CVE-2025-12801-dependent_p1.patch \
+           file://CVE-2025-12801-dependent_p2.patch \
+           file://CVE-2025-12801-dependent_p3.patch \
+           file://CVE-2025-12801-dependent_p4.patch \
+           file://CVE-2025-12801.patch \
+           file://CVE-2025-12801-build-fix.patch \
            "
 SRC_URI[sha256sum] = "01b3b0fb9c7d0bbabf5114c736542030748c788ec2fd9734744201e9b0a1119d"
 
-- 
2.53.0


