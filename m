Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9665C60304
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 23:21:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4TNLSW9025290
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 16:21:28 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 29 May 2013 16:21:27 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 May 2013 18:27:46 -0500
Message-ID: <1369870067-9388-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 17/21 v2] grep: fix for CVE-2012-5667
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
X-List-Received-Date: Wed, 29 May 2013 23:21:27 -0000
Content-Type: text/plain

From: Ming Liu <ming.liu@windriver.com>

Multiple integer overflows in GNU Grep before 2.11 might allow
context-dependent attackers to execute arbitrary code via vectors
involving a long input line that triggers a heap-based buffer overflow.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-5667

Signed-off-by: Ming Liu <ming.liu@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../grep/grep-2.5.1a/grep-CVE-2012-5667.patch      | 32 ++++++++++++++++++++++
 meta/recipes-extended/grep/grep_2.5.1a.bb          |  3 +-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/grep/grep-2.5.1a/grep-CVE-2012-5667.patch

diff --git a/meta/recipes-extended/grep/grep-2.5.1a/grep-CVE-2012-5667.patch b/meta/recipes-extended/grep/grep-2.5.1a/grep-CVE-2012-5667.patch
new file mode 100644
index 0000000..0631f35
--- /dev/null
+++ b/meta/recipes-extended/grep/grep-2.5.1a/grep-CVE-2012-5667.patch
@@ -0,0 +1,32 @@
+The patch to fix CVE-2012-5667
+Reference: https://bugzilla.redhat.com/attachment.cgi?id=686605&action=diff
+
+Multiple integer overflows in GNU Grep before 2.11 might allow
+context-dependent attackers to execute arbitrary code via vectors
+involving a long input line that triggers a heap-based buffer overflow.
+
+http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-5667
+
+Upstream-status: Inappropriate [other]
+This version of GNU Grep has been abandoned upstream and they are no longer
+accepting patches.  This is not a backport.
+
+Signed-off-by Ming Liu <ming.liu@windriver.com>
+---
+ grep.c |    7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+--- a/src/grep.c	2013-05-15 13:39:33.359191769 +0800
++++ a/src/grep.c	2013-05-15 13:50:22.609191882 +0800
+@@ -306,6 +306,11 @@ fillbuf (size_t save, struct stats const
+   int cc = 1;
+   char *readbuf;
+   size_t readsize;
++  const size_t max_save = INT_MAX / 2;
++
++  /* Limit the amount of saved data to INT_MAX to fix CVE-2012-5667 */
++  if (save > max_save)
++     error (2, 0, _("line too long"));
+ 
+   /* Offset from start of buffer to start of old stuff
+      that we want to save.  */
diff --git a/meta/recipes-extended/grep/grep_2.5.1a.bb b/meta/recipes-extended/grep/grep_2.5.1a.bb
index d6386ed..247c837 100644
--- a/meta/recipes-extended/grep/grep_2.5.1a.bb
+++ b/meta/recipes-extended/grep/grep_2.5.1a.bb
@@ -13,7 +13,8 @@ SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.bz2 \
            file://gettext.patch \
            file://fix64-int-to-pointer.patch \
            file://Makevars \
-           "
+           file://grep-CVE-2012-5667.patch \
+          "
 
 SRC_URI[md5sum] = "52202fe462770fa6be1bb667bd6cf30c"
 SRC_URI[sha256sum] = "38c8a2bb9223d1fb1b10bdd607cf44830afc92fd451ac4cd07619bf92bdd3132"
-- 
1.8.1.2.545.g2f19ada


