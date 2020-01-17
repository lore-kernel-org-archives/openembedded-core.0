Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0BF987FB78
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 17:14:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47znjp24Bmz6m
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 18:14:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1579281278;
	bh=SrlwjbvtlgJ+YXJsm0Zm3vzk9UBfP1kSqVgcQn2vPA4=;
	h=From:To:Subject:Date:From;
	b=e/+UZPO6/1dYfk8hitexfqRKCa+XMl1caeZ069jOinKSUOKRiq9t12ejqCPVOv9bN
	5nJxw4J7liAAmcrrXVsi18zNhVFS+AdSzi0PT9hLpoeZGJCIqcgD+Hu8r3ih/Uf+48
	tNjxj2ynkPuX/Rv94RUJZL8NAqhZ36QgMW9VVW5Grwc8/oXSZY0w6GbAidZ8P9IHJP
	tRbc4CPf37RDXg7tF/DkSbkWZYMWDnbGcjkH+Hz64O9vg8fh6pZGQD6BxMfAs7K0WL
	7rLPLzIgyVN1++02sk7yEPKHz54YykVCAOHw81SXOEQ4GAsIjZCw+5KSs9ucDFjEj8
	0PJm6JRvhnRQsN8uqf1SfLRu0ef+0Z1MusXvJYtD+dCOZhkbBw8/d0Iz9epjwqvZlR
	W2pFFsNvaQmcgvo6a4OAdMuTHuMv6kQ6UShS+GyW6v447iuA9/yZHhLnWuu7OdZvVQ
	kqEIg+cUYMcYrzrDTbO//w7Vcyg+NcRhjJc+K5yaFI++9KqY9CzcEvEP3DSXu83kf3
	HN2LV/57bivDL3RoVPTiDrYy28HO3DSBWckhPomufSRV8yavZOZz+ls8ooExHdm+/t
	LfH2wfrndrkY0cZV3Ahl+ICp+MKjFlX1ttG7izB66K3gvkBCj9JmwOKE0iLulpO33j
	QdRriibDv7b0tstRmB7RWVrk=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 19:14:23 +0200
Message-Id: <20200117171436.17131-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] binutils: fix CVE-2019-17451
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
X-List-Received-Date: Fri, 17 Jan 2020 17:14:38 -0000

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Backport upstream fix.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../binutils/binutils-2.32.inc                |  1 +
 .../binutils/binutils/CVE-2019-17451.patch    | 51 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-17451.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.32.inc b/meta/recipes-devtools/binutils/binutils-2.32.inc
index a92bfd0354..739ba70cf2 100644
--- a/meta/recipes-devtools/binutils/binutils-2.32.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.32.inc
@@ -53,6 +53,7 @@ SRC_URI = "\
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
2.17.1


