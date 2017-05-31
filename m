Return-Path: <Yuanjie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C9E4977FED
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 08:38:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v4V8c5pg008458
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 01:38:05 -0700 (PDT)
Received: from ala-lpd-susbld2.wrs.com (147.11.105.122) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.294.0; Wed, 31 May 2017 01:38:04 -0700
From: Yuanjie Huang <yuanjie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 31 May 2017 01:37:58 -0700
Message-ID: <20170531083759.115702-2-yuanjie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170531083759.115702-1-yuanjie.huang@windriver.com>
References: <20170531083759.115702-1-yuanjie.huang@windriver.com>
MIME-Version: 1.0
Subject: [morty][PATCH 2/3] binutils: fix CVE-2017-7209 in readelf
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
X-List-Received-Date: Wed, 31 May 2017 08:38:04 -0000
Content-Type: text/plain

CVE: CVE-2017-7209
[BZ 21135] -- https://sourceware.org/bugzilla/show_bug.cgi?id=21135

PR binutils/21135: Fix invalid read of section contents whilst
processing
a corrupt binary.

Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.27.inc   |  1 +
 .../binutils/binutils/CVE-2017-7209.patch          | 63 ++++++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-7209.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.27.inc b/meta/recipes-devtools/binutils/binutils-2.27.inc
index d32ce25dd5..5dca05e898 100644
--- a/meta/recipes-devtools/binutils/binutils-2.27.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.27.inc
@@ -43,6 +43,7 @@ SRC_URI = "\
      file://CVE-2017-6966.patch \
      file://CVE-2017-6969.patch \
      file://CVE-2017-6969_2.patch \
+     file://CVE-2017-7209.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-7209.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-7209.patch
new file mode 100644
index 0000000000..336d72cfe0
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-7209.patch
@@ -0,0 +1,63 @@
+From 6e5e9d96b5bd7dc3147db9917d6a7a20682915cc Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Mon, 13 Feb 2017 15:04:37 +0000
+Subject: Fix invalid read of section contents whilst processing a corrupt
+ binary.
+
+	PR binutils/21135
+	* readelf.c (dump_section_as_bytes): Handle the case where
+	uncompress_section_contents returns false.
+
+CVE: CVE-2017-7209
+Upstream-Status: Backport[master]
+
+Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
+---
+ binutils/ChangeLog |  6 ++++++
+ binutils/readelf.c | 16 ++++++++++++----
+ 2 files changed, 18 insertions(+), 4 deletions(-)
+
+diff --git a/binutils/ChangeLog b/binutils/ChangeLog
+index 55d2f8ba40..c4d8e60eca 100644
+--- a/binutils/ChangeLog
++++ b/binutils/ChangeLog
+@@ -1,3 +1,9 @@
++2017-02-13  Nick Clifton  <nickc@redhat.com>
++
++	PR binutils/21135
++	* readelf.c (dump_section_as_bytes): Handle the case where
++	uncompress_section_contents returns false.
++
+ 2017-02-20  Nick Clifton  <nickc@redhat.com>
+ 
+ 	PR binutils/21156
+diff --git a/binutils/readelf.c b/binutils/readelf.c
+index 7f7365dbc5..bc4e92fa81 100644
+--- a/binutils/readelf.c
++++ b/binutils/readelf.c
+@@ -12473,10 +12473,18 @@ dump_section_as_bytes (Elf_Internal_Shdr * section,
+ 	  new_size -= 12;
+ 	}
+ 
+-      if (uncompressed_size
+-	  && uncompress_section_contents (& start, uncompressed_size,
+-					  & new_size))
+-	section_size = new_size;
++      if (uncompressed_size)
++	{
++	  if (uncompress_section_contents (& start, uncompressed_size,
++					   & new_size))
++	    section_size = new_size;
++	  else
++	    {
++	      error (_("Unable to decompress section %s\n"),
++		     printable_section_name (section));
++	      return;
++	    }
++	}
+     }
+ 
+   if (relocate)
+-- 
+2.11.0
+
-- 
2.11.0


