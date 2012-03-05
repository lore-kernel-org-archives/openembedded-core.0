Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1S4Yrl-0007tH-5W
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Mar 2012 15:26:21 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q25EHjt9007900
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Mar 2012 06:17:45 -0800 (PST)
Received: from build-PowerEdge-T100.corp.ad.wrs.com (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Mon, 5 Mar 2012 06:17:45 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Mar 2012 22:17:35 +0800
Message-ID: <b310e9c1c0b492e622f6da93c997477fe1e4b8aa.1330956344.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1330956344.git.liezhi.yang@windriver.com>
References: <cover.1330956344.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] logrotate 3.7.9: Allow rotate log across filesystems
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
X-List-Received-Date: Mon, 05 Mar 2012 14:26:21 -0000
Content-Type: text/plain

The logrotate can't save the log across the different filesystems since
it used the "rename(const char *oldpath, const char *newpath)" to save
the file, fix it to act as the "mv" command(first rename, if failed,
read and write) to allow save the log across the different filesystems.

* config.c: Remove the check for different filesystems
* logrotate.c: Act as the "mv" command when rotate log
* logrotate.8: Update the mannual
* logrotate.8: Fix a bug in the mannual(\f should be \fR)

[YOCTO #718]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../allow-across-different-filesystems.patch       |  154 ++++++++++++++++++++
 meta/recipes-extended/logrotate/logrotate_3.7.9.bb |    5 +-
 2 files changed, 157 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/logrotate/logrotate-3.7.9/allow-across-different-filesystems.patch

diff --git a/meta/recipes-extended/logrotate/logrotate-3.7.9/allow-across-different-filesystems.patch b/meta/recipes-extended/logrotate/logrotate-3.7.9/allow-across-different-filesystems.patch
--- /dev/null
+++ b/meta/recipes-extended/logrotate/logrotate-3.7.9/allow-across-different-filesystems.patch
@@ -0,0 +1,154 @@
+Allow rotate log across different filesystems
+
+* Remove the check for different filesystems
+* Act as the "mv" command when rotate log
+* Update the mannual
+* Fix a bug in the mannual(\f should be \fR)
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ config.c    |    8 --------
+ logrotate.8 |    9 ++++-----
+ logrotate.c |   59 +++++++++++++++++++++++++++++++++++++++++++++++++++++------
+ 3 files changed, 57 insertions(+), 19 deletions(-)
+
+diff --git a/config.c b/config.c
+--- a/config.c
++++ b/config.c
+@@ -1482,14 +1482,6 @@ duperror:
+ 				dirName, strerror(errno));
+ 			goto error;
+ 		    }
+-
+-		    if (sb.st_dev != sb2.st_dev) {
+-			message(MESS_ERROR,
+-				"%s:%d olddir %s and log file %s "
+-				"are on different devices\n", configFile,
+-				lineNum, newlog->oldDir, newlog->files[i]);
+-			goto error;
+-		    }
+ 		}
+ 	    }
+ 
+diff --git a/logrotate.8 b/logrotate.8
+--- a/logrotate.8
++++ b/logrotate.8
+@@ -354,10 +354,9 @@ Do not rotate the log if it is empty (this overrides the \fBifempty\fR option).
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
+@@ -415,7 +414,7 @@ Log files are rotated when they grow bigger than \fIsize\fR bytes. If
+ \fIsize\fR is followed by \fIk\fR, the size is assumed to be in kilobytes.
+ If the \fIM\fR is used, the size is in megabytes, and if \fIG\fR is used, the
+ size is in gigabytes. So \fBsize 100\fR, \fIsize 100k\fR, \fIsize 100M\fR and
+-\fIsize 100G\f are all valid.
++\fIsize 100G\fR are all valid.
+ 
+ .TP
+ \fBsharedscripts\fR
+diff --git a/logrotate.c b/logrotate.c
+--- a/logrotate.c
++++ b/logrotate.c
+@@ -625,6 +625,53 @@ int findNeedRotating(struct logInfo *log, int logNum)
+     return 0;
+ }
+ 
++/* Act as the "mv" command, if rename failed, then read the old file and
++ * write to new file. The function which invokes the mvFile will use
++ * the strerror(errorno) to handle the error message, so we don't have
++ * to print the error message here */
++
++int mvFile (char *oldName, char *newName, struct logInfo *log)
++{
++    struct stat sbprev;
++    int fd_old, fd_new, n;
++    char buf[BUFSIZ];
++
++    /* Do the rename first */
++    if (!rename(oldName, newName))
++        return 0;
++
++    /* If the errno is EXDEV, then read old file, write newfile and
++     * remove the oldfile */
++    if (errno == EXDEV) {
++        /* Open the old file to read */
++        if ((fd_old = open(oldName, O_RDONLY)) < 0)
++            return 1;
++
++        /* Create the file to write, keep the same attribute as the old file */
++        if (stat(oldName, &sbprev))
++            return 1;
++        else {
++            if ((fd_new = createOutputFile(newName,
++                O_WRONLY | O_CREAT | O_TRUNC, &sbprev)) < 0 )
++                return 1;
++        }
++
++        /* Read and write */
++        while ((n = read(fd_old, buf, BUFSIZ)) > 0)
++            if (write(fd_new, buf, n) != n)
++                return 1;
++
++        if ((close(fd_old) < 0) ||
++            removeLogFile(oldName, log) ||
++            (close(fd_new) < 0))
++            return 1;
++
++        return 0;
++    }
++
++    return 1;
++}
++
+ int prerotateSingleLog(struct logInfo *log, int logNum, struct logState *state,
+ 		       struct logNames *rotNames)
+ {
+@@ -958,15 +1005,15 @@ int prerotateSingleLog(struct logInfo *log, int logNum, struct logState *state,
+ 		    rotNames->baseName, i, fileext, compext);
+ 
+ 	    message(MESS_DEBUG,
+-		    "renaming %s to %s (rotatecount %d, logstart %d, i %d), \n",
++		    "moving %s to %s (rotatecount %d, logstart %d, i %d), \n",
+ 		    oldName, newName, rotateCount, logStart, i);
+ 
+-	    if (!debug && rename(oldName, newName)) {
++	    if (!debug && mvFile(oldName, newName, log)) {
+ 		if (errno == ENOENT) {
+ 		    message(MESS_DEBUG, "old log %s does not exist\n",
+ 			    oldName);
+ 		} else {
+-		    message(MESS_ERROR, "error renaming %s to %s: %s\n",
++		    message(MESS_ERROR, "error moving %s to %s: %s\n",
+ 			    oldName, newName, strerror(errno));
+ 		    hasErrors = 1;
+ 		}
+@@ -1082,11 +1129,11 @@ int rotateSingleLog(struct logInfo *log, int logNum, struct logState *state,
+ 						log->files[logNum]);
+ 		}
+ #endif
+-		message(MESS_DEBUG, "renaming %s to %s\n", log->files[logNum],
++		message(MESS_DEBUG, "moving %s to %s\n", log->files[logNum],
+ 		    rotNames->finalName);
+ 	    if (!debug && !hasErrors &&
+-		rename(log->files[logNum], rotNames->finalName)) {
+-		message(MESS_ERROR, "failed to rename %s to %s: %s\n",
++		mvFile(log->files[logNum], rotNames->finalName, log)) {
++		message(MESS_ERROR, "failed to move %s to %s: %s\n",
+ 			log->files[logNum], rotNames->finalName,
+ 			strerror(errno));
+ 			hasErrors = 1;
+-- 
+1.7.4.1
+
diff --git a/meta/recipes-extended/logrotate/logrotate_3.7.9.bb b/meta/recipes-extended/logrotate/logrotate_3.7.9.bb
--- a/meta/recipes-extended/logrotate/logrotate_3.7.9.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.7.9.bb
@@ -2,13 +2,14 @@ DESCRIPTION = "Rotates, compresses, removes and mails system log files"
 SECTION = "console/utils"
 HOMEPAGE = "https://fedorahosted.org/releases/l/o/logrotate"
 LICENSE = "GPLv2"
-PR = "r1"
+PR = "r2"
 
 DEPENDS="coreutils popt"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
 
-SRC_URI = "https://fedorahosted.org/releases/l/o/logrotate/logrotate-${PV}.tar.gz"
+SRC_URI = "https://fedorahosted.org/releases/l/o/logrotate/logrotate-${PV}.tar.gz \
+           file://allow-across-different-filesystems.patch"
 
 SRC_URI[md5sum] = "eeba9dbca62a9210236f4b83195e4ea5"
 SRC_URI[sha256sum] = "080caf904e70e04da16b8dfa95a5a787ec7d722ee1af18ccea437d3ffdd6fec0"
-- 
1.7.4.1



