Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 71D497453F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 03:43:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8L3hCbp027488
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 20 Sep 2018 20:43:14 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 20 Sep 2018 20:43:12 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Fri, 21 Sep 2018 11:43:10 +0800
Message-ID: <20180921034310.81584-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20180918094749.102156-1-mingli.yu@windriver.com>
References: <20180918094749.102156-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v3] glibc: fix Segmentation fault in gethostid.c
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
X-List-Received-Date: Fri, 21 Sep 2018 03:43:15 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Linux gethostid: Check for NULL value from gethostbyname_r [BZ #23679]

A NULL value can happen with certain gethostbyname_r failures.

Before this patch, there is a Segmentation fault
as below:
 # /mybuild/hostid
 Segmentation fault
 # gdb /mybuild/hostid
 GNU gdb (GDB) 8.2
 Copyright (C) 2018 Free Software Foundation, Inc.
 License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
 This is free software: you are free to change and redistribute it.
 There is NO WARRANTY, to the extent permitted by law.
 Type "show copying" and "show warranty" for details.
 This GDB was configured as "x86_64-wrs-linux".
 Type "show configuration" for configuration details.
 For bug reporting instructions, please see:
 <http://www.gnu.org/software/gdb/bugs/>.
 Find the GDB manual and other documentation resources online at:
    <http://www.gnu.org/software/gdb/documentation/>.

 For help, type "help".
 Type "apropos word" to search for commands related to "word"...
 Reading symbols from /mybuild/hostid...done.
 (gdb) r
 Starting program: /mybuild/hostid

 Program received signal SIGSEGV, Segmentation fault.
 0x00007ffff7f0330e in gethostid () at ../sysdeps/unix/sysv/linux/gethostid.c:125
 125	  memcpy (&in, hp->h_addr,
 (gdb) bt
 #0  0x00007ffff7f0330e in gethostid () at ../sysdeps/unix/sysv/linux/gethostid.c:125
 #1  0x0000555555555159 in main ()

 # cat /mybuild/hostid.c
 #include <stdio.h>
 #include <unistd.h>

 int
 main(int argc, char *argv[])
 {
    long hostid;
    hostid = gethostid();
    printf("the hostid is %ld\n", hostid);

 }

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 ...stid-Check-for-NULL-value-from-gethostbyn.patch | 38 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.28.bb              |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-Linux-gethostid-Check-for-NULL-value-from-gethostbyn.patch

diff --git a/meta/recipes-core/glibc/glibc/0001-Linux-gethostid-Check-for-NULL-value-from-gethostbyn.patch b/meta/recipes-core/glibc/glibc/0001-Linux-gethostid-Check-for-NULL-value-from-gethostbyn.patch
new file mode 100644
index 0000000000..e924779ab5
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0001-Linux-gethostid-Check-for-NULL-value-from-gethostbyn.patch
@@ -0,0 +1,38 @@
+From e7d22db29cfdd2f1fb97a70a76fa53d151569945 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <Mingli.Yu@windriver.com>
+Date: Thu, 20 Sep 2018 12:41:13 +0200
+Subject: [PATCH] Linux gethostid: Check for NULL value from gethostbyname_r [BZ #23679]
+
+A NULL value can happen with certain gethostbyname_r failures.
+
+(cherry picked from commit 1214ba06e6771acb953a190091b0f6055c64fd25)
+
+Upstream-Status: Backport[https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=1214ba06e6771acb953a190091b0f6055c64fd25]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ sysdeps/unix/sysv/linux/gethostid.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/sysdeps/unix/sysv/linux/gethostid.c b/sysdeps/unix/sysv/linux/gethostid.c
+index 2e20f034dc..ee0190e7f9 100644
+--- a/sysdeps/unix/sysv/linux/gethostid.c
++++ b/sysdeps/unix/sysv/linux/gethostid.c
+@@ -102,12 +102,12 @@ gethostid (void)
+     {
+       int ret = __gethostbyname_r (hostname, &hostbuf,
+ 				   tmpbuf.data, tmpbuf.length, &hp, &herr);
+-      if (ret == 0)
++      if (ret == 0 && hp != NULL)
+ 	break;
+       else
+ 	{
+ 	  /* Enlarge the buffer on ERANGE.  */
+-	  if (herr == NETDB_INTERNAL && errno == ERANGE)
++	  if (ret != 0 && herr == NETDB_INTERNAL && errno == ERANGE)
+ 	    {
+ 	      if (!scratch_buffer_grow (&tmpbuf))
+ 		return 0;
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/glibc/glibc_2.28.bb b/meta/recipes-core/glibc/glibc_2.28.bb
index 0ebbaf9610..1597968318 100644
--- a/meta/recipes-core/glibc/glibc_2.28.bb
+++ b/meta/recipes-core/glibc/glibc_2.28.bb
@@ -45,6 +45,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0028-bits-siginfo-consts.h-enum-definition-for-TRAP_HWBKP.patch \
            file://0029-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
            file://0030-intl-Emit-no-lines-in-bison-generated-files.patch \
+           file://0001-Linux-gethostid-Check-for-NULL-value-from-gethostbyn.patch \
 "
 
 NATIVESDKFIXES ?= ""
-- 
2.13.3


