Return-Path: <martin.jansa@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1729671B04
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 15:32:00 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id v138so2239400qka.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 08:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=qPsIQuQixojIDxi4hPfDOolo/VR53Km4av7O/c911ME=;
	b=tHrb/HI+Qv2vvg2ymrJGlNQ83985MhuvtbFprD/EuhptBs1SbRgp5uoPDAouLjKDfr
	6az8n5ibfjl1jnGbWp4GRjTbwHsj7JQVvBNdQFc6ZSUw1Bqc1hAmew8u3kYIx2S5I2ff
	dpIzQPLBG78eBgQH1SZ8K5spEajk9KueJYkED7rwprTsEQPrS1eoXW/FYlLJGkBDE0bL
	NarsOUFQCGOBC5tqQYsPbdYh28s01u/z2kWYu0QbGcNEMAQCqtQTHv4PNBR66JHS/3VK
	ZWOGXiNiAv4H4yLrlIe4hWLCtBC3z/Lv5+kUlKNmBlluibrjjssYeFMwktzUgUMm4Mgq
	yQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qPsIQuQixojIDxi4hPfDOolo/VR53Km4av7O/c911ME=;
	b=mq3tlc98m4yQXvEFUshkP5Pgaf4Xzx3yqGWAdGzk9CDW+xHvNF1JONl0LYQBFq0akb
	JX/6S81+dE3B0vROtOUKOkvv/CImXymO8UQ42ICPQ1731JtqPzxtgs6smuBo4t0VPW8W
	y0ndM5Y1tBKAWsMN0apBkfpSeMo+tBeSxeVFdp3NbwZsEDjs4XjxeWFA3kwp6x7LQuwP
	6DZ6mGWG9VaOZ8r5PPwdb06tZ007KCT8/9eBrqMEH301dV98dWx63IV2jUznqWYSJPc3
	9IkEwNRQLbrgvpoMFpzeC5LQ/A5Vu+Ka+7shEWjwYNxtVRO7VT4sKRCq+YruhQ19G33g
	cyQA==
X-Gm-Message-State: AA6/9RkPOrO5iQwRKV6FK07pxJGvoFhJW9pRNMAoLtmbVlIeRAHal6GzP0hsKbCeTUgv/Q==
X-Received: by 10.194.59.18 with SMTP id v18mr4711124wjq.69.1476891122084;
	Wed, 19 Oct 2016 08:32:02 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id q8sm69745971wjj.7.2016.10.19.08.32.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Oct 2016 08:32:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Oct 2016 17:31:56 +0200
Message-Id: <20161019153157.17806-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.1
Subject: [PATCH 1/2] test-dependencies.sh: Strip also '\.bb: .*' before adding failed recipe to list of failed
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
X-List-Received-Date: Wed, 19 Oct 2016 15:32:01 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* format of bitbake tasks changed in:
  2c88afb   taskdata/runqueue: Rewrite without use of ID indirection

-ERROR: Task 4 (/OE/build/oe-core/openembedded-core/meta/recipes-devtools/rpm/sftp.bb, do_fetch) failed with exit code '1'
+ERROR: Task /OE/build/oe-core/openembedded-core/meta/recipes-devtools/rpm/sftp.bb:do_fetch (/OE/build/oe-core/openembedded-core/meta/recipes-devtools/rpm/sftp.bb:do_fetch) failed with exit code '1'

  so strip not only '\.bb, .*' used before, but also '\.bb:.*' to drop
  the task name to get recipe name.

* for more details see:
  http://lists.openembedded.org/pipermail/openembedded-core/2016-June/123132.html

* without this change you can see test-dependencies.sh trying to rebuild packages
  like:
  Building recipe: fbprogress (6/21)
  Building recipe: fbprogress.bb:do (7/21)
  where the later of course doesn't exist as a recipe

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/test-dependencies.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/test-dependencies.sh b/scripts/test-dependencies.sh
index 00c50e0..0b94de8 100755
--- a/scripts/test-dependencies.sh
+++ b/scripts/test-dependencies.sh
@@ -141,7 +141,7 @@ build_all() {
   bitbake -k $targets 2>&1 | tee -a ${OUTPUT1}/complete.log
   RESULT+=${PIPESTATUS[0]}
   grep "ERROR: Task.*failed" ${OUTPUT1}/complete.log > ${OUTPUT1}/failed-tasks.log
-  cat ${OUTPUT1}/failed-tasks.log | sed 's@.*/@@g; s@_.*@@g; s@\.bb, .*@@g; s@\.bb;.*@@g' | sort -u > ${OUTPUT1}/failed-recipes.log
+  cat ${OUTPUT1}/failed-tasks.log | sed 's@.*/@@g; s@_.*@@g; s@\.bb, .*@@g; s@\.bb:.*@@g' | sort -u > ${OUTPUT1}/failed-recipes.log
 }
 
 build_every_recipe() {
@@ -178,7 +178,7 @@ build_every_recipe() {
       RESULT+=${RECIPE_RESULT}
       mv ${OUTPUTB}/${recipe}.log ${OUTPUTB}/failed/
       grep "ERROR: Task.*failed"  ${OUTPUTB}/failed/${recipe}.log | tee -a ${OUTPUTB}/failed-tasks.log
-      grep "ERROR: Task.*failed"  ${OUTPUTB}/failed/${recipe}.log | sed 's@.*/@@g; s@_.*@@g; s@\.bb, .*@@g; s@\.bb;.*@@g' >> ${OUTPUTB}/failed-recipes.log
+      grep "ERROR: Task.*failed"  ${OUTPUTB}/failed/${recipe}.log | sed 's@.*/@@g; s@_.*@@g; s@\.bb, .*@@g; s@\.bb:.*@@g' >> ${OUTPUTB}/failed-recipes.log
       # and append also ${recipe} in case the failed task was from some dependency
       echo ${recipe} >> ${OUTPUTB}/failed-recipes.log
     else
-- 
2.10.1


