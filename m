Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.6417.1586429400763670275
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2020 03:50:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L+x21d8z;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id h9so11376895wrc.8
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2020 03:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NeCjOb46qK8+tOzqS6AhMFibqtsndDQWAtQfaB0EHnc=;
        b=L+x21d8zWBd3Q90Px1R8Hk89Ezp/eIs7mkdzqAmh5PM50ntyvSjw6i6mPuBKDYNCJx
         kX8sCVVS9PD4nWMQFrRKQ1JyirR2mzOAs7ICAMFLSf4FoeDnnGHKhEEX4mTDJce9BazO
         CJPfamkwIRcuHmFPFZJJhX4iN0ZmbcR64xxoGARlwRP04bUtfIjddqQnciTqOTD+mciN
         /4kbFN9ckn/oiSdr5UeCbYXcEcvuw8EOd6FOuYqa99qZrSBt1epokf5nEJxhyCFQhz9B
         Dk5neoMIMK2GG2SfDKOQl/B4fVtjCFZdvJdrYLK9skwb6qiXKd7N/OP2DIBwGg3pn1II
         ZABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=NeCjOb46qK8+tOzqS6AhMFibqtsndDQWAtQfaB0EHnc=;
        b=hJJse3VmBRSYeEBq19ATOBhE0w/MacxrPRnNP2WnGOiTuMFWj7+t2E1aqSO6X1T5aN
         J03S2365Ei6NmwcM+6mxLsCpRf0FDh4ztVCc6FyeWOwlEPZtCzS2TYNxVcUde0iMkRKX
         kRITrtIPTJ3SrZyWE30ITFSPN1j+0hp84I31SRpUYpGl1k7HUjxjtowLhs6hPPBBWWU6
         DhIQIV55+Jc413XhWinUcASQhgmjSvUHz1kEmcpRzi9+pBbLjoS42vPcvon8Qy+7V7XF
         l45zzgLzfDm0akfZf9o7kBg0dQvIJiFewJ5Rvd8S1wi8v7xJkIrmnLbyPVlUpFeTLNgk
         nvLw==
X-Gm-Message-State: AGi0PuZVz2PFdSOaxJYp1Sy3EXi1SIcKrfdnmasEp0ZUVeEgEonwJXpM
	/d3UbGFlBRLsKQb1LZ9HCvqEPSE7ITQ=
X-Google-Smtp-Source: APiQypLzk7cWxjzK2+eIqJTy94ctG89PsGoPmy0xAxqlgbfP0fOQeqYvmAW2wfsY4yot4yG2+S9Y7g==
X-Received: by 2002:a5d:5151:: with SMTP id u17mr1969664wrt.240.1586429398978;
        Thu, 09 Apr 2020 03:49:58 -0700 (PDT)
Return-Path: <ricardo.ribalda@gmail.com>
Received: from piling.lan (80-71-134-83.u.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id l5sm4985737wrm.66.2020.04.09.03.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 03:49:57 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	Paul Barker <pbarker@konsulko.com>
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH v4 3/4] wic: Add --change-directory argument
Date: Thu,  9 Apr 2020 12:49:50 +0200
Message-Id: <20200409104951.948242-4-ricardo@ribalda.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200409104951.948242-1-ricardo@ribalda.com>
References: <20200409104951.948242-1-ricardo@ribalda.com>
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
part /etc --source rootfs --fstype=ext4 --change-directory=/etc

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 scripts/lib/wic/help.py                  |  6 ++++++
 scripts/lib/wic/ksparser.py              |  1 +
 scripts/lib/wic/partition.py             |  1 +
 scripts/lib/wic/plugins/source/rootfs.py | 17 ++++++++++++++---
 4 files changed, 22 insertions(+), 3 deletions(-)

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
index caad9efccc..d3742802bb 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -86,14 +86,25 @@ class RootfsPlugin(SourcePlugin):
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
+                orig_dir = os.path.join(part.rootfs_dir, cd)
+            else:
+                orig_dir = part.rootfs_dir
+            copyhardlinktree(orig_dir, new_rootfs)
 
             # Convert the pseudo directory to its new location
             if (pseudo_dir):
@@ -107,7 +118,7 @@ class RootfsPlugin(SourcePlugin):
                 pseudo_cmd = "%s -B -m %s -M %s" % (cls.__get_pseudo(native_sysroot,
                                                                      new_rootfs,
                                                                      new_pseudo),
-                                                    part.rootfs_dir, new_rootfs)
+                                                    orig_dir, new_rootfs)
                 exec_native_cmd(pseudo_cmd, native_sysroot)
 
             for path in part.include_path or []:
-- 
2.25.1

