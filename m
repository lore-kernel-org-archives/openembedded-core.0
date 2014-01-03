Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 462176B912
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2014 09:43:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s039hKre018050
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Jan 2014 01:43:20 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 3 Jan 2014 01:43:20 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 4 Jan 2014 01:45:48 +0800
Message-ID: <60973323434c9cbaa536cdac39c655470ca5ebe3.1388771106.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1388771106.git.liezhi.yang@windriver.com>
References: <cover.1388771106.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] logrotate: upgrade to 3.8.7
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
X-List-Received-Date: Fri, 03 Jan 2014 09:43:19 -0000
Content-Type: text/plain

* Upgrade to 3.8.7
* Rename the patches dir from logrotate-3.8.1 -> logrotate
* Remove grotate-CVE-2011-1548.patch since it had been fixed
* Update act-as-mv-when-rotate.patch and update-the-manual.patch to make
  them work with the higher version, and send them to the upstream
* Fix the HOMEPAGE

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../act-as-mv-when-rotate.patch                    | 53 ++++++++++++++++------
 .../disable-check-different-filesystems.patch      |  2 +-
 .../logrotate-CVE-2011-1548.patch                  |  0
 .../update-the-manual.patch                        | 18 ++------
 .../{logrotate_3.8.1.bb => logrotate_3.8.7.bb}     |  8 ++--
 5 files changed, 48 insertions(+), 33 deletions(-)
 rename meta/recipes-extended/logrotate/{logrotate-3.8.1 => logrotate}/act-as-mv-when-rotate.patch (65%)
 rename meta/recipes-extended/logrotate/{logrotate-3.8.1 => logrotate}/disable-check-different-filesystems.patch (96%)
 rename meta/recipes-extended/logrotate/{logrotate-3.8.1 => logrotate}/logrotate-CVE-2011-1548.patch (100%)
 rename meta/recipes-extended/logrotate/{logrotate-3.8.1 => logrotate}/update-the-manual.patch (61%)
 rename meta/recipes-extended/logrotate/{logrotate_3.8.1.bb => logrotate_3.8.7.bb} (78%)

diff --git a/meta/recipes-extended/logrotate/logrotate-3.8.1/act-as-mv-when-rotate.patch b/meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch
similarity index 65%
rename from meta/recipes-extended/logrotate/logrotate-3.8.1/act-as-mv-when-rotate.patch
rename to meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch
index c9fb1d2..ce64040 100644
--- a/meta/recipes-extended/logrotate/logrotate-3.8.1/act-as-mv-when-rotate.patch
+++ b/meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch
@@ -3,18 +3,18 @@ Act as the "mv" command when rotate log
 Act as the "mv" command when rotate log, first rename, if failed, then
 read and write.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
- logrotate.c |   59 +++++++++++++++++++++++++++++++++++++++++++++++++++++------
- 1 files changed, 53 insertions(+), 6 deletions(-)
+ logrotate.c |   65 ++++++++++++++++++++++++++++++++++++++++++++++++++---------
+ 1 file changed, 56 insertions(+), 9 deletions(-)
 
 diff --git a/logrotate.c b/logrotate.c
-index 537e8d6..b04482f 100644
+index 174a26b..b18b629 100644
 --- a/logrotate.c
 +++ b/logrotate.c
-@@ -808,6 +808,53 @@ int findNeedRotating(struct logInfo *log, int logNum)
+@@ -906,6 +906,53 @@ int findNeedRotating(struct logInfo *log, int logNum, int force)
      return 0;
  }
  
@@ -23,7 +23,7 @@ index 537e8d6..b04482f 100644
 + * the strerror(errorno) to handle the error message, so we don't have
 + * to print the error message here */
 +
-+int mvFile (char *oldName, char *newName, struct logInfo *log)
++int mvFile (char *oldName, char *newName, struct logInfo *log, acl_type acl)
 +{
 +    struct stat sbprev;
 +    int fd_old, fd_new, n;
@@ -45,7 +45,7 @@ index 537e8d6..b04482f 100644
 +            return 1;
 +        else {
 +            if ((fd_new = createOutputFile(newName,
-+                O_WRONLY | O_CREAT | O_TRUNC, &sbprev)) < 0 )
++                O_WRONLY | O_CREAT | O_TRUNC, &sbprev, acl, 0)) < 0 )
 +                return 1;
 +        }
 +
@@ -68,8 +68,8 @@ index 537e8d6..b04482f 100644
  int prerotateSingleLog(struct logInfo *log, int logNum, struct logState *state,
  		       struct logNames *rotNames)
  {
-@@ -1148,15 +1195,15 @@ int prerotateSingleLog(struct logInfo *log, int logNum, struct logState *state,
- 		    rotNames->baseName, i, fileext, compext);
+@@ -1268,15 +1315,15 @@ int prerotateSingleLog(struct logInfo *log, int logNum, struct logState *state,
+ 		}
  
  	    message(MESS_DEBUG,
 -		    "renaming %s to %s (rotatecount %d, logstart %d, i %d), \n",
@@ -77,7 +77,7 @@ index 537e8d6..b04482f 100644
  		    oldName, newName, rotateCount, logStart, i);
  
 -	    if (!debug && rename(oldName, newName)) {
-+	    if (!debug && mvFile(oldName, newName, log)) {
++	    if (!debug && mvFile(oldName, newName, log, prev_acl)) {
  		if (errno == ENOENT) {
  		    message(MESS_DEBUG, "old log %s does not exist\n",
  			    oldName);
@@ -87,7 +87,7 @@ index 537e8d6..b04482f 100644
  			    oldName, newName, strerror(errno));
  		    hasErrors = 1;
  		}
-@@ -1286,11 +1333,11 @@ int rotateSingleLog(struct logInfo *log, int logNum, struct logState *state,
+@@ -1408,11 +1455,11 @@ int rotateSingleLog(struct logInfo *log, int logNum, struct logState *state,
  			}
  		}
  #endif /* WITH_ACL */
@@ -97,11 +97,38 @@ index 537e8d6..b04482f 100644
  	    if (!debug && !hasErrors &&
 -		rename(log->files[logNum], rotNames->finalName)) {
 -		message(MESS_ERROR, "failed to rename %s to %s: %s\n",
-+        mvFile(log->files[logNum], rotNames->finalName, log)) {
++        mvFile(log->files[logNum], rotNames->finalName, log, prev_acl)) {
 +        message(MESS_ERROR, "failed to move %s to %s: %s\n",
  			log->files[logNum], rotNames->finalName,
  			strerror(errno));
  			hasErrors = 1;
+@@ -1775,7 +1822,7 @@ int rotateLogSet(struct logInfo *log, int force)
+     return hasErrors;
+ }
+ 
+-static int writeState(char *stateFilename)
++static int writeState(struct logInfo *log, char *stateFilename)
+ {
+ 	struct logState *p;
+ 	FILE *f;
+@@ -1939,7 +1986,7 @@ static int writeState(char *stateFilename)
+ 		fclose(f);
+ 
+ 	if (error == 0) {
+-		if (rename(tmpFilename, stateFilename)) {
++		if (mvFile(tmpFilename, stateFilename, log, prev_acl)) {
+ 			unlink(tmpFilename);
+ 			error = 1;
+ 			message(MESS_ERROR, "error renaming temp state file %s\n",
+@@ -2223,7 +2270,7 @@ int main(int argc, const char **argv)
+ 		rc |= rotateLogSet(log, force);
+ 
+ 	if (!debug)
+-		rc |= writeState(stateFile);
++		rc |= writeState(log, stateFile);
+ 
+ 	return (rc != 0);
+ }
 -- 
-1.7.4.1
+1.7.10.4
 
diff --git a/meta/recipes-extended/logrotate/logrotate-3.8.1/disable-check-different-filesystems.patch b/meta/recipes-extended/logrotate/logrotate/disable-check-different-filesystems.patch
similarity index 96%
rename from meta/recipes-extended/logrotate/logrotate-3.8.1/disable-check-different-filesystems.patch
rename to meta/recipes-extended/logrotate/logrotate/disable-check-different-filesystems.patch
index 5cb6038..43068bd 100644
--- a/meta/recipes-extended/logrotate/logrotate-3.8.1/disable-check-different-filesystems.patch
+++ b/meta/recipes-extended/logrotate/logrotate/disable-check-different-filesystems.patch
@@ -3,7 +3,7 @@ Disable the check for different filesystems
 The logrotate supports rotate log across different filesystems now, so
 disable the check for different filesystems.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
diff --git a/meta/recipes-extended/logrotate/logrotate-3.8.1/logrotate-CVE-2011-1548.patch b/meta/recipes-extended/logrotate/logrotate/logrotate-CVE-2011-1548.patch
similarity index 100%
rename from meta/recipes-extended/logrotate/logrotate-3.8.1/logrotate-CVE-2011-1548.patch
rename to meta/recipes-extended/logrotate/logrotate/logrotate-CVE-2011-1548.patch
diff --git a/meta/recipes-extended/logrotate/logrotate-3.8.1/update-the-manual.patch b/meta/recipes-extended/logrotate/logrotate/update-the-manual.patch
similarity index 61%
rename from meta/recipes-extended/logrotate/logrotate-3.8.1/update-the-manual.patch
rename to meta/recipes-extended/logrotate/logrotate/update-the-manual.patch
index 5cab649..517acdd 100644
--- a/meta/recipes-extended/logrotate/logrotate-3.8.1/update-the-manual.patch
+++ b/meta/recipes-extended/logrotate/logrotate/update-the-manual.patch
@@ -1,14 +1,13 @@
 Update the manual
 
-* Update the mannual
-* Fix a bug in the mannual(\f should be \fR)
+Update the manual for rotating on different filesystems.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
- logrotate.8 |    9 ++++-----
- 1 files changed, 4 insertions(+), 5 deletions(-)
+ logrotate.8 |    7 +++----
+ 1 files changed, 3 insertions(+), 4 deletions(-)
 
 diff --git a/logrotate.8 b/logrotate.8
 index 8b34167..5f15432 100644
@@ -28,15 +27,6 @@ index 8b34167..5f15432 100644
  overridden by the \fBnoolddir\fR option.
  
  .TP
-@@ -435,7 +434,7 @@ Log files are rotated only if they grow bigger then \fIsize\fR bytes. If
- \fIsize\fR is followed by \fIk\fR, the size is assumed to be in kilobytes.
- If the \fIM\fR is used, the size is in megabytes, and if \fIG\fR is used, the
- size is in gigabytes. So \fBsize 100\fR, \fIsize 100k\fR, \fIsize 100M\fR and
--\fIsize 100G\f are all valid.
-+\fIsize 100G\fR are all valid.
- 
- .TP
- \fBsharedscripts\fR
 -- 
 1.7.4.1
 
diff --git a/meta/recipes-extended/logrotate/logrotate_3.8.1.bb b/meta/recipes-extended/logrotate/logrotate_3.8.7.bb
similarity index 78%
rename from meta/recipes-extended/logrotate/logrotate_3.8.1.bb
rename to meta/recipes-extended/logrotate/logrotate_3.8.7.bb
index b12a325..055bfd56 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.8.1.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.8.7.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Rotates, compresses, removes and mails system log files"
 SECTION = "console/utils"
-HOMEPAGE = "https://fedorahosted.org/releases/l/o/logrotate"
+HOMEPAGE = "https://fedorahosted.org/logrotate/"
 LICENSE = "GPLv2"
 
 DEPENDS="coreutils popt"
@@ -11,12 +11,10 @@ SRC_URI = "https://fedorahosted.org/releases/l/o/logrotate/logrotate-${PV}.tar.g
            file://act-as-mv-when-rotate.patch \
            file://disable-check-different-filesystems.patch \
            file://update-the-manual.patch \
-           file://logrotate-CVE-2011-1548.patch \
             "
 
-SRC_URI[md5sum] = "bd2e20d8dc644291b08f9215397d28a5"
-SRC_URI[sha256sum] = "c12471e70ae8bc923bd5c4f25e8fd6483b68c6301f3cd79f7cfe37bc5b370169"
-
+SRC_URI[md5sum] = "99e08503ef24c3e2e3ff74cc5f3be213"
+SRC_URI[sha256sum] = "f6ba691f40e30e640efa2752c1f9499a3f9738257660994de70a45fe00d12b64"
 
 EXTRA_OEMAKE = "CC='${CC}'"
 
-- 
1.8.3.1


