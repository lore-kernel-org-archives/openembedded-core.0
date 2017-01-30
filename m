Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f50.google.com (mail-pg0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 8327F7321C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 07:43:56 +0000 (UTC)
Received: by mail-pg0-f50.google.com with SMTP id 3so40516319pgj.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jan 2017 23:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=jjrOMoFmJ3sFwb5HkKfiIEnWJt6XyDB5oAaFvtsQ7uA=;
	b=ZhfR4/Ztad6uJZtdCTUMPWj+Js0Pek+6jekoEH+LpTe9y+Ljxk9RnoanVSlBAisJog
	0LO4mD5dTluowN1TgN+PrP7vTMKAOr0CY5L9L5y+G3FaB57Y2wKF7DYvdeXIGbxQZZ1y
	DVM4Vzy2Gh6jrf7DvnW05sIP0ZPsLs6kTS51Z6tfgrHGDGdKGoY2QPUwAT8o2eKrATl0
	LsaoJCfFTnHvgBIBU5x8cYK0k04w01Fbx/g/NZ02QDICHU0LpL+57X5GMWpak8xsTtif
	Pc9sKyZzqyDYvNSGxBCDCMNRATqkM4XAzG3Dqi37w/u0mFr3EaDef9YCBm0JIMiO0yH3
	iSwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=jjrOMoFmJ3sFwb5HkKfiIEnWJt6XyDB5oAaFvtsQ7uA=;
	b=GY8wtQSg6OSINeuuWjKyT9xOPZFVtkiHiB/84U8CVTi/ku6kid1HWxkgCmD5CXNQew
	Nv59mkfUFNu7C/WOyDmi54DZyKHMYnwULIb1tFNuorttUTYk2Brr+pGiFXneJAvPi1AY
	KuNhYmaqMSkDQzyIZ96O8fdUzwXzUrp4qB+/X6LDjONBWpjv6VbnVHSg+dQ+/5zfKpWL
	hnlBI2KLFGaZscq3hKrv2N0FkdklhU6AuYxAbKrGtlq8+pIQDZkOnsRhB7yxhZyIsmYz
	bcbjWCmZlUs/hncWDHLiyKQ0zdw0gOd1n+y1zmmCzeX1E0gvaCdaJlFyxQWNIOUdpDMo
	WohQ==
X-Gm-Message-State: AIkVDXI2AHrHQ+sN9qH2U55OqPkWilO+jtjgtcfu92nrQ+I7BL1bV5y1yJNvo7HsLccg4w==
X-Received: by 10.99.108.74 with SMTP id h71mr22076280pgc.99.1485762236603;
	Sun, 29 Jan 2017 23:43:56 -0800 (PST)
Received: from [127.0.1.1] ([58.165.136.65]) by smtp.gmail.com with ESMTPSA id
	66sm29707538pgg.47.2017.01.29.23.43.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Jan 2017 23:43:55 -0800 (PST)
Date: Mon, 30 Jan 2017 17:43:51 +1000
Message-Id: <20170130074351.32016-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH] gettext_0.19.8.1.bb: Add 'gettext-libintl' package
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
X-List-Received-Date: Mon, 30 Jan 2017 07:43:56 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Whilst gettext is not the default provider of libintl for most libc
configurations it is possible for it to be the provider of libintl. In
the cases where it is provided it should be shipped in a separate
package so as to allow for it to be included without pulling in
additional gettext content/dependencies.

This change adds a package called 'gettext-libintl' which ships the
libintl shared objects (and is otherwise empty if libintl is not
provided). This allows for the library to be shipped without the
additional components included in the gettext-runtime package.

This package is prefixed with 'gettext-' to define the source of the
library due to the existence of multiple providers for libintl.

This change also makes the libintl*.so and .h packaged into the
gettext-runtime-dev package by default. Removing the need for a uclibc
override to handle packaging these files. Targets that don't intend to
distribute these files already remove them during the do_install stage
(e.g. musl).

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-core/gettext/gettext_0.19.8.1.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_0.19.8.1.bb b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
index 7b8c1e8eb4..2af7373209 100644
--- a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
@@ -66,6 +66,9 @@ PACKAGES =+ "libgettextlib libgettextsrc"
 FILES_libgettextlib = "${libdir}/libgettextlib-*.so*"
 FILES_libgettextsrc = "${libdir}/libgettextsrc-*.so*"
 
+PACKAGES =+ "gettext-libintl"
+FILES_gettext-libintl = "${libdir}/libintl*.so.*"
+
 PACKAGES =+ "gettext-runtime gettext-runtime-dev gettext-runtime-doc"
 
 FILES_${PN} += "${libdir}/${BPN}/*"
@@ -82,15 +85,12 @@ FILES_gettext-runtime = "${bindir}/gettext \
                          ${libdir}/libasprintf.so* \
                          ${libdir}/GNU.Gettext.dll \
                         "
-FILES_gettext-runtime_append_libc-uclibc = " ${libdir}/libintl.so.* \
-                                             ${libdir}/charset.alias \
-                                           "
+FILES_gettext-runtime_append_libc-uclibc = " ${libdir}/charset.alias"
 FILES_gettext-runtime-dev += "${libdir}/libasprintf.a \
                       ${includedir}/autosprintf.h \
+                      ${libdir}/libintl*.so \
+                      ${includedir}/libintl.h \
                      "
-FILES_gettext-runtime-dev_append_libc-uclibc = " ${libdir}/libintl.so \
-                                                 ${includedir}/libintl.h \
-                                               "
 FILES_gettext-runtime-doc = "${mandir}/man1/gettext.* \
                              ${mandir}/man1/ngettext.* \
                              ${mandir}/man1/envsubst.* \
-- 
2.11.0


