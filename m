Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E610E606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 09:27:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6R9Rxsr030132
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 02:28:00 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 27 Jul 2016 02:27:59 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jul 2016 02:27:50 -0700
Message-ID: <65135ed814b9c39f3e85526514c33872774bc47b.1469609666.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1469609666.git.liezhi.yang@windriver.com>
References: <cover.1469609666.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 2/9] systemd: install udev.pc
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
X-List-Received-Date: Wed, 27 Jul 2016 09:28:01 -0000
Content-Type: text/plain

It provides udev, but doesn't install udev.pc, which causes other
recipes failed to figure out udevdir.

Fixed when systemd in DISTRO_FEATURES:
$ bitbake pcmciautils (or btrfs-tools):

Package udev was not found in the pkg-config search path.
Perhaps you should add the directory containing `udev.pc'
to the PKG_CONFIG_PATH environment variable
No package 'udev' found

Their udev rules file may not be installed according to each pkg's
implementation.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/systemd/systemd_230.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_230.bb b/meta/recipes-core/systemd/systemd_230.bb
index 374a197..3c83ebb 100644
--- a/meta/recipes-core/systemd/systemd_230.bb
+++ b/meta/recipes-core/systemd/systemd_230.bb
@@ -202,6 +202,8 @@ do_install() {
 	install -d ${D}${sysconfdir}/udev/rules.d/
 	install -d ${D}${sysconfdir}/tmpfiles.d
 	install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d/
+	install -d ${D}${libdir}/pkgconfig
+	install -m 0644 ${B}/src/udev/udev.pc ${D}${libdir}/pkgconfig/
 
 	install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
 
-- 
2.9.0


