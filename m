Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8318179FAA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2019 10:43:54 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id j2so14710141wrw.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2019 02:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8SSUDa4s2oem16ToNXrhpo7xvpWEXaGsNVpEUHN5Giw=;
	b=ooU/G11J41WBASOQEVf2BEW5qx/GqmlWjZmU8UxRMCHyRRBlGZXZQPiSnL41wXDVTR
	/45mTnUstTOq9B0eeyDiYfB/YyK0pJ1G69MLoJyRJubPjajcD4jju6P4UbwHwON/RmwP
	kHdcM/ukza3JozaYyVmIzbIbkS6U2F4pO9ACcuyIyeodzDRjT6GGftM/Ypyorc4IB3y+
	pe4kUmSqixGEG5QrCddSgOApU+Fek26h+s6BKiYl7tzMA1ulBSPnGeyLFS6AwvUBUf0O
	ZSM6YuDtxHmSOlf5v/jd+RuVNxy7q7oLKz2eD/XORZXikNrRjCc6Np37HsWfeb13nLCd
	lgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8SSUDa4s2oem16ToNXrhpo7xvpWEXaGsNVpEUHN5Giw=;
	b=X1/pUEMAe26Q0tQ38HCkUuN/+3cAaW+Y+di7kZNUUoi+OSLFGb+x9vKQvFIBLHqyVx
	uDmkueOZAN4buBWj0j2QHFb3mHfPzWFwD1b5cKxjOR9hP0vckWaR06deiQhbrefaZ4R8
	ZZcXD7glEirKV87zgkm+I6WmeGmI//ceYu2VT2FQB3vtFo+Mcjs+YIziasbfVBs9i6xK
	epw7xnBs10bA9tKX/MrMfctZ2Zpo2OZ+Ybhv50FDaj4fP0JsiTTm2PzQCCXiK1x3154+
	IGY2/Vt4zyroZxK2RMkxHjSJKE5cyXBAIc3B+NxkgU9q4O/TXlpP37o+pzoDYXTnifXm
	28Lw==
X-Gm-Message-State: AJcUukduHGWlHtcTTq3P3qoE6wpxjZNLTJmrdfEEW65uZQWPkusojRG/
	5LN8lkzO2JSqy3M9n+hGh0+7+wRd
X-Google-Smtp-Source: ALg8bN4kbfiqk5z/zvxbjBf+7D9FRCcjHFFSMSQT1/ftOdIuH782C2VaIXD/j+E+Fku7z5l3l8P3ug==
X-Received: by 2002:adf:ce86:: with SMTP id r6mr13560142wrn.257.1547203434781; 
	Fri, 11 Jan 2019 02:43:54 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	o3sm53433557wrs.30.2019.01.11.02.43.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Jan 2019 02:43:53 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Jan 2019 11:43:49 +0100
Message-Id: <20190111104349.33960-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] rpm: produce sane amount of logging when creating a rootfs
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
X-List-Received-Date: Fri, 11 Jan 2019 10:43:54 -0000

Previously there was lots of irrelevant noise in the logs,
because we also wanted to be able to debug postinst issues
easily. I have adjusted the logging levels so that
postinst info is still written to the logs, but other
things are not.

[YOCTO #13119]

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oe/package_manager.py                |  2 +-
 ...ge-logging-level-around-scriptlets-t.patch | 55 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.14.2.1.bb     |  1 +
 3 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 392fe7e3724..7ff76c61cdd 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -966,7 +966,7 @@ class RpmPM(PackageManager):
         os.environ['RPM_ETCCONFIGDIR'] = self.target_rootfs
 
         dnf_cmd = bb.utils.which(os.getenv('PATH'), "dnf")
-        standard_dnf_args = ["-v", "--rpmverbosity=debug", "-y",
+        standard_dnf_args = ["-v", "--rpmverbosity=info", "-y",
                              "-c", oe.path.join(self.target_rootfs, "etc/dnf/dnf.conf"),
                              "--setopt=reposdir=%s" %(oe.path.join(self.target_rootfs, "etc/yum.repos.d")),
                              "--installroot=%s" % (self.target_rootfs),
diff --git a/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch b/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch
new file mode 100644
index 00000000000..43e9859ef32
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch
@@ -0,0 +1,55 @@
+From 989e425d416474c191b020d0825895e3df4bd033 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 10 Jan 2019 18:14:18 +0100
+Subject: [PATCH] rpmscript.c: change logging level around scriptlets to INFO
+ from DEBUG
+
+That way we can debug scriptlet failures without writing lots of
+irrelevant noise to rootfs logs.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ lib/rpmscript.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/lib/rpmscript.c b/lib/rpmscript.c
+index 2b0e43862..e319673f1 100644
+--- a/lib/rpmscript.c
++++ b/lib/rpmscript.c
+@@ -226,7 +226,7 @@ static char * writeScript(const char *cmd, const char *script)
+     if (Ferror(fd))
+ 	goto exit;
+ 
+-    if (rpmIsDebug() && (rstreq(cmd, "/bin/sh") || rstreq(cmd, "/bin/bash"))) {
++    if (rpmIsVerbose() && (rstreq(cmd, "/bin/sh") || rstreq(cmd, "/bin/bash"))) {
+ 	static const char set_x[] = "set -x\n";
+ 	/* Assume failures will be caught by the write below */
+ 	Fwrite(set_x, sizeof(set_x[0]), sizeof(set_x)-1, fd);
+@@ -258,7 +258,7 @@ static rpmRC runExtScript(rpmPlugins plugins, ARGV_const_t prefixes,
+     char *mline = NULL;
+     rpmRC rc = RPMRC_FAIL;
+ 
+-    rpmlog(RPMLOG_DEBUG, "%s: scriptlet start\n", sname);
++    rpmlog(RPMLOG_INFO, "%s: scriptlet start\n", sname);
+ 
+     if (script) {
+ 	fn = writeScript(*argvp[0], script);
+@@ -310,7 +310,7 @@ static rpmRC runExtScript(rpmPlugins plugins, ARGV_const_t prefixes,
+ 		sname, strerror(errno));
+ 	goto exit;
+     } else if (pid == 0) {/* Child */
+-	rpmlog(RPMLOG_DEBUG, "%s: execv(%s) pid %d\n",
++	rpmlog(RPMLOG_INFO, "%s: execv(%s) pid %d\n",
+ 	       sname, *argvp[0], (unsigned)getpid());
+ 
+ 	fclose(in);
+@@ -353,7 +353,7 @@ static rpmRC runExtScript(rpmPlugins plugins, ARGV_const_t prefixes,
+ 	reaped = waitpid(pid, &status, 0);
+     } while (reaped == -1 && errno == EINTR);
+ 
+-    rpmlog(RPMLOG_DEBUG, "%s: waitpid(%d) rc %d status %x\n",
++    rpmlog(RPMLOG_INFO, "%s: waitpid(%d) rc %d status %x\n",
+ 	   sname, (unsigned)pid, (unsigned)reaped, status);
+ 
+     if (reaped < 0) {
diff --git a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
index ef5d631917c..66eef557dfa 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
@@ -40,6 +40,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
            file://0004-build-pack.c-remove-static-local-variables-from-buil.patch \
            file://0001-perl-disable-auto-reqs.patch \
            file://0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch \
+           file://0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch \
            "
 
 PE = "1"
-- 
2.17.1


