Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.12052.1586447580691208613
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2020 08:53:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eXIUqd5r;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id e26so238885wmk.5
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2020 08:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NeCjOb46qK8+tOzqS6AhMFibqtsndDQWAtQfaB0EHnc=;
        b=eXIUqd5rN1ZUYMmccpopFcN5tFmjusHybqmxZfl1UeiiZzgtNpUt5LmBhHoJLY9yZA
         h6pOzoasfeFLx9qqJm/3mvOBkeSvv0+jqFt0z4sFJ6TesIRniVTLHa2Khp1hg5Z6GIFN
         83oKaAtA3zzWvntcJOObmnfjHK2A+Ad0oPDXrZn7yLLPR+fVQ85E8VfSVtWtL9Q5BKV6
         oGmxUlrc50Li+H8pgshUWennm2aKGdFW3kFFg3SFBEdqNWEiSUKMsIpmXJWqGNafeDC3
         yeUPrCapg1eG/qsv6phOsIxDvVnc1+qL7qJYSjpJ33jAy3Nz8zhWWJkaPC4451zm2bFE
         ycpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=NeCjOb46qK8+tOzqS6AhMFibqtsndDQWAtQfaB0EHnc=;
        b=mpd7WYEo8f1c5oT6JkBa54eigaVXfGBQX8zC5tVPuS3s6voW3Sr/2G8BF7n8dSD6Ds
         N9PShqte7Bwi5q8uByQJD5dgYriTOFT6D0pm1Fg5/15qQWqn+ByweAzjjM7U2KR37SLx
         Um2AhSHWI2R9DYzj6WYc9+RfcKCYrw4EBlO+LRtjFWzgn7sENE5doyxy9Jybd6dXFa9f
         laaLinRG1Uw1/Im0pGokv76dI8I3VUoAPKfw1twxfSsGWqJ5PV6Y8y8h/XheOMm9aYEz
         Ho1kTbcnxdo6Vqdb+LA0SrMNPvhppJVygWZuIGZLdvCRyJDzrbT/RG/3ATF2PgaAFwF/
         /byg==
X-Gm-Message-State: AGi0Puam8eujEezYOvRSA0fPFWT+OLx0EpQjeKndoZNTDE2wnFgmTENL
	/RWMlU5rkhvpI9JrSFRjo98Ftkf8CD0=
X-Google-Smtp-Source: APiQypKxJ10bpm8uDJ2b41DK3xRL/vvEtTNCbmLXKJwlgKx1B2Bv9ETCOHMG4GNvEfNFbCOs838hVw==
X-Received: by 2002:a1c:ed1a:: with SMTP id l26mr473598wmh.175.1586447578749;
        Thu, 09 Apr 2020 08:52:58 -0700 (PDT)
Return-Path: <ricardo.ribalda@gmail.com>
Received: from piling.lan (80-71-134-83.u.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id t67sm4253635wmt.48.2020.04.09.08.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 08:52:57 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	Paul Barker <pbarker@konsulko.com>
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH v5 3/6] wic: Add --change-directory argument
Date: Thu,  9 Apr 2020 17:52:48 +0200
Message-Id: <20200409155251.982424-4-ricardo@ribalda.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200409155251.982424-1-ricardo@ribalda.com>
References: <20200409155251.982424-1-ricardo@ribalda.com>
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

