Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D114C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 19:51:21 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.2845.1643917880458794813
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:51:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=zg69FoZx;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id h14so3139502plf.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3P8odiGFjaF77OzaKZoiFxZIG8DY3l19/W6K0STXSMs=;
        b=zg69FoZxixAL1JGFqbnVqK1lnYf2nqgPOxE6ELLtf7ynW3gpleCugvJ7FQnQxibM/M
         zT4yRQTHIqk5FrepssY+1KAAkpJUjCYLu8LjLXogWhvns3O2sUE1ach2vhrhWLbC53FZ
         uf63H5tZXOKfTzjQ/+5C4lljj/NWk0FKrH64AnLieqqFiPp3EcZukRDYzDpeIl4ChHAD
         k/HlVjiFBbBK/MYdjH81O+YMgohJyb1p8VL8pTqJLQoP8GGV40ztRoF4nDDjzrcaQ5io
         jCrMomTB7SMG24BZhh8gMYdZ6+8H4+aq6Lb2geDQ9KykGDW7rTD6nzwleWgvaJsxfoNp
         pAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3P8odiGFjaF77OzaKZoiFxZIG8DY3l19/W6K0STXSMs=;
        b=T38wCNztNY1damsxF4xYVvwEMiVwlfaCn3y8ThVR6jdYpQ6bXCbc4DWuk87ZCa6UZq
         KMtCGrYpCpJ56UVfF1msIZ5jD24OLYQIlkKWI8PmgwENIsOSRBOF4+PUtWPp0Vj2MLIK
         XOkYg5fXhbVA2EwoGEopeTPHlqm3Ia3XaYbqATzPq0DGo4FbYvm0Sz25qXMbw/s28BYN
         8sZiQRjiarqbW8RCgQVRo46s4CFPH3ceAU1Zl4PR3DqSWS7R64MG8Hb4IMs5LR7FAA4F
         yUMrMiM17j7Dyh1aZEsq8ivs0OsiP0wIKllbGYMIcKCd+8nkew6pkkN+ABUXwcZe6vwI
         jSHg==
X-Gm-Message-State: AOAM5323Rdolx0OtJ12qpfdj+nGQMDX7EdHvOgGwWvLTG1fxSjCiNbbo
	5Tl6YeV1l0IU5hXjsEjGC69QiHFoCrYMorvK
X-Google-Smtp-Source: 
 ABdhPJx8v8X0Dq3AnKxrfk87KnzTGn5+p/FlOCJt4qIlWCh880lAakFq7WDifQaBqWRja6x24IBGDQ==
X-Received: by 2002:a17:902:9308:: with SMTP id
 bc8mr36436309plb.147.1643917878891;
        Thu, 03 Feb 2022 11:51:18 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s4sm27762216pgg.80.2022.02.03.11.51.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 11:51:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/20] util-linux: Fix for CVE-2021-3995 and
 CVE-2021-3996
Date: Thu,  3 Feb 2022 09:50:32 -1000
Message-Id: 
 <05ddf5579488f42d5d90326e3dc67a1152578324.1643917717.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1643917717.git.steve@sakoman.com>
References: <cover.1643917717.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 19:51:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161303

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Add patches to fix CVE-2021-3995 and CVE-2021-3996
Also, add support include-strutils-cleanup-strto-functions.patch to
solve compilation error where `ul_strtou64` function not found which is
used in CVE-2021-3995.patch

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../util-linux/util-linux/CVE-2021-3995.patch | 139 +++++++++
 .../util-linux/util-linux/CVE-2021-3996.patch | 226 +++++++++++++++
 ...ude-strutils-cleanup-strto-functions.patch | 270 ++++++++++++++++++
 .../util-linux/util-linux_2.35.1.bb           |   3 +
 4 files changed, 638 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2021-3995.p=
atch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2021-3996.p=
atch
 create mode 100644 meta/recipes-core/util-linux/util-linux/include-strutil=
s-cleanup-strto-functions.patch

diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2021-3995.patch b/=
meta/recipes-core/util-linux/util-linux/CVE-2021-3995.patch
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
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit=
/f3db9bd609494099f0c1b95231c5dfe383346929]
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
+@@ -91,8 +91,8 @@ static inline char *mem2strcpy(char *dest, const void *s=
rc, size_t n, size_t nma
+ 	if (n + 1 > nmax)
+ 		n =3D nmax - 1;
+=20
++	memset(dest, '\0', nmax);
+ 	memcpy(dest, src, n);
+-	dest[nmax-1] =3D '\0';
+ 	return dest;
+ }
+=20
+diff --git a/libmount/src/context_umount.c b/libmount/src/context_umount.c
+index 173637a15a..8773c65ffa 100644
+--- a/libmount/src/context_umount.c
++++ b/libmount/src/context_umount.c
+@@ -393,10 +393,7 @@ static int is_fuse_usermount(struct libmnt_context *c=
xt, int *errsv)
+ 	struct libmnt_ns *ns_old;
+ 	const char *type =3D mnt_fs_get_fstype(cxt->fs);
+ 	const char *optstr;
+-	char *user_id =3D NULL;
+-	size_t sz;
+-	uid_t uid;
+-	char uidstr[sizeof(stringify_value(ULONG_MAX))];
++	uid_t uid, entry_uid;
+=20
+ 	*errsv =3D 0;
+=20
+@@ -413,11 +410,7 @@ static int is_fuse_usermount(struct libmnt_context *c=
xt, int *errsv)
+ 	optstr =3D mnt_fs_get_fs_options(cxt->fs);
+ 	if (!optstr)
+ 		return 0;
+-
+-	if (mnt_optstr_get_option(optstr, "user_id", &user_id, &sz) !=3D 0)
+-		return 0;
+-
+-	if (sz =3D=3D 0 || user_id =3D=3D NULL)
++	if (mnt_optstr_get_uid(optstr, "user_id", &entry_uid) !=3D 0)
+ 		return 0;
+=20
+ 	/* get current user */
+@@ -434,8 +427,7 @@ static int is_fuse_usermount(struct libmnt_context *cx=
t, int *errsv)
+ 		return 0;
+ 	}
+=20
+-	snprintf(uidstr, sizeof(uidstr), "%lu", (unsigned long) uid);
+-	return strncmp(user_id, uidstr, sz) =3D=3D 0;
++	return uid =3D=3D entry_uid;
+ }
+=20
+ /*
+diff --git a/libmount/src/mountP.h b/libmount/src/mountP.h
+index d43a835418..22442ec55e 100644
+--- a/libmount/src/mountP.h
++++ b/libmount/src/mountP.h
+@@ -400,6 +400,7 @@ extern const struct libmnt_optmap *mnt_optmap_get_entr=
y(
+ 			     const struct libmnt_optmap **mapent);
+=20
+ /* optstr.c */
++extern int mnt_optstr_get_uid(const char *optstr, const char *name, uid_t=
 *uid);
+ extern int mnt_optstr_remove_option_at(char **optstr, char *begin, char *=
end);
+ extern int mnt_optstr_fix_gid(char **optstr, char *value, size_t valsz, c=
har **next);
+ extern int mnt_optstr_fix_uid(char **optstr, char *value, size_t valsz, c=
har **next);
+diff --git a/libmount/src/optstr.c b/libmount/src/optstr.c
+index 921b9318e7..16800f571c 100644
+--- a/libmount/src/optstr.c
++++ b/libmount/src/optstr.c
+@@ -1090,6 +1090,48 @@ int mnt_optstr_fix_user(char **optstr)
+ 	return rc;
+ }
+=20
++/*
++ * Converts value from @optstr addressed by @name to uid.
++ *
++ * Returns: 0 on success, 1 if not found, <0 on error
++ */
++int mnt_optstr_get_uid(const char *optstr, const char *name, uid_t *uid)
++{
++	char *value =3D NULL;
++	size_t valsz =3D 0;
++	char buf[sizeof(stringify_value(UINT64_MAX))];
++	int rc;
++	uint64_t num;
++
++	assert(optstr);
++	assert(name);
++	assert(uid);
++
++	rc =3D mnt_optstr_get_option(optstr, name, &value, &valsz);
++	if (rc !=3D 0)
++		goto fail;
++
++	if (valsz > sizeof(buf) - 1) {
++		rc =3D -ERANGE;
++		goto fail;
++	}
++	mem2strcpy(buf, value, valsz, sizeof(buf));
++
++	rc =3D ul_strtou64(buf, &num, 10);
++	if (rc !=3D 0)
++		goto fail;
++	if (num > ULONG_MAX || (uid_t) num !=3D num) {
++		rc =3D -ERANGE;
++		goto fail;
++	}
++	*uid =3D (uid_t) num;
++
++	return 0;
++fail:
++	DBG(UTILS, ul_debug("failed to convert '%s'=3D to number [rc=3D%d]", nam=
e, rc));
++	return rc;
++}
++
+ /**
+  * mnt_match_options:
+  * @optstr: options string
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2021-3996.patch b/=
meta/recipes-core/util-linux/util-linux/CVE-2021-3996.patch
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
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit=
/018a10907fa9885093f6d87401556932c2d8bd2b]
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
+@@ -225,11 +225,6 @@ static int mnt_parse_mountinfo_line(struct libmnt_fs =
*fs, const char *s)
+ 		goto fail;
+ 	}
+=20
+-	/* remove "\040(deleted)" suffix */
+-	p =3D (char *) endswith(fs->target, PATH_DELETED_SUFFIX);
+-	if (p && *p)
+-		*p =3D '\0';
+-
+ 	s =3D skip_separator(s);
+=20
+ 	/* (6) vfs options (fs-independent) */
+diff --git a/tests/expected/findmnt/filter-options b/tests/expected/findmn=
t/filter-options
+index 2606bce76b..97b0ead0ad 100644
+--- a/tests/expected/findmnt/filter-options
++++ b/tests/expected/findmnt/filter-options
+@@ -28,5 +28,4 @@ TARGET                       SOURCE           FSTYPE    =
            OPTIONS
+ /home/kzak/.gvfs             gvfs-fuse-daemon fuse.gvfs-fuse-daemon rw,no=
suid,nodev,relatime,user_id=3D500,group_id=3D500
+ /var/lib/nfs/rpc_pipefs      sunrpc           rpc_pipefs            rw,re=
latime
+ /mnt/sounds                  //foo.home/bar/  cifs                  rw,re=
latime,unc=3D\\foo.home\bar,username=3Dkzak,domain=3DSRGROUP,uid=3D0,noforc=
euid,gid=3D0,noforcegid,addr=3D192.168.111.1,posixpaths,serverino,acl,rsize=
=3D16384,wsize=3D57344
+-/mnt/foo                     /fooooo          bar                   rw,re=
latime
+ rc=3D0
+diff --git a/tests/expected/findmnt/filter-options-nameval-neg b/tests/exp=
ected/findmnt/filter-options-nameval-neg
+index 5471d65af1..f0467ef755 100644
+--- a/tests/expected/findmnt/filter-options-nameval-neg
++++ b/tests/expected/findmnt/filter-options-nameval-neg
+@@ -29,6 +29,5 @@ TARGET                         SOURCE                FST=
YPE                OPTIO
+ |-/home/kzak                   /dev/mapper/kzak-home ext4                =
  rw,noatime,barrier=3D1,data=3Dordered
+ | `-/home/kzak/.gvfs           gvfs-fuse-daemon      fuse.gvfs-fuse-daemo=
n rw,nosuid,nodev,relatime,user_id=3D500,group_id=3D500
+ |-/var/lib/nfs/rpc_pipefs      sunrpc                rpc_pipefs          =
  rw,relatime
+-|-/mnt/sounds                  //foo.home/bar/       cifs                =
  rw,relatime,unc=3D\\foo.home\bar,username=3Dkzak,domain=3DSRGROUP,uid=3D0=
,noforceuid,gid=3D0,noforcegid,addr=3D192.168.111.1,posixpaths,serverino,ac=
l,rsize=3D16384,wsize=3D57344
+-`-/mnt/foo                     /fooooo               bar                 =
  rw,relatime
++`-/mnt/sounds                  //foo.home/bar/       cifs                =
  rw,relatime,unc=3D\\foo.home\bar,username=3Dkzak,domain=3DSRGROUP,uid=3D0=
,noforceuid,gid=3D0,noforcegid,addr=3D192.168.111.1,posixpaths,serverino,ac=
l,rsize=3D16384,wsize=3D57344
+ rc=3D0
+diff --git a/tests/expected/findmnt/filter-types-neg b/tests/expected/find=
mnt/filter-types-neg
+index 2606bce76b..97b0ead0ad 100644
+--- a/tests/expected/findmnt/filter-types-neg
++++ b/tests/expected/findmnt/filter-types-neg
+@@ -28,5 +28,4 @@ TARGET                       SOURCE           FSTYPE    =
            OPTIONS
+ /home/kzak/.gvfs             gvfs-fuse-daemon fuse.gvfs-fuse-daemon rw,no=
suid,nodev,relatime,user_id=3D500,group_id=3D500
+ /var/lib/nfs/rpc_pipefs      sunrpc           rpc_pipefs            rw,re=
latime
+ /mnt/sounds                  //foo.home/bar/  cifs                  rw,re=
latime,unc=3D\\foo.home\bar,username=3Dkzak,domain=3DSRGROUP,uid=3D0,noforc=
euid,gid=3D0,noforcegid,addr=3D192.168.111.1,posixpaths,serverino,acl,rsize=
=3D16384,wsize=3D57344
+-/mnt/foo                     /fooooo          bar                   rw,re=
latime
+ rc=3D0
+diff --git a/tests/expected/findmnt/outputs-default b/tests/expected/findm=
nt/outputs-default
+index 59495797bd..01599355ec 100644
+--- a/tests/expected/findmnt/outputs-default
++++ b/tests/expected/findmnt/outputs-default
+@@ -30,6 +30,5 @@ TARGET                         SOURCE                FST=
YPE                OPTIO
+ |-/home/kzak                   /dev/mapper/kzak-home ext4                =
  rw,noatime,barrier=3D1,data=3Dordered
+ | `-/home/kzak/.gvfs           gvfs-fuse-daemon      fuse.gvfs-fuse-daemo=
n rw,nosuid,nodev,relatime,user_id=3D500,group_id=3D500
+ |-/var/lib/nfs/rpc_pipefs      sunrpc                rpc_pipefs          =
  rw,relatime
+-|-/mnt/sounds                  //foo.home/bar/       cifs                =
  rw,relatime,unc=3D\\foo.home\bar,username=3Dkzak,domain=3DSRGROUP,uid=3D0=
,noforceuid,gid=3D0,noforcegid,addr=3D192.168.111.1,posixpaths,serverino,ac=
l,rsize=3D16384,wsize=3D57344
+-`-/mnt/foo                     /fooooo               bar                 =
  rw,relatime
++`-/mnt/sounds                  //foo.home/bar/       cifs                =
  rw,relatime,unc=3D\\foo.home\bar,username=3Dkzak,domain=3DSRGROUP,uid=3D0=
,noforceuid,gid=3D0,noforcegid,addr=3D192.168.111.1,posixpaths,serverino,ac=
l,rsize=3D16384,wsize=3D57344
+ rc=3D0
+diff --git a/tests/expected/findmnt/outputs-force-tree b/tests/expected/fi=
ndmnt/outputs-force-tree
+index 59495797bd..01599355ec 100644
+--- a/tests/expected/findmnt/outputs-force-tree
++++ b/tests/expected/findmnt/outputs-force-tree
+@@ -30,6 +30,5 @@ TARGET                         SOURCE                FST=
YPE                OPTIO
+ |-/home/kzak                   /dev/mapper/kzak-home ext4                =
  rw,noatime,barrier=3D1,data=3Dordered
+ | `-/home/kzak/.gvfs           gvfs-fuse-daemon      fuse.gvfs-fuse-daemo=
n rw,nosuid,nodev,relatime,user_id=3D500,group_id=3D500
+ |-/var/lib/nfs/rpc_pipefs      sunrpc                rpc_pipefs          =
  rw,relatime
+-|-/mnt/sounds                  //foo.home/bar/       cifs                =
  rw,relatime,unc=3D\\foo.home\bar,username=3Dkzak,domain=3DSRGROUP,uid=3D0=
,noforceuid,gid=3D0,noforcegid,addr=3D192.168.111.1,posixpaths,serverino,ac=
l,rsize=3D16384,wsize=3D57344
+-`-/mnt/foo                     /fooooo               bar                 =
  rw,relatime
++`-/mnt/sounds                  //foo.home/bar/       cifs                =
  rw,relatime,unc=3D\\foo.home\bar,username=3Dkzak,domain=3DSRGROUP,uid=3D0=
,noforceuid,gid=3D0,noforcegid,addr=3D192.168.111.1,posixpaths,serverino,ac=
l,rsize=3D16384,wsize=3D57344
+ rc=3D0
+diff --git a/tests/expected/findmnt/outputs-kernel b/tests/expected/findmn=
t/outputs-kernel
+index 59495797bd..01599355ec 100644
+--- a/tests/expected/findmnt/outputs-kernel
++++ b/tests/expected/findmnt/outputs-kernel
+@@ -30,6 +30,5 @@ TARGET                         SOURCE                FST=
YPE                OPTIO
+ |-/home/kzak                   /dev/mapper/kzak-home ext4                =
  rw,noatime,barrier=3D1,data=3Dordered
+ | `-/home/kzak/.gvfs           gvfs-fuse-daemon      fuse.gvfs-fuse-daemo=
n rw,nosuid,nodev,relatime,user_id=3D500,group_id=3D500
+ |-/var/lib/nfs/rpc_pipefs      sunrpc                rpc_pipefs          =
  rw,relatime
+-|-/mnt/sounds                  //foo.home/bar/       cifs                =
  rw,relatime,unc=3D\\foo.home\bar,username=3Dkzak,domain=3DSRGROUP,uid=3D0=
,noforceuid,gid=3D0,noforcegid,addr=3D192.168.111.1,posixpaths,serverino,ac=
l,rsize=3D16384,wsize=3D57344
+-`-/mnt/foo                     /fooooo               bar                 =
  rw,relatime
++`-/mnt/sounds                  //foo.home/bar/       cifs                =
  rw,relatime,unc=3D\\foo.home\bar,username=3Dkzak,domain=3DSRGROUP,uid=3D0=
,noforceuid,gid=3D0,noforcegid,addr=3D192.168.111.1,posixpaths,serverino,ac=
l,rsize=3D16384,wsize=3D57344
+ rc=3D0
+diff --git a/tests/expected/libmount/tabdiff-mount b/tests/expected/libmou=
nt/tabdiff-mount
+index 420aeacd5e..3c18f8dc4f 100644
+--- a/tests/expected/libmount/tabdiff-mount
++++ b/tests/expected/libmount/tabdiff-mount
+@@ -1,3 +1,2 @@
+ /dev/mapper/kzak-home on /home/kzak: MOUNTED
+-/fooooo on /mnt/foo: MOUNTED
+ tmpfs on /mnt/test/foo=0Dbar: MOUNTED
+diff --git a/tests/expected/libmount/tabdiff-move b/tests/expected/libmoun=
t/tabdiff-move
+index 24f9bc791b..95820d93ef 100644
+--- a/tests/expected/libmount/tabdiff-move
++++ b/tests/expected/libmount/tabdiff-move
+@@ -1,3 +1,2 @@
+ //foo.home/bar/ on /mnt/music: MOVED to /mnt/music
+-/fooooo on /mnt/foo: UMOUNTED
+ tmpfs on /mnt/test/foo=0Dbar: UMOUNTED
+diff --git a/tests/expected/libmount/tabdiff-remount b/tests/expected/libm=
ount/tabdiff-remount
+index 82ebeab390..876bfd9539 100644
+--- a/tests/expected/libmount/tabdiff-remount
++++ b/tests/expected/libmount/tabdiff-remount
+@@ -1,4 +1,3 @@
+ /dev/mapper/kzak-home on /home/kzak: REMOUNTED from 'rw,noatime,barrier=
=3D1,data=3Dordered' to 'ro,noatime,barrier=3D1,data=3Dordered'
+ //foo.home/bar/ on /mnt/sounds: REMOUNTED from 'rw,relatime,unc=3D\\foo.h=
ome\bar,username=3Dkzak,domain=3DSRGROUP,uid=3D0,noforceuid,gid=3D0,noforce=
gid,addr=3D192.168.111.1,posixpaths,serverino,acl,rsize=3D16384,wsize=3D573=
44' to 'ro,relatime,unc=3D\\foo.home\bar,username=3Dkzak,domain=3DSRGROUP,u=
id=3D0,noforceuid,gid=3D0,noforcegid,addr=3D192.168.111.1,posixpaths,server=
ino,acl,rsize=3D16384,wsize=3D57344'
+-/fooooo on /mnt/foo: UMOUNTED
+ tmpfs on /mnt/test/foo=0Dbar: UMOUNTED
+diff --git a/tests/expected/libmount/tabdiff-umount b/tests/expected/libmo=
unt/tabdiff-umount
+index a3e0fe48a1..c7be725b92 100644
+--- a/tests/expected/libmount/tabdiff-umount
++++ b/tests/expected/libmount/tabdiff-umount
+@@ -1,3 +1,2 @@
+ /dev/mapper/kzak-home on /home/kzak: UMOUNTED
+-/fooooo on /mnt/foo: UMOUNTED
+ tmpfs on /mnt/test/foo=0Dbar: UMOUNTED
+diff --git a/tests/expected/libmount/tabfiles-parse-mountinfo b/tests/expe=
cted/libmount/tabfiles-parse-mountinfo
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
+ target: /mnt/test/foo=0Dbar
+ fstype: tmpfs
+diff --git a/tests/expected/libmount/tabfiles-py-parse-mountinfo b/tests/e=
xpected/libmount/tabfiles-py-parse-mountinfo
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
+ target: /mnt/test/foo=0Dbar
+ fstype: tmpfs
+diff --git a/tests/ts/findmnt/files/mountinfo b/tests/ts/findmnt/files/mou=
ntinfo
+index 475ea1a337..ff1e664a84 100644
+--- a/tests/ts/findmnt/files/mountinfo
++++ b/tests/ts/findmnt/files/mountinfo
+@@ -30,4 +30,3 @@
+ 44 41 0:36 / /home/kzak/.gvfs rw,nosuid,nodev,relatime - fuse.gvfs-fuse-d=
aemon gvfs-fuse-daemon rw,user_id=3D500,group_id=3D500
+ 45 20 0:37 / /var/lib/nfs/rpc_pipefs rw,relatime - rpc_pipefs sunrpc rw
+ 47 20 0:38 / /mnt/sounds rw,relatime - cifs //foo.home/bar/ rw,unc=3D\\fo=
o.home\bar,username=3Dkzak,domain=3DSRGROUP,uid=3D0,noforceuid,gid=3D0,nofo=
rcegid,addr=3D192.168.111.1,posixpaths,serverino,acl,rsize=3D16384,wsize=3D=
57344
+-48 20 0:39 / /mnt/foo\040(deleted) rw,relatime - bar /fooooo rw
+diff --git a/tests/ts/findmnt/files/mountinfo-nonroot b/tests/ts/findmnt/f=
iles/mountinfo-nonroot
+index e15b467016..87b421d2ef 100644
+--- a/tests/ts/findmnt/files/mountinfo-nonroot
++++ b/tests/ts/findmnt/files/mountinfo-nonroot
+@@ -29,4 +29,3 @@
+ 44 41 0:36 / /home/kzak/.gvfs rw,nosuid,nodev,relatime - fuse.gvfs-fuse-d=
aemon gvfs-fuse-daemon rw,user_id=3D500,group_id=3D500
+ 45 20 0:37 / /var/lib/nfs/rpc_pipefs rw,relatime - rpc_pipefs sunrpc rw
+ 47 20 0:38 / /mnt/sounds rw,relatime - cifs //foo.home/bar/ rw,unc=3D\\fo=
o.home\bar,username=3Dkzak,domain=3DSRGROUP,uid=3D0,noforceuid,gid=3D0,nofo=
rcegid,addr=3D192.168.111.1,posixpaths,serverino,acl,rsize=3D16384,wsize=3D=
57344
+-48 20 0:39 / /mnt/foo\040(deleted) rw,relatime - bar /fooooo rw
+diff --git a/tests/ts/libmount/files/mountinfo b/tests/ts/libmount/files/m=
ountinfo
+index c063071833..2b01740481 100644
+--- a/tests/ts/libmount/files/mountinfo
++++ b/tests/ts/libmount/files/mountinfo
+@@ -30,5 +30,4 @@
+ 44 41 0:36 / /home/kzak/.gvfs rw,nosuid,nodev,relatime - fuse.gvfs-fuse-d=
aemon gvfs-fuse-daemon rw,user_id=3D500,group_id=3D500
+ 45 20 0:37 / /var/lib/nfs/rpc_pipefs rw,relatime - rpc_pipefs sunrpc rw
+ 47 20 0:38 / /mnt/sounds rw,relatime - cifs //foo.home/bar/ rw,unc=3D\\fo=
o.home\bar,username=3Dkzak,domain=3DSRGROUP,uid=3D0,noforceuid,gid=3D0,nofo=
rcegid,addr=3D192.168.111.1,posixpaths,serverino,acl,rsize=3D16384,wsize=3D=
57344
+-48 20 0:39 / /mnt/foo\040(deleted) rw,relatime - bar /fooooo rw
+ 49 20 0:56 / /mnt/test/foo=0Dbar rw,relatime shared:323 - tmpfs tmpfs rw
diff --git a/meta/recipes-core/util-linux/util-linux/include-strutils-clean=
up-strto-functions.patch b/meta/recipes-core/util-linux/util-linux/include-=
strutils-cleanup-strto-functions.patch
new file mode 100644
index 0000000000..5d5a370821
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/include-strutils-cleanup-strt=
o-functions.patch
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
+Upstream-Backport: [https://github.com/util-linux/util-linux/commit/84825b=
161ba5d18da4142893b9789b3fc71284d9]
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
+@@ -19,6 +19,9 @@ extern int parse_size(const char *str, uintmax_t *res, i=
nt *power);
+ extern int strtosize(const char *str, uintmax_t *res);
+ extern uintmax_t strtosize_or_err(const char *str, const char *errmesg);
+=20
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
+=20
+-static uint32_t _strtou32_or_err(const char *str, const char *errmesg, in=
t base);
+-static uint64_t _strtou64_or_err(const char *str, const char *errmesg, in=
t base);
++/*
++ * convert strings to numbers; returns <0 on error, and 0 on success
++ */
++int ul_strtos64(const char *str, int64_t *num, int base)
++{
++	char *end =3D NULL;
+=20
+-int16_t strtos16_or_err(const char *str, const char *errmesg)
++	errno =3D 0;
++	if (str =3D=3D NULL || *str =3D=3D '\0')
++		return -EINVAL;
++	*num =3D (int64_t) strtoimax(str, &end, base);
++
++	if (errno || str =3D=3D end || (end && *end))
++		return -EINVAL;
++	return 0;
++}
++
++int ul_strtou64(const char *str, uint64_t *num, int base)
+ {
+-	int32_t num =3D strtos32_or_err(str, errmesg);
++	char *end =3D NULL;
+=20
+-	if (num < INT16_MIN || num > INT16_MAX) {
+-		errno =3D ERANGE;
+-		err(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
+-	}
+-	return num;
++	errno =3D 0;
++	if (str =3D=3D NULL || *str =3D=3D '\0')
++		return -EINVAL;
++	*num =3D (uint64_t) strtoumax(str, &end, base);
++
++	if (errno || str =3D=3D end || (end && *end))
++		return -EINVAL;
++	return 0;
+ }
+=20
+-static uint16_t _strtou16_or_err(const char *str, const char *errmesg, in=
t base)
++/*
++ * Covert strings to numbers and print message on error.
++ *
++ * Note that hex functions (strtox..()) returns unsigned numbers, if you =
need
++ * something else then use ul_strtos64(s, &n, 16).
++ */
++int64_t strtos64_or_err(const char *str, const char *errmesg)
+ {
+-	uint32_t num =3D _strtou32_or_err(str, errmesg, base);
++	int64_t num =3D 0;
+=20
+-	if (num > UINT16_MAX) {
+-		errno =3D ERANGE;
+-		err(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
++	if (ul_strtos64(str, &num, 10) !=3D 0) {
++		if (errno =3D=3D ERANGE)
++			err(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
++
++		errx(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
+ 	}
+ 	return num;
+ }
+=20
+-uint16_t strtou16_or_err(const char *str, const char *errmesg)
++uint64_t strtou64_or_err(const char *str, const char *errmesg)
+ {
+-	return _strtou16_or_err(str, errmesg, 10);
++	uint64_t num =3D 0;
++
++	if (ul_strtou64(str, &num, 10)) {
++		if (errno =3D=3D ERANGE)
++			err(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
++
++		errx(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
++	}
++	return num;
+ }
+=20
+-uint16_t strtox16_or_err(const char *str, const char *errmesg)
++uint64_t strtox64_or_err(const char *str, const char *errmesg)
+ {
+-	return _strtou16_or_err(str, errmesg, 16);
++	uint64_t num =3D 0;
++
++	if (ul_strtou64(str, &num, 16)) {
++		if (errno =3D=3D ERANGE)
++			err(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
++
++		errx(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
++	}
++	return num;
+ }
+=20
+ int32_t strtos32_or_err(const char *str, const char *errmesg)
+@@ -365,9 +406,9 @@ int32_t strtos32_or_err(const char *str, const char *e=
rrmesg)
+ 	return num;
+ }
+=20
+-static uint32_t _strtou32_or_err(const char *str, const char *errmesg, in=
t base)
++uint32_t strtou32_or_err(const char *str, const char *errmesg)
+ {
+-	uint64_t num =3D _strtou64_or_err(str, errmesg, base);
++	uint64_t num =3D strtou64_or_err(str, errmesg);
+=20
+ 	if (num > UINT32_MAX) {
+ 		errno =3D ERANGE;
+@@ -376,66 +417,48 @@ static uint32_t _strtou32_or_err(const char *str, co=
nst char *errmesg, int base)
+ 	return num;
+ }
+=20
+-uint32_t strtou32_or_err(const char *str, const char *errmesg)
+-{
+-	return _strtou32_or_err(str, errmesg, 10);
+-}
+-
+ uint32_t strtox32_or_err(const char *str, const char *errmesg)
+ {
+-	return _strtou32_or_err(str, errmesg, 16);
++	uint64_t num =3D strtox64_or_err(str, errmesg);
++
++	if (num > UINT32_MAX) {
++		errno =3D ERANGE;
++		err(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
++	}
++	return num;
+ }
+=20
+-int64_t strtos64_or_err(const char *str, const char *errmesg)
++int16_t strtos16_or_err(const char *str, const char *errmesg)
+ {
+-	int64_t num;
+-	char *end =3D NULL;
+-
+-	errno =3D 0;
+-	if (str =3D=3D NULL || *str =3D=3D '\0')
+-		goto err;
+-	num =3D strtoimax(str, &end, 10);
+-
+-	if (errno || str =3D=3D end || (end && *end))
+-		goto err;
++	int64_t num =3D strtos64_or_err(str, errmesg);
+=20
+-	return num;
+-err:
+-	if (errno =3D=3D ERANGE)
++	if (num < INT16_MIN || num > INT16_MAX) {
++		errno =3D ERANGE;
+ 		err(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
+-
+-	errx(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
++	}
++	return num;
+ }
+=20
+-static uint64_t _strtou64_or_err(const char *str, const char *errmesg, in=
t base)
++uint16_t strtou16_or_err(const char *str, const char *errmesg)
+ {
+-	uintmax_t num;
+-	char *end =3D NULL;
+-
+-	errno =3D 0;
+-	if (str =3D=3D NULL || *str =3D=3D '\0')
+-		goto err;
+-	num =3D strtoumax(str, &end, base);
+-
+-	if (errno || str =3D=3D end || (end && *end))
+-		goto err;
++	uint64_t num =3D strtou64_or_err(str, errmesg);
+=20
+-	return num;
+-err:
+-	if (errno =3D=3D ERANGE)
++	if (num > UINT16_MAX) {
++		errno =3D ERANGE;
+ 		err(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
+-
+-	errx(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
++	}
++	return num;
+ }
+=20
+-uint64_t strtou64_or_err(const char *str, const char *errmesg)
++uint16_t strtox16_or_err(const char *str, const char *errmesg)
+ {
+-	return _strtou64_or_err(str, errmesg, 10);
+-}
++	uint64_t num =3D strtox64_or_err(str, errmesg);
+=20
+-uint64_t strtox64_or_err(const char *str, const char *errmesg)
+-{
+-	return _strtou64_or_err(str, errmesg, 16);
++	if (num > UINT16_MAX) {
++		errno =3D ERANGE;
++		err(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
++	}
++	return num;
+ }
+=20
+ double strtod_or_err(const char *str, const char *errmesg)
+@@ -1051,15 +1051,25 @@ static int test_strutils_cmp_paths(int a
+=20
+ int main(int argc, char *argv[])
+ {
+-	if (argc =3D=3D 3 && strcmp(argv[1], "--size") =3D=3D 0)
++	if (argc =3D=3D 3 && strcmp(argv[1], "--size") =3D=3D 0) {
+ 		return test_strutils_sizes(argc - 1, argv + 1);
+=20
+-	else if (argc =3D=3D 4 && strcmp(argv[1], "--cmp-paths") =3D=3D 0)
++	} else if (argc =3D=3D 4 && strcmp(argv[1], "--cmp-paths") =3D=3D 0) {
+ 		return test_strutils_cmp_paths(argc - 1, argv + 1);
+=20
++	} else if (argc =3D=3D 3 && strcmp(argv[1], "--str2num") =3D=3D 0) {
++        	uint64_t n;
++
++        	if (ul_strtou64(argv[2], &n, 10) =3D=3D 0) {
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
diff --git a/meta/recipes-core/util-linux/util-linux_2.35.1.bb b/meta/recip=
es-core/util-linux/util-linux_2.35.1.bb
index 731f0618eb..96d5eca518 100644
--- a/meta/recipes-core/util-linux/util-linux_2.35.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.35.1.bb
@@ -12,6 +12,9 @@ SRC_URI +=3D "file://configure-sbindir.patch \
             file://0001-kill-include-sys-types.h-before-checking-SYS_pidfd=
_s.patch \
             file://0001-include-cleanup-pidfd-inckudes.patch \
             file://CVE-2021-37600.patch \
+            file://include-strutils-cleanup-strto-functions.patch \
+            file://CVE-2021-3995.patch \
+            file://CVE-2021-3996.patch \
 "
 SRC_URI[md5sum] =3D "7f64882f631225f0295ca05080cee1bf"
 SRC_URI[sha256sum] =3D "d9de3edd287366cd908e77677514b9387b22bc7b88f45b83e1=
922c3597f1d7f9"
--=20
2.25.1


