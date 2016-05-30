Return-Path: <rm.santos.caldas@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id A806E6FF7F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2016 21:47:13 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id n129so26505034wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2016 14:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=NYZq97388mZBOePZ8V08m0W0DQTgt1WSA5gT1Bma0Lg=;
	b=c+FqhHckGjGMX8G90fZ9oe8lq9glKK0HPvbS0EfPPHSndKVHq0inHfTVjwYbbxFVGR
	agztKeIUBoripJojt/jZshq/QAiE9isEVGwcObscSpgn9U5vji1o2UQ0gjJ7j3oqdcNZ
	uXxM67m+ZEnhmBBhAnbxjBWJuOzoPd+g0e+yteXGgGES8hg3XMyp0Kcoz9fCCJcOS3kD
	LaHWHx4X4ILi48QIQTXUXwYZEvRLXwRc9xm6QJkWg6ZUZD7ouY3hsvrCUyU/HGdcKQcc
	6AB4irYxFkjbUv4hq5QeKGR52CHuR9O1lC4hAzBe5pdTRvWswC3RreRe9kGrpBxrVbrV
	UALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NYZq97388mZBOePZ8V08m0W0DQTgt1WSA5gT1Bma0Lg=;
	b=OYlgfMaMmw5QFyHKHYXi1MfkC106kWHqStrFcqNMBHTx7WHWiKFB2axKR9GALnl+gF
	pnoQ6VO1vnMNCWNRMQRhOntWTZclNA8u+q1dz+2qTQkSUdkD6BuLQ0+o0l2KDFN3HDqI
	5E7ZF4Y/rKhoN7tFdm+5/sz34F2dL+S6TSyAtOdU5VgBP7/sKEVYFvDQ2cgShb0tynoi
	NcRMDya3IF0jtu7BZF1fTHufbqOGmjFSlxbVPd8UJQoL7x//9JiZuicp3QW/Po1RfnuO
	5u+NT3XcAiv0zfoNFKefzHCFucdQVccVgHQ3osVtrmbJSNHYUuE65OoZMNjDwvzcI9pR
	QZRg==
X-Gm-Message-State: ALyK8tKrukXR4uZCTZclq2HNJ0K4Qwj0WlPq/8K7XGR5MNHzqdOaAfrGHhOAUqkTfEJt/Q==
X-Received: by 10.28.167.205 with SMTP id q196mr12196700wme.8.1464644834213;
	Mon, 30 May 2016 14:47:14 -0700 (PDT)
Received: from octopus.home (a89-152-77-183.cpe.netcabo.pt. [89.152.77.183])
	by smtp.gmail.com with ESMTPSA id
	h2sm13791465wjv.15.2016.05.30.14.47.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 May 2016 14:47:13 -0700 (PDT)
From: Renato Caldas <rm.santos.caldas@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 May 2016 22:47:03 +0100
Message-Id: <20160530214703.4163-1-rm.santos.caldas@gmail.com>
X-Mailer: git-send-email 2.8.3
Cc: Armin Kuster <akuster@mvista.com>
Subject: [krogoth][PATCH] perl: reorder tar arguments in do_install_ptest()
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
X-List-Received-Date: Mon, 30 May 2016 21:47:13 -0000

On some distributions tar requires the FILE argument to be the last, and
the existing order was causing the subsequent --exclude options to be dropped.

Fixes [YOCTO #9673].

Signed-off-by: Renato Caldas <rm.santos.caldas@gmail.com>
---
 meta/recipes-devtools/perl/perl-ptest.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
index 948ea7c..66c5355 100644
--- a/meta/recipes-devtools/perl/perl-ptest.inc
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -7,8 +7,8 @@ do_install_ptest () {
 	mkdir -p ${D}${PTEST_PATH}
 	sed -e "s:\/opt:\/usr:" -i Porting/add-package.pl
 	sed -e "s:\/local\/gnu\/:\/:" -i hints/cxux.sh
-	tar -cf - * --exclude \*.o --exclude libperl.so --exclude Makefile --exclude makefile --exclude hostperl \
-		--exclude miniperl --exclude generate_uudmap --exclude patches | ( cd ${D}${PTEST_PATH} && tar -xf - )
+	tar -cf - --exclude \*.o --exclude libperl.so --exclude Makefile --exclude makefile --exclude hostperl \
+		--exclude miniperl --exclude generate_uudmap --exclude patches * | ( cd ${D}${PTEST_PATH} && tar -xf - )
 
 	sed -i -e "s,${D},,g" \
 	       -e "s,--sysroot=${STAGING_DIR_HOST},,g" \
-- 
2.8.3


