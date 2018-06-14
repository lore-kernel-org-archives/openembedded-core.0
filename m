Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id E2C9C7537C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 12:27:27 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id n5-v6so11599988wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 05:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=WDGnzsvzjUrG14Te0EmcO6HvD6BimOGYhE93ql4EwDo=;
	b=n0MvqKSvBMrXoujw3ml6HGVILzVBH8Kx3q6zl6zX44NPLT57g5PGsxgYqN2JVtX8OH
	zYORT93Vuo3iUzG+FgsNLip7Lm5xguImarQyFyDNKOwVm3hPVQbAVHMJS8FJ2+qZIZbA
	xSIQYVAVOEwHH80A50gSwRoHECo1gKEB/boFvSiI3RlAl7kT41j6F2f8+8THvQ2Qvn+G
	1Tog3iFhXpU4aWa8/VW/pgV1/BSLVKxT65wqGyiWojVvYjMHVm81iDJZ+hUwo1iCbToo
	zgYTRUl4GAMV6Iqji02aCF/Xn07THTvuwOfJpPl3VOL4oaIb6ce9k/CJttbBRMO3GjwG
	UtWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=WDGnzsvzjUrG14Te0EmcO6HvD6BimOGYhE93ql4EwDo=;
	b=adN1Ads7Byy06Zm6im3dihxgwTpdBnGedn5KBxh1/ZuNjoZNZYmbK2QTOR+AMJ187h
	HCqMXhEHfHUSgjMOEBZsfFUwGTWolcCVyTQwSKbw451F1EJjpI0XovrzccaFIjhDgL1N
	Qs8ZUqll0MoPe4m83lX27GcIdT32WN5mh6LlYlFgoREwWbz1ZiWLcLKUrx2hDZiW5n+4
	3jtdPcJbux8Ixiu+2lmiMo6LN6AfZY8jX4E7bEkqBo30SM5wh2ATxcUIonFZPC/z7AbU
	a0eYwcHuTzsOLlvjL1NvZEKw2itvKQHmiLxM65uZjTjyurKmvBLxlb3gkswvUrYZhzm6
	jCNA==
X-Gm-Message-State: APt69E251c7A6XMRqe65Zidyn4cLyF1Nh6uJW89BW7+PfYNm8b7X8lUX
	kmDz5GycM6dJuQVtCcShdcIAjOR1
X-Google-Smtp-Source: ADUXVKJJ2f8pMjf6sWjU9UB4Jn0kFC73Fxzp4YhEBE6v0jf4tRPy4QZjJHbylqMDY/RGiILkSuJGMg==
X-Received: by 2002:a1c:4596:: with SMTP id
	l22-v6mr1770054wmi.33.1528979248370; 
	Thu, 14 Jun 2018 05:27:28 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	b80-v6sm7977699wmf.2.2018.06.14.05.27.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Jun 2018 05:27:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jun 2018 13:27:24 +0100
Message-Id: <20180614122724.12708-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] meson: class improvements
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
X-List-Received-Date: Thu, 14 Jun 2018 12:27:28 -0000

Ensure that the PACKAGECONFIG arguments are always in EXTRA_OEMESON, and log the
arguments that are being passed in do_configure.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/meson.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 2c7ce806584..78c5bf3c333 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -35,7 +35,7 @@ MESON_LINK_ARGS = "${MESON_TOOLCHAIN_ARGS} ${LDFLAGS}"
 MESON_HOST_ENDIAN = "bogus-endian"
 MESON_TARGET_ENDIAN = "bogus-endian"
 
-EXTRA_OEMESON += "${PACKAGECONFIG_CONFARGS}"
+EXTRA_OEMESON_append = " ${PACKAGECONFIG_CONFARGS}"
 
 MESON_CROSS_FILE = ""
 MESON_CROSS_FILE_class-target = "--cross-file ${WORKDIR}/meson.cross"
@@ -85,6 +85,7 @@ EOF
 CONFIGURE_FILES = "meson.build"
 
 meson_do_configure() {
+    bbnote Executing meson ${EXTRA_OEMESON}...
     if ! meson ${MESONOPTS} "${MESON_SOURCEPATH}" "${B}" ${MESON_CROSS_FILE} ${EXTRA_OEMESON}; then
         bbfatal_log meson failed
     fi
-- 
2.11.0


