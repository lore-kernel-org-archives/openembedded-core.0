Return-Path: <i.efimov@inango-systems.com>
Received: from mail.inango-sw.com (mail.inango-systems.com [213.136.71.184])
	by mail.openembedded.org (Postfix) with ESMTP id E48A76C108
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Mar 2019 17:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.inango-sw.com (Postfix) with ESMTP id 53E7E7A24D7
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Mar 2019 19:33:43 +0200 (IST)
Received: from mail.inango-sw.com ([127.0.0.1])
	by localhost (mail.inango-sw.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id EDsNjHNd-bma; Sun,  3 Mar 2019 19:33:41 +0200 (IST)
Received: from localhost (localhost [127.0.0.1])
	by mail.inango-sw.com (Postfix) with ESMTP id D97537A24D5;
	Sun,  3 Mar 2019 19:33:40 +0200 (IST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.inango-sw.com D97537A24D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inango-systems.com;
	s=45A440E0-D841-11E8-B985-5FCC721607E0; t=1551634420;
	bh=eM2sbV8TyZr8Ey87n8cjQUe7+trOx0xjNy17SQ39J+g=;
	h=From:To:Date:Message-Id;
	b=QRM4shwGUcUDkdndLU6DgQv08XhEcVAU8rwoJ9b6vzl3NIP0RqGrqtkN4R+DWrl4H
	x5dGlHEGqzBCzHF/YbUyt3GjxjnVnRKFPeYRl8jqFGODl414vTPyrZkVo/CEtL0jE5
	ClxAJozwm/KlR5S7V1FCV2Q5Q1CIMvT953s/ee2xqPjVMqJlZQ+4QzTQ/y9UuKfVu3
	c2aHhG4Anz+AyPLwptn5NZiW+on1UN0W+VyNSDOFGh/GHL4lnAIDT/YZ39R03fvBWK
	eIPYiDXT4gxme+D1+86VVVui784rXgStw/T0JAuHxaF40ob/0ev37FJdwu2i6GDZwb
	trwtBim8s64qQ==
X-Virus-Scanned: amavisd-new at inango-sw.com
Received: from mail.inango-sw.com ([127.0.0.1])
	by localhost (mail.inango-sw.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 2c1utbHotIA1; Sun,  3 Mar 2019 19:33:40 +0200 (IST)
Received: from ivane-1.inango-sw (unknown [194.60.247.123])
	by mail.inango-sw.com (Postfix) with ESMTPSA id 667E97A24B9;
	Sun,  3 Mar 2019 19:33:40 +0200 (IST)
From: Ivan Efimov <i.efimov@inango-systems.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Mar 2019 22:33:26 +0500
Message-Id: <20190303173326.11995-1-i.efimov@inango-systems.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH v2] btrfs-tools, Makefile: remove duplicated '-o $@' option from CC cmdline for libbtrfsutil/ folder
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
X-List-Received-Date: Sun, 03 Mar 2019 17:33:43 -0000

Command line for target "libbtrfsutil/%.o" contained
double usage of '-o $@' option and causes compilation error:

     cc1: error: too many filenames given

Upsteam-Status: Pending

Signed-off-by: Ivan Efimov <i.efimov@inango-systems.com>
---
 ...01-Makefile-fix-double-o-compiler-option-using.patch | 17 +++++++++++++++++
 meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.1.bb |  1 +
 2 files changed, 18 insertions(+)
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Makefile-fix-double-o-compiler-option-using.patch

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Makefile-fix-double-o-compiler-option-using.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Makefile-fix-double-o-compiler-option-using.patch
new file mode 100644
index 0000000000..335067bc1f
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Makefile-fix-double-o-compiler-option-using.patch
@@ -0,0 +1,17 @@
+Command line for target "libbtrfsutil/%.o" contained double usage
+  of '-o $@' option and caused error:
+    cc1: error: too many filenames given
+
+Index: git/Makefile
+===================================================================
+--- git.orig/Makefile
++++ git/Makefile
+@@ -414,7 +414,7 @@ libbtrfs.so.0 libbtrfs.so: libbtrfs.so.0
+ 
+ libbtrfsutil/%.o: libbtrfsutil/%.c
+ 	@echo "    [CC]     $@"
+-	$(Q)$(CC) $(LIBBTRFSUTIL_CFLAGS) -o $@ -c $< -o $@
++	$(Q)$(CC) $(LIBBTRFSUTIL_CFLAGS) -c $< -o $@
+ 
+ libbtrfsutil.so.$(libbtrfsutil_version): $(libbtrfsutil_objects)
+ 	@echo "    [LD]     $@"
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.1.bb
index 1b4f515cb6..f1c4691313 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.1.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Makefile-build-mktables-using-native-gcc.patch \
            file://0001-Add-LDFLAGS-when-building-libbtrfsutil.so.patch \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
+           file://0001-Makefile-fix-double-o-compiler-option-using.patch \
            "
 
 inherit autotools-brokensep pkgconfig manpages distutils3-base
-- 
2.14.1


