Return-Path: <kirgene@gmail.com>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id EC4F26D598
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 14:51:15 +0000 (UTC)
Received: by mail-la0-f50.google.com with SMTP id el20so442720lab.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 06:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=cWCVZUfM0pAPyQq/Tw6i0P6eP4iNqqxZ5r/jBwX1AiA=;
	b=Vi9w8Oxi2+w/bIiWdVYIx1V7Sak1Pep8t5cs10ABNa3DlyQUqk4Ssm6HdlnyM8NG8a
	6olKHVD2YqwN7pqGVYPpwKbRdUNtO9xhJHVk9xunx9D8NZUYkiG1OaphoIIZjhFSZeo1
	6FWDzeG0o1ZFNVK8YYr2N7naGQT1IIjBJ4dWABpvYsI3C3kRZgnE5lS+Lb6uLGPwSzy+
	AHoEdUJ0ScIK+ruUFja5JBiTVG1LiX2kS0GhghWKfG2auZuf//V1m41OtVwnbYj3/UgQ
	Hwh/gqeBKjImVHTbdlhu2qdvVyp/ormfiQIuHRlhdSoh04SSbPiH0GVd8pIJYQ7pHcnt
	YS5A==
X-Received: by 10.112.89.232 with SMTP id br8mr30776077lbb.20.1384354277051;
	Wed, 13 Nov 2013 06:51:17 -0800 (PST)
Received: from ubuntu.datv.net ([194.44.224.212])
	by mx.google.com with ESMTPSA id
	ed8sm24352466lbc.11.2013.11.13.06.51.15 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 13 Nov 2013 06:51:16 -0800 (PST)
From: Yevhen Kyriukha <kirgene@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2013 16:51:06 +0200
Message-Id: <1384354266-15425-1-git-send-email-kirgene@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Cc: Yevhen Kyriukha <kirgene@gmail.com>
Subject: [PATCH v2] curl: allow build with c-ares library support.
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
X-List-Received-Date: Wed, 13 Nov 2013 14:51:16 -0000

Also added c-ares library recipe.

In libcurl there is an issue with DNS lookups that cause crash on some platforms:
http://curl.haxx.se/mail/lib-2008-09/0197.html
To avoid this issue libcurl has to be built with c-ares name resolver.

Signed-off-by: Yevhen Kyriukha <kirgene@gmail.com>
---
 meta/recipes-support/c-ares/c-ares_1.10.0.bb | 24 ++++++++++++++++++++++++
 meta/recipes-support/curl/curl_7.33.0.bb     |  2 ++
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-support/c-ares/c-ares_1.10.0.bb

diff --git a/meta/recipes-support/c-ares/c-ares_1.10.0.bb b/meta/recipes-support/c-ares/c-ares_1.10.0.bb
new file mode 100644
index 0000000..23b3d0e
--- /dev/null
+++ b/meta/recipes-support/c-ares/c-ares_1.10.0.bb
@@ -0,0 +1,24 @@
+# Copyright (c) 2012-2013 LG Electronics, Inc.
+
+DESCRIPTION = "c-ares is a C library that resolves names asynchronously."
+HOMEPAGE = "http://daniel.haxx.se/projects/c-ares/"
+SECTION = "libs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://README;beginline=17;endline=18;md5=b320556568bc067d215a1e34c5b34a14"
+
+inherit autotools
+inherit pkgconfig
+
+SRC_URI = "http://c-ares.haxx.se/download/${BP}.tar.gz"
+SRC_URI[md5sum] = "1196067641411a75d3cbebe074fd36d8"
+SRC_URI[sha256sum] = "3d701674615d1158e56a59aaede7891f2dde3da0f46a6d3c684e0ae70f52d3db"
+
+EXTRA_OECONF = "--enable-shared"
+
+# install private headers to ares subdirectory
+do_install_append() {
+    install -d ${D}/${includedir}/ares
+    install -m 0644 ares*.h ${D}/${includedir}/ares/
+}
+
+FILES_${PN}-dev += "${includedir}/ares/*.h"
diff --git a/meta/recipes-support/curl/curl_7.33.0.bb b/meta/recipes-support/curl/curl_7.33.0.bb
index 8539fec..717c4f9 100644
--- a/meta/recipes-support/curl/curl_7.33.0.bb
+++ b/meta/recipes-support/curl/curl_7.33.0.bb
@@ -23,6 +23,8 @@ SRC_URI[sha256sum] = "0afde4cd949e2658eddc3cda675b19b165eea1af48ac5f3e1ec1607922
 
 inherit autotools pkgconfig binconfig
 
+PACKAGECONFIG[c-ares] = "--enable-ares,--disable-ares,c-ares"
+
 EXTRA_OECONF = "--with-zlib=${STAGING_LIBDIR}/../ \
                 --without-libssh2 \
                 --with-random=/dev/urandom \
-- 
1.8.1.2


