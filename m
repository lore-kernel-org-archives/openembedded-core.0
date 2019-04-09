Return-Path: <tomasz.meresinski@comarch.pl>
X-Greylist: delayed 1310 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 09 Apr 2019 15:28:58 UTC
Received: from odzwierny0.comarch.com (odzwierny0.comarch.com [217.74.69.8])
	by mail.openembedded.org (Postfix) with ESMTP id D67D57D6C5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Apr 2019 15:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	authenticated as tomasz.meresinski@comarch.com
	by odzwierny0.comarch.com with esmtpsa (TLSv1:AES256-SHA:256)(ComArch
	ESMTP) id 1hDsL6-000PPZ-JZ; Tue, 09 Apr 2019 17:07:08 +0200
From: =?UTF-8?q?Tomasz=20Meresi=C5=84ski?= <tomasz.meresinski@comarch.pl>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Apr 2019 17:06:53 +0200
Message-Id: <20190409150653.5051-1-tomasz.meresinski@comarch.pl>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CA-Antivirus: Scanned by ComArch Antivirus on odzwierny0.comarch.com
X-CA-Is-Spam: No
Cc: =?UTF-8?q?Tomasz=20Meresi=C5=84ski?= <tomasz.meresinski@comarch.pl>
Subject: [PATCH] systemd: fix predictable network interface names in initrd
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
X-List-Received-Date: Tue, 09 Apr 2019 15:28:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

https://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfaceNames/
says, that udev is responsible for predictable network interface names,
so udev package is a better place for its configuration file.

Signed-off-by: Tomasz Meresiński <tomasz.meresinski@comarch.pl>
---
 meta/recipes-core/systemd/systemd_241.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_241.bb b/meta/recipes-core/systemd/systemd_241.bb
index bfbfc81330..e61e07e959 100644
--- a/meta/recipes-core/systemd/systemd_241.bb
+++ b/meta/recipes-core/systemd/systemd_241.bb
@@ -566,6 +566,7 @@ RPROVIDES_udev = "hotplug"
 RDEPENDS_udev-hwdb += "udev"
 
 FILES_udev += "${base_sbindir}/udevd \
+               ${rootlibexecdir}/systemd/network/99-default.link \
                ${rootlibexecdir}/systemd/systemd-udevd \
                ${rootlibexecdir}/udev/accelerometer \
                ${rootlibexecdir}/udev/ata_id \
-- 
2.17.1


