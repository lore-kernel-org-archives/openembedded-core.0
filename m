Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id E08E972B6A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 13:42:19 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id k14so25775727wgh.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 05:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=swvTtwLhtoalKGPgFLGZjyDhRQ0MqYn5BlKUiT2Z8z8=;
	b=DRoAY9Su7rn0NT6Yh4lK0dX4+mBfHHcg0sfJVxaIX7dbgrN40iwgcdLO0AFspiJBSy
	BCoeVdoDPXAmmkcAFDy7sx3ivmZ7vE/BVdSgnaR9qnnjrD6OSAK4Ly/Q7G53176pP0Ah
	Bk6Yq3ehKTE4OkugAJCULoYVdXeg+CkfdvgrhEYu2XJnjcO+p4mPauwzrMwtAmShV5RP
	5l21nQwYg21of+8yH/ugTqZNyAi6AUwzz0zkCJqJAUkUIBq0iCC3GHLRYMzE/pqF5Ram
	fHTwTNEZdbnMSqP+VzZbBwisDiw3EHjyA4O4rMVcjm4tlGKUw+hAV4YfgAOqG71DhtFR
	HOxA==
X-Received: by 10.180.83.164 with SMTP id r4mr56525624wiy.73.1424180540228;
	Tue, 17 Feb 2015 05:42:20 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	hj10sm14811934wjc.48.2015.02.17.05.42.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Feb 2015 05:42:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Feb 2015 14:42:18 +0100
Message-Id: <1424180538-21908-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.0
Subject: [PATCH] test-dependencies.sh: strip only .bb suffix
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
X-List-Received-Date: Tue, 17 Feb 2015 13:42:20 -0000

* we were stripping too much when stripping recipe name from line like this:
  ERROR: Task 12016 (/some/patch/something.dot.bar.bb, do_fetch) failed with exit code '1'
  where the recipe name contains dots and doesn't end with _<version>.bb

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/test-dependencies.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/test-dependencies.sh b/scripts/test-dependencies.sh
index 2bcc2ca..e01acbe 100755
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
-- 
2.3.0


