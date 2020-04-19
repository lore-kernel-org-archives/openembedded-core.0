Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.12667.1587278148158975518
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Apr 2020 23:35:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lRmEDEB0;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id u13so7990407wrp.3
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Apr 2020 23:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=699lrtddUjdlyRc8sewtxItO8Ra+0N/ryzWsHDKQPIA=;
        b=lRmEDEB0V6JSfPrLPGn6SPcSmLXbep6XobWkev+cP9yhoTdHYH/X013SIUw042ew0M
         lr9uje4ghZSsGdkZLzIwTMyHALAh5wH2+JBtucC0CtIi2jPRYauj48xYjfc+1zjWkXfH
         mLZE3EaS0kS+G7ULTDWPbY0sdPEEBluHTjE2rZzr4DNYChx7Rgvpns/C/1XVtp17cLlk
         e26iI3K35ydHtqz46WgtAdz3npzl15jwO4GMefcgns1S1skXFTH1ChG/gDRGKbjLQ2w6
         pOlVgeyxZYc1EkaSHfkbGGRH8w7OCk+cRqEk9NUV7u4cjHPSm0htaUJ3XGEwVivVEYg5
         sdZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=699lrtddUjdlyRc8sewtxItO8Ra+0N/ryzWsHDKQPIA=;
        b=eGs5wnWMNGabv7BS2m6IRBSJ+Uj6tYSzUSuj1p9xbowGcrnCUsHWar9wzVfj1dFFAE
         VawuKopHciJRvgQbVSv/J29X+0AbmXNtRYa79b6DlkU7Sy8BLcIJSTgtENASHMKhDwl9
         Ta+9BfRbvKVDnC71XsNYaLq4JHxZmBRmDoLWf5cbDW0VITux493DpprKw6cJWEleKqf/
         RP0+5dNZbW5jrePM0ET8uMF1erDx24EQxDKdLC9Ja1Y0lukOxGZ+3BV3g9mJxMBavWl9
         +gok2jskwoaZrkJGCNzn/OG3iztid5wcdOKu5CvNUmoIHenBt8UE+h81Nxb58W4ErXRe
         VNzw==
X-Gm-Message-State: AGi0PuZZBxX6Bb0OZPOujUAEz7FzmEJm9Jf23Q4126SAW4loQOHFrmhe
	3SzyZK2b4WNrt32NNI6S+uXSfGkxW9Y=
X-Google-Smtp-Source: APiQypLQSntGIFXJYOAtt6WBNyqh50/YCmsLzWGrRWwfEdJNt3KT2eQ9vaPfV/tuTbTUFztyUXzehg==
X-Received: by 2002:adf:c3ca:: with SMTP id d10mr12915809wrg.64.1587278146379;
        Sat, 18 Apr 2020 23:35:46 -0700 (PDT)
Return-Path: <ricardo.ribalda@gmail.com>
Received: from piling.lan (80-71-134-83.u.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id n6sm13980266wmc.28.2020.04.18.23.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 23:35:45 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	Paul Barker <pbarker@konsulko.com>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
	Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH v7 03/10] wic: Add --change-directory argument
Date: Sun, 19 Apr 2020 08:35:31 +0200
Message-Id: <20200419063539.1467641-4-ricardo@ribalda.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200419063539.1467641-1-ricardo@ribalda.com>
References: <20200419063539.1467641-1-ricardo@ribalda.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

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
index 8b2a067385..85c634f8a1 100644
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
@@ -108,7 +123,7 @@ class RootfsPlugin(SourcePlugin):
                 pseudo_cmd = "%s -B -m %s -M %s" % (cls.__get_pseudo(native_sysroot,
                                                                      new_rootfs,
                                                                      new_pseudo),
-                                                    part.rootfs_dir, new_rootfs)
+                                                    orig_dir, new_rootfs)
                 exec_native_cmd(pseudo_cmd, native_sysroot)
 
             for path in part.include_path or []:
-- 
2.25.1

