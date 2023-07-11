Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23868C001DC
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 16:01:08 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.65.1689091263199803987
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 09:01:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=OJ6CA1Jq;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id DD5D78606E;
	Tue, 11 Jul 2023 18:00:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1689091260;
	bh=8d6vNvE6KIubxPbwSRq+gDYQ1w9TTXSfEW2HhdKtaKs=;
	h=From:To:Cc:Subject:Date:From;
	b=OJ6CA1JqYSWTktkU0wAttKmINzXec1gCvcxTlF8ygt84Wfh0z3rWfL/ln+DCjM22c
	 ZEx2MzUy63aNq7/Rk9UQOnAgfGjc8mXUZO+vcrI6F2vaxuoqT2UpaJ7qC+lvPq7KwE
	 sWl+E8lReoG2B5BZ6IgekWtK8oZB9i18xriLTVlkqtnzyNqtZKalwjrzmAGcFefJlV
	 d1Ph3cBGcO4pBTuUzK8FmGIxNh1iNgIjnmv4pa4rxbXdfifuohG1SxFuZIsLwYkFRg
	 m4+Ds97N72xMhI+fk0CbntoqVrCS+EaIaxJJqPcG23d22c82VBzlQpfJjMfEYkSWta
	 rsQcrGNfuhA6Q==
From: Marek Vasut <marex@denx.de>
To: steve@sakoman.com,
	openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [kirkstone][PATCH] systemd: Backport nspawn: make sure host root can write to the uidmapped mounts we prepare for the container payload
Date: Tue, 11 Jul 2023 18:00:51 +0200
Message-Id: <20230711160051.14873-1-marex@denx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 16:01:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184145

Backport fix for systemd nspawn uidmap handling from systemd v253 .
Without this, attempt to start mkosi generated debian stable 12
container would ultimately fail (per "$ strace -ff") with:
"
symlinkat("usr/lib/aarch64-linux-gnu", 8, "lib64") =3D -1 EOVERFLOW (Valu=
e too large for defined data type)
"

Command to generate test container:
"
mkosi --distribution debian --release stable --architecture arm64 \
      --cache-dir /home/oe/cache/ --format tar --compress-output xz \
      --output-dir /home/oe/output/ --checksum 1 --root-password root \
      --package systemd --package udev --package dbus
"

Command to import test container and start it, which triggers the failure=
:
"
$ machinectl pull-tar http://192.168.1.300/image.tar.xz default
$ machinectl read-only default false
$ rm -f /var/lib/machines/default/etc/machine-id
$ dbus-uuidgen --ensure=3D/var/lib/machines/default/etc/machine-id
$ machinectl start default
"

Minimal command to trigger the failure once container is imported:
"
$ strace -ff systemd-nspawn --keep-unit --boot --link-journal=3Dtry-guest=
 --network-veth -U --settings=3Doverride --machine=3Ddefault
"

Extracted from systemd MR:
https://github.com/systemd/systemd/pull/22774

Further explanation by Christian Brauner at second half of:
https://github.com/systemd/systemd/issues/20989

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Steve Sakoman <steve@sakoman.com>
---
 ...-host-root-can-write-to-the-uidmappe.patch | 216 ++++++++++++++++++
 meta/recipes-core/systemd/systemd_250.5.bb    |   1 +
 2 files changed, 217 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-nspawn-make-su=
re-host-root-can-write-to-the-uidmappe.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-nspawn-make-sure-host=
-root-can-write-to-the-uidmappe.patch b/meta/recipes-core/systemd/systemd=
/0001-nspawn-make-sure-host-root-can-write-to-the-uidmappe.patch
new file mode 100644
index 0000000000..8715019c99
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-nspawn-make-sure-host-root-c=
an-write-to-the-uidmappe.patch
@@ -0,0 +1,216 @@
+From e34fb1a4568bd080032065bb1506ab9b6c6606f1 Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Thu, 17 Mar 2022 13:46:12 +0100
+Subject: [PATCH] nspawn: make sure host root can write to the uidmapped =
mounts
+ we prepare for the container payload
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+When using user namespaces in conjunction with uidmapped mounts, nspawn
+so far set up two uidmappings:
+
+1. One that is used for the uidmapped mount and that maps the UID range
+   0=E2=80=A665535 on the backing fs to some high UID range X=E2=80=A6X+=
65535 on the
+   uidmapped fs. (Let's call this mapping the "mount mapping")
+
+2. One that is used for the userns namespace the container payload
+   processes run in, that maps X=E2=80=A6X+65535 back to 0=E2=80=A665535=
. (Let's call
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
+(only the X=E2=80=A6X+65536 range is, after all, and X > 0), and process=
es whose
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
+=20
++/* If REMOUNT_IDMAP_HOST_ROOT is set for remount_idmap() we'll include =
a mapping here that maps the host root
++ * user accessing the idmapped mount to the this user ID on the backing=
 fs. This is the last valid UID in the
++ * *signed* 32bit range. You might wonder why precisely use this specif=
ic UID for this purpose? Well, we
++ * definitely cannot use the first 0=E2=80=A665536 UIDs for that, since=
 in most cases that's precisely the file range
++ * we intend to map to some high UID range, and since UID mappings have=
 to be bijective we thus cannot use
++ * them at all. Furthermore the UID range beyond INT32_MAX (i.e. the ra=
nge above the signed 32bit range) is
++ * icky, since many APIs cannot use it (example: setfsuid() returns the=
 old UID as signed integer). Following
++ * our usual logic of assigning a 16bit UID range to each container, so=
 that the upper 16bit of a 32bit UID
++ * value indicate kind of a "container ID" and the lower 16bit map dire=
ctly to the intended user you can read
++ * this specific UID as the "nobody" user of the container with ID 0x7F=
FF, which is kinda nice. */
++#define UID_MAPPED_ROOT ((uid_t) (INT32_MAX-1))
++#define GID_MAPPED_ROOT ((gid_t) (INT32_MAX-1))
++
+ #define ETC_PASSWD_LOCK_PATH "/etc/.pwd.lock"
+=20
+ /* The following macros add 1 when converting things, since UID 0 is a =
valid UID, while the pointer
+diff --git a/src/nspawn/nspawn-mount.c b/src/nspawn/nspawn-mount.c
+index 40773d90c1..f2fad0f462 100644
+--- a/src/nspawn/nspawn-mount.c
++++ b/src/nspawn/nspawn-mount.c
+@@ -780,7 +780,7 @@ static int mount_bind(const char *dest, CustomMount =
*m, uid_t uid_shift, uid_t u
+         }
+=20
+         if (idmapped) {
+-                r =3D remount_idmap(where, uid_shift, uid_range);
++                r =3D remount_idmap(where, uid_shift, uid_range, REMOUN=
T_IDMAP_HOST_ROOT);
+                 if (r < 0)
+                         return log_error_errno(r, "Failed to map ids fo=
r bind mount %s: %m", where);
+         }
+diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
+index 8f17ab8810..fe0af8e42d 100644
+--- a/src/nspawn/nspawn.c
++++ b/src/nspawn/nspawn.c
+@@ -3779,7 +3779,7 @@ static int outer_child(
+             IN_SET(arg_userns_ownership, USER_NAMESPACE_OWNERSHIP_MAP, =
USER_NAMESPACE_OWNERSHIP_AUTO) &&
+             arg_uid_shift !=3D 0) {
+=20
+-                r =3D remount_idmap(directory, arg_uid_shift, arg_uid_r=
ange);
++                r =3D remount_idmap(directory, arg_uid_shift, arg_uid_r=
ange, REMOUNT_IDMAP_HOST_ROOT);
+                 if (r =3D=3D -EINVAL || ERRNO_IS_NOT_SUPPORTED(r)) {
+                         /* This might fail because the kernel or file s=
ystem doesn't support idmapping. We
+                          * can't really distinguish this nicely, nor do=
 we have any guarantees about the
+diff --git a/src/shared/dissect-image.c b/src/shared/dissect-image.c
+index 39a7f4c3f2..471c165257 100644
+--- a/src/shared/dissect-image.c
++++ b/src/shared/dissect-image.c
+@@ -1807,7 +1807,7 @@ static int mount_partition(
+                 (void) fs_grow(node, p);
+=20
+         if (remap_uid_gid) {
+-                r =3D remount_idmap(p, uid_shift, uid_range);
++                r =3D remount_idmap(p, uid_shift, uid_range, REMOUNT_ID=
MAP_HOST_ROOT);
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
+=20
+-static int make_userns(uid_t uid_shift, uid_t uid_range) {
+-        char line[DECIMAL_STR_MAX(uid_t)*3+3+1];
++static int make_userns(uid_t uid_shift, uid_t uid_range, RemountIdmapFl=
ags flags) {
+         _cleanup_close_ int userns_fd =3D -1;
++        _cleanup_free_ char *line =3D NULL;
+=20
+         /* Allocates a userns file descriptor with the mapping we need.=
 For this we'll fork off a child
+          * process whose only purpose is to give us a new user namespac=
e. It's killed when we got it. */
+=20
+-        xsprintf(line, UID_FMT " " UID_FMT " " UID_FMT "\n", 0, uid_shi=
ft, uid_range);
++        if (asprintf(&line, UID_FMT " " UID_FMT " " UID_FMT "\n", 0, ui=
d_shift, uid_range) < 0)
++                return log_oom_debug();
++
++        /* If requested we'll include an entry in the mapping so that t=
he host root user can make changes to
++         * the uidmapped mount like it normally would. Specifically, we=
'll map the user with UID_HOST_ROOT on
++         * the backing fs to UID 0. This is useful, since nspawn code w=
ants to create various missing inodes
++         * in the OS tree before booting into it, and this becomes very=
 easy and straightforward to do if it
++         * can just do it under its own regular UID. Note that in that =
case the container's runtime uidmap
++         * (i.e. the one the container payload processes run in) will l=
eave this UID unmapped, i.e. if we
++         * accidentally leave files owned by host root in the already u=
idmapped tree around they'll show up
++         * as owned by 'nobody', which is safe. (Of course, we shouldn'=
t leave such inodes around, but always
++         * chown() them to the container's own UID range, but it's good=
 to have a safety net, in case we
++         * forget it.) */
++        if (flags & REMOUNT_IDMAP_HOST_ROOT)
++                if (strextendf(&line,
++                               UID_FMT " " UID_FMT " " UID_FMT "\n",
++                               UID_MAPPED_ROOT, 0, 1) < 0)
++                        return log_oom_debug();
+=20
+         /* We always assign the same UID and GID ranges */
+         userns_fd =3D userns_acquire(line, line);
+@@ -1069,7 +1086,8 @@ static int make_userns(uid_t uid_shift, uid_t uid_=
range) {
+ int remount_idmap(
+                 const char *p,
+                 uid_t uid_shift,
+-                uid_t uid_range) {
++                uid_t uid_range,
++                RemountIdmapFlags flags) {
+=20
+         _cleanup_close_ int mount_fd =3D -1, userns_fd =3D -1;
+         int r;
+@@ -1085,7 +1103,7 @@ int remount_idmap(
+                 return log_debug_errno(errno, "Failed to open tree of m=
ounted filesystem '%s': %m", p);
+=20
+         /* Create a user namespace mapping */
+-        userns_fd =3D make_userns(uid_shift, uid_range);
++        userns_fd =3D make_userns(uid_shift, uid_range, flags);
+         if (userns_fd < 0)
+                 return userns_fd;
+=20
+diff --git a/src/shared/mount-util.h b/src/shared/mount-util.h
+index ce73aebd4b..f53a64186f 100644
+--- a/src/shared/mount-util.h
++++ b/src/shared/mount-util.h
+@@ -112,7 +112,18 @@ int mount_image_in_namespace(pid_t target, const ch=
ar *propagate_path, const cha
+=20
+ int make_mount_point(const char *path);
+=20
+-int remount_idmap(const char *p, uid_t uid_shift, uid_t uid_range);
++typedef enum RemountIdmapFlags {
++        /* Include a mapping from UID_MAPPED_ROOT (i.e. UID 2^31-2) on =
the backing fs to UID 0 on the
++         * uidmapped fs. This is useful to ensure that the host root us=
er can safely add inodes to the
++         * uidmapped fs (which otherwise wouldn't work as the host root=
 user is not defined on the uidmapped
++         * mount and any attempts to create inodes will then be refused=
 with EOVERFLOW). The idea is that
++         * these inodes are quickly re-chown()ed to more suitable UIDs/=
GIDs. Any code that intends to be able
++         * to add inodes to file systems mapped this way should set thi=
s flag, but given it comes with
++         * certain security implications defaults to off, and requires =
explicit opt-in. */
++        REMOUNT_IDMAP_HOST_ROOT =3D 1 << 0,
++} RemountIdmapFlags;
++
++int remount_idmap(const char *p, uid_t uid_shift, uid_t uid_range, Remo=
untIdmapFlags flags);
+=20
+ /* Creates a mount point (not parents) based on the source path or stat=
 - ie, a file or a directory */
+ int make_mount_point_inode_from_stat(const struct stat *st, const char =
*dest, mode_t mode);
+--=20
+2.40.1
+
diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-co=
re/systemd/systemd_250.5.bb
index 21a09d8594..c35557471a 100644
--- a/meta/recipes-core/systemd/systemd_250.5.bb
+++ b/meta/recipes-core/systemd/systemd_250.5.bb
@@ -31,6 +31,7 @@ SRC_URI +=3D "file://touchscreen.rules \
            file://CVE-2022-4415-1.patch \
            file://CVE-2022-4415-2.patch \
            file://0001-network-remove-only-managed-configs-on-reconfigur=
e-o.patch \
+           file://0001-nspawn-make-sure-host-root-can-write-to-the-uidma=
ppe.patch \
            "
=20
 # patches needed by musl
--=20
2.40.1


