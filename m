Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 17D7C77BBF
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Aug 2017 21:10:13 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id g13so3804868qta.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Aug 2017 14:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=8ZaxoTC2ZcCLQtVWhB1eN2EfsAAnP3Go7oiyBPOh1Y8=;
	b=Cg/+QDkpL/weyCVZSiMCNBVWPNaYZnYO5ipFICjUN2ILrhrIX6gK6Hk2VnhSCOE5To
	I1Qgcpdmnm6bHwB9/ZYRQQek2bz6rPf71o/MHXekucZtWpN6QQ6W9XTqdyqRyg97TF8X
	XnrA5Je1ryxxgO9Bp8lY0ofLgrUC70LxlH3wMiNPkUaZzXutGRn37Pk3LATwH+jFRkgH
	ZJVgW6vxO8DgtWAHiHA+3PtHZccKaJPyY1EJ1fcgpymyV579KkeY79LzqD79Scs2tCdX
	dWj6ASIocjSn3690kMkhC+ZDE62jV/IIaXlGq7h2DJp9alucK/7wRk7xivTZwjiJJVmE
	T2aQ==
X-Gm-Message-State: AHYfb5jHqrMg0spdO3cVI0AeGV0K0dFJoPiTtV8L1ZttABXXh4zEhN9A
	CUZevfMutRUPuaUC
X-Received: by 10.200.40.197 with SMTP id j5mr6756560qtj.100.1503868214837;
	Sun, 27 Aug 2017 14:10:14 -0700 (PDT)
Received: from localhost.localdomain ([181.220.72.143])
	by smtp.gmail.com with ESMTPSA id
	f56sm7901482qta.79.2017.08.27.14.10.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 27 Aug 2017 14:10:14 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Sun, 27 Aug 2017 18:10:06 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Aug 2017 18:10:05 -0300
Message-Id: <20170827211005.18090-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2] initramfs-framework: Change recipe to be allarch
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
X-List-Received-Date: Sun, 27 Aug 2017 21:10:14 -0000

There is no COMPATIBLE_HOST in the recipe neither it makes sense for
this to be machine specific.

Possibly, initramfs-framework's based modules may be machine specific
but if there is the case they can just RDEPENDS on
initramfs-framework-base and provide the specific module as another
recipe.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
- Add the new dependencies to the hash whitelist

 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 9d69a696f1..94bf1756e3 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -3,12 +3,10 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_base-utils}"
 
-PR = "r2"
+PR = "r3"
+
+inherit allarch
 
-# While the packages maybe an allarch due to it being a
-# simple script, reality is that it is Host specific based
-# on the COMPATIBLE_HOST below, which needs to take precedence
-#inherit allarch
 INHIBIT_DEFAULT_DEPS = "1"
 
 SRC_URI = "file://init \
-- 
2.14.1


