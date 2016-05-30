Return-Path: <rm.santos.caldas@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 962C86FF7F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2016 21:46:13 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id n129so26497532wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2016 14:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=NYZq97388mZBOePZ8V08m0W0DQTgt1WSA5gT1Bma0Lg=;
	b=YFdBm8VuyzQXa92jCSGDIf7u1LdRy/Egxv4ehu8WbEeuFHvQ5K5ianbtkH8uZVxcdX
	Ko8Ys/CgddP55SJdrxIq4SvI53nZ9Uv2DWr11yXEsdjAD3lnJd4O4khJdM9OE0PGgeqH
	OHACbx4hEFYV26oAldlHlQacy/Pas6rpSmgTy+l1P1dgZp/Gpba8LNzFNvSBsABYoZqi
	xOLC2C2tPjRwtlTR4rvK9hZVlQWzqJ39oQ6QhmjsFSAhSclanJbziKOyIr/cjyT/mhDB
	j/293T/yRmM40I5Q0Jt6cDNREaWYYZMM+JZeYV8XMaPydGtJTgOx69AhV2E1znBhwnSR
	XEpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NYZq97388mZBOePZ8V08m0W0DQTgt1WSA5gT1Bma0Lg=;
	b=EK/B9F5g0Uqx6MSv+/06fODe9/6YDzP0ORY+9ag5CqxaLvjCDpveUfGaTSJiYbUz0m
	IrZSpqAkKfid9B+zCzxM37cckRNFEQhxGodx/CICnMRe5ZPUtQXr82/dEgsD8eizIsiK
	98WdN2NaBAAX5H4Pc84LqINsPg7PzybDClEkqh4m7DoDPtvNAKBzcoAsatlfDDTJmPK5
	1Cr9dY6KaJoReJ11/LTDskhsEyzEpOuqQOQxJPE5envcKfxXVYmSr/5d1pgTCUxi/9M5
	qEHTC7eDCxxZTHSuRv+rCC/SIqwF0sA9w8HYxsS9F203WuZFuHOMMsG3d1Cy2w/NtB+h
	6jIQ==
X-Gm-Message-State: ALyK8tICl27vIiIReh/diRE/i8fbCqD+cIJu5QluamAYtkvC+1iuRqdN/tMuRgBzO313zg==
X-Received: by 10.28.52.75 with SMTP id b72mr12736859wma.98.1464644773828;
	Mon, 30 May 2016 14:46:13 -0700 (PDT)
Received: from octopus.home (a89-152-77-183.cpe.netcabo.pt. [89.152.77.183])
	by smtp.gmail.com with ESMTPSA id
	n15sm36502414wjr.1.2016.05.30.14.46.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 May 2016 14:46:13 -0700 (PDT)
From: Renato Caldas <rm.santos.caldas@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 May 2016 22:45:49 +0100
Message-Id: <20160530214549.3766-1-rm.santos.caldas@gmail.com>
X-Mailer: git-send-email 2.8.3
Cc: Armin Kuster <akuster@mvista.com>
Subject: [master][PATCH] perl: reorder tar arguments in do_install_ptest()
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
X-List-Received-Date: Mon, 30 May 2016 21:46:18 -0000

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


