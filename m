Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4BA7D60616
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 13:55:46 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id c65so2428561pfl.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Aug 2017 06:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4NDfw7jz20dK+niZ+P7z/586wYFEcJw0ZfQhPLj1weQ=;
	b=SV6Ruo9O5zCZmvBnXQgn3sc0qKyYN0TkWWKQHPz7kv05u8adBdxl6PBlYvY3oO1Zyn
	fpAbNC93Y1Eg55oYBDzt1J1Fr6r83ahrqwSnEqdRJky+lryoJhMEneH68Kcx6SiZkQcb
	94kqkU3JuClrCI9JpCaqD1tnbQwXBjYLFdjNrrraenQhdzklf8BTtLviMYFqwfoAQbwa
	X3432aBXsGt1negA8wTvLTWY3N4B7KOUP1BMPFaJNQr4KOI1G0eeFijJcFfz7eJy31On
	XxsyVOwjsuVBs4qOCW+ZNJqZn7C2AJ5bsui8jILYQfrhaUT/R0rKiNoJH0WOaV+XjrKA
	Uh0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4NDfw7jz20dK+niZ+P7z/586wYFEcJw0ZfQhPLj1weQ=;
	b=i1HJ+TnXKCvSGtNFomAwCgvQc1VqTD1Y8isLRoYVBhacvVmyG51t1mtvdkjDP3xAQx
	7z+3Pv4AJI8SmIiSL9vHCqUo9oIk0SLF58kjuJZu7TxOX59jt25GM2ly0NH+cc1Gh3bJ
	9ZLBbHFa+Lt1oE2bzfsqOGJ2b+ViUlQm76IS9v/4km5vGzugYjkeP+vXx+uKxYrF/VrC
	cc85ikckUW/iKbSHQIu3ef2rIuGqCdRbPDBuA8xK/8nFMoXbL4GxkyeXvZE2clGg3Unf
	kqY0NESA3hTXn4V6rHIzue6aViG/MZlGBsRnWeOb7mIku+Mkom228LX93y5AOlKznsiw
	xbiA==
X-Gm-Message-State: AIVw1102cSx82twaX2x4zwQ6qcQhB6puWROnJy28IDcrJGxtmu/AKRX+
	FYEGoqPXTg0QeTWZ
X-Received: by 10.99.97.68 with SMTP id v65mr19159604pgb.200.1501595748291;
	Tue, 01 Aug 2017 06:55:48 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::1f6f])
	by smtp.gmail.com with ESMTPSA id
	o29sm57189986pfa.60.2017.08.01.06.55.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Aug 2017 06:55:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Aug 2017 06:55:28 -0700
Message-Id: <20170801135530.33531-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170801135530.33531-1-raj.khem@gmail.com>
References: <20170801135530.33531-1-raj.khem@gmail.com>
Subject: [PATCH 2/4] mesa: Use chrpath to delete rpaths
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
X-List-Received-Date: Tue, 01 Aug 2017 13:55:47 -0000

It adds native sysroot chrpath due to llvm-config in cross compiling
we can delete them via chrpath, since libs are in standard paths rpath
is really not needed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index c9b67d4966..da449fa70b 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -14,8 +14,8 @@ LIC_FILES_CHKSUM = "file://docs/license.html;md5=725f991a1cc322aa7a0cd3a2016621c
 
 PE = "2"
 
-DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib"
-
+DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native"
+EXTRANATIVEPATH += "chrpath-native"
 PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl virtual/mesa"
 
 inherit autotools pkgconfig gettext distro_features_check
@@ -118,9 +118,10 @@ do_install_append () {
     rm -f ${D}${libdir}/egl/*.la
     rm -f ${D}${libdir}/gallium-pipe/*.la
     rm -f ${D}${libdir}/gbm/*.la
-    
+
     # it was packaged in libdricore9.1.3-1 and preventing upgrades when debian.bbclass was used 
     rm -f ${D}${sysconfdir}/drirc
+    chrpath --delete ${D}${libdir}/dri/*_dri.so
 }
 
 # For the packages that make up the OpenGL interfaces, inject variables so that
-- 
2.13.3


