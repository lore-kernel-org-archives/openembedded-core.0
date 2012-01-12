Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RlHB7-0007IP-T0
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 10:42:39 +0100
Received: by eaao13 with SMTP id o13so519540eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2012 01:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=5uHf2iYo3eiS6dQ6eo0VmNVEGKVWFQpLXQk6XuDKki8=;
	b=o8JxLA3FI8QHi34rFkjuJ4IFoPQTaZTxn1gBkmoNF0jlK99iuD3k4nRMwVe8R/6bnZ
	R0E5daizoL1welmFJfb1eDHmOukZxPnJHdqmT6Ox6qiMtV0nbV+XrVzWwkJEJ3QaIWzF
	gnJjx/1RyTUfV0DtYdvfBqvRS98H1uU7mQjg8=
Received: by 10.213.110.16 with SMTP id l16mr1378217ebp.133.1326360907032;
	Thu, 12 Jan 2012 01:35:07 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 15sm17366467eeu.1.2012.01.12.01.35.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jan 2012 01:35:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jan 2012 10:34:51 +0100
Message-Id: <1474b61c4f163d21b6ab7c639edee68f8e318696.1326360842.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.3
In-Reply-To: <ac5832462cb17b7664c233dc815d761633f38e5f.1326360842.git.Martin.Jansa@gmail.com>
References: <ac5832462cb17b7664c233dc815d761633f38e5f.1326360842.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1326360842.git.Martin.Jansa@gmail.com>
References: <cover.1326360842.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] xorg-*: disable xmlto where it was failing
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jan 2012 09:42:39 -0000

* meta-oe now provides xmlto-native
  http://git.openembedded.org/meta-openembedded/commit/?id=ab8f876ca8fa223c183e3db2029cce88f3435a27
  but not the stylesheets for buildhosts without them it's unusable and fails, because xorg macros
  autodetecting xmlto available, see:
  http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-December/037066.html
  after adding xmlto-native and stylesheets-native to DEPENDS we can enable it again

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc |    2 +-
 .../xorg-proto/xorg-proto-common.inc               |    2 +-
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
index d843d65..d106054 100644
--- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
+++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
@@ -13,4 +13,4 @@ S = "${WORKDIR}/${XORG_PN}-${PV}"
 
 inherit autotools pkgconfig
 
-EXTRA_OECONF = "--enable-malloc0returnsnull --with-fop=no"
+EXTRA_OECONF = "--enable-malloc0returnsnull --with-fop=no --without-xmlto"
diff --git a/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc b/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
index 765e30a..856f4d8 100644
--- a/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
+++ b/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
@@ -14,7 +14,7 @@ S = "${WORKDIR}/${XORG_PN}-${PV}"
 DEPENDS = "util-macros"
 
 inherit autotools pkgconfig
-EXTRA_OECONF = "--with-fop=no"
+EXTRA_OECONF = "--with-fop=no --without-xmlto"
 
 # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
 RDEPENDS_${PN}-dev = ""
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index b387790..ca7d33a 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -9,4 +9,5 @@ EXTRA_OECONF += "\
                  --enable-glx-tls \
                  --with-pic \
                  --with-int10=x86emu \
+                 --without-xmlto \
 "
-- 
1.7.8.3



