Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.12743.1587278156568327114
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Apr 2020 23:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DbytaUEg;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id t63so6233088wmt.3
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Apr 2020 23:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OpyTiYP+MRDGTydXuh/jWBDmUpp26eUJMPiwTCnegtE=;
        b=DbytaUEgM6SgHUj5ZBOOX0+wtw3iKWufdbE5DgILiWkk8EW4S+KvmRqXGh9cV1uD5t
         YTOfi9gKQ/jR3NMDTz6BY8tEsNdGqi2y8v5ffsi2/KkB/LlC9i8YJKRx08KthnEAAEQw
         P/k2tTJyCATKHjfDzfXXvuWtX284K0pazxUpB0ACx9Um3B+IvJHeCitjIS+n7yMYoHfy
         wZqURLV5LOsSXJNpgx2FTUGKVT1Juum048UWIaOGM3FuGIqa4TwqH5CggU+NhDks0ExR
         1bTs62o8ZkMEqhsz99+goD622sPL3wqxkejMwNDEb/4PNiz6YV4FVsJ7p2fyYn6FG07o
         IOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=OpyTiYP+MRDGTydXuh/jWBDmUpp26eUJMPiwTCnegtE=;
        b=KOcyz1krjrmzRExM//UHKH5qei5jpwAbkplgRpnqFBG/HPfy8CmGjYW3dVqLquuNza
         PYKt+FQAyGQbxc29RYoV6iQ1c7EKEkoMMpAxLWm+SndTvWIUKTCkcP06h2ztOp0+hmPC
         levG0Au1Zcd6sqvoQgL3PcXRUFSGNkGCOoaWVcEWqd0NooLZlEQWXFDLiD6Z6haNgrV7
         Fr5Alz7vGq+T0dTUZeSHwJGh89Akt4NY1tvfyPxazMZVjZY2pCETd/wRr2QN/wY7CT6S
         CMRziC2WFrvzSj2zLXv05sUmOEDp92jwpEM/kyglhlQCZ5V1DOZz5x03rLiZy22uRBbI
         8Ocw==
X-Gm-Message-State: AGi0PuZjYXQSX3C8vVW9N+NnZ2yamoYFET3h0QzYsV+0OaQ89JEkNngK
	RTcMRjmamlaWepgF4sGwqZAZFsEFrOM=
X-Google-Smtp-Source: APiQypI7Zdp/7I25CxF0rzZRPfD9d2ORhiN4usjRTonRW2B3Hf+NYTbSQIMtdaV2VmVywPcQvYUVeQ==
X-Received: by 2002:a7b:c20f:: with SMTP id x15mr10922797wmi.2.1587278154745;
        Sat, 18 Apr 2020 23:35:54 -0700 (PDT)
Return-Path: <ricardo.ribalda@gmail.com>
Received: from piling.lan (80-71-134-83.u.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id n6sm13980266wmc.28.2020.04.18.23.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 23:35:53 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	Paul Barker <pbarker@konsulko.com>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
	Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH v7 08/10] wic: root: Add an opt. destination on include-path
Date: Sun, 19 Apr 2020 08:35:36 +0200
Message-Id: <20200419063539.1467641-9-ricardo@ribalda.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200419063539.1467641-1-ricardo@ribalda.com>
References: <20200419063539.1467641-1-ricardo@ribalda.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

Allow specifying an optional destination to include-path and make the
option aware of permissions and owners.

It is very useful for making a partition that contains the rootfs for a
host and a target Eg:

/ -> Roofs for the host
/export/ -> Rootfs for the target (which will netboot)

Although today we support making a partition for "/export" this might
not be compatible with some upgrade systems, or we might be limited by
the number of partitions.

With this patch we can use something like:

part / --source rootfs --fstype=ext4 --include-path core-image-minimal-mtdutils export/ --include-path hello

on the .wks file.

Cc: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 meta/recipes-core/meta/wic-tools.bb      |  2 +-
 scripts/lib/wic/help.py                  | 20 ++++----
 scripts/lib/wic/ksparser.py              |  2 +-
 scripts/lib/wic/plugins/source/rootfs.py | 60 +++++++++++++++++++++++-
 4 files changed, 72 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta/wic-tools.bb
index 09eb409e87..8aeb942ed2 100644
--- a/meta/recipes-core/meta/wic-tools.bb
+++ b/meta/recipes-core/meta/wic-tools.bb
@@ -6,7 +6,7 @@ DEPENDS = "\
            parted-native syslinux-native gptfdisk-native dosfstools-native \
            mtools-native bmap-tools-native grub-efi-native cdrtools-native \
            btrfs-tools-native squashfs-tools-native pseudo-native \
-           e2fsprogs-native util-linux-native \
+           e2fsprogs-native util-linux-native tar-native\
            "
 DEPENDS_append_x86 = " syslinux grub-efi systemd-boot"
 DEPENDS_append_x86-64 = " syslinux grub-efi systemd-boot"
diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 62a2a90e79..bd3a2b97df 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -971,14 +971,18 @@ DESCRIPTION
                          has an effect with the rootfs source plugin.
 
          --include-path: This option is specific to wic. It adds the contents
-                         of the given path to the resulting image. The path is
-                         relative to the directory in which wic is running not
-                         the rootfs itself so use of an absolute path is
-                         recommended. This option is most useful when multiple
-                         copies of the rootfs are added to an image and it is
-                         required to add extra content to only one of these
-                         copies. This option only has an effect with the rootfs
-                         source plugin.
+                         of the given path or a rootfs to the resulting image.
+                         The option contains two fields, the origin and the
+                         destination. When the origin is a rootfs, it follows
+                         the same logic as the rootfs-dir argument and the
+                         permissions and owners are kept. When the origin is a
+                         path, it is relative to the directory in which wic is
+                         running not the rootfs itself so use of an absolute
+                         path is recommended, and the owner and group is set to
+                         root:root. If no destination is given it is
+                         automatically set to the root of the rootfs. This
+                         option only has an effect with the rootfs source
+                         plugin.
 
          --change-directory: This option is specific to wic. It changes to the
                              given directory before copying the files. This
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index c60869d397..b8befe78e3 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -137,7 +137,7 @@ class KickStart():
         part.add_argument('--active', action='store_true')
         part.add_argument('--align', type=int)
         part.add_argument('--exclude-path', nargs='+')
-        part.add_argument('--include-path', nargs='+')
+        part.add_argument('--include-path', nargs='+', action='append')
         part.add_argument('--change-directory')
         part.add_argument("--extra-space", type=sizetype)
         part.add_argument('--fsoptions', dest='fsopts')
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index 247f61ff7c..544e868b5e 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -17,6 +17,7 @@ import shutil
 import sys
 
 from oe.path import copyhardlinktree
+from pathlib import Path
 
 from wic import WicError
 from wic.pluginbase import SourcePlugin
@@ -126,8 +127,63 @@ class RootfsPlugin(SourcePlugin):
                                                     orig_dir, new_rootfs)
                 exec_native_cmd(pseudo_cmd, native_sysroot)
 
-            for path in part.include_path or []:
-                copyhardlinktree(path, new_rootfs)
+            for in_path in part.include_path or []:
+                #parse arguments
+                include_path = in_path[0]
+                if len(in_path) > 2:
+                    logger.error("'Invalid number of arguments for include-path")
+                    sys.exit(1)
+                if len(in_path) == 2:
+                    path = in_path[1]
+                else:
+                    path = None
+
+                # Pack files to be included into a tar file.
+                # We need to create a tar file, because that way we can keep the
+                # permissions from the files even when they belong to different
+                # pseudo enviroments.
+                # If we simply copy files using copyhardlinktree/copytree... the
+                # copied files will belong to the user running wic.
+                tar_file = os.path.realpath(
+                           os.path.join(cr_workdir, "include-path%d.tar" % part.lineno))
+                if os.path.isfile(include_path):
+                    parent = os.path.dirname(os.path.realpath(include_path))
+                    tar_cmd = "tar c --owner=root --group=root -f %s -C %s %s" % (
+                                tar_file, parent, os.path.relpath(include_path, parent))
+                    exec_native_cmd(tar_cmd, native_sysroot)
+                else:
+                    if include_path in krootfs_dir:
+                        include_path = krootfs_dir[include_path]
+                    include_path = cls.__get_rootfs_dir(include_path)
+                    include_pseudo = os.path.join(include_path, "../pseudo")
+                    if os.path.lexists(include_pseudo):
+                        pseudo = cls.__get_pseudo(native_sysroot, include_path,
+                                                  include_pseudo)
+                        tar_cmd = "tar cf %s -C %s ." % (tar_file, include_path)
+                    else:
+                        pseudo = None
+                        tar_cmd = "tar c --owner=root --group=root -f %s -C %s ." % (
+                                tar_file, include_path)
+                    exec_native_cmd(tar_cmd, native_sysroot, pseudo)
+
+                #create destination
+                if path:
+                    destination = os.path.realpath(os.path.join(new_rootfs, path))
+                    if not destination.startswith(new_rootfs):
+                        logger.error("%s %s" % (destination, new_rootfs))
+                        sys.exit(1)
+                    Path(destination).mkdir(parents=True, exist_ok=True)
+                else:
+                    destination = new_rootfs
+
+                #extract destination
+                untar_cmd = "tar xf %s -C %s" % (tar_file, destination)
+                if new_pseudo:
+                    pseudo = cls.__get_pseudo(native_sysroot, new_rootfs, new_pseudo)
+                else:
+                    pseudo = None
+                exec_native_cmd(untar_cmd, native_sysroot, pseudo)
+                os.remove(tar_file)
 
             for orig_path in part.exclude_path or []:
                 path = orig_path
-- 
2.25.1

