Return-Path: <Haiqing.Bai@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8D0A77D42F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 03:36:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x343a0ix028390
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Apr 2019 20:36:01 -0700 (PDT)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 3 Apr 2019 20:35:48 -0700
From: Haiqing Bai <Haiqing.Bai@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 4 Apr 2019 11:18:14 +0800
Message-ID: <1554347895-57020-1-git-send-email-Haiqing.Bai@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] sysstat: Fixed the compiling error when configured with '--enable-install-cron'
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
X-List-Received-Date: Thu, 04 Apr 2019 03:36:00 -0000
Content-Type: text/plain

Remove the handling of enable/disable sysstat.service self-start in Makefile.in.
The code will trigger below error when cross compiling with
'--enable-install-cron':
| if [ -x "/path/to/sysstat/11.7.1-r0/recipe-sysroot-native/usr/bin/systemctl" ]; then \
|       /path/to/sysstat/11.7.1-r0/recipe-sysroot-native/usr/bin/systemctl enable sysstat.service; \
| fi
| Started /path/to/sysstat/11.7.1-r0/recipe-sysroot-native/usr/bin/systemctl enable sysstat.service
| Try to find location of sysstat.service...
| 'sysstat.service' couldn't be found; exiting with error

It's better to let user enable/disable the service with
'systemctl enable/disable sysstat.service'

Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
---
 ...code-of-handling-enable-disable-self-star.patch | 55 ++++++++++++++++++++++
 meta/recipes-extended/sysstat/sysstat_11.7.1.bb    |  3 +-
 2 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/sysstat/sysstat/0001-Remove-the-code-of-handling-enable-disable-self-star.patch

diff --git a/meta/recipes-extended/sysstat/sysstat/0001-Remove-the-code-of-handling-enable-disable-self-star.patch b/meta/recipes-extended/sysstat/sysstat/0001-Remove-the-code-of-handling-enable-disable-self-star.patch
new file mode 100644
index 0000000..1d099c9
--- /dev/null
+++ b/meta/recipes-extended/sysstat/sysstat/0001-Remove-the-code-of-handling-enable-disable-self-star.patch
@@ -0,0 +1,55 @@
+From 85813d1648b03ba0497635c45e90d7edf4dc204c Mon Sep 17 00:00:00 2001
+From: Haiqing Bai <Haiqing.Bai@windriver.com>
+Date: Fri, 29 Mar 2019 11:00:09 +0800
+Subject: [PATCH] Remove the code of handling enable/disable self-start service
+ in Makefile.in
+
+Remove the handling of enable/disable sysstat.service self-start in Makefile.in.
+The code will trigger below error when cross compiling with
+'--enable-install-cron':
+| if [ -x "/path/to/sysstat/11.7.1-r0/recipe-sysroot-native/usr/bin/systemctl" ]; then \
+|       /path/to/sysstat/11.7.1-r0/recipe-sysroot-native/usr/bin/systemctl enable sysstat.service; \
+| fi
+| Started /path/to/sysstat/11.7.1-r0/recipe-sysroot-native/usr/bin/systemctl enable sysstat.service
+| Try to find location of sysstat.service...
+| 'sysstat.service' couldn't be found; exiting with error
+
+It's better for user to enable/disable the service with
+'systemctl enable/disable sysstat.service'
+
+Upstream-Status: Inappropriate [ embedded specific ]
+
+Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
+---
+ Makefile.in | 8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index edaea3f..2186155 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -454,11 +454,6 @@ endif
+ 			fi \
+ 		fi \
+ 	fi
+-ifeq ($(COPY_ONLY),n)
+-	if [ -x "$(SYSTEMCTL)" ]; then \
+-		$(SYSTEMCTL) enable sysstat.service; \
+-	fi
+-endif
+ 
+ uninstall_man:
+ ifeq ($(INSTALL_DOC),y)
+@@ -541,9 +536,6 @@ ifeq ($(COPY_ONLY),n)
+ 		@echo "USER'S CRONTAB SAVED IN CURRENT DIRECTORY (USING .old SUFFIX)." ; \
+ 		-su $(CRON_OWNER) -c "crontab -r" ; \
+ 	fi
+-	if [ -x $(SYSTEMCTL) ]; then \
+-		$(SYSTEMCTL) disable sysstat.service; \
+-	fi
+ endif
+ 	if [ -n "$(SYSTEMD_UNIT_DIR)" -a -d $(DESTDIR)$(SYSTEMD_UNIT_DIR) ]; then \
+ 		rm -f $(DESTDIR)$(SYSTEMD_UNIT_DIR)/sysstat.service; \
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/sysstat/sysstat_11.7.1.bb b/meta/recipes-extended/sysstat/sysstat_11.7.1.bb
index 86738e7..26be619 100644
--- a/meta/recipes-extended/sysstat/sysstat_11.7.1.bb
+++ b/meta/recipes-extended/sysstat/sysstat_11.7.1.bb
@@ -2,7 +2,8 @@ require sysstat.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
-SRC_URI += "file://0001-Include-needed-headers-explicitly.patch"
+SRC_URI += "file://0001-Include-needed-headers-explicitly.patch \
+	file://0001-Remove-the-code-of-handling-enable-disable-self-star.patch"
 
 SRC_URI[md5sum] = "bdcda7c9048c7c22fb1f30f75285d13d"
 SRC_URI[sha256sum] = "303a595b1af0330b183a0f1febfccf89f183b9575ae0562b91fdb876f3ef1feb"
-- 
1.9.1


