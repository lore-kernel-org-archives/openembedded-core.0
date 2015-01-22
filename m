Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7708F72D26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 16:39:54 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id w62so2845001wes.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 08:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=sdnprspB3QoD1mED6Ngwzkch1jHFO/2wHzOFMYponKc=;
	b=yG0RAZeyk3rqDcBa8hcWOzTPLZiFAgu7usEzsa+ABzy41l5CciowcMKy8A3Ua2UWnt
	y/l/+GvlQfMkJG8vCf7hA0iYw0ZGTUQaIEFFxtK7eqaGKdpalCbONcUVEnVkngXtdcp3
	M0gttYMcCH+PXDbaO2K+ta/HuBTXg7F++/t0nSmVH6hh6bo/bMRvp7Sw93oSMwA+ywrs
	U5GFH71PVlk/Ml6PCoKGG/BCF+B3FPvPhzQJn6gXa3saIH2sX/kupNA48Hdak5DeSzNV
	iub38CX4RXMW3lFL74CghmNVYev2y0Do64KVLGHPSisSbELls0hhMYGlldMU43+pQfRR
	4n/Q==
X-Received: by 10.180.208.112 with SMTP id md16mr6645843wic.37.1421944794634; 
	Thu, 22 Jan 2015 08:39:54 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id v7sm3709209wib.5.2015.01.22.08.39.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Jan 2015 08:39:47 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Jan 2015 17:39:46 +0100
Message-Id: <f0b5b078e4d7ffcb0060d9d27f6b5847338feb58.1421944678.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <cover.1421944678.git.Martin.Jansa@gmail.com>
References: <cover.1421944678.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1421944678.git.Martin.Jansa@gmail.com>
References: <cover.1421944678.git.Martin.Jansa@gmail.com>
Subject: [PATCHv3 4/4] recipes-qt: add x11 to required DISTRO_FEATURES
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
X-List-Received-Date: Thu, 22 Jan 2015 16:39:56 -0000

* it's not complete, but recipes depending on virtual/libx11 are easiest
  to spot, I've long list of PNBLACKLIST for all recipes which cannot
  be built in distro without x11 in DISTRO_FEATURES

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/qt4x11.bbclass                                       | 5 ++++-
 meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.bb | 4 ++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes/qt4x11.bbclass b/meta/classes/qt4x11.bbclass
index b06e15d..6f06d34 100644
--- a/meta/classes/qt4x11.bbclass
+++ b/meta/classes/qt4x11.bbclass
@@ -1,7 +1,10 @@
 QT4DEPENDS ?= "qt4-x11 "
 DEPENDS_prepend = "${QT4DEPENDS}"
 
-inherit qmake2
+# depends on qt4-x11
+REQUIRED_DISTRO_FEATURES += "x11"
+
+inherit qmake2 distro_features_check
 
 QT_BASE_NAME = "qt4"
 QT_DIR_NAME = "qt4"
diff --git a/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.bb b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.bb
index 0e7c800..772c151 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.bb
+++ b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.bb
@@ -4,6 +4,10 @@ QTLIBPREFIX = ""
 
 require packagegroup-qt-toolchain-target.inc
 
+inherit distro_features_check
+# depends on qt4-x11-free
+REQUIRED_DISTRO_FEATURES = "x11"
+
 RDEPENDS_${PN} += " \
         qt4-x11-free-dev \
         ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'libqtopengl4-dev', '', d)} \
-- 
2.2.1


