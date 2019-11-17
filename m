Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 78E627F959
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2019 23:24:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Nov 2019 15:24:15 -0800
X-IronPort-AV: E=Sophos;i="5.68,318,1569308400"; d="scan'208";a="195955427"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.20.29])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Nov 2019 15:24:14 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 07:23:32 +0800
Message-Id: <20191117232337.5635-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191117232337.5635-1-anuj.mittal@intel.com>
References: <20191117232337.5635-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [zeus][PATCH 2/7] binutils: fix CVE-2019-17451
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
X-List-Received-Date: Sun, 17 Nov 2019 23:24:14 -0000
Content-Transfer-Encoding: 8bit

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Backport upstream fix. No upstream release version of
binutils it yet, so backport the fix independently.

(From OE-Core rev: 3693a0a8b9461521b95613a76b7fd79c86a3bf8f)

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../binutils/binutils-2.32.inc                |  1 +
 .../binutils/binutils/CVE-2019-17451.patch    | 51 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-17451.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.32.inc b/meta/recipes-devtools/binutils/binutils-2.32.inc
index 1e96cf494d..349c3e1154 100644
--- a/meta/recipes-devtools/binutils/binutils-2.32.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.32.inc
@@ -50,6 +50,7 @@ SRC_URI = "\
      file://CVE-2019-14250.patch \
      file://CVE-2019-14444.patch \
      file://CVE-2019-17450.patch \
+     file://CVE-2019-17451.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-17451.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-17451.patch
new file mode 100644
index 0000000000..b36a532668
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2019-17451.patch
@@ -0,0 +1,51 @@
+From 0192438051a7e781585647d5581a2a6f62fda362 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Wed, 9 Oct 2019 10:47:13 +1030
+Subject: [PATCH] PR25070, SEGV in function _bfd_dwarf2_find_nearest_line
+
+Selectively backporting fix for bfd/dwarf2.c, but not the ChangeLog
+file. There are newer versions of binutils, but none of them contain the
+commit fixing CVE-2019-17451, so backport it to master and zeus.
+
+Upstream-Status: Backport
+[https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=336bfbeb1848]
+CVE: CVE-2019-17451
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+
+
+Evil testcase with two debug info sections, with sizes of 2aaaabac4ec1
+and ffffd5555453b140 result in a total size of 1.  Reading the first
+section of course overflows the buffer and tramples on other memory.
+
+	PR 25070
+	* dwarf2.c (_bfd_dwarf2_slurp_debug_info): Catch overflow of
+	total_size calculation.
+---
+ bfd/dwarf2.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c
+index 0b4e485582..a91597b1d0 100644
+--- a/bfd/dwarf2.c
++++ b/bfd/dwarf2.c
+@@ -4426,7 +4426,16 @@ _bfd_dwarf2_slurp_debug_info (bfd *abfd, bfd *debug_bfd,
+       for (total_size = 0;
+ 	   msec;
+ 	   msec = find_debug_info (debug_bfd, debug_sections, msec))
+-	total_size += msec->size;
++	{
++	  /* Catch PR25070 testcase overflowing size calculation here.  */
++	  if (total_size + msec->size < total_size
++	      || total_size + msec->size < msec->size)
++	    {
++	      bfd_set_error (bfd_error_no_memory);
++	      return FALSE;
++	    }
++	  total_size += msec->size;
++	}
+ 
+       stash->info_ptr_memory = (bfd_byte *) bfd_malloc (total_size);
+       if (stash->info_ptr_memory == NULL)
+-- 
+2.23.0
+
-- 
2.21.0


