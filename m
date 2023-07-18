Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06CFBC001DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 14:27:00 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.9121.1689690419593389201
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 07:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=unLTRJUk;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-666eb03457cso3655417b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 07:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689690419; x=1692282419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EYIxFsef8UGbyoxegMcmdB5VWoMEPTM/VKYGQlnVNUA=;
        b=unLTRJUky8XnC6W55a+73Yj2TBQeEApHW0oUEGLTI76wJ//ujkS2zTdkDBt/iYshE8
         6s1Vvel2c8Yj9FenE8nVA2wptMnekAOWhUjF8JKrU9fi/tB6Ix6SPRce0AsvGyWzT2oA
         LjiyjC1FqlEoLgKnAMLEkvl4NQupaXDdVWSO7RPiexjfY47mOOMLD3kThyO+tPLwFgsJ
         DHvhcmcQoNvV3OL7cOacZrbBQPKMF1AqLgcN7Bc7H2fyOJa6Zns6toT+GO1LrKb0KJjk
         scDPL928LgX5KPeVo/+jMTxCeqkCUO0m/1eCW7L5MY6MovQdmuGtqUjmgIYIFYgX3VRR
         PFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689690419; x=1692282419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EYIxFsef8UGbyoxegMcmdB5VWoMEPTM/VKYGQlnVNUA=;
        b=X6hjBJQXYndTleMw8/WOORmHD0+gIf3sKhKLsbBYGgIT56Jo2JcqfR2Nb0b1Dj9Kkb
         e93guoBGZAl2+Q5Dl6c5rDPYHN+QgUanvZqLMZkfW6l3H13n2tYRi94+Ajv7q7eIWmJg
         kfhvKgWufZgpKYeUe6VZQO0tQZ7SBtQKBImNybH88W2pWsN0KK6UCZeHowsw/CWDdUhq
         Aicfica+JobwVOUrHSNos8Q/d7ay8lS4WjVrkMQsiqkoW2NGTQQ+vPldQsTo5j8tw/8u
         6ABE3zia70p4Rr8B7Id1nYXMpjzG26Gj/2ZOMIuUZOKarfyMQkPRmEAzqcmqzmNH1hDb
         0zGw==
X-Gm-Message-State: ABy/qLaAX3dhCr2hbVXxU9thLckChWXtfTT2xhdj9MHR6UlWOCevLf3E
	+G6qagik73ugBralUMeAcyjCQv/ntLblzEBGD20=
X-Google-Smtp-Source: APBJJlGJsr1jEoDjQOf4eS9sDdykcu0fio5SAREReIdU2s7F3CF2yqIvUOJZ5H3xUoBNEhowPNqDcw==
X-Received: by 2002:a05:6a00:2488:b0:673:5d1e:6657 with SMTP id c8-20020a056a00248800b006735d1e6657mr18441357pfv.7.1689690418394;
        Tue, 18 Jul 2023 07:26:58 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020aa78d18000000b006732786b5f1sm1581732pfe.213.2023.07.18.07.26.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 07:26:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/27] systemd: Backport nspawn: make sure host root can write to the uidmapped mounts we prepare for the container payload
Date: Tue, 18 Jul 2023 04:25:52 -1000
Message-Id: <6d190eb0caadcb95c5325ede32164a645abb61f3.1689689618.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689689618.git.steve@sakoman.com>
References: <cover.1689689618.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 14:27:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184522

From: Marek Vasut <marex@denx.de>

Backport fix for systemd nspawn uidmap handling from systemd v253 .
Without this, attempt to start mkosi generated debian stable 12
container would ultimately fail (per "$ strace -ff") with:
"
symlinkat("usr/lib/aarch64-linux-gnu", 8, "lib64") = -1 EOVERFLOW (Value too large for defined data type)
"

Command to generate test container:
"
mkosi --distribution debian --release stable --architecture arm64 \
      --cache-dir /home/oe/cache/ --format tar --compress-output xz \
      --output-dir /home/oe/output/ --checksum 1 --root-password root \
      --package systemd --package udev --package dbus
"

Command to import test container and start it, which triggers the failure:
"
$ machinectl pull-tar http://192.168.1.300/image.tar.xz default
$ machinectl read-only default false
$ rm -f /var/lib/machines/default/etc/machine-id
$ dbus-uuidgen --ensure=/var/lib/machines/default/etc/machine-id
$ machinectl start default
"

Minimal command to trigger the failure once container is imported:
"
$ strace -ff systemd-nspawn --keep-unit --boot --link-journal=try-guest --network-veth -U --settings=override --machine=default
"

Extracted from systemd MR:
https://github.com/systemd/systemd/pull/22774

Further explanation by Christian Brauner at second half of:
https://github.com/systemd/systemd/issues/20989

Signed-off-by: Marek Vasut <marex@denx.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-host-root-can-write-to-the-uidmappe.patch | 216 ++++++++++++++++++
 meta/recipes-core/systemd/systemd_250.5.bb    |   1 +
 2 files changed, 217 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-nspawn-make-sure-host-root-can-write-to-the-uidmappe.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-nspawn-make-sure-host-root-can-write-to-the-uidmappe.patch b/meta/recipes-core/systemd/systemd/0001-nspawn-make-sure-host-root-can-write-to-the-uidmappe.patch
new file mode 100644
index 0000000000..8715019c99
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-nspawn-make-sure-host-root-can-write-to-the-uidmappe.patch
@@ -0,0 +1,216 @@
+From e34fb1a4568bd080032065bb1506ab9b6c6606f1 Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Thu, 17 Mar 2022 13:46:12 +0100
+Subject: [PATCH] nspawn: make sure host root can write to the uidmapped mounts
+ we prepare for the container payload
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When using user namespaces in conjunction with uidmapped mounts, nspawn
+so far set up two uidmappings:
+
+1. One that is used for the uidmapped mount and that maps the UID range
+   0…65535 on the backing fs to some high UID range X…X+65535 on the
+   uidmapped fs. (Let's call this mapping the "mount mapping")
+
+2. One that is used for the userns namespace the container payload
+   processes run in, that maps X…X+65535 back to 0…65535. (Let's call
+   this one the "process mapping").
+
+These mappings hence are pretty much identical, one just moves things up
+and one back down. (Reminder: we do all this so that the processes can
+run under high UIDs while running off file systems that require no
+recursive chown()ing, i.e. we want processes with high UID range but
+files with low UID range.)
+
+This creates one problem, i.e. issue #20989: if nspawn (which runs as
+host root, i.e. host UID 0) wants to add inodes to the uidmapped mount
+it can't do that, since host UID 0 is not defined in the mount mapping
+(only the X…X+65536 range is, after all, and X > 0), and processes whose
+UID is not mapped in a uidmapped fs cannot create inodes in it since
+those would be owned by an unmapped UID, which then triggers
+the famous EOVERFLOW error.
+
+Let's fix this, by explicitly including an entry for the host UID 0 in
+the mount mapping. Specifically, we'll extend the mount mapping to map
+UID 2147483646 (which is INT32_MAX-1, see code for an explanation why I
+picked this one) of the backing fs to UID 0 on the uidmapped fs. This
+way nspawn can creates inode on the uidmapped as it likes (which will
+then actually be owned by UID 2147483646 on the backing fs), and as it
+always did. Note that we do *not* create a similar entry in the process
+mapping. Thus any files created by nspawn that way (and not chown()ed to
+something better) will appear as unmapped (i.e. as overflowuid/"nobody")
+in the container payload. And that's good. Of course, the latter is
+mostly theoretic, as nspawn should generally chown() the inodes it
+creates to UID ranges that actually make sense for the container (and we
+generally already do this correctly), but it#s good to know that we are
+safe here, given we might accidentally forget to chown() some inodes we
+create.
+
+Net effect: the two mappings will not be identical anymore. The mount
+mapping has one entry more, and the only reason it exists is so that
+nspawn can access the uidmapped fs reasonably independently from any
+process mapping.
+
+Fixes: #20989
+
+Upstream-Status: Backport [50ae2966d20b0b4a19def060de3b966b7a70b54a]
+Signed-off-by: Marek Vasut <marex@denx.de>
+---
+ src/basic/user-util.h      | 13 +++++++++++++
+ src/nspawn/nspawn-mount.c  |  2 +-
+ src/nspawn/nspawn.c        |  2 +-
+ src/shared/dissect-image.c |  2 +-
+ src/shared/mount-util.c    | 28 +++++++++++++++++++++++-----
+ src/shared/mount-util.h    | 13 ++++++++++++-
+ 6 files changed, 51 insertions(+), 9 deletions(-)
+
+diff --git a/src/basic/user-util.h b/src/basic/user-util.h
+index ab1ce48b2d..0b9749ef8b 100644
+--- a/src/basic/user-util.h
++++ b/src/basic/user-util.h
+@@ -59,6 +59,19 @@ int take_etc_passwd_lock(const char *root);
+ #define UID_NOBODY ((uid_t) 65534U)
+ #define GID_NOBODY ((gid_t) 65534U)
+ 
++/* If REMOUNT_IDMAP_HOST_ROOT is set for remount_idmap() we'll include a mapping here that maps the host root
++ * user accessing the idmapped mount to the this user ID on the backing fs. This is the last valid UID in the
++ * *signed* 32bit range. You might wonder why precisely use this specific UID for this purpose? Well, we
++ * definitely cannot use the first 0…65536 UIDs for that, since in most cases that's precisely the file range
++ * we intend to map to some high UID range, and since UID mappings have to be bijective we thus cannot use
++ * them at all. Furthermore the UID range beyond INT32_MAX (i.e. the range above the signed 32bit range) is
++ * icky, since many APIs cannot use it (example: setfsuid() returns the old UID as signed integer). Following
++ * our usual logic of assigning a 16bit UID range to each container, so that the upper 16bit of a 32bit UID
++ * value indicate kind of a "container ID" and the lower 16bit map directly to the intended user you can read
++ * this specific UID as the "nobody" user of the container with ID 0x7FFF, which is kinda nice. */
++#define UID_MAPPED_ROOT ((uid_t) (INT32_MAX-1))
++#define GID_MAPPED_ROOT ((gid_t) (INT32_MAX-1))
++
+ #define ETC_PASSWD_LOCK_PATH "/etc/.pwd.lock"
+ 
+ /* The following macros add 1 when converting things, since UID 0 is a valid UID, while the pointer
+diff --git a/src/nspawn/nspawn-mount.c b/src/nspawn/nspawn-mount.c
+index 40773d90c1..f2fad0f462 100644
+--- a/src/nspawn/nspawn-mount.c
++++ b/src/nspawn/nspawn-mount.c
+@@ -780,7 +780,7 @@ static int mount_bind(const char *dest, CustomMount *m, uid_t uid_shift, uid_t u
+         }
+ 
+         if (idmapped) {
+-                r = remount_idmap(where, uid_shift, uid_range);
++                r = remount_idmap(where, uid_shift, uid_range, REMOUNT_IDMAP_HOST_ROOT);
+                 if (r < 0)
+                         return log_error_errno(r, "Failed to map ids for bind mount %s: %m", where);
+         }
+diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
+index 8f17ab8810..fe0af8e42d 100644
+--- a/src/nspawn/nspawn.c
++++ b/src/nspawn/nspawn.c
+@@ -3779,7 +3779,7 @@ static int outer_child(
+             IN_SET(arg_userns_ownership, USER_NAMESPACE_OWNERSHIP_MAP, USER_NAMESPACE_OWNERSHIP_AUTO) &&
+             arg_uid_shift != 0) {
+ 
+-                r = remount_idmap(directory, arg_uid_shift, arg_uid_range);
++                r = remount_idmap(directory, arg_uid_shift, arg_uid_range, REMOUNT_IDMAP_HOST_ROOT);
+                 if (r == -EINVAL || ERRNO_IS_NOT_SUPPORTED(r)) {
+                         /* This might fail because the kernel or file system doesn't support idmapping. We
+                          * can't really distinguish this nicely, nor do we have any guarantees about the
+diff --git a/src/shared/dissect-image.c b/src/shared/dissect-image.c
+index 39a7f4c3f2..471c165257 100644
+--- a/src/shared/dissect-image.c
++++ b/src/shared/dissect-image.c
+@@ -1807,7 +1807,7 @@ static int mount_partition(
+                 (void) fs_grow(node, p);
+ 
+         if (remap_uid_gid) {
+-                r = remount_idmap(p, uid_shift, uid_range);
++                r = remount_idmap(p, uid_shift, uid_range, REMOUNT_IDMAP_HOST_ROOT);
+                 if (r < 0)
+                         return r;
+         }
+diff --git a/src/shared/mount-util.c b/src/shared/mount-util.c
+index c75c02f5be..fb2e9a0711 100644
+--- a/src/shared/mount-util.c
++++ b/src/shared/mount-util.c
+@@ -1049,14 +1049,31 @@ int make_mount_point(const char *path) {
+         return 1;
+ }
+ 
+-static int make_userns(uid_t uid_shift, uid_t uid_range) {
+-        char line[DECIMAL_STR_MAX(uid_t)*3+3+1];
++static int make_userns(uid_t uid_shift, uid_t uid_range, RemountIdmapFlags flags) {
+         _cleanup_close_ int userns_fd = -1;
++        _cleanup_free_ char *line = NULL;
+ 
+         /* Allocates a userns file descriptor with the mapping we need. For this we'll fork off a child
+          * process whose only purpose is to give us a new user namespace. It's killed when we got it. */
+ 
+-        xsprintf(line, UID_FMT " " UID_FMT " " UID_FMT "\n", 0, uid_shift, uid_range);
++        if (asprintf(&line, UID_FMT " " UID_FMT " " UID_FMT "\n", 0, uid_shift, uid_range) < 0)
++                return log_oom_debug();
++
++        /* If requested we'll include an entry in the mapping so that the host root user can make changes to
++         * the uidmapped mount like it normally would. Specifically, we'll map the user with UID_HOST_ROOT on
++         * the backing fs to UID 0. This is useful, since nspawn code wants to create various missing inodes
++         * in the OS tree before booting into it, and this becomes very easy and straightforward to do if it
++         * can just do it under its own regular UID. Note that in that case the container's runtime uidmap
++         * (i.e. the one the container payload processes run in) will leave this UID unmapped, i.e. if we
++         * accidentally leave files owned by host root in the already uidmapped tree around they'll show up
++         * as owned by 'nobody', which is safe. (Of course, we shouldn't leave such inodes around, but always
++         * chown() them to the container's own UID range, but it's good to have a safety net, in case we
++         * forget it.) */
++        if (flags & REMOUNT_IDMAP_HOST_ROOT)
++                if (strextendf(&line,
++                               UID_FMT " " UID_FMT " " UID_FMT "\n",
++                               UID_MAPPED_ROOT, 0, 1) < 0)
++                        return log_oom_debug();
+ 
+         /* We always assign the same UID and GID ranges */
+         userns_fd = userns_acquire(line, line);
+@@ -1069,7 +1086,8 @@ static int make_userns(uid_t uid_shift, uid_t uid_range) {
+ int remount_idmap(
+                 const char *p,
+                 uid_t uid_shift,
+-                uid_t uid_range) {
++                uid_t uid_range,
++                RemountIdmapFlags flags) {
+ 
+         _cleanup_close_ int mount_fd = -1, userns_fd = -1;
+         int r;
+@@ -1085,7 +1103,7 @@ int remount_idmap(
+                 return log_debug_errno(errno, "Failed to open tree of mounted filesystem '%s': %m", p);
+ 
+         /* Create a user namespace mapping */
+-        userns_fd = make_userns(uid_shift, uid_range);
++        userns_fd = make_userns(uid_shift, uid_range, flags);
+         if (userns_fd < 0)
+                 return userns_fd;
+ 
+diff --git a/src/shared/mount-util.h b/src/shared/mount-util.h
+index ce73aebd4b..f53a64186f 100644
+--- a/src/shared/mount-util.h
++++ b/src/shared/mount-util.h
+@@ -112,7 +112,18 @@ int mount_image_in_namespace(pid_t target, const char *propagate_path, const cha
+ 
+ int make_mount_point(const char *path);
+ 
+-int remount_idmap(const char *p, uid_t uid_shift, uid_t uid_range);
++typedef enum RemountIdmapFlags {
++        /* Include a mapping from UID_MAPPED_ROOT (i.e. UID 2^31-2) on the backing fs to UID 0 on the
++         * uidmapped fs. This is useful to ensure that the host root user can safely add inodes to the
++         * uidmapped fs (which otherwise wouldn't work as the host root user is not defined on the uidmapped
++         * mount and any attempts to create inodes will then be refused with EOVERFLOW). The idea is that
++         * these inodes are quickly re-chown()ed to more suitable UIDs/GIDs. Any code that intends to be able
++         * to add inodes to file systems mapped this way should set this flag, but given it comes with
++         * certain security implications defaults to off, and requires explicit opt-in. */
++        REMOUNT_IDMAP_HOST_ROOT = 1 << 0,
++} RemountIdmapFlags;
++
++int remount_idmap(const char *p, uid_t uid_shift, uid_t uid_range, RemountIdmapFlags flags);
+ 
+ /* Creates a mount point (not parents) based on the source path or stat - ie, a file or a directory */
+ int make_mount_point_inode_from_stat(const struct stat *st, const char *dest, mode_t mode);
+-- 
+2.40.1
+
diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core/systemd/systemd_250.5.bb
index 21a09d8594..c35557471a 100644
--- a/meta/recipes-core/systemd/systemd_250.5.bb
+++ b/meta/recipes-core/systemd/systemd_250.5.bb
@@ -31,6 +31,7 @@ SRC_URI += "file://touchscreen.rules \
            file://CVE-2022-4415-1.patch \
            file://CVE-2022-4415-2.patch \
            file://0001-network-remove-only-managed-configs-on-reconfigure-o.patch \
+           file://0001-nspawn-make-sure-host-root-can-write-to-the-uidmappe.patch \
            "
 
 # patches needed by musl
-- 
2.34.1


