Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id D666376128
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 15:16:52 +0000 (UTC)
Received: by pdrg1 with SMTP id g1so77377784pdr.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 08:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=9f1H/0MfctVhGRxe0t5+a9eU5lxTR5nMfxWmjOvgfBw=;
	b=iLQuHUCsYctAoGA+LCQJ0YrAPCRW9m1MkJzaHXE/8i78T8y1fcsihbdxAmSgOPzP4h
	/nFcT3pY3eN4jtOdCLOXw5P6NnPIPzjYKwr9ZBXfjtuAPAM2qaVHivEj6lIpIaUzyCfB
	5EG1JAM8eOJyKQ4Z2ib/sUfsMqr1NJtW12rSiRISve2+9sgkcHSGXZjE/NBoQ/rkJ24I
	5hGvw6gwEFeNWqNEerrBFp4JopThTM9USInxPMM28J6R2raTmemJwIQrrlqBk3Wpmx+n
	tv++IFDuLSRM/l72qjDJ5n+eI7glBxl3DHqwEYBavX6WhI+/KioMPoAgXNEqLNN+2WFG
	iX4A==
X-Received: by 10.66.222.161 with SMTP id qn1mr41271751pac.66.1437232613453;
	Sat, 18 Jul 2015 08:16:53 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	t2sm14635591pbs.10.2015.07.18.08.16.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jul 2015 08:16:50 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 0746EFC12F9; Sat, 18 Jul 2015 08:16:36 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jul 2015 08:16:24 -0700
Message-Id: <27110dba5d34d3d3d8f553e833fdd74c8bde9b75.1437232180.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
Subject: [PATCH 17/25] test-dependencies.sh: strip only .bb suffix
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
X-List-Received-Date: Sat, 18 Jul 2015 15:16:53 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

* we were stripping too much when stripping recipe name from line like this:
  ERROR: Task 12016 (/some/patch/something.dot.bar.bb, do_fetch) failed with exit code '1'
  where the recipe name contains dots and doesn't end with _<version>.bb

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/test-dependencies.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/test-dependencies.sh b/scripts/test-dependencies.sh
index 2bcc2ca..0170947 100755
--- a/scripts/test-dependencies.sh
+++ b/scripts/test-dependencies.sh
@@ -141,7 +141,7 @@ build_all() {
   bitbake -k $targets 2>&1 | tee -a ${OUTPUT1}/complete.log
   RESULT+=${PIPESTATUS[0]}
   grep "ERROR: Task.*failed" ${OUTPUT1}/complete.log > ${OUTPUT1}/failed-tasks.log
-  cat ${OUTPUT1}/failed-tasks.log | sed 's@.*/@@g; s@_.*@@g; s@\..*@@g' | sort -u > ${OUTPUT1}/failed-recipes.log
+  cat ${OUTPUT1}/failed-tasks.log | sed 's@.*/@@g; s@_.*@@g; s@\.bb, .*@@g' | sort -u > ${OUTPUT1}/failed-recipes.log
 }
 
 build_every_recipe() {
@@ -178,7 +178,7 @@ build_every_recipe() {
       RESULT+=${RECIPE_RESULT}
       mv ${OUTPUTB}/${recipe}.log ${OUTPUTB}/failed/
       grep "ERROR: Task.*failed"  ${OUTPUTB}/failed/${recipe}.log | tee -a ${OUTPUTB}/failed-tasks.log
-      grep "ERROR: Task.*failed"  ${OUTPUTB}/failed/${recipe}.log | sed 's@.*/@@g; s@_.*@@g; s@\..*@@g' >> ${OUTPUTB}/failed-recipes.log
+      grep "ERROR: Task.*failed"  ${OUTPUTB}/failed/${recipe}.log | sed 's@.*/@@g; s@_.*@@g; s@\.bb, .*@@g' >> ${OUTPUTB}/failed-recipes.log
       # and append also ${recipe} in case the failed task was from some dependency
       echo ${recipe} >> ${OUTPUTB}/failed-recipes.log
     else
-- 
1.9.1


