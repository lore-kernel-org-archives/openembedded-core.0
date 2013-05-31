Return-Path: <net147@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6CA5A6A44D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 09:28:47 +0000 (UTC)
Received: by mail-pd0-f173.google.com with SMTP id v14so1902398pde.18
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 02:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=+Fh/nneTuYJdJWv37oqUSvboXqcL/aYGCQkd0BA3yck=;
	b=0B+1HwZ/DYF/kHQOnk26VVqatMuxijuxYHqyxxhXoMvWbOV+mc9Rd2dLVnOWQytGPt
	QKJxIeY8a1FEa4HJoelcCavEIW2Ov8NcGRrCVneN6qG5KfbJZFKpjd+KqjwxiCPRArPT
	nj4VJKEXMq2DWft9qc9aCg5HRuBrsgcUkgkcfN1BJ3l9FcW6JQt4dfv1vAvKnFyIhfuR
	xqObiuCtBt3gQ18p3kpY9jw3aiWp8/2VXR44BcFfhEvJCQ4dO3KmLKH6BlG6U/gdyfGr
	WJXDKXc6nctGU39DyFHE6gPd82f1bezkrGHxKtHTQAIEjNJhDUDPN0ZEKKwgPkwGHLbS
	oHbg==
X-Received: by 10.66.157.67 with SMTP id wk3mr12728566pab.88.1369992528836;
	Fri, 31 May 2013 02:28:48 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id vv6sm49017360pab.6.2013.05.31.02.28.46
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 May 2013 02:28:48 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2013 19:42:15 +1000
Message-Id: <1369993335-21441-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3
Subject: [PATCH] buildhistory: record removals with Git 2.0 and later
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
X-List-Received-Date: Fri, 31 May 2013 09:28:47 -0000

There is a behavior change with Git 2.0 where "git add ." will no
longer record removals by default unless -A (--all) is specified.
Change to "git add -A ." so removals are recorded with Git 2.0 and
later.

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
1.8.3


