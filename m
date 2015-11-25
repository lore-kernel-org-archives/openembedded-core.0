Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 57DAA6612D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 22:42:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAPMgK9W003902
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 14:42:20 -0800 (PST)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 25 Nov 2015 14:42:20 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Nov 2015 16:42:17 -0600
Message-ID: <8cb295e56ceee220419763aef08f75ea106f6e08.1448491263.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 2.3.1
In-Reply-To: <cover.1448491263.git.peter.seebach@windriver.com>
References: <cover.1448491263.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] glibc/0029-fix-getmnt-empty-lines.patch: fix getmntent()
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
X-List-Received-Date: Wed, 25 Nov 2015 22:42:21 -0000
Content-Type: text/plain

When confronted with an empty line, getmntent() can underrun
a buffer, possibly doing very strange things if it finds
additional space/tab characters. Backport the upstream fix.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 .../glibc/0029-fix-getmntent-empty-lines.patch     | 40 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.22.bb              |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0029-fix-getmntent-empty-lines.patch

diff --git a/meta/recipes-core/glibc/glibc/0029-fix-getmntent-empty-lines.patch b/meta/recipes-core/glibc/glibc/0029-fix-getmntent-empty-lines.patch
new file mode 100644
index 0000000..ffe8d64
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0029-fix-getmntent-empty-lines.patch
@@ -0,0 +1,40 @@
+From b0e805fa0d6fea33745952df7b7f5442ca4c374f Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Fri, 28 Aug 2015 17:08:49 -0400
+Subject: [PATCH] getmntent: fix memory corruption w/blank lines [BZ #18887]
+
+The fix for BZ #17273 introduced a single byte of memory corruption when
+the line is entirely blank.  It would walk back past the start of the
+buffer if the heap happened to be 0x20 or 0x09 and then write a NUL byte.
+       buffer = '\n';
+       end_ptr = buffer;
+       while (end_ptr[-1] == ' ' || end_ptr[-1] == '\t')
+       	     end_ptr--;
+	     *end_ptr = '\0';
+
+Fix that and rework the tests.  Adding the testcase for BZ #17273 to the
+existing \040 parser does not really make sense as it's unrelated, and
+leads to confusing behavior: it implicitly relies on the new entry being
+longer than the previous entry (since it just rewinds the FILE*).  Split
+it out into its own dedicated testcase instead.
+
+The original patch is at link https://sourceware.org/git/gitweb.cgi?p=glibc.git;a=patch;h=b0e805fa0d6fea33745952df7b7f5442ca4c374f.
+Only code to mntent_r.c is kept in this patch, Change log, NEWS, Makefile, and test cases are excluded.
+
+Upstream-status: upstreamed to 2.23
+Signed-off-by: Baoshan Pang <baoshan.pang@windriver.com>
+
+diff --git a/misc/mntent_r.c b/misc/mntent_r.c
+index 6159873..19af8a8 100644
+--- a/misc/mntent_r.c
++++ b/misc/mntent_r.c
+@@ -136,7 +136,8 @@ __getmntent_r (FILE *stream, struct mntent *mp, char *buffer, int bufsiz)
+       end_ptr = strchr (buffer, '\n');
+       if (end_ptr != NULL)	/* chop newline */
+ 	{
+-	  while (end_ptr[-1] == ' ' || end_ptr[-1] == '\t')
++	  while (end_ptr != buffer
++		 && (end_ptr[-1] == ' ' || end_ptr[-1] == '\t'))
+             end_ptr--;
+ 	  *end_ptr = '\0';
+ 	}
diff --git a/meta/recipes-core/glibc/glibc_2.22.bb b/meta/recipes-core/glibc/glibc_2.22.bb
index 1b23597..cb5c806 100644
--- a/meta/recipes-core/glibc/glibc_2.22.bb
+++ b/meta/recipes-core/glibc/glibc_2.22.bb
@@ -40,6 +40,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0027-eglibc-use-option-groups-Conditionally-exclude-c-tes.patch \
            file://nscd-no-bash.patch \
            file://0028-Clear-ELF_RTYPE_CLASS_EXTERN_PROTECTED_DATA-for-prel.patch \
+           file://0029-fix-getmntent-empty-lines.patch \
 "
 
 SRC_URI += "\
-- 
2.3.1


