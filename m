Received: from ch1ehsobe006.messaging.microsoft.com ([216.32.181.186]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1UGVLY-0004D0-EH
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Mar 2013 15:11:08 +0100
Received: from mail228-ch1-R.bigfish.com (10.43.68.232) by
	CH1EHSOBE020.bigfish.com (10.43.70.77) with Microsoft SMTP Server id
	14.1.225.23; Fri, 15 Mar 2013 13:23:49 +0000
Received: from mail228-ch1 (localhost [127.0.0.1])	by
	mail228-ch1-R.bigfish.com (Postfix) with ESMTP id C97B78C0083	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2013 13:23:48 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz936eIzz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ahzz17326ah8275dh8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1155h)
Received: from mail228-ch1 (localhost.localdomain [127.0.0.1]) by mail228-ch1
	(MessageSwitch) id 1363353826844281_19946;
	Fri, 15 Mar 2013 13:23:46 +0000 (UTC)
Received: from CH1EHSMHS016.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.231])	by mail228-ch1.bigfish.com (Postfix) with ESMTP id
	C1B5720055 for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2013 13:23:46 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS016.bigfish.com
	(10.43.70.16) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 15 Mar 2013 13:23:46 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Fri, 15 Mar 2013 13:23:45 +0000
Received: from b19537-desktop.ap.freescale.net
	(b19537-desktop.ap.freescale.net [10.192.208.197])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id r2FDNgOQ025711;
	Fri, 15 Mar 2013 06:23:43 -0700
From: Zhenhua Luo <zhenhua.luo@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Mar 2013 21:27:27 +0800
Message-ID: <1363354047-9680-1-git-send-email-zhenhua.luo@freescale.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: B40290@freescale.com, Zhenhua Luo <zhenhua.luo@freescale.com>
Subject: elfutils: fix the num passed to memset in ar.c
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
X-List-Received-Date: Fri, 15 Mar 2013 14:11:14 -0000
Content-Type: text/plain

Following build error will appear on Fedora18+:
ar.c: In function 'do_oper_delete':
ar.c:918:31: error: argument to 'sizeof' in 'memset' call is the same expression as the destination; did you mean to dereference it? [-Werror=sizeof-pointer-memaccess]
   memset (found, '\0', sizeof (found));

Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
---
 .../elfutils-ar-c-fix-num-passed-to-memset.patch   |   23 ++++++++++++++++++++
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |    3 ++-
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils/elfutils-ar-c-fix-num-passed-to-memset.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils/elfutils-ar-c-fix-num-passed-to-memset.patch b/meta/recipes-devtools/elfutils/elfutils/elfutils-ar-c-fix-num-passed-to-memset.patch
new file mode 100644
index 0000000..b619619
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils/elfutils-ar-c-fix-num-passed-to-memset.patch
@@ -0,0 +1,23 @@
+Upstream-Status: Backport
+
+ar.c (do_oper_delete): Fix num passed to memset
+native build failed as following on Fedora18+: 
+ar.c: In function 'do_oper_delete':
+ar.c:918:31: error: argument to 'sizeof' in 'memset' call is the same expression as the destination; did you mean to dereference it? [-Werror=sizeof-pointer-memaccess]
+   memset (found, '\0', sizeof (found));
+                                ^
+The original commit is http://git.fedorahosted.org/cgit/elfutils.git/commit/src/ar.c?id=1a4d0668d18bf1090c5c08cdb5cb3ba2b8eb5410
+
+Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
+
+--- elfutils-0.148/src/ar.c.org	2013-03-12 21:12:17.928281375 -0500
++++ elfutils-0.148/src/ar.c	2013-03-12 21:15:30.053285271 -0500
+@@ -915,7 +915,7 @@
+ 		long int instance)
+ {
+   bool *found = alloca (sizeof (bool) * argc);
+-  memset (found, '\0', sizeof (found));
++  memset (found, '\0', sizeof (bool) * argc);
+ 
+   /* List of the files we keep.  */
+   struct armem *to_copy = NULL;
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
index bc9e9c6..e8d58fb 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3\
                     file://EXCEPTION;md5=570adcb0c1218ab57f2249c67d0ce417"
 DEPENDS = "libtool bzip2 zlib virtual/libintl"
 
-PR = "r10"
+PR = "r11"
 
 SRC_URI = "https://fedorahosted.org/releases/e/l/elfutils/elfutils-${PV}.tar.bz2"
 
@@ -32,6 +32,7 @@ SRC_URI += "\
 	file://fix_for_gcc-4.7.patch \
 	file://dso-link-change.patch \
 	file://nm-Fix-size-passed-to-snprintf-for-invalid-sh_name-case.patch \
+	file://elfutils-ar-c-fix-num-passed-to-memset.patch \
 "
 # Only apply when building uclibc based target recipe
 SRC_URI_append_libc-uclibc = " file://uclibc-support.patch"
-- 
1.7.9.5




