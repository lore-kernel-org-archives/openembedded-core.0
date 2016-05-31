Return-Path: <rm.santos.caldas@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 666E6771C9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 10:51:44 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id q62so31415823wmg.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 03:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=NYZq97388mZBOePZ8V08m0W0DQTgt1WSA5gT1Bma0Lg=;
	b=ukSd6DhFNWwHDee/qEM6CB0vrFcD94kq40w8F+peo1meCAyFuDiCw8htwRYDr7NlMC
	mRlFKYFguHf6hw0wkbvKHyO/+GsZSO0tD5BathPUbGyY+AXXLLu0yMU1euF6fQ4xT5dP
	VW4jpCyRC1c/bRzvDuc5KOHg+U6OygCT+9DtTdjfSPitxdbOC/o25SpdHMvCeyZ8jX0O
	JlDiYIsC0r815xaaPQcgXA+s0W4ZI7AWgT6x8hmgV/JSPMyLKXJOuFI4F5WOAu90ri5+
	rCh5ky97tIqtqevK+sheLvrt0LVAhiasA355upD1eEQsJuG585h2Qyccr92uKgIOaRDp
	hHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NYZq97388mZBOePZ8V08m0W0DQTgt1WSA5gT1Bma0Lg=;
	b=PKXTJzmBO5kIayw1iGXPx04jFxroMlc/WmQ592C0YHPOuYtAPEIRvUXT5o6O5uuEtS
	+G8OSq1LrtoDWV0bTMQHNFu6oOTdvRdhXb0lSOsS6kDoz2YCSW2n3y4ApbsWO/HvYUdy
	1ixXOUNGTtHMbHxX0b8m98c7AkLOphErU3MXy6Pun1xsNNTqha1USngFoaZdDbeNp2Ik
	F0uwHrY4GOWa/RUZdsGk2J0SNURmd6lZr9Hy1Mk0rHQheTer6cAr8Xxx03zIGduxIvao
	sh3RpkISPz4GXCQoXJYn2FP+ljcKYJbRrw75+Q+oWmjdD3G30hdvC5F2bdwuiqrGhGif
	W6Mw==
X-Gm-Message-State: ALyK8tLqJIzVGx8oLyUwRES3NmKcqeTIJE/0hRiSmRiVxuG8yMQOLccBP+mG6RC6OrZxAw==
X-Received: by 10.28.169.66 with SMTP id s63mr15410667wme.29.1464691903851;
	Tue, 31 May 2016 03:51:43 -0700 (PDT)
Received: from octopus.home (a89-152-77-183.cpe.netcabo.pt. [89.152.77.183])
	by smtp.gmail.com with ESMTPSA id
	a128sm28758409wme.16.2016.05.31.03.51.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 May 2016 03:51:42 -0700 (PDT)
From: Renato Caldas <rm.santos.caldas@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2016 11:50:35 +0100
Message-Id: <20160531105035.7284-1-rm.santos.caldas@gmail.com>
X-Mailer: git-send-email 2.8.3
Subject: [jethro][PATCH] perl: reorder tar arguments in do_install_ptest()
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
X-List-Received-Date: Tue, 31 May 2016 10:51:46 -0000

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


