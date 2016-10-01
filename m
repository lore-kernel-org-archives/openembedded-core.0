Return-Path: <ulfalizer@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id D9D3371979
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Oct 2016 02:47:45 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id p138so5777356wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 19:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jo4pBOyHPFFWnu4ADcaVD/25DOFthlr36BR7q0jFCmI=;
	b=sAMj7v9ORaC44RHK7tukoDw/Fd112Yj8tToZnFzD13ELcoid4kSdjzv4ZSFNAzMWS0
	vu+4pMfNJ02hyLZrWGrcxtmYLOat48w4Xy5yGRa65B84jDB7Bfv1xumC0tyHS5f0UHHu
	IxIQ8NjYe6vVtg6D8aB7vB0w5B04ypb7w6HmM08yyvEy2pHSUPrbNMxYx3U+hhK4YIa0
	LtZJzv/BO+LmhTYqc2Q+wT8MEbVdPFxtNVbEjwvC3d9wuK6QSr1oDwkDpZJnDWjIEeVP
	Smpt9InfNRttyCm89zUVJO6gyfGsd35x0DERJMycQzZelknlWplEV0j8FjB8tKPa48zn
	g4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jo4pBOyHPFFWnu4ADcaVD/25DOFthlr36BR7q0jFCmI=;
	b=W89elrO/dEofBuxXPRK3oP7QIgRosmArAhFj8hrtKvm7FoMMfMcE/ec2IB+0c3oFom
	ij1empPCIwg9WQxBBajlrcXTI7GywE+sBpwnU1MEYNLdU3Ec1cyfdU7p4vUvWSpokUyQ
	v8ttjb1E362g010tDu168KT1lplHGRdz4ptsAVmvbtVvD+okGsDenrWAqdTdXhWCOybX
	KKRXu7Tfk3PYOHMhstkAPjfveko1WFbYrCq49I28ygw5OGPDHeX0ZocZE6DIwAsIkbcW
	dm/pGcXV3W6X0pS8+3u+eb5QOOmdiOdaVodBIBZbsHc4cknHVMAUhXnXiDZ6hsD9n8Qa
	8s5g==
X-Gm-Message-State: AA6/9RnRfjYrzWLAjSpCaj8G3DcSMjMawgJcwya1vDlTfcdw3YPUarDdKiS/4ezTHm2SYA==
X-Received: by 10.28.19.134 with SMTP id 128mr393393wmt.40.1475290066972;
	Fri, 30 Sep 2016 19:47:46 -0700 (PDT)
Received: from huvuddator.home ([2a02:810d:1f40:230:2959:ccb4:be01:bff7])
	by smtp.gmail.com with ESMTPSA id
	s6sm22424897wjm.25.2016.09.30.19.47.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Sep 2016 19:47:46 -0700 (PDT)
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Oct 2016 04:46:59 +0200
Message-Id: <1475290031-20568-11-git-send-email-ulfalizer@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
References: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
Subject: [PATCH 10/22] update-rc.d.bbclass: Use bb.fatal() instead of raising FuncFailed
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
X-List-Received-Date: Sat, 01 Oct 2016 02:47:46 -0000

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
 meta/classes/update-rc.d.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 82b8024..dfef2a2 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -57,9 +57,9 @@ fi
 def update_rc_after_parse(d):
     if d.getVar('INITSCRIPT_PACKAGES', False) == None:
         if d.getVar('INITSCRIPT_NAME', False) == None:
-            raise bb.build.FuncFailed("%s inherits update-rc.d but doesn't set INITSCRIPT_NAME" % d.getVar('FILE', False))
+            bb.fatal("%s inherits update-rc.d but doesn't set INITSCRIPT_NAME" % d.getVar('FILE', False))
         if d.getVar('INITSCRIPT_PARAMS', False) == None:
-            raise bb.build.FuncFailed("%s inherits update-rc.d but doesn't set INITSCRIPT_PARAMS" % d.getVar('FILE', False))
+            bb.fatal("%s inherits update-rc.d but doesn't set INITSCRIPT_PARAMS" % d.getVar('FILE', False))
 
 python __anonymous() {
     update_rc_after_parse(d)
-- 
2.7.4


