Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8B69478C7E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 06:33:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7R6X4CJ016957
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Aug 2018 23:33:04 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Sun, 26 Aug 2018 23:33:03 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 26 Aug 2018 23:33:03 -0700
Message-ID: <20180827063303.48086-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [ROCKO][PATCH] shadow: CVE-2016-6252
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
X-List-Received-Date: Mon, 27 Aug 2018 06:33:03 -0000
Content-Type: text/plain

Backport patch from the upstream
https://github.com/shadow-maint/shadow/commit/
1d5a926cc2d6078d23a96222b1ef3e558724dad1

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 .../shadow/files/CVE-2016-6252.patch          | 48 +++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc       |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/CVE-2016-6252.patch

diff --git a/meta/recipes-extended/shadow/files/CVE-2016-6252.patch b/meta/recipes-extended/shadow/files/CVE-2016-6252.patch
new file mode 100644
index 0000000000..bdaba5eecd
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/CVE-2016-6252.patch
@@ -0,0 +1,48 @@
+From 1d5a926cc2d6078d23a96222b1ef3e558724dad1 Mon Sep 17 00:00:00 2001
+From: Sebastian Krahmer <krahmer@suse.com>
+Date: Wed, 3 Aug 2016 11:51:07 -0500
+Subject: [PATCH] Simplify getulong
+
+Use strtoul to read an unsigned long, rather than reading
+a signed long long and casting it.
+
+https://bugzilla.suse.com/show_bug.cgi?id=979282
+
+Upstream-Status: Backport
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+---
+ lib/getulong.c | 9 +++------
+ 1 file changed, 3 insertions(+), 6 deletions(-)
+
+diff --git a/lib/getulong.c b/lib/getulong.c
+index 61579ca..08d2c1a 100644
+--- a/lib/getulong.c
++++ b/lib/getulong.c
+@@ -44,22 +44,19 @@
+  */
+ int getulong (const char *numstr, /*@out@*/unsigned long int *result)
+ {
+-	long long int val;
++	unsigned long int val;
+ 	char *endptr;
+ 
+ 	errno = 0;
+-	val = strtoll (numstr, &endptr, 0);
++	val = strtoul (numstr, &endptr, 0);
+ 	if (    ('\0' == *numstr)
+ 	     || ('\0' != *endptr)
+ 	     || (ERANGE == errno)
+-	     /*@+ignoresigns@*/
+-	     || (val != (unsigned long int)val)
+-	     /*@=ignoresigns@*/
+ 	   ) {
+ 		return 0;
+ 	}
+ 
+-	*result = (unsigned long int)val;
++	*result = val;
+ 	return 1;
+ }
+ 
+-- 
+1.9.1
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index ccae09183c..9b3b748a64 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -19,6 +19,7 @@ SRC_URI = "https://downloads.yoctoproject.org/mirror/sources/${BP}.tar.xz \
            file://check_size_of_uid_t_and_gid_t_using_AC_CHECK_SIZEOF.patch \
            file://0001-useradd-copy-extended-attributes-of-home.patch \
            file://0001-shadow-CVE-2017-12424 \
+           file://CVE-2016-6252.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            "
 
-- 
2.17.1


