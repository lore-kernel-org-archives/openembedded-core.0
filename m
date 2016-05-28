Return-Path: <rm.santos.caldas@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 007026FF5D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 May 2016 11:53:53 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id n129so7081616wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 May 2016 04:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=NYZq97388mZBOePZ8V08m0W0DQTgt1WSA5gT1Bma0Lg=;
	b=IIfSIorOT9bEbEfX7Nw1M609kW9Gjnw2jnhop5SnkA8AS1NApw01MSGyp8oraJTNMx
	zPg+j+9xiIwB3cQvNCRonM0mJ8z0sdM8JClPwamC6RXn7Cx4K151ARVWO11lyCe19jK/
	eXjgSUi/LMV85ViKs9cro6bfjfHvlMqerEa2+1tFkRz+p7oQwgwdB6HngE8zv5GIOu5I
	ikJIFtQJOU1pGf5CUNHs417OZKb3xhA5X0PgDfljvtr+xyig8yU5T/tQR1q1Z28Sn6Fk
	8cGhoZ/M7UqtiqX/MTmhIWbu5iCqVWJFAYCY97fRUEWBSUMGDTKUranwC4AtbhqewDrU
	7vew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NYZq97388mZBOePZ8V08m0W0DQTgt1WSA5gT1Bma0Lg=;
	b=lhNllhov5w+nDmzsi2GKQzrLgqleV8X3Ohyx72KWsgbTSTQKXQvdRxvwjKJq++Hi0z
	YuKsss4L8OOHZPzTcYiq/9D3O6BEJWinGGk85prrYJoMIIjDeUwKO0nrJeY3/4Y1swXw
	4tgUVosuS1TQUg4iHHrXNjDZ5SY4nROi9zo8siDU4qMsBlMp/VyDAidWpEs7SlZsmkoX
	6YdLpNFG85SjE6+nk6/Rmo6B0hQ4WTbd26LZfPEil4Us/ZwZEg4Jt7mrAGiCQBGSQn3p
	912PfozABzTd5tRFqj9R47J/gxRVCD+/RGkTsEgrb6qOYThghsrJBYfXYxgx1/84U+sL
	oWdw==
X-Gm-Message-State: ALyK8tKiE7nMOaNMvllPogTMHpQgkVH51K5guE365FUKIzwzqNsUwViSoLl5mYTgquPzLQ==
X-Received: by 10.28.6.205 with SMTP id 196mr2891699wmg.96.1464436434036;
	Sat, 28 May 2016 04:53:54 -0700 (PDT)
Received: from octopus.home (a89-152-77-183.cpe.netcabo.pt. [89.152.77.183])
	by smtp.gmail.com with ESMTPSA id
	jp2sm24002344wjc.16.2016.05.28.04.53.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 28 May 2016 04:53:53 -0700 (PDT)
From: Renato Caldas <rm.santos.caldas@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 May 2016 12:53:41 +0100
Message-Id: <20160528115341.4965-1-rm.santos.caldas@gmail.com>
X-Mailer: git-send-email 2.8.3
Subject: [PATCH] perl: reorder tar arguments in do_install_ptest()
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
X-List-Received-Date: Sat, 28 May 2016 11:53:56 -0000

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


