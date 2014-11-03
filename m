Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id A2F45706B3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 10:13:56 +0000 (UTC)
Received: by mail-la0-f49.google.com with SMTP id ge10so9277672lab.36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Nov 2014 02:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rYMz/6fKKBAWlCnkqDJfxPSc/IEyLCvooux7ZHRXKYE=;
	b=zU+wvgYW4DC+DtLwFbX2Jf2DQfddNDvCeJnU7doxRL4cWmUpQc19f7RZtcUnJjy9BK
	BUSydhXGW3FV2vTrXCwYGsqUn3+Jh+VPR4GzYdnFQ1giJVMJDIwcCP89bFXuV0tcWUdV
	8ZXNeC0TVXiUTP9qx0NZYb98J6oJPHdKnEWU/0D1UOv5zTzGAD2sr12Fgj674C+C0zXi
	cYx5obf6PZXZ0VMqxuOnstf6kQa1EwL31JmWwvTHYL0YFCUdqEON8QfnaThN2wK5TLk3
	KNTR/VDZV/kpQJNeVXXPZ7g/MtGVv6b9z08uQCAZQA5QaOrk6Oam6WHlLC2mR2CRY2q2
	qS2g==
X-Received: by 10.112.148.161 with SMTP id tt1mr50419284lbb.67.1415009637215; 
	Mon, 03 Nov 2014 02:13:57 -0800 (PST)
Received: from neopili.fritz.box
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by mx.google.com with ESMTPSA id l1sm2239300lbd.32.2014.11.03.02.13.55
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 03 Nov 2014 02:13:56 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org,
	poky@yoctoproject.org
Date: Mon,  3 Nov 2014 11:13:51 +0100
Message-Id: <1415009631-13851-3-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1415009631-13851-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1415009631-13851-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: [PATCH 2/2] apt: Add missing running depency debianutils
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
X-List-Received-Date: Mon, 03 Nov 2014 10:14:00 -0000

apt-file calls run-parts with options --list and --regex:

root@neopili:~/curro/qtec/qt5022/build-qt5022-cesium/build/tmp/work/bobcat_64-poky-linux/apt/0.9.9.4-r0/apt-0.9.9.4# grep run-parts cmdline/apt-key -rn
187:		for trusted in $(run-parts --list $TRUSTEDPARTS --regex '^.*\.gpg$'); do

busybox implementation of run-parts does not support --regex. And --list option is not enabled on yocto busybox configuration.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta/recipes-devtools/apt/apt_0.9.9.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/apt/apt_0.9.9.4.bb b/meta/recipes-devtools/apt/apt_0.9.9.4.bb
index 86ffe66..77cbff1 100644
--- a/meta/recipes-devtools/apt/apt_0.9.9.4.bb
+++ b/meta/recipes-devtools/apt/apt_0.9.9.4.bb
@@ -1,5 +1,5 @@
 DEPENDS = "curl db"
-RDEPENDS_${PN} = "dpkg bash"
+RDEPENDS_${PN} = "dpkg bash debianutils"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
 require apt.inc
 
-- 
2.1.1


