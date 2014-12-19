Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 43A2E728EA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 09:17:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBJ9Hjrv028035
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 01:17:45 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 19 Dec 2014 01:17:45 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Dec 2014 17:17:43 +0800
Message-ID: <14030a101df4c3eddbd3f7606b6d8835ab2c6110.1418979966.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1418979966.git.Qi.Chen@windriver.com>
References: <cover.1418979966.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] systemd: fix hardcoding of paths
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
X-List-Received-Date: Fri, 19 Dec 2014 09:17:51 -0000
Content-Type: text/plain

Instead of using '/lib', we should use ${nonarch_lib_dir}.
Otherwise, when ${nonarch_lib_dir} is not /lib, there would be errors.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd_216.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_216.bb b/meta/recipes-core/systemd/systemd_216.bb
index 536b7be..b90e739 100644
--- a/meta/recipes-core/systemd/systemd_216.bb
+++ b/meta/recipes-core/systemd/systemd_216.bb
@@ -87,7 +87,7 @@ EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
                  --enable-split-usr \
                  --without-python \
                  --with-sysvrcnd-path=${sysconfdir} \
-                 --with-firmware-path=/lib/firmware \
+                 --with-firmware-path=${nonarch_base_libdir}/firmware \
                  ac_cv_path_KILL=${base_bindir}/kill \
                "
 # uclibc does not have NSS
@@ -260,10 +260,10 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${exec_prefix}/lib/sysctl.d \
                 ${exec_prefix}/lib/sysusers.d \
                 ${localstatedir} \
-                /lib/udev/rules.d/70-uaccess.rules \
-                /lib/udev/rules.d/71-seat.rules \
-                /lib/udev/rules.d/73-seat-late.rules \
-                /lib/udev/rules.d/99-systemd.rules \
+                ${nonarch_base_libdir}/udev/rules.d/70-uaccess.rules \
+                ${nonarch_base_libdir}/udev/rules.d/71-seat.rules \
+                ${nonarch_base_libdir}/udev/rules.d/73-seat-late.rules \
+                ${nonarch_base_libdir}/udev/rules.d/99-systemd.rules \
                 ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${sysconfdir}/pam.d', '', d)} \
                "
 
@@ -281,7 +281,7 @@ RRECOMMENDS_${PN} += "systemd-serialgetty systemd-compat-units udev-hwdb\
 
 PACKAGES =+ "udev-dbg udev udev-hwdb"
 
-FILES_udev-dbg += "/lib/udev/.debug"
+FILES_udev-dbg += "${nonarch_base_libdir}/udev/.debug"
 
 RPROVIDES_udev = "hotplug"
 
-- 
1.9.1


