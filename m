Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1AF2B6E790
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 02:22:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0K2Mv44022062
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2014 18:22:57 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.164) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Sun, 19 Jan 2014 18:22:56 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Jan 2014 10:22:59 +0800
Message-ID: <a023434c6cc916907f190acd62af34ea5a6eaca0.1390184362.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1390184362.git.Qi.Chen@windriver.com>
References: <cover.1390184362.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 1/5] systemd: add 'less' to its RRECOMMENDS
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
X-List-Received-Date: Mon, 20 Jan 2014 02:22:56 -0000
Content-Type: text/plain

The less command provided by busybox cannot interpret the control
character, resulting in obscure output of the journalctl command
in a systemd based image.

Add the 'less' package to systemd's RRECOMMENDS so that the output
of 'journalctl' looks clear to users.

[YOCTO #5723]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd_208.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_208.bb b/meta/recipes-core/systemd/systemd_208.bb
index 6590235..3c44dec 100644
--- a/meta/recipes-core/systemd/systemd_208.bb
+++ b/meta/recipes-core/systemd/systemd_208.bb
@@ -219,10 +219,12 @@ FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ $
 
 RDEPENDS_${PN} += "kmod dbus util-linux-mount"
 
+# Recommend the less package to correctly display the contents of 'journalctl'
 RRECOMMENDS_${PN} += "systemd-serialgetty systemd-compat-units \
                       util-linux-agetty \
                       util-linux-fsck e2fsprogs-e2fsck \
                       kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
+                      less \
 "
 
 PACKAGES =+ "udev-dbg udev udev-utils udev-hwdb"
-- 
1.7.9.5


