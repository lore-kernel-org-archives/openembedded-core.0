Return-Path: <ulfalizer@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id AF8DC6FFC7
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Oct 2016 02:47:53 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id p138so5777579wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 19:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QYGo4fCybjDqlZ0qZtcYaLcSHs5DoBSKHrfTa2d3fRM=;
	b=iz4cDiM/Nc0LWnVt2LGnbU1NHpR3Wed8WjI6yk6Dov7OQIOQlj0jS1Bggi/I3NBJU3
	yQBXWtqCcHVvSLu/q6T1zirzkSl56wxtXd0XUa19CkHYA53ngfciHuhzmINwoZjFSC0U
	68FWAeaTECIA1XCo+dSBSH1sb9Hom678JhZPSuvme/4GoeN4vTpY0NHhfWWWCjn0Udu6
	+/QqaZlmrxkjGbso32/bGkIvcnPOpK9MlFsBLCws+BZIKcunP+ldNqY0mE0kgbJfduV2
	qtnMpSWi//OrpXnXg6mi8m0bh9rneZg/PeozvOilbKiX+GK7Kqa4kvS5woUiizHgtDP9
	ixvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QYGo4fCybjDqlZ0qZtcYaLcSHs5DoBSKHrfTa2d3fRM=;
	b=FRJAWX8kPoi6pRqhSo5Aj9EIprURH/LZXnhCyE4HpVejvLASr0I1fQ5HNeDvIjtX0t
	xFWP+OGOGRiCRmThMVOVAdUhR0Ir0L7Ou4iXysOFAkU+SBiT0ZxzmoRl887Yt4RMCrDc
	wBaP1/mLjH1E+J3EX7BcWfXRo1b51QYtQbervVEdT1pmIDFZHHwf+n+o+3wzNh+PnK54
	Id2K/nkRtJTxDpdrlz+h/hr1VrjvpzIHcBEwkLm/sTZsAPcIPlyTBb4WvRm8bGzPv/FS
	tcuuh9DDo6MtWR71LV29CelHmEMJda0ZMvbSFhSXpq8A45Mrr2VH4JmfnRzxJtegcFI9
	3Lqg==
X-Gm-Message-State: AA6/9RkGCx4kfYrl5hU9Nti3lraYwtVCAbVBDsQm96g3G0zECnm76A1XjIWOfVHf9imH2Q==
X-Received: by 10.194.52.3 with SMTP id p3mr9852677wjo.55.1475290075022;
	Fri, 30 Sep 2016 19:47:55 -0700 (PDT)
Received: from huvuddator.home ([2a02:810d:1f40:230:2959:ccb4:be01:bff7])
	by smtp.gmail.com with ESMTPSA id
	s6sm22424897wjm.25.2016.09.30.19.47.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Sep 2016 19:47:54 -0700 (PDT)
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Oct 2016 04:47:09 +0200
Message-Id: <1475290031-20568-21-git-send-email-ulfalizer@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
References: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
Subject: [PATCH 20/22] utility-tasks.bbclass: Use bb.fatal() instead of raising FuncFailed
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
X-List-Received-Date: Sat, 01 Oct 2016 02:47:54 -0000

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
 meta/classes/utility-tasks.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/utility-tasks.bbclass b/meta/classes/utility-tasks.bbclass
index 7bc584a..7ba56e2 100644
--- a/meta/classes/utility-tasks.bbclass
+++ b/meta/classes/utility-tasks.bbclass
@@ -47,7 +47,7 @@ python do_checkuri() {
         fetcher = bb.fetch2.Fetch(src_uri, d)
         fetcher.checkstatus()
     except bb.fetch2.BBFetchException as e:
-        raise bb.build.FuncFailed(e)
+        bb.fatal(str(e))
 }
 
 addtask checkuriall after do_checkuri
-- 
2.7.4


