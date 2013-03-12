Received: from co9ehsobe003.messaging.microsoft.com ([207.46.163.26]
	helo=co9outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1UFHkZ-0002WC-EX
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 06:27:47 +0100
Received: from mail219-co9-R.bigfish.com (10.236.132.239) by
	CO9EHSOBE036.bigfish.com (10.236.130.99) with Microsoft SMTP Server id
	14.1.225.23; Tue, 12 Mar 2013 03:55:33 +0000
Received: from mail219-co9 (localhost [127.0.0.1])	by
	mail219-co9-R.bigfish.com (Postfix) with ESMTP id C3BD71001CB	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2013 03:55:33 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz936eIzz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ahzz17326ah8275bh8275dhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1155h)
Received: from mail219-co9 (localhost.localdomain [127.0.0.1]) by mail219-co9
	(MessageSwitch) id 1363060531573544_2735;
	Tue, 12 Mar 2013 03:55:31 +0000 (UTC)
Received: from CO9EHSMHS002.bigfish.com (unknown [10.236.132.235])	by
	mail219-co9.bigfish.com (Postfix) with ESMTP id 8059EE011D	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2013 03:55:31 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS002.bigfish.com
	(10.236.130.12) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 12 Mar 2013 03:55:31 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Tue, 12 Mar 2013 03:55:30 +0000
Received: from b19537-desktop.ap.freescale.net
	(b19537-desktop.ap.freescale.net [10.192.208.197])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id r2C3tRBV023882;
	Mon, 11 Mar 2013 20:55:28 -0700
From: Zhenhua Luo <zhenhua.luo@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Mar 2013 11:58:58 +0800
Message-ID: <1363060738-21499-1-git-send-email-zhenhua.luo@freescale.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: B40290@freescale.com, Zhenhua Luo <zhenhua.luo@freescale.com>
Subject: [oe-core master v2] elfutils: Fix size passed to snprintf for invalid sh_name case
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Mar 2013 05:27:48 -0000
Content-Type: text/plain

Following build error will appear on Fedora18.
nm.c: In function 'show_symbols_sysv':
nm.c:756:27: error: argument to 'sizeof' in 'snprintf' call is the same expression as the destination; did you mean to provide an explicit length? [-Werror=sizeof-pointer-memaccess]
    snprintf (name, sizeof name, "[invalid sh_name %#" PRIx32 "]",
                           ^

Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
---
 ...ssed-to-snprintf-for-invalid-sh_name-case.patch |   27 ++++++++++++++++++++
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |    3 +-
 2 files changed, 29 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils/nm-Fix-size-passed-to-snprintf-for-invalid-sh_name-case.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils/nm-Fix-size-passed-to-snprintf-for-invalid-sh_name-case.patch b/meta/recipes-devtools/elfutils/elfutils/nm-Fix-size-passed-to-snprintf-for-invalid-sh_name-case.patch
new file mode 100644
index 0000000..2b5dad3
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils/nm-Fix-size-passed-to-snprintf-for-invalid-sh_name-case.patch
@@ -0,0 +1,27 @@
+Upstream-Status: Backport
+
+nm: Fix size passed to snprintf for invalid sh_name case.
+native build failed as following on Fedora18:
+nm.c: In function 'show_symbols_sysv':
+nm.c:756:27: error: argument to 'sizeof' in 'snprintf' call is the same expression as the destination; did you mean to provide an explicit length? [-Werror=sizeof-pointer-memaccess]
+    snprintf (name, sizeof name, "[invalid sh_name %#" PRIx32 "]",
+                           ^
+
+The original commit is http://git.fedorahosted.org/cgit/elfutils.git/commit/src/nm.c?id=57bd66cabf6e6b9ecf622cdbf350804897a8df58
+
+Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
+
+--- elfutils-0.148/src/nm.c.org	2013-03-11 22:36:11.000000000 -0500
++++ elfutils-0.148/src/nm.c	2013-03-11 22:46:09.000000000 -0500
+@@ -752,8 +752,9 @@
+ 			       gelf_getshdr (scn, &shdr_mem)->sh_name);
+       if (unlikely (name == NULL))
+ 	{
+-	  name = alloca (sizeof "[invalid sh_name 0x12345678]");
+-	  snprintf (name, sizeof name, "[invalid sh_name %#" PRIx32 "]",
++	  const size_t bufsz = sizeof "[invalid sh_name 0x12345678]";
++	  name = alloca (bufsz);
++	  snprintf (name, bufsz, "[invalid sh_name %#" PRIx32 "]",
+ 		    gelf_getshdr (scn, &shdr_mem)->sh_name);
+ 	}
+       scnnames[elf_ndxscn (scn)] = name;
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
index 45931b0..bc9e9c6 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3\
                     file://EXCEPTION;md5=570adcb0c1218ab57f2249c67d0ce417"
 DEPENDS = "libtool bzip2 zlib virtual/libintl"
 
-PR = "r9"
+PR = "r10"
 
 SRC_URI = "https://fedorahosted.org/releases/e/l/elfutils/elfutils-${PV}.tar.bz2"
 
@@ -31,6 +31,7 @@ SRC_URI += "\
 	file://mempcpy.patch \
 	file://fix_for_gcc-4.7.patch \
 	file://dso-link-change.patch \
+	file://nm-Fix-size-passed-to-snprintf-for-invalid-sh_name-case.patch \
 "
 # Only apply when building uclibc based target recipe
 SRC_URI_append_libc-uclibc = " file://uclibc-support.patch"
-- 
1.7.5.4




