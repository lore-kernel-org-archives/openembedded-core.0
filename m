Return-Path: <net147@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id D272D62222
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 10:55:44 +0000 (UTC)
Received: by mail-pd0-f173.google.com with SMTP id v14so2007826pde.18
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 03:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=kfwI8j3LP7SeNgkBznJ5V8XhpDyPpM/uSP9NLQAcCco=;
	b=Vq+atT3Bddd00TWep/jr2hsMi9dCW08lI1lz7y1/pouDhDuHRAWga6jcqt6rfh4TCK
	SQTy1aEV/QMFZgkOfl/53BRG791/G5o46mzRld2XR+oeEhwvuOdLGfITy80og6wSf9G2
	1cldMMjBqbbQhs7XtUteJoV0Fq+sY884vAVxQtssBRgWqgjPBOUN3UoFF+PGE05GO7up
	B1XFXaKjBA8rbDjsUfLzdEmUirl9uVFhGdvffSSJ5Q/AWcvIXIhXGDWvuIDQaGKFq2Dm
	xi10MmsAZUNtQm1wzzioDHq4iqgeKn8DSpSYpsZ1w2WwDlbZXWkoXMlwpCmADzESdeKm
	UquQ==
X-Received: by 10.68.58.165 with SMTP id s5mr12303011pbq.220.1369997746053;
	Fri, 31 May 2013 03:55:46 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	vz8sm49281302pac.20.2013.05.31.03.55.43 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 May 2013 03:55:44 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2013 21:09:14 +1000
Message-Id: <1369998554-25085-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH] classes/buildhistory: record removals in buildhistory directory
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
X-List-Received-Date: Fri, 31 May 2013 10:55:45 -0000

"git add ." does not record files that were removed in the buildhistory
directory. Specify the -A flag to also record removals.

This was discovered by the following warning added in Git 1.8.3:
warning: You ran 'git add' with neither '-A (--all)' or '--ignore-removal',
whose behaviour will change in Git 2.0 with respect to paths you removed.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/buildhistory.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index d39408b..b12da4a 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -510,7 +510,7 @@ END
 		repostatus=`git status --porcelain | grep -v " metadata-revs$"`
 		HOSTNAME=`hostname 2>/dev/null || echo unknown`
 		if [ "$repostatus" != "" ] ; then
-			git add .
+			git add -A .
 			# porcelain output looks like "?? packages/foo/bar"
 			# Ensure we commit metadata-revs with the first commit
 			for entry in `echo "$repostatus" | awk '{print $2}' | awk -F/ '{print $1}' | sort | uniq` ; do
-- 
1.8.2.3


