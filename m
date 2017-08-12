Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id ED89D78281
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Aug 2017 00:40:16 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id y43so3466986wrd.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 17:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=EqjXoDB2QEzrWa/qt/5T0wCGfYAD9OKsWAbHCoKTfSQ=;
	b=RIck8/RhhxVsodxUafdusWPd3PX+w0q9xRSYEHJ5TrMPj/lkQasCNPSY5AX5wyRr9T
	Ca/dlBEl+BD5wErDrNjH+ZbJPxwPrGwiSS4vUluD24XOkN13s8jeMys4ih8qN6JGqxH+
	2S79COw+bHz/NTOOX3cZoTpIYLHX4+0J2dBubOBhc5+9bCXP+9f6S2ZddfbuiSWrX+sM
	DmxngAgA0ecmrPrFbQo8IbznkVPsAHan4vi/ZTQWRuSI/Ag9P2UrlJtTb70u/IJi69oo
	4dcT8fR9RKrLF3IVvLOXBaZyy/AgAJzziKspJn6cifaeblBINpZgpL/duEq54vYPgxyB
	uKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EqjXoDB2QEzrWa/qt/5T0wCGfYAD9OKsWAbHCoKTfSQ=;
	b=IEEuuIIhG/E6RGHpriRR4uHJSKtyNMH0Z8lA85wH8D1BTXMpHeeCH4hfMdS1oOniad
	7HMVzoOHdyUgvRXql7FKGgfu8Kl78B6dslXh9FokAHYHVFCH5nb0PBLgYCIE2RCYhSLm
	ojs8QP9n03tb57vgW0wpSQKkmUP5ECC+4RBIva0sDbFqTqqkZKvSCtCpw7G9KbNtJYoB
	UTfp8uPW9ZQld1OxDnPrOrNIB8hXg+09GO259tm1UdXFLMYcJHe08f8rE1v2pLkpRw9M
	GeDzGXXH62iC7P4+o/UaErAo/j/mEnrU6xlr8sEIFmmjxZj37+sjN1PJD0SoH9zASryP
	ZGdA==
X-Gm-Message-State: AHYfb5hln1Jyzk8txgAgsmsRmo7b/6ENSLAWURsw1kVuiPKM8MdcVlTG
	sAbfkef9Pqbue1UA
X-Received: by 10.223.171.79 with SMTP id r15mr11435201wrc.57.1502498417496;
	Fri, 11 Aug 2017 17:40:17 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	e198sm220127wma.15.2017.08.11.17.40.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Aug 2017 17:40:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Aug 2017 02:41:41 +0200
Message-Id: <20170812004145.12654-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.0
Subject: [PATCH][morty 1/5] test-dependencies.sh: Strip also '\.bb: .*' before adding failed recipe to list of failed
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
X-List-Received-Date: Sat, 12 Aug 2017 00:40:17 -0000

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
index 00c50e0d6c..0b94de8608 100755
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
2.14.0


