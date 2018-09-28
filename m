Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 31D3874C97
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2018 13:45:44 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id y8-v6so6469922wrh.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2018 06:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=7B1/eHnybHgJUVsD0T1KQ4MUE1SbFJIJY1mkv6Tqo7Q=;
	b=dX/AJKPyAyfTsGw1cSxRWOwWPUOcZTKGnjEgD28aaJgjcTPjWl+au7xe+icjE6DrcQ
	PTLsNCOGdIGCxw/gsAQxr4FzWgYDjx5nHL9vMDYlErGqfqx2s/Fc79Y9sjUWWVNKgifL
	8Yqlpia/7BNFScsLPq+lGYCJJUgxZaAPlj3pfM3eZPK/zDcpGP7on1T7Gf7qFfGyKqUL
	iw4LenFl0D9KcFwJfQWaQ1ykCU/6+b/XSYKl/LukhNugF2RApoH7ipLmPMB/f1leBB1P
	iYLhklo9Er3q33UH4aHKkjk+y3c1MuL3fpTySMX0pgwb6z0SBeNbCW00j3RXgzu/8zXr
	RWSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=7B1/eHnybHgJUVsD0T1KQ4MUE1SbFJIJY1mkv6Tqo7Q=;
	b=QdBE2v0erA1QD/KtTbbfrzq0vfk/15SRxah07svLUIiPRa2mAmbmRX2b28a2xMYIwt
	lauuKLVbYcUZ6dPbupXtyvG4K3s3xIxqeRT8b0RoCGaHKsBy2KLfl4U2CYJ+CdifwrN0
	rXLfIPUEr8FwhWOpHeEotoqftxHcaqORfsj6ozJERfIvHuKpLLadYJUqELGpcOJQR8Ap
	fbJfRFEd1NUcsLcDAmOLD0QAUKpXwuNMQT2D+/0Pt6cDgljzaBoBWehIiTfspWn/Bbw1
	JgVOyPUHreR/j8UyC4oXMLnXAm4q8KG271M1Ni2V59w1sV7qZzKYmR/mvAxI/qOi8lSV
	okEw==
X-Gm-Message-State: ABuFfoikumIRcDg1+JY3JkyJFWJWmUgfeyJnR/16Ttaoi4lccWWGGU+I
	Rx/cr7jTl2SwvtK0d/MTWPlw+pdN304=
X-Google-Smtp-Source: ACcGV62dwDosBSyWBCWeTGhoK4Y7rAOp1Cou44NoZS5oQGJcbBseRMiKFLxbuFABxmJNvG/F9cMD0g==
X-Received: by 2002:adf:a708:: with SMTP id
	c8-v6mr12972964wrd.56.1538142345085; 
	Fri, 28 Sep 2018 06:45:45 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	b138-v6sm2016405wmb.1.2018.09.28.06.45.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Sep 2018 06:45:43 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Sep 2018 14:45:40 +0100
Message-Id: <20180928134541.1370-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] archiver: check tasks exist before adding dependencies
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
X-List-Received-Date: Fri, 28 Sep 2018 13:45:45 -0000

Some recipes don't have do_configure, or have them but are marked as noexec.
Check for their existance before hooking up dependencies.

[ YOCTO #12868 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/archiver.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 31c9b7eb4b6..7c3e701e704 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -98,9 +98,12 @@ python () {
 
         # There is a corner case with "gcc-source-${PV}" recipes, they don't have
         # the "do_configure" task, so we need to use "do_preconfigure"
-        if pn.startswith("gcc-source-"):
+        def hasTask(task):
+            return bool(d.getVarFlag(task, "task", False)) and not bool(d.getVarFlag(task, "noexec", False))
+
+        if hasTask("do_preconfigure"):
             d.appendVarFlag('do_ar_configured', 'depends', ' %s:do_preconfigure' % pn)
-        else:
+        elif hasTask("do_configure"):
             d.appendVarFlag('do_ar_configured', 'depends', ' %s:do_configure' % pn)
         d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_ar_configured' % pn)
 
-- 
2.11.0


