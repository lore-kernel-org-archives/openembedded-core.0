Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E2DEB7089E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 08:33:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s778Xv2f021273
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Aug 2014 01:33:57 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 7 Aug 2014 01:33:57 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Aug 2014 16:34:02 +0800
Message-ID: <2c23e2ba5fed7c0b33ba9cbd6bea6aa109063890.1407400378.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1407400378.git.Qi.Chen@windriver.com>
References: <cover.1407400378.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] v86d: fix for systemd to load uvesafb module correctly
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
X-List-Received-Date: Thu, 07 Aug 2014 08:34:05 -0000
Content-Type: text/plain

The /etc/init.d/fbsetup script doesn't have any effect in a systemd
image. Its purpose is to load the uvesafb kernel module at boot.
This functionality could be achieved by adding a configuration file
under /etc/modules-load.d/ directory which would be parsed by the
systemd-modules-load.service.

[YOCTO #4420]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-bsp/v86d/v86d/uvesafb.conf |    2 ++
 meta/recipes-bsp/v86d/v86d_0.1.10.bb    |   14 ++++++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-bsp/v86d/v86d/uvesafb.conf

diff --git a/meta/recipes-bsp/v86d/v86d/uvesafb.conf b/meta/recipes-bsp/v86d/v86d/uvesafb.conf
new file mode 100644
index 0000000..4378975
--- /dev/null
+++ b/meta/recipes-bsp/v86d/v86d/uvesafb.conf
@@ -0,0 +1,2 @@
+# Load uvesafb.ko at boot
+uvesafb
diff --git a/meta/recipes-bsp/v86d/v86d_0.1.10.bb b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
index b980331..08438be 100644
--- a/meta/recipes-bsp/v86d/v86d_0.1.10.bb
+++ b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
@@ -12,6 +12,7 @@ PR = "r2"
 SRC_URI = "http://distfiles.gentoo.org/distfiles/${BP}.tar.bz2 \
            file://Update-x86emu-from-X.org.patch \
            file://fbsetup \
+           file://uvesafb.conf \
            file://ar-from-env.patch"
 
 SRC_URI[md5sum] = "51c792ba7b874ad8c43f0d3da4cfabe0"
@@ -35,8 +36,17 @@ do_install () {
 	install -d ${D}${base_sbindir}
 	install v86d ${D}${base_sbindir}/
 
-        install -d ${D}${sysconfdir}/init.d/
-        install -m 0755 ${WORKDIR}/fbsetup ${D}${sysconfdir}/init.d/fbsetup
+        # Only install fbsetup script if 'sysvinit' is in DISTRO_FEATURES
+        if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
+            install -d ${D}${sysconfdir}/init.d/
+            install -m 0755 ${WORKDIR}/fbsetup ${D}${sysconfdir}/init.d/fbsetup
+        fi
+
+        # Install systemd related configuration file
+        if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+            install -d ${D}${sysconfdir}/modules-load.d
+            install -m 0644 ${WORKDIR}/uvesafb.conf ${D}${sysconfdir}/modules-load.d
+        fi
 }
 
 inherit update-rc.d
-- 
1.7.9.5


