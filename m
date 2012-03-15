Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1S8Axo-0004OF-Va
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 14:43:33 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2FDYj4C027472
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 06:34:45 -0700 (PDT)
Received: from build-PowerEdge-T100.corp.ad.wrs.com (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 15 Mar 2012 06:34:45 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Mar 2012 21:34:20 +0800
Message-ID: <6eb1820a00ae16ab71793e5ecab0389c14638ae2.1331818182.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1331818182.git.liezhi.yang@windriver.com>
References: <cover.1331818182.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] upgrade logrotate: split the old patch into 3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Mar 2012 13:43:33 -0000
Content-Type: text/plain

Split the old patch into 3 during upgrading, this makes it easier for
the future's upgrade.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../act-as-mv-when-rotate.patch}                   |   73 ++++----------------
 .../disable-check-different-filesystems.patch      |   34 +++++++++
 .../logrotate-3.8.1/update-the-manual.patch        |   42 +++++++++++
 3 files changed, 89 insertions(+), 60 deletions(-)
 rename meta/recipes-extended/logrotate/{logrotate-3.7.9/allow-across-different-filesystems.patch => logrotate-3.8.1/act-as-mv-when-rotate.patch} (54%)
 create mode 100644 meta/recipes-extended/logrotate/logrotate-3.8.1/disable-check-different-filesystems.patch
 create mode 100644 meta/recipes-extended/logrotate/logrotate-3.8.1/update-the-manual.patch

diff --git a/meta/recipes-extended/logrotate/logrotate-3.7.9/allow-across-different-filesystems.patch b/meta/recipes-extended/logrotate/logrotate-3.8.1/act-as-mv-when-rotate.patch
similarity index 54%
rename from meta/recipes-extended/logrotate/logrotate-3.7.9/allow-across-different-filesystems.patch
rename to meta/recipes-extended/logrotate/logrotate-3.8.1/act-as-mv-when-rotate.patch
index 41df23f..c9fb1d2 100644
--- a/meta/recipes-extended/logrotate/logrotate-3.7.9/allow-across-different-filesystems.patch
+++ b/meta/recipes-extended/logrotate/logrotate-3.8.1/act-as-mv-when-rotate.patch
@@ -1,67 +1,20 @@
-Allow rotate log across different filesystems
+Act as the "mv" command when rotate log
 
-* Remove the check for different filesystems
-* Act as the "mv" command when rotate log
-* Update the mannual
-* Fix a bug in the mannual(\f should be \fR)
+Act as the "mv" command when rotate log, first rename, if failed, then
+read and write.
 
 Upstream-Status: Pending
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
- config.c    |    8 --------
- logrotate.8 |    9 ++++-----
  logrotate.c |   59 +++++++++++++++++++++++++++++++++++++++++++++++++++++------
- 3 files changed, 57 insertions(+), 19 deletions(-)
+ 1 files changed, 53 insertions(+), 6 deletions(-)
 
-diff --git a/config.c b/config.c
---- a/config.c
-+++ b/config.c
-@@ -1482,14 +1482,6 @@ duperror:
- 				dirName, strerror(errno));
- 			goto error;
- 		    }
--
--		    if (sb.st_dev != sb2.st_dev) {
--			message(MESS_ERROR,
--				"%s:%d olddir %s and log file %s "
--				"are on different devices\n", configFile,
--				lineNum, newlog->oldDir, newlog->files[i]);
--			goto error;
--		    }
- 		}
- 	    }
- 
-diff --git a/logrotate.8 b/logrotate.8
---- a/logrotate.8
-+++ b/logrotate.8
-@@ -354,10 +354,9 @@ Do not rotate the log if it is empty (this overrides the \fBifempty\fR option).
- .TP
- \fBolddir \fIdirectory\fR
- Logs are moved into \fIdirectory\fR for rotation. The \fIdirectory\fR
--must be on the same physical device as the log file being rotated,
--and is assumed to be relative to the directory holding the log file
--unless an absolute path name is specified. When this option is used all
--old versions of the log end up in \fIdirectory\fR.  This option may be
-+is assumed to be relative to the directory holding the log file unless
-+an absolute path name is specified. When this option is used all old
-+versions of the log end up in \fIdirectory\fR. This option may be
- overridden by the \fBnoolddir\fR option.
- 
- .TP
-@@ -415,7 +414,7 @@ Log files are rotated when they grow bigger than \fIsize\fR bytes. If
- \fIsize\fR is followed by \fIk\fR, the size is assumed to be in kilobytes.
- If the \fIM\fR is used, the size is in megabytes, and if \fIG\fR is used, the
- size is in gigabytes. So \fBsize 100\fR, \fIsize 100k\fR, \fIsize 100M\fR and
--\fIsize 100G\f are all valid.
-+\fIsize 100G\fR are all valid.
- 
- .TP
- \fBsharedscripts\fR
 diff --git a/logrotate.c b/logrotate.c
+index 537e8d6..b04482f 100644
 --- a/logrotate.c
 +++ b/logrotate.c
-@@ -625,6 +625,53 @@ int findNeedRotating(struct logInfo *log, int logNum)
+@@ -808,6 +808,53 @@ int findNeedRotating(struct logInfo *log, int logNum)
      return 0;
  }
  
@@ -115,7 +68,7 @@ diff --git a/logrotate.c b/logrotate.c
  int prerotateSingleLog(struct logInfo *log, int logNum, struct logState *state,
  		       struct logNames *rotNames)
  {
-@@ -958,15 +1005,15 @@ int prerotateSingleLog(struct logInfo *log, int logNum, struct logState *state,
+@@ -1148,15 +1195,15 @@ int prerotateSingleLog(struct logInfo *log, int logNum, struct logState *state,
  		    rotNames->baseName, i, fileext, compext);
  
  	    message(MESS_DEBUG,
@@ -134,18 +87,18 @@ diff --git a/logrotate.c b/logrotate.c
  			    oldName, newName, strerror(errno));
  		    hasErrors = 1;
  		}
-@@ -1082,11 +1129,11 @@ int rotateSingleLog(struct logInfo *log, int logNum, struct logState *state,
- 						log->files[logNum]);
+@@ -1286,11 +1333,11 @@ int rotateSingleLog(struct logInfo *log, int logNum, struct logState *state,
+ 			}
  		}
- #endif
+ #endif /* WITH_ACL */
 -		message(MESS_DEBUG, "renaming %s to %s\n", log->files[logNum],
-+		message(MESS_DEBUG, "moving %s to %s\n", log->files[logNum],
++        message(MESS_DEBUG, "moving %s to %s\n", log->files[logNum],
  		    rotNames->finalName);
  	    if (!debug && !hasErrors &&
 -		rename(log->files[logNum], rotNames->finalName)) {
 -		message(MESS_ERROR, "failed to rename %s to %s: %s\n",
-+		mvFile(log->files[logNum], rotNames->finalName, log)) {
-+		message(MESS_ERROR, "failed to move %s to %s: %s\n",
++        mvFile(log->files[logNum], rotNames->finalName, log)) {
++        message(MESS_ERROR, "failed to move %s to %s: %s\n",
  			log->files[logNum], rotNames->finalName,
  			strerror(errno));
  			hasErrors = 1;
diff --git a/meta/recipes-extended/logrotate/logrotate-3.8.1/disable-check-different-filesystems.patch b/meta/recipes-extended/logrotate/logrotate-3.8.1/disable-check-different-filesystems.patch
new file mode 100644
index 0000000..5cb6038
--- /dev/null
+++ b/meta/recipes-extended/logrotate/logrotate-3.8.1/disable-check-different-filesystems.patch
@@ -0,0 +1,34 @@
+Disable the check for different filesystems
+
+The logrotate supports rotate log across different filesystems now, so
+disable the check for different filesystems.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ config.c |    8 --------
+ 1 files changed, 0 insertions(+), 8 deletions(-)
+
+diff --git a/config.c b/config.c
+index a85d1df..24575b3 100644
+--- a/config.c
++++ b/config.c
+@@ -1453,14 +1453,6 @@ static int readConfigFile(const char *configFile, struct logInfo *defConfig)
+ 						dirName, strerror(errno));
+ 					goto error;
+ 					}
+-
+-					if (sb.st_dev != sb2.st_dev) {
+-					message(MESS_ERROR,
+-						"%s:%d olddir %s and log file %s "
+-						"are on different devices\n", configFile,
+-						lineNum, newlog->oldDir, newlog->files[i]);
+-					goto error;
+-					}
+ 				}
+ 				}
+ 
+-- 
+1.7.4.1
+
diff --git a/meta/recipes-extended/logrotate/logrotate-3.8.1/update-the-manual.patch b/meta/recipes-extended/logrotate/logrotate-3.8.1/update-the-manual.patch
new file mode 100644
index 0000000..5cab649
--- /dev/null
+++ b/meta/recipes-extended/logrotate/logrotate-3.8.1/update-the-manual.patch
@@ -0,0 +1,42 @@
+Update the manual
+
+* Update the mannual
+* Fix a bug in the mannual(\f should be \fR)
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ logrotate.8 |    9 ++++-----
+ 1 files changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/logrotate.8 b/logrotate.8
+index 8b34167..5f15432 100644
+--- a/logrotate.8
++++ b/logrotate.8
+@@ -374,10 +374,9 @@ Do not rotate the log if it is empty (this overrides the \fBifempty\fR option).
+ .TP
+ \fBolddir \fIdirectory\fR
+ Logs are moved into \fIdirectory\fR for rotation. The \fIdirectory\fR
+-must be on the same physical device as the log file being rotated,
+-and is assumed to be relative to the directory holding the log file
+-unless an absolute path name is specified. When this option is used all
+-old versions of the log end up in \fIdirectory\fR.  This option may be
++is assumed to be relative to the directory holding the log file unless
++an absolute path name is specified. When this option is used all old
++versions of the log end up in \fIdirectory\fR. This option may be
+ overridden by the \fBnoolddir\fR option.
+ 
+ .TP
+@@ -435,7 +434,7 @@ Log files are rotated only if they grow bigger then \fIsize\fR bytes. If
+ \fIsize\fR is followed by \fIk\fR, the size is assumed to be in kilobytes.
+ If the \fIM\fR is used, the size is in megabytes, and if \fIG\fR is used, the
+ size is in gigabytes. So \fBsize 100\fR, \fIsize 100k\fR, \fIsize 100M\fR and
+-\fIsize 100G\f are all valid.
++\fIsize 100G\fR are all valid.
+ 
+ .TP
+ \fBsharedscripts\fR
+-- 
+1.7.4.1
+
-- 
1.7.4.1



