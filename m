Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E9D9277FC3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 08:02:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v8582rAK021377
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Sep 2017 01:02:53 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 5 Sep 2017 01:02:52 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Sep 2017 16:07:59 +0800
Message-ID: <68a878cd6e53211af0f2a5a248328d05597e63af.1504598502.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1504598502.git.Qi.Chen@windriver.com>
References: <cover.1504598502.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] systemd: change some RRECOMMENDS to RDEPENDS
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
X-List-Received-Date: Tue, 05 Sep 2017 08:02:53 -0000
Content-Type: text/plain

Set NO_RECOMMENDATIONS to "1", build and start a systemd image, and we
could not get serial getty spawned, thus causing the user not able to
login via serial port.

E.g.
MACHINE=qemux86-64 bitbake core-image-minimal
runqemu qemux86-64 nographic

And we cannot login onto the system.

Move util-linux-agetty and systemd-serialgetty (determined by PACKAGECONFIG)
from RRECOMMENDS to RDEPENDS to fix the above problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd_234.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-core/systemd/systemd_234.bb
index 2736f38..2695e15 100644
--- a/meta/recipes-core/systemd/systemd_234.bb
+++ b/meta/recipes-core/systemd/systemd_234.bb
@@ -492,13 +492,13 @@ FILES_${PN} = " ${base_bindir}/* \
 
 FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
 
-RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV})"
+RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV}) util-linux-agetty"
+RDEPENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', '', 'systemd-serialgetty', d)}"
 RDEPENDS_${PN} += "volatile-binds update-rc.d"
 
-RRECOMMENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', '', 'systemd-serialgetty', d)} \
-                      systemd-extra-utils \
+RRECOMMENDS_${PN} += "systemd-extra-utils \
                       systemd-compat-units udev-hwdb \
-                      util-linux-agetty  util-linux-fsck e2fsprogs-e2fsck \
+                      util-linux-fsck e2fsprogs-e2fsck \
                       kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
                       os-release \
 "
-- 
1.9.1


