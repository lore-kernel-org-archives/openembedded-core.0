Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4D9F278824
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jan 2018 17:29:01 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id i186so449305wmi.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jan 2018 09:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Y6E3IA0GqW01X0WsAXvvCRoohHUStesTgMGNOwUqsAI=;
	b=WOwIbtBBVxJt+4gGa+WPq0sHJI8VvzyUxhHB8r4ptWgfgyxCLrI+nucbX7ziZkcX10
	iKpUSYkbmCcRDzzeS8QCC2zDNtYA1i8hjtdYDHMs7RjunNHshFsY3HiAk0elZcua396W
	OwGtrtJhDBI/dWbnx+yglfNedqYVP0+hxH6clL9ClDpqUZUxPfrpclAY7DeU3haWVFEe
	1rBP+8qvc1aDWGWMoarqiEur4WaPRQuapIA+YL49tyu8KQmBhYhgtG690tYq0A5BnkBk
	A573yGnKAfm9/WlQ0h0MjZm4mH+JsjBK2PWBl6A5wDGry6TVFecftD2IXht7SUYsfwUH
	MZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Y6E3IA0GqW01X0WsAXvvCRoohHUStesTgMGNOwUqsAI=;
	b=nfjh0vnl3MsrSYPkBfpTatK2U9EL6D2MHjJPXx4X1LxIpfR+kd1g1ouQ09SMqsY58G
	djxAwO24zlYvwHAvz8JqFFoyvY3GyZ+zNgI3O5AC+ZN/4bHJajFbAnNBW3QTyyfDdDxY
	u6gfdMrBWV1qjZtS2nBsDWHoQzOltYrNIHBWQogXU1i5CvUx7ijx+8OYC2kaS/uDUnIN
	gyFX92bRw47vyb4WF27DOYPUXL9hMWFd2fwlYDnjQxfTWqsTy1XqC4mPpH+xTKRLYYVM
	3Pyqgsrs4Guwaj/qXDZo8rqnxbY4mr9qcqLgBrwl8ItZZN1XqU0yvqPmz8lRJ59ZfV6/
	HAyA==
X-Gm-Message-State: AKGB3mLBZcAilmfjYTCChAvYguQyt3gUuhD+/h7Ng8XfkJzeSwUYNvlq
	kpQOdcRU8JQWujhrOA600ryiPqAA
X-Google-Smtp-Source: ACJfBov1n3D+XaliG9Z+EsaR2BzxEX9660PWwPj0LmlP1Ti+/gyo8qhAZnYbMJA9qabzfPRSPEiUEg==
X-Received: by 10.28.249.12 with SMTP id x12mr13887452wmh.122.1515605342664;
	Wed, 10 Jan 2018 09:29:02 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	r76sm14523561wmf.11.2018.01.10.09.29.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Jan 2018 09:29:01 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jan 2018 17:28:57 +0000
Message-Id: <20180110172858.22739-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] glib-2.0: rationalise build dependencies
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
X-List-Received-Date: Wed, 10 Jan 2018 17:29:02 -0000

nativesdk-glib-2.0 doesn't build-depend on nativesdk-gettext, but all variations
need to depend on gettext-native as they need msgfmt (so gettext-minimal-native
isn't an option).

Also add virtual/libintl as glib explicitly needs this. Generally this is
provided by glibc but some platforms (such as MinGW) don't.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index cfeb48a5368..b374f6bb2e4 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "GLib is a general-purpose utility library, which provides many us
 HOMEPAGE = "https://developer.gnome.org/glib/"
 
 # pcre is under BSD;
-# docs/reference/COPYING is with a 'public domai'-like license!
+# docs/reference/COPYING is with a 'public domain'-like license!
 LICENSE = "LGPLv2.1+ & BSD & PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://glib/glib.h;beginline=4;endline=17;md5=b88abb7f3ad09607e71cb9d530155906 \
@@ -19,10 +19,13 @@ CVE_PRODUCT = "glib"
 
 BBCLASSEXTEND = "native nativesdk"
 
-DEPENDS = "virtual/libiconv libffi zlib glib-2.0-native"
-DEPENDS_append = " ${@bb.utils.contains('PTEST_ENABLED', '1', ' dbus', '', d)}"
-DEPENDS_class-native = "pkgconfig-native gettext-native libffi-native zlib-native"
-DEPENDS_class-nativesdk = "nativesdk-libtool nativesdk-gettext nativesdk-libffi nativesdk-zlib glib-2.0-native"
+DEPENDS = "glib-2.0-native \
+           gettext-native \
+           virtual/libintl \
+           virtual/libiconv \
+           libffi \
+           zlib \
+           ${@bb.utils.contains('PTEST_ENABLED', '1', 'dbus', '', d)}"
 
 PACKAGES += "${PN}-codegen ${PN}-utils"
 
-- 
2.11.0


