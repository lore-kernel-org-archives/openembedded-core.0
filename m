Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15FD3F357D1
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:33:02 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21459.1771943573264811618
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:32:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WJU17YrB;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-483abed83b6so22420905e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943571; x=1772548371; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/6tN4kYe7+qgnRPYnCb9OtHaD7V4/CuCjon2x3fHfKo=;
        b=WJU17YrB8TwpldBCeu70X+uwur9YrlP5CHp51mXYpsTJlkfS8IoSoBt0NH9HSO3iCz
         8N6nVk71QKvMRGEqXrkbcXPJWjN/I6SKMM8MlJDa64xcrlXqehcbdr4v5uGi29INFKkC
         V94xYLWU+gIPsYsOTj+SK2KgveYlijVn4dnTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943571; x=1772548371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/6tN4kYe7+qgnRPYnCb9OtHaD7V4/CuCjon2x3fHfKo=;
        b=YwZnFe7JRU/hZy11OqQQdpdNWJLT+AReKtc0xcTot5LC1AkkUQEwGgk67lO94T0xEC
         1wP4HMUQJSOrXJT/M4D25doZSfazxh7YlkAWvrLxrfi2Im4NGmBlS+n2puZlKtT+9Ajg
         b18+iWc/JVGIFrXbPNrXLgkx6e2OpX81ESBcD+oIYZvgwXKKYZ5RkSUbmIBdj2lhfqEB
         CWsJ4jP4OZeixVb7W5dyqZpAoNWpTlpeN3LdxA6oCS8ONnDdpEAs6gzLUKID0CmHSi2M
         LUTZN6ggtKy8DUzVknjTax68uTR+MTAOW9ydGgokfu+nCrd8DjU0mbinnBcOSkm42dh1
         Y7RQ==
X-Gm-Message-State: AOJu0Yy6xas1rnu1BRiujgxb2C2B5snGakK/9enweUY97eHoJL49BlLz
	qH21u2HoH7CEyHDiu78SmRy8Sz1pfQ/urMyr0/SIXigZ8kw+mNAelnk+GRnYWMUhS/0olgQJSXY
	u6VV/
X-Gm-Gg: AZuq6aK8IRUJuieizvvXfkvutzehtGZEFrMp6PC8NQURn7rU1uH5DP1HVlVPWs+pQui
	zh211DnGRH7jMoUjLUHt2KhO0gNYD/SZ8N92STmo4b2Cm6Smt5VYsq8k5meCHTvOZq95uJ7GlUG
	sBC/Wx7VHKj5nAp2oZKYgmPStFcTE/3uVC+jC3FV7cwHAxv0pGSbD4FkHT1t5hbBEtJQBA69t3M
	LycgB/HjrYd35CbK+bPKX8NjGzIU21NYSaj9wjBLUpVKoVrFzlwPAQcnKJl7799Xj8PoVitr/R+
	mY1ZVCp/r7EgCFSHvcNqtQfBeIsU0KiKZua5UrCVwuVmb0+fhNfcbNTOukpJ7t4ok1MxlFO800g
	s/Y8++eJtzhNAX5XzJKn9GHjLy8N2cr+I7CllhEWJNkrDyVWpGp4lNSlC6DqcqxcdVowY3pyTxx
	NNz0dCtARxoOiVL9SzatBzX1akGna+vA9NoVvUVqQIBD+qIpa6hWWvucY4h9Li5XhJ0GZfP6T1O
	EdPUOjiBcf0hqkK9b9WBz0u0ITYk23TlQ==
X-Received: by 2002:a05:600c:3e10:b0:480:5951:fc1e with SMTP id 5b1f17b1804b1-483a95bd836mr218789825e9.11.1771943571276;
        Tue, 24 Feb 2026 06:32:51 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.32.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:32:50 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/44] wic/engine: fix copying directories into wic image with ext* partition
Date: Tue, 24 Feb 2026 15:31:37 +0100
Message-ID: <ddf0feb897b04d831b3376834c756c5d625f2c57.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943404.git.yoann.congal@smile.fr>
References: <cover.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:33:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231814

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
index ce7e6c5d752..565a0db38a6 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -327,29 +327,64 @@ class Disk:
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

