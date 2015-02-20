Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 641DE73594
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 05:37:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1K5bNF3024473
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 21:37:23 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 19 Feb 2015 21:37:23 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Feb 2015 21:37:21 -0800
Message-ID: <575893849fbe665f5976958e4ad82f22b4136b4f.1424410597.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1424410597.git.liezhi.yang@windriver.com>
References: <cover.1424410597.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] logrotate: 3.8.8 -> 3.8.9
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
X-List-Received-Date: Fri, 20 Feb 2015 05:37:24 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../logrotate/act-as-mv-when-rotate.patch          |   48 ++++++++++----------
 .../disable-check-different-filesystems.patch      |   30 ++++++------
 .../logrotate/logrotate/update-the-manual.patch    |   26 +++++++----
 .../{logrotate_3.8.8.bb => logrotate_3.8.9.bb}     |    4 +-
 4 files changed, 60 insertions(+), 48 deletions(-)
 rename meta/recipes-extended/logrotate/{logrotate_3.8.8.bb => logrotate_3.8.9.bb} (93%)

diff --git a/meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch b/meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch
index ce64040..15f171e 100644
--- a/meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch
+++ b/meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch
@@ -1,9 +1,12 @@
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
@@ -11,10 +14,10 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  1 file changed, 56 insertions(+), 9 deletions(-)
 
 diff --git a/logrotate.c b/logrotate.c
-index 174a26b..b18b629 100644
+index 05e74c9..616418f 100644
 --- a/logrotate.c
 +++ b/logrotate.c
-@@ -906,6 +906,53 @@ int findNeedRotating(struct logInfo *log, int logNum, int force)
+@@ -1000,6 +1000,53 @@ int findNeedRotating(struct logInfo *log, int logNum, int force)
      return 0;
  }
  
@@ -68,7 +71,7 @@ index 174a26b..b18b629 100644
  int prerotateSingleLog(struct logInfo *log, int logNum, struct logState *state,
  		       struct logNames *rotNames)
  {
-@@ -1268,15 +1315,15 @@ int prerotateSingleLog(struct logInfo *log, int logNum, struct logState *state,
+@@ -1364,15 +1411,15 @@ int prerotateSingleLog(struct logInfo *log, int logNum, struct logState *state,
  		}
  
  	    message(MESS_DEBUG,
@@ -87,22 +90,21 @@ index 174a26b..b18b629 100644
  			    oldName, newName, strerror(errno));
  		    hasErrors = 1;
  		}
-@@ -1408,11 +1455,11 @@ int rotateSingleLog(struct logInfo *log, int logNum, struct logState *state,
+@@ -1511,10 +1558,10 @@ int rotateSingleLog(struct logInfo *log, int logNum, struct logState *state,
+ 				return 1;
  			}
- 		}
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
+ 				if (errno == ENOENT) {
+@@ -1912,7 +1959,7 @@ int rotateLogSet(struct logInfo *log, int force)
      return hasErrors;
  }
  
@@ -111,7 +113,7 @@ index 174a26b..b18b629 100644
  {
  	struct logState *p;
  	FILE *f;
-@@ -1939,7 +1986,7 @@ static int writeState(char *stateFilename)
+@@ -2076,7 +2123,7 @@ static int writeState(char *stateFilename)
  		fclose(f);
  
  	if (error == 0) {
@@ -120,7 +122,7 @@ index 174a26b..b18b629 100644
  			unlink(tmpFilename);
  			error = 1;
  			message(MESS_ERROR, "error renaming temp state file %s\n",
-@@ -2223,7 +2270,7 @@ int main(int argc, const char **argv)
+@@ -2362,7 +2409,7 @@ int main(int argc, const char **argv)
  		rc |= rotateLogSet(log, force);
  
  	if (!debug)
@@ -130,5 +132,5 @@ index 174a26b..b18b629 100644
  	return (rc != 0);
  }
 -- 
-1.7.10.4
+1.7.9.5
 
diff --git a/meta/recipes-extended/logrotate/logrotate/disable-check-different-filesystems.patch b/meta/recipes-extended/logrotate/logrotate/disable-check-different-filesystems.patch
index 43ebcff..0535a45 100644
--- a/meta/recipes-extended/logrotate/logrotate/disable-check-different-filesystems.patch
+++ b/meta/recipes-extended/logrotate/logrotate/disable-check-different-filesystems.patch
@@ -1,9 +1,12 @@
-Disable the check for different filesystems
+From 263212af7b7fe1083f777255d91f029401391e4f Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Tue, 17 Feb 2015 21:18:39 -0800
+Subject: [PATCH] Disable the check for different filesystems
 
 The logrotate supports rotate log across different filesystems now, so
 disable the check for different filesystems.
 
-Upstream-Status: Submitted
+Upstream-Status: Pending
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
@@ -11,24 +14,25 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
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
  
 -- 
 1.7.9.5
+
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
 
diff --git a/meta/recipes-extended/logrotate/logrotate_3.8.8.bb b/meta/recipes-extended/logrotate/logrotate_3.8.9.bb
similarity index 93%
rename from meta/recipes-extended/logrotate/logrotate_3.8.8.bb
rename to meta/recipes-extended/logrotate/logrotate_3.8.9.bb
index 00432de..8611a3e 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.8.8.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.8.9.bb
@@ -16,8 +16,8 @@ SRC_URI = "https://fedorahosted.org/releases/l/o/logrotate/logrotate-${PV}.tar.g
            file://disable-check-different-filesystems.patch \
             "
 
-SRC_URI[md5sum] = "49846e873dddea15964cd0355b9943ca"
-SRC_URI[sha256sum] = "46a1510ef4a1f4359edd5f361112cfd1523942e85ff28e6cbb0c81bad1829d0f"
+SRC_URI[md5sum] = "2660f30742da79870d15d042b07829f6"
+SRC_URI[sha256sum] = "700ed7ce9072a1cca324779a74797dfaefdae37ac50a817134b947c4ded1dfa7"
 
 PACKAGECONFIG ?= "\
     ${@base_contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
-- 
1.7.9.5


