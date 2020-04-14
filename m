Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web12.11308.1586871386523812027
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2020 06:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hyGTxoCt;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id u15so7958128ljd.3
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2020 06:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PEj4RoHcT2P/jnGtixgobACgIPptkbNKAMUNa8kZdAY=;
        b=hyGTxoCtTle2gcH4HdzJCAhBek4TwxJ5BthCaxuv2KryitsrzaiA3oBgwOG4jpepVn
         VvyJj52NLVfUdH22mpD9V6oH1iiQOwTYU9bqVJl946VsYB3C2sKeC3AvZeJd/wlYVXFO
         4H9mYX7WY59b/tEMoPw4Bk1REzh+Pj9BV2B8ROMG71mIKGSVQY8XnsjfMkAcjhDCQ8QP
         xvditYfToq3Y2BBlYzMCZTvGw9oVccXPPaLmcwIa8jotqzq3s9cqw6levbEUmOfL4tHs
         tRqbLu8D7PI7tt9eE6bVTu1A55D3urzJSl+N+yAUICjqJiCcUTiT9Zx8P0Ohx+8AfPNm
         RqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=PEj4RoHcT2P/jnGtixgobACgIPptkbNKAMUNa8kZdAY=;
        b=tI0LDvUY9Cx7EK3P31bGwiw1gyuEVT+2A5neeDzQfXXxKJsSg5k/0fYp/vk0/30qKs
         hfuCYkp9kjbgUerUqXwBXcWDQnsdW5/6lEra2RLC1OjqfB+a06RpYplwDw9k+vvg0fj4
         AtdnKU3E5YF5V+jR2d6blnSJv9Qrwlk8AJmTJuxEkOZK/jHINq/ZwhQZuMpFvrGRK/CE
         wfT/YsntRmktMyKwwsd8bZADQ3Cm1pzFIycRAZokp5slF3O1kdZ1ritxUcuomTI/0qd6
         i+xl0y5JUYRuJeAQnz8bZpn+tZM7+sqBF4iF4Gq7K+SMkdNoqgdro2TQ07ACtbLeJt4l
         gH9A==
X-Gm-Message-State: AGi0PubSxYL5u5uLwoufzjQCXuu2hbkqx7H1jByMmPE52CwiGZgH93D1
	ROWO1wgtI5aXZCTZGAuuLeqkkinQRmw=
X-Google-Smtp-Source: APiQypIxHrH653EgH6fMfhjFXR4JFlfPTlwZygpnu0rumSCOT+kpQXbwxgwMz+H5ytrAxAmcptpe4A==
X-Received: by 2002:a2e:914c:: with SMTP id q12mr153607ljg.124.1586871384069;
        Tue, 14 Apr 2020 06:36:24 -0700 (PDT)
Return-Path: <ricardo.ribalda@gmail.com>
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id o6sm9218344lji.15.2020.04.14.06.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 06:36:23 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	Paul Barker <pbarker@konsulko.com>
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH v6 03/10] wic: Add --change-directory argument
Date: Tue, 14 Apr 2020 15:36:07 +0200
Message-Id: <20200414133614.1830058-4-ricardo@ribalda.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200414133614.1830058-1-ricardo@ribalda.com>
References: <20200414133614.1830058-1-ricardo@ribalda.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This option allows to specify which part of a rootfs is going to be
included, the same way the -C argument on tar.

Thanks to this option we can make sure the permissions and usernames
on the target partition are respected, and also simplify the creation of
splitted partitons, not neeting to invoke external vars or using .wks.in
files. Eg:

part / --source rootfs --ondisk sda --fstype=ext4 --exclude-path=etc/   
part /etc --source rootfs --fstype=ext4 --change-directory=etc

Cc: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 scripts/lib/wic/help.py                  |  6 ++++++
 scripts/lib/wic/ksparser.py              |  1 +
 scripts/lib/wic/partition.py             |  1 +
 scripts/lib/wic/plugins/source/rootfs.py | 21 ++++++++++++++++++---
 4 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 1e3d06a87b..62a2a90e79 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -980,6 +980,12 @@ DESCRIPTION
                          copies. This option only has an effect with the rootfs
                          source plugin.
 
+         --change-directory: This option is specific to wic. It changes to the
+                             given directory before copying the files. This
+                             option is useful when we want to split a rootfs in
+                             multiple partitions and we want to keep the right
+                             permissions and usernames in all the partitions.
+
          --extra-space: This option is specific to wic. It adds extra
                         space after the space filled by the content
                         of the partition. The final size can go
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 650b976223..c60869d397 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -138,6 +138,7 @@ class KickStart():
         part.add_argument('--align', type=int)
         part.add_argument('--exclude-path', nargs='+')
         part.add_argument('--include-path', nargs='+')
+        part.add_argument('--change-directory')
         part.add_argument("--extra-space", type=sizetype)
         part.add_argument('--fsoptions', dest='fsopts')
         part.add_argument('--fstype', default='vfat',
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index d850fbd1b1..3240be072a 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -31,6 +31,7 @@ class Partition():
         self.extra_space = args.extra_space
         self.exclude_path = args.exclude_path
         self.include_path = args.include_path
+        self.change_directory = args.change_directory
         self.fsopts = args.fsopts
         self.fstype = args.fstype
         self.label = args.label
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index caad9efccc..c831829398 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -86,14 +86,29 @@ class RootfsPlugin(SourcePlugin):
         new_rootfs = None
         new_pseudo = None
         # Handle excluded paths.
-        if part.exclude_path or part.include_path:
+        if part.exclude_path or part.include_path or part.change_directory:
             # We need a new rootfs directory we can delete files from. Copy to
             # workdir.
             new_rootfs = os.path.realpath(os.path.join(cr_workdir, "rootfs%d" % part.lineno))
 
             if os.path.lexists(new_rootfs):
                 shutil.rmtree(os.path.join(new_rootfs))
-            copyhardlinktree(part.rootfs_dir, new_rootfs)
+
+            if part.change_directory:
+                cd = part.change_directory
+                if cd[-1] == '/':
+                    cd = cd[:-1]
+                if os.path.isabs(cd):
+                    logger.error("Must be relative: --change-directory=%s" % cd)
+                    sys.exit(1)
+                orig_dir = os.path.realpath(os.path.join(part.rootfs_dir, cd))
+                if not orig_dir.startswith(part.rootfs_dir):
+                    logger.error("'%s' points to a path outside the rootfs" % orig_dir)
+                    sys.exit(1)
+
+            else:
+                orig_dir = part.rootfs_dir
+            copyhardlinktree(orig_dir, new_rootfs)
 
             # Convert the pseudo directory to its new location
             if (pseudo_dir):
@@ -107,7 +122,7 @@ class RootfsPlugin(SourcePlugin):
                 pseudo_cmd = "%s -B -m %s -M %s" % (cls.__get_pseudo(native_sysroot,
                                                                      new_rootfs,
                                                                      new_pseudo),
-                                                    part.rootfs_dir, new_rootfs)
+                                                    orig_dir, new_rootfs)
                 exec_native_cmd(pseudo_cmd, native_sysroot)
 
             for path in part.include_path or []:
-- 
2.25.1

