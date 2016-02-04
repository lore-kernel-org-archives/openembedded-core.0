Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 900276FF5B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 16:32:59 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id g62so12654121wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Feb 2016 08:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=bDwJeyxpBWkGAWTFKIP0UFxkfZT0bEcMMsTvsbSPSQE=;
	b=W+fQhaJoyPYG3HUPjaXMwLGQBmEIB5X6ZruC6LSYvJdbvs82Yv9cA8s95cjWqNN6jS
	4IXEP0eOIPocyk/jvS3/D+u+bksTKO5mg396PP7Sz9nN0yoRXFHom1H1cffhabn/x6z4
	fjgRGRXtINBSCDUbWtmldtylAvAqo6H/E9gXWXMSqPQgxFg8KYtv+YFbImPG8wHAzdcC
	u3bwxE3l5MkPtB5+sZ9vaKlEREVB7h4oJEfYv2FzxRYRh+KTpcSZ0P3NxIJSm1psdGRs
	n6iPpr9JCHjicfg5bF7Aviturc/w2KHXXQrdPCuU0lNDwOHK6B8uH4viCss68uWLIIa/
	zMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=bDwJeyxpBWkGAWTFKIP0UFxkfZT0bEcMMsTvsbSPSQE=;
	b=CwlU7rudhxkjiKm/KY+SulgbIW7crKZ4efPMQeFfjGT6s3Swqf67et21sbyrv19vZl
	qxOheQsTfbKDdOEN2uDk/VV8gtzYbQzYF48doovoU8HgEqbecMbWXYtnarNY2p/uOy3O
	Vtr43AEmtYBYTBJn6j1QWH0YOpDpZ22OJz8gz1Xwb4HvFrZKHtcC7ic0I+AM7aMUgh6j
	Q4KnVNUMdeLWdhX/o8551SmICJwd07l4/hQZSc2ntQfOZBd2dY6Tlo5E6tP86SQtD2ul
	qVlaJWDq//4EXBHhM4QyRB/cv78YNLsc880ecLec6gggSNqn4qK8pomvnHpTZXe7VXJW
	xCsA==
X-Gm-Message-State: AG10YOSAilLj1RzfHygcA3YzSnfO3GJr1Po5Ko7cQboGPmkEdgU6X+42xhFrJlHPSD2t3Q8N
X-Received: by 10.195.12.45 with SMTP id en13mr8566074wjd.99.1454603580301;
	Thu, 04 Feb 2016 08:33:00 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	e77sm27016787wma.18.2016.02.04.08.32.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Feb 2016 08:32:59 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Feb 2016 16:32:57 +0000
Message-Id: <1454603577-27967-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] pango: unset LDFLAGS when building gen_all_unicode
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
X-List-Received-Date: Thu, 04 Feb 2016 16:33:03 -0000

When building the native gen_all_unicode binary we need to also unset LDFLAGS as
otherwise the *target* LDFLAGS will be used.  At best the options are harmless
but if there are options that the host compiler doesn't support then the compile
will fail.  For example, if the host gcc is version 4.8 but LDFLAGS contains
-fstack-protector-strong which in 4.9 onwards.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/pango/pango_1.38.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/pango/pango_1.38.1.bb b/meta/recipes-graphics/pango/pango_1.38.1.bb
index d408ef0..3e57dc2 100644
--- a/meta/recipes-graphics/pango/pango_1.38.1.bb
+++ b/meta/recipes-graphics/pango/pango_1.38.1.bb
@@ -35,7 +35,7 @@ LIBV = "1.8.0"
 # This binary needs to be compiled for the host architecture.  This isn't pretty!
 do_compile_prepend_class-target () {
 	if ${@base_contains('DISTRO_FEATURES', 'ptest', 'true', 'false', d)}; then
-		make CC="${BUILD_CC}" CFLAGS="" AM_CPPFLAGS="$(pkg-config-native --cflags glib-2.0)" gen_all_unicode_LDADD="$(pkg-config-native --libs glib-2.0)" -C ${B}/tests gen-all-unicode
+		make CC="${BUILD_CC}" CFLAGS="" LDFLAGS="" AM_CPPFLAGS="$(pkg-config-native --cflags glib-2.0)" gen_all_unicode_LDADD="$(pkg-config-native --libs glib-2.0)" -C ${B}/tests gen-all-unicode
 	fi
 }
 
-- 
2.7.0


