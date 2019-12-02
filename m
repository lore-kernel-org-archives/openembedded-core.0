Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 66BB67EC47
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2019 17:55:08 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id j42so171315wrj.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Dec 2019 09:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6mEGgIuO4tATzb8O8e58qunAGWgYmxCvrbLOpHAUz0w=;
	b=r2fv4EIbR6Atjgu/AfKa2+M5gSCtYRBxwJS3ypqpZS4iO8VG9o2FBnk41lEIxC26XF
	J+7EbvGTHw/YoBeSWbZ2jVCY7+XJSHMYRcsvIeY0aVvEZ6CQBtJyLb1FslpWiCe6eK1+
	gO2F6wil0miZBJc7PwyUE4tj6rHJEu1iK2dtJsgm2+urH7PbtrgwSehLDji5nent3Xz2
	Y23irrNfnyACwp4L5vKMX2ckUv5ZhaXrcfMGwJ8U5tPifrXL7vmIPqYSIXyb0bYnD5oE
	Hqys3KLe1cPfaeHUdIOTrWd+tllkbvOOZck4JM9uWOJGIwQhHKloMWRG0MKM6ps1TZEY
	00ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6mEGgIuO4tATzb8O8e58qunAGWgYmxCvrbLOpHAUz0w=;
	b=MtpLg8lX/h/ThnwZP/NSW9r8E0YY+dHHenHw+IAg0vXgSr8Cqn9X5H8Pa29Us91K2X
	uXxsJnlVvWuLibjBrPZE9EzzXim3PoJqKlcIqPi/da/d3y7Ebxg0eSJ0pbWzzPCabHXs
	g6Xz4u2MZIKp6y8uU43oPaLY3i+6S2Gsy9yQX0h6Gzn4L9RkxPdaAf7+VA/T/s8/D06+
	29hSBmE26RGo+xSBBUp+NpD/ok0LLpcXYnNI0AK9JTz4hqlO5k/TrxmDBg0L5KaLUEE6
	OMK0/HeWzkBul5R/Ylgc1P28NvXOSJ6l37Zi1j/Xo6ZS2jr1V1Yn99P8yPRxZEbqGZqU
	aVKA==
X-Gm-Message-State: APjAAAWFV1IJGcVbwC4tu9vBCIvcgpcmn9bRBAcZLRY4e4cmLxpBBYMP
	+2DXjHzmKS067e3mqnKV7G/GdzuD
X-Google-Smtp-Source: APXvYqxRL9+ZNv/5Szb37treN6to2DfLPICUNH5W0HgPi2UsgfIy2gBQvrLv1RkTc1kwhPHh6QTnhQ==
X-Received: by 2002:a5d:6652:: with SMTP id f18mr149844wrw.246.1575309309153; 
	Mon, 02 Dec 2019 09:55:09 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id y8sm144069wru.59.2019.12.02.09.55.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Dec 2019 09:55:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Dec 2019 18:54:46 +0100
Message-Id: <20191202175459.112655-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191202175459.112655-1-alex.kanavin@gmail.com>
References: <20191202175459.112655-1-alex.kanavin@gmail.com>
Subject: [PATCH 05/18] p11-kit: convert to meson
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
X-List-Received-Date: Mon, 02 Dec 2019 17:55:09 -0000

Add libtasn-native dependency as meson builds need asn1Parser executable.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../p11-kit/p11-kit_0.23.18.1.bb              | 32 ++++---------------
 1 file changed, 7 insertions(+), 25 deletions(-)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.23.18.1.bb b/meta/recipes-support/p11-kit/p11-kit_0.23.18.1.bb
index 9193a06ea80..03c8158ae62 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.23.18.1.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.23.18.1.bb
@@ -2,38 +2,20 @@ SUMMARY = "Provides a way to load and enumerate PKCS#11 modules"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=02933887f609807fbb57aa4237d14a50"
 
-inherit autotools gettext pkgconfig gtk-doc
+inherit meson gettext pkgconfig gtk-doc
 
-DEPENDS = "libtasn1 libffi"
+DEPENDS = "libtasn1 libtasn1-native libffi"
+
+DEPENDS_append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
 SRC_URI = "git://github.com/p11-glue/p11-kit"
 SRCREV = "b0ebe7555c291808db29377ba79cb8326301f0a6"
 S = "${WORKDIR}/git"
 
-AUTOTOOLS_AUXDIR = "${S}/build/litter"
-
 PACKAGECONFIG ??= ""
-PACKAGECONFIG[trust-paths] = "--with-trust-paths=/etc/ssl/certs/ca-certificates.crt,--without-trust-paths,,ca-certificates"
-
-# This recipe does not use the standard gtk-doc m4 macros, and so the ./configure flags
-# that control gtk-doc build are non-standard
-EXTRA_OECONF_prepend_class-target = "${@bb.utils.contains('GTKDOC_ENABLED', 'True', '--enable-doc --enable-doc-html --disable-doc-pdf', \
-                                                                                    '--disable-doc', d)} "
-
-# When building native recipes, disable gtkdoc, as it is not necessary,
-# pulls in additional dependencies, and makes build times longer
-EXTRA_OECONF_prepend_class-native = "--disable-doc "
-EXTRA_OECONF_prepend_class-nativesdk = "--disable-doc "
-
-UNKNOWN_CONFIGURE_WHITELIST_append = " --enable-gtk-doc-html --disable-gtk-doc-pdf --enable-gtk-doc --disable-gtk-doc"
-
-# p11-kit relies on these two being copied from source tree
-# instead of being regenerated by gtkdoc-scan, but doesn't setup
-# dependencies correctly when there is a parallel build. Let's pre-copy
-# them instead.
-do_compile_prepend () {
-        cp ${S}/doc/manual/p11-kit-overrides.txt ${S}/doc/manual/p11-kit-sections.txt ${B}/doc/manual/
-}
+PACKAGECONFIG[trust-paths] = "-Dtrust_paths=/etc/ssl/certs/ca-certificates.crt,,,ca-certificates"
+
+GTKDOC_MESON_OPTION = 'gtk_doc'
 
 FILES_${PN} += " \
     ${libdir}/p11-kit-proxy.so \
-- 
2.17.1


