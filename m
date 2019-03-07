Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 583B27CEB9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 14:27:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44FXyQ2YNlz4v
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 15:27:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1551968830;
	bh=8ij313dhcb38vZ0/x/nfqI2Rl3qmEl4gsw1xGunJcl0=;
	h=From:To:Subject:Date:From;
	b=bLSS7sGBnZ3st8oj8Iuwvff9R2WMMB4RluXCiGbAS3KEFVhj3bwb6cl2j5ScuzrKS
	0Gfd4/TjVZpfznmkixLB9ybmoocsCnJemFUj2H43U0sa5dMYBiXl/jv0HxgYeJ6vbG
	8OyQi54vMhJ9UrouEr4KBWDvIr4Kp1170a6FZSFqWF8d1cNfF68+6EyqiTwufR1p0O
	BosEhSeBJJiIfg6XM8E2BAyHYoj9uybyhRoY2E4kdVKc9ZcuLgK1+uk0QGRySZBAe/
	L86J58fpCei4PtbgzB+nDwkaeuKjB4aHRMMux1VRxt/Feuv49LC4nqJXUVRZXRiKOH
	/DUJnAWVXxCIildP0PnRHr1Oq7ZeUp9BbQ7cBP4xtrfulRLWosg9x2XhCDhquPk+wM
	ryWvxlUDlxYErQ7mTzhKHi37rET0sLJN7Rjbd9YNWKOX1H413uoTG3mh2iStirZ20l
	wStWpj3jCPY7ALHY7BvKwunI1ii0XrOysAyKtV6z4+KJo5vN5hn7UuPnRIfcpQTmS9
	d2Q7iRauQoCh1nierFE6703AyvlElftYiLB/o0W6O7+ohO5snfTLpQbHmG/u+awuMq
	Ywu8NxNjd2JvT2uVw9M7GjgdAurWq6YI/56KTXd1gIPtbTRCMeoTf65tT0s5xvJOLQ
	UfQjDP6oibF0aTERlRR4VmLg=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Mar 2019 16:27:09 +0200
Message-Id: <20190307142709.12076-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [thud][PATCH] systemd: RDEPENDS on util-linux-umount
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
X-List-Received-Date: Thu, 07 Mar 2019 14:27:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

It looks like there is an implicit dependency on util-linux'
umount - as otherwise when using busybox' umount we see a
long delay on shutdown / reboot.

[YOCTO #13058]

(From OE-Core rev: 39a3d2c603429865af632fe41b2cf32c3dfdfb1d)

Signed-off-by: André Draszik <andre.draszik@jci.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-core/systemd/systemd_239.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index ed10f634b9..edda923a34 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -544,7 +544,7 @@ FILES_${PN} = " ${base_bindir}/* \
 
 FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
 
-RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV}) util-linux-agetty util-linux-fsck"
+RDEPENDS_${PN} += "kmod dbus util-linux-mount util-linux-umount udev (= ${EXTENDPKGV}) util-linux-agetty util-linux-fsck"
 RDEPENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', '', 'systemd-serialgetty', d)}"
 RDEPENDS_${PN} += "volatile-binds update-rc.d systemd-conf"
 
-- 
2.17.1


