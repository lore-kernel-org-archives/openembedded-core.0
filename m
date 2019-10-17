Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7AE5D7D40E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2019 15:21:41 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id e13so1542719pga.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2019 08:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=jPGlCt0yVbk0v9R581kofuscjNZMOHHQ7FWZVXWNZh4=;
	b=O6M1979GLPM6i6eUNcXYHnx8p8Sm42wfeMqUqN17uftskvePt33ivQk54qVf8AoWeP
	dq74XV6XkQIw24AjAL3RSAkYE6hZFchhtJuE6usk9vjwNTJ6YJ29rLYABtYypj7W0z6x
	RWMYpCzMBgM8ALyqpAvTqW1OzUFquyRn4KdlT6kl4Mzu/dti2DPsTuPCQ+rrqL2qrPm1
	T6MoYCIPY/osWGTQVGTG6nu9xKhv4uWScQk/LaDQYwY08H3ff5Ow/GPnNPjtKiTPK1hb
	1upZvIVV66RVPUY+K8Er7GXSsReUw6vQEbClyezf48VCWQQw2NrOzv//IGzcVRdLsOSE
	Y5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=jPGlCt0yVbk0v9R581kofuscjNZMOHHQ7FWZVXWNZh4=;
	b=BNBDndUB45Y2ZSki05ek1ogaUVCbYWY6OvjjorIXCGGvKBBKqFMLUpzy/e3uIREMNk
	I40x7WhCcold02bul+lX0FoMp7ryC2DXTiqxlF0ehlaye4qdNHVIoY14Cx+U07A82Ssh
	G7DJmuw6tHUQrNOOHjEAS9JlxdwmE1K/i3czL1tfCfkycs07dralVvlm28cZWKoj24Rf
	D0RSJy9qeNAhNauLgpdFzIZ2PBrOoeLt1SUwQ6VDs7YGI4PZm3F2ZghaAznX5jW+yuUN
	jDkb31YNDrXfC/c62rcIarDFWvW8xJJjXfKWkW8RpFQ+ie7simUihsp+WxDoSxa44v1h
	fwrg==
X-Gm-Message-State: APjAAAU7jUxfd7G6muNtoDjUiB96fow8oLz/ShIwBsCvq26i8WWcatnE
	o9arr/9s5UOL8FgIa7L3lKQgJDyS
X-Google-Smtp-Source: APXvYqxyzkp4YI9BHK8LFaAWnx6Am0bNIIRDKn3iEaSDLH0sbBl5BHF8GwNxTVyD4CX/wdps4BK5bg==
X-Received: by 2002:a62:e90d:: with SMTP id j13mr780295pfh.86.1571325702102;
	Thu, 17 Oct 2019 08:21:42 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:880f:4ea7:2b50:5b1c])
	by smtp.gmail.com with ESMTPSA id
	z23sm2564735pgu.16.2019.10.17.08.21.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 Oct 2019 08:21:41 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2019 08:21:40 -0700
Message-Id: <1571325700-5138-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud][PATCH] Revert "OpkgPM: use --add-ignore-recommends to process BAD_RECOMMENDATIONS"
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
X-List-Received-Date: Thu, 17 Oct 2019 15:21:41 -0000

This reverts commit e8cd30ba6cec854d85c7ad47edc208107858a5d7.

This backport introduced an issue not seen the AB QA.

Issue can be seen if
BAD_RECOMMENDATIONS_append = " udev-hwdb" is used
---
 meta/lib/oe/package_manager.py | 41 +++++++++++++++++++++++++++++++++++++++--
 meta/lib/oe/rootfs.py          |  2 ++
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 7d88048..882e7c4 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1329,8 +1329,6 @@ class OpkgPM(OpkgDpkgPM):
         cmd = "%s %s" % (self.opkg_cmd, self.opkg_args)
         for exclude in (self.d.getVar("PACKAGE_EXCLUDE") or "").split():
             cmd += " --add-exclude %s" % exclude
-        for bad_recommendation in (self.d.getVar("BAD_RECOMMENDATIONS") or "").split():
-            cmd += " --add-ignore-recommends %s" % bad_recommendation
         cmd += " install "
         cmd += " ".join(pkgs)
 
@@ -1399,6 +1397,45 @@ class OpkgPM(OpkgDpkgPM):
     def list_installed(self):
         return OpkgPkgsList(self.d, self.target_rootfs, self.config_file).list_pkgs()
 
+    def handle_bad_recommendations(self):
+        bad_recommendations = self.d.getVar("BAD_RECOMMENDATIONS") or ""
+        if bad_recommendations.strip() == "":
+            return
+
+        status_file = os.path.join(self.opkg_dir, "status")
+
+        # If status file existed, it means the bad recommendations has already
+        # been handled
+        if os.path.exists(status_file):
+            return
+
+        cmd = "%s %s info " % (self.opkg_cmd, self.opkg_args)
+
+        with open(status_file, "w+") as status:
+            for pkg in bad_recommendations.split():
+                pkg_info = cmd + pkg
+
+                try:
+                    output = subprocess.check_output(pkg_info.split(), stderr=subprocess.STDOUT).strip().decode("utf-8")
+                except subprocess.CalledProcessError as e:
+                    bb.fatal("Cannot get package info. Command '%s' "
+                             "returned %d:\n%s" % (pkg_info, e.returncode, e.output.decode("utf-8")))
+
+                if output == "":
+                    bb.note("Ignored bad recommendation: '%s' is "
+                            "not a package" % pkg)
+                    continue
+
+                for line in output.split('\n'):
+                    if line.startswith("Status:"):
+                        status.write("Status: deinstall hold not-installed\n")
+                    else:
+                        status.write(line + "\n")
+
+                # Append a blank line after each package entry to ensure that it
+                # is separated from the following entry
+                status.write("\n")
+
     def dummy_install(self, pkgs):
         """
         The following function dummy installs pkgs and returns the log of output.
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index aa9fb2e..e5512d0 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -879,6 +879,8 @@ class OpkgRootfs(DpkgOpkgRootfs):
 
         self.pm.update()
 
+        self.pm.handle_bad_recommendations()
+
         if self.progress_reporter:
             self.progress_reporter.next_stage()
 
-- 
2.7.4


