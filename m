Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 0E0BC70676
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 15:05:26 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id bs8so6203736wib.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 08:05:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=JTfvfeHzc6ZT16Za7u+p0lW5KP9Kmt63A/3BB4gMLhQ=;
	b=RGt+pI8V9iBL3t07Vqf4cmYNF3s1Mn5LOsm85uRNvOg/5QiemRhQFAmVvAyzXHkID5
	gdEmFuyzD5OQ2++ssrGYk4WonUXpPjexD6vJkqraBP1i+GRD6PAvmqrR0D4OpuwyC47n
	6Hbt6DDlQguvudVi3uOXY6wE3E+NWycqjPFlc97fJitqe7zyjCX9VTcRezxQUMRcvxOy
	CHjkhcMD6ltJPl8SbpGxxQfe54hiEk5xjG+jSC9uc7RVdXTYIJ5ty4g7s0lnb8+DI4KD
	+z9htoHPHtCVRAFkYU4jN6Hx2tp1oDXA2S2bXdj42X73nTQLFr9ZVbNgVjKLda5XW2H7
	n9Mw==
X-Gm-Message-State: ALoCoQkIb0sTnPjClLmjH+FudF6mVzDssxwpRWYFGuMYsY4cdS6865o6jDyk7Gwshia/YmYoxFtW
X-Received: by 10.180.104.42 with SMTP id gb10mr15538741wib.65.1406041526900; 
	Tue, 22 Jul 2014 08:05:26 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id kr5sm1594058wjc.27.2014.07.22.08.05.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Jul 2014 08:05:26 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Jul 2014 16:05:13 +0100
Message-Id: <1406041513-9294-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] package_rpm: only claim ownership of empty directories
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
X-List-Received-Date: Tue, 22 Jul 2014 15:05:34 -0000

Previous every package claimed ownership via %dir of every directory, which lead
to e.g. every package claiming to own /usr.  This destroys the concept of
directory ownership, so instead only use %dir to ensure empty directories are
packaged.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/package_rpm.bbclass |   45 +++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 0a32b3e..9e6b103 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -186,28 +186,33 @@ python write_specfile () {
                     array.append("%s: %s" % (tag, dep))
 
     def walk_files(walkpath, target, conffiles):
-        # We can race against the ipk/deb backends which create CONTROL or DEBIAN directories
-        # when packaging. We just ignore these files which are created in 
-        # packages-split/ and not package/
-        # We have the odd situation where the CONTROL/DEBIAN directory can be removed in the middle of
-        # of the walk, the isdir() test would then fail and the walk code would assume its a file
-        # hence we check for the names in files too.
         for rootpath, dirs, files in os.walk(walkpath):
-            path = rootpath.replace(walkpath, "")
-            if path.endswith("DEBIAN") or path.endswith("CONTROL"):
-                continue
-            for dir in dirs:
-                if dir == "CONTROL" or dir == "DEBIAN":
-                    continue
-                # All packages own the directories their files are in...
-                target.append('%dir "' + path + '/' + dir + '"')
-            for file in files:
-                if file == "CONTROL" or file == "DEBIAN":
-                    continue
-                if conffiles.count(path + '/' + file):
-                    target.append('%config "' + path + '/' + file + '"')
+            # Ignore the CONTROL and DEBIAN directories, created by ipkg and
+            # dpkg during packaging.  As they can be removed while this is
+            # running (and so the isdir() test fails) ignore both files and
+            # directories.
+            for n in ("CONTROL", "DEBIAN"):
+                try:
+                    dirs.remove(n)
+                    files.remove(n)
+                except ValueError:
+                    pass
+
+            # When rootpath is walkpath the replace will return "" so handle
+            # that and set path to /.
+            path = rootpath.replace(walkpath, "") or "/"
+
+            # Packages own only empty directories, but handle / specially as we
+            # don't want empty packages to contain a %dir / entry.
+            if (path != '/' and not files and not dirs):
+                target.append('%dir "' + path + '"')
+
+            for f in files:
+                f = os.path.join(path, f)
+                if f in conffiles:
+                    target.append('%config "' + f + '"')
                 else:
-                    target.append('"' + path + '/' + file + '"')
+                    target.append('"' + f + '"')
 
     # Prevent the prerm/postrm scripts from being run during an upgrade
     def wrap_uninstall(scriptvar):
-- 
1.7.10.4


