Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 771AC6FFED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 07:28:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6P7SaT0019878
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 00:28:36 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 25 Jul 2016 00:28:35 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jul 2016 00:28:29 -0700
Message-ID: <76b0df7938c57567979a415b8292c595697b3b8b.1469431638.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1469431638.git.liezhi.yang@windriver.com>
References: <cover.1469431638.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/7] systemd: install udev.pc
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
X-List-Received-Date: Mon, 25 Jul 2016 07:28:38 -0000
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


