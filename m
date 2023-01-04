Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E1CBC54EF0
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 15:47:24 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.15526.1672847238412947408
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 07:47:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y6HRHEg9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id d4so25441610wrw.6
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 07:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UW51WbzVfAhGWGA4Tgcjqke+4Xb/iVHosWMWga/AoC0=;
        b=Y6HRHEg9nm7RfwGcKtn9WF6LcjnoXzXXi9LTC2vtzXG3RITPk5W7xJpGY8oMtd4+JU
         siria8EDA9RXqAGYwv2q6HhTqucfxHLFIuW2T4DKDN53bLskokqk6r/ItLjsQ+EiuJnI
         idJ8Svee2aUvM6TWLUx4iI+laUE409aUrsTSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UW51WbzVfAhGWGA4Tgcjqke+4Xb/iVHosWMWga/AoC0=;
        b=bwJP6LFkB2TulpnlXuq2gW3bxK6QFGX4PQxhEMMTI0OgIMd0/pD7rRso2FnJeptG2P
         v7qXAEyBlOn6XM7gc6LV5z3oL/sXBLW8wazxgQ0Y8tyKqmkcQnKL62LZx+701nfRCqqe
         PF+8sDkRM41Hjwm1zT8eAYEwVCjVu2WW+xGwybC4ylBb3rn6d4Bjdec7IiohSmQyF0J7
         k4mOfRlYLEUewLXS5oDozUX3JFdFjtfcoNiDgpFrvedr9JSGvtpwLLapg0Ov477JLSHm
         RwYL4UEs8+q2qdsQHVxm5aPHWzwjwTf/SrlJVluMhVywosQNsBay0yLQ/980+lNtAyFL
         0oxA==
X-Gm-Message-State: AFqh2kqV7+soBEjP36dtaq6uvpT6dpXPsOl7FkinpNnhUBVVFh/qNzZO
	iiwesea3+3GVwwnlsQi5YhOPLc+Tx+nGSaEs
X-Google-Smtp-Source: AMrXdXvZu1UfS1Ves/41lfbqdrM3Xy+IuPtryeIxyhHfkKtIez0IbTL6JGJFsyrSmm63EEjZJXzuLQ==
X-Received: by 2002:a5d:6f03:0:b0:28f:31d2:be38 with SMTP id ay3-20020a5d6f03000000b0028f31d2be38mr13766084wrb.43.1672847236109;
        Wed, 04 Jan 2023 07:47:16 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fcc2:4e85:26d2:6527])
        by smtp.gmail.com with ESMTPSA id u3-20020adff883000000b002423edd7e50sm34812560wrp.32.2023.01.04.07.47.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 07:47:15 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/10] package: Move fixup_perms function to bb function library
Date: Wed,  4 Jan 2023 15:47:05 +0000
Message-Id: <20230104154714.1168535-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 15:47:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175490

To avoid reparsing the bbclass code all the time, move the function
to the python function library code which is more efficient.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/package.bbclass | 238 +--------------------------
 meta/lib/oe/package.py              | 242 ++++++++++++++++++++++++++++
 2 files changed, 243 insertions(+), 237 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index 7a0a428b304..29f0c80abdc 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -861,244 +861,8 @@ python perform_packagecopy () {
 perform_packagecopy[cleandirs] = "${PKGD}"
 perform_packagecopy[dirs] = "${PKGD}"
 
-# We generate a master list of directories to process, we start by
-# seeding this list with reasonable defaults, then load from
-# the fs-perms.txt files
 python fixup_perms () {
-    import pwd, grp
-
-    # init using a string with the same format as a line as documented in
-    # the fs-perms.txt file
-    # <path> <mode> <uid> <gid> <walk> <fmode> <fuid> <fgid>
-    # <path> link <link target>
-    #
-    # __str__ can be used to print out an entry in the input format
-    #
-    # if fs_perms_entry.path is None:
-    #    an error occurred
-    # if fs_perms_entry.link, you can retrieve:
-    #    fs_perms_entry.path = path
-    #    fs_perms_entry.link = target of link
-    # if not fs_perms_entry.link, you can retrieve:
-    #    fs_perms_entry.path = path
-    #    fs_perms_entry.mode = expected dir mode or None
-    #    fs_perms_entry.uid = expected uid or -1
-    #    fs_perms_entry.gid = expected gid or -1
-    #    fs_perms_entry.walk = 'true' or something else
-    #    fs_perms_entry.fmode = expected file mode or None
-    #    fs_perms_entry.fuid = expected file uid or -1
-    #    fs_perms_entry_fgid = expected file gid or -1
-    class fs_perms_entry():
-        def __init__(self, line):
-            lsplit = line.split()
-            if len(lsplit) == 3 and lsplit[1].lower() == "link":
-                self._setlink(lsplit[0], lsplit[2])
-            elif len(lsplit) == 8:
-                self._setdir(lsplit[0], lsplit[1], lsplit[2], lsplit[3], lsplit[4], lsplit[5], lsplit[6], lsplit[7])
-            else:
-                msg = "Fixup Perms: invalid config line %s" % line
-                oe.qa.handle_error("perm-config", msg, d)
-                self.path = None
-                self.link = None
-
-        def _setdir(self, path, mode, uid, gid, walk, fmode, fuid, fgid):
-            self.path = os.path.normpath(path)
-            self.link = None
-            self.mode = self._procmode(mode)
-            self.uid  = self._procuid(uid)
-            self.gid  = self._procgid(gid)
-            self.walk = walk.lower()
-            self.fmode = self._procmode(fmode)
-            self.fuid = self._procuid(fuid)
-            self.fgid = self._procgid(fgid)
-
-        def _setlink(self, path, link):
-            self.path = os.path.normpath(path)
-            self.link = link
-
-        def _procmode(self, mode):
-            if not mode or (mode and mode == "-"):
-                return None
-            else:
-                return int(mode,8)
-
-        # Note uid/gid -1 has special significance in os.lchown
-        def _procuid(self, uid):
-            if uid is None or uid == "-":
-                return -1
-            elif uid.isdigit():
-                return int(uid)
-            else:
-                return pwd.getpwnam(uid).pw_uid
-
-        def _procgid(self, gid):
-            if gid is None or gid == "-":
-                return -1
-            elif gid.isdigit():
-                return int(gid)
-            else:
-                return grp.getgrnam(gid).gr_gid
-
-        # Use for debugging the entries
-        def __str__(self):
-            if self.link:
-                return "%s link %s" % (self.path, self.link)
-            else:
-                mode = "-"
-                if self.mode:
-                    mode = "0%o" % self.mode
-                fmode = "-"
-                if self.fmode:
-                    fmode = "0%o" % self.fmode
-                uid = self._mapugid(self.uid)
-                gid = self._mapugid(self.gid)
-                fuid = self._mapugid(self.fuid)
-                fgid = self._mapugid(self.fgid)
-                return "%s %s %s %s %s %s %s %s" % (self.path, mode, uid, gid, self.walk, fmode, fuid, fgid)
-
-        def _mapugid(self, id):
-            if id is None or id == -1:
-                return "-"
-            else:
-                return "%d" % id
-
-    # Fix the permission, owner and group of path
-    def fix_perms(path, mode, uid, gid, dir):
-        if mode and not os.path.islink(path):
-            #bb.note("Fixup Perms: chmod 0%o %s" % (mode, dir))
-            os.chmod(path, mode)
-        # -1 is a special value that means don't change the uid/gid
-        # if they are BOTH -1, don't bother to lchown
-        if not (uid == -1 and gid == -1):
-            #bb.note("Fixup Perms: lchown %d:%d %s" % (uid, gid, dir))
-            os.lchown(path, uid, gid)
-
-    # Return a list of configuration files based on either the default
-    # files/fs-perms.txt or the contents of FILESYSTEM_PERMS_TABLES
-    # paths are resolved via BBPATH
-    def get_fs_perms_list(d):
-        str = ""
-        bbpath = d.getVar('BBPATH')
-        fs_perms_tables = d.getVar('FILESYSTEM_PERMS_TABLES') or ""
-        for conf_file in fs_perms_tables.split():
-            confpath = bb.utils.which(bbpath, conf_file)
-            if confpath:
-                str += " %s" % bb.utils.which(bbpath, conf_file)
-            else:
-                bb.warn("cannot find %s specified in FILESYSTEM_PERMS_TABLES" % conf_file)
-        return str
-
-
-
-    dvar = d.getVar('PKGD')
-
-    fs_perms_table = {}
-    fs_link_table = {}
-
-    # By default all of the standard directories specified in
-    # bitbake.conf will get 0755 root:root.
-    target_path_vars = [    'base_prefix',
-                'prefix',
-                'exec_prefix',
-                'base_bindir',
-                'base_sbindir',
-                'base_libdir',
-                'datadir',
-                'sysconfdir',
-                'servicedir',
-                'sharedstatedir',
-                'localstatedir',
-                'infodir',
-                'mandir',
-                'docdir',
-                'bindir',
-                'sbindir',
-                'libexecdir',
-                'libdir',
-                'includedir',
-                'oldincludedir' ]
-
-    for path in target_path_vars:
-        dir = d.getVar(path) or ""
-        if dir == "":
-            continue
-        fs_perms_table[dir] = fs_perms_entry(d.expand("%s 0755 root root false - - -" % (dir)))
-
-    # Now we actually load from the configuration files
-    for conf in get_fs_perms_list(d).split():
-        if not os.path.exists(conf):
-            continue
-        with open(conf) as f:
-            for line in f:
-                if line.startswith('#'):
-                    continue
-                lsplit = line.split()
-                if len(lsplit) == 0:
-                    continue
-                if len(lsplit) != 8 and not (len(lsplit) == 3 and lsplit[1].lower() == "link"):
-                    msg = "Fixup perms: %s invalid line: %s" % (conf, line)
-                    oe.qa.handle_error("perm-line", msg, d)
-                    continue
-                entry = fs_perms_entry(d.expand(line))
-                if entry and entry.path:
-                    if entry.link:
-                        fs_link_table[entry.path] = entry
-                        if entry.path in fs_perms_table:
-                            fs_perms_table.pop(entry.path)
-                    else:
-                        fs_perms_table[entry.path] = entry
-                        if entry.path in fs_link_table:
-                            fs_link_table.pop(entry.path)
-
-    # Debug -- list out in-memory table
-    #for dir in fs_perms_table:
-    #    bb.note("Fixup Perms: %s: %s" % (dir, str(fs_perms_table[dir])))
-    #for link in fs_link_table:
-    #    bb.note("Fixup Perms: %s: %s" % (link, str(fs_link_table[link])))
-
-    # We process links first, so we can go back and fixup directory ownership
-    # for any newly created directories
-    # Process in sorted order so /run gets created before /run/lock, etc.
-    for entry in sorted(fs_link_table.values(), key=lambda x: x.link):
-        link = entry.link
-        dir = entry.path
-        origin = dvar + dir
-        if not (cpath.exists(origin) and cpath.isdir(origin) and not cpath.islink(origin)):
-            continue
-
-        if link[0] == "/":
-            target = dvar + link
-            ptarget = link
-        else:
-            target = os.path.join(os.path.dirname(origin), link)
-            ptarget = os.path.join(os.path.dirname(dir), link)
-        if os.path.exists(target):
-            msg = "Fixup Perms: Unable to correct directory link, target already exists: %s -> %s" % (dir, ptarget)
-            oe.qa.handle_error("perm-link", msg, d)
-            continue
-
-        # Create path to move directory to, move it, and then setup the symlink
-        bb.utils.mkdirhier(os.path.dirname(target))
-        #bb.note("Fixup Perms: Rename %s -> %s" % (dir, ptarget))
-        bb.utils.rename(origin, target)
-        #bb.note("Fixup Perms: Link %s -> %s" % (dir, link))
-        os.symlink(link, origin)
-
-    for dir in fs_perms_table:
-        origin = dvar + dir
-        if not (cpath.exists(origin) and cpath.isdir(origin)):
-            continue
-
-        fix_perms(origin, fs_perms_table[dir].mode, fs_perms_table[dir].uid, fs_perms_table[dir].gid, dir)
-
-        if fs_perms_table[dir].walk == 'true':
-            for root, dirs, files in os.walk(origin):
-                for dr in dirs:
-                    each_dir = os.path.join(root, dr)
-                    fix_perms(each_dir, fs_perms_table[dir].mode, fs_perms_table[dir].uid, fs_perms_table[dir].gid, dir)
-                for f in files:
-                    each_file = os.path.join(root, f)
-                    fix_perms(each_file, fs_perms_table[dir].fmode, fs_perms_table[dir].fuid, fs_perms_table[dir].fgid, dir)
+    oe.package.fixup_perms(d)
 }
 
 def package_debug_vars(d):
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 4aa40d70eec..05447f88084 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -292,3 +292,245 @@ def read_shlib_providers(d):
                         shlib_provider[s[0]] = {}
                     shlib_provider[s[0]][s[1]] = (dep_pkg, s[2])
     return shlib_provider
+
+# We generate a master list of directories to process, we start by
+# seeding this list with reasonable defaults, then load from
+# the fs-perms.txt files
+def fixup_perms(d):
+    import pwd, grp
+    import oe.cachedpath
+
+    cpath = oe.cachedpath.CachedPath()
+    dvar = d.getVar('PKGD')
+
+    # init using a string with the same format as a line as documented in
+    # the fs-perms.txt file
+    # <path> <mode> <uid> <gid> <walk> <fmode> <fuid> <fgid>
+    # <path> link <link target>
+    #
+    # __str__ can be used to print out an entry in the input format
+    #
+    # if fs_perms_entry.path is None:
+    #    an error occurred
+    # if fs_perms_entry.link, you can retrieve:
+    #    fs_perms_entry.path = path
+    #    fs_perms_entry.link = target of link
+    # if not fs_perms_entry.link, you can retrieve:
+    #    fs_perms_entry.path = path
+    #    fs_perms_entry.mode = expected dir mode or None
+    #    fs_perms_entry.uid = expected uid or -1
+    #    fs_perms_entry.gid = expected gid or -1
+    #    fs_perms_entry.walk = 'true' or something else
+    #    fs_perms_entry.fmode = expected file mode or None
+    #    fs_perms_entry.fuid = expected file uid or -1
+    #    fs_perms_entry_fgid = expected file gid or -1
+    class fs_perms_entry():
+        def __init__(self, line):
+            lsplit = line.split()
+            if len(lsplit) == 3 and lsplit[1].lower() == "link":
+                self._setlink(lsplit[0], lsplit[2])
+            elif len(lsplit) == 8:
+                self._setdir(lsplit[0], lsplit[1], lsplit[2], lsplit[3], lsplit[4], lsplit[5], lsplit[6], lsplit[7])
+            else:
+                msg = "Fixup Perms: invalid config line %s" % line
+                oe.qa.handle_error("perm-config", msg, d)
+                self.path = None
+                self.link = None
+
+        def _setdir(self, path, mode, uid, gid, walk, fmode, fuid, fgid):
+            self.path = os.path.normpath(path)
+            self.link = None
+            self.mode = self._procmode(mode)
+            self.uid  = self._procuid(uid)
+            self.gid  = self._procgid(gid)
+            self.walk = walk.lower()
+            self.fmode = self._procmode(fmode)
+            self.fuid = self._procuid(fuid)
+            self.fgid = self._procgid(fgid)
+
+        def _setlink(self, path, link):
+            self.path = os.path.normpath(path)
+            self.link = link
+
+        def _procmode(self, mode):
+            if not mode or (mode and mode == "-"):
+                return None
+            else:
+                return int(mode,8)
+
+        # Note uid/gid -1 has special significance in os.lchown
+        def _procuid(self, uid):
+            if uid is None or uid == "-":
+                return -1
+            elif uid.isdigit():
+                return int(uid)
+            else:
+                return pwd.getpwnam(uid).pw_uid
+
+        def _procgid(self, gid):
+            if gid is None or gid == "-":
+                return -1
+            elif gid.isdigit():
+                return int(gid)
+            else:
+                return grp.getgrnam(gid).gr_gid
+
+        # Use for debugging the entries
+        def __str__(self):
+            if self.link:
+                return "%s link %s" % (self.path, self.link)
+            else:
+                mode = "-"
+                if self.mode:
+                    mode = "0%o" % self.mode
+                fmode = "-"
+                if self.fmode:
+                    fmode = "0%o" % self.fmode
+                uid = self._mapugid(self.uid)
+                gid = self._mapugid(self.gid)
+                fuid = self._mapugid(self.fuid)
+                fgid = self._mapugid(self.fgid)
+                return "%s %s %s %s %s %s %s %s" % (self.path, mode, uid, gid, self.walk, fmode, fuid, fgid)
+
+        def _mapugid(self, id):
+            if id is None or id == -1:
+                return "-"
+            else:
+                return "%d" % id
+
+    # Fix the permission, owner and group of path
+    def fix_perms(path, mode, uid, gid, dir):
+        if mode and not os.path.islink(path):
+            #bb.note("Fixup Perms: chmod 0%o %s" % (mode, dir))
+            os.chmod(path, mode)
+        # -1 is a special value that means don't change the uid/gid
+        # if they are BOTH -1, don't bother to lchown
+        if not (uid == -1 and gid == -1):
+            #bb.note("Fixup Perms: lchown %d:%d %s" % (uid, gid, dir))
+            os.lchown(path, uid, gid)
+
+    # Return a list of configuration files based on either the default
+    # files/fs-perms.txt or the contents of FILESYSTEM_PERMS_TABLES
+    # paths are resolved via BBPATH
+    def get_fs_perms_list(d):
+        str = ""
+        bbpath = d.getVar('BBPATH')
+        fs_perms_tables = d.getVar('FILESYSTEM_PERMS_TABLES') or ""
+        for conf_file in fs_perms_tables.split():
+            confpath = bb.utils.which(bbpath, conf_file)
+            if confpath:
+                str += " %s" % bb.utils.which(bbpath, conf_file)
+            else:
+                bb.warn("cannot find %s specified in FILESYSTEM_PERMS_TABLES" % conf_file)
+        return str
+
+    fs_perms_table = {}
+    fs_link_table = {}
+
+    # By default all of the standard directories specified in
+    # bitbake.conf will get 0755 root:root.
+    target_path_vars = [    'base_prefix',
+                'prefix',
+                'exec_prefix',
+                'base_bindir',
+                'base_sbindir',
+                'base_libdir',
+                'datadir',
+                'sysconfdir',
+                'servicedir',
+                'sharedstatedir',
+                'localstatedir',
+                'infodir',
+                'mandir',
+                'docdir',
+                'bindir',
+                'sbindir',
+                'libexecdir',
+                'libdir',
+                'includedir',
+                'oldincludedir' ]
+
+    for path in target_path_vars:
+        dir = d.getVar(path) or ""
+        if dir == "":
+            continue
+        fs_perms_table[dir] = fs_perms_entry(d.expand("%s 0755 root root false - - -" % (dir)))
+
+    # Now we actually load from the configuration files
+    for conf in get_fs_perms_list(d).split():
+        if not os.path.exists(conf):
+            continue
+        with open(conf) as f:
+            for line in f:
+                if line.startswith('#'):
+                    continue
+                lsplit = line.split()
+                if len(lsplit) == 0:
+                    continue
+                if len(lsplit) != 8 and not (len(lsplit) == 3 and lsplit[1].lower() == "link"):
+                    msg = "Fixup perms: %s invalid line: %s" % (conf, line)
+                    oe.qa.handle_error("perm-line", msg, d)
+                    continue
+                entry = fs_perms_entry(d.expand(line))
+                if entry and entry.path:
+                    if entry.link:
+                        fs_link_table[entry.path] = entry
+                        if entry.path in fs_perms_table:
+                            fs_perms_table.pop(entry.path)
+                    else:
+                        fs_perms_table[entry.path] = entry
+                        if entry.path in fs_link_table:
+                            fs_link_table.pop(entry.path)
+
+    # Debug -- list out in-memory table
+    #for dir in fs_perms_table:
+    #    bb.note("Fixup Perms: %s: %s" % (dir, str(fs_perms_table[dir])))
+    #for link in fs_link_table:
+    #    bb.note("Fixup Perms: %s: %s" % (link, str(fs_link_table[link])))
+
+    # We process links first, so we can go back and fixup directory ownership
+    # for any newly created directories
+    # Process in sorted order so /run gets created before /run/lock, etc.
+    for entry in sorted(fs_link_table.values(), key=lambda x: x.link):
+        link = entry.link
+        dir = entry.path
+        origin = dvar + dir
+        if not (cpath.exists(origin) and cpath.isdir(origin) and not cpath.islink(origin)):
+            continue
+
+        if link[0] == "/":
+            target = dvar + link
+            ptarget = link
+        else:
+            target = os.path.join(os.path.dirname(origin), link)
+            ptarget = os.path.join(os.path.dirname(dir), link)
+        if os.path.exists(target):
+            msg = "Fixup Perms: Unable to correct directory link, target already exists: %s -> %s" % (dir, ptarget)
+            oe.qa.handle_error("perm-link", msg, d)
+            continue
+
+        # Create path to move directory to, move it, and then setup the symlink
+        bb.utils.mkdirhier(os.path.dirname(target))
+        #bb.note("Fixup Perms: Rename %s -> %s" % (dir, ptarget))
+        bb.utils.rename(origin, target)
+        #bb.note("Fixup Perms: Link %s -> %s" % (dir, link))
+        os.symlink(link, origin)
+
+    for dir in fs_perms_table:
+        origin = dvar + dir
+        if not (cpath.exists(origin) and cpath.isdir(origin)):
+            continue
+
+        fix_perms(origin, fs_perms_table[dir].mode, fs_perms_table[dir].uid, fs_perms_table[dir].gid, dir)
+
+        if fs_perms_table[dir].walk == 'true':
+            for root, dirs, files in os.walk(origin):
+                for dr in dirs:
+                    each_dir = os.path.join(root, dr)
+                    fix_perms(each_dir, fs_perms_table[dir].mode, fs_perms_table[dir].uid, fs_perms_table[dir].gid, dir)
+                for f in files:
+                    each_file = os.path.join(root, f)
+                    fix_perms(each_file, fs_perms_table[dir].fmode, fs_perms_table[dir].fuid, fs_perms_table[dir].fgid, dir)
+
+
+
-- 
2.37.2


