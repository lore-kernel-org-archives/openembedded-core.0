Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 847317C034
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2019 07:21:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x097LJOv031425
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Jan 2019 23:21:29 -0800
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Tue, 8 Jan 2019 23:21:09 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 Jan 2019 15:19:42 +0800
Message-ID: <1547018383-19134-9-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547018383-19134-1-git-send-email-yi.zhao@windriver.com>
References: <1547018383-19134-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [PATCH 8/9] logrotate: upgrade 3.14.0 -> 3.15.0
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
X-List-Received-Date: Wed, 09 Jan 2019 07:21:38 -0000
Content-Type: text/plain

Refresh patches:
  act-as-mv-when-rotate.patch
  disable-check-different-filesystems.patch

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../logrotate/act-as-mv-when-rotate.patch          | 141 ++++++++++-----------
 .../disable-check-different-filesystems.patch      |  40 +++---
 .../{logrotate_3.14.0.bb => logrotate_3.15.0.bb}   |   6 +-
 3 files changed, 96 insertions(+), 91 deletions(-)
 rename meta/recipes-extended/logrotate/{logrotate_3.14.0.bb => logrotate_3.15.0.bb} (94%)

diff --git a/meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch b/meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch
index 04cb588..79805b5 100644
--- a/meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch
+++ b/meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch
@@ -1,4 +1,4 @@
-From 517cbff66c8bdbf455bc3b7c1a85a4f990d0f9a6 Mon Sep 17 00:00:00 2001
+From c637948ebab5aff5641700c5cf613321ca0a6e6b Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Tue, 17 Feb 2015 21:08:07 -0800
 Subject: [PATCH] Act as the "mv" command when rotate log
@@ -10,14 +10,14 @@ Upstream-Status: Pending
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
- logrotate.c | 72 ++++++++++++++++++++++++++++++++++++++++++++++++++-----------
- 1 file changed, 60 insertions(+), 12 deletions(-)
+ logrotate.c | 71 ++++++++++++++++++++++++++++++++++++++++++++---------
+ 1 file changed, 59 insertions(+), 12 deletions(-)
 
 diff --git a/logrotate.c b/logrotate.c
-index 4ad58d4..ba05884 100644
+index 54dac90..bf3ec23 100644
 --- a/logrotate.c
 +++ b/logrotate.c
-@@ -1315,6 +1315,54 @@ static int findNeedRotating(struct logInfo *log, int logNum, int force)
+@@ -1360,6 +1360,53 @@ static int findNeedRotating(struct logInfo *log, int logNum, int force)
      return 0;
  }
  
@@ -68,84 +68,83 @@ index 4ad58d4..ba05884 100644
 +    return 1;
 +}
 +
-+
- static int prerotateSingleLog(struct logInfo *log, int logNum,
- 			      struct logState *state, struct logNames *rotNames)
- {
-@@ -1674,15 +1722,15 @@ static int prerotateSingleLog(struct logInfo *log, int logNum,
- 		}
+ /* find the rotated file with the highest index */
+ static int findLastRotated(const struct logNames *rotNames,
+                            const char *fileext, const char *compext)
+@@ -1800,15 +1847,15 @@ static int prerotateSingleLog(struct logInfo *log, int logNum,
+             }
  
- 	    message(MESS_DEBUG,
--		    "renaming %s to %s (rotatecount %d, logstart %d, i %d), \n",
-+		    "moving %s to %s (rotatecount %d, logstart %d, i %d), \n",
- 		    oldName, newName, rotateCount, logStart, i);
+             message(MESS_DEBUG,
+-                    "renaming %s to %s (rotatecount %d, logstart %d, i %d), \n",
++                    "moving %s to %s (rotatecount %d, logstart %d, i %d), \n",
+                     oldName, newName, rotateCount, logStart, i);
  
--	    if (!debug && rename(oldName, newName)) {
-+	    if (!debug && mvFile(oldName, newName, log, prev_acl)) {
- 		if (errno == ENOENT) {
- 		    message(MESS_DEBUG, "old log %s does not exist\n",
- 			    oldName);
- 		} else {
--		    message(MESS_ERROR, "error renaming %s to %s: %s\n",
-+		    message(MESS_ERROR, "error moving %s to %s: %s\n",
- 			    oldName, newName, strerror(errno));
- 		    hasErrors = 1;
- 		}
-@@ -1767,21 +1815,21 @@ static int rotateSingleLog(struct logInfo *log, int logNum,
- 				return 1;
- 			}
+-            if (!debug && rename(oldName, newName)) {
++            if (!debug && mvFile(oldName, newName, log, prev_acl)) {
+                 if (errno == ENOENT) {
+                     message(MESS_DEBUG, "old log %s does not exist\n",
+                             oldName);
+                 } else {
+-                    message(MESS_ERROR, "error renaming %s to %s: %s\n",
++                    message(MESS_ERROR, "error moving %s to %s: %s\n",
+                             oldName, newName, strerror(errno));
+                     hasErrors = 1;
+                 }
+@@ -1891,21 +1938,21 @@ static int rotateSingleLog(struct logInfo *log, int logNum,
+                     return 1;
+                 }
  
--			message(MESS_DEBUG, "renaming %s to %s\n", log->files[logNum],
-+			message(MESS_DEBUG, "moving %s to %s\n", log->files[logNum],
- 				tmpFilename);
--			if (!debug && !hasErrors && rename(log->files[logNum], tmpFilename)) {
--			message(MESS_ERROR, "failed to rename %s to %s: %s\n",
-+			if (!debug && !hasErrors && mvFile(log->files[logNum], rotNames->finalName, log, prev_acl)) {
-+			message(MESS_ERROR, "failed to move %s to %s: %s\n",
- 				log->files[logNum], tmpFilename,
- 				strerror(errno));
- 				hasErrors = 1;
- 			}
- 		}
- 		else {
--			message(MESS_DEBUG, "renaming %s to %s\n", log->files[logNum],
-+			message(MESS_DEBUG, "moving %s to %s\n", log->files[logNum],
- 				rotNames->finalName);
- 			if (!debug && !hasErrors &&
--			rename(log->files[logNum], rotNames->finalName)) {
--				message(MESS_ERROR, "failed to rename %s to %s: %s\n",
-+			mvFile(log->files[logNum], rotNames->finalName, log, prev_acl)) {
-+				message(MESS_ERROR, "failed to move %s to %s: %s\n",
- 					log->files[logNum], rotNames->finalName,
- 					strerror(errno));
- 					hasErrors = 1;
-@@ -2170,7 +2218,7 @@ static int rotateLogSet(struct logInfo *log, int force)
+-                message(MESS_DEBUG, "renaming %s to %s\n", log->files[logNum],
++                message(MESS_DEBUG, "moving %s to %s\n", log->files[logNum],
+                         tmpFilename);
+-                if (!debug && !hasErrors && rename(log->files[logNum], tmpFilename)) {
+-                    message(MESS_ERROR, "failed to rename %s to %s: %s\n",
++                if (!debug && !hasErrors && mvFile(log->files[logNum], rotNames->finalName, log, prev_acl)) {
++                    message(MESS_ERROR, "failed to move %s to %s: %s\n",
+                             log->files[logNum], tmpFilename,
+                             strerror(errno));
+                     hasErrors = 1;
+                 }
+             }
+             else {
+-                message(MESS_DEBUG, "renaming %s to %s\n", log->files[logNum],
++                message(MESS_DEBUG, "moving %s to %s\n", log->files[logNum],
+                         rotNames->finalName);
+                 if (!debug && !hasErrors &&
+-                        rename(log->files[logNum], rotNames->finalName)) {
+-                    message(MESS_ERROR, "failed to rename %s to %s: %s\n",
++                        mvFile(log->files[logNum], rotNames->finalName, log, prev_acl)) {
++                    message(MESS_ERROR, "failed to move %s to %s: %s\n",
+                             log->files[logNum], rotNames->finalName,
+                             strerror(errno));
+                     hasErrors = 1;
+@@ -2297,7 +2344,7 @@ static int rotateLogSet(struct logInfo *log, int force)
      return hasErrors;
  }
  
 -static int writeState(const char *stateFilename)
 +static int writeState(struct logInfo *log, char *stateFilename)
  {
- 	struct logState *p;
- 	FILE *f;
-@@ -2322,7 +2370,7 @@ static int writeState(const char *stateFilename)
- 		fclose(f);
+     struct logState *p;
+     FILE *f;
+@@ -2460,7 +2507,7 @@ static int writeState(const char *stateFilename)
+         fclose(f);
  
- 	if (error == 0) {
--		if (rename(tmpFilename, stateFilename)) {
-+		if (mvFile(tmpFilename, stateFilename, log, prev_acl)) {
- 			unlink(tmpFilename);
- 			error = 1;
- 			message(MESS_ERROR, "error renaming temp state file %s\n",
-@@ -2648,7 +2696,7 @@ int main(int argc, const char **argv)
- 		rc |= rotateLogSet(log, force);
+     if (error == 0) {
+-        if (rename(tmpFilename, stateFilename)) {
++        if (mvFile(tmpFilename, stateFilename, log, prev_acl)) {
+             unlink(tmpFilename);
+             error = 1;
+             message(MESS_ERROR, "error renaming temp state file %s\n",
+@@ -2805,7 +2852,7 @@ int main(int argc, const char **argv)
+         rc |= rotateLogSet(log, force);
  
- 	if (!debug)
--		rc |= writeState(stateFile);
-+		rc |= writeState(log, stateFile);
+     if (!debug)
+-        rc |= writeState(stateFile);
++        rc |= writeState(log, stateFile);
  
- 	return (rc != 0);
+     return (rc != 0);
  }
 -- 
-1.8.3.1
+2.18.1
 
diff --git a/meta/recipes-extended/logrotate/logrotate/disable-check-different-filesystems.patch b/meta/recipes-extended/logrotate/logrotate/disable-check-different-filesystems.patch
index 793d702..96ff098 100644
--- a/meta/recipes-extended/logrotate/logrotate/disable-check-different-filesystems.patch
+++ b/meta/recipes-extended/logrotate/logrotate/disable-check-different-filesystems.patch
@@ -1,4 +1,7 @@
-Disable the check for different filesystems
+From e47796c8e8270a3d14f0b06af8a9e916c2225514 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Tue, 8 Jan 2019 06:27:06 +0000
+Subject: [PATCH] Disable the check for different filesystems
 
 The logrotate supports rotate log across different filesystems now, so
 disable the check for different filesystems.
@@ -7,26 +10,29 @@ Upstream-Status: Pending
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
- config.c |    9 ---------
+ config.c | 9 ---------
  1 file changed, 9 deletions(-)
 
 diff --git a/config.c b/config.c
-index dbbf563..64e66f6 100644
+index 633b843..99a4a3b 100644
 --- a/config.c
 +++ b/config.c
-@@ -1493,15 +1493,6 @@ static int readConfigFile(const char *configFile, struct logInfo *defConfig)
- 							goto error;
- 						}
- 					}
+@@ -1765,15 +1765,6 @@ duperror:
+                                     goto error;
+                                 }
+                             }
 -
--					if (sb.st_dev != sb2.st_dev
--						&& !(newlog->flags & (LOG_FLAG_COPYTRUNCATE | LOG_FLAG_COPY | LOG_FLAG_TMPFILENAME))) {
--						message(MESS_ERROR,
--							"%s:%d olddir %s and log file %s "
--							"are on different devices\n", configFile,
--							lineNum, newlog->oldDir, newlog->files[i]);
--						goto error;
--					}
- 				}
- 			}
+-                            if (sb.st_dev != sb2.st_dev
+-                                    && !(newlog->flags & (LOG_FLAG_COPYTRUNCATE | LOG_FLAG_COPY | LOG_FLAG_TMPFILENAME))) {
+-                                message(MESS_ERROR,
+-                                        "%s:%d olddir %s and log file %s "
+-                                        "are on different devices\n", configFile,
+-                                        lineNum, newlog->oldDir, newlog->files[i]);
+-                                goto error;
+-                            }
+                         }
+                     }
  
+-- 
+2.18.1
+
diff --git a/meta/recipes-extended/logrotate/logrotate_3.14.0.bb b/meta/recipes-extended/logrotate/logrotate_3.15.0.bb
similarity index 94%
rename from meta/recipes-extended/logrotate/logrotate_3.14.0.bb
rename to meta/recipes-extended/logrotate/logrotate_3.15.0.bb
index ccc68ad..0f3da2b 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.14.0.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.15.0.bb
@@ -25,8 +25,8 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz
             file://disable-check-different-filesystems.patch \
             "
 
-SRC_URI[md5sum] = "1c0f6e6e490c4bcac0a1e77ad1310683"
-SRC_URI[sha256sum] = "4703bdc0e2df3b322f9dff0aafc99aa9172c9e4acae28b7c924cc7d4e5b29d55"
+SRC_URI[md5sum] = "320046f0b9fc38337e8827d4c5a866a0"
+SRC_URI[sha256sum] = "313612c4776a305393454c874ef590d8acf84c9ffa648717731dfe902284ff8f"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)}"
 
@@ -72,7 +72,7 @@ do_install(){
     oe_runmake install DESTDIR=${D} PREFIX=${D} MANDIR=${mandir}
     mkdir -p ${D}${sysconfdir}/logrotate.d
     mkdir -p ${D}${localstatedir}/lib
-    install -p -m 644 ${S}/examples/logrotate-default ${D}${sysconfdir}/logrotate.conf
+    install -p -m 644 ${S}/examples/logrotate.conf ${D}${sysconfdir}/logrotate.conf
     install -p -m 644 ${S}/examples/btmp ${D}${sysconfdir}/logrotate.d/btmp
     install -p -m 644 ${S}/examples/wtmp ${D}${sysconfdir}/logrotate.d/wtmp
     touch ${D}${localstatedir}/lib/logrotate.status
-- 
2.7.4


