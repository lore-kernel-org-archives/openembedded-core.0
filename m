Return-Path: <yaoxp@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 099B26FC99
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jun 2014 06:47:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.00,743,1396972800"; d="scan'208";a="32186104"
Received: from localhost (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Jun 2014 14:44:52 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id s5K6lUY0001180
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jun 2014 14:47:30 +0800
Received: from FEDORA20.fnst.cn.fujitsu.com (10.167.226.101) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 20 Jun 2014 14:47:37 +0800
From: Yao Xinpan <yaoxp@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Jun 2014 14:47:02 +0800
Message-ID: <1403246822-19267-1-git-send-email-yaoxp@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.4.2
MIME-Version: 1.0
X-Originating-IP: [10.167.226.101]
Subject: [PATCH] nfs-utils: fix the --with-statdpath= flag
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
X-List-Received-Date: Fri, 20 Jun 2014 06:47:40 -0000
Content-Type: text/plain

if --with-statdpath= is not the default value, will happen the following questions:
'Failed to open directory sm: No such file or directory'.

Submitted to nfs-utils mailing list here:

    http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commitdiff;h=3b1457d219ceb1058d44bacc657581f13437ae40#patch1

This has been accepted into upstream nfs-utils so it will not be needed
for future versions.

Signed-off-by: Yao Xinpan <yaoxp@cn.fujitsu.com>
---
 .../0001-statd-fixed-the-with-statdpath-flag.patch | 40 ++++++++++++++++++++++
 .../nfs-utils/nfs-utils_1.3.0.bb                   |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-statd-fixed-the-with-statdpath-flag.patch

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-statd-fixed-the-with-statdpath-flag.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-statd-fixed-the-with-statdpath-flag.patch
new file mode 100644
index 0000000..59a0935
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-statd-fixed-the-with-statdpath-flag.patch
@@ -0,0 +1,40 @@
+From 3b1457d219ceb1058d44bacc657581f13437ae40 Mon Sep 17 00:00:00 2001
+From: Steve Dickson <steved@redhat.com>
+Date: Tue, 17 Jun 2014 13:28:53 -0400
+Subject: [PATCH] statd: fixed the --with-statdpath= flag
+
+Create the given path set with --with-statdpath
+
+Signed-off-by: chendt.fnst@cn.fujitsu.com
+Reported-by: yaoxp@cn.fujitsu.com
+Signed-off-by: Steve Dickson <steved@redhat.com>
+---
+ Makefile.am | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index ae7cd16..5824adc 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -54,13 +54,13 @@ install-data-hook:
+ 	touch $(DESTDIR)$(statedir)/xtab; chmod 644 $(DESTDIR)$(statedir)/xtab
+ 	touch $(DESTDIR)$(statedir)/etab; chmod 644 $(DESTDIR)$(statedir)/etab
+ 	touch $(DESTDIR)$(statedir)/rmtab; chmod 644 $(DESTDIR)$(statedir)/rmtab
+-	mkdir -p $(DESTDIR)$(statedir)/sm $(DESTDIR)$(statedir)/sm.bak
+-	touch $(DESTDIR)$(statedir)/state
+-	chmod go-rwx $(DESTDIR)$(statedir)/sm $(DESTDIR)$(statedir)/sm.bak $(DESTDIR)$(statedir)/state
+-	-chown $(statduser) $(DESTDIR)$(statedir)/sm $(DESTDIR)$(statedir)/sm.bak $(DESTDIR)$(statedir)/state
++	mkdir -p $(DESTDIR)$(statdpath)/sm $(DESTDIR)$(statdpath)/sm.bak
++	touch $(DESTDIR)$(statdpath)/state
++	chmod go-rwx $(DESTDIR)$(statdpath)/sm $(DESTDIR)$(statdpath)/sm.bak $(DESTDIR)$(statdpath)/state
++	-chown $(statduser) $(DESTDIR)$(statdpath)/sm $(DESTDIR)$(statdpath)/sm.bak $(DESTDIR)$(statdpath)/state
+ 
+ uninstall-hook:
+ 	rm $(DESTDIR)$(statedir)/xtab
+ 	rm $(DESTDIR)$(statedir)/etab
+ 	rm $(DESTDIR)$(statedir)/rmtab
+-	rm $(DESTDIR)$(statedir)/state
++	rm $(DESTDIR)$(statdpath)/state
+-- 
+1.8.4.2
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
index 8575647..c813d7f 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
@@ -30,6 +30,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://nfs-mountd.service \
            file://nfs-statd.service \
            file://nfs-utils-Do-not-pass-CFLAGS-to-gcc-while-building.patch \
+           file://0001-statd-fixed-the-with-statdpath-flag.patch \
 "
 
 SRC_URI[md5sum] = "6e93a7997ca3a1eac56bf219adab72a8"
-- 
1.8.4.2


