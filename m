Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2B8F672608
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 14:52:16 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id h11so12402228wiw.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 06:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=sdnprspB3QoD1mED6Ngwzkch1jHFO/2wHzOFMYponKc=;
	b=f74FsSgY2GqiF+G9gtp4fUcarqv7xfr7dwxRKumEdtGjeOQX3yWx2TiNCoGntmItjI
	LZ0KyfyE+E/e0vrp9T58TjzKxIHM1RROtw5HPiprc4jPc+9SgbvX0NlqghSogg4Ds3rF
	TR8nWUODiIqMpQHAYc8yahQnfRclJJF+AH81g7bTtnYllXefoYJDNxvqJZ+o/j+x/81F
	i7ArdIjiwumiImOjHpuY2nP0JxT8po/nfGi1oI+8yop151U1ircIUUiy+0FxtNU7ZSGG
	ePbBPcn1J/l4bpxM8pD6VnK7QoSJgi/8le2HJtM/n2Hyk46IkQjAgwkAzlroQ6tRqJJs
	Qikg==
X-Received: by 10.194.90.143 with SMTP id bw15mr8258284wjb.132.1422456737117; 
	Wed, 28 Jan 2015 06:52:17 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	mz10sm3129253wic.9.2015.01.28.06.52.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jan 2015 06:52:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Jan 2015 15:52:10 +0100
Message-Id: <395507e2bfe80bd5fcc1d81c3afee115b7babf4f.1422456689.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <cover.1422456689.git.Martin.Jansa@gmail.com>
References: <cover.1422456689.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1422456689.git.Martin.Jansa@gmail.com>
References: <cover.1422456689.git.Martin.Jansa@gmail.com>
Subject: [PATCHv4 3/4] recipes-qt: add x11 to required DISTRO_FEATURES
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
X-List-Received-Date: Wed, 28 Jan 2015 14:52:20 -0000

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


