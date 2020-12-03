Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web12.11379.1607008161770246067
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 07:09:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Xhqg1jNv;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.65, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f65.google.com with SMTP id e5so1260856pjt.0
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 07:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=wk0P7oNphzDPwYwBzPTkJre0iGxhrROctJ7X2stWvFw=;
        b=Xhqg1jNvY69bwNy89olKw4J2IyxD2vmEaMPfn1xCEi6qNXnXqBxq+DYEMxAfYfDwk2
         aq7FJAY7IF27yGYxKAaAkV8cTfotrZb1pneDkgMZvr4RBdtuk5KqJDkpSchIJ/tmWqCt
         7OYCbdJIPPSq4UyblkQFqpoegKBVqHvhWkGXGMebiLRXradPyvCmzID58ySf5r18aOom
         0In7+IHQxZnm3NU7/TzBRtBrkKrtdyzgcfZxPlUKboxt7h2RqgxQj9wF8p6e5EW+YqDM
         2ysUAkZs2rvxWk8F5BJsJm9xZnz6x5npBKJTybVuhvmQn5n80hTQqI4PLfiHKmfNaPLg
         13dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=wk0P7oNphzDPwYwBzPTkJre0iGxhrROctJ7X2stWvFw=;
        b=hO/xcJDfYxDa+4XhGFEQSe935DfrHeCiu1LfmNA/+Eum5VWFKPFGJTzGAFEe7Oz8DH
         X5HLXKKGJ4jaRilfVQwS2ksuJMh2ksCkeumxwJx7zgS9zpMjf+IqaS3JVH4cbq6dLLqB
         PxsXZhvPhxIC58PSXJzlYvMtmXtWUG9ULwEClNMiAWeQNdgi+3gXBp2QE+gr1PZB9CBS
         3rrC8zgPUo3v8vTyfffVkSr8T3MNxo30tn0+ntLxqeOEVO64/1gamkvOrUZrSGCY0Tp7
         j6hb1FuZj517RacIBCLiOHgAXS+Pm2XytC8n1+bjsuQ0UszZDeqC0Ba0lTt/LZjEouZP
         lMrA==
X-Gm-Message-State: AOAM532ZSRtc/HWiDPg63n4c76icVF5ni84SlFhEaJaRAoIfkCwWi+27
	5S+UJdjoopvsy7+gtM/q+BDT789+/1xVzpXi
X-Google-Smtp-Source: ABdhPJygpo+LpzG8PL9dc4Yr+UwtnaZ1AD9crMytgVjc5LPlOVmV2w9EBFLPP1jqTwdZL6IgxofPiA==
X-Received: by 2002:a17:902:ee03:b029:da:689f:337e with SMTP id z3-20020a170902ee03b02900da689f337emr1635804plb.52.1607008160828;
        Thu, 03 Dec 2020 07:09:20 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s7sm1632320pju.37.2020.12.03.07.09.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 07:09:20 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/28] wic: Avoid creating invalid pseudo directory
Date: Thu,  3 Dec 2020 05:08:06 -1000
Message-Id: <63b0e39054d0c02dc1d3892a500f20dbf3cb547d.1607007208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607007208.git.steve@sakoman.com>
References: <cover.1607007208.git.steve@sakoman.com>

From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

If the source of the rootfs is not a bitbake cooked image, or it is not
pointing to the root of one, we call pseudo again, which will produce
a new pseudo folder at rootfs/../pseudo

Eg:

part /etc --source rootfs --rootfs-dir=${IMAGE_ROOTFS}/home --fstype=ext4

Cc: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 799a24ae78655f7a3eda7456b1a0ffaf3e43ec16)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/partition.py | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 18ecec2de9..1347571aa0 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -199,13 +199,14 @@ class Partition():
         Currently handles ext2/3/4, btrfs, vfat and squashfs.
         """
         p_prefix = os.environ.get("PSEUDO_PREFIX", "%s/usr" % native_sysroot)
-        if (pseudo_dir == None):
-            pseudo_dir = "%s/../pseudo" %  rootfs_dir
-        pseudo = "export PSEUDO_PREFIX=%s;" % p_prefix
-        pseudo += "export PSEUDO_LOCALSTATEDIR=%s;" % pseudo_dir
-        pseudo += "export PSEUDO_PASSWD=%s;" % rootfs_dir
-        pseudo += "export PSEUDO_NOSYMLINKEXP=1;"
-        pseudo += "%s " % get_bitbake_var("FAKEROOTCMD")
+        if (pseudo_dir):
+            pseudo = "export PSEUDO_PREFIX=%s;" % p_prefix
+            pseudo += "export PSEUDO_LOCALSTATEDIR=%s;" % pseudo_dir
+            pseudo += "export PSEUDO_PASSWD=%s;" % rootfs_dir
+            pseudo += "export PSEUDO_NOSYMLINKEXP=1;"
+            pseudo += "%s " % get_bitbake_var("FAKEROOTCMD")
+        else:
+            pseudo = None
 
         rootfs = "%s/rootfs_%s.%s.%s" % (cr_workdir, self.label,
                                          self.lineno, self.fstype)
-- 
2.17.1

