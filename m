Return-Path: <pevik@seznam.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84059ECAAA1
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 22:31:38 +0000 (UTC)
Received: from mxd1.seznam.cz (mxd1.seznam.cz [77.75.78.210])
 by mx.groups.io with SMTP id smtpd.web10.4579.1662157888421998451
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 15:31:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@seznam.cz header.s=beta header.b=TfA6PbGs;
 spf=pass (domain: seznam.cz, ip: 77.75.78.210, mailfrom: pevik@seznam.cz)
Received: from email.seznam.cz
	by email-smtpc10b.ko.seznam.cz (email-smtpc10b.ko.seznam.cz [10.53.14.45])
	id 584ccadaee6c7581584b74ad;
	Sat, 03 Sep 2022 00:31:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
	t=1662157884; bh=c3qA14aOYNuHUeogPmlxJ+dVaRF9nRSrp5OpfZaePfM=;
	h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	b=TfA6PbGsd1kZ0zS1ziMsCzfYn/fj5mlpOdKod4J4dLU6BKIyNQmlhtUTXp786QisM
	 b1ob8iaqkkq84b0CaPd7v+yeBFwXPuBuZjRTAfL6dA8hJ9VFW0pshYv+DhyfwXKOwZ
	 A5+xWElj9ND8QOvcST/FXdu+RsbiD0mEzf5eEhtg=
Received: from localhost.localdomain (mail.ms-free.net [185.147.46.46])
	by email-relay11.ko.seznam.cz (Seznam SMTPD 1.3.137) with ESMTP;
	Sat, 03 Sep 2022 00:31:20 +0200 (CEST)  
From: Petr Vorel <pevik@seznam.cz>
To: openembedded-core@lists.openembedded.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/1] ltp: Update list of tests not buildable on musl
Date: Sat,  3 Sep 2022 00:31:12 +0200
Message-Id: <20220902223112.972210-1-pevik@seznam.cz>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Sep 2022 22:31:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170261

From: Petr Vorel <petr.vorel@gmail.com>

These tests are working on musl, thus not deleted:

* getcontext01.c
fixed for musl during conversion to the new API in 20220527
(commit 0f519d0da)

* ebizzy-0.3
fixed in 20200930 (commit 967612c45)

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 meta/recipes-extended/ltp/ltp_20220527.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-extended/ltp/ltp_20220527.bb b/meta/recipes-extended/ltp/ltp_20220527.bb
index 00ff906ded..b657a6adb1 100644
--- a/meta/recipes-extended/ltp/ltp_20220527.bb
+++ b/meta/recipes-extended/ltp/ltp_20220527.bb
@@ -150,13 +150,11 @@ remove_broken_musl_sources() {
 	# sync with upstream
 	# https://github.com/linux-test-project/ltp/blob/master/ci/alpine.sh#L33
 	rm -rfv \
-		testcases/kernel/syscalls/confstr/confstr01.c \
 		testcases/kernel/syscalls/fmtmsg/fmtmsg01.c \
 		testcases/kernel/syscalls/getcontext/getcontext01.c \
 		testcases/kernel/syscalls/rt_tgsigqueueinfo/rt_tgsigqueueinfo01.c \
 		testcases/kernel/syscalls/timer_create/timer_create01.c \
-		testcases/kernel/syscalls/timer_create/timer_create03.c \
-		utils/benchmark/ebizzy-0.3
+		testcases/kernel/syscalls/timer_create/timer_create03.c
 }
 do_patch[postfuncs] += "remove_broken_musl_sources"
 
-- 
2.37.2


