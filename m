Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6AC55780AF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 14:49:11 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id f102so42113367ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 07:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XmZGtpHPhluwxCCh0rgKru2yUy2KdR7n80gIApN0NC4=;
	b=BKCoILlwKVEXgroDQ5EngeO+TwUlhQKpCBwM5a0FG5keHfx/VQG+eKQz37bVYES5+N
	aS7ofa6NHeUk3lg1dqVBAMeNTW3AduP72SUpsvRX30vOxW8HYfQFhB6RJPPazPys0DY4
	6vFNENPjGE8GZyrpgKrMK0pD4WY/AyZc1L+UQDRJiAL8nd0VogrgFaRihufe/LfEvc+J
	jfXJdFTkHu1ypap3o6vM0zU8ZyxmwbbM3iF2LbvjQ0YF7r7FnxUy8GksnDDVNQzog2dy
	H48XhA/3usaUDwpRYXHg72pbn5zk5K0gFRqioi6WsTQeNi9Sw7v9prhpqTzNIQlopnQ0
	UyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XmZGtpHPhluwxCCh0rgKru2yUy2KdR7n80gIApN0NC4=;
	b=o4uzsP/jMugZyeGV3AE82tU2frqcbbBuqq3TKS3oYTX4P2vFoxarrs8akGzhg1Ys+5
	hK/JYdUbviFlzSihfcEFCFkfad3GBBqhsFhRG3OVwhs5FXgOQH8hsvw5Yna41G7YdRPd
	W2mbCNmze2YHsRkh2P13A3rCExvAHhLgSsT86p2ns/lir5mWOum0PZZOyUD2Kqw6F8Aw
	3rtRYd75lwCGY9WFcjd7D2lMSoLINnBjbFggQF4Gpakl8p5Vb5Gw4rKvIgrxb358GhkP
	pD5sEL0S23yuvpDDWB2KL7udnhfvqFQuLmZiVhZZfU8MABbZCovfyL8N7XLHSZTBKog0
	8/Hg==
X-Gm-Message-State: AODbwcBfj9M+0AmxLLKJW/jfatA5+O93JTx+SstIlqTC8AZZtQp/ooFd
	lVCJqSIVE/hPzfaNnRI=
X-Received: by 10.107.183.197 with SMTP id h188mr15315309iof.105.1496069352078;
	Mon, 29 May 2017 07:49:12 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FCB8.dip0.t-ipconnect.de.
	[93.232.252.184]) by smtp.gmail.com with ESMTPSA id
	i28sm4239431ioo.54.2017.05.29.07.49.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 29 May 2017 07:49:11 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 May 2017 16:49:03 +0200
Message-Id: <c826a1fded7a4f22a26cb12273c6dc2a7600d0fb.1496069310.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.6a3be6133a9172fdd3e435528c8d98c4be1d9dd1.1496069310.git-series.patrick.ohly@intel.com>
References: <cover.6a3be6133a9172fdd3e435528c8d98c4be1d9dd1.1496069310.git-series.patrick.ohly@intel.com>
Subject: [PATCH 1/1] bblayers sanity: bblayers.conf.sample specific update code
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
X-List-Received-Date: Mon, 29 May 2017 14:49:11 -0000

The code in sanity.bbclass was executed for all distros, regardless
whether they use the same numbering of bblayers.conf.sample as
OE-core.

This is problematic for distros which started at LCONF_VERSION=1: once
they reach the 5 to 7 (inclusive) number range, the code from
sanity.bbclass kicks in and automatically updates the version to that
number without actually changing anything else in bblayers.conf, which
leaves the developer out-of-sync with bblayers.conf.sample.

Now the code is in a Python module that gets placed alongside the
bblayers.conf.sample to which it belongs. Besides avoiding the problem
above, this also allows distros to write their own update code.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/sanity.bbclass               | 121 ++++-------------------
 meta/conf/lib/bblayers_update/__init__.py | 104 ++++++++++++++++++++-
 2 files changed, 130 insertions(+), 95 deletions(-)
 create mode 100644 meta/conf/lib/bblayers_update/__init__.py

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index e8064ac..5cc0d14 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -5,26 +5,6 @@
 SANITY_REQUIRED_UTILITIES ?= "patch diffstat makeinfo git bzip2 tar \
     gzip gawk chrpath wget cpio perl file which"
 
-def bblayers_conf_file(d):
-    return os.path.join(d.getVar('TOPDIR'), 'conf/bblayers.conf')
-
-def sanity_conf_read(fn):
-    with open(fn, 'r') as f:
-        lines = f.readlines()
-    return lines
-
-def sanity_conf_find_line(pattern, lines):
-    import re
-    return next(((index, line)
-        for index, line in enumerate(lines)
-        if re.search(pattern, line)), (None, None))
-
-def sanity_conf_update(fn, lines, version_var_name, new_version):
-    index, line = sanity_conf_find_line(r"^%s" % version_var_name, lines)
-    lines[index] = '%s = "%d"\n' % (version_var_name, new_version)
-    with open(fn, "w") as f:
-        f.write(''.join(lines))
-
 # Functions added to this variable MUST throw a NotImplementedError exception unless 
 # they successfully changed the config version in the config file. Exceptions
 # are used since exec_func doesn't handle return values.
@@ -76,7 +56,12 @@ is a good way to visualise the changes."""
     raise NotImplementedError(failmsg)
 }
 
+# Distros may have their own bblayers.conf.sample and corresponding
+# update code. The update code must be provided in a sanity_update_bblayers()
+# function in a "lib/bblayers-update" module which must be
+# in the same directory as the bblayers.conf.sample.
 SANITY_BBLAYERCONF_SAMPLE ?= "${COREBASE}/meta*/conf/bblayers.conf.sample"
+
 python oecore_update_bblayers() {
     # bblayers.conf is out of date, so see if we can resolve that
 
@@ -90,83 +75,29 @@ Please compare your file against bblayers.conf.sample and merge any changes befo
 is a good way to visualise the changes."""
     failmsg = d.expand(failmsg)
 
-    if not current_lconf:
+    import glob
+    samples = glob.glob(d.getVar('SANITY_BBLAYERCONF_SAMPLE'))
+    if len(samples) != 1:
+        # Ambiguous bblayers.conf.sample, must be dealt with manually.
+        # Should be avoided by overriding SANITY_BBLAYERCONF_SAMPLE.
         raise NotImplementedError(failmsg)
 
-    lines = []
-
-    if current_lconf < 4:
-        raise NotImplementedError(failmsg)
-
-    bblayers_fn = bblayers_conf_file(d)
-    lines = sanity_conf_read(bblayers_fn)
-
-    if current_lconf == 4 and lconf_version > 4:
-        topdir_var = '$' + '{TOPDIR}'
-        index, bbpath_line = sanity_conf_find_line('BBPATH', lines)
-        if bbpath_line:
-            start = bbpath_line.find('"')
-            if start != -1 and (len(bbpath_line) != (start + 1)):
-                if bbpath_line[start + 1] == '"':
-                    lines[index] = (bbpath_line[:start + 1] +
-                                    topdir_var + bbpath_line[start + 1:])
-                else:
-                    if not topdir_var in bbpath_line:
-                        lines[index] = (bbpath_line[:start + 1] +
-                                    topdir_var + ':' + bbpath_line[start + 1:])
-            else:
-                raise NotImplementedError(failmsg)
-        else:
-            index, bbfiles_line = sanity_conf_find_line('BBFILES', lines)
-            if bbfiles_line:
-                lines.insert(index, 'BBPATH = "' + topdir_var + '"\n')
-            else:
-                raise NotImplementedError(failmsg)
-
-        current_lconf += 1
-        sanity_conf_update(bblayers_fn, lines, 'LCONF_VERSION', current_lconf)
-        bb.note("Your conf/bblayers.conf has been automatically updated.")
-        return
-
-    elif current_lconf == 5 and lconf_version > 5:
-        # Null update, to avoid issues with people switching between poky and other distros
-        current_lconf = 6
-        sanity_conf_update(bblayers_fn, lines, 'LCONF_VERSION', current_lconf)
-        bb.note("Your conf/bblayers.conf has been automatically updated.")
-        return
-
-        status.addresult()
-
-    elif current_lconf == 6 and lconf_version > 6:
-        # Handle rename of meta-yocto -> meta-poky
-        # This marks the start of separate version numbers but code is needed in OE-Core
-        # for the migration, one last time.
-        layers = d.getVar('BBLAYERS').split()
-        layers = [ os.path.basename(path) for path in layers ]
-        if 'meta-yocto' in layers:
-            found = False
-            while True:
-                index, meta_yocto_line = sanity_conf_find_line(r'.*meta-yocto[\'"\s\n]', lines)
-                if meta_yocto_line:
-                    lines[index] = meta_yocto_line.replace('meta-yocto', 'meta-poky')
-                    found = True
-                else:
-                    break
-            if not found:
-                raise NotImplementedError(failmsg)
-            index, meta_yocto_line = sanity_conf_find_line('LCONF_VERSION.*\n', lines)
-            if meta_yocto_line:
-                lines[index] = 'POKY_BBLAYERS_CONF_VERSION = "1"\n'
-            else:
-                raise NotImplementedError(failmsg)
-            with open(bblayers_fn, "w") as f:
-                f.write(''.join(lines))
-            bb.note("Your conf/bblayers.conf has been automatically updated.")
-            return
-        current_lconf += 1
-        sanity_conf_update(bblayers_fn, lines, 'LCONF_VERSION', current_lconf)
-        bb.note("Your conf/bblayers.conf has been automatically updated.")
-        return
+    # Is there matching update code for the bblayers.conf.sample?
+    libdir = os.path.join(os.path.dirname(samples[0]), 'lib')
+    moduledir = os.path.join(libdir, 'bblayers_update')
+    if os.path.exists(moduledir):
+        old_path = sys.path.copy()
+        try:
+            sys.path.insert(0, libdir)
+            try:
+                from bblayers_update import sanity_update_bblayers
+            except:
+                bb.warn('Importing sanity_update_bblayers from %s failed.' % moduledir)
+                raise
+            if sanity_update_bblayers(d, failmsg):
+                return True
+        finally:
+            sys.path = old_path
 
     raise NotImplementedError(failmsg)
 }
diff --git a/meta/conf/lib/bblayers_update/__init__.py b/meta/conf/lib/bblayers_update/__init__.py
new file mode 100644
index 0000000..bd6693c
--- /dev/null
+++ b/meta/conf/lib/bblayers_update/__init__.py
@@ -0,0 +1,104 @@
+import bb
+
+def bblayers_conf_file(d):
+    return os.path.join(d.getVar('TOPDIR'), 'conf/bblayers.conf')
+
+def sanity_conf_read(fn):
+    with open(fn, 'r') as f:
+        lines = f.readlines()
+    return lines
+
+def sanity_conf_find_line(pattern, lines):
+    import re
+    return next(((index, line)
+        for index, line in enumerate(lines)
+        if re.search(pattern, line)), (None, None))
+
+def sanity_conf_update(fn, lines, version_var_name, new_version):
+    index, line = sanity_conf_find_line(r"^%s" % version_var_name, lines)
+    lines[index] = '%s = "%d"\n' % (version_var_name, new_version)
+    with open(fn, "w") as f:
+        f.write(''.join(lines))
+
+def sanity_update_bblayers(d, failmsg):
+    current_lconf = int(d.getVar('LCONF_VERSION'))
+    lconf_version = int(d.getVar('LAYER_CONF_VERSION'))
+
+    if not current_lconf:
+        return False
+
+    lines = []
+
+    if current_lconf < 4:
+        return False
+
+    bblayers_fn = bblayers_conf_file(d)
+    lines = sanity_conf_read(bblayers_fn)
+
+    if current_lconf == 4 and lconf_version > 4:
+        topdir_var = '$' + '{TOPDIR}'
+        index, bbpath_line = sanity_conf_find_line('BBPATH', lines)
+        if bbpath_line:
+            start = bbpath_line.find('"')
+            if start != -1 and (len(bbpath_line) != (start + 1)):
+                if bbpath_line[start + 1] == '"':
+                    lines[index] = (bbpath_line[:start + 1] +
+                                    topdir_var + bbpath_line[start + 1:])
+                else:
+                    if not topdir_var in bbpath_line:
+                        lines[index] = (bbpath_line[:start + 1] +
+                                    topdir_var + ':' + bbpath_line[start + 1:])
+            else:
+                return False
+        else:
+            index, bbfiles_line = sanity_conf_find_line('BBFILES', lines)
+            if bbfiles_line:
+                lines.insert(index, 'BBPATH = "' + topdir_var + '"\n')
+            else:
+                return False
+
+        current_lconf += 1
+        sanity_conf_update(bblayers_fn, lines, 'LCONF_VERSION', current_lconf)
+        bb.note("Your conf/bblayers.conf has been automatically updated.")
+        return True
+
+    elif current_lconf == 5 and lconf_version > 5:
+        # Null update, to avoid issues with people switching between poky and other distros
+        current_lconf = 6
+        sanity_conf_update(bblayers_fn, lines, 'LCONF_VERSION', current_lconf)
+        bb.note("Your conf/bblayers.conf has been automatically updated.")
+        return True
+
+        status.addresult()
+
+    elif current_lconf == 6 and lconf_version > 6:
+        # Handle rename of meta-yocto -> meta-poky
+        # This marks the start of separate version numbers but code is needed in OE-Core
+        # for the migration, one last time.
+        layers = d.getVar('BBLAYERS').split()
+        layers = [ os.path.basename(path) for path in layers ]
+        if 'meta-yocto' in layers:
+            found = False
+            while True:
+                index, meta_yocto_line = sanity_conf_find_line(r'.*meta-yocto[\'"\s\n]', lines)
+                if meta_yocto_line:
+                    lines[index] = meta_yocto_line.replace('meta-yocto', 'meta-poky')
+                    found = True
+                else:
+                    break
+            if not found:
+                return False
+            index, meta_yocto_line = sanity_conf_find_line('LCONF_VERSION.*\n', lines)
+            if meta_yocto_line:
+                lines[index] = 'POKY_BBLAYERS_CONF_VERSION = "1"\n'
+            else:
+                return False
+            with open(bblayers_fn, "w") as f:
+                f.write(''.join(lines))
+            bb.note("Your conf/bblayers.conf has been automatically updated.")
+            return True
+        current_lconf += 1
+        sanity_conf_update(bblayers_fn, lines, 'LCONF_VERSION', current_lconf)
+        d.setVar('LCONF_VERSION', current_lconf)
+        bb.note("Your conf/bblayers.conf has been automatically updated.")
+        return True
-- 
git-series 0.9.1

