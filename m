Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 921E273D41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Apr 2015 02:00:34 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so73316242pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 19:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LRAjWFau2q0ZJOjfQQyPBXOSUC5EPGehe0FQlqtEvCA=;
	b=h05khC9Z7rE1jpKHQbjR/gXNHLA+b8OR3cmGY0+hFw0b1dOHmiZtAmzZLrmHtg+p2I
	glHeP6IiXCAtM2Wwmy9k4wHY3bfcFK+Pzpdz9RPdHaj3poiHD0EkckJXBCnl17Xwzee8
	Jgk/oVF38nHEYyZ/X3cri/Vg4I8lz1XBh26ZZ7JIBo45XgXpg6FnB0ZECtvn3U3vxCY4
	zoVROdbTVxhPE0eBV21qEKVEaWQ7GJ6sNtCCahPsM6pX+O+SPgjOSb7/3VsvJ4b8PE93
	lN/L/Q0pSRYlYbgzsLnByKjzP4LSiF2jpJpCQ20uIUHegwwq3NcBrdXy2quAPiUsu6ZX
	nr0Q==
X-Received: by 10.70.101.161 with SMTP id fh1mr29768647pdb.47.1429149635616;
	Wed, 15 Apr 2015 19:00:35 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169]) by mx.google.com with ESMTPSA id
	nt15sm5371563pdb.14.2015.04.15.19.00.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Apr 2015 19:00:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Apr 2015 19:00:18 -0700
Message-Id: <0302d234e93ab28cac466dd5eb96deb9dca3bf41.1429149397.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1429149397.git.raj.khem@gmail.com>
References: <cover.1429149397.git.raj.khem@gmail.com>
Subject: [PATCH 01/10] at: Remove glibc specific code
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
X-List-Received-Date: Thu, 16 Apr 2015 02:00:34 -0000

Fixes errors like
|
/home/kraj/work/bleeding/openembedded-core/build/tmp-musl/work/i586-oe-linux-musl/at/3.1.16-r0/at-3.1.16/parsetime.y:264:
undefined reference to `__isleap'
| collect2: error: ld returned 1 exit status

Change-Id: Ie6ec970b12c918de640ba47e090b2f67a3a43f4e
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../at/at/0001-remove-glibc-assumption.patch       | 57 ++++++++++++++++++++++
 meta/recipes-extended/at/at_3.1.16.bb              |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-extended/at/at/0001-remove-glibc-assumption.patch

diff --git a/meta/recipes-extended/at/at/0001-remove-glibc-assumption.patch b/meta/recipes-extended/at/at/0001-remove-glibc-assumption.patch
new file mode 100644
index 0000000..53ae28b
--- /dev/null
+++ b/meta/recipes-extended/at/at/0001-remove-glibc-assumption.patch
@@ -0,0 +1,57 @@
+From 7f811d9c4ebc9444e613e251c31d6bf537a24dc1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 13 Apr 2015 16:35:30 -0700
+Subject: [PATCH] remove glibc assumption
+
+glibc time.h header has an undocumented __isleap macro
+that we are using anf musl is missing it.
+Since it is undocumented & does not appear
+on any other libc, stop using it and just define the macro in
+locally  instead.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ parsetime.y | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/parsetime.y b/parsetime.y
+index 7005e88..324e6d3 100644
+--- a/parsetime.y
++++ b/parsetime.y
+@@ -8,6 +8,9 @@
+ 
+ #define YYDEBUG 1
+ 
++#define is_leap_year(y) \
++    ((y) % 4 == 0 && ((y) % 100 != 0 || (y) % 400 == 0))
++
+ struct tm exectm;
+ static int isgmt;
+ static int yearspec;
+@@ -217,8 +220,8 @@ date            : month_name day_number
+ 				 mnum == 12) && dnum > 31)
+ 			    || ((mnum ==  4 || mnum ==  6 || mnum ==  9 ||
+ 			         mnum == 11) && dnum > 30)
+-			    || (mnum ==  2 && dnum > 29 &&  __isleap(ynum+1900))
+-			    || (mnum ==  2 && dnum > 28 && !__isleap(ynum+1900))
++			    || (mnum ==  2 && dnum > 29 &&  is_leap_year(ynum+1900))
++			    || (mnum ==  2 && dnum > 28 && !is_leap_year(ynum+1900))
+ 			   )
+ 			{
+ 			    yyerror("Error in day of month");
+@@ -261,8 +264,8 @@ date            : month_name day_number
+ 				 mnum == 12) && dnum > 31)
+ 			    || ((mnum ==  4 || mnum ==  6 || mnum ==  9 ||
+ 			         mnum == 11) && dnum > 30)
+-			    || (mnum ==  2 && dnum > 29 &&  __isleap(ynum+1900))
+-			    || (mnum ==  2 && dnum > 28 && !__isleap(ynum+1900))
++			    || (mnum ==  2 && dnum > 29 &&  is_leap_year(ynum+1900))
++			    || (mnum ==  2 && dnum > 28 && !is_leap_year(ynum+1900))
+ 			   )
+ 			{
+ 			    yyerror("Error in day of month");
+-- 
+2.1.4
+
diff --git a/meta/recipes-extended/at/at_3.1.16.bb b/meta/recipes-extended/at/at_3.1.16.bb
index cee9fde..0512bcb 100644
--- a/meta/recipes-extended/at/at_3.1.16.bb
+++ b/meta/recipes-extended/at/at_3.1.16.bb
@@ -24,6 +24,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/at/at_${PV}.orig.tar.gz \
     file://atd.service \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
     file://makefile-fix-parallel.patch \
+    file://0001-remove-glibc-assumption.patch \
     "
 
 PAM_SRC_URI = "file://pam.conf.patch \
-- 
2.1.4


