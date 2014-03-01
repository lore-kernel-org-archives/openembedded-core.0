Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id CCFF16F4C8
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Mar 2014 20:52:51 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id b10so2534446eae.41
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Mar 2014 12:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9b1M1bzhB7ZuuAeKIAZyP85wnu0j29Em6t47mOJsjio=;
	b=NnarN5UKsx2jHfjZT0cXkg1DK4w69g6HUv6i8MlPZ32ax2Hu4zPRa/ygavyw5gf8cB
	Gq72W4gCSjrBRaSnWYe0GQFTKPiIaXd/WrE6GKdpzb+HxPmEwhOTHCxCK1ftCXyOWvK+
	vNzKceMgexnVcUe+sh35CTXJnW6XyFrkwSOd7jPqJmy/19a2gNc30yIwCiFDcuwGS1VI
	GYElCgsZ70esUz0NcRX3Ro1Ejg9o76QCo32virOlJcWvJN/2HkQMSbr0W+AnXMfqIs+6
	HoDT8ME5tuUW+SZWG5Rzctl+33dkKaxy1+Z7WCElMk/ygNAVLK0Fy4N/0VxskJIg1eTW
	kv9g==
X-Received: by 10.14.9.134 with SMTP id 6mr29451453eet.70.1393707171657;
	Sat, 01 Mar 2014 12:52:51 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	43sm27933284eeh.13.2014.03.01.12.52.50 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Mar 2014 12:52:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Mar 2014 21:52:47 +0100
Message-Id: <1393707167-772-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <20140227233127.GF26981@jama>
References: <20140227233127.GF26981@jama>
Subject: [PATCH] pango: Fix postinst by adding missing qemu-native dependency
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
X-List-Received-Date: Sat, 01 Mar 2014 20:52:52 -0000

* postinst_prologue calls qemu_run_binary but there is no
  dependency on qemu-native which causes postinst to sometimes
  fail which is fatal for building read-only rootfs

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/pango/pango.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index 17006d3..4a20d20 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -10,7 +10,7 @@ SECTION = "libs"
 LICENSE = "LGPLv2.0+"
 
 X11DEPENDS = "virtual/libx11 libxft"
-DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv cairo harfbuzz"
+DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv cairo harfbuzz qemu-native"
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG[x11] = "--with-xft,--without-xft,${X11DEPENDS}"
-- 
1.9.0


