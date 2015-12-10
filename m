Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 585CF6AC37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:29:02 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id w144so23876947wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 05:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=cCeychDnLSSKCKMudDD2i/Yp4AQuTnksTDjqq3L9Zb0=;
	b=vOwSWVVbG5sZQmrM36RfjEkP+X2sOd+KkN1hFNVqTB9UNoXKxeZ+3I+WrvEfyPYk6S
	S0Pne2sC0Cn7IXR3pmItdezvLE53DRTmR2pDauVUdgvx9e3JssjT6S8YwWWmCOYtClfH
	9biI1K4mFcYuCKyhxBh2Q2+o22Vgdw9jr6EEcd9dkYQbSa4XIQqZsRa+hEAc8Nsao5ut
	E6cc8PoQO4dEch10eUBikL35CP/Wfz8AyQSvPTSvLSadFEqolmdafEWNiSIojiW86tNh
	wqDsk7PyFkrCjFYCnfl7AqKZMMwqrFKlHy0r6K+ShHJr5gs0VRwlXY3NXmKQ6/kYdlwm
	5+Ew==
X-Received: by 10.28.104.132 with SMTP id d126mr17180474wmc.30.1449754142019; 
	Thu, 10 Dec 2015 05:29:02 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id l20sm846477wmd.20.2015.12.10.05.29.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 05:29:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 14:30:43 +0100
Message-Id: <1449754243-28053-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
Subject: [PATCH] scripts/create-pull-request: fix git request-pull syntax
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
X-List-Received-Date: Thu, 10 Dec 2015 13:29:04 -0000

* at least with git 2.6.3 I see git request-pull failing
  when there is only :{BRANCH} as ending commit

* $ git request-pull origin/dizzy git://git.openembedded.org/openembedded-core-contrib jansa/dizzy-backports:jansa/dizzy-backports
  The following changes since commit 7bb182bdd130266100fc541fd09b82d09c51cd80:
    build-appliance-image: Update to dizzy head revision (2015-09-29 14:56:04 +0100)
  ...
  And finds correct 7 changes there

* $ git request-pull origin/dizzy git://git.openembedded.org/openembedded-core-contrib :jansa/dizzy-backports
  warn: No match for commit 6068d1c90336ddc1fb32856efd1d9ccf07733896 found at git://git.openembedded.org/openembedded-core-contrib
  warn: Are you sure you pushed 'jansa/dizzy-backports' there?
  The following changes since commit 97756472d3a69eaca95d105494ffea78c6b077e0:
    build-appliance-image: Update to dizzy head revision (2014-10-18 16:16:27 +0200)
  ...
  and lists all commits in _current_ branch since origin/dizzy, then it refuses
  to continue, because there are too many changes.

* 6068d1c90336ddc1fb32856efd1d9ccf07733896 is this commit in jansa/master-submitted
  branch so it really shouldn't be included in pull request from jansa/dizzy branch.
* git help says:
  <end>
    Commit to end at (defaults to HEAD). This names the commit at the tip of the history you are asking to be pulled.

    When the repository named by <url> has the commit at a tip of a ref that is different from the ref you have locally, you can use
    the <local>:<remote> syntax, to have its local name, a colon :, and its remote name.
* maybe the syntax got changes since git 2.1.0 when Saul added :${BRANCH}
* I haven't found how to respect ${COMMIT_ID in the new syntax

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/create-pull-request | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index a3744cc..dd66dfe 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -203,7 +203,7 @@ NEWER_GIT_VERSION=210
 if [ $GIT_VERSION -lt $NEWER_GIT_VERSION ]; then
 	git request-pull $RELATIVE_TO $REMOTE_URL $COMMIT_ID >> "$PM"
 else
-	git request-pull $RELATIVE_TO $REMOTE_URL :$BRANCH >> "$PM"
+	git request-pull $RELATIVE_TO $REMOTE_URL $BRANCH:$BRANCH >> "$PM"
 fi
 if [ $? -ne 0 ]; then
 	echo "ERROR: git request-pull reported an error"
-- 
2.6.3


