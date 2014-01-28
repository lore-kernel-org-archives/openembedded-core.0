Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id DF2FD6E897
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 17:44:08 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id x13so1403420wgg.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 09:44:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=bMs3UBPZ1qPec6LuaNwf5OERC+uRl4q55G2XVioqWEA=;
	b=QGYG1bNvd7Y2ulN0DEGKlc8Aj1JymHmb5L7BI3gDReSPQ6VVLzSNTiFh3O47mM3R8e
	8OwmaiLilcQhEFlR08EBwKns2gF5ADb+mt/9pQoh8CeTA5R4hUcSkayO7tMr4u541mi9
	JjwwteD5L/aafHomy2KHvbGPWT6v1CAojKf89yo3QuWLttSHsKpSw0i27h5BFulGRSOc
	ROx3QcWtrlnq5KcPdPap74lte3CjGVfC37e2zdJ0sO9Ll8E1gY7f23QODDiOw2161KoQ
	lmm0SIR/vR9Dv/r+Q7ejhiFvX0g8li92D6HrmofvfxOJCFl9kn+Aedq9Ms28bsBawc3d
	CHlA==
X-Gm-Message-State: ALoCoQnWvdeE1Pgh/RbYWBaNQUjGqZVr+klOhPK7VQQqCTtoxj9FyJilYKabZQNAdtse0GFGcBEo
X-Received: by 10.180.12.115 with SMTP id x19mr6734684wib.19.1390931049252;
	Tue, 28 Jan 2014 09:44:09 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id hq3sm34365291wjb.0.2014.01.28.09.44.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Jan 2014 09:44:07 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jan 2014 17:44:04 +0000
Message-Id: <1390931044-24421-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] pkgconfig: remove out-dated configure options and dependencies
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
X-List-Received-Date: Tue, 28 Jan 2014 17:44:10 -0000

0.27 onwards uses a snapshot of glib 2 not glib 1, so drop the
do_configure_prepend and update the internal/installed options as appropriate.

Legacy scripts were removed in 0.26.

Use of popt was removed in 0.28.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/pkgconfig/pkgconfig.inc |   12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig.inc b/meta/recipes-devtools/pkgconfig/pkgconfig.inc
index 3e655a9..62c886f 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig.inc
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig.inc
@@ -8,7 +8,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS = "glib-2.0 popt"
+DEPENDS = "glib-2.0"
 DEPENDS_class-native = ""
 DEPENDS_class-nativesdk = ""
 
@@ -18,15 +18,11 @@ S = "${WORKDIR}/pkg-config-${PV}/"
 
 inherit autotools
 
-EXTRA_OECONF = "--with-installed-glib --with-installed-popt --disable-legacy-scripts --with-internal-glib"
-EXTRA_OECONF_class-native = "--disable-legacy-scripts --with-internal-glib"
-EXTRA_OECONF_class-nativesdk = "--disable-legacy-scripts --with-internal-glib"
+EXTRA_OECONF = "--without-internal-glib"
+EXTRA_OECONF_class-native = "--with-internal-glib"
+EXTRA_OECONF_class-nativesdk = "--with-internal-glib"
 
 acpaths = "-I ."
-do_configure_prepend () {
-	mkdir --parents ${B}/glib-1.2.10
-	install -m 0644 ${WORKDIR}/glibconfig-sysdefs.h ${B}/glib-1.2.10/
-}
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
1.7.10.4


