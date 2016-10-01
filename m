Return-Path: <ulfalizer@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 364976FFC7
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Oct 2016 02:47:53 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id b201so593709wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 19:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cqdYkoI1kiJyJ6XE46lsbMwYZDmwm3sTE6gDH33ujz8=;
	b=Iesf1oPIRzH9j34FiuUM/2H5AtcjtavZg3VIZ4pRmigXUeejD368Ajdn/qyPVD3hnj
	HIlwF/nmvlut9rauGNy1AWt/FXP+wIZ2356cbZy9M2z8HEwaZLPci4MdvhPrPbHUHAHJ
	aFZ8QE4vyCY0eRMZzCuw3t04iNtbdULoPCzjaPxVedaEX/Ev7yQTx7YlaARLlKskquUc
	1V9VjAnN/3MSmJMpln7RA7DAd0k3DDj26rR4IROuN+otGU+fm+XtvhsLtpTT5k7muQF1
	xqY5YWln5FUSGjIfpDA6ld0eVGyJr2cDAoixwZjMBIVFFUNu4e7yPD+y1aqSG4sFfalH
	HxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cqdYkoI1kiJyJ6XE46lsbMwYZDmwm3sTE6gDH33ujz8=;
	b=CtMIADPwSFeUkkTpfq9gNW6e3CfKyLg8/BWNeF/1HKMxCel5krRKbNm/pXsiLDF3AF
	G1GXhRKweiQsnDyoqIS4jLX/qXrzM7j0vAPhwBkmhFtqZBBiZPVJ4b53Ld4JDrqR8m0f
	SZpWGHkgQBzmSGCHzhGicADFHsKrIARZSydtcew6p/JnJychMfq9XGUigzCDyVYvi+IX
	w4DGnRmEqgkblxCgR4wOwV54P87knU/cpu8tA9SX9oWTuFL/ljktSw2iRwq63Qy891Ga
	6Ceowbl5Gi+fh8LOdm7wlQS4nNWHIzBkmmo0Accg5oLCVrQ0ORmsK40u2uImmBx06cXJ
	uUew==
X-Gm-Message-State: AA6/9RnTsFDClianP7eggCwk38mGf1VCUwTnkNdrGtPBS5YYK+ALH4bbr1RD1J5ajqprnw==
X-Received: by 10.194.58.81 with SMTP id o17mr5586108wjq.227.1475290074315;
	Fri, 30 Sep 2016 19:47:54 -0700 (PDT)
Received: from huvuddator.home ([2a02:810d:1f40:230:2959:ccb4:be01:bff7])
	by smtp.gmail.com with ESMTPSA id
	s6sm22424897wjm.25.2016.09.30.19.47.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Sep 2016 19:47:53 -0700 (PDT)
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Oct 2016 04:47:08 +0200
Message-Id: <1475290031-20568-20-git-send-email-ulfalizer@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
References: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
Subject: [PATCH 19/22] package.bbclass: Use bb.fatal() instead of raising FuncFailed
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
X-List-Received-Date: Sat, 01 Oct 2016 02:47:53 -0000

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
 meta/classes/package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index a9ca141..a6f0a7a 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1171,7 +1171,7 @@ python populate_packages () {
                 continue
             ret = bb.utils.copyfile(file, fpath)
             if ret is False or ret == 0:
-                raise bb.build.FuncFailed("File population failed")
+                bb.fatal("File population failed")
 
         # Check if symlink paths exist
         for file in symlink_paths:
-- 
2.7.4


