Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id AF2A778820
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jan 2018 17:29:03 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id f140so481336wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jan 2018 09:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=8wSD/bxKBpKPcmAe3USi2B5esM2OEcIxVog0enVomEQ=;
	b=gJqzJ0P/9hMBFkgJjq8SayZPK78LXJTlzcRvHMP1QmaVQk70PT60qQhBeBBc2o+ky9
	YawErK2k1BDEB9wnCMsIlTIZarMq7ZiRe1RgTnixint0khQVJurJniYfrNaX7ZD5UsZJ
	Hi298M7P8LK/uZkA1tVI6wCB+ukiD7mOvgTplyORUd1SjmaJbj5DcAkK3dYjJPSIbFla
	q16up6KVoVUMcnOLo6vUQkaPX5PPZM8waG3Mmdr1MszimpKv3prCpe/4Bm8iwBsgyjy5
	lnwT0WX2F+0c7aFAzYfvHGTTWrG11/QIXUnRBBv5r/ZvPLC1z9qqtpN93EKPELzc2tgy
	jIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=8wSD/bxKBpKPcmAe3USi2B5esM2OEcIxVog0enVomEQ=;
	b=EnahuaUlpSZjRKW4l36PLH2lxaJvqpEW6VGiWO6clcf+riwiDOFhpaMvIhgpi4brNf
	rcV3Tnp8epdLgF6zMtIMknoWxKzF3/t2bPLKK46RUvTOFri5lrWOdS7s3SNvqrIH0EDd
	nfAzBsOMAgrM9F2ZdARkrr2ejKDGwOlhyYjBTylByVtEq0gA6PE10GdcmS9P53CB5koy
	VaIPkWQGRivz+zKJo15aQWfTUpZxGJnLkMoChPC5sUSApLj6Xkc638gvMQjC0pke0nFw
	aeu6x5liMT/1fK2FA3l+NnchQTQaUUnnpWXdu0wcMVO7mEUo6uEBz1flJOsqTkEuu1r8
	uZgg==
X-Gm-Message-State: AKGB3mLFwh8QZH9B/tKNcizp8YqYw/20LtxJEVXEaF4nTd5NGrOrqBA0
	hYnXoSmQXmxFQjDO5FVSojf1IpKy
X-Google-Smtp-Source: ACJfBoucBe46JrJ3wOe0uc3hVIUxMMAsi5T+ltIXQjnCEYyMBVdrjQP4lvbCe2gLcvwjTgQK1X76ng==
X-Received: by 10.28.146.16 with SMTP id u16mr16168311wmd.124.1515605343891;
	Wed, 10 Jan 2018 09:29:03 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	r76sm14523561wmf.11.2018.01.10.09.29.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Jan 2018 09:29:03 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jan 2018 17:28:58 +0000
Message-Id: <20180110172858.22739-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180110172858.22739-1-ross.burton@intel.com>
References: <20180110172858.22739-1-ross.burton@intel.com>
Subject: [PATCH 2/2] gettext: rationalise optional dependencies
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
X-List-Received-Date: Wed, 10 Jan 2018 17:29:04 -0000

gettext has optional dependencies on libxml2, glib, libcroco and libunistring.
If they're not available then gettext will use internal copies, but it can also
use system libraries.

For gettext-native and nativesdk-gettext continue to use the internal copies to
reduce the dependencies, but for target use the system shared libraries.

Also gettext 0.19.7 onwards swapped expat for libxm2, so remove the build
dependency on expat.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/gettext/gettext_0.19.8.1.bb | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_0.19.8.1.bb b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
index c2059e608b1..97083c0da2d 100644
--- a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
@@ -8,7 +8,7 @@ SECTION = "libs"
 LICENSE = "GPLv3+ & LGPL-2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-DEPENDS = "gettext-native virtual/libiconv expat"
+DEPENDS = "gettext-native virtual/libiconv"
 DEPENDS_class-native = "gettext-minimal-native"
 PROVIDES = "virtual/libintl virtual/gettext"
 PROVIDES_class-native = "virtual/gettext-native"
@@ -22,8 +22,6 @@ SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
 SRC_URI[md5sum] = "97e034cf8ce5ba73a28ff6c3c0638092"
 SRC_URI[sha256sum] = "ff942af0e438ced4a8b0ea4b0b6e0d6d657157c5e2364de57baa279c1c125c43"
 
-PACKAGECONFIG[msgcat-curses] = "--with-libncurses-prefix=${STAGING_LIBDIR}/..,--disable-curses,ncurses,"
-
 inherit autotools texinfo
 
 EXTRA_OECONF += "--without-lispdir \
@@ -33,18 +31,24 @@ EXTRA_OECONF += "--without-lispdir \
                  --disable-native-java \
                  --disable-openmp \
                  --disable-acl \
-                 --with-included-glib \
                  --without-emacs \
                  --without-cvs \
                  --without-git \
-                 --with-included-libxml \
-                 --with-included-libcroco \
-                 --with-included-libunistring \
                 "
 EXTRA_OECONF_append_class-target = " \
                  --with-bisonlocaledir=${datadir}/locale \
 "
 
+PACKAGECONFIG ??= "croco glib libxml libunistring"
+PACKAGECONFIG_class-native = ""
+PACKAGECONFIG_class-nativesdk = ""
+
+PACKAGECONFIG[croco] = "--without-included-libcroco,--with-included-libcroco,libcroco"
+PACKAGECONFIG[glib] = "--without-included-glib,--with-included-glib,glib-2.0"
+PACKAGECONFIG[libxml] = "--without-included-libxml,--with-included-libxml,libxml2"
+PACKAGECONFIG[libunistring] = "--without-included-libunistring,--with-included-libunistring,libunistring"
+PACKAGECONFIG[msgcat-curses] = "--with-libncurses-prefix=${STAGING_LIBDIR}/..,--disable-curses,ncurses,"
+
 acpaths = '-I ${S}/gettext-runtime/m4 \
            -I ${S}/gettext-tools/m4'
 
-- 
2.11.0


