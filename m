Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.2038.1589272646122427356
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 01:37:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: zhixiong.chi@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 04C8bPFi025520
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 01:37:25 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Tue, 12 May 2020
 01:37:24 -0700
From: "Zhixiong Chi" <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][zeus][PATCH V2] glibc: CVE-2020-1752
Date: Tue, 12 May 2020 01:37:24 -0700
Message-ID: <20200512083724.69570-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Backport the CVE patch from upstream:
git://sourceware.org/git/glibc.git
commit ddc650e9b3dc916eab417ce9f79e67337b05035c

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 .../glibc/glibc/CVE-2020-1752.patch           | 66 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.30.bb         |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-1752.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2020-1752.patch b/meta/recipes-core/glibc/glibc/CVE-2020-1752.patch
new file mode 100644
index 0000000000..6c347cd414
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2020-1752.patch
@@ -0,0 +1,66 @@
+From ddc650e9b3dc916eab417ce9f79e67337b05035c Mon Sep 17 00:00:00 2001
+From: Andreas Schwab <schwab@suse.de>
+Date: Wed, 19 Feb 2020 17:21:46 +0100
+Subject: [PATCH] Fix use-after-free in glob when expanding ~user (bug 25414)
+
+The value of `end_name' points into the value of `dirname', thus don't
+deallocate the latter before the last use of the former.
+
+CVE: CVE-2020-1752
+Upstream-Status: Backport [git://sourceware.org/git/glibc.git]
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+---
+ posix/glob.c | 25 +++++++++++++------------
+ 1 file changed, 13 insertions(+), 12 deletions(-)
+
+diff --git a/posix/glob.c b/posix/glob.c
+index cba9cd1819..4580cefb9f 100644
+--- a/posix/glob.c
++++ b/posix/glob.c
+@@ -827,31 +827,32 @@ __glob (const char *pattern, int flags, int (*errfunc) (const char *, int),
+ 	      {
+ 		size_t home_len = strlen (p->pw_dir);
+ 		size_t rest_len = end_name == NULL ? 0 : strlen (end_name);
+-		char *d;
++		char *d, *newp;
++		bool use_alloca = glob_use_alloca (alloca_used,
++						   home_len + rest_len + 1);
+ 
+-		if (__glibc_unlikely (malloc_dirname))
+-		  free (dirname);
+-		malloc_dirname = 0;
+-
+-		if (glob_use_alloca (alloca_used, home_len + rest_len + 1))
+-		  dirname = alloca_account (home_len + rest_len + 1,
+-					    alloca_used);
++		if (use_alloca)
++		  newp = alloca_account (home_len + rest_len + 1, alloca_used);
+ 		else
+ 		  {
+-		    dirname = malloc (home_len + rest_len + 1);
+-		    if (dirname == NULL)
++		    newp = malloc (home_len + rest_len + 1);
++		    if (newp == NULL)
+ 		      {
+ 			scratch_buffer_free (&pwtmpbuf);
+ 			retval = GLOB_NOSPACE;
+ 			goto out;
+ 		      }
+-		    malloc_dirname = 1;
+ 		  }
+-		d = mempcpy (dirname, p->pw_dir, home_len);
++		d = mempcpy (newp, p->pw_dir, home_len);
+ 		if (end_name != NULL)
+ 		  d = mempcpy (d, end_name, rest_len);
+ 		*d = '\0';
+ 
++		if (__glibc_unlikely (malloc_dirname))
++		  free (dirname);
++		dirname = newp;
++		malloc_dirname = !use_alloca;
++
+ 		dirlen = home_len + rest_len;
+ 		dirname_modified = 1;
+ 	      }
+-- 
+2.18.2
diff --git a/meta/recipes-core/glibc/glibc_2.30.bb b/meta/recipes-core/glibc/glibc_2.30.bb
index 84a6538ea1..e9286b6b49 100644
--- a/meta/recipes-core/glibc/glibc_2.30.bb
+++ b/meta/recipes-core/glibc/glibc_2.30.bb
@@ -44,6 +44,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://CVE-2019-19126.patch \
            file://CVE-2020-10029.patch \
            file://CVE-2020-1751.patch \
+           file://CVE-2020-1752.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.23.0

