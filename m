Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 34E746013D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Mar 2015 08:54:18 +0000 (UTC)
Received: by wggy19 with SMTP id y19so600660wgg.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Mar 2015 00:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ZJsYg4y9LAyCVNk7LkXY649sopqk2270UBTmRMEXTEA=;
	b=v41W1f/IMOhpvRAIoy3NPiXUHPrHk3wq/gz4USprVcRSeQ5PSdVovCaPGcOCGqhrln
	YNTEYFjRQDMW+C4DAA3GrmFrJ6gUWAZ+t5Q5VowBY0NLEapzM/Yh0oPRp/WL+pp9KQgY
	yOyEbVGv4yTQh5yXBchbGSRZD0uOofTLn1hYWqAoXrEaookKOicoFFa3LJmYxLGhCloB
	cRc90d0Lapd7hp1MV7Sc4T0VpqdEMIl7MSmmtwktKo/ZtQbojwybj62u//vfLl/qXLUR
	TIMv/p186bPuxLb8zZhh7pHGFMzRUbHlkLIORwUrpec4wymJakZ+CsyPcBZTteYajaM5
	wd2g==
X-Received: by 10.194.86.135 with SMTP id p7mr37917755wjz.89.1425718459730;
	Sat, 07 Mar 2015 00:54:19 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m4sm5773543wik.20.2015.03.07.00.54.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 07 Mar 2015 00:54:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  7 Mar 2015 09:54:24 +0100
Message-Id: <1425718464-23707-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.1
Subject: [PATCH] test-dependencies.sh: strip only .bb suffix II
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
X-List-Received-Date: Sat, 07 Mar 2015 08:54:20 -0000

* we were stripping too much when stripping recipe name from line like this:
  ERROR: Task 12016 (/some/patch/something.dot.bar.bb, do_fetch) failed with exit code '1'
  where the recipe name contains dots and doesn't end with _<version>.bb
* apply the same fix as 8c9a25ae70d249b823ab2b0385d539eb8bbc1374 while
  building individual recipes

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/test-dependencies.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/test-dependencies.sh b/scripts/test-dependencies.sh
index e01acbe..0170947 100755
--- a/scripts/test-dependencies.sh
+++ b/scripts/test-dependencies.sh
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
2.3.1


