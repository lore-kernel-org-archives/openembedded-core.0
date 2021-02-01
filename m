Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web12.29180.1612152191078061277
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Jan 2021 20:03:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: yzYdI8EJlW7+1z2wdhScdP+qZ8OQuFzWZLS+nUud6Vo41gnyGoms8dNA21P8O+UjeTY1Vl21mi
 YTemfRusrmxQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9881"; a="178065182"
X-IronPort-AV: E=Sophos;i="5.79,391,1602572400"; 
   d="scan'208";a="178065182"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2021 20:03:10 -0800
IronPort-SDR: v3gBffbpIjEjo+ukR+NL+rUkoOh7b2GLf+mpxHs4S2OWkfGFri7WNcsUZywjLQmvFNQH35/MLf
 jWzuspWWReHg==
X-IronPort-AV: E=Sophos;i="5.79,391,1602572400"; 
   d="scan'208";a="432141219"
Received: from hhan1-mobl.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.184.124])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2021 20:03:08 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 2/3] sudo: fix CVE-2021-23239
Date: Mon,  1 Feb 2021 12:02:53 +0800
Message-Id: <20210201040254.80979-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210201040254.80979-1-anuj.mittal@intel.com>
References: <20210201040254.80979-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../sudo/files/CVE-2021-23239.patch           | 62 +++++++++++++++++++
 meta/recipes-extended/sudo/sudo_1.9.3.bb      |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-extended/sudo/files/CVE-2021-23239.patch

diff --git a/meta/recipes-extended/sudo/files/CVE-2021-23239.patch b/meta/recipes-extended/sudo/files/CVE-2021-23239.patch
new file mode 100644
index 0000000000..e16baecd5a
--- /dev/null
+++ b/meta/recipes-extended/sudo/files/CVE-2021-23239.patch
@@ -0,0 +1,62 @@
+
+# HG changeset patch
+# User Todd C. Miller <Todd.Miller@sudo.ws>
+# Date 1609953360 25200
+# Node ID ea19d0073c02951bbbf35342dd63304da83edce8
+# Parent  f1ca39a0d87089d005b78a2556e2b1a2dc17f672
+Fix potential directory existing info leak in sudoedit.
+When creating a new file, sudoedit checks to make sure the parent
+directory exists so it can provide the user with a sensible error
+message.  However, this could be used to test for the existence of
+directories not normally accessible to the user by pointing to them
+with a symbolic link when the parent directory is controlled by the
+user.  Problem reported by Matthias Gerstner of SUSE.
+
+Upstream-Status: Backport [https://www.sudo.ws/repos/sudo/rev/ea19d0073c02]
+CVE: CVE-2021-23239
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+
+diff -r f1ca39a0d870 -r ea19d0073c02 src/sudo_edit.c
+--- a/src/sudo_edit.c	Wed Jan 06 10:16:00 2021 -0700
++++ b/src/sudo_edit.c	Wed Jan 06 10:16:00 2021 -0700
+@@ -541,14 +541,33 @@
+ 	    S_IRUSR|S_IWUSR|S_IRGRP|S_IROTH, command_details);
+ 	if (ofd != -1 || errno == ENOENT) {
+ 	    if (ofd == -1) {
+-		/* New file, verify parent dir exists unless in cwd. */
++		/*
++		 * New file, verify parent dir exists unless in cwd.
++		 * This fails early so the user knows ahead of time if the
++		 * edit won't succeed.  Additional checks are performed
++		 * when copying the temporary file back to the origin.
++		 */
+ 		char *slash = strrchr(files[i], '/');
+ 		if (slash != NULL && slash != files[i]) {
+-		    int serrno = errno;
++		    const int sflags = command_details->flags;
++		    const int serrno = errno;
++		    int dfd;
++
++		    /*
++		     * The parent directory is allowed to be a symbolic
++		     * link as long as *its* parent is not writable.
++		     */
+ 		    *slash = '\0';
+-		    if (stat(files[i], &sb) == 0 && S_ISDIR(sb.st_mode)) {
+-			memset(&sb, 0, sizeof(sb));
+-			rc = 0;
++		    SET(command_details->flags, CD_SUDOEDIT_FOLLOW);
++		    dfd = sudo_edit_open(files[i], DIR_OPEN_FLAGS,
++			S_IRUSR|S_IWUSR|S_IRGRP|S_IROTH, command_details);
++		    command_details->flags = sflags;
++		    if (dfd != -1) {
++			if (fstat(dfd, &sb) == 0 && S_ISDIR(sb.st_mode)) {
++			    memset(&sb, 0, sizeof(sb));
++			    rc = 0;
++			}
++			close(dfd);
+ 		    }
+ 		    *slash = '/';
+ 		    errno = serrno;
+
+
diff --git a/meta/recipes-extended/sudo/sudo_1.9.3.bb b/meta/recipes-extended/sudo/sudo_1.9.3.bb
index 0d0be9ab8b..132d9a8cb9 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.3.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.3.bb
@@ -3,6 +3,7 @@ require sudo.inc
 SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-sudo.conf.in-fix-conflict-with-multilib.patch \
+           file://CVE-2021-23239.patch \
            "
 
 PAM_SRC_URI = "file://sudo.pam"
-- 
2.29.2

