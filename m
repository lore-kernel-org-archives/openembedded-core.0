Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2456260402
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 16:17:52 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id q18so3140016wrx.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 08:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iJZViNm9eBweC9tsgPKikv0V3GeOo8gHZ6poD8V22Pg=;
	b=t5v0aE5sCcY2JKOPqilP8onKNFH/fVs2ZiT/EsU6ZjNBfHtk/c70bwwMonWNaJvH/u
	/wMkKCNpqpN2YEJh4eAcfk0cyIkMITYh6K43hDzftf9i950oPZ+YU8Uy8sM++9SLohmJ
	v+QYGhiddFTlQ+UOV72spbuVJqg1DLlWYHRuKtaEGCDBQo1PPkZppy3eALo+1or08V0J
	6Bp7hPWCy5KC03W/sezvfO73LAavTQbimmJ9RJZqpFziPrwnfix9HfahREMfT58n3CYm
	aAHudZuyS9GVEYUpNdmXYrf2icQgJVE2qSrSEqpdZS8VL5+WA/XSSUsQypX+JbarrVEl
	Vb4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=iJZViNm9eBweC9tsgPKikv0V3GeOo8gHZ6poD8V22Pg=;
	b=ZsU47FnCI+1R7gz2ISvAk2yckZZflNrONYt4kxlQwfKiXy2lR1/DhOyKPL820y/PCw
	o3LGnwfXPI+/Hy0ajsMXKDckZ75G9MO772dsJ3HOV3g8a0njmqiT0cVg/z2pJgt3slJK
	hRxnhF7rmpxro38NZdbb4DMYRZlr2DEASdoltSMcPr728QLwZnHxcL/kTZIuFhwSDXmS
	ReNN91+HiVshytt+xQ7JG4Vgfa9y9GTAvGx4UtDko9mKke5w8QnqgHpQGtWdQXn3bZUI
	xTcl94e+BDy13x3owswGVTMF7US2kD4IZvm+C3U2cqs55Yd9PzupmkQe2sls8GAG7/7z
	EX5Q==
X-Gm-Message-State: AJcUuke5q5EpW027OBxGW5DVULw79VyBdBMYAQ69QVMyHqCCHETr5Dkt
	xzIHgOg8wxqC086EHxRWmzWb8HbP
X-Google-Smtp-Source: ALg8bN5QMDBTTXA8SWZMflli6FA4Xp5Y2WIOMs8gqYivVeC8tR0RurtiAlaaRBmkR95XpKv2BU6ACQ==
X-Received: by 2002:adf:e3d0:: with SMTP id k16mr3601876wrm.223.1548260273393; 
	Wed, 23 Jan 2019 08:17:53 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	j33sm161192189wre.91.2019.01.23.08.17.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Jan 2019 08:17:52 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Jan 2019 17:17:36 +0100
Message-Id: <20190123161744.45763-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190123161744.45763-1-alex.kanavin@gmail.com>
References: <20190123161744.45763-1-alex.kanavin@gmail.com>
Subject: [PATCH 02/10] fontcache: fix postinst for nativesdk case
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
X-List-Received-Date: Wed, 23 Jan 2019 16:17:53 -0000

Both installing the binary into the correct place, and passing that place
to postinst_intercept were missing.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/fontcache.bbclass                        | 1 +
 meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/meta/classes/fontcache.bbclass b/meta/classes/fontcache.bbclass
index f71a754a4dd..13f9df1592f 100644
--- a/meta/classes/fontcache.bbclass
+++ b/meta/classes/fontcache.bbclass
@@ -20,6 +20,7 @@ if [ -n "$D" ] ; then
 	$INTERCEPT_DIR/postinst_intercept update_font_cache ${PKG} mlprefix=${MLPREFIX} binprefix=${MLPREFIX} \
 		'bindir="${bindir}"' \
 		'libdir="${libdir}"' \
+                'libexecdir="${libexecdir}"' \
 		'base_libdir="${base_libdir}"' \
 		'fontconfigcachedir="${FONTCONFIG_CACHE_DIR}"' \
 		'fontconfigcacheparams="${FONTCONFIG_CACHE_PARAMS}"' \
diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
index 6128d5e2ae2..311c6454a6e 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
@@ -41,6 +41,12 @@ do_install_append_class-target() {
     ln ${D}${bindir}/fc-cache ${D}${libexecdir}/${MLPREFIX}fc-cache
 }
 
+do_install_append_class-nativesdk() {
+    # duplicate fc-cache for postinstall script
+    mkdir -p ${D}${libexecdir}
+    ln ${D}${bindir}/fc-cache ${D}${libexecdir}/${MLPREFIX}fc-cache
+}
+
 PACKAGES =+ "fontconfig-utils"
 FILES_${PN} =+ "${datadir}/xml/*"
 FILES_fontconfig-utils = "${bindir}/* ${libexecdir}/*"
-- 
2.17.1


