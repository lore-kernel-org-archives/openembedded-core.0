Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 30E987C083
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 19:40:17 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id m8so1881419itk.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 11:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VPor8eJwaZFNI7mmx9/gLKUl/WWZxyd/ANixcf+0d7Y=;
	b=HZ+gjGPXa4Ybuw5LLQ+Fe28+hJZZUwvF1ZxUtKVLHTRGPd60Z2wciBk7shqzDzSaVP
	vG8FyeM/JLRQEPvfarzceHVO/vYWEhHd3BZZHnxcQ7Diohd6BCcgtBn+eqkNty5Zla/J
	NvbCvMJ3TZmxdD61Rx/NGHvgwrTaNdc+hoA/Cd1S63anCq3w+96ThVvMV/Tr+BY7Tjxu
	hZgi3/5sjFt/Byv1Gh8yJSoSBc8ReR4szu/Qi4DwsOXOY3xdOCEWkWK7/12n/O7qx8De
	M/OJObae3lCjwrff1wAuxDY41XjZzW48DMxA5bWn+XgNeRo5+gUqXOPmgikgr/zuhwdd
	ubeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VPor8eJwaZFNI7mmx9/gLKUl/WWZxyd/ANixcf+0d7Y=;
	b=HgfOSwmHxr1Azsystl68UckA6zzALdj3mX64Ys82VdfeRrLb2gPOp/rfGs4lGNwTrT
	yf/o2vIJ5jH/L4giavlZKuHMjoWTTBNHFd7ik71W8JPyiaZVAXuQArqzfH9I95xCoGMp
	vv+3WnTYEW49s+JSjO7lae3oioqjrYiaO62r4FB6ljBZiYRnfG3rbrcxYD6aiZCBaepH
	S7I1gqcphK8jr4qP2JxO61uvmBrobdsRxEQa6nz2JPfA79WNADhwk/OTxKQ/w4T+h7qJ
	OuPHeurxNECwOsDnyZjgXUz/ySg4dCYdtjhCCkwnN/CcQbo7mQrvSsd/TYYLLFLdyIbC
	2tkQ==
X-Gm-Message-State: AJcUuke/hr3HhxSi6EQigBy2zc5GFwJ+mCo0Zl7+5S12tZdIVN+3TC74
	luVANBnpwrjWXihIfNeLzdPmWjCawiY=
X-Google-Smtp-Source: ALg8bN4dBt0BNDTFYAaLQeFsCx4esiynmsLrPs5fUQ2CkQA15RqHq0sxgVBhKZNlqLXG8Pwt6+JJnQ==
X-Received: by 2002:a02:183:: with SMTP id 3mr3169175jak.130.1547581217776;
	Tue, 15 Jan 2019 11:40:17 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	d199sm2333246itd.31.2019.01.15.11.40.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 15 Jan 2019 11:40:16 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 13:39:50 -0600
Message-Id: <20190115193950.25538-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: [PATCH] classes/sstate: Update output hash
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Jan 2019 19:40:17 -0000
Content-Transfer-Encoding: 8bit

Updates the output hash calculation for determining if tasks are
equivalent. The new algorithm does the following based on feedback:
 1) All files are printed in a single line tabular format
 2) Prints the file type and mode in a user-friendly ls-like format
 3) Includes the file owner and group (by name, not ID). These are only
    included if the task is run under pseudo, since that is the only
    time they can be consistently determined.
 4) File size is included for regular files

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/sstate.bbclass | 91 +++++++++++++++++++++++++++++++------
 1 file changed, 76 insertions(+), 15 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 482ffa83f98..a103a759825 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -784,6 +784,8 @@ python sstate_sign_package () {
 def OEOuthashBasic(path, sigfile, task, d):
     import hashlib
     import stat
+    import pwd
+    import grp
 
     def update_hash(s):
         s = s.encode('utf-8')
@@ -793,6 +795,7 @@ def OEOuthashBasic(path, sigfile, task, d):
 
     h = hashlib.sha256()
     prev_dir = os.getcwd()
+    include_owners = os.environ.get('PSEUDO_DISABLED') == '0'
 
     try:
         os.chdir(path)
@@ -807,34 +810,92 @@ def OEOuthashBasic(path, sigfile, task, d):
         update_hash("task=%s\n" % task)
 
         for root, dirs, files in os.walk('.', topdown=True):
-            # Sort directories and files to ensure consistent ordering
+            # Sort directories to ensure consistent ordering when recursing
             dirs.sort()
             files.sort()
 
-            for f in files:
-                path = os.path.join(root, f)
+            def process(path):
                 s = os.lstat(path)
 
-                # Hash file path
-                update_hash(path + '\n')
+                if stat.S_ISDIR(s.st_mode):
+                    update_hash('d')
+                elif stat.S_ISCHR(s.st_mode):
+                    update_hash('c')
+                elif stat.S_ISBLK(s.st_mode):
+                    update_hash('b')
+                elif stat.S_ISSOCK(s.st_mode):
+                    update_hash('s')
+                elif stat.S_ISLNK(s.st_mode):
+                    update_hash('l')
+                elif stat.S_ISFIFO(s.st_mode):
+                    update_hash('p')
+                else:
+                    update_hash('-')
+
+                def add_perm(mask, on, off='-'):
+                    if mask & s.st_mode:
+                        update_hash(on)
+                    else:
+                        update_hash(off)
+
+                add_perm(stat.S_IRUSR, 'r')
+                add_perm(stat.S_IWUSR, 'w')
+                if stat.S_ISUID & s.st_mode:
+                    add_perm(stat.S_IXUSR, 's', 'S')
+                else:
+                    add_perm(stat.S_IXUSR, 'x')
 
-                # Hash file mode
-                update_hash("\tmode=0x%x\n" % stat.S_IMODE(s.st_mode))
-                update_hash("\ttype=0x%x\n" % stat.S_IFMT(s.st_mode))
+                add_perm(stat.S_IRGRP, 'r')
+                add_perm(stat.S_IWGRP, 'w')
+                if stat.S_ISGID & s.st_mode:
+                    add_perm(stat.S_IXGRP, 's', 'S')
+                else:
+                    add_perm(stat.S_IXGRP, 'x')
 
-                if stat.S_ISBLK(s.st_mode) or stat.S_ISBLK(s.st_mode):
-                    # Hash device major and minor
-                    update_hash("\tdev=%d,%d\n" % (os.major(s.st_rdev), os.minor(s.st_rdev)))
-                elif stat.S_ISLNK(s.st_mode):
-                    # Hash symbolic link
-                    update_hash("\tsymlink=%s\n" % os.readlink(path))
+                add_perm(stat.S_IROTH, 'r')
+                add_perm(stat.S_IWOTH, 'w')
+                if stat.S_ISVTX & s.st_mode:
+                    update_hash('t')
+                else:
+                    add_perm(stat.S_IXOTH, 'x')
+
+                if include_owners:
+                    #update_hash(" %5d" % s.st_uid)
+                    #update_hash(" %5d" % s.st_gid)
+                    update_hash(" %10s" % pwd.getpwuid(s.st_uid).pw_name)
+                    update_hash(" %10s" % grp.getgrgid(s.st_gid).gr_name)
+
+                if stat.S_ISBLK(s.st_mode) or stat.S_ISCHR(s.st_mode):
+                    update_hash(" %9s" % ("%d.%d" % (os.major(s.st_rdev), os.minor(s.st_rdev))))
                 else:
+                    update_hash(" " * 10)
+
+                if stat.S_ISREG(s.st_mode):
+                    update_hash(" %10d" % s.st_size)
+                else:
+                    update_hash(" " * 11)
+
+                update_hash(" %s" % path)
+
+                if stat.S_ISLNK(s.st_mode):
+                    update_hash(" -> %s" % os.readlink(path))
+
+                if stat.S_ISREG(s.st_mode):
                     fh = hashlib.sha256()
                     # Hash file contents
                     with open(path, 'rb') as d:
                         for chunk in iter(lambda: d.read(4096), b""):
                             fh.update(chunk)
-                    update_hash("\tdigest=%s\n" % fh.hexdigest())
+                    update_hash(" %s" % fh.hexdigest())
+
+                update_hash("\n")
+
+            # Process this directory and all its child files
+            process(root)
+            for f in files:
+                if f == 'fixmepath':
+                    continue
+                process(os.path.join(root, f))
     finally:
         os.chdir(prev_dir)
 
-- 
2.20.1


