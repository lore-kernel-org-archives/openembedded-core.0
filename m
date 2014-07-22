Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 27ED06B876
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 02:44:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6M2iup0023380
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 19:44:56 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 21 Jul 2014 19:44:55 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jul 2014 10:45:04 +0800
Message-ID: <e507facc9bf56040f966942677f550f4ee321baf.1405996967.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1405996967.git.Qi.Chen@windriver.com>
References: <cover.1405996967.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] systemd: change dependency relationships
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
X-List-Received-Date: Tue, 22 Jul 2014 02:44:57 -0000
Content-Type: text/plain

When building out a systemd based image, the udev-hwdb postinstall
script always fails at rootfs time. This is because that the 'udevadm'
command used in udev-hwdb postinstall script is now in the udev
package and udev recommends udev-hwdb.

Instead of letting udev recommends udev-hwdb, we let systemd do it
and make udev-hwdb rdepend on udev.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd_213.bb |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_213.bb b/meta/recipes-core/systemd/systemd_213.bb
index 28cc4cb..5de7cdc 100644
--- a/meta/recipes-core/systemd/systemd_213.bb
+++ b/meta/recipes-core/systemd/systemd_213.bb
@@ -244,7 +244,7 @@ FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ $
 
 RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV})"
 
-RRECOMMENDS_${PN} += "systemd-serialgetty systemd-compat-units \
+RRECOMMENDS_${PN} += "systemd-serialgetty systemd-compat-units udev-hwdb\
                       util-linux-agetty \
                       util-linux-fsck e2fsprogs-e2fsck \
                       kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
@@ -255,7 +255,8 @@ PACKAGES =+ "udev-dbg udev udev-hwdb"
 FILES_udev-dbg += "/lib/udev/.debug"
 
 RPROVIDES_udev = "hotplug"
-RRECOMMENDS_udev += "udev-hwdb"
+
+RDEPENDS_udev-hwdb += "udev"
 
 FILES_udev += "${base_sbindir}/udevd \
                ${rootlibexecdir}/systemd/systemd-udevd \
-- 
1.7.9.5


