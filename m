Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6C7EA79DC6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Nov 2018 13:26:02 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a8-v6so1335207wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Nov 2018 06:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=sUJJDucG/MVwklKLZdaDgiGZUPnILGd6Q3hMq+0+ji0=;
	b=K/1hBOe8WOdsoV9FwJ+yGUwuXTppqNF3oKXDIK784+mq2vtYsXwLIzCzRDk9geGi8z
	z2JlW+XBUuuLQjhAknOC38Vy5CPqT7ZwH3F1eyHZxXYDcQj11IE16UKLn4KrLyjy13JZ
	eUi1rZN6EkqgdYkJ5p37LBuOBb+kEc9ValWoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=sUJJDucG/MVwklKLZdaDgiGZUPnILGd6Q3hMq+0+ji0=;
	b=ToWAp2AhpIg5nR4mWYOXlzfiOMlytlYImvo5njDarlMPV/bJF6UvjOjIT5kNCT2XQ8
	+pJvnxBz6N9RdCMnDBjR06ZieNudQhCZbRVuIN7zEbOfyYBnuVoFJ9OXVJVpcgMUslct
	wyKploJo/TFGRcpnCR+07qisgH6SY47IFP+7begwsUjQUd9oQjyRpqMUPEdszxsQmJkF
	SAt8y42WVMwjmn5LOK8laBl4sW4ODsUdm0bRrR7YpT/1REwIGcZHPwV1l62qk5NvlTot
	aZVjbG4DC8iZTngipk6ooxd5P2kUi6xmg2CtOUlysTqB/X1rBgRrmPuR+7b5q9KjLn2K
	xxkw==
X-Gm-Message-State: AGRZ1gKiaz86q7eYdigCKlyiIQb63+h04bXb+Ky75glgqfZyMmsv2Zj8
	FkWw24vKRcUxSm0AS/wujXIA4k/UPq8=
X-Google-Smtp-Source: AJdET5eAV5NRYODMsUqSgn/tZjWiwgSnCOtZHqlJriS9tLFBmQAQhzQuWJHLH0vjg/QtvNqiVjj3Hw==
X-Received: by 2002:a1c:e583:: with SMTP id
	c125-v6mr5883688wmh.134.1541078762425; 
	Thu, 01 Nov 2018 06:26:02 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c11-v6sm14431414wrw.94.2018.11.01.06.26.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Nov 2018 06:26:01 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Nov 2018 13:25:59 +0000
Message-Id: <20181101132600.10402-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] go: Change from TARGET_ARCH to TUNE_PKGARCH
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
X-List-Received-Date: Thu, 01 Nov 2018 13:26:02 -0000

Right now go-cross is changing signatures when you change TUNE for a given
architecture. In particular this breaks layer tests like:

yocto-check-layer ../meta-yocto-bsp/ --machines qemuarm beaglebone-yocto

This changes the PN addtion to something containing the tune rather than
the arch which avoids these kinds of errors. If go-cross can be tune
independent that would be nice but currently that isn't the case.

[YOCTO #12586]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/go.bbclass                 | 2 +-
 meta/recipes-devtools/go/go-cross.inc   | 4 ++--
 meta/recipes-devtools/go/go-runtime.inc | 2 +-
 meta/recipes-devtools/go/go-target.inc  | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 167d02e3fa3..af331f80188 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -8,7 +8,7 @@ GOROOT = "${STAGING_LIBDIR}/go"
 export GOROOT
 export GOROOT_FINAL = "${libdir}/go"
 
-DEPENDS_GOLANG_class-target = "virtual/${TARGET_PREFIX}go virtual/${TARGET_PREFIX}go-runtime"
+DEPENDS_GOLANG_class-target = "virtual/${TUNE_PKGARCH}-go virtual/${TARGET_PREFIX}go-runtime"
 DEPENDS_GOLANG_class-native = "go-native"
 DEPENDS_GOLANG_class-nativesdk = "virtual/${TARGET_PREFIX}go-crosssdk virtual/${TARGET_PREFIX}go-runtime"
 
diff --git a/meta/recipes-devtools/go/go-cross.inc b/meta/recipes-devtools/go/go-cross.inc
index 44f230b8bc8..6d9aa5c2ddd 100644
--- a/meta/recipes-devtools/go/go-cross.inc
+++ b/meta/recipes-devtools/go/go-cross.inc
@@ -1,9 +1,9 @@
 inherit cross
 
-PROVIDES = "virtual/${TARGET_PREFIX}go"
+PROVIDES = "virtual/${TUNE_PKGARCH}-go"
 DEPENDS = "go-native"
 
-PN = "go-cross-${TARGET_ARCH}"
+PN = "go-cross-${TUNE_PKGARCH}"
 
 export GOHOSTOS = "${BUILD_GOOS}"
 export GOHOSTARCH = "${BUILD_GOARCH}"
diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-devtools/go/go-runtime.inc
index 0041e8afab4..c219aa37893 100644
--- a/meta/recipes-devtools/go/go-runtime.inc
+++ b/meta/recipes-devtools/go/go-runtime.inc
@@ -1,4 +1,4 @@
-DEPENDS = "virtual/${TARGET_PREFIX}go go-native"
+DEPENDS = "virtual/${TUNE_PKGARCH}-go go-native"
 DEPENDS_class-nativesdk = "virtual/${TARGET_PREFIX}go-crosssdk"
 PROVIDES = "virtual/${TARGET_PREFIX}go-runtime"
 
diff --git a/meta/recipes-devtools/go/go-target.inc b/meta/recipes-devtools/go/go-target.inc
index 29a1344675e..c229ab2f8de 100644
--- a/meta/recipes-devtools/go/go-target.inc
+++ b/meta/recipes-devtools/go/go-target.inc
@@ -1,4 +1,4 @@
-DEPENDS = "virtual/${TARGET_PREFIX}go go-native"
+DEPENDS = "virtual/${TUNE_PKGARCH}-go go-native"
 DEPENDS_class-nativesdk = "virtual/${TARGET_PREFIX}go-crosssdk go-native"
 
 export GOHOSTOS = "${BUILD_GOOS}"
-- 
2.17.1


