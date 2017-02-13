Return-Path: <Li.Zhou@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A3DC773173
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 02:54:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1D2s1m0012898
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Feb 2017 18:54:02 -0800 (PST)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Sun, 12 Feb 2017 18:54:00 -0800
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Feb 2017 10:53:24 +0800
Message-ID: <1486954404-224256-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Subject: [PATCH] bash: fix CVE-2016-9401
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
X-List-Received-Date: Mon, 13 Feb 2017 02:54:02 -0000
Content-Type: text/plain

popd in bash might allow local users to bypass the restricted shell
and cause a use-after-free via a crafted address.

Porting patch from <https://ftp.gnu.org/pub/gnu/bash/bash-4.4-patches/
bash44-006> to solve CVE-2016-9401.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 .../recipes-extended/bash/bash/CVE-2016-9401.patch | 50 ++++++++++++++++++++++
 meta/recipes-extended/bash/bash_4.3.30.bb          |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash/CVE-2016-9401.patch

diff --git a/meta/recipes-extended/bash/bash/CVE-2016-9401.patch b/meta/recipes-extended/bash/bash/CVE-2016-9401.patch
new file mode 100644
index 0000000..28c9277
--- /dev/null
+++ b/meta/recipes-extended/bash/bash/CVE-2016-9401.patch
@@ -0,0 +1,50 @@
+From fa741771ed47b30547be63b5b5dbfb51977aca12 Mon Sep 17 00:00:00 2001
+From: Chet Ramey <chet.ramey@case.edu>
+Date: Fri, 20 Jan 2017 11:47:31 -0500
+Subject: [PATCH] Bash-4.4 patch 6
+
+Bug-Reference-URL:
+https://lists.gnu.org/archive/html/bug-bash/2016-11/msg00116.html
+
+Reference to upstream patch:
+https://ftp.gnu.org/pub/gnu/bash/bash-4.4-patches/bash44-006
+
+Bug-Description:
+Out-of-range negative offsets to popd can cause the shell to crash attempting
+to free an invalid memory block.
+
+Upstream-Status: Backport
+CVE: CVE-2016-9401
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ builtins/pushd.def | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/builtins/pushd.def b/builtins/pushd.def
+index 9c6548f..8a13bae 100644
+--- a/builtins/pushd.def
++++ b/builtins/pushd.def
+@@ -359,7 +359,7 @@ popd_builtin (list)
+ 	break;
+     }
+ 
+-  if (which > directory_list_offset || (directory_list_offset == 0 && which == 0))
++  if (which > directory_list_offset || (which < -directory_list_offset) || (directory_list_offset == 0 && which == 0))
+     {
+       pushd_error (directory_list_offset, which_word ? which_word : "");
+       return (EXECUTION_FAILURE);
+@@ -381,6 +381,11 @@ popd_builtin (list)
+ 	 remove that directory from the list and shift the remainder
+ 	 of the list into place. */
+       i = (direction == '+') ? directory_list_offset - which : which;
++      if (i < 0 || i > directory_list_offset)
++	{
++	  pushd_error (directory_list_offset, which_word ? which_word : "");
++	  return (EXECUTION_FAILURE);
++	}
+       free (pushd_directory_list[i]);
+       directory_list_offset--;
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/bash/bash_4.3.30.bb b/meta/recipes-extended/bash/bash_4.3.30.bb
index 765562f..e398e87 100644
--- a/meta/recipes-extended/bash/bash_4.3.30.bb
+++ b/meta/recipes-extended/bash/bash_4.3.30.bb
@@ -30,6 +30,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            file://fix-run-builtins.patch \
            file://0001-help-fix-printf-format-security-warning.patch \
            file://fix-run-intl.patch \
+           file://CVE-2016-9401.patch \
            "
 
 SRC_URI[tarball.md5sum] = "a27b3ee9be83bd3ba448c0ff52b28447"
-- 
1.9.1


