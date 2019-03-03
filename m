Return-Path: <liu.ming50@gmail.com>
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
	[209.85.208.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0CE2A745BF
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Mar 2019 09:08:44 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id j89so1762735edb.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Mar 2019 01:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=/SGNK0rSWVjnnbqj64+sXS02FFNKBNo6tkNQpubFxE4=;
	b=o3o873GUlGCeC951S/oR/uhWSO2EIZP9djNe7JEzPpRo9SU2kiGrp/ty5bhe1EqkKl
	sm3cq4khdNu/qoizalDgZgRNa1htUS7Wh2BT6duevzNhU4dYOjHyPWeVoOZYqUW74FUd
	ByfbC3zuHbWqYONVD9A7npQh056isL0i/nAcHPtYRF/8ceNHtdhHAY27+pGwBJ2YkxDC
	/d99pNGFQOK/eE3hpNlftjSX0Qr5jhEf1eKC1IzAN/n7S8/Dd1V9nrecMdwxDdqmjAUY
	gpd164pN6ec4iEmIxEUEp/xIpfO1nZaLGrp+bCizHQjLdURj4n0TVm5SHsGpkW67wteM
	wI2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/SGNK0rSWVjnnbqj64+sXS02FFNKBNo6tkNQpubFxE4=;
	b=J8GJeqrOXnAaEpDeFxax0aeP6Oa9FspnAOZMC0L0wvED5bDELWUqUSr3TJgEFoIumR
	dqASqJSZmH/K6kCYuEfGolHZfyu5WVb2yEQu291fn5kQv9Lzn0ccUGg4TWkK5OOzUcR6
	0NW0+Nu5Nt7zvbfnfIIcQXDp9fiyAeDsp6wV4KVM2yh/aQ9SdAOPdx12NazWYcOn0fOO
	M44uvuVj+qNdRxMLaUVkhcvfl3TDOxQHw9NmeAwXIffj04GM/qX4xOMyULSW6Pi9NXXu
	i64RQPUj01uZaUdKaeXcVMcUCxw8pBsKB3wkcG8c5xMtZw08N8hSVNOMyRCa9Czv79U4
	M/iQ==
X-Gm-Message-State: APjAAAWdCcCPgDPWp/4lPiwv1EoBHcbqniRD9KgQqNM55n/N6W27DoV7
	J1mVoPj98j95GWu1CS10iJboLHuD+gU=
X-Google-Smtp-Source: APXvYqz8TY2Ba48pUq6+sjxnPCkUvBvX/FClB4taJRF8hh+UtexenYTBmXNUs9c183DOcLtQ0Xb4EA==
X-Received: by 2002:aa7:c50b:: with SMTP id o11mr11291550edq.14.1551604125179; 
	Sun, 03 Mar 2019 01:08:45 -0800 (PST)
Received: from peterliu-Precision-M4800.toradex.int
	(c-b09ee253.022-417-73746f13.bbcust.telenor.se. [83.226.158.176])
	by smtp.gmail.com with ESMTPSA id
	k26sm1069400edd.16.2019.03.03.01.08.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Mar 2019 01:08:44 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Mar 2019 10:08:41 +0100
Message-Id: <1551604121-5034-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: luka.pivk@toradex.com, stefan.agner@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] gdk-pixbuf: export XDG_DATA_DIRS in wrappers
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
X-List-Received-Date: Sun, 03 Mar 2019 09:08:45 -0000

From: Ming Liu <liu.ming50@gmail.com>

We need export XDG_DATA_DIRS to be ${STAGING_DATADIR} for gdk-pixbuf*
wrappers or else they will try to load mime from /usr/share/mime of the
host machine.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.0.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.0.bb
index 3a544bd..a5bd7c6 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.0.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.0.bb
@@ -112,19 +112,24 @@ do_install_append_class-native() {
 	find ${D}${libdir} -name "libpixbufloader-*.la" -exec rm \{\} \;
 
 	create_wrapper ${D}/${bindir}/gdk-pixbuf-csource \
+		XDG_DATA_DIRS=${STAGING_DATADIR} \
 		GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders.cache
 
 	create_wrapper ${D}/${bindir}/gdk-pixbuf-pixdata \
+		XDG_DATA_DIRS=${STAGING_DATADIR} \
 		GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders.cache
 
 	create_wrapper ${D}/${bindir}/gdk-pixbuf-print-mime-types \
+		XDG_DATA_DIRS=${STAGING_DATADIR} \
 		GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders.cache
 
 	create_wrapper ${D}/${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders \
+		XDG_DATA_DIRS=${STAGING_DATADIR} \
 		GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders.cache \
 		GDK_PIXBUF_MODULEDIR=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders
 
 	create_wrapper ${D}/${bindir}/gdk-pixbuf-query-loaders \
+		XDG_DATA_DIRS=${STAGING_DATADIR} \
 		GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders.cache \
 		GDK_PIXBUF_MODULEDIR=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders
 }
-- 
2.7.4


