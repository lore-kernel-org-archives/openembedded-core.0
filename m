Return-Path: <paul@betafive.co.uk>
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
	[64.147.123.21])
	by mail.openembedded.org (Postfix) with ESMTP id 8DCC07F7DD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2019 13:00:52 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id B05E365B;
	Fri, 15 Nov 2019 08:00:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
	by compute1.internal (MEProxy); Fri, 15 Nov 2019 08:00:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm3; bh=KlxM1Dlsp0gGvPT22Y+pj195Q6
	QVAl3u69hssTMapmM=; b=YDJyFtybI4s3ikfFcAUqZ7dsA2r7svPlzFKQSWpoOu
	HbKUKmym7w8povEpq0gWr3q6tIUe3o2Dh27pKaY13IKo+fOtnEZo+vVqNbBo5hQf
	3z/BxaFiJBAASoOUy89elFSgScE87E3i91ND4H4p4UogxunRO0Q9vdX2p10Jxyh+
	bkS1Q/d6qrtZAKrQTgXBSfDEIouK8anUxR7N58mIvRQV/0eybY9PYt70zRA8axrN
	CMrbBF092Zg+C0BxJ//BhGv48qpJLEsDpzR54ji+eRNKi3+3CcJI/vg68SqkWJBW
	o2gERemgba/gYzvG+kC8B5EZ7xeenCJJ9Uy8R/ksWWJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=KlxM1Dlsp0gGvPT22
	Y+pj195Q6QVAl3u69hssTMapmM=; b=GpjWdyYQW9bgABoxryFcT3g0g8DXvyd2D
	ILH4ieU7gDJi46K2W/WlHieP1Fk1T7k1m8Qgc2G4KXdDnkit1Oubd9Kr41Qyf031
	k97xecL3MOweEyDyJqjTSuWjjjdSm9tNexlISRssZa1TIGkDPxXKgEvLTQyUnMFG
	s9gwNqEFJ5QulQDuhAfWDEYpL7otW8BdXiqG1NoJT8DpW8elPdZziUU0Nl66EVX4
	jrS0JXMMqeTVDe2zMVDFe8rFY7QS5+hKtZ00fKmFNdKvyxrrhfXP107UVHUIt2NH
	zYnbzTIkA3hXdKU9zmCfr+lRogeuYz2ttGei9cycamTz3bDdzB8sQ==
X-ME-Sender: <xms:hKHOXbcffhvCqrkyHfjJI-z28SnCOuPP5WDGSYdEF7yzN6_7dEt9dw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudefhedggeejucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
	dttdenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhessggvthgrfhhivhgv
	rdgtohdruhhkqeenucfkphepkedvrdegrddvtdejrdeivdenucfrrghrrghmpehmrghilh
	hfrhhomhepphgruhhlsegsvghtrghfihhvvgdrtghordhukhenucevlhhushhtvghrufhi
	iigvpedt
X-ME-Proxy: <xmx:hKHOXYdRtvhAhxoZw8TqMAsSxOknzmlTlCzCWxAySqKgL6DpB2fhtQ>
	<xmx:hKHOXdFi39ttlLbmaTMO6ixt4uBnNgHKlMg7-5d0eC1SJwZc1MuMQg>
	<xmx:hKHOXaV4BIm0ux9YwVpbD3jHCuJR0TkSeJA1MNMc5NUppAZ-tDBceg>
	<xmx:haHOXRLsGz0xy4MrRDccea0Smd4fUdfvsjSddA-YxYseckmjt4Dxpg>
Received: from arch-laptop.roaming.b5net.uk
	(cpc86219-nott20-2-0-cust829.12-2.cable.virginm.net [82.4.207.62])
	by mail.messagingengine.com (Postfix) with ESMTPA id 0CD3080059;
	Fri, 15 Nov 2019 08:00:51 -0500 (EST)
From: Paul Barker <paul@betafive.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Nov 2019 13:00:48 +0000
Message-Id: <20191115130048.47047-1-paul@betafive.co.uk>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH v2] cdrtools-native: Don't set uid/gid during install
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
X-List-Received-Date: Fri, 15 Nov 2019 13:00:52 -0000
Content-Transfer-Encoding: 8bit

This is a native recipe so won't be installed as root.

If the string 'root' is part of the username then the install script
can get tricked into thinking we are root (regardless of the actual
uid or permissions) resulting in attempts to run chown/chgrp
inappropriately.

Signed-off-by: Paul Barker <paul@betafive.co.uk>
---
 .../cdrtools/cdrtools-native_3.01.bb          |  5 +++-
 ...001-Don-t-set-uid-gid-during-install.patch | 27 +++++++++++++++++++
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/cdrtools/cdrtools/0001-Don-t-set-uid-gid-during-install.patch

diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
index 78e1565e47..1c602e7ce7 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
@@ -7,7 +7,10 @@ SECTION = "console/utils"
 LICENSE = "GPLv2 & CDDL-1.0 & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=32f68170be424c2cd64804337726b312"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/cdrtools/cdrtools-${REALPV}.tar.bz2"
+SRC_URI = " \
+	${SOURCEFORGE_MIRROR}/project/cdrtools/cdrtools-${REALPV}.tar.bz2 \
+	file://0001-Don-t-set-uid-gid-during-install.patch \
+	"
 UPSTREAM_VERSION_UNKNOWN = "1"
 
 SRC_URI[md5sum] = "7d45c5b7e1f78d85d1583b361aee6e8b"
diff --git a/meta/recipes-devtools/cdrtools/cdrtools/0001-Don-t-set-uid-gid-during-install.patch b/meta/recipes-devtools/cdrtools/cdrtools/0001-Don-t-set-uid-gid-during-install.patch
new file mode 100644
index 0000000000..9d38294b41
--- /dev/null
+++ b/meta/recipes-devtools/cdrtools/cdrtools/0001-Don-t-set-uid-gid-during-install.patch
@@ -0,0 +1,27 @@
+From 529cd5b007aa681c3ca14e5ab1e30469dd51646b Mon Sep 17 00:00:00 2001
+From: Paul Barker <paul@betafive.co.uk>
+Date: Tue, 12 Nov 2019 22:17:19 +0000
+Subject: [PATCH] Don't set uid/gid during install
+
+Signed-off-by: Paul Barker <paul@betafive.co.uk>
+Upstream-Status: Inappropriate [native]
+---
+ RULES/rules.prg | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/RULES/rules.prg b/RULES/rules.prg
+index 023555c..f70f1a7 100644
+--- a/RULES/rules.prg
++++ b/RULES/rules.prg
+@@ -94,7 +94,7 @@ INSGRP=		$(__DEFINSGRP:$(_UNIQ)%=%)
+ 
+ LD=		@echo "	==> LINKING   \"$@\""; ld
+ LOCALIZE=	@echo "	==> LOCALIZING \"$@\""; $(RM_F) $@; cp
+-INSTALL=	@echo "	==> INSTALLING \"$@\""; sh $(SRCROOT)/conf/install-sh -c -m $(INSMODEINS) -o $(INSUSR) -g $(INSGRP)
++INSTALL=	@echo "	==> INSTALLING \"$@\""; sh $(SRCROOT)/conf/install-sh -c -m $(INSMODEINS)
+ CHMOD=		@echo "	==> SETTING PERMISSIONS ON \"$@\""; chmod
+ CHOWN=		@echo "	==> SETTING OWNER ON \"$@\""; chown
+ CHGRP=		@echo "	==> SETTING GROUP ON \"$@\""; chgrp
+-- 
+2.24.0
+
-- 
2.24.0


