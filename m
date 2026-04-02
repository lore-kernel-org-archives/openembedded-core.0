Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF40ECC6B15
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 07:27:56 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10585.1775114872520798699
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 00:27:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=AzYSxUDW;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=33093; q=dns/txt;
  s=iport01; t=1775114872; x=1776324472;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=KOwif2TP4BYC+kadhcw1VXSk0uo3krGR7piYhnx1ln8=;
  b=AzYSxUDWykxjslsb9E6revTQyjYgB4sRrvnVDzhf3bnRlntLYEJyuvSJ
   Ipp086wVmv0mmyZBpsjRP2T6DlTmuBn+r12gsNUaS+K6EZicTJNexx/az
   tZQHtCgcNLd6x7qKob68IkF0VZO2JYgcA2me87D9vuhVxd7GRCdjd1VGM
   XAkNDIaGlINLUtknzq/9Te+B+5ATMUifaux7ZyPcL9ASFtYKab9S24+3m
   mNiWBCYtdoiXRMc2JHUW8zSifmV8b391/x+tJZxiq7EpbFpcZA13aW5/C
   kBPt+QMnpjQ5shojGLyf3BEkzOLTAcupcnp1U/MNGeNXgjlx/zhtsBC6r
   Q==;
X-CSE-ConnectionGUID: aeC5caXrR6OT+kKwk5QbpA==
X-CSE-MsgGUID: Kga9FklHQDaA15uaSTs1eg==
X-IPAS-Result: =?us-ascii?q?A0BLAgCHGc5p/4v/Ja1aglmCV3FfQkkDlCeCIQORSoxQg?=
 =?us-ascii?q?X8PAQEBD0QNBAEBhQcCjScCJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NhloBAgEDGgEMCwEYAT0cAwECFxgrIwgZgwIBgnMCA?=
 =?us-ascii?q?RG0CYF5M4EBgygBPwJDT9smAQsUAYE4hT6IHFsYAYR6JxsbgXKBFAGBO4Itg?=
 =?us-ascii?q?QWBXAQYgS4+Ig+FbQSCIoEOgWEegkEGhHyBHoYaSIEeA1ksAVUTDQoLBwWBZ?=
 =?us-ascii?q?gM1EioVbjIdgSM+F4EMGwcFgUuHXHRtgRODflcDCxgNSBEsNxQbBD5uB4tzK?=
 =?us-ascii?q?YFEYAsGAQE2MxETARMYYDEyDgkEJwYEBRgRC5MbCJI1oQ4KKIN0jB6VOhozh?=
 =?us-ascii?q?ASBV4s8i2iNbAuYe44JlTQnJQEBToRogWg8gVlwFYMiCUkZD44tCwuBdoQ+V?=
 =?us-ascii?q?IFpvy4jNQIJAzABBwIHDgKBc5F9AQE?=
IronPort-Data: A9a23:+lojdq+Y35vo9PeI18tfDrUD0X+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 2YfXDzTO/uIa2Wjf992OoS38kMHusfSyt8yQAdvrStEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mpyyHjEAX9gWAsbjpOs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2k/MKZF8e9HG1sQ0
 sBbKxMSbU26jfqflefTpulE3qzPLeHxN48Z/3UlxjbDALN+G9bIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZOEwn1lQ/UPrSmM+ki3TleiFYr3qepLE85C7YywkZPL3Fb4KLIYXaHJoK9qqej
 kHJ9jXXARU6DfCW4GPY73uXuvSWkCyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjJCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:fDEH8ahYjNqTzMfAmr9vUjRheHBQXtsji2hC6mlwRA09TyX+rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchD4BmaNykdsS48izPIdOod/A==
X-Talos-CUID: =?us-ascii?q?9a23=3A3QO/W2kIOcCMPeP57wINmM76hO7XOXTQ5yrbKn+?=
 =?us-ascii?q?iMzhOdP6WakCTpZpui+M7zg=3D=3D?=
X-Talos-MUID: 9a23:8II+TQntXeXqG/EyZQW3dnpBO845zaeqKHkhmLxf5tSNDhBrYjqS2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,155,1770595200"; 
   d="scan'208";a="706318177"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 02 Apr 2026 07:27:51 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 13B411800034B
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Apr 2026 07:27:51 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id AB414CC12B5; Thu,  2 Apr 2026 00:27:50 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter][PATCH v2] nfs-utils: Fix CVE-2025-12801
Date: Thu,  2 Apr 2026 00:27:17 -0700
Message-Id: <20260402072717.645470-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260318160331.398003-1-deeratho@cisco.com>
References: <20260318160331.398003-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 07:27:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234497

From: Deepak Rathore <deeratho@cisco.com>

- This patch applies the upstream fix [1] as referenced in [5].
- To successfully apply the fixed commit, apply the dependent commits
  [2] to [4] which are included in v2.8.6, as referenced in [5].
- Reference:
  [1] https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=f36bd900a899
  [2] https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=7e8b36522f58
  [3] https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=42f01e6a78fe
  [4] https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=51738ae56d92
  [5] https://security-tracker.debian.org/tracker/CVE-2025-12801

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p1.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p1.patch
new file mode 100644
index 0000000000..8f2174c5b8
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p1.patch
@@ -0,0 +1,81 @@
+From 0ea29d6077dacbf6a754b0e648275eec2a576e87 Mon Sep 17 00:00:00 2001
+From: Trond Myklebust <trond.myklebust@hammerspace.com>
+Date: Mon, 10 Nov 2025 11:26:03 -0500
+Subject: [PATCH 1/4] mountd: Minor refactor of get_rootfh()
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
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
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
+2.35.6
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p2.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p2.patch
new file mode 100644
index 0000000000..e078ddd0e8
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p2.patch
@@ -0,0 +1,181 @@
+From 8a19b1f0dd1f09d440a6a94748fe403f7ef8da81 Mon Sep 17 00:00:00 2001
+From: Trond Myklebust <trond.myklebust@hammerspace.com>
+Date: Mon, 10 Nov 2025 11:28:39 -0500
+Subject: [PATCH 2/4] mountd: Separate lookup of the exported directory and the
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
+Reviewed-by: Jeff Layton <jlayton@kernel.org>
+Signed-off-by: Trond Myklebust <trond.myklebust@hammerspace.com>
+Signed-off-by: Steve Dickson <steved@redhat.com>
+(cherry picked from commit 42f01e6a78fed98f12437ac8b28cfb12b6bad056)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ support/include/nfsd_path.h |  1 +
+ support/misc/nfsd_path.c    | 31 ++++++++++++++++++
+ utils/mountd/mountd.c       | 63 +++++++++++++++++++++++++++++++------
+ 3 files changed, 86 insertions(+), 9 deletions(-)
+
+diff --git a/support/include/nfsd_path.h b/support/include/nfsd_path.h
+index f600fb5a..3e5a2f5d 100644
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
+index caec33ca..dfe88e4f 100644
+--- a/support/misc/nfsd_path.c
++++ b/support/misc/nfsd_path.c
+@@ -203,6 +203,37 @@ nfsd_realpath(const char *path, char *resolved_buf)
+         return realpath_buf.res_ptr;
+ }
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
+ struct nfsd_rw_data {
+ 	int             fd;
+ 	void*           buf;
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
+2.35.6
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p3.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p3.patch
new file mode 100644
index 0000000000..7c9a1e6d2b
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p3.patch
@@ -0,0 +1,465 @@
+From 0114ef262d61988b8209b7baab7426eac9a49548 Mon Sep 17 00:00:00 2001
+From: Trond Myklebust <trond.myklebust@hammerspace.com>
+Date: Mon, 10 Nov 2025 12:18:38 -0500
+Subject: [PATCH 3/4] support: Add a mini-library to extract and apply RPC
+ credentials
+
+Add server functionality to extract the credentials from the client RPC
+call, and apply them. This is needed in order to perform access checking
+on the requested path in the mountd daemon.
+
+CVE: CVE-2025-12801
+Upstream-Status: Backport [https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=51738ae56d922d4961e60dad73ad1c2d97d8d99b]
+
+Reviewed-by: Jeff Layton <jlayton@kernel.org>
+Signed-off-by: Trond Myklebust <trond.myklebust@hammerspace.com>
+Signed-off-by: Steve Dickson <steved@redhat.com>
+(cherry picked from commit 51738ae56d922d4961e60dad73ad1c2d97d8d99b)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ aclocal/libtirpc.m4         |  12 +++
+ support/include/Makefile.am |   1 +
+ support/include/nfs_ucred.h |  44 ++++++++++
+ support/misc/Makefile.am    |   2 +-
+ support/misc/ucred.c        | 162 ++++++++++++++++++++++++++++++++++++
+ support/nfs/Makefile.am     |   2 +-
+ support/nfs/ucred.c         | 147 ++++++++++++++++++++++++++++++++
+ 7 files changed, 368 insertions(+), 2 deletions(-)
+ create mode 100644 support/include/nfs_ucred.h
+ create mode 100644 support/misc/ucred.c
+ create mode 100644 support/nfs/ucred.c
+
+diff --git a/aclocal/libtirpc.m4 b/aclocal/libtirpc.m4
+index ef48a2ae..06629db9 100644
+--- a/aclocal/libtirpc.m4
++++ b/aclocal/libtirpc.m4
+@@ -31,6 +31,18 @@ AC_DEFUN([AC_LIBTIRPC], [
+                          [AC_DEFINE([HAVE_TIRPC_GSS_SECCREATE], [1],
+                                     [Define to 1 if your tirpc library provides rpc_gss_seccreate])],,
+                          [${LIBS}])])
++
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
+index f9993e3a..7ea2d798 100644
+--- a/support/misc/Makefile.am
++++ b/support/misc/Makefile.am
+@@ -2,6 +2,6 @@
+ 
+ noinst_LIBRARIES = libmisc.a
+ libmisc_a_SOURCES = tcpwrapper.c from_local.c mountpoint.c file.c \
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
+2.35.6
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801.patch
new file mode 100644
index 0000000000..23e18ffdab
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801.patch
@@ -0,0 +1,254 @@
+From 6dc289e68d8432eb4fc4f397fed28435bf600bb1 Mon Sep 17 00:00:00 2001
+From: Trond Myklebust <trond.myklebust@hammerspace.com>
+Date: Thu, 5 Mar 2026 10:41:02 -0500
+Subject: [PATCH 4/4] Fix access checks when mounting subdirectories in NFSv3
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
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ nfs.conf                    |  1 +
+ support/include/nfsd_path.h |  9 ++++++++-
+ support/misc/nfsd_path.c    | 32 ++++++++++++++++++++++++++++++--
+ utils/mountd/mountd.c       | 28 ++++++++++++++++++++++++++--
+ utils/mountd/mountd.man     | 26 ++++++++++++++++++++++++++
+ 5 files changed, 91 insertions(+), 5 deletions(-)
+
+diff --git a/nfs.conf b/nfs.conf
+index 3cca68c3..ddf0c143 100644
+--- a/nfs.conf
++++ b/nfs.conf
+@@ -46,6 +46,7 @@
+ # ttl=1800
+ [mountd]
+ # debug="all|auth|call|general|parse"
++# apply-root-cred=n
+ # manage-gids=n
+ # descriptors=0
+ # port=0
+diff --git a/support/include/nfsd_path.h b/support/include/nfsd_path.h
+index 3e5a2f5d..06c0f2f4 100644
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
+@@ -31,4 +33,9 @@ ssize_t		nfsd_path_write(int fd, void* buf, size_t len);
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
+index dfe88e4f..6466666d 100644
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
+@@ -204,6 +205,7 @@ nfsd_realpath(const char *path, char *resolved_buf)
+ }
+ 
+ struct nfsd_openat_t {
++	const struct nfs_ucred *cred;
+ 	const char *path;
+ 	int dirfd;
+ 	int flags;
+@@ -220,15 +222,41 @@ static void nfsd_openatfunc(void *data)
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
+2.35.6
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb
index 08e7dd8900..441398d0ec 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb
@@ -24,6 +24,10 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch \
            file://0004-Use-nogroup-for-nobody-group.patch \
            file://0005-find-OE-provided-Kerberos.patch \
+		   file://CVE-2025-12801-dependent_p1.patch \
+		   file://CVE-2025-12801-dependent_p2.patch \
+		   file://CVE-2025-12801-dependent_p3.patch \
+		   file://CVE-2025-12801.patch \
            "
 
 SRC_URI[sha256sum] = "11c4cc598a434d7d340bad3e072a373ba1dcc2c49f855d44b202222b78ecdbf5"
-- 
2.35.6


