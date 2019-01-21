Return-Path: <jpewhacker@gmail.com>
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193])
	by mail.openembedded.org (Postfix) with ESMTP id AC0BB6B7C2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2019 22:39:40 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id i6so15839392oia.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2019 14:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=SIlOD2L5Hg7YvsZwmbw+PpYfSMUTgVDUC7FphUz7lNw=;
	b=u1AU698iVrigXHuy4fCafuIUFk87dwf6dgVyDgwb7ZhgR2jHC03551IekM/GfVEXOZ
	gXGjzbOqBQ0L7mMMljZD53COJFn1npdFLD5b1a0H1df8fSlQUZU9quBoWst8oqQGN/1j
	Am/xpv6YZGDadpboNJf/NCyBbl2K6kkhHIN9Vw48V3aCnAPZdT8iA/Pxbf9E+a2waS1x
	kvq5heErKvQcOXp5ZHTYYGSPH1iUEiy5Nac/aa1OeVoSpb/WpgzlD89644ygmqEVgsg2
	opYK//JUGVHUO6hpIoSXL5x0/9YXNIe4dSnM1lxmjcB75Wp8sS81C55O7MStke1TYyhn
	wm/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SIlOD2L5Hg7YvsZwmbw+PpYfSMUTgVDUC7FphUz7lNw=;
	b=MRLJ/567tyZYtw1gYlNtIMXhhSK+vgxCiVGNmKasvfrgnhJu4CjRFe15nv+JBr7lBg
	kfK603JPQc7RELYvtN6b3OzCysYcDhw6q0GvaTNHmv7PLWnGCCiS9AzrkxZkPoO7+khu
	DjlM61rKGIup1Kc/g6qm7+g6xnHaG+mEDq1y3T6pYFCVWcPRavASVmraMZAd7aI7HCSS
	+gGWT/6himSn3/z+d3rjLcHcEIuLgqpzbuiuBOJV0YsuBvdV+M1KipU2UFQmlykOkybx
	9AD7C6g5z2S1dQfCFtvA4CFRFR60p5tn4rBMjcU84wH+JwI8JQOo75QxJrC0m2ccxnbW
	6+8g==
X-Gm-Message-State: AJcUukfn77pD5XOAjNeD6XbKnnrtyBgyF0hKeIbEfkAqWo0TEd7zgBl5
	YnBpzub4hI+yVwAR/WZN4vCd6abO1VE=
X-Google-Smtp-Source: ALg8bN6WSsQ+DIYKd9MJAqHgZlXcHwPoBY1lLJj25yrHH3B1qnP/rz3S7SNV7oE+4tDYAf4oOJAACw==
X-Received: by 2002:aca:ed92:: with SMTP id l140mr6435362oih.112.1548110381061;
	Mon, 21 Jan 2019 14:39:41 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	v141sm6599895oia.25.2019.01.21.14.39.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 21 Jan 2019 14:39:40 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jan 2019 16:39:19 -0600
Message-Id: <20190121223919.22462-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190115193950.25538-1-JPEWhacker@gmail.com>
References: <20190115193950.25538-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Cc: peter.kjellerstedt@axis.com
Subject: [PATCH v2] classes/sstate: Update output hash
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
X-List-Received-Date: Mon, 21 Jan 2019 22:39:40 -0000
Content-Transfer-Encoding: 8bit

Updates the output hash calculation for determining if tasks are
equivalent. The new algorithm does the following based on feedback:
 1) The output hash function was moved to the OE library.
 2) All files are printed in a single line tabular format
 3) Prints the file type and mode in a user-friendly ls-like format
 4) Includes the file owner and group (by name, not ID). These are only
    included if the task is run under pseudo since that is the only time
    they can be consistently determined.
 5) File size is included for regular files

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/sstate.bbclass |  65 +----------------
 meta/lib/oe/sstatesig.py    | 139 +++++++++++++++++++++++++++++++++++-
 2 files changed, 139 insertions(+), 65 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 763fce07f95..2f0bbd2d7df 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -83,9 +83,9 @@ SSTATE_SIG_PASSPHRASE ?= ""
 # Whether to verify the GnUPG signatures when extracting sstate archives
 SSTATE_VERIFY_SIG ?= "0"
 
-SSTATE_HASHEQUIV_METHOD ?= "OEOuthashBasic"
-SSTATE_HASHEQUIV_METHOD[doc] = "The function used to calculate the output hash \
-    for a task, which in turn is used to determine equivalency. \
+SSTATE_HASHEQUIV_METHOD ?= "oe.sstatesig.OEOuthashBasic"
+SSTATE_HASHEQUIV_METHOD[doc] = "The fully-qualified function used to calculate \
+    the output hash for a task, which in turn is used to determine equivalency. \
     "
 
 SSTATE_HASHEQUIV_SERVER ?= ""
@@ -782,65 +782,6 @@ python sstate_sign_package () {
                            d.getVar('SSTATE_SIG_PASSPHRASE'), armor=False)
 }
 
-def OEOuthashBasic(path, sigfile, task, d):
-    import hashlib
-    import stat
-
-    def update_hash(s):
-        s = s.encode('utf-8')
-        h.update(s)
-        if sigfile:
-            sigfile.write(s)
-
-    h = hashlib.sha256()
-    prev_dir = os.getcwd()
-
-    try:
-        os.chdir(path)
-
-        update_hash("OEOuthashBasic\n")
-
-        # It is only currently useful to get equivalent hashes for things that
-        # can be restored from sstate. Since the sstate object is named using
-        # SSTATE_PKGSPEC and the task name, those should be included in the
-        # output hash calculation.
-        update_hash("SSTATE_PKGSPEC=%s\n" % d.getVar('SSTATE_PKGSPEC'))
-        update_hash("task=%s\n" % task)
-
-        for root, dirs, files in os.walk('.', topdown=True):
-            # Sort directories and files to ensure consistent ordering
-            dirs.sort()
-            files.sort()
-
-            for f in files:
-                path = os.path.join(root, f)
-                s = os.lstat(path)
-
-                # Hash file path
-                update_hash(path + '\n')
-
-                # Hash file mode
-                update_hash("\tmode=0x%x\n" % stat.S_IMODE(s.st_mode))
-                update_hash("\ttype=0x%x\n" % stat.S_IFMT(s.st_mode))
-
-                if stat.S_ISBLK(s.st_mode) or stat.S_ISBLK(s.st_mode):
-                    # Hash device major and minor
-                    update_hash("\tdev=%d,%d\n" % (os.major(s.st_rdev), os.minor(s.st_rdev)))
-                elif stat.S_ISLNK(s.st_mode):
-                    # Hash symbolic link
-                    update_hash("\tsymlink=%s\n" % os.readlink(path))
-                else:
-                    fh = hashlib.sha256()
-                    # Hash file contents
-                    with open(path, 'rb') as d:
-                        for chunk in iter(lambda: d.read(4096), b""):
-                            fh.update(chunk)
-                    update_hash("\tdigest=%s\n" % fh.hexdigest())
-    finally:
-        os.chdir(prev_dir)
-
-    return h.hexdigest()
-
 python sstate_report_unihash() {
     report_unihash = getattr(bb.parse.siggen, 'report_unihash', None)
 
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index e0eb87e29f0..a83af519ec1 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -270,7 +270,7 @@ class SignatureGeneratorOEEquivHash(SignatureGeneratorOEBasicHash):
         super().init_rundepcheck(data)
         self.server = data.getVar('SSTATE_HASHEQUIV_SERVER')
         self.method = data.getVar('SSTATE_HASHEQUIV_METHOD')
-        self.unihashes = bb.persist_data.persist('SSTATESIG_UNIHASH_CACHE_v1_' + self.method, data)
+        self.unihashes = bb.persist_data.persist('SSTATESIG_UNIHASH_CACHE_v1_' + self.method.replace('.', '_'), data)
 
     def get_taskdata(self):
         return (self.server, self.method) + super().get_taskdata()
@@ -355,6 +355,7 @@ class SignatureGeneratorOEEquivHash(SignatureGeneratorOEBasicHash):
         import json
         import tempfile
         import base64
+        import importlib
 
         taskhash = d.getVar('BB_TASKHASH')
         unihash = d.getVar('BB_UNIHASH')
@@ -376,11 +377,14 @@ class SignatureGeneratorOEEquivHash(SignatureGeneratorOEBasicHash):
         sigfile_link = "depsig.do_%s" % task
 
         try:
-            call = self.method + '(path, sigfile, task, d)'
             sigfile = open(os.path.join(tempdir, sigfile_name), 'w+b')
+
             locs = {'path': path, 'sigfile': sigfile, 'task': task, 'd': d}
 
-            outhash = bb.utils.better_eval(call, locs)
+            (module, method) = self.method.rsplit('.', 1)
+            locs['method'] = getattr(importlib.import_module(module), method)
+
+            outhash = bb.utils.better_eval('method(path, sigfile, task, d)', locs)
 
             try:
                 url = '%s/v1/equivalent' % self.server
@@ -581,4 +585,133 @@ def find_sstate_manifest(taskdata, taskdata2, taskname, d, multilibcache):
     bb.warn("Manifest %s not found in %s (variant '%s')?" % (manifest, d2.expand(" ".join(pkgarchs)), variant))
     return None, d2
 
+def OEOuthashBasic(path, sigfile, task, d):
+    """
+    Basic output hash function
+
+    Calculates the output hash of a task by hashing all output file metadata,
+    and file contents.
+    """
+    import hashlib
+    import stat
+    import pwd
+    import grp
+
+    def update_hash(s):
+        s = s.encode('utf-8')
+        h.update(s)
+        if sigfile:
+            sigfile.write(s)
+
+    h = hashlib.sha256()
+    prev_dir = os.getcwd()
+    include_owners = os.environ.get('PSEUDO_DISABLED') == '0'
+
+    try:
+        os.chdir(path)
+
+        update_hash("OEOuthashBasic\n")
+
+        # It is only currently useful to get equivalent hashes for things that
+        # can be restored from sstate. Since the sstate object is named using
+        # SSTATE_PKGSPEC and the task name, those should be included in the
+        # output hash calculation.
+        update_hash("SSTATE_PKGSPEC=%s\n" % d.getVar('SSTATE_PKGSPEC'))
+        update_hash("task=%s\n" % task)
+
+        for root, dirs, files in os.walk('.', topdown=True):
+            # Sort directories to ensure consistent ordering when recursing
+            dirs.sort()
+            files.sort()
+
+            def process(path):
+                s = os.lstat(path)
+
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
+
+                add_perm(stat.S_IRGRP, 'r')
+                add_perm(stat.S_IWGRP, 'w')
+                if stat.S_ISGID & s.st_mode:
+                    add_perm(stat.S_IXGRP, 's', 'S')
+                else:
+                    add_perm(stat.S_IXGRP, 'x')
+
+                add_perm(stat.S_IROTH, 'r')
+                add_perm(stat.S_IWOTH, 'w')
+                if stat.S_ISVTX & s.st_mode:
+                    update_hash('t')
+                else:
+                    add_perm(stat.S_IXOTH, 'x')
+
+                if include_owners:
+                    update_hash(" %10s" % pwd.getpwuid(s.st_uid).pw_name)
+                    update_hash(" %10s" % grp.getgrgid(s.st_gid).gr_name)
+
+                update_hash(" ")
+                if stat.S_ISBLK(s.st_mode) or stat.S_ISCHR(s.st_mode):
+                    update_hash("%9s" % ("%d.%d" % (os.major(s.st_rdev), os.minor(s.st_rdev))))
+                else:
+                    update_hash(" " * 9)
+
+                update_hash(" ")
+                if stat.S_ISREG(s.st_mode):
+                    update_hash("%10d" % s.st_size)
+                else:
+                    update_hash(" " * 10)
+
+                update_hash(" ")
+                fh = hashlib.sha256()
+                if stat.S_ISREG(s.st_mode):
+                    # Hash file contents
+                    with open(path, 'rb') as d:
+                        for chunk in iter(lambda: d.read(4096), b""):
+                            fh.update(chunk)
+                    update_hash(fh.hexdigest())
+                else:
+                    update_hash(" " * len(fh.hexdigest()))
+
+                update_hash(" %s" % path)
+
+                if stat.S_ISLNK(s.st_mode):
+                    update_hash(" -> %s" % os.readlink(path))
+
+                update_hash("\n")
+
+            # Process this directory and all its child files
+            process(root)
+            for f in files:
+                if f == 'fixmepath':
+                    continue
+                process(os.path.join(root, f))
+    finally:
+        os.chdir(prev_dir)
+
+    return h.hexdigest()
+
 
-- 
2.20.1


