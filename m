Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3654C784DC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jan 2018 07:27:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w047RI5M017098
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Jan 2018 23:27:18 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 3 Jan 2018 23:27:05 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 4 Jan 2018 15:06:16 +0800
Message-ID: <20180104070616.21334-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] systemd: fix udev-hwdb warning
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
X-List-Received-Date: Thu, 04 Jan 2018 07:27:17 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Add qemu usermode checking for udev-hwdb as
  udev-hwdb uses quemu usermode by default, but
  some architecture such as Intel skylake doesn't
  support qemu usermode and can result a build
  warning as below:
  | warning: %post(udev-hwdb-1:234-r0.skylake_64) scriptlet failed, exit status 1

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/recipes-core/systemd/systemd_234.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-core/systemd/systemd_234.bb
index 9a10a31881..64596b7563 100644
--- a/meta/recipes-core/systemd/systemd_234.bb
+++ b/meta/recipes-core/systemd/systemd_234.bb
@@ -619,9 +619,13 @@ pkg_prerm_${PN} () {
 PACKAGE_WRITE_DEPS += "qemu-native"
 pkg_postinst_udev-hwdb () {
 	if test -n "$D"; then
-		${@qemu_run_binary(d, '$D', '${base_bindir}/udevadm')} hwdb --update \
+		if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true','false', d)}; then
+			${@qemu_run_binary(d, '$D', '${base_bindir}/udevadm')} hwdb --update \
 			--root $D
-		chown root:root $D${sysconfdir}/udev/hwdb.bin
+			chown root:root $D${sysconfdir}/udev/hwdb.bin
+		else
+			exit 1
+		fi
 	else
 		udevadm hwdb --update
 	fi
-- 
2.11.0


