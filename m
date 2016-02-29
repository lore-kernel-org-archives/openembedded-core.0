Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 70A796E630
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 21:05:17 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id l68so7787004wml.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 13:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=ahnRYBqRzDGjsvREXDLHkUUK6u8fZbV4qaXUc9j25Gs=;
	b=SqkDrxTF5W+C/pggLLr7MTABatCW8OEyktm0MDDzj7hD5nJ6oH//Us2zh/rZYamcF8
	HBXdhWvx3HwUE4lKIknNZBT7eae8nFToOSgCclWBnT5jM7Pvt9UJvPqkIMG13SkLyXc2
	bKsWtphaeMJV77OGlnQ77SDT6KtE1nIFH/BjSzL65kgQfCa3UM6yuHhBiGANUCzXrCqg
	eBvhH5zRlMZbWbpawFzi5ykG1xoyCgY300Y+Kk+LMyPRvOXbv6giotA8UfdcLm7HoHs1
	VT0CTBEmfULxdtM6kOdvRZxYBD9v4P1ADWZugiBW0LCp3zo5oZ8cYjlZItplIVaD3kIL
	qVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ahnRYBqRzDGjsvREXDLHkUUK6u8fZbV4qaXUc9j25Gs=;
	b=Pien1eXKwn4vn9SFZWJMdZncmLh7GVdfzRhqBylBEArFU9vC4MaVyUjpsxEgD30d7+
	ExKJ2WL6DoHi2mzw6a0VQMi3Mq5g9Gu9MYilDy/g1TYGyhUHnSiF2++fepkERAcA/INJ
	2WZrndpeD9hTMplucyOfKUWcU1GxoT5osLZB4jHqwQPPzoVTZaNnmpiAfj0XpoINS3sf
	KUcFFikiwKHaZK51FURO7aUnn/JFXpp/aKfqPK1fV1pvieJEZ4b0WD3CtYFCJ0qWZhYw
	ZOlsVlGUXb7Ddt2KFjyGY/60NDAwT5HoUXcMWwMDn7bkqstJFvR+8ok+PDt4Nhp6dgY6
	9Pjg==
X-Gm-Message-State: AD7BkJLnL1PBL0FFaLlwx1mZYO/9D5wkw76gsPZG0sFSRCWWm0u6Z7SoJfAoaojAM1wavgHL
X-Received: by 10.194.71.70 with SMTP id s6mr16634860wju.1.1456779918343;
	Mon, 29 Feb 2016 13:05:18 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 3sm18200697wmp.14.2016.02.29.13.05.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 29 Feb 2016 13:05:17 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Feb 2016 21:05:13 +0000
Message-Id: <1456779913-3776-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] cracklib: fix Python packaging
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
X-List-Received-Date: Mon, 29 Feb 2016 21:05:19 -0000

Don't assume that we know precisely what Python files were installed as patching
automake can change what optimised forms get installed by matching *.py* in
FILES and not deleting *.pyo explictly.

Similarly, remove all forms of test_cracklib from the packages.

The python .la file is mostly redundant but if we're shipping it, put it in
-python where it belongs instead of -staticdev.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/cracklib/cracklib_2.9.5.bb | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-extended/cracklib/cracklib_2.9.5.bb b/meta/recipes-extended/cracklib/cracklib_2.9.5.bb
index 8c9063e..3bd3f93 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.9.5.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.9.5.bb
@@ -29,8 +29,7 @@ do_install_append_class-target() {
 
 do_install_append() {
 	src_dir="${D}${base_libdir}/${PYTHON_DIR}/site-packages"
-	rm -f $src_dir/*.pyo
-	rm -f $src_dir/test_cracklib.py
+	rm -f $src_dir/test_cracklib.py*
 
 	if [ "${base_libdir}" != "${libdir}" ] ; then
 	   # Move python files from ${base_libdir} to ${libdir} since used --libdir=${base_libdir}
@@ -42,9 +41,7 @@ do_install_append() {
 
 BBCLASSEXTEND = "native nativesdk"
 
-FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/cracklib.py \
-	${PYTHON_SITEPACKAGES_DIR}/_cracklib.so \
-    "
-FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/_cracklib.a \
-	${PYTHON_SITEPACKAGES_DIR}/_cracklib.la \
-    "
+FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/cracklib.py* \
+	${PYTHON_SITEPACKAGES_DIR}/_cracklib.*"
+
+FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/_cracklib.a"
-- 
2.7.0


