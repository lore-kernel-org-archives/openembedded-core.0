Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46BE2C433EF
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 13:46:20 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.7216.1643377579284573779
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jan 2022 05:46:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qJMjoIsy;
 spf=pass (domain: gmail.com, ip: 209.85.210.172,
 mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id 128so6140668pfe.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jan 2022 05:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=cCZy47z34HHR20mJ3bN07LGCgkOSR+fb7ts6CF12Now=;
        b=qJMjoIsyBceljNUc51fwYFjQQ+7NeQ5IGzPfYtLTwHc1FvKNy5WmEPzJuW78CIZsOZ
         MUYXIj4RVXaXqK1GWFxUH8SOYbUkPcxViFVcSNObgtRHDucjjyKR8hQ8ztuet7QmH91g
         i5+1Dri4sJeGI3AUqJO20JkzF1brppAAIBTKXJ+zMkFwQxlVYANOPm6oRxzQTsJ/rdoq
         c7LUFMiChV38H7v6yKVwCyRU1H3gHIMFUdB5Zm7GQPgIPUxv/ZvLY8l+3Qc+hCvJ9oFK
         OXk3tI497v9rRUdASLtZO/rFa9AWHiz8N0dZIP/kX9iQ77+iI2xvl4l34Pcj/1SyJ5dR
         ex6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=cCZy47z34HHR20mJ3bN07LGCgkOSR+fb7ts6CF12Now=;
        b=ZfjmTsa1FESKCz4RbuUK6DwR388ZkHRDbnrCO+c4ADQxWht5jYOEXLSsnQMRW/Duq+
         lfm+pzHw0tN18Z2uZVz5Hi2Y5bjHWdjYIAluR0LH6mPeRyLNC9XbU3cf9O6wwzGc5FAO
         1irzXg7xCgovNfp6dWO+AzD1jAWVX5YjnvR9TqlGV+92JaClHEIMQ64SEmr8NBNlDEA0
         qlrpsisZNM35r5wx12e/Y5QiOxIXmKQoXVAcHwQlrVo1LgAITaPmZHDTV8mVUne+GVcT
         AMm2OinxEfTfhrJHCY3UUl36w5MYzRJI/ZGlIR5Mgk6XfNKmY/jimeqgn7RMMMY0tL3b
         AaIw==
X-Gm-Message-State: AOAM531690cTJSOpqznAGDRpdiX+G90a/F6vxKO3aS6zze1p8ia2Ua8q
	OBJIBUuWBDn9sTwe8c4KGXAP25zzVfcSjP8q
X-Google-Smtp-Source: 
 ABdhPJzQgAXkgv0AcoFaKX57Fmgnyom/JY59HLoXX19QG9HVEdkGU60xEg1ROBAHkvbaeAgz6pnPAg==
X-Received: by 2002:a63:cd:: with SMTP id 196mr6664322pga.87.1643377578016;
        Fri, 28 Jan 2022 05:46:18 -0800 (PST)
Received: from localhost.localdomain ([103.81.93.135])
        by smtp.gmail.com with ESMTPSA id
 c11sm10003505pfv.76.2022.01.28.05.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 05:46:17 -0800 (PST)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: akash.hadke@kpit.com,
	purushottam.choudhary@kpit.com,
	Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [meta][dunfell][PATCH] util-linux: Fix for CVE-2021-3995 and
 CVE-2021-3996
Date: Fri, 28 Jan 2022 19:15:51 +0530
Message-Id: <20220128134551.14630-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jan 2022 13:46:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161079

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Add patches to fix CVE-2021-3995 and CVE-2021-3996
Also, add support include-strutils-cleanup-strto-functions.patch to
solve compilation error where `ul_strtou64` function not found which is
used in CVE-2021-3995.patch

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 .../util-linux/util-linux/CVE-2021-3995.patch | 139 +++++++++
 .../util-linux/util-linux/CVE-2021-3996.patch | 226 +++++++++++++++
 ...ude-strutils-cleanup-strto-functions.patch | 270 ++++++++++++++++++
 .../util-linux/util-linux_2.35.1.bb           |   3 +
 4 files changed, 638 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2021-3995.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2021-3996.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/include-strutils-cleanup-strto-functions.patch

diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2021-3995.patch b/meta/recipes-core/util-linux/util-linux/CVE-2021-3995.patch
new file mode 100644
index 0000000000..1dcb66ad1d
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2021-3995.patch
@@ -0,0 +1,139 @@
+From f3db9bd609494099f0c1b95231c5dfe383346929 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Wed, 24 Nov 2021 13:53:25 +0100
+Subject: [PATCH] libmount: fix UID check for FUSE umount [CVE-2021-3995]
+
+Improper UID check allows an unprivileged user to unmount FUSE
+filesystems of users with similar UID.
+
+Signed-off-by: Karel Zak <kzak@redhat.com>
+
+CVE: CVE-2021-3995
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/f3db9bd609494099f0c1b95231c5dfe383346929]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+---
+ include/strutils.h            |  2 +-
+ libmount/src/context_umount.c | 14 +++---------
+ libmount/src/mountP.h         |  1 +
+ libmount/src/optstr.c         | 42 +++++++++++++++++++++++++++++++++++
+ 4 files changed, 47 insertions(+), 12 deletions(-)
+
+diff --git a/include/strutils.h b/include/strutils.h
+index 6e95707ea9..a84d29594d 100644
+--- a/include/strutils.h
++++ b/include/strutils.h
+@@ -91,8 +91,8 @@ static inline char *mem2strcpy(char *dest, const void *src, size_t n, size_t nma
+ 	if (n + 1 > nmax)
+ 		n = nmax - 1;
+ 
++	memset(dest, '\0', nmax);
+ 	memcpy(dest, src, n);
+-	dest[nmax-1] = '\0';
+ 	return dest;
+ }
+ 
+diff --git a/libmount/src/context_umount.c b/libmount/src/context_umount.c
+index 173637a15a..8773c65ffa 100644
+--- a/libmount/src/context_umount.c
++++ b/libmount/src/context_umount.c
+@@ -393,10 +393,7 @@ static int is_fuse_usermount(struct libmnt_context *cxt, int *errsv)
+ 	struct libmnt_ns *ns_old;
+ 	const char *type = mnt_fs_get_fstype(cxt->fs);
+ 	const char *optstr;
+-	char *user_id = NULL;
+-	size_t sz;
+-	uid_t uid;
+-	char uidstr[sizeof(stringify_value(ULONG_MAX))];
++	uid_t uid, entry_uid;
+ 
+ 	*errsv = 0;
+ 
+@@ -413,11 +410,7 @@ static int is_fuse_usermount(struct libmnt_context *cxt, int *errsv)
+ 	optstr = mnt_fs_get_fs_options(cxt->fs);
+ 	if (!optstr)
+ 		return 0;
+-
+-	if (mnt_optstr_get_option(optstr, "user_id", &user_id, &sz) != 0)
+-		return 0;
+-
+-	if (sz == 0 || user_id == NULL)
++	if (mnt_optstr_get_uid(optstr, "user_id", &entry_uid) != 0)
+ 		return 0;
+ 
+ 	/* get current user */
+@@ -434,8 +427,7 @@ static int is_fuse_usermount(struct libmnt_context *cxt, int *errsv)
+ 		return 0;
+ 	}
+ 
+-	snprintf(uidstr, sizeof(uidstr), "%lu", (unsigned long) uid);
+-	return strncmp(user_id, uidstr, sz) == 0;
++	return uid == entry_uid;
+ }
+ 
+ /*
+diff --git a/libmount/src/mountP.h b/libmount/src/mountP.h
+index d43a835418..22442ec55e 100644
+--- a/libmount/src/mountP.h
++++ b/libmount/src/mountP.h
+@@ -400,6 +400,7 @@ extern const struct libmnt_optmap *mnt_optmap_get_entry(
+ 			     const struct libmnt_optmap **mapent);
+ 
+ /* optstr.c */
++extern int mnt_optstr_get_uid(const char *optstr, const char *name, uid_t *uid);
+ extern int mnt_optstr_remove_option_at(char **optstr, char *begin, char *end);
+ extern int mnt_optstr_fix_gid(char **optstr, char *value, size_t valsz, char **next);
+ extern int mnt_optstr_fix_uid(char **optstr, char *value, size_t valsz, char **next);
+diff --git a/libmount/src/optstr.c b/libmount/src/optstr.c
+index 921b9318e7..16800f571c 100644
+--- a/libmount/src/optstr.c
++++ b/libmount/src/optstr.c
+@@ -1090,6 +1090,48 @@ int mnt_optstr_fix_user(char **optstr)
+ 	return rc;
+ }
+ 
++/*
++ * Converts value from @optstr addressed by @name to uid.
++ *
++ * Returns: 0 on success, 1 if not found, <0 on error
++ */
++int mnt_optstr_get_uid(const char *optstr, const char *name, uid_t *uid)
++{
++	char *value = NULL;
++	size_t valsz = 0;
++	char buf[sizeof(stringify_value(UINT64_MAX))];
++	int rc;
++	uint64_t num;
++
++	assert(optstr);
++	assert(name);
++	assert(uid);
++
++	rc = mnt_optstr_get_option(optstr, name, &value, &valsz);
++	if (rc != 0)
++		goto fail;
++
++	if (valsz > sizeof(buf) - 1) {
++		rc = -ERANGE;
++		goto fail;
++	}
++	mem2strcpy(buf, value, valsz, sizeof(buf));
++
++	rc = ul_strtou64(buf, &num, 10);
++	if (rc != 0)
++		goto fail;
++	if (num > ULONG_MAX || (uid_t) num != num) {
++		rc = -ERANGE;
++		goto fail;
++	}
++	*uid = (uid_t) num;
++
++	return 0;
++fail:
++	DBG(UTILS, ul_debug("failed to convert '%s'= to number [rc=%d]", name, rc));
++	return rc;
++}
++
+ /**
+  * mnt_match_options:
+  * @optstr: options string
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2021-3996.patch b/meta/recipes-core/util-linux/util-linux/CVE-2021-3996.patch
new file mode 100644
index 0000000000..1610b5a0fe
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2021-3996.patch
@@ -0,0 +1,226 @@
+From 018a10907fa9885093f6d87401556932c2d8bd2b Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Tue, 4 Jan 2022 10:54:20 +0100
+Subject: [PATCH] libmount: fix (deleted) suffix issue [CVE-2021-3996]
+
+This issue is related to parsing the /proc/self/mountinfo file allows an
+unprivileged user to unmount other user's filesystems that are either
+world-writable themselves or mounted in a world-writable directory.
+
+The support for "(deleted)" is no more necessary as the Linux kernel does
+not use it in /proc/self/mountinfo and /proc/self/mount files anymore.
+
+Signed-off-by: Karel Zak <kzak@redhat.com>
+
+CVE: CVE-2021-3996
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/018a10907fa9885093f6d87401556932c2d8bd2b]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+---
+ libmount/src/tab_parse.c                            |  5 -----
+ tests/expected/findmnt/filter-options               |  1 -
+ tests/expected/findmnt/filter-options-nameval-neg   |  3 +--
+ tests/expected/findmnt/filter-types-neg             |  1 -
+ tests/expected/findmnt/outputs-default              |  3 +--
+ tests/expected/findmnt/outputs-force-tree           |  3 +--
+ tests/expected/findmnt/outputs-kernel               |  3 +--
+ tests/expected/libmount/tabdiff-mount               |  1 -
+ tests/expected/libmount/tabdiff-move                |  1 -
+ tests/expected/libmount/tabdiff-remount             |  1 -
+ tests/expected/libmount/tabdiff-umount              |  1 -
+ tests/expected/libmount/tabfiles-parse-mountinfo    | 11 -----------
+ tests/expected/libmount/tabfiles-py-parse-mountinfo | 11 -----------
+ tests/ts/findmnt/files/mountinfo                    |  1 -
+ tests/ts/findmnt/files/mountinfo-nonroot            |  1 -
+ tests/ts/libmount/files/mountinfo                   |  1 -
+ 16 files changed, 4 insertions(+), 44 deletions(-)
+
+diff --git a/libmount/src/tab_parse.c b/libmount/src/tab_parse.c
+index 917779ab6d..4407f9c9c7 100644
+--- a/libmount/src/tab_parse.c
++++ b/libmount/src/tab_parse.c
+@@ -225,11 +225,6 @@ static int mnt_parse_mountinfo_line(struct libmnt_fs *fs, const char *s)
+ 		goto fail;
+ 	}
+ 
+-	/* remove "\040(deleted)" suffix */
+-	p = (char *) endswith(fs->target, PATH_DELETED_SUFFIX);
+-	if (p && *p)
+-		*p = '\0';
+-
+ 	s = skip_separator(s);
+ 
+ 	/* (6) vfs options (fs-independent) */
+diff --git a/tests/expected/findmnt/filter-options b/tests/expected/findmnt/filter-options
+index 2606bce76b..97b0ead0ad 100644
+--- a/tests/expected/findmnt/filter-options
++++ b/tests/expected/findmnt/filter-options
+@@ -28,5 +28,4 @@ TARGET                       SOURCE           FSTYPE                OPTIONS
+ /home/kzak/.gvfs             gvfs-fuse-daemon fuse.gvfs-fuse-daemon rw,nosuid,nodev,relatime,user_id=500,group_id=500
+ /var/lib/nfs/rpc_pipefs      sunrpc           rpc_pipefs            rw,relatime
+ /mnt/sounds                  //foo.home/bar/  cifs                  rw,relatime,unc=\\foo.home\bar,username=kzak,domain=SRGROUP,uid=0,noforceuid,gid=0,noforcegid,addr=192.168.111.1,posixpaths,serverino,acl,rsize=16384,wsize=57344
+-/mnt/foo                     /fooooo          bar                   rw,relatime
+ rc=0
+diff --git a/tests/expected/findmnt/filter-options-nameval-neg b/tests/expected/findmnt/filter-options-nameval-neg
+index 5471d65af1..f0467ef755 100644
+--- a/tests/expected/findmnt/filter-options-nameval-neg
++++ b/tests/expected/findmnt/filter-options-nameval-neg
+@@ -29,6 +29,5 @@ TARGET                         SOURCE                FSTYPE                OPTIO
+ |-/home/kzak                   /dev/mapper/kzak-home ext4                  rw,noatime,barrier=1,data=ordered
+ | `-/home/kzak/.gvfs           gvfs-fuse-daemon      fuse.gvfs-fuse-daemon rw,nosuid,nodev,relatime,user_id=500,group_id=500
+ |-/var/lib/nfs/rpc_pipefs      sunrpc                rpc_pipefs            rw,relatime
+-|-/mnt/sounds                  //foo.home/bar/       cifs                  rw,relatime,unc=\\foo.home\bar,username=kzak,domain=SRGROUP,uid=0,noforceuid,gid=0,noforcegid,addr=192.168.111.1,posixpaths,serverino,acl,rsize=16384,wsize=57344
+-`-/mnt/foo                     /fooooo               bar                   rw,relatime
++`-/mnt/sounds                  //foo.home/bar/       cifs                  rw,relatime,unc=\\foo.home\bar,username=kzak,domain=SRGROUP,uid=0,noforceuid,gid=0,noforcegid,addr=192.168.111.1,posixpaths,serverino,acl,rsize=16384,wsize=57344
+ rc=0
+diff --git a/tests/expected/findmnt/filter-types-neg b/tests/expected/findmnt/filter-types-neg
+index 2606bce76b..97b0ead0ad 100644
+--- a/tests/expected/findmnt/filter-types-neg
++++ b/tests/expected/findmnt/filter-types-neg
+@@ -28,5 +28,4 @@ TARGET                       SOURCE           FSTYPE                OPTIONS
+ /home/kzak/.gvfs             gvfs-fuse-daemon fuse.gvfs-fuse-daemon rw,nosuid,nodev,relatime,user_id=500,group_id=500
+ /var/lib/nfs/rpc_pipefs      sunrpc           rpc_pipefs            rw,relatime
+ /mnt/sounds                  //foo.home/bar/  cifs                  rw,relatime,unc=\\foo.home\bar,username=kzak,domain=SRGROUP,uid=0,noforceuid,gid=0,noforcegid,addr=192.168.111.1,posixpaths,serverino,acl,rsize=16384,wsize=57344
+-/mnt/foo                     /fooooo          bar                   rw,relatime
+ rc=0
+diff --git a/tests/expected/findmnt/outputs-default b/tests/expected/findmnt/outputs-default
+index 59495797bd..01599355ec 100644
+--- a/tests/expected/findmnt/outputs-default
++++ b/tests/expected/findmnt/outputs-default
+@@ -30,6 +30,5 @@ TARGET                         SOURCE                FSTYPE                OPTIO
+ |-/home/kzak                   /dev/mapper/kzak-home ext4                  rw,noatime,barrier=1,data=ordered
+ | `-/home/kzak/.gvfs           gvfs-fuse-daemon      fuse.gvfs-fuse-daemon rw,nosuid,nodev,relatime,user_id=500,group_id=500
+ |-/var/lib/nfs/rpc_pipefs      sunrpc                rpc_pipefs            rw,relatime
+-|-/mnt/sounds                  //foo.home/bar/       cifs                  rw,relatime,unc=\\foo.home\bar,username=kzak,domain=SRGROUP,uid=0,noforceuid,gid=0,noforcegid,addr=192.168.111.1,posixpaths,serverino,acl,rsize=16384,wsize=57344
+-`-/mnt/foo                     /fooooo               bar                   rw,relatime
++`-/mnt/sounds                  //foo.home/bar/       cifs                  rw,relatime,unc=\\foo.home\bar,username=kzak,domain=SRGROUP,uid=0,noforceuid,gid=0,noforcegid,addr=192.168.111.1,posixpaths,serverino,acl,rsize=16384,wsize=57344
+ rc=0
+diff --git a/tests/expected/findmnt/outputs-force-tree b/tests/expected/findmnt/outputs-force-tree
+index 59495797bd..01599355ec 100644
+--- a/tests/expected/findmnt/outputs-force-tree
++++ b/tests/expected/findmnt/outputs-force-tree
+@@ -30,6 +30,5 @@ TARGET                         SOURCE                FSTYPE                OPTIO
+ |-/home/kzak                   /dev/mapper/kzak-home ext4                  rw,noatime,barrier=1,data=ordered
+ | `-/home/kzak/.gvfs           gvfs-fuse-daemon      fuse.gvfs-fuse-daemon rw,nosuid,nodev,relatime,user_id=500,group_id=500
+ |-/var/lib/nfs/rpc_pipefs      sunrpc                rpc_pipefs            rw,relatime
+-|-/mnt/sounds                  //foo.home/bar/       cifs                  rw,relatime,unc=\\foo.home\bar,username=kzak,domain=SRGROUP,uid=0,noforceuid,gid=0,noforcegid,addr=192.168.111.1,posixpaths,serverino,acl,rsize=16384,wsize=57344
+-`-/mnt/foo                     /fooooo               bar                   rw,relatime
++`-/mnt/sounds                  //foo.home/bar/       cifs                  rw,relatime,unc=\\foo.home\bar,username=kzak,domain=SRGROUP,uid=0,noforceuid,gid=0,noforcegid,addr=192.168.111.1,posixpaths,serverino,acl,rsize=16384,wsize=57344
+ rc=0
+diff --git a/tests/expected/findmnt/outputs-kernel b/tests/expected/findmnt/outputs-kernel
+index 59495797bd..01599355ec 100644
+--- a/tests/expected/findmnt/outputs-kernel
++++ b/tests/expected/findmnt/outputs-kernel
+@@ -30,6 +30,5 @@ TARGET                         SOURCE                FSTYPE                OPTIO
+ |-/home/kzak                   /dev/mapper/kzak-home ext4                  rw,noatime,barrier=1,data=ordered
+ | `-/home/kzak/.gvfs           gvfs-fuse-daemon      fuse.gvfs-fuse-daemon rw,nosuid,nodev,relatime,user_id=500,group_id=500
+ |-/var/lib/nfs/rpc_pipefs      sunrpc                rpc_pipefs            rw,relatime
+-|-/mnt/sounds                  //foo.home/bar/       cifs                  rw,relatime,unc=\\foo.home\bar,username=kzak,domain=SRGROUP,uid=0,noforceuid,gid=0,noforcegid,addr=192.168.111.1,posixpaths,serverino,acl,rsize=16384,wsize=57344
+-`-/mnt/foo                     /fooooo               bar                   rw,relatime
++`-/mnt/sounds                  //foo.home/bar/       cifs                  rw,relatime,unc=\\foo.home\bar,username=kzak,domain=SRGROUP,uid=0,noforceuid,gid=0,noforcegid,addr=192.168.111.1,posixpaths,serverino,acl,rsize=16384,wsize=57344
+ rc=0
+diff --git a/tests/expected/libmount/tabdiff-mount b/tests/expected/libmount/tabdiff-mount
+index 420aeacd5e..3c18f8dc4f 100644
+--- a/tests/expected/libmount/tabdiff-mount
++++ b/tests/expected/libmount/tabdiff-mount
+@@ -1,3 +1,2 @@
+ /dev/mapper/kzak-home on /home/kzak: MOUNTED
+-/fooooo on /mnt/foo: MOUNTED
+ tmpfs on /mnt/test/foo
bar: MOUNTED
+diff --git a/tests/expected/libmount/tabdiff-move b/tests/expected/libmount/tabdiff-move
+index 24f9bc791b..95820d93ef 100644
+--- a/tests/expected/libmount/tabdiff-move
++++ b/tests/expected/libmount/tabdiff-move
+@@ -1,3 +1,2 @@
+ //foo.home/bar/ on /mnt/music: MOVED to /mnt/music
+-/fooooo on /mnt/foo: UMOUNTED
+ tmpfs on /mnt/test/foo
bar: UMOUNTED
+diff --git a/tests/expected/libmount/tabdiff-remount b/tests/expected/libmount/tabdiff-remount
+index 82ebeab390..876bfd9539 100644
+--- a/tests/expected/libmount/tabdiff-remount
++++ b/tests/expected/libmount/tabdiff-remount
+@@ -1,4 +1,3 @@
+ /dev/mapper/kzak-home on /home/kzak: REMOUNTED from 'rw,noatime,barrier=1,data=ordered' to 'ro,noatime,barrier=1,data=ordered'
+ //foo.home/bar/ on /mnt/sounds: REMOUNTED from 'rw,relatime,unc=\\foo.home\bar,username=kzak,domain=SRGROUP,uid=0,noforceuid,gid=0,noforcegid,addr=192.168.111.1,posixpaths,serverino,acl,rsize=16384,wsize=57344' to 'ro,relatime,unc=\\foo.home\bar,username=kzak,domain=SRGROUP,uid=0,noforceuid,gid=0,noforcegid,addr=192.168.111.1,posixpaths,serverino,acl,rsize=16384,wsize=57344'
+-/fooooo on /mnt/foo: UMOUNTED
+ tmpfs on /mnt/test/foo
bar: UMOUNTED
+diff --git a/tests/expected/libmount/tabdiff-umount b/tests/expected/libmount/tabdiff-umount
+index a3e0fe48a1..c7be725b92 100644
+--- a/tests/expected/libmount/tabdiff-umount
++++ b/tests/expected/libmount/tabdiff-umount
+@@ -1,3 +1,2 @@
+ /dev/mapper/kzak-home on /home/kzak: UMOUNTED
+-/fooooo on /mnt/foo: UMOUNTED
+ tmpfs on /mnt/test/foo
bar: UMOUNTED
+diff --git a/tests/expected/libmount/tabfiles-parse-mountinfo b/tests/expected/libmount/tabfiles-parse-mountinfo
+index 47eb770061..d5ba5248e4 100644
+--- a/tests/expected/libmount/tabfiles-parse-mountinfo
++++ b/tests/expected/libmount/tabfiles-parse-mountinfo
+@@ -351,17 +351,6 @@ id:     47
+ parent: 20
+ devno:  0:38
+ ------ fs:
+-source: /fooooo
+-target: /mnt/foo
+-fstype: bar
+-optstr: rw,relatime
+-VFS-optstr: rw,relatime
+-FS-opstr: rw
+-root:   /
+-id:     48
+-parent: 20
+-devno:  0:39
+------- fs:
+ source: tmpfs
+ target: /mnt/test/foo
bar
+ fstype: tmpfs
+diff --git a/tests/expected/libmount/tabfiles-py-parse-mountinfo b/tests/expected/libmount/tabfiles-py-parse-mountinfo
+index 47eb770061..d5ba5248e4 100644
+--- a/tests/expected/libmount/tabfiles-py-parse-mountinfo
++++ b/tests/expected/libmount/tabfiles-py-parse-mountinfo
+@@ -351,17 +351,6 @@ id:     47
+ parent: 20
+ devno:  0:38
+ ------ fs:
+-source: /fooooo
+-target: /mnt/foo
+-fstype: bar
+-optstr: rw,relatime
+-VFS-optstr: rw,relatime
+-FS-opstr: rw
+-root:   /
+-id:     48
+-parent: 20
+-devno:  0:39
+------- fs:
+ source: tmpfs
+ target: /mnt/test/foo
bar
+ fstype: tmpfs
+diff --git a/tests/ts/findmnt/files/mountinfo b/tests/ts/findmnt/files/mountinfo
+index 475ea1a337..ff1e664a84 100644
+--- a/tests/ts/findmnt/files/mountinfo
++++ b/tests/ts/findmnt/files/mountinfo
+@@ -30,4 +30,3 @@
+ 44 41 0:36 / /home/kzak/.gvfs rw,nosuid,nodev,relatime - fuse.gvfs-fuse-daemon gvfs-fuse-daemon rw,user_id=500,group_id=500
+ 45 20 0:37 / /var/lib/nfs/rpc_pipefs rw,relatime - rpc_pipefs sunrpc rw
+ 47 20 0:38 / /mnt/sounds rw,relatime - cifs //foo.home/bar/ rw,unc=\\foo.home\bar,username=kzak,domain=SRGROUP,uid=0,noforceuid,gid=0,noforcegid,addr=192.168.111.1,posixpaths,serverino,acl,rsize=16384,wsize=57344
+-48 20 0:39 / /mnt/foo\040(deleted) rw,relatime - bar /fooooo rw
+diff --git a/tests/ts/findmnt/files/mountinfo-nonroot b/tests/ts/findmnt/files/mountinfo-nonroot
+index e15b467016..87b421d2ef 100644
+--- a/tests/ts/findmnt/files/mountinfo-nonroot
++++ b/tests/ts/findmnt/files/mountinfo-nonroot
+@@ -29,4 +29,3 @@
+ 44 41 0:36 / /home/kzak/.gvfs rw,nosuid,nodev,relatime - fuse.gvfs-fuse-daemon gvfs-fuse-daemon rw,user_id=500,group_id=500
+ 45 20 0:37 / /var/lib/nfs/rpc_pipefs rw,relatime - rpc_pipefs sunrpc rw
+ 47 20 0:38 / /mnt/sounds rw,relatime - cifs //foo.home/bar/ rw,unc=\\foo.home\bar,username=kzak,domain=SRGROUP,uid=0,noforceuid,gid=0,noforcegid,addr=192.168.111.1,posixpaths,serverino,acl,rsize=16384,wsize=57344
+-48 20 0:39 / /mnt/foo\040(deleted) rw,relatime - bar /fooooo rw
+diff --git a/tests/ts/libmount/files/mountinfo b/tests/ts/libmount/files/mountinfo
+index c063071833..2b01740481 100644
+--- a/tests/ts/libmount/files/mountinfo
++++ b/tests/ts/libmount/files/mountinfo
+@@ -30,5 +30,4 @@
+ 44 41 0:36 / /home/kzak/.gvfs rw,nosuid,nodev,relatime - fuse.gvfs-fuse-daemon gvfs-fuse-daemon rw,user_id=500,group_id=500
+ 45 20 0:37 / /var/lib/nfs/rpc_pipefs rw,relatime - rpc_pipefs sunrpc rw
+ 47 20 0:38 / /mnt/sounds rw,relatime - cifs //foo.home/bar/ rw,unc=\\foo.home\bar,username=kzak,domain=SRGROUP,uid=0,noforceuid,gid=0,noforcegid,addr=192.168.111.1,posixpaths,serverino,acl,rsize=16384,wsize=57344
+-48 20 0:39 / /mnt/foo\040(deleted) rw,relatime - bar /fooooo rw
+ 49 20 0:56 / /mnt/test/foo
bar rw,relatime shared:323 - tmpfs tmpfs rw
diff --git a/meta/recipes-core/util-linux/util-linux/include-strutils-cleanup-strto-functions.patch b/meta/recipes-core/util-linux/util-linux/include-strutils-cleanup-strto-functions.patch
new file mode 100644
index 0000000000..5d5a370821
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/include-strutils-cleanup-strto-functions.patch
@@ -0,0 +1,270 @@
+From 84825b161ba5d18da4142893b9789b3fc71284d9 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Tue, 22 Jun 2021 14:20:42 +0200
+Subject: [PATCH] include/strutils: cleanup strto..() functions
+
+* add ul_strtos64() and ul_strtou64()
+* add simple test
+
+Addresses: https://github.com/karelzak/util-linux/issues/1358
+Signed-off-by: Karel Zak <kzak@redhat.com>
+
+Upstream-Backport: [https://github.com/util-linux/util-linux/commit/84825b161ba5d18da4142893b9789b3fc71284d9]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+---
+ include/strutils.h |   3 +
+ lib/strutils.c     | 174 ++++++++++++++++++++++++++-------------------
+ 2 files changed, 105 insertions(+), 72 deletions(-)
+
+diff --git a/include/strutils.h b/include/strutils.h
+index e75a2f0e17..389e849905 100644
+--- a/include/strutils.h
++++ b/include/strutils.h
+@@ -19,6 +19,9 @@ extern int parse_size(const char *str, uintmax_t *res, int *power);
+ extern int strtosize(const char *str, uintmax_t *res);
+ extern uintmax_t strtosize_or_err(const char *str, const char *errmesg);
+ 
++extern int ul_strtos64(const char *str, int64_t *num, int base);
++extern int ul_strtou64(const char *str, uint64_t *num, int base);
++
+ extern int16_t strtos16_or_err(const char *str, const char *errmesg);
+ extern uint16_t strtou16_or_err(const char *str, const char *errmesg);
+ extern uint16_t strtox16_or_err(const char *str, const char *errmesg);
+diff --git a/lib/strutils.c b/lib/strutils.c
+index ee2c835495..d9976dca70 100644
+--- a/lib/strutils.c
++++ b/lib/strutils.c
+@@ -319,39 +319,80 @@ char *strndup(const char *s, size_t n)
+ }
+ #endif
+ 
+-static uint32_t _strtou32_or_err(const char *str, const char *errmesg, int base);
+-static uint64_t _strtou64_or_err(const char *str, const char *errmesg, int base);
++/*
++ * convert strings to numbers; returns <0 on error, and 0 on success
++ */
++int ul_strtos64(const char *str, int64_t *num, int base)
++{
++	char *end = NULL;
+ 
+-int16_t strtos16_or_err(const char *str, const char *errmesg)
++	errno = 0;
++	if (str == NULL || *str == '\0')
++		return -EINVAL;
++	*num = (int64_t) strtoimax(str, &end, base);
++
++	if (errno || str == end || (end && *end))
++		return -EINVAL;
++	return 0;
++}
++
++int ul_strtou64(const char *str, uint64_t *num, int base)
+ {
+-	int32_t num = strtos32_or_err(str, errmesg);
++	char *end = NULL;
+ 
+-	if (num < INT16_MIN || num > INT16_MAX) {
+-		errno = ERANGE;
+-		err(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
+-	}
+-	return num;
++	errno = 0;
++	if (str == NULL || *str == '\0')
++		return -EINVAL;
++	*num = (uint64_t) strtoumax(str, &end, base);
++
++	if (errno || str == end || (end && *end))
++		return -EINVAL;
++	return 0;
+ }
+ 
+-static uint16_t _strtou16_or_err(const char *str, const char *errmesg, int base)
++/*
++ * Covert strings to numbers and print message on error.
++ *
++ * Note that hex functions (strtox..()) returns unsigned numbers, if you need
++ * something else then use ul_strtos64(s, &n, 16).
++ */
++int64_t strtos64_or_err(const char *str, const char *errmesg)
+ {
+-	uint32_t num = _strtou32_or_err(str, errmesg, base);
++	int64_t num = 0;
+ 
+-	if (num > UINT16_MAX) {
+-		errno = ERANGE;
+-		err(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
++	if (ul_strtos64(str, &num, 10) != 0) {
++		if (errno == ERANGE)
++			err(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
++
++		errx(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
+ 	}
+ 	return num;
+ }
+ 
+-uint16_t strtou16_or_err(const char *str, const char *errmesg)
++uint64_t strtou64_or_err(const char *str, const char *errmesg)
+ {
+-	return _strtou16_or_err(str, errmesg, 10);
++	uint64_t num = 0;
++
++	if (ul_strtou64(str, &num, 10)) {
++		if (errno == ERANGE)
++			err(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
++
++		errx(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
++	}
++	return num;
+ }
+ 
+-uint16_t strtox16_or_err(const char *str, const char *errmesg)
++uint64_t strtox64_or_err(const char *str, const char *errmesg)
+ {
+-	return _strtou16_or_err(str, errmesg, 16);
++	uint64_t num = 0;
++
++	if (ul_strtou64(str, &num, 16)) {
++		if (errno == ERANGE)
++			err(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
++
++		errx(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
++	}
++	return num;
+ }
+ 
+ int32_t strtos32_or_err(const char *str, const char *errmesg)
+@@ -365,9 +406,9 @@ int32_t strtos32_or_err(const char *str, const char *errmesg)
+ 	return num;
+ }
+ 
+-static uint32_t _strtou32_or_err(const char *str, const char *errmesg, int base)
++uint32_t strtou32_or_err(const char *str, const char *errmesg)
+ {
+-	uint64_t num = _strtou64_or_err(str, errmesg, base);
++	uint64_t num = strtou64_or_err(str, errmesg);
+ 
+ 	if (num > UINT32_MAX) {
+ 		errno = ERANGE;
+@@ -376,66 +417,48 @@ static uint32_t _strtou32_or_err(const char *str, const char *errmesg, int base)
+ 	return num;
+ }
+ 
+-uint32_t strtou32_or_err(const char *str, const char *errmesg)
+-{
+-	return _strtou32_or_err(str, errmesg, 10);
+-}
+-
+ uint32_t strtox32_or_err(const char *str, const char *errmesg)
+ {
+-	return _strtou32_or_err(str, errmesg, 16);
++	uint64_t num = strtox64_or_err(str, errmesg);
++
++	if (num > UINT32_MAX) {
++		errno = ERANGE;
++		err(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
++	}
++	return num;
+ }
+ 
+-int64_t strtos64_or_err(const char *str, const char *errmesg)
++int16_t strtos16_or_err(const char *str, const char *errmesg)
+ {
+-	int64_t num;
+-	char *end = NULL;
+-
+-	errno = 0;
+-	if (str == NULL || *str == '\0')
+-		goto err;
+-	num = strtoimax(str, &end, 10);
+-
+-	if (errno || str == end || (end && *end))
+-		goto err;
++	int64_t num = strtos64_or_err(str, errmesg);
+ 
+-	return num;
+-err:
+-	if (errno == ERANGE)
++	if (num < INT16_MIN || num > INT16_MAX) {
++		errno = ERANGE;
+ 		err(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
+-
+-	errx(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
++	}
++	return num;
+ }
+ 
+-static uint64_t _strtou64_or_err(const char *str, const char *errmesg, int base)
++uint16_t strtou16_or_err(const char *str, const char *errmesg)
+ {
+-	uintmax_t num;
+-	char *end = NULL;
+-
+-	errno = 0;
+-	if (str == NULL || *str == '\0')
+-		goto err;
+-	num = strtoumax(str, &end, base);
+-
+-	if (errno || str == end || (end && *end))
+-		goto err;
++	uint64_t num = strtou64_or_err(str, errmesg);
+ 
+-	return num;
+-err:
+-	if (errno == ERANGE)
++	if (num > UINT16_MAX) {
++		errno = ERANGE;
+ 		err(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
+-
+-	errx(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
++	}
++	return num;
+ }
+ 
+-uint64_t strtou64_or_err(const char *str, const char *errmesg)
++uint16_t strtox16_or_err(const char *str, const char *errmesg)
+ {
+-	return _strtou64_or_err(str, errmesg, 10);
+-}
++	uint64_t num = strtox64_or_err(str, errmesg);
+ 
+-uint64_t strtox64_or_err(const char *str, const char *errmesg)
+-{
+-	return _strtou64_or_err(str, errmesg, 16);
++	if (num > UINT16_MAX) {
++		errno = ERANGE;
++		err(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
++	}
++	return num;
+ }
+ 
+ double strtod_or_err(const char *str, const char *errmesg)
+@@ -1051,15 +1051,25 @@ static int test_strutils_cmp_paths(int a
+ 
+ int main(int argc, char *argv[])
+ {
+-	if (argc == 3 && strcmp(argv[1], "--size") == 0)
++	if (argc == 3 && strcmp(argv[1], "--size") == 0) {
+ 		return test_strutils_sizes(argc - 1, argv + 1);
+ 
+-	else if (argc == 4 && strcmp(argv[1], "--cmp-paths") == 0)
++	} else if (argc == 4 && strcmp(argv[1], "--cmp-paths") == 0) {
+ 		return test_strutils_cmp_paths(argc - 1, argv + 1);
+ 
++	} else if (argc == 3 && strcmp(argv[1], "--str2num") == 0) {
++        	uint64_t n;
++
++        	if (ul_strtou64(argv[2], &n, 10) == 0) {
++                	printf("'%s' --> %ju\n", argv[2], (uintmax_t) n);
++                	return EXIT_SUCCESS;
++        	}
++	}
++
+ 	else {
+ 		fprintf(stderr, "usage: %1$s --size <number>[suffix]\n"
+-				"       %1$s --cmp-paths <path> <path>\n",
++				"       %1$s --cmp-paths <path> <path>\n"
++				"       %1$s --num2num <str>\n",
+ 				argv[0]);
+ 		exit(EXIT_FAILURE);
+ 	}
diff --git a/meta/recipes-core/util-linux/util-linux_2.35.1.bb b/meta/recipes-core/util-linux/util-linux_2.35.1.bb
index 731f0618eb..96d5eca518 100644
--- a/meta/recipes-core/util-linux/util-linux_2.35.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.35.1.bb
@@ -12,6 +12,9 @@ SRC_URI += "file://configure-sbindir.patch \
             file://0001-kill-include-sys-types.h-before-checking-SYS_pidfd_s.patch \
             file://0001-include-cleanup-pidfd-inckudes.patch \
             file://CVE-2021-37600.patch \
+            file://include-strutils-cleanup-strto-functions.patch \
+            file://CVE-2021-3995.patch \
+            file://CVE-2021-3996.patch \
 "
 SRC_URI[md5sum] = "7f64882f631225f0295ca05080cee1bf"
 SRC_URI[sha256sum] = "d9de3edd287366cd908e77677514b9387b22bc7b88f45b83e1922c3597f1d7f9"
-- 
2.17.1


