Return-Path: <ulfalizer@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8F4FD71979
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Oct 2016 02:47:51 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id p138so5777520wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 19:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XI+DYJL5QIvUthwYRk9HA3thr2IBvBjw6YcsTiy+8g8=;
	b=tdKFhY0G1JJcIj3j823Y3lbIKMqkOxyn38gtg7Duj4jHxNqE8G+s8zVg3LWG0W9Vmo
	bdZMaK27UyJS+Jr7LCm4JaMmw3ULAkdK2ZSMhbcAV1F7RdZ9PCw92OmbdDF5tWmabWxp
	oJVdWNFG9XGNM8TNOjmtW1T647l4nG5WoILjbjIXr25XsEoBqzIVkerSo2cZiNmeb48i
	ZIwTJ4IBC8qOWWrWyeIglz9LEBEbmjpljjsQd11nf8bBM78uNDKsV5+pqF1uybu6lmGd
	r4T2h5wYxSnjYoCubOc/EuOWSPLw9PzjXBUC+qiW1RU5cnu7KJvvHtup02XpIf32bs++
	406w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XI+DYJL5QIvUthwYRk9HA3thr2IBvBjw6YcsTiy+8g8=;
	b=afFUdLkbu9KIXYEjVJaVoOTodHw/odrtYzKROkRCQPD9bvfpE8Uyo8t2Srfz6pApcN
	MGBr4g57nyaccwWhOsxZTbiuhjlCWZ3VQWkEMVMEh2z+ZmBSa+75dNLCuJepzjc+CTrO
	Jdv93+ubtM8dHtMHZxfwNC/xEhHWxLw2EPrdhG4GGL5qNwgtemkwhcTiKlJT3WeWLqcO
	j5g9QtJflKJ3rE0FZHiTF3K2OOTYjpO6bwLTamiRD4GIyMpbOAWDWd6lZmx6nHeOX1Cs
	g7a9rvFDg7+7Zk/Y6Gj0e5VZZ5o0gtQmaLQAooqOBXOUwSehG2zI92AbtgdgyNIcZlGd
	loDQ==
X-Gm-Message-State: AA6/9RkWe8zexCfTxPquYJ8lz96BI7xbddq0RAl3Mjcx8ZjB5I/11307m0dJSd6j3WIMpA==
X-Received: by 10.194.135.206 with SMTP id pu14mr8980732wjb.143.1475290072722; 
	Fri, 30 Sep 2016 19:47:52 -0700 (PDT)
Received: from huvuddator.home ([2a02:810d:1f40:230:2959:ccb4:be01:bff7])
	by smtp.gmail.com with ESMTPSA id
	s6sm22424897wjm.25.2016.09.30.19.47.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Sep 2016 19:47:52 -0700 (PDT)
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Oct 2016 04:47:06 +0200
Message-Id: <1475290031-20568-18-git-send-email-ulfalizer@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
References: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
Subject: [PATCH 17/22] testsdk.bbclass: Use bb.fatal() instead of raising FuncFailed
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
X-List-Received-Date: Sat, 01 Oct 2016 02:47:52 -0000

This sets a good example and avoids unnecessarily contributing to
perceived complexity and cargo culting.

Motivating quote below:

< kergoth> the *original* intent was for the function/task to error via
           whatever appropriate means, bb.fatal, whatever, and
           funcfailed was what you'd catch if you were calling
           exec_func/exec_task. that is, it's what those functions
           raise, not what metadata functions should be raising
< kergoth> it didn't end up being used that way
< kergoth> but there's really never a reason to raise it yourself

FuncFailed.__init__ takes a 'name' argument rather than a 'msg'
argument, which also shows that the original purpose got lost.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 meta/classes/testsdk.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index 0b8716e..77c9203 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -44,7 +44,7 @@ def run_test_context(CTestContext, d, testdir, tcname, pn, *args):
                 msg += " (skipped=%d)" % skipped
             bb.plain(msg)
         else:
-            raise bb.build.FuncFailed("%s - FAILED - check the task log and the commands log" % pn )
+            bb.fatal("%s - FAILED - check the task log and the commands log" % pn)
 
 def testsdk_main(d):
     import os
-- 
2.7.4


