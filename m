Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.369.1611586427217885970
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:53:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=G/Nq8erM;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id cq1so8539637pjb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KEXnp4RMI0UOh+JN7kSFtdGD7KBZmQdSoBI16dtVMRg=;
        b=G/Nq8erMhb4CuyQZrohGIZJLcTPYyaotjqwkr6Qi/1EzS6shg5eH4CUfCL0OS5wzGd
         VU0mKr8TSu9v9QFNaJ3c3lig9VNYo6BQ/l+9NKt201CeUszXostEHt5kkkD4EPg34Axa
         bEO9btiWEVU3LxzyHsL7AfJG/0V14ZHlaphCmlauaQgoJyVAg6tExCvINQ1tTE44xtjV
         5Xgh9aNlrRNrOq+HR6vY+MdqXQ7y3SJmLrmwiYc7jEef3bGIXKuqm5f5Za/2RH752RDm
         kYH8fNBqtUYEbYdi8V5WJJrUlOA6p+e25kAGAwlW+NgpSlpU5NHQj0SYylOUdRMZoAMb
         QH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KEXnp4RMI0UOh+JN7kSFtdGD7KBZmQdSoBI16dtVMRg=;
        b=g1HsvfP2mU7D/mz83hSRLK09YU2OJp03BZAn5XyeMYSwDqnRllKBgrdGBQSjr0rHzv
         8GLZ4PptLgkIs46g4wq1ERbTRFBFJLaIbFaZalCvkEWqnLEKZeZ2uOb7Zm17oW+4FM6X
         5uEZ3VqZenx0aYlpCsCTyIbAtdl4ZnmJfc6xJbWWhZNjsu/ScBDOyhylpSOhN0tu265o
         mBb22cid+r9gb4sCnD+nhL3wwyY0Wd4EerMKzp1MEmqk0Qx7zZpOkA2ss4OwWs05+bEa
         C0+FBQ/CO/79SGf3SU828S1grhLJxPrmmnskSqBW94gu3FlSIMCfOlPUtD0Y4lK9IVrR
         Swjw==
X-Gm-Message-State: AOAM530LmIjsVZD41kF75cIfUcuwLqy0VjJMu/OWc+t0A+RrZPHTNS+g
	HTJ/fVXy2hspVcywB3bL8clAsOFhhQIujbMql3w=
X-Google-Smtp-Source: ABdhPJz4vz+8wYonrp92Z67dZBu/ULknhgE0rHhK7KUJEo+Qk9gU12n5BQ8j/K3ApFyVgGKC4JlA9g==
X-Received: by 2002:a17:902:9309:b029:db:c725:d19c with SMTP id bc9-20020a1709029309b02900dbc725d19cmr814151plb.39.1611586426292;
        Mon, 25 Jan 2021 06:53:46 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.53.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:53:45 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 45/47] wic: Add --change-directory argument
Date: Mon, 25 Jan 2021 04:51:17 -1000
Message-Id: <5d88e1ff90973357ec3ac7d84f48974a443e4e86.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2265d089a58e1f78f26d623ee667c420cb1c3bd4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index 127ca79ade..452a160232 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -152,6 +152,7 @@ class KickStart():
         part.add_argument('--offset', type=sizetype("K", True))
         part.add_argument('--exclude-path', nargs='+')
         part.add_argument('--include-path', nargs='+')
+        part.add_argument('--change-directory')
         part.add_argument("--extra-space", type=sizetype("M"))
         part.add_argument('--fsoptions', dest='fsopts')
         part.add_argument('--fstype', default='vfat',
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index cc0382ce54..286c7867cb 100644
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
index c96c539d03..ff1313717e 100644
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

