Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 788B971A9B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 14:16:20 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id f144so14235011pfa.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 06:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=nzBq700P9b2tlI12rGxeUxwGEeccwhuOkkfFXLZrh6w=;
	b=Pk4eFKzuaavWJPMHyxgjJq/b+wu6IqFxrcd3fmC9qTnCmvm6EZwfCQ5E6RTqgn+78b
	a5RhrIsak6+ZVBi0lJChCGJEZlZFzbLqf2ycj1YrbD4TnrOG4x0QQ3PvmLR8byEQHXCq
	svsncJVvj934Ez/CY+akiXQCWYOKPtKfSzERnA4Id8xNNTBezkQTx90R3fjX0kzO3y6J
	x/p5LG8ndeIbT0T44NR23Oby7oY0zV3meVbnaQIbQxkxhbJwA+25ezWBErz9/yv0787b
	3sn/sIS1/azuCTWfpt9hktj6WDadeXNtOjkMRa8+GeoRTpAvTjUzcVE0RzBvtzs4tq7S
	70dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=nzBq700P9b2tlI12rGxeUxwGEeccwhuOkkfFXLZrh6w=;
	b=l5yKYJgjM8CjTdhxownmu41XF3vbKL2bt6xxSLGUQRxv657l5S2fPJKRlqhvD/C2Pg
	FQXLn7rahsHD10VzkQM0B5kVyIfJoaQ1/ewEeUTmCyBMq9oeo/n1tIO1vEeYljchKVM2
	o/1m5wVYpZuhWzDrMW+sUR02y9Y2VAfUEpJVODEAb88wJJy8rN7A8VhC6VIZEVK+kEJY
	ZzeYqJArKJGCkjnlUerWnXrQT0tBmgwRnTgpbpGo89eGPoHs7CwuRNmFI5sUjGeQsRzB
	FmLwSKtH31COieU+CK66If1xtoqCt3QLZMQzSIjCvHcyC9JwFU1mZ6OrnceHlK/UzrBp
	RRLA==
X-Gm-Message-State: AIkVDXIzMtUjbb9UlmPWjpASTSHTcTLGxZc99ogxICVN2chMPkt1YA0w3TMEd7qQFrfGAQ==
X-Received: by 10.99.167.74 with SMTP id w10mr6815822pgo.2.1484576180347;
	Mon, 16 Jan 2017 06:16:20 -0800 (PST)
Received: from [127.0.1.1] (CPE-58-165-45-185.lns1.lon.bigpond.net.au.
	[58.165.45.185]) by smtp.gmail.com with ESMTPSA id
	a2sm48502888pgn.24.2017.01.16.06.16.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jan 2017 06:16:19 -0800 (PST)
Date: Tue, 17 Jan 2017 00:15:10 +1000
Message-Id: <20170116141510.3321-9-nathan@nathanrossi.com>
In-Reply-To: <20170116141510.3321-0-nathan@nathanrossi.com>
References: <20170116141510.3321-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 9/30] gettext_0.19.8.1.bb: Add 'gettext-libintl' package
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
X-List-Received-Date: Mon, 16 Jan 2017 14:16:20 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Add a package called 'gettext-libintl' which ships the libintl shared
objects (.so/.dll). This allows for the library to be shipped without
the additional components included in the gettext-runtime package.

This packages is prefixed with 'gettext-' to define the source of the
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
index 67173f247c..f43594686e 100644
--- a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
@@ -67,6 +67,9 @@ PACKAGES =+ "libgettextlib libgettextsrc"
 FILES_libgettextlib = "${libdir}/libgettextlib-*.so* ${bindir}/libgettextlib-*.dll"
 FILES_libgettextsrc = "${libdir}/libgettextsrc-*.so* ${bindir}/libgettextsrc-*.dll"
 
+PACKAGES =+ "gettext-libintl"
+FILES_gettext-libintl = "${libdir}/libintl*.so.* ${bindir}/libintl*.dll"
+
 PACKAGES =+ "gettext-runtime gettext-runtime-dev gettext-runtime-doc"
 
 FILES_${PN} += "${libdir}/${BPN}/*"
@@ -83,15 +86,12 @@ FILES_gettext-runtime = "${bindir}/gettext \
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


