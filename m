Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C5E2CD128E
	for <webhook@archiver.kernel.org>; Fri, 29 Mar 2024 01:24:34 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web10.7698.1711675467590433160
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 18:24:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PYBt12jQ;
 spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: danismostlikely@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7d0845e992aso68349239f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 18:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711675466; x=1712280266; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yp6k1tJ+XQKRS14Y4QGmCgo09kTgeDWLOuxVnoc5bRI=;
        b=PYBt12jQUbsTMXbSHOfef2hVv5Yek3crcU2ny0x6kt5Mgge+ygFgTqTPXt3kT9++ZF
         +kYuvP9ytRWCfTEAWy9v88AU8ffI0vf+16l7FP0zHyzjcEPvpPmZnQKJsGkfxT5B6czP
         EBl2eIblJCHs0KCFiYmAhthOAzikJnzw5eTlMihN2oPt/AlMXU6Bhpvrow256yww47Sx
         /0UkqGtt7e0aj/gLG/++0jig7kR9MqgUSIGEzW69TmWgKMgMRfz4Re9nANIunVXRSZ56
         rJHLxae42LWwOyAmWYjTu02NT+IyJVKTFuJyHf7LN7QBOCtZouydMxuoZ2iCogwLSfh0
         VqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711675466; x=1712280266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yp6k1tJ+XQKRS14Y4QGmCgo09kTgeDWLOuxVnoc5bRI=;
        b=tLt7LbRo6bd+Pnl27REdU03W1v/GOYPEPX2dqfdT2LkujIzAnhr3X0LSMLraDveUEQ
         AC4c+BPPl4GIaCv9jDPikOLeCoFBHiG0YoNIX+UPQkJ9FPEH6bxabATvz1gIGCRYc8xR
         ERjyD8M5jKZ2q5DpnWb/bh5MTJpR8BOQzD4A4zYM4OUL0tgAjoHAXfkkC9Ap0WQ/VLBJ
         tVgp0qZhrCSI9gNeTUPcGhYhmDCDgd4NvxviqMdowcmxqG2Se+1V0Dj+Hj53gbBhyeT9
         lcDdx5d2LXXcd+fTsNwOl5uu1Lj1r38lhRLjAoaIK8yIQUxSfb6rVBVo2IB9YqyMHNpT
         ycLw==
X-Gm-Message-State: AOJu0YwC6RM9jErQNH6zKokXrEkEtsU9fndCU+k39oKAEk3HuXg5lo4b
	ZwY1KC5PleKALED/2UnmzLQ0J2jUVb0Pp14YOVtTt/JgmSAoS8J/prAWChhWmA8=
X-Google-Smtp-Source: AGHT+IEqI8ugPr05IiR3hyyCovTumEHbl7kCCbOLk0H9ofs/2xknzwEcyHHrUTDhNtKh1o/4n/3z7w==
X-Received: by 2002:a5e:da03:0:b0:7d0:9c92:4a46 with SMTP id x3-20020a5eda03000000b007d09c924a46mr564707ioj.14.1711675466212;
        Thu, 28 Mar 2024 18:24:26 -0700 (PDT)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id t21-20020a028795000000b0047c0d5be2casm694756jai.24.2024.03.28.18.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 18:24:25 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH v5 3/3] nfs-utils: Configure nfsv4 ID mapping & Kerberos
Date: Thu, 28 Mar 2024 19:24:12 -0600
Message-ID: <20240329012413.892379-3-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240329012413.892379-1-danismostlikely@gmail.com>
References: <20240329012413.892379-1-danismostlikely@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 01:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197618

From: Daniel McGregor <daniel.mcgregor@vecima.com>

Add support for the nfsv4 user ID mapping daemon, configured with
a sensible default, and add a packageconfig for Kerberos support.

This is reasonably tested in production in our environment, but only
systemd support. There'll be some more work to do to get GSSAPI and
NFS idmapd support integreated into that.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 ...01-gssd-use-printf-format-specifiers.patch | 181 ++++++++++++++++++
 .../0002-Use-nogroup-for-nobody-group.patch   |  38 ++++
 .../0003-find-OE-provided-Kerberos.patch      |  42 ++++
 .../nfs-utils/nfs-utils/clang-warnings.patch  |  81 +++++++-
 .../nfs-utils/nfs-utils_2.6.4.bb              |  37 +++-
 5 files changed, 367 insertions(+), 12 deletions(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-gssd-use-printf-format-specifiers.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0002-Use-nogroup-for-nobody-group.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0003-find-OE-provided-Kerberos.patch

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-gssd-use-printf-format-specifiers.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-gssd-use-printf-format-specifiers.patch
new file mode 100644
index 00000000000..ab6517a30ed
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-gssd-use-printf-format-specifiers.patch
@@ -0,0 +1,181 @@
+From 094b965b7044e7d102542ac30e95b556ca82654b Mon Sep 17 00:00:00 2001
+From: Daniel McGregor <daniel.mcgregor@vecima.com>
+Date: Wed, 29 Nov 2023 07:10:58 -0600
+Subject: [PATCH] gssd: use printf format specifiers
+
+This function takes a printf format specifier, tell the compiler about
+that. This adds the ability for GCC to warn about misuses, and prevents
+Clang from warning on the implementation.
+
+Upstream-Status: Pending
+Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
+---
+ utils/gssd/err_util.h     |  2 +-
+ utils/gssd/gss_names.c    |  4 ++--
+ utils/gssd/gss_util.c     |  2 +-
+ utils/gssd/gssd.c         |  4 ++--
+ utils/gssd/gssd_proc.c    |  8 ++++----
+ utils/gssd/krb5_util.c    | 10 +++++-----
+ utils/gssd/svcgssd_proc.c |  8 ++++----
+ 7 files changed, 19 insertions(+), 19 deletions(-)
+
+diff --git a/utils/gssd/err_util.h b/utils/gssd/err_util.h
+index 6fa9d3d..61f5a31 100644
+--- a/utils/gssd/err_util.h
++++ b/utils/gssd/err_util.h
+@@ -32,7 +32,7 @@
+ #define _ERR_UTIL_H_
+ 
+ void initerr(char *progname, int verbosity, int fg);
+-void printerr(int priority, char *format, ...);
++void printerr(int priority, char *format, ...) __attribute__ ((format (printf, 2, 3)));
+ int get_verbosity(void);
+ char * sec2time(int);
+ 
+diff --git a/utils/gssd/gss_names.c b/utils/gssd/gss_names.c
+index 982b96f..0548c33 100644
+--- a/utils/gssd/gss_names.c
++++ b/utils/gssd/gss_names.c
+@@ -65,7 +65,7 @@ get_krb5_hostbased_name(gss_buffer_desc *name, char **hostbased_name)
+ 	if (strchr(name->value, '@') && strchr(name->value, '/')) {
+ 		if ((sname = calloc(name->length, 1)) == NULL) {
+ 			printerr(0, "ERROR: get_krb5_hostbased_name failed "
+-				 "to allocate %d bytes\n", name->length);
++				 "to allocate %zd bytes\n", name->length);
+ 			return -1;
+ 		}
+ 		/* read in name and instance and replace '/' with '@' */
+@@ -102,7 +102,7 @@ get_hostbased_client_name(gss_name_t client_name, gss_OID mech,
+ 	}
+ 	if (name.length >= 0xffff) {	    /* don't overflow */
+ 		printerr(0, "ERROR: get_hostbased_client_name: "
+-			 "received gss_name is too long (%d bytes)\n",
++			 "received gss_name is too long (%zd bytes)\n",
+ 			 name.length);
+ 		goto out_rel_buf;
+ 	}
+diff --git a/utils/gssd/gss_util.c b/utils/gssd/gss_util.c
+index a4b2777..7d41a94 100644
+--- a/utils/gssd/gss_util.c
++++ b/utils/gssd/gss_util.c
+@@ -304,7 +304,7 @@ gssd_acquire_cred(char *server_name, const gss_OID oid)
+ 				target_name, &pbuf, NULL);
+ 		if (ignore_maj_stat == GSS_S_COMPLETE) {
+ 			printerr(1, "Unable to obtain credentials for '%.*s'\n",
+-				 pbuf.length, pbuf.value);
++				 (int)pbuf.length, (char *)pbuf.value);
+ 			ignore_maj_stat = gss_release_buffer(&ignore_min_stat,
+ 							     &pbuf);
+ 		}
+diff --git a/utils/gssd/gssd.c b/utils/gssd/gssd.c
+index 833d8e0..380116a 100644
+--- a/utils/gssd/gssd.c
++++ b/utils/gssd/gssd.c
+@@ -518,9 +518,9 @@ scan_active_thread_list(void)
+ 					do_error_downcall(info->fd, info->uid, -ETIMEDOUT);
+ 				} else {
+ 					if (!(info->flags & UPCALL_THREAD_WARNED)) {
+-						printerr(0, "watchdog: thread id 0x%lx running for %ld seconds\n",
++						printerr(0, "watchdog: thread id 0x%lx running for %lld seconds\n",
+ 								info->tid,
+-								now.tv_sec - info->timeout.tv_sec + upcall_timeout);
++								(long long int)(now.tv_sec - info->timeout.tv_sec + upcall_timeout));
+ 						info->flags |= UPCALL_THREAD_WARNED;
+ 					}
+ 				}
+diff --git a/utils/gssd/gssd_proc.c b/utils/gssd/gssd_proc.c
+index ae568f1..574eb4b 100644
+--- a/utils/gssd/gssd_proc.c
++++ b/utils/gssd/gssd_proc.c
+@@ -168,7 +168,7 @@ do_downcall(int k5_fd, uid_t uid, struct authgss_private_data *pd,
+ 
+ 	if (get_verbosity() > 1)
+ 		printerr(2, "do_downcall(0x%lx): lifetime_rec=%s acceptor=%.*s\n",
+-			tid, sec2time(lifetime_rec), acceptor->length, acceptor->value);
++			tid, sec2time(lifetime_rec), (int)acceptor->length, (char *)acceptor->value);
+ 	buf_size = sizeof(uid) + sizeof(timeout) + sizeof(pd->pd_seq_win) +
+ 		sizeof(pd->pd_ctx_hndl.length) + pd->pd_ctx_hndl.length +
+ 		sizeof(context_token->length) + context_token->length +
+@@ -284,14 +284,14 @@ populate_port(struct sockaddr *sa, const socklen_t salen,
+ 
+ 	port = nfs_getport(sa, salen, program, version, protocol);
+ 	if (!port) {
+-		printerr(0, "ERROR: unable to obtain port for prog %ld "
+-			    "vers %ld\n", program, version);
++		printerr(0, "ERROR: unable to obtain port for prog %lu "
++			    "vers %lu\n", (long unsigned int)program, (long unsigned int)version);
+ 		return 0;
+ 	}
+ 
+ set_port:
+ 	printerr(2, "DEBUG: setting port to %hu for prog %lu vers %lu\n", port,
+-		 program, version);
++		 (long unsigned int)program, (long unsigned int)version);
+ 
+ 	switch (sa->sa_family) {
+ 	case AF_INET:
+diff --git a/utils/gssd/krb5_util.c b/utils/gssd/krb5_util.c
+index e3f270e..28f7d84 100644
+--- a/utils/gssd/krb5_util.c
++++ b/utils/gssd/krb5_util.c
+@@ -304,9 +304,9 @@ gssd_find_existing_krb5_ccache(uid_t uid, char *dirname,
+ 				score++;
+ 
+ 			printerr(3, "CC '%s'(%s@%s) passed all checks and"
+-				    " has mtime of %u\n",
++				    " has mtime of %llu\n",
+ 				 buf, princname, realm, 
+-				 tmp_stat.st_mtime);
++				 (long long unsigned)tmp_stat.st_mtime);
+ 			/*
+ 			 * if more than one match is found, return the most
+ 			 * recent (the one with the latest mtime), and
+@@ -341,10 +341,10 @@ gssd_find_existing_krb5_ccache(uid_t uid, char *dirname,
+ 				}
+ 				printerr(3, "CC '%s:%s/%s' is our "
+ 					    "current best match "
+-					    "with mtime of %u\n",
+-					 cctype, dirname,
++					    "with mtime of %llu\n",
++					 *cctype, dirname,
+ 					 best_match_dir->d_name,
+-					 best_match_stat.st_mtime);
++					 (long long unsigned)best_match_stat.st_mtime);
+ 			}
+ 			free(princname);
+ 			free(realm);
+diff --git a/utils/gssd/svcgssd_proc.c b/utils/gssd/svcgssd_proc.c
+index b403143..7fecd1a 100644
+--- a/utils/gssd/svcgssd_proc.c
++++ b/utils/gssd/svcgssd_proc.c
+@@ -102,10 +102,10 @@ do_svc_downcall(gss_buffer_desc *out_handle, struct svc_cred *cred,
+ 	qword_addint(&bp, &blen, cred->cr_uid);
+ 	qword_addint(&bp, &blen, cred->cr_gid);
+ 	qword_addint(&bp, &blen, cred->cr_ngroups);
+-	printerr(2, "mech: %s, hndl len: %d, ctx len %d, timeout: %d (%d from now), "
++	printerr(2, "mech: %s, hndl len: %zd, ctx len %zd, timeout: %lld (%lld from now), "
+ 		 "clnt: %s, uid: %d, gid: %d, num aux grps: %d:\n",
+ 		 fname, out_handle->length, context_token->length,
+-		 endtime, endtime - time(0),
++		 (long long int)endtime, (long long int)(endtime - time(0)),
+ 		 client_name ? client_name : "<null>",
+ 		 cred->cr_uid, cred->cr_gid, cred->cr_ngroups);
+ 	for (i=0; i < cred->cr_ngroups; i++) {
+@@ -232,7 +232,7 @@ get_ids(gss_name_t client_name, gss_OID mech, struct svc_cred *cred)
+ 	}
+ 	if (name.length >= 0xffff || /* be certain name.length+1 doesn't overflow */
+ 	    !(sname = calloc(name.length + 1, 1))) {
+-		printerr(0, "WARNING: get_ids: error allocating %d bytes "
++		printerr(0, "WARNING: get_ids: error allocating %zd bytes "
+ 			"for sname\n", name.length + 1);
+ 		gss_release_buffer(&min_stat, &name);
+ 		goto out;
+@@ -360,7 +360,7 @@ handle_nullreq(char *cp) {
+ 	if (in_handle.length != 0) { /* CONTINUE_INIT case */
+ 		if (in_handle.length != sizeof(ctx)) {
+ 			printerr(0, "WARNING: handle_nullreq: "
+-				    "input handle has unexpected length %d\n",
++				    "input handle has unexpected length %zd\n",
+ 				    in_handle.length);
+ 			goto out_err;
+ 		}
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0002-Use-nogroup-for-nobody-group.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0002-Use-nogroup-for-nobody-group.patch
new file mode 100644
index 00000000000..3c238f851ba
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0002-Use-nogroup-for-nobody-group.patch
@@ -0,0 +1,38 @@
+From 6095b5a9208eac37b73e05f81c090d8183138c6a Mon Sep 17 00:00:00 2001
+From: Daniel McGregor <daniel.mcgregor@vecima.com>
+Date: Tue, 6 Jun 2023 16:07:53 -0600
+Subject: [PATCH] Use "nogroup" for nobody group
+
+Upstream-Status: Inappropriate [oe-core specific, configuration]
+Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
+---
+ support/nfsidmap/idmapd.conf | 2 +-
+ utils/idmapd/idmapd.c        | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/support/nfsidmap/idmapd.conf b/support/nfsidmap/idmapd.conf
+index 2a2f79a1..e6f3724f 100644
+--- a/support/nfsidmap/idmapd.conf
++++ b/support/nfsidmap/idmapd.conf
+@@ -41,7 +41,7 @@
+ [Mapping]
+ 
+ #Nobody-User = nobody
+-#Nobody-Group = nobody
++#Nobody-Group = nogroup
+ 
+ [Translation]
+ 
+diff --git a/utils/idmapd/idmapd.c b/utils/idmapd/idmapd.c
+index cd9a965f..3be805e9 100644
+--- a/utils/idmapd/idmapd.c
++++ b/utils/idmapd/idmapd.c
+@@ -89,7 +89,7 @@
+ #endif
+ 
+ #ifndef NFS4NOBODY_GROUP
+-#define NFS4NOBODY_GROUP "nobody"
++#define NFS4NOBODY_GROUP "nogroup"
+ #endif
+ 
+ /* From Niels */
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0003-find-OE-provided-Kerberos.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0003-find-OE-provided-Kerberos.patch
new file mode 100644
index 00000000000..4f15aaec4ea
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0003-find-OE-provided-Kerberos.patch
@@ -0,0 +1,42 @@
+From f4f4a226bfd71ddc0f53dd54159e3eaa835b18e6 Mon Sep 17 00:00:00 2001
+From: Daniel McGregor <daniel.mcgregor@vecima.com>
+Date: Wed, 8 Nov 2023 16:24:20 -0600
+Subject: [PATCH] find OE provided Kerberos
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
+---
+ aclocal/kerberos5.m4 | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/aclocal/kerberos5.m4 b/aclocal/kerberos5.m4
+index f96f0fd..ad85fdf 100644
+--- a/aclocal/kerberos5.m4
++++ b/aclocal/kerberos5.m4
+@@ -22,8 +22,8 @@ AC_DEFUN([AC_KERBEROS_V5],[
+     dnl This ugly hack brought on by the split installation of
+     dnl MIT Kerberos on Fedora Core 1
+     K5CONFIG=""
+-    if test -f $dir/bin/krb5-config; then
+-      K5CONFIG=$dir/bin/krb5-config
++    if test -f $dir/bin/crossscripts/krb5-config; then
++      K5CONFIG=$dir/bin/crossscripts/krb5-config
+     elif test -f "/usr/kerberos/bin/krb5-config"; then
+       K5CONFIG="/usr/kerberos/bin/krb5-config"
+     elif test -f "/usr/lib/mit/bin/krb5-config"; then
+@@ -72,6 +72,7 @@ AC_DEFUN([AC_KERBEROS_V5],[
+   AC_MSG_RESULT($KRBDIR)
+ 
+   dnl Check if -rpath=$(KRBDIR)/lib is needed
++  if false; then
+   echo "The current KRBDIR is $KRBDIR"
+   if test "$KRBDIR/lib" = "/lib" -o "$KRBDIR/lib" = "/usr/lib" \
+        -o "$KRBDIR/lib" = "//lib" -o "$KRBDIR/lib" = "/usr//lib" ; then
+@@ -81,6 +82,7 @@ AC_DEFUN([AC_KERBEROS_V5],[
+   else
+     KRBLDFLAGS="-Wl,-rpath=$KRBDIR/lib"
+   fi
++  fi
+ 
+   dnl Now check for functions within gssapi library
+   AC_CHECK_LIB($gssapi_lib, gss_krb5_export_lucid_sec_context,
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/clang-warnings.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/clang-warnings.patch
index fde99b599eb..ff697477b08 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/clang-warnings.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/clang-warnings.patch
@@ -1,4 +1,4 @@
-From 1ab0c326405c6daa06f1a7eb4b0b60bf4e0584c2 Mon Sep 17 00:00:00 2001
+From 7d04566b7b8e57114533360cc4b933a74ed6b314 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 31 Dec 2019 08:15:34 -0800
 Subject: [PATCH] Detect warning options during configure
@@ -16,11 +16,14 @@ Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
- support/nfs/xcommon.c | 3 +++
- 1 file changed, 3 insertions(+)
+ support/nfs/xcommon.c          | 6 ++++++
+ support/nfs/xlog.c             | 6 ++++++
+ support/nfsidmap/libnfsidmap.c | 3 +++
+ utils/exportfs/exportfs.c      | 3 +++
+ 4 files changed, 18 insertions(+)
 
 diff --git a/support/nfs/xcommon.c b/support/nfs/xcommon.c
-index 3989f0b..e080423 100644
+index 3989f0bc..ff438c18 100644
 --- a/support/nfs/xcommon.c
 +++ b/support/nfs/xcommon.c
 @@ -98,7 +98,10 @@ nfs_error (const char *fmt, ...) {
@@ -34,3 +37,73 @@ index 3989f0b..e080423 100644
       va_end (args);
       free (fmt2);
  }
+@@ -132,7 +135,10 @@ die(int err, const char *fmt, ...) {
+ 	va_list args;
+ 
+ 	va_start(args, fmt);
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wformat-nonliteral"
+ 	vfprintf(stderr, fmt, args);
++#pragma GCC diagnostic pop
+ 	fprintf(stderr, "\n");
+ 	va_end(args);
+ 
+diff --git a/support/nfs/xlog.c b/support/nfs/xlog.c
+index fa125cef..dc4c9ea1 100644
+--- a/support/nfs/xlog.c
++++ b/support/nfs/xlog.c
+@@ -178,11 +178,16 @@ xlog_backend(int kind, const char *fmt, va_list args)
+ 		fprintf(stderr, "%s: ", log_name);
+ #endif
+ 		va_copy(args2, args);
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wformat-nonliteral"
+ 		vfprintf(stderr, fmt, args2);
++#pragma GCC diagnostic pop
+ 		fprintf(stderr, "\n");
+ 		va_end(args2);
+ 	}
+ 
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wformat-nonliteral"
+ 	if (log_syslog) {
+ 		switch (kind) {
+ 		case L_FATAL:
+@@ -203,6 +208,7 @@ xlog_backend(int kind, const char *fmt, va_list args)
+ 			break;
+ 		}
+ 	}
++#pragma GCC diagnostic pop
+ 
+ 	if (kind == L_FATAL)
+ 		exit(1);
+diff --git a/support/nfsidmap/libnfsidmap.c b/support/nfsidmap/libnfsidmap.c
+index 0a912e52..95eb64d2 100644
+--- a/support/nfsidmap/libnfsidmap.c
++++ b/support/nfsidmap/libnfsidmap.c
+@@ -99,7 +99,10 @@ static void default_logger(const char *fmt, ...)
+ 	va_list vp;
+ 
+ 	va_start(vp, fmt);
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wformat-nonliteral"
+ 	vsyslog(LOG_WARNING, fmt, vp);
++#pragma GCC diagnostic pop
+ 	va_end(vp);
+ }
+ 
+diff --git a/utils/exportfs/exportfs.c b/utils/exportfs/exportfs.c
+index b03a047b..eac1ff2a 100644
+--- a/utils/exportfs/exportfs.c
++++ b/utils/exportfs/exportfs.c
+@@ -646,7 +646,10 @@ dumpopt(char c, char *fmt, ...)
+ 
+ 	va_start(ap, fmt);
+ 	printf("%c", c);
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wformat-nonliteral"
+ 	vprintf(fmt, ap);
++#pragma GCC diagnostic pop
+ 	va_end(ap);
+ 	return ',';
+ }
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
index 3896fac6ed5..bb65ba33a74 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
@@ -26,6 +26,9 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch \
            file://0001-tools-locktest-Use-intmax_t-to-print-off_t.patch \
            file://0001-reexport.h-Include-unistd.h-to-compile-with-musl.patch \
+           file://0001-gssd-use-printf-format-specifiers.patch \
+           file://0002-Use-nogroup-for-nobody-group.patch \
+           file://0003-find-OE-provided-Kerberos.patch \
            "
 SRC_URI[sha256sum] = "01b3b0fb9c7d0bbabf5114c736542030748c788ec2fd9734744201e9b0a1119d"
 
@@ -49,10 +52,9 @@ EXTRA_OECONF = "--with-statduser=rpcuser \
                 --enable-mountconfig \
                 --enable-libmount-mount \
                 --enable-uuid \
-                --disable-gss \
-                --disable-nfsdcltrack \
                 --disable-sbin-override \
                 --with-statdpath=/var/lib/nfs/statd \
+                --with-pluginpath=${libdir}/libnfsidmap \
                 --with-rpcgen=${HOSTTOOLS_DIR}/rpcgen \
                "
 
@@ -61,13 +63,16 @@ LDFLAGS:append = " -lsqlite3 -levent"
 PACKAGECONFIG ??= "tcp-wrappers \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd', d)} \
 "
+
 PACKAGECONFIG:remove:libc-musl = "tcp-wrappers"
+#krb5 is available in meta-oe
+PACKAGECONFIG[gssapi] = "--with-krb5=${STAGING_EXECPREFIXDIR} --enable-gss --enable-svcgss,--disable-gss --disable-svcgss,krb5"
 PACKAGECONFIG[tcp-wrappers] = "--with-tcp-wrappers,--without-tcp-wrappers,tcp-wrappers"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 # libdevmapper is available in meta-oe
 PACKAGECONFIG[nfsv41] = "--enable-nfsv41,--disable-nfsv41,libdevmapper,libdevmapper"
 # keyutils is available in meta-oe
-PACKAGECONFIG[nfsv4] = "--enable-nfsv4,--disable-nfsv4,keyutils,python3-core"
+PACKAGECONFIG[nfsv4] = "--enable-nfsv4 --enable-nfsdcltrack,--disable-nfsv4 --disable-nfsdcltrack,keyutils,python3-core"
 PACKAGECONFIG[systemd] = "--with-systemd=${systemd_unitdir}/system,--without-systemd"
 
 PACKAGES =+ "${PN}-client ${PN}-mount ${PN}-stats ${PN}-rpcctl"
@@ -76,19 +81,34 @@ CONFFILES:${PN}-client += "${localstatedir}/lib/nfs/etab \
 			   ${localstatedir}/lib/nfs/rmtab \
 			   ${localstatedir}/lib/nfs/xtab \
 			   ${localstatedir}/lib/nfs/statd/state \
+			   ${sysconfdir}/idmapd.conf \
 			   ${sysconfdir}/nfs.conf \
 			   ${sysconfdir}/nfsmount.conf"
 
 FILES:${PN}-client = "${sbindir}/*statd \
-		      ${libdir}/libnfsidmap.so.* \
 		      ${sbindir}/rpc.idmapd ${sbindir}/sm-notify \
 		      ${sbindir}/showmount ${sbindir}/nfsstat \
+		      ${sbindir}/rpc.gssd \
 		      ${sbindir}/nfsconf \
+		      ${libdir}/libnfsidmap.so.* \
+		      ${libdir}/libnfsidmap/*.so \
+		      ${libexecdir}/nfsrahead \
 		      ${localstatedir}/lib/nfs \
+		      ${sysconfdir}/idmapd.conf \
+		      ${sysconfdir}/init.d/nfscommon \
 		      ${sysconfdir}/nfs.conf \
 		      ${sysconfdir}/nfsmount.conf \
-		      ${sysconfdir}/init.d/nfscommon \
-		      ${systemd_system_unitdir}/nfs-statd.service"
+		      ${systemd_system_unitdir}/auth-rpcgss-module.service \
+		      ${systemd_system_unitdir}/nfs-client.target \
+		      ${systemd_system_unitdir}/nfs-idmapd.service \
+		      ${systemd_system_unitdir}/nfs-statd.service \
+		      ${systemd_system_unitdir}/nfscommon.service \
+		      ${systemd_system_unitdir}/rpc-gssd.service \
+		      ${systemd_system_unitdir}/rpc-statd-notify.service \
+		      ${systemd_system_unitdir}/rpc-statd.service \
+		      ${systemd_system_unitdir}/rpc_pipefs.target \
+		      ${systemd_system_unitdir}/var-lib-nfs-rpc_pipefs.mount \
+		      ${nonarch_libdir}/udev/rules.d/*"
 RDEPENDS:${PN}-client = "${PN}-mount rpcbind"
 
 FILES:${PN}-mount = "${base_sbindir}/*mount.nfs*"
@@ -104,8 +124,8 @@ FILES:${PN}-staticdev += "${libdir}/libnfsidmap/*.a"
 FILES:${PN} += "${systemd_unitdir} ${libdir}/libnfsidmap/ ${nonarch_libdir}/modprobe.d"
 
 do_configure:prepend() {
-	sed -i -e 's,sbindir = /sbin,sbindir = ${base_sbindir},g' \
-		${S}/utils/mount/Makefile.am
+	sed -i -e 's,udev_rulesdir = /usr/lib/udev/rules.d/,udev_rulesdir = ${nonarch_base_libdir}/udev/rules.d/,g' \
+	    ${S}/systemd/Makefile.am ${S}/tools/nfsrahead/Makefile.am
 }
 
 # Make clean needed because the package comes with
@@ -122,6 +142,7 @@ do_install:append () {
 	install -m 0755 ${WORKDIR}/nfsserver ${D}${sysconfdir}/init.d/nfsserver
 	install -m 0755 ${WORKDIR}/nfscommon ${D}${sysconfdir}/init.d/nfscommon
 
+	install -m 0644 ${S}/support/nfsidmap/idmapd.conf ${D}${sysconfdir}
 	install -m 0644 ${S}/nfs.conf ${D}${sysconfdir}
 
 	install -d ${D}${systemd_system_unitdir}
-- 
2.41.0


