Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3D24073231
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 03:26:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5U3QbNR014099
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 20:26:37 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 29 Jun 2015 20:26:37 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Jun 2015 20:26:36 -0700
Message-ID: <f9ba2763dae1aa0e4839d0eafed13843c0425912.1435634748.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1435634748.git.liezhi.yang@windriver.com>
References: <cover.1435634748.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] logrotate: 3.8.8 -> 3.9.1
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
X-List-Received-Date: Tue, 30 Jun 2015 03:26:36 -0000
Content-Type: text/plain

Updated:
- act-as-mv-when-rotate.patch
- disable-check-different-filesystems.patch
- update-the-manual.patch
- base_contains -> bb.utils.contains

[YOCTO #7346]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../logrotate/act-as-mv-when-rotate.patch          |   65 ++++++++++++--------
 .../disable-check-different-filesystems.patch      |   26 ++++----
 .../logrotate/logrotate/update-the-manual.patch    |   26 +++++---
 .../{logrotate_3.8.8.bb => logrotate_3.9.1.bb}     |   14 ++---
 4 files changed, 73 insertions(+), 58 deletions(-)
 rename meta/recipes-extended/logrotate/{logrotate_3.8.8.bb => logrotate_3.9.1.bb} (80%)

diff --git a/meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch b/meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch
index ce64040..2e931a2 100644
--- a/meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch
+++ b/meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch
@@ -1,20 +1,23 @@
-Act as the "mv" command when rotate log
+From 68f29ab490cf987aa34b5f4caf1784b58a021308 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Tue, 17 Feb 2015 21:08:07 -0800
+Subject: [PATCH] Act as the "mv" command when rotate log
 
 Act as the "mv" command when rotate log, first rename, if failed, then
 read and write.
 
-Upstream-Status: Submitted
+Upstream-Status: Pending
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
- logrotate.c |   65 ++++++++++++++++++++++++++++++++++++++++++++++++++---------
- 1 file changed, 56 insertions(+), 9 deletions(-)
+ logrotate.c |   71 +++++++++++++++++++++++++++++++++++++++++++++++++----------
+ 1 file changed, 59 insertions(+), 12 deletions(-)
 
 diff --git a/logrotate.c b/logrotate.c
-index 174a26b..b18b629 100644
+index d3deb6a..cf8bf2c 100644
 --- a/logrotate.c
 +++ b/logrotate.c
-@@ -906,6 +906,53 @@ int findNeedRotating(struct logInfo *log, int logNum, int force)
+@@ -1157,6 +1157,53 @@ int findNeedRotating(struct logInfo *log, int logNum, int force)
      return 0;
  }
  
@@ -68,7 +71,7 @@ index 174a26b..b18b629 100644
  int prerotateSingleLog(struct logInfo *log, int logNum, struct logState *state,
  		       struct logNames *rotNames)
  {
-@@ -1268,15 +1315,15 @@ int prerotateSingleLog(struct logInfo *log, int logNum, struct logState *state,
+@@ -1523,15 +1570,15 @@ int prerotateSingleLog(struct logInfo *log, int logNum, struct logState *state,
  		}
  
  	    message(MESS_DEBUG,
@@ -87,22 +90,35 @@ index 174a26b..b18b629 100644
  			    oldName, newName, strerror(errno));
  		    hasErrors = 1;
  		}
-@@ -1408,11 +1455,11 @@ int rotateSingleLog(struct logInfo *log, int logNum, struct logState *state,
+@@ -1669,21 +1716,21 @@ int rotateSingleLog(struct logInfo *log, int logNum, struct logState *state,
+ 				return 1;
+ 			}
+ 
+-			message(MESS_DEBUG, "renaming %s to %s\n", log->files[logNum],
++			message(MESS_DEBUG, "moving %s to %s\n", log->files[logNum],
+ 				tmpFilename);
+-			if (!debug && !hasErrors && rename(log->files[logNum], tmpFilename)) {
+-			message(MESS_ERROR, "failed to rename %s to %s: %s\n",
++			if (!debug && !hasErrors && mvFile(log->files[logNum], rotNames->finalName, log, prev_acl)) {
++			message(MESS_ERROR, "failed to move %s to %s: %s\n",
+ 				log->files[logNum], tmpFilename,
+ 				strerror(errno));
+ 				hasErrors = 1;
  			}
  		}
- #endif /* WITH_ACL */
--		message(MESS_DEBUG, "renaming %s to %s\n", log->files[logNum],
-+        message(MESS_DEBUG, "moving %s to %s\n", log->files[logNum],
- 		    rotNames->finalName);
- 	    if (!debug && !hasErrors &&
--		rename(log->files[logNum], rotNames->finalName)) {
--		message(MESS_ERROR, "failed to rename %s to %s: %s\n",
-+        mvFile(log->files[logNum], rotNames->finalName, log, prev_acl)) {
-+        message(MESS_ERROR, "failed to move %s to %s: %s\n",
- 			log->files[logNum], rotNames->finalName,
- 			strerror(errno));
- 			hasErrors = 1;
-@@ -1775,7 +1822,7 @@ int rotateLogSet(struct logInfo *log, int force)
+ 		else {
+-			message(MESS_DEBUG, "renaming %s to %s\n", log->files[logNum],
++			message(MESS_DEBUG, "moving %s to %s\n", log->files[logNum],
+ 				rotNames->finalName);
+ 			if (!debug && !hasErrors &&
+-			rename(log->files[logNum], rotNames->finalName)) {
+-				message(MESS_ERROR, "failed to rename %s to %s: %s\n",
++			mvFile(log->files[logNum], rotNames->finalName, log, prev_acl)) {
++				message(MESS_ERROR, "failed to move %s to %s: %s\n",
+ 					log->files[logNum], tmpFilename,
+ 					strerror(errno));
+ 					hasErrors = 1;
+@@ -2063,7 +2110,7 @@ int rotateLogSet(struct logInfo *log, int force)
      return hasErrors;
  }
  
@@ -111,7 +127,7 @@ index 174a26b..b18b629 100644
  {
  	struct logState *p;
  	FILE *f;
-@@ -1939,7 +1986,7 @@ static int writeState(char *stateFilename)
+@@ -2227,7 +2274,7 @@ static int writeState(char *stateFilename)
  		fclose(f);
  
  	if (error == 0) {
@@ -120,7 +136,7 @@ index 174a26b..b18b629 100644
  			unlink(tmpFilename);
  			error = 1;
  			message(MESS_ERROR, "error renaming temp state file %s\n",
-@@ -2223,7 +2270,7 @@ int main(int argc, const char **argv)
+@@ -2525,7 +2572,7 @@ int main(int argc, const char **argv)
  		rc |= rotateLogSet(log, force);
  
  	if (!debug)
@@ -129,6 +145,3 @@ index 174a26b..b18b629 100644
  
  	return (rc != 0);
  }
--- 
-1.7.10.4
-
diff --git a/meta/recipes-extended/logrotate/logrotate/disable-check-different-filesystems.patch b/meta/recipes-extended/logrotate/logrotate/disable-check-different-filesystems.patch
index 43ebcff..793d702 100644
--- a/meta/recipes-extended/logrotate/logrotate/disable-check-different-filesystems.patch
+++ b/meta/recipes-extended/logrotate/logrotate/disable-check-different-filesystems.patch
@@ -3,7 +3,7 @@ Disable the check for different filesystems
 The logrotate supports rotate log across different filesystems now, so
 disable the check for different filesystems.
 
-Upstream-Status: Submitted
+Upstream-Status: Pending
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
@@ -11,24 +11,22 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  1 file changed, 9 deletions(-)
 
 diff --git a/config.c b/config.c
-index e0eadb7..c23092f 100644
+index dbbf563..64e66f6 100644
 --- a/config.c
 +++ b/config.c
-@@ -1515,15 +1515,6 @@ static int readConfigFile(const char *configFile, struct logInfo *defConfig)
- 						dirName, strerror(errno));
- 					goto error;
+@@ -1493,15 +1493,6 @@ static int readConfigFile(const char *configFile, struct logInfo *defConfig)
+ 							goto error;
+ 						}
  					}
 -
 -					if (sb.st_dev != sb2.st_dev
--						&& !(newlog->flags & (LOG_FLAG_COPYTRUNCATE | LOG_FLAG_COPY))) {
--					message(MESS_ERROR,
--						"%s:%d olddir %s and log file %s "
--						"are on different devices\n", configFile,
--						lineNum, newlog->oldDir, newlog->files[i]);
--					goto error;
+-						&& !(newlog->flags & (LOG_FLAG_COPYTRUNCATE | LOG_FLAG_COPY | LOG_FLAG_TMPFILENAME))) {
+-						message(MESS_ERROR,
+-							"%s:%d olddir %s and log file %s "
+-							"are on different devices\n", configFile,
+-							lineNum, newlog->oldDir, newlog->files[i]);
+-						goto error;
 -					}
  				}
- 				}
+ 			}
  
--- 
-1.7.9.5
diff --git a/meta/recipes-extended/logrotate/logrotate/update-the-manual.patch b/meta/recipes-extended/logrotate/logrotate/update-the-manual.patch
index 517acdd..50d037d 100644
--- a/meta/recipes-extended/logrotate/logrotate/update-the-manual.patch
+++ b/meta/recipes-extended/logrotate/logrotate/update-the-manual.patch
@@ -1,26 +1,32 @@
-Update the manual
+From e0b0fe30e9c49234994a20a86aacfaf80e690087 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Tue, 17 Feb 2015 21:14:37 -0800
+Subject: [PATCH] Update the manual
 
 Update the manual for rotating on different filesystems.
 
-Upstream-Status: Submitted
+Upstream-Status: Pending
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
- logrotate.8 |    7 +++----
- 1 files changed, 3 insertions(+), 4 deletions(-)
+ logrotate.8 |   10 ++++------
+ 1 file changed, 4 insertions(+), 6 deletions(-)
 
 diff --git a/logrotate.8 b/logrotate.8
-index 8b34167..5f15432 100644
+index e4e5f48..84407d0 100644
 --- a/logrotate.8
 +++ b/logrotate.8
-@@ -374,10 +374,9 @@ Do not rotate the log if it is empty (this overrides the \fBifempty\fR option).
+@@ -405,12 +405,10 @@ Do not rotate the log if it is empty (this overrides the \fBifempty\fR option).
+ 
  .TP
  \fBolddir \fIdirectory\fR
- Logs are moved into \fIdirectory\fR for rotation. The \fIdirectory\fR
--must be on the same physical device as the log file being rotated,
--and is assumed to be relative to the directory holding the log file
+-Logs are moved into \fIdirectory\fR for rotation. The \fIdirectory\fR must be
+-on the same physical device as the log file being rotated, unless \fBcopy\fR,
+-\fBcopytruncate\fR or \fBrenamecopy\fR option is used. The \fIdirectory\fR
+-is assumed to be relative to the directory holding the log file
 -unless an absolute path name is specified. When this option is used all
 -old versions of the log end up in \fIdirectory\fR.  This option may be
++Logs are moved into \fIdirectory\fR for rotation. The \fIdirectory\fR
 +is assumed to be relative to the directory holding the log file unless
 +an absolute path name is specified. When this option is used all old
 +versions of the log end up in \fIdirectory\fR. This option may be
@@ -28,5 +34,5 @@ index 8b34167..5f15432 100644
  
  .TP
 -- 
-1.7.4.1
+1.7.9.5
 
diff --git a/meta/recipes-extended/logrotate/logrotate_3.8.8.bb b/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
similarity index 80%
rename from meta/recipes-extended/logrotate/logrotate_3.8.8.bb
rename to meta/recipes-extended/logrotate/logrotate_3.9.1.bb
index e3cfa90..7d0a159 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.8.8.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
@@ -16,12 +16,12 @@ SRC_URI = "https://fedorahosted.org/releases/l/o/logrotate/logrotate-${PV}.tar.g
            file://disable-check-different-filesystems.patch \
             "
 
-SRC_URI[md5sum] = "49846e873dddea15964cd0355b9943ca"
-SRC_URI[sha256sum] = "46a1510ef4a1f4359edd5f361112cfd1523942e85ff28e6cbb0c81bad1829d0f"
+SRC_URI[md5sum] = "4492b145b6d542e4a2f41e77fa199ab0"
+SRC_URI[sha256sum] = "022769e3288c80981559a8421703c88e8438b447235e36dd3c8e97cd94c52545"
 
 PACKAGECONFIG ?= "\
-    ${@base_contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
-    ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
 "
 
 PACKAGECONFIG[acl] = ",,acl"
@@ -35,13 +35,11 @@ CONFFILES_${PN} += "${localstatedir}/lib/logrotate.status \
 EXTRA_OEMAKE = "\
     LFS= \
     OS_NAME='${OS_NAME}' \
-    \
     'CC=${CC}' \
     'RPM_OPT_FLAGS=${CFLAGS}' \
     'EXTRA_LDFLAGS=${LDFLAGS}' \
-    \
-    ${@base_contains('PACKAGECONFIG', 'acl', 'WITH_ACL=yes', '', d)} \
-    ${@base_contains('PACKAGECONFIG', 'selinux', 'WITH_SELINUX=yes', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'acl', 'WITH_ACL=yes', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'selinux', 'WITH_SELINUX=yes', '', d)} \
 "
 
 # OS_NAME in the makefile defaults to `uname -s`. The behavior for
-- 
1.7.9.5


