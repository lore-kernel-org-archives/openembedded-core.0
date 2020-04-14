Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.11019.1586871395688534254
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2020 06:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YMLR90jW;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id u15so7958693ljd.3
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2020 06:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Dbt7+6d/6S37Q97Zv2yX/sIeREuiNoOxdLQEgUhCMQI=;
        b=YMLR90jWgMXfQdUYFL6BLDoRHbDjMp8adQ1ZmBEocvlgUIZrJlQ+NN/wdJH2+iE9lK
         aUDR4jfPHBZY1cYWfALig4AgCa1dZc/ObTXkUA/I3GVDxDFh/EFgMF52G/la4fsi/jTV
         K893Or7l7iSEzCiuP9z4jh2+TEtiQyUJD6h27LUkWwLzjQ01BWBmQ9SWRQ39KgTNUXgd
         T6NPe7gLfO0ls7m3ZBPVC6U08XyvzJDA7euA9Vp7e7ZYUax+Hk7Ak9bF7I926ZnV2Pcu
         YKyk8dR3yU8zPClnXVVvU+c42mrsPdnB5j6P3QDOJNttq3sT81lTNlWFA35pSw4TjdOI
         RR0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=Dbt7+6d/6S37Q97Zv2yX/sIeREuiNoOxdLQEgUhCMQI=;
        b=L/GcDAfcBiO0GR30XTrRWkOgjjDcdk8fGRBI1UXbcMmmq53P3O1HJhFscjC5q1IVkX
         mox+pggExQ15bscE5RjF6oPACW82R2+VHQ+9F8SdSyimZmB1fyHTSaH1wL2keIOzXC7r
         8PdF8PAXlt8twBiP84Dn8y/CiUKwt8xvZrB3oMSN9YHditcMJOzs/gC+j04QXraohyRn
         bZHupb+NQ8aeRzZ+OXya8I2DKWcMSLcp6VK5tsC85Zf5hMlHCp9FtzNkSXOc+cwODxgt
         Y2TJdXHjE/hQsutf3TRKpS5BtCCrkarXrKTIPBqulEZKLEdQN3xMF2zMRQcMD1nFes/5
         TdbA==
X-Gm-Message-State: AGi0PuYMyl/z0KeOhkDi5CKafEwaM9YjHNtgijF9EJ24jsOxVut4Hrsr
	QV+N8o7nOPMPlj3MV5ic8lgF5Hz9nCY=
X-Google-Smtp-Source: APiQypJBGxkczjtoFCsk5Q6WIdHk0ZNxJxaTtEfIoSJ/8QqdTR5/sO0a27gl2I7vPwWSQ9l2ODbWug==
X-Received: by 2002:a2e:a549:: with SMTP id e9mr164139ljn.28.1586871393389;
        Tue, 14 Apr 2020 06:36:33 -0700 (PDT)
Return-Path: <ricardo.ribalda@gmail.com>
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id o6sm9218344lji.15.2020.04.14.06.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 06:36:32 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	Paul Barker <pbarker@konsulko.com>
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH v6 08/10] wic: root: Add an opt. destination on include-path
Date: Tue, 14 Apr 2020 15:36:12 +0200
Message-Id: <20200414133614.1830058-9-ricardo@ribalda.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200414133614.1830058-1-ricardo@ribalda.com>
References: <20200414133614.1830058-1-ricardo@ribalda.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
 scripts/lib/wic/help.py                  | 20 +++++----
 scripts/lib/wic/ksparser.py              |  2 +-
 scripts/lib/wic/plugins/source/rootfs.py | 54 +++++++++++++++++++++++-
 4 files changed, 66 insertions(+), 12 deletions(-)

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
index 1d21ec2252..9d0666b638 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -17,6 +17,7 @@ import shutil
 import sys
 
 from oe.path import copyhardlinktree
+from pathlib import Path
 
 from wic import WicError
 from wic.pluginbase import SourcePlugin
@@ -125,8 +126,57 @@ class RootfsPlugin(SourcePlugin):
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
+                #pack content
+                tar_file = os.path.realpath(os.path.join(cr_workdir, "aux.tar"))
+                if os.path.isfile(include_path):
+                    parent = os.path.dirname(include_path)
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

