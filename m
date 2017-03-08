Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id F1E8360190
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 10:03:16 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id u108so3439002wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Mar 2017 02:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=vn204i63WB3sMluVV4EginCMMoz5J2EIF1AxAwr3wSQ=;
	b=aBBNPlYZQItYj0jWtMf93lmIB+z5BPDobUOfGt1og+WxXGagZmCr7HDzFpGN1AtZn1
	Q53dyBBevxO8Afsl/u4mxcHqkeB+XWzLYrNRUPmZ7gFVsj4zye68t9uauKaj5KjXO3QP
	oCKzYKPcxfNkLuU6UhbyLV4yW0Z4xFjiCGJJT5jz9lD0Mww2vo9eb2kusP8sIUXi8uHk
	w6xya9o5JJfG4/VUHD++bsgzmGhqJecPXb5TjceEWzifvzs+A5eIG0KBJdNzGhnKDc85
	3mugRttrkZEEBji9NZkeFw+iSmY6sowB09918GcVq89S3qRCNIFnrDPypQW9QnBthnz/
	+HLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vn204i63WB3sMluVV4EginCMMoz5J2EIF1AxAwr3wSQ=;
	b=ghhIxmNhDQT4szaOghm9gPHLU2kjH6tNfglnOyL0e3uG6hdjel3YdSWNavvGmJ8hod
	PbYnMm6NxRhTExBbHtRltfSIXOFmBwDJKx6UDIEM6B2zKBfVOChyr0qFsjCoAvTPXEHH
	RQ9YZcire95FFO36YZfAoQaXrGGlSi0YaHgxWDz10d3SeTf/HItiz7TeJ2xIkViwuJw1
	rL63yuJCGqoAqVVX5R7+rudsXqCAMy3b1RROjknSqWRzrffgDEiZJq17hG0G8COgnSKq
	if2cZM8caA2gbJF0OMYbwRxmlvDTto7o68i2dJSvinktm5ec6OONAARJvryPu91KTWsD
	DTGg==
X-Gm-Message-State: AMke39kwLBbWrI7OlK0wAdLdj6YLRz84EP9RI930thllAgTs7ow7+Ht2y+hFb+BcSmjh8g==
X-Received: by 10.223.172.135 with SMTP id o7mr4107441wrc.121.1488967397464;
	Wed, 08 Mar 2017 02:03:17 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	m201sm4035856wmd.19.2017.03.08.02.03.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Mar 2017 02:03:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Mar 2017 11:03:15 +0100
Message-Id: <20170308100315.16232-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.11.1
Subject: [PATCH] gcc-runtime: Fix QA issue
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
X-List-Received-Date: Wed, 08 Mar 2017 10:03:17 -0000

ERROR: gcc-runtime-6.3.0-r0 do_package: QA Issue: gcc-runtime: Files/directories were installed but not shipped in any package:
  /usr/lib/libmpxwrappers.la
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
gcc-runtime: 1 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index ec8f4a42d0..a5be491ad3 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -254,6 +254,7 @@ FILES_libmpx = "${libdir}/libmpx.so.* ${libdir}/libmpxwrappers.so.*"
 SUMMARY_libmpx = "Intel Memory Protection Extension library"
 FILES_libmpx-dev = "\
     ${libdir}/libmpxwrappers.so \
+    ${libdir}/libmpxwrappers.la \
     ${libdir}/libmpx.so \
     ${libdir}/libmpx.la \
     ${libdir}/libmpx.spec \
-- 
2.11.1


