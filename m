Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00B70C433FE
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 10:41:35 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.4791.1642588894251936861
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k9XpJF8K;
 spf=pass (domain: gmail.com, ip: 209.85.128.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id n8so4469067wmk.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R4mLvXZms0BRBanJbbBfYWzfXgvHnoWJUJJF8PJizHs=;
        b=k9XpJF8Ky/kLAGQHyNErL31gUagh7oVQrK0R+0B9kNFbTIGvhGulEtFG4DwYhcAKmO
         60j/aKDCtpgVuqX015xmEyojNsThID7kf3ZXPst1aE57tse/W5IUWf6elkhRE++voMYU
         /7f+U+3diDD66GEAYU9PQwpA8Exk0mwkhSsuzQaB/Tzef5B23WtOZPRbcj96WVXAjFXX
         iDthRc3dVCbSN30F8m2q17lSqByOaDPvf9CeNwx1/3WlTI05vRoZBcnTyzOjl0OX8wpe
         FMhua2sEvGeH/fs2vBLPKAzDAFVwKoVUq2huafI4KbMGUExJy/1ZupvxdnIvW6j+pCyZ
         m6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R4mLvXZms0BRBanJbbBfYWzfXgvHnoWJUJJF8PJizHs=;
        b=duzmCZoBewKWQT8wknwAZKmuPwZXdqTJ6X5XjNwUKeN2fPJzd2/kaDPsxlyeTPERH3
         s6JfppfW+3BjLnbrVvDqlVPnrtQQD2uBIetytcp9cqKIehY5OSz2xdFVoSeXH4xA5voT
         i7Vhp432Q6V/4K6UdOKXrM4sR/AgwnrTUJwqwqCrn2cNC7v6fjXMhdhZ3M6rvwRrNU0N
         RJvd5vbzJvW/m/3F48gVpXQKkbT44rH/tQ0yD9TEJa4mBRJLq7tPS2NY6Gxfb2aFa75o
         T1rNr9dWNoN9Wy6L9843GY5i5stElAdE16nePgCQpgX7t4TlxTEaMqPcZESuxkzGwZi+
         LjDw==
X-Gm-Message-State: AOAM531b0+Wf7qfd8Rwk6ee17G3wwa5F8ldCR+QO0kdWkWRSTTsho9Rt
	dI6hdGOXYe6db5XmhgxxyeaywDqTpCM=
X-Google-Smtp-Source: 
 ABdhPJziDtDy+J6efkcZzoqj0B+VjSiKB8wFi75MnyXpUU7scQCZqqYbrtLzlWEnuSI/TN1JRt2V9Q==
X-Received: by 2002:a05:600c:4ed3:: with SMTP id
 g19mr2848296wmq.142.1642588892663;
        Wed, 19 Jan 2022 02:41:32 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o5sm4667956wmc.39.2022.01.19.02.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 02:41:32 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Robert Yang <liezhi.yang@windriver.com>
Subject: [PATCH 10/39] logrotate: update 3.18.1 -> 3.19.0,
 drop rotate-across-filesystems patches
Date: Wed, 19 Jan 2022 11:40:48 +0100
Message-Id: <20220119104117.2120127-10-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220119104117.2120127-1-alex@linutronix.de>
References: <20220119104117.2120127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 10:41:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160700

Upstream review and request to address it got no reaction
from the author, and the patches are an ongoing rebase burden,
so if someone needs this feature, please complete
the upstreaming work first.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/runtime/cases/logrotate.py      |  14 +-
 .../logrotate/0001-Update-the-manual.patch    |  39 -----
 .../logrotate/act-as-mv-when-rotate.patch     | 149 ------------------
 .../disable-check-different-filesystems.patch |  36 -----
 ...ogrotate_3.18.1.bb => logrotate_3.19.0.bb} |   8 +-
 5 files changed, 9 insertions(+), 237 deletions(-)
 delete mode 100644 meta/recipes-extended/logrotate/logrotate/0001-Update-the-manual.patch
 delete mode 100644 meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch
 delete mode 100644 meta/recipes-extended/logrotate/logrotate/disable-check-different-filesystems.patch
 rename meta/recipes-extended/logrotate/{logrotate_3.18.1.bb => logrotate_3.19.0.bb} (92%)

diff --git a/meta/lib/oeqa/runtime/cases/logrotate.py b/meta/lib/oeqa/runtime/cases/logrotate.py
index a4efcd07c0..2bff08f9da 100644
--- a/meta/lib/oeqa/runtime/cases/logrotate.py
+++ b/meta/lib/oeqa/runtime/cases/logrotate.py
@@ -17,7 +17,7 @@ class LogrotateTest(OERuntimeTestCase):
 
     @classmethod
     def tearDownClass(cls):
-        cls.tc.target.run('mv -f $HOME/wtmp.oeqabak /etc/logrotate.d/wtmp && rm -rf $HOME/logrotate_dir')
+        cls.tc.target.run('mv -f $HOME/wtmp.oeqabak /etc/logrotate.d/wtmp && rm -rf /var/log//logrotate_dir')
         cls.tc.target.run('rm -rf /var/log/logrotate_testfile && rm -rf /etc/logrotate.d/logrotate_testfile')
 
     @OETestDepends(['ssh.SSHTest.test_ssh'])
@@ -29,17 +29,17 @@ class LogrotateTest(OERuntimeTestCase):
         msg = ('Could not create/update /var/log/wtmp with touch')
         self.assertEqual(status, 0, msg = msg)
 
-        status, output = self.target.run('mkdir $HOME/logrotate_dir')
+        status, output = self.target.run('mkdir /var/log//logrotate_dir')
         msg = ('Could not create logrotate_dir. Output: %s' % output)
         self.assertEqual(status, 0, msg = msg)
 
-        status, output = self.target.run('echo "create \n olddir $HOME/logrotate_dir \n include /etc/logrotate.d/wtmp" > /tmp/logrotate-test.conf')
+        status, output = self.target.run('echo "create \n olddir /var/log//logrotate_dir \n include /etc/logrotate.d/wtmp" > /tmp/logrotate-test.conf')
         msg = ('Could not write to /tmp/logrotate-test.conf')
         self.assertEqual(status, 0, msg = msg)
         
         # If logrotate fails to rotate the log, view the verbose output of logrotate to see what prevented it
         _, logrotate_output = self.target.run('logrotate -vf /tmp/logrotate-test.conf')
-        status, _ = self.target.run('find $HOME/logrotate_dir -type f | grep wtmp.1')
+        status, _ = self.target.run('find /var/log//logrotate_dir -type f | grep wtmp.1')
         msg = ("logrotate did not successfully rotate the wtmp log. Output from logrotate -vf: \n%s" % (logrotate_output))
         self.assertEqual(status, 0, msg = msg)
        
@@ -54,17 +54,17 @@ class LogrotateTest(OERuntimeTestCase):
         msg = ('Could not write to /etc/logrotate.d/logrotate_testfile')
         self.assertEqual(status, 0, msg = msg)
 
-        status, output = self.target.run('echo "create \n olddir $HOME/logrotate_dir \n include /etc/logrotate.d/logrotate_testfile" > /tmp/logrotate-test2.conf')
+        status, output = self.target.run('echo "create \n olddir /var/log//logrotate_dir \n include /etc/logrotate.d/logrotate_testfile" > /tmp/logrotate-test2.conf')
         msg = ('Could not write to /tmp/logrotate_test2.conf')
         self.assertEqual(status, 0, msg = msg)
 
-        status, output = self.target.run('find $HOME/logrotate_dir -type f | grep logrotate_testfile.1')
+        status, output = self.target.run('find /var/log//logrotate_dir -type f | grep logrotate_testfile.1')
         msg = ('A rotated log for logrotate_testfile is already present in logrotate_dir')
         self.assertEqual(status, 1, msg = msg)
 
         # If logrotate fails to rotate the log, view the verbose output of logrotate instead of just listing the files in olddir
         _, logrotate_output = self.target.run('logrotate -vf /tmp/logrotate-test2.conf')
-        status, _ = self.target.run('find $HOME/logrotate_dir -type f | grep logrotate_testfile.1')
+        status, _ = self.target.run('find /var/log//logrotate_dir -type f | grep logrotate_testfile.1')
         msg = ('logrotate did not successfully rotate the logrotate_test log. Output from logrotate -vf: \n%s' % (logrotate_output))
         self.assertEqual(status, 0, msg = msg)
 
diff --git a/meta/recipes-extended/logrotate/logrotate/0001-Update-the-manual.patch b/meta/recipes-extended/logrotate/logrotate/0001-Update-the-manual.patch
deleted file mode 100644
index 50a3852078..0000000000
--- a/meta/recipes-extended/logrotate/logrotate/0001-Update-the-manual.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 3e2cfa88b6538bb0fee3d9a6e99622055d05ac4a Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Tue, 17 Feb 2015 21:14:37 -0800
-Subject: [PATCH] Update the manual
-
-Update the manual for rotating on different filesystems.
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
----
- logrotate.8.in | 10 ++++------
- 1 file changed, 4 insertions(+), 6 deletions(-)
-
-diff --git a/logrotate.8.in b/logrotate.8.in
-index 98fea91..70b4c44 100644
---- a/logrotate.8.in
-+++ b/logrotate.8.in
-@@ -202,12 +202,10 @@ at all (use with caution, may waste performance and disk space). Default is 0.
- 
- .TP
- \fBolddir \fIdirectory\fR
--Logs are moved into \fIdirectory\fR for rotation.  The \fIdirectory\fR must be
--on the same physical device as the log file being rotated, unless \fBcopy\fR,
--\fBcopytruncate\fR or \fBrenamecopy\fR option is used.  The \fIdirectory\fR
--is assumed to be relative to the directory holding the log file
--unless an absolute path name is specified.  When this option is used all
--old versions of the log end up in \fIdirectory\fR.  This option may be
-+Logs are moved into \fIdirectory\fR for rotation. The \fIdirectory\fR
-+is assumed to be relative to the directory holding the log file unless
-+an absolute path name is specified. When this option is used all old
-+versions of the log end up in \fIdirectory\fR. This option may be
- overridden by the \fBnoolddir\fR option.
- 
- .TP
--- 
-2.24.0
-
diff --git a/meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch b/meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch
deleted file mode 100644
index 4efd471906..0000000000
--- a/meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch
+++ /dev/null
@@ -1,149 +0,0 @@
-From 17d57a2a923a4af53c8910a9999aebeab3f5d83a Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Tue, 17 Feb 2015 21:08:07 -0800
-Subject: [PATCH] Act as the "mv" command when rotate log
-
-Act as the "mv" command when rotate log, first rename, if failed, then
-read and write.
-
-Upstream-Status: Inappropriate [needs a rework according to https://github.com/logrotate/logrotate/pull/429]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
----
- logrotate.c | 71 ++++++++++++++++++++++++++++++++++++++++++++---------
- 1 file changed, 59 insertions(+), 12 deletions(-)
-
-diff --git a/logrotate.c b/logrotate.c
-index 45b3eb6..231371a 100644
---- a/logrotate.c
-+++ b/logrotate.c
-@@ -1463,6 +1463,53 @@ static int findNeedRotating(const struct logInfo *log, unsigned logNum, int forc
-     return 0;
- }
- 
-+/* Act as the "mv" command, if rename failed, then read the old file and
-+ * write to new file. The function which invokes the mvFile will use
-+ * the strerror(errorno) to handle the error message, so we don't have
-+ * to print the error message here */
-+
-+int mvFile (char *oldName, char *newName, struct logInfo *log, acl_type acl)
-+{
-+    struct stat sbprev;
-+    int fd_old, fd_new, n;
-+    char buf[BUFSIZ];
-+
-+    /* Do the rename first */
-+    if (!rename(oldName, newName))
-+        return 0;
-+
-+    /* If the errno is EXDEV, then read old file, write newfile and
-+     * remove the oldfile */
-+    if (errno == EXDEV) {
-+        /* Open the old file to read */
-+        if ((fd_old = open(oldName, O_RDONLY)) < 0)
-+            return 1;
-+
-+        /* Create the file to write, keep the same attribute as the old file */
-+        if (stat(oldName, &sbprev))
-+            return 1;
-+        else {
-+            if ((fd_new = createOutputFile(newName,
-+                O_WRONLY | O_CREAT | O_TRUNC, &sbprev, acl, 0)) < 0 )
-+                return 1;
-+        }
-+
-+        /* Read and write */
-+        while ((n = read(fd_old, buf, BUFSIZ)) > 0)
-+            if (write(fd_new, buf, n) != n)
-+                return 1;
-+
-+        if ((close(fd_old) < 0) ||
-+            removeLogFile(oldName, log) ||
-+            (close(fd_new) < 0))
-+            return 1;
-+
-+        return 0;
-+    }
-+
-+    return 1;
-+}
-+
- /* find the rotated file with the highest index */
- static int findLastRotated(const struct logNames *rotNames,
-                            const char *fileext, const char *compext)
-@@ -1958,15 +2005,15 @@ static int prerotateSingleLog(const struct logInfo *log, unsigned logNum,
-             }
- 
-             message(MESS_DEBUG,
--                    "renaming %s to %s (rotatecount %d, logstart %d, i %d), \n",
-+                    "moving %s to %s (rotatecount %d, logstart %d, i %d), \n",
-                     oldName, newName, rotateCount, logStart, i);
- 
--            if (!debug && rename(oldName, newName)) {
-+            if (!debug && mvFile(oldName, newName, log, prev_acl)) {
-                 if (errno == ENOENT) {
-                     message(MESS_DEBUG, "old log %s does not exist\n",
-                             oldName);
-                 } else {
--                    message(MESS_ERROR, "error renaming %s to %s: %s\n",
-+                    message(MESS_ERROR, "error moving %s to %s: %s\n",
-                             oldName, newName, strerror(errno));
-                     hasErrors = 1;
-                 }
-@@ -2051,10 +2098,10 @@ static int rotateSingleLog(const struct logInfo *log, unsigned logNum,
-                     return 1;
-                 }
- 
--                message(MESS_DEBUG, "renaming %s to %s\n", log->files[logNum],
-+                message(MESS_DEBUG, "moving %s to %s\n", log->files[logNum],
-                         tmpFilename);
--                if (!debug && !hasErrors && rename(log->files[logNum], tmpFilename)) {
--                    message(MESS_ERROR, "failed to rename %s to %s: %s\n",
-+                if (!debug && !hasErrors && mvFile(log->files[logNum], rotNames->finalName, log, prev_acl)) {
-+                    message(MESS_ERROR, "failed to move %s to %s: %s\n",
-                             log->files[logNum], tmpFilename,
-                             strerror(errno));
-                     hasErrors = 1;
-@@ -2063,11 +2110,11 @@ static int rotateSingleLog(const struct logInfo *log, unsigned logNum,
-                 free(tmpFilename);
-             }
-             else {
--                message(MESS_DEBUG, "renaming %s to %s\n", log->files[logNum],
-+                message(MESS_DEBUG, "moving %s to %s\n", log->files[logNum],
-                         rotNames->finalName);
-                 if (!debug && !hasErrors &&
--                        rename(log->files[logNum], rotNames->finalName)) {
--                    message(MESS_ERROR, "failed to rename %s to %s: %s\n",
-+                        mvFile(log->files[logNum], rotNames->finalName, log, prev_acl)) {
-+                    message(MESS_ERROR, "failed to move %s to %s: %s\n",
-                             log->files[logNum], rotNames->finalName,
-                             strerror(errno));
-                     hasErrors = 1;
-@@ -2480,7 +2527,7 @@ static int rotateLogSet(const struct logInfo *log, int force)
-     return hasErrors;
- }
- 
--static int writeState(const char *stateFilename)
-+static int writeState(struct logInfo *log, char *stateFilename)
- {
-     struct logState *p;
-     FILE *f;
-@@ -2659,7 +2706,7 @@ static int writeState(const char *stateFilename)
-         fclose(f);
- 
-     if (error == 0) {
--        if (rename(tmpFilename, stateFilename)) {
-+        if (mvFile(tmpFilename, stateFilename, log, prev_acl)) {
-             message(MESS_ERROR, "error renaming temp state file %s to %s: %s\n",
-                     tmpFilename, stateFilename, strerror(errno));
-             unlink(tmpFilename);
-@@ -3073,7 +3120,7 @@ int main(int argc, const char **argv)
-         rc |= rotateLogSet(log, force);
- 
-     if (!debug)
--        rc |= writeState(stateFile);
-+        rc |= writeState(log, stateFile);
- 
-     return (rc != 0);
- }
diff --git a/meta/recipes-extended/logrotate/logrotate/disable-check-different-filesystems.patch b/meta/recipes-extended/logrotate/logrotate/disable-check-different-filesystems.patch
deleted file mode 100644
index d7f9a02cc8..0000000000
--- a/meta/recipes-extended/logrotate/logrotate/disable-check-different-filesystems.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 16c1833ade4c036b30b8761d2c4a5bd85cc65c44 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Tue, 8 Jan 2019 06:27:06 +0000
-Subject: [PATCH] Disable the check for different filesystems
-
-The logrotate supports rotate log across different filesystems now, so
-disable the check for different filesystems.
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
----
- config.c | 9 ---------
- 1 file changed, 9 deletions(-)
-
-diff --git a/config.c b/config.c
-index d2488f1..1de3745 100644
---- a/config.c
-+++ b/config.c
-@@ -1902,15 +1902,6 @@ duperror:
-                             }
- 
-                             free(ld);
--
--                            if (sb.st_dev != sb2.st_dev
--                                    && !(newlog->flags & (LOG_FLAG_COPYTRUNCATE | LOG_FLAG_COPY | LOG_FLAG_TMPFILENAME))) {
--                                message(MESS_ERROR,
--                                        "%s:%d olddir %s and log file %s "
--                                        "are on different devices\n", configFile,
--                                        lineNum, newlog->oldDir, newlog->files[j]);
--                                goto error;
--                            }
-                         }
-                     }
- 
diff --git a/meta/recipes-extended/logrotate/logrotate_3.18.1.bb b/meta/recipes-extended/logrotate/logrotate_3.19.0.bb
similarity index 92%
rename from meta/recipes-extended/logrotate/logrotate_3.18.1.bb
rename to meta/recipes-extended/logrotate/logrotate_3.19.0.bb
index bca47872c5..67c071833c 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.18.1.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.19.0.bb
@@ -13,13 +13,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "logrotate-(?P<pver>\d+(\.\d+)+).tar"
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
-            file://act-as-mv-when-rotate.patch \
-            file://0001-Update-the-manual.patch \
-            file://disable-check-different-filesystems.patch \
-            "
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz"
 
-SRC_URI[sha256sum] = "14a924e4804b3974e85019a9f9352c2a69726702e6656155c48bcdeace68a5dc"
+SRC_URI[sha256sum] = "ddd5274d684c5c99ca724e8069329f343ebe376e07493d537d9effdc501214ba"
 
 # These CVEs are debian, gentoo or SUSE specific on the way logrotate was installed/used
 CVE_CHECK_WHITELIST += "CVE-2011-1548 CVE-2011-1549 CVE-2011-1550"
-- 
2.20.1


