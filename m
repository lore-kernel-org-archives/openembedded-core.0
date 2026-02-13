Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07345EF48F9
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 08:10:31 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67222.1770970224399595046
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 00:10:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dT5OQi7V;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43770c94dfaso751851f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 00:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770970222; x=1771575022; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9LyTvWypY0QucZHGtp2Lq3hE2ZgRpC4AxgQKiOmpYj8=;
        b=dT5OQi7Verr924YfjvBICmC6TI053OJDd0H/9UBMiJWHhdj15u7Sf3EVXTsE9/s/bC
         xpIfuCMEx2RhOxKp3wqq+H5nC22ie4P5nI+bAmI4+R0RbODXKbjkeqWMgY8gJTEJzSQP
         RjfCCBznQ1tMdL66f/Bv8ZWnSOZP/Mou5O/N8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770970222; x=1771575022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9LyTvWypY0QucZHGtp2Lq3hE2ZgRpC4AxgQKiOmpYj8=;
        b=fA1QVarkCcbCVUTirDsyJLAxBu2UzU8lvXd1sqIDUYB6LYBe+nRDNb6cTi7BDNZmFW
         j4lOSIp2X8tBzpyXByLqTKvAX7Y5tw1En5CEe/MmndedezMAC93g51DhQ3sN4PqgApCW
         iBNqF7cJgSpgqDl/HcVvi3AIYGNrWCeP+mUg2uvd5wDjK7Xon+H/juiCxyEmLE4/Oa4u
         myo7cppCqhBiJRGePXRJT+9XmqAXwZQ0ZJHUrPy1seRM4BJ8wEvOfxrQV7qRWIqQd/dH
         jh9H6SrUOo1qnxZRID3vG5Xy9lUITlOBPc+11mMvvRxKDvIX0cx5rCOVZvCCI0pFTNC8
         pcDQ==
X-Gm-Message-State: AOJu0YyGHOCsxr0/t2n27rYRfAz5LOzT3gTqJmwDHiui4Qu7xs2jsuXG
	9xdUWdoUaGO7qjelWHNUNDmPl/fuiwjhS/FMkljEmnnA3kPu9Sjw5MMOWpIUoxreNg0qEsXPNZL
	eJiQ7
X-Gm-Gg: AZuq6aLjuITc8RoGDxALdNu49qRZlZmFC8ZwwpXG7yaN17KZ2rUivw8bP11/yV13XCU
	E834TNFA30RI0cXPqsCujHFNtpZv/JRjIMG+xVeRjQ8SaXV672K06SgxsVjL1uCqtKywRwANTDm
	hqKNYyooy/dwxoNAx7VWbxDmZVDBuDtkRJbtlndzuPTFWOsrXOzQQxtxivBnnh4QY/h2Z74JVV3
	PWLmSdOiven6XPQy2O/utKJlIdZkZyv8Bhdc7LVc2RcdGjis6RFAutn/22O1d92M44dYjd6dJcG
	t5qTqT2R/GnLcU5Hd/2igKs0vyggB5OS0WuvERTU/3517TkzQ5gFDMRGp9BtCARV9q28uE0SXjp
	g8iY14UFTkHqBbDUx1Hsq9lwxfJgxDLhv71FyTdCFSDmseHde0gAjRxhzlnPXXyjWwtBZWd9HUU
	St/b3pJp+8b2NLT7BJh2tuJ2prKxsd4mPpUL3biNr+Q5VB3zUNzPJb31m2kPUwkYebcMR3cTFUY
	QD78CQWu+taMVmWewcthKb9bCM=
X-Received: by 2002:a05:600c:3145:b0:471:13dd:bae7 with SMTP id 5b1f17b1804b1-48373a74362mr13585955e9.30.1770970222454;
        Fri, 13 Feb 2026 00:10:22 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00d6f202ec534aee64.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:d6f2:2ec:534a:ee64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-437969fd36dsm3590815f8f.0.2026.02.13.00.10.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 00:10:21 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 06/19] wic/engine: fix copying directories into wic image with ext* partition
Date: Fri, 13 Feb 2026 09:08:24 +0100
Message-ID: <41e3865254d0d52b027f4da6ba1061d22589e413.1770968514.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770968514.git.yoann.congal@smile.fr>
References: <cover.1770968514.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 08:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231089

From: Dragomir, Daniel <daniel.dragomir@windriver.com>

wic uses debugfs to write on ext* partitions, but debugfs can only
write to the current working directory and it cannot copy complete
directory trees. Running 'wic ls' on a copied directory show this:
    -l: Ext2 inode is not a directory

Fix this by creating a command list for debugfs (-f parameter) when
recursive parsing the host directory in order to create a similar
directory structure (mkdir) and copy files (write) on each level
into the destination directory from the wic's ext* partition.

Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1ed38aff5f810d064c87aff9cbd310906833b6ba)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/lib/wic/engine.py | 63 ++++++++++++++++++++++++++++++---------
 1 file changed, 49 insertions(+), 14 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index b9e60cbe4eb..9d596be3a72 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -345,29 +345,64 @@ class Disk:
                                                    path))
 
     def copy(self, src, dest):
-        """Copy partition image into wic image."""
-        pnum =  dest.part if isinstance(src, str) else src.part
+        """Copy files or directories to/from the vfat or ext* partition."""
+        pnum = dest.part if isinstance(src, str) else src.part
+        partimg = self._get_part_image(pnum)
 
         if self.partitions[pnum].fstype.startswith('ext'):
-            if isinstance(src, str):
-                cmd = "printf 'cd {}\nwrite {} {}\n' | {} -w {}".\
-                      format(os.path.dirname(dest.path), src, os.path.basename(src),
-                             self.debugfs, self._get_part_image(pnum))
-            else: # copy from wic
-                # run both dump and rdump to support both files and directory
+            if isinstance(src, str): # host to image case
+                if os.path.isdir(src):
+                    base = os.path.abspath(src)
+                    base_parent = os.path.dirname(base)
+                    cmds = []
+                    made = set()
+
+                    for root, dirs, files in os.walk(base):
+                        for fname in files:
+                            host_file = os.path.join(root, fname)
+                            rel = os.path.relpath(host_file, base_parent)
+                            dest_file = os.path.join(dest.path, rel)
+                            dest_dir = os.path.dirname(dest_file)
+
+                            # create dir structure (mkdir -p)
+                            parts = dest_dir.strip('/').split('/')
+                            cur = ''
+                            for p in parts:
+                                cur = cur + '/' + p
+                                if cur not in made:
+                                    cmds.append(f'mkdir "{cur}"')
+                                    made.add(cur)
+
+                            cmds.append(f'write "{host_file}" "{dest_file}"')
+
+                    # write script to a temp file
+                    with tempfile.NamedTemporaryFile(mode='w', delete=False,
+                                                     prefix='wic-debugfs-') as tf:
+                        for line in cmds:
+                            tf.write(line + '\n')
+                        scriptname = tf.name
+
+                    cmd = f"{self.debugfs} -w -f {scriptname} {partimg}"
+
+                else: # single file
+                    cmd = "printf 'cd {}\nwrite {} {}\n' | {} -w {}".\
+                          format(os.path.dirname(dest.path), src,
+                                 os.path.basename(src), self.debugfs, partimg)
+
+            else: # image to host case
                 cmd = "printf 'cd {}\ndump /{} {}\nrdump /{} {}\n' | {} {}".\
                       format(os.path.dirname(src.path), src.path,
-                             dest, src.path, dest, self.debugfs,
-                             self._get_part_image(pnum))
+                             dest, src.path, dest, self.debugfs, partimg)
+
         else: # fat
             if isinstance(src, str):
                 cmd = "{} -i {} -snop {} ::{}".format(self.mcopy,
-                                                  self._get_part_image(pnum),
-                                                  src, dest.path)
+                                                      partimg,
+                                                      src, dest.path)
             else:
                 cmd = "{} -i {} -snop ::{} {}".format(self.mcopy,
-                                                  self._get_part_image(pnum),
-                                                  src.path, dest)
+                                                      partimg,
+                                                      src.path, dest)
 
         exec_cmd(cmd, as_shell=True)
         self._put_part_image(pnum)

