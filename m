Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CF73B716B5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Oct 2014 14:28:14 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by fmsmga102.fm.intel.com with ESMTP; 02 Oct 2014 07:28:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,638,1406617200"; d="scan'208";a="481510079"
Received: from cpariyar-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.78])
	by azsmga001.ch.intel.com with ESMTP; 02 Oct 2014 07:28:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Oct 2014 15:27:27 +0100
Message-Id: <dd6406b353249b1890a513a4439de39567f2a413.1412259899.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1412259899.git.paul.eggleton@linux.intel.com>
References: <cover.1412259899.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1412259899.git.paul.eggleton@linux.intel.com>
References: <cover.1412259899.git.paul.eggleton@linux.intel.com>
Subject: [dora][PATCH 2/2] bash: add missing patch for CVE-2014-7169 to 4.2 recipe
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
X-List-Received-Date: Thu, 02 Oct 2014 14:28:15 -0000

The bash_4.2 recipe was missed when the fix was backported to the dora
branch.

Patch from OE-Core master rev: 76a2d6b83472995edbe967aed80f0fcbb784b3fc
by Khem Raj <raj.khem@gmail.com>

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-extended/bash/bash-4.2/cve-2014-7169.patch | 16 ++++++++++++++++
 meta/recipes-extended/bash/bash_4.2.bb                  |  1 +
 2 files changed, 17 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash-4.2/cve-2014-7169.patch

diff --git a/meta/recipes-extended/bash/bash-4.2/cve-2014-7169.patch b/meta/recipes-extended/bash/bash-4.2/cve-2014-7169.patch
new file mode 100644
index 0000000..3c69121
--- /dev/null
+++ b/meta/recipes-extended/bash/bash-4.2/cve-2014-7169.patch
@@ -0,0 +1,16 @@
+Taken from http://www.openwall.com/lists/oss-security/2016/09/25/10
+
+Upstream-Status: Backport
+Index: bash-4.3/parse.y
+===================================================================
+--- bash-4.3.orig/parse.y	2014-09-26 13:10:44.340080056 -0700
++++ bash-4.3/parse.y	2014-09-26 13:11:44.764080056 -0700
+@@ -2953,6 +2953,8 @@
+   FREE (word_desc_to_read);
+   word_desc_to_read = (WORD_DESC *)NULL;
+ 
++  eol_ungetc_lookahead = 0;
++
+   current_token = '\n';		/* XXX */
+   last_read_token = '\n';
+   token_to_read = '\n';
diff --git a/meta/recipes-extended/bash/bash_4.2.bb b/meta/recipes-extended/bash/bash_4.2.bb
index cb95445..e3fa39d 100644
--- a/meta/recipes-extended/bash/bash_4.2.bb
+++ b/meta/recipes-extended/bash/bash_4.2.bb
@@ -22,6 +22,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
            file://build-tests.patch \
            file://test-output.patch \
            file://cve-2014-6271.patch;striplevel=0 \
+           file://cve-2014-7169.patch \
            file://run-ptest \
            "
 
-- 
1.9.3


