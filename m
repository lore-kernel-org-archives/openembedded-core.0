Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1ED13720D6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 23:41:03 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 13 Nov 2014 15:40:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,381,1413270000"; d="scan'208";a="631674001"
Received: from aehernan-devstation.zpn.intel.com ([10.219.4.47])
	by fmsmga002.fm.intel.com with ESMTP; 13 Nov 2014 15:39:51 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Nov 2014 17:39:50 -0600
Message-Id: <5eb96c248683354baf29db133c72e6c3a98cf16c.1415920471.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415920471.git.alejandro.hernandez@linux.intel.com>
References: <cover.1415920471.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/2 v2] nfs-utils: Upgrade to 1.3.1
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
X-List-Received-Date: Thu, 13 Nov 2014 23:41:05 -0000

Removed: fix-a-Gcc-undefined-behavior.patch - Upstream

Removed: 0001-statd-fixed-the-with-statdpath-flag.patch - Upstream

Removed: fix-the-start-statd.patch - Different solution on upstream

Removed: nfs-utils-1.0.6-uclibc.patch - Different solution on upstream

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 .../files/fix-a-Gcc-undefined-behavior.patch       | 38 --------------------
 .../0001-statd-fixed-the-with-statdpath-flag.patch | 41 ----------------------
 .../nfs-utils/nfs-utils/fix-the-start-statd.patch  | 30 ----------------
 .../nfs-utils/nfs-utils-1.0.6-uclibc.patch         | 27 --------------
 .../{nfs-utils_1.3.0.bb => nfs-utils_1.3.1.bb}     |  8 ++---
 5 files changed, 2 insertions(+), 142 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/files/fix-a-Gcc-undefined-behavior.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-statd-fixed-the-with-statdpath-flag.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/fix-the-start-statd.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.0.6-uclibc.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_1.3.0.bb => nfs-utils_1.3.1.bb} (91%)

diff --git a/meta/recipes-connectivity/nfs-utils/files/fix-a-Gcc-undefined-behavior.patch b/meta/recipes-connectivity/nfs-utils/files/fix-a-Gcc-undefined-behavior.patch
deleted file mode 100644
index 5843ba0..0000000
--- a/meta/recipes-connectivity/nfs-utils/files/fix-a-Gcc-undefined-behavior.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-[PATCH] fix a Gcc undefined behavior
-
-Upstream-Status: Pending
-
-Calling strncpy with NULL second argument, even when the size is 0,
-is undefined behavior, which leads to GCC to drop the check old
-variable with NULL in following code.
-
-https://bugzilla.yoctoproject.org/show_bug.cgi?id=6743
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- support/export/client.c |    9 +++++++--
- 1 file changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/support/export/client.c b/support/export/client.c
-index dbf47b9..a37ef69 100644
---- a/support/export/client.c
-+++ b/support/export/client.c
-@@ -482,8 +482,13 @@ add_name(char *old, const char *add)
- 		else
- 			cp = cp + strlen(cp);
- 	}
--	strncpy(new, old, cp-old);
--	new[cp-old] = 0;
-+
-+	if (old) {
-+		strncpy(new, old, cp-old);
-+		new[cp-old] = 0;
-+	} else
-+		new[0] = 0;
-+	
- 	if (cp != old && !*cp)
- 		strcat(new, ",");
- 	strcat(new, add);
--- 
-1.7.10.4
-
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-statd-fixed-the-with-statdpath-flag.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-statd-fixed-the-with-statdpath-flag.patch
deleted file mode 100644
index 2ce824c..0000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-statd-fixed-the-with-statdpath-flag.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 3b1457d219ceb1058d44bacc657581f13437ae40 Mon Sep 17 00:00:00 2001
-From: Steve Dickson <steved@redhat.com>
-Date: Tue, 17 Jun 2014 13:28:53 -0400
-Subject: [PATCH] statd: fixed the --with-statdpath= flag
-
-Create the given path set with --with-statdpath
-
-Signed-off-by: chendt.fnst@cn.fujitsu.com
-Reported-by: yaoxp@cn.fujitsu.com
-Signed-off-by: Steve Dickson <steved@redhat.com>
-Upstream-Status: Backport
----
- Makefile.am | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index ae7cd16..5824adc 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -54,13 +54,13 @@ install-data-hook:
- 	touch $(DESTDIR)$(statedir)/xtab; chmod 644 $(DESTDIR)$(statedir)/xtab
- 	touch $(DESTDIR)$(statedir)/etab; chmod 644 $(DESTDIR)$(statedir)/etab
- 	touch $(DESTDIR)$(statedir)/rmtab; chmod 644 $(DESTDIR)$(statedir)/rmtab
--	mkdir -p $(DESTDIR)$(statedir)/sm $(DESTDIR)$(statedir)/sm.bak
--	touch $(DESTDIR)$(statedir)/state
--	chmod go-rwx $(DESTDIR)$(statedir)/sm $(DESTDIR)$(statedir)/sm.bak $(DESTDIR)$(statedir)/state
--	-chown $(statduser) $(DESTDIR)$(statedir)/sm $(DESTDIR)$(statedir)/sm.bak $(DESTDIR)$(statedir)/state
-+	mkdir -p $(DESTDIR)$(statdpath)/sm $(DESTDIR)$(statdpath)/sm.bak
-+	touch $(DESTDIR)$(statdpath)/state
-+	chmod go-rwx $(DESTDIR)$(statdpath)/sm $(DESTDIR)$(statdpath)/sm.bak $(DESTDIR)$(statdpath)/state
-+	-chown $(statduser) $(DESTDIR)$(statdpath)/sm $(DESTDIR)$(statdpath)/sm.bak $(DESTDIR)$(statdpath)/state
- 
- uninstall-hook:
- 	rm $(DESTDIR)$(statedir)/xtab
- 	rm $(DESTDIR)$(statedir)/etab
- 	rm $(DESTDIR)$(statedir)/rmtab
--	rm $(DESTDIR)$(statedir)/state
-+	rm $(DESTDIR)$(statdpath)/state
--- 
-1.8.4.2
-
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/fix-the-start-statd.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/fix-the-start-statd.patch
deleted file mode 100644
index b7e835e..0000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/fix-the-start-statd.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-[PATCH] fix the start-statd
-
-Upstream-Status: Pending
-
-1. add /bin/ to PATH, since systemctl is installed under /bin/
-2. redirect error to /dev/null
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- utils/statd/start-statd |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/utils/statd/start-statd b/utils/statd/start-statd
-index cde3583..098ce70 100644
---- a/utils/statd/start-statd
-+++ b/utils/statd/start-statd
-@@ -4,8 +4,8 @@
- # /var/run/rpc.statd.pid).
- # It should run statd with whatever flags are apropriate for this
- # site.
--PATH=/sbin:/usr/sbin
--if systemctl start statd.service
-+PATH=/sbin:/usr/sbin:/bin
-+if systemctl start statd.service 2>/dev/null
- then :
- else
-     exec rpc.statd --no-notify
--- 
-1.7.10.4
-
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.0.6-uclibc.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.0.6-uclibc.patch
deleted file mode 100644
index c344238..0000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.0.6-uclibc.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Index: nfs-utils-1.2.6/support/nfs/svc_socket.c
-===================================================================
---- nfs-utils-1.2.6.orig/support/nfs/svc_socket.c	2012-05-14 07:40:52.000000000 -0700
-+++ nfs-utils-1.2.6/support/nfs/svc_socket.c	2012-10-28 02:42:50.179222457 -0700
-@@ -40,8 +40,9 @@
- 	char rpcdata[1024], servdata[1024];
- 	struct rpcent rpcbuf, *rpcp;
- 	struct servent servbuf, *servp = NULL;
--	int ret;
-+	int ret = 0;
- 
-+#ifndef __UCLIBC__     /* neither getrpcbynumber() nor getrpcbynumber_r() is SuSv3 */
- 	ret = getrpcbynumber_r(number, &rpcbuf, rpcdata, sizeof rpcdata,
- 				&rpcp);
- 	if (ret == 0 && rpcp != NULL) {
-@@ -60,6 +61,7 @@
- 			}
- 		}
- 	}
-+#endif /* __UCLIBC__ */
- 
- 	if (ret == 0 && servp != NULL)
- 		return ntohs(servp->s_port);
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
similarity index 91%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
index 4933e10..5383c91 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
@@ -21,7 +21,6 @@ USERADD_PARAM_${PN}-client = "--system  --home-dir /var/lib/nfs \
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.xz \
            file://0001-configure-Allow-to-explicitly-disable-nfsidmap.patch \
-           file://nfs-utils-1.0.6-uclibc.patch \
            file://nfs-utils-1.2.3-sm-notify-res_init.patch \
            file://nfsserver \
            file://nfscommon \
@@ -30,13 +29,10 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://nfs-mountd.service \
            file://nfs-statd.service \
            file://nfs-utils-Do-not-pass-CFLAGS-to-gcc-while-building.patch \
-           file://0001-statd-fixed-the-with-statdpath-flag.patch \
-           file://fix-a-Gcc-undefined-behavior.patch \
-           file://fix-the-start-statd.patch \
 "
 
-SRC_URI[md5sum] = "6e93a7997ca3a1eac56bf219adab72a8"
-SRC_URI[sha256sum] = "ab8384d0e487ed6a18c5380d5df28015f7dd98680bf08f3247c97d9f7d99e56f"
+SRC_URI[md5sum] = "8de676b9ff34b8f9addc1d0800fabdf8"
+SRC_URI[sha256sum] = "ff79d70b7b58b2c8f9b798c58721127e82bb96022adc04a5c4cb251630e696b8"
 
 PARALLEL_MAKE = ""
 
-- 
1.9.1


